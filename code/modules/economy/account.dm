#define DUMPTIME 3000
#define STATION_START_CASH 75000
#define STATION_CREATION_DATE "1 April, 2555"
#define STATION_CREATION_TIME "11:22:33"
#define STATION_SOURCE_TERMINAL "Sug Ma Dig IntraNet Terminal #420"
GLOBAL_DATUM(station_account, /datum/bank_account)
GLOBAL_LIST_EMPTY(all_money_accounts)
GLOBAL_VAR_INIT(num_financial_terminals, 1)
GLOBAL_VAR_INIT(next_account_number, 0)

/datum/bank_account
	var/account_holder = "Rusty Venture"
	var/account_balance = 0
	var/datum/job/account_job
	var/list/bank_cards = list()
	var/add_to_accounts = TRUE
	var/transferable = TRUE
	var/account_id
	var/being_dumped = FALSE //pink levels are rising
	var/withdrawDelay = 0
	var/datum/bounty/civilian_bounty
	var/list/datum/bounty/bounties
	COOLDOWN_DECLARE(bounty_timer)
	///List with a transaction history for NT pay app
	var/list/transaction_history = list()

/datum/bank_account/New(newname, job)
	if(add_to_accounts)
		if(!SSeconomy)
			log_world("Wack")
		SSeconomy.bank_accounts += src
	account_holder = newname
	account_job = job
	account_id = rand(111111,999999)
	GLOB.all_money_accounts = SSeconomy.bank_accounts.Copy()

/datum/bank_account/Destroy()
	if(add_to_accounts)
		SSeconomy.bank_accounts -= src
	return ..()

/**
 * Proc guarantees the account_id possesses a unique number.
 * If it doesn't, it tries to find a unique alternative.
 * It then adds it to the `SSeconomy.bank_accounts_by_id` global list.
 */
/datum/bank_account/proc/setup_unique_account_id()
	if (!add_to_accounts)
		return
	if(account_id && !SSeconomy.bank_accounts_by_id["[account_id]"])
		SSeconomy.bank_accounts_by_id["[account_id]"] = src
		return //Already unique
	for(var/i in 1 to 1000)
		account_id = rand(111111, 999999)
		if(!SSeconomy.bank_accounts_by_id["[account_id]"])
			break
	if(SSeconomy.bank_accounts_by_id["[account_id]"])
		stack_trace("Unable to find a unique account ID, substituting currently existing account of id [account_id].")
	SSeconomy.bank_accounts_by_id["[account_id]"] = src

/datum/bank_account/vv_edit_var(var_name, var_value) // just so you don't have to do it manually
	var/old_id = account_id
	var/old_balance = account_balance
	. = ..()
	switch(var_name)
		if(NAMEOF(src, account_id))
			if(add_to_accounts)
				SSeconomy.bank_accounts_by_id -= "[old_id]"
				setup_unique_account_id()
		if(NAMEOF(src, add_to_accounts))
			if(add_to_accounts)
				setup_unique_account_id()
			else
				SSeconomy.bank_accounts_by_id -= "[account_id]"
		if(NAMEOF(src, account_balance))
			add_log_to_history(var_value - old_balance, "Nanotrasen: Moderator Action")

/datum/bank_account/proc/dumpeet()
	being_dumped = TRUE
	withdrawDelay = world.time + DUMPTIME

/**
 * Performs the math component of adjusting a bank account balance.
 * Arguments:
 * * amount - the quantity of credits that will be written off if the value is negative, or added if it is positive.
 */
/datum/bank_account/proc/_adjust_money(amount)
	account_balance += amount
	if(account_balance < 0)
		account_balance = 0

/datum/bank_account/proc/adjust_money(amount, reason)
	if((amount < 0 && has_money(-amount)) || amount > 0)
		_adjust_money(amount)
		if(reason)
			add_log_to_history(amount, reason)
		return TRUE
	return FALSE

/datum/bank_account/proc/has_money(amt)
	return account_balance >= amt

/datum/bank_account/proc/transfer_money(datum/bank_account/from, amount)
	if(!from.transferable || !from.has_money(amount))
		return FALSE
	adjust_money(amount)
	from.adjust_money(-amount)
	return TRUE

/datum/bank_account/proc/payday(amount_of_paychecks, free = FALSE)
	if(!account_job)
		return
	var/money_to_transfer = round(account_job.paycheck * amount_of_paychecks)
	if(amount_of_paychecks == 1)
		money_to_transfer = clamp(money_to_transfer, 0, PAYCHECK_EASY) //We want to limit single, passive paychecks to regular crew income.
	if(free)
		adjust_money(money_to_transfer, "Nanotrasen: Shift Payment")
		SSblackbox.record_feedback("amount", "free_income", money_to_transfer)
		SSeconomy.station_target += money_to_transfer
		log_econ("[money_to_transfer] кредит[get_num_string(money_to_transfer)] выдано на аккаунт [src.account_holder] из дохода.")
		return TRUE
	else
		var/datum/bank_account/department_account = SSeconomy.get_dep_account(account_job.paycheck_department)
		if(department_account)
			if(!transfer_money(department_account, money_to_transfer))
				bank_card_talk("ERROR: Зарплата отменена. Недостаточно средстве на счету отдела.")
				return FALSE
			else
				bank_card_talk("Зарплата выдана, текущий баланс: [account_balance] кр.")
				return TRUE
	bank_card_talk("ERROR: Зарплата не выдана. Невозможно связаться с аккаунтом отдела.")
	return FALSE

/datum/bank_account/proc/bank_card_talk(message, force)
	if(!message || !bank_cards.len)
		return
	for(var/obj/A in bank_cards)
		var/icon_source = A
		/*
		if(istype(A, /obj/item/card/id))
			var/obj/item/card/id/id_card = A
			if(id_card.uses_overlays)
				icon_source = id_card.get_cached_flat_icon()
		*/
		var/mob/card_holder = recursive_loc_check(A, /mob)
		if(ismob(card_holder)) //If on a mob
			if(!card_holder.client || (!(card_holder.client.prefs.chat_toggles & CHAT_BANKCARD) && !force))
				return

			card_holder.playsound_local(get_turf(card_holder), 'sound/machines/twobeep.ogg', 50, TRUE)
			if(card_holder.can_hear())
				to_chat(card_holder, "[icon2html(icon_source, card_holder)] <span class='notice'>[message]</span>")
		else if(isturf(A.loc)) //If on the ground
			for(var/mob/M in hearers(1,get_turf(A)))
				if(M.client && !(M.client.prefs.chat_toggles & CHAT_BANKCARD) && !force)
					return
				playsound(A, 'sound/machines/twobeep.ogg', 50, TRUE)
				A.audible_message("[icon2html(icon_source, hearers(A))] <span class='notice'>[message]</span>", null, 1)
				break
		else
			for(var/mob/M in A.loc) //If inside a container with other mobs (e.g. locker)
				if(!M.client || (!(M.client.prefs.chat_toggles & CHAT_BANKCARD) && !force))
					return
				M.playsound_local(get_turf(M), 'sound/machines/twobeep.ogg', 50, TRUE)
				if(M.can_hear())
					to_chat(M, "[icon2html(icon_source, M)] <span class='notice'>[message]</span>")

/**
  * Returns a string with the civilian bounty's description on it.
  */
/datum/bank_account/proc/bounty_text()
	if(!civilian_bounty)
		return FALSE
	if(istype(civilian_bounty, /datum/bounty/item))
		var/datum/bounty/item/item = civilian_bounty
		return item.description
	if(istype(civilian_bounty, /datum/bounty/reagent))
		var/datum/bounty/reagent/chemical = civilian_bounty
		return chemical.description

/**
  * Returns the required item count, or required chemical units required to submit a bounty.
  */
/datum/bank_account/proc/bounty_num()
	if(!civilian_bounty)
		return FALSE
	if(istype(civilian_bounty, /datum/bounty/item))
		var/datum/bounty/item/item = civilian_bounty
		return "[item.shipped_count]/[item.required_count]"
	if(istype(civilian_bounty, /datum/bounty/reagent))
		var/datum/bounty/reagent/chemical = civilian_bounty
		return "[chemical.shipped_volume]/[chemical.required_volume] u"

/**
  * Produces the value of the account's civilian bounty reward, if able.
  */
/datum/bank_account/proc/bounty_value()
	if(!civilian_bounty)
		return FALSE
	return civilian_bounty.reward

/**
  * Performs house-cleaning on variables when a civilian bounty is replaced, or, when a bounty is claimed.
  */
/datum/bank_account/proc/reset_bounty()
	civilian_bounty = null
	COOLDOWN_RESET(src, bounty_timer)

/datum/bank_account/department
	account_holder = "Guild Credit Agency"
	var/department_id = "REPLACE_ME"
	add_to_accounts = FALSE

/datum/bank_account/department/New(dep_id, budget)
	department_id = dep_id
	account_balance = budget
	account_holder = SSeconomy.department_accounts[dep_id]
	SSeconomy.generated_accounts += src

/datum/bank_account/remote // Bank account not belonging to the local station
	add_to_accounts = FALSE

/datum/bank_account/remote/non_transferable
	transferable = FALSE

/**
 * Add log to transactions history. Deletes the oldest log when the history has more than 20 entries.
 * Main format: Category: Reason in Reason. Example: Vending: Machinery Using
 * Arguments:
 * * adjusted_money - How much was added, negative values removing cash.
 * * reason - The reason of interact with balance, for example, "Bought chips" or "Payday".
 */
/datum/bank_account/proc/add_log_to_history(adjusted_money, reason)
	if(transaction_history.len >= 20)
		transaction_history.Cut(1,2)

	transaction_history += list(list(
		"adjusted_money" = adjusted_money,
		"reason" = reason,
	))



 // Charge is for transferring money from an account to another. The destination account can possibly not exist (Magical money sink)
/datum/bank_account/proc/charge(transaction_amount = 0, datum/bank_account/dest, transaction_purpose, terminal_name = "", dest_name = "UNKNOWN", dest_purpose, dest_target_name)
	if(transferable)
		to_chat(usr, "<span class='warning'>Unable to access source account: account not transferable.</span>")
		return FALSE

	if(transaction_amount <= account_balance)
		//transfer the money
		account_balance -= transaction_amount
		makeTransactionLog(transaction_amount, transaction_purpose, terminal_name, dest_name)
		if(dest)
			dest.account_balance += transaction_amount
			dest.makeTransactionLog(transaction_amount,
			dest_purpose ? dest_purpose : transaction_purpose, terminal_name, dest_target_name ? dest_target_name : dest_name, FALSE)
		return TRUE
	else
		to_chat(usr, "<span class='warning'>Insufficient funds in account.</span>")
		return FALSE

// Seperated from charge so they can reuse the code and also because there's many instances where a log will be made without actually making a transaction
/datum/bank_account/proc/makeTransactionLog(transaction_amount = 0, transaction_purpose, terminal_name = "", dest_name = "UNKNOWN", charging = TRUE, date = GLOB.current_date_string, time = "")
	var/datum/transaction/T = new()
	T.target_name = dest_name
	T.purpose = transaction_purpose
	if(!charging || transaction_amount == 0)
		T.amount = "[transaction_amount]"
	else
		T.amount = "([transaction_amount])"

	T.source_terminal = terminal_name
	T.date = date
	if(time == "")
		T.time = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)
	else
		T.time = time
	transaction_history.Add(T)

//the current ingame time (hh:mm:ss) can be obtained by calling:
//STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)("hh:mm:ss")

/proc/create_account(var/new_account_holder = "Default user", var/starting_funds = 0, var/obj/machinery/computer/account_database/source_db)

	//create a new account
	var/datum/bank_account/M = new()
	M.account_holder = new_account_holder
	M.account_balance = starting_funds

	//create an entry in the account transaction log for when it was created
	var/datum/transaction/T = new()
	T.target_name = new_account_holder
	T.purpose = "Account creation"
	T.amount = starting_funds
	if(!source_db)
		//set a random date, time and location some time over the past few decades
		T.date = "[num2text(rand(1,31))] [pick(GLOB.month_names)], [rand(GLOB.year_integer - 20,GLOB.year_integer - 1)]"
		T.time = "[rand(0,23)]:[rand(0,59)]:[rand(0,59)]"
		T.source_terminal = "NTGalaxyNet Terminal #[rand(111,1111)]"

		M.account_id = rand(111111, 999999)
	else
		T.date = GLOB.current_date_string
		T.time = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)
		T.source_terminal = source_db.machine_id

		M.account_id = GLOB.next_account_number
		GLOB.next_account_number += rand(1,25)

		//create a sealed package containing the account details
		var/obj/item/small_delivery/P = new /obj/item/small_delivery(source_db.loc)

		var/obj/item/paper/R = new /obj/item/paper(P)
		playsound(source_db.loc, 'sound/goonstation/machines/printer_thermal.ogg', 50, 1)
		P.contents = R
		R.name = "Account information: [M.account_holder]"

		var/overseer = "Unknown"
		var/datum/ui_login/L = source_db.ui_login_get()
		if(L.id)
			overseer = L.id.registered_name
		R.default_raw_text = {"<b>Account details (confidential)</b><br><hr><br>
			<i>Account holder:</i> [M.account_holder]<br>
			<i>Account number:</i> [M.account_id]<br>
			<i>Starting balance:</i> $[M.account_balance]<br>
			<i>Date and time:</i> [STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)], [GLOB.current_date_string]<br><br>
			<i>Creation terminal ID:</i> [source_db.machine_id]<br>
			<i>Authorised NT officer overseeing creation:</i> [overseer]<br>"}

		//stamp the paper
		var/image/stampoverlay = image('icons/obj/bureaucracy.dmi')
		stampoverlay.icon_state = "paper_stamp-cent"
		if(!R.stamp_cache)
			R.stamp_cache = new
		R.stamp_cache += /obj/item/stamp
		R.overlays += stampoverlay
		R.stamp_cache += "<HR><i>This paper has been stamped by the Accounts Database.</i>"

	//add the account
	M.transaction_history.Add(T)
	GLOB.all_money_accounts.Add(M)

	return M

/proc/create_station_account()
	if(!GLOB.station_account)
		GLOB.next_account_number = rand(111111, 999999)

		GLOB.station_account = new()
		GLOB.station_account.account_holder = "[station_name()] Station Account"
		GLOB.station_account.account_id = rand(111111, 999999)
		GLOB.station_account.account_balance = STATION_START_CASH

		//create an entry in the account transaction log for when it was created
		GLOB.station_account.makeTransactionLog(STATION_START_CASH, "Account Creation", STATION_SOURCE_TERMINAL, GLOB.station_account.account_holder, FALSE,
		STATION_CREATION_DATE, STATION_CREATION_TIME)

		//add the account
		GLOB.all_money_accounts.Add(GLOB.station_account)

/datum/transaction
	var/target_name = ""
	var/purpose = ""
	var/amount = 0
	var/date = ""
	var/time = ""
	var/source_terminal = ""

#undef DUMPTIME
