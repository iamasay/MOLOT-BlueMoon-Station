/obj/item/mod/core
	name = "MOD core"
	desc = "A non-functional MOD core. Inform the admins if you see this."
	icon = 'icons/obj/clothing/modsuit/mod_construction.dmi'
	icon_state = "mod-core"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	var/obj/item/mod/control/mod

/obj/item/mod/core/Destroy()
	if(mod)
		uninstall()
	return ..()

/obj/item/mod/core/proc/install(obj/item/mod/control/mod_unit)
	mod = mod_unit
	mod.MOD_CORE = src
	forceMove(mod)
	mod.update_charge_alert()

/obj/item/mod/core/proc/uninstall()
	mod.MOD_CORE = null
	mod.update_charge_alert()
	mod = null

/obj/item/mod/core/standard
	name = "MOD standard core"
	icon_state = "mod-core-standard"
	desc = "Growing in the most lush, fertile areas of the planet Sprout, there is a crystal known as the Heartbloom. \
		These rare, organic piezoelectric crystals are of incredible cultural significance to the artist castes of the \
		Ethereals, owing to their appearance; which is exactly similar to that of an Ethereal's heart.\n\
		Which one you have in your suit is unclear, but either way, \
		it's been repurposed to be an internal power source for a Modular Outerwear Device."
	var/obj/item/stock_parts/cell/internal_cell

/obj/item/mod/core/standard/Destroy()
	QDEL_NULL(internal_cell)
	return ..()

/obj/item/mod/core/standard/install(obj/item/mod/control/mod_unit)
	. = ..()
	if(internal_cell)
		install_cell(internal_cell)
	RegisterSignal(mod, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(mod, COMSIG_ATOM_ATTACK_HAND, PROC_REF(on_attack_hand))
	RegisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION, PROC_REF(on_mod_interaction))
	RegisterSignal(mod, COMSIG_MOD_WEARER_SET, PROC_REF(on_wearer_set))
	if(mod.wearer)
		on_wearer_set(mod, mod.wearer)

/obj/item/mod/core/standard/uninstall()
	if(!QDELETED(internal_cell))
		internal_cell.forceMove(drop_location())
	UnregisterSignal(mod, list(
		COMSIG_ATOM_EXAMINE,
		COMSIG_ATOM_ATTACK_HAND,
		COMSIG_ATOM_ITEM_INTERACTION,
		COMSIG_MOD_WEARER_SET,
	))
	if(mod.wearer)
		on_wearer_unset(mod, mod.wearer)
	return ..()

/obj/item/mod/core/standard/proc/charge_source()
	return internal_cell

/obj/item/mod/core/standard/proc/charge_amount()
	var/obj/item/stock_parts/power_store/charge_source = charge_source()
	return charge_source?.charge || 0

/obj/item/mod/core/standard/proc/max_charge_amount(amount)
	var/obj/item/stock_parts/power_store/charge_source = charge_source()
	return charge_source?.maxcharge || 1

/obj/item/mod/core/standard/proc/add_charge(amount)
	var/obj/item/stock_parts/power_store/charge_source = charge_source()
	if(isnull(charge_source))
		return FALSE
	. = charge_source.give(amount)
	if(.)
		mod.update_charge_alert()
	return .

/obj/item/mod/core/standard/proc/subtract_charge(amount)
	var/obj/item/stock_parts/power_store/charge_source = charge_source()
	if(isnull(charge_source))
		return FALSE
	. = charge_source.use(amount, TRUE)
	if(.)
		mod.update_charge_alert()
	return .

/obj/item/mod/core/standard/proc/check_charge(amount)
	return charge_amount() >= amount

/obj/item/mod/core/standard/proc/get_charge_icon_state()
	if(isnull(charge_source()))
		return "missing"

	switch(round(charge_amount() / max_charge_amount(), 0.01))
		if(0.75 to INFINITY)
			return "high"
		if(0.5 to 0.75)
			return "mid"
		if(0.25 to 0.5)
			return "low"
		if(0.02 to 0.25)
			return "very_low"

	return "empty"

/obj/item/mod/core/standard/proc/get_chargebar_color()
	if(isnull(charge_source()))
		return "transparent"
	switch(round(charge_amount() / max_charge_amount(), 0.01))
		if(-INFINITY to 0.33)
			return "bad"
		if(0.33 to 0.66)
			return "average"
		if(0.66 to INFINITY)
			return "good"

/obj/item/mod/core/standard/proc/get_chargebar_string()
	if(isnull(charge_source()))
		return "Power Cell Missing"
	return ..()

/obj/item/mod/core/standard/proc/install_cell(new_cell)
	internal_cell = new_cell
	internal_cell.forceMove(src)
	mod.update_charge_alert()

/obj/item/mod/core/standard/proc/uninstall_cell()
	if(!internal_cell)
		return
	internal_cell = null
	mod.update_charge_alert()

/obj/item/mod/core/standard/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == internal_cell)
		uninstall_cell()

/obj/item/mod/core/standard/proc/on_examine(datum/source, mob/examiner, list/examine_text)
	SIGNAL_HANDLER

	if(!mod.open)
		return
	examine_text += internal_cell ? "You could remove the cell with an empty hand." : "You could use a cell on it to install one."

/obj/item/mod/core/standard/proc/on_attack_hand(datum/source, mob/living/user)
	SIGNAL_HANDLER

	if(mod.seconds_electrified && charge_amount() && mod.shock(user))
		return COMPONENT_CANCEL_ATTACK_CHAIN
	if(mod.open && mod.loc == user)
		INVOKE_ASYNC(src, PROC_REF(mod_uninstall_cell), user)
		return COMPONENT_CANCEL_ATTACK_CHAIN
	return NONE

/obj/item/mod/core/standard/proc/mod_uninstall_cell(mob/living/user)
	if(!internal_cell)
		mod.balloon_alert(user, "no cell!")
		return
	mod.balloon_alert(user, "removing cell...")
	if(!do_after(user, 1.5 SECONDS, target = mod))
		mod.balloon_alert(user, "interrupted!")
		return
	mod.balloon_alert(user, "cell removed")
	playsound(mod, 'sound/machines/click.ogg', 50, TRUE, SILENCED_SOUND_EXTRARANGE)
	var/obj/item/cell_to_move = internal_cell
	cell_to_move.forceMove(drop_location())
	user.put_in_hands(cell_to_move)

/obj/item/mod/core/standard/proc/on_mod_interaction(datum/source, mob/living/user, obj/item/thing)
	SIGNAL_HANDLER

	return item_interaction(user, thing)

/obj/item/mod/core/standard/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	return replace_cell(tool, user) ? ITEM_INTERACT_SUCCESS : NONE

/obj/item/mod/core/standard/proc/replace_cell(obj/item/attacking_item, mob/user)
	if(!istype(attacking_item, /obj/item/stock_parts/cell))
		return FALSE
	if(!mod.open)
		mod.balloon_alert(user, "cover closed!")
		playsound(mod, 'sound/machines/scanner/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	if(internal_cell)
		mod.balloon_alert(user, "already has cell!")
		playsound(mod, 'sound/machines/scanner/scanbuzz.ogg', 25, TRUE, SILENCED_SOUND_EXTRARANGE)
		return FALSE
	install_cell(attacking_item)
	mod.balloon_alert(user, "cell installed")
	playsound(mod, 'sound/machines/click.ogg', 50, TRUE, SILENCED_SOUND_EXTRARANGE)
	return TRUE

/obj/item/mod/core/standard/proc/on_wearer_set(datum/source, mob/user)
	SIGNAL_HANDLER

	RegisterSignal(mod.wearer, COMSIG_PROCESS_BORGCHARGER_OCCUPANT, PROC_REF(on_borg_charge))
	RegisterSignal(mod, COMSIG_MOD_WEARER_UNSET, PROC_REF(on_wearer_unset))

/obj/item/mod/core/standard/proc/on_wearer_unset(datum/source, mob/user)
	SIGNAL_HANDLER

	UnregisterSignal(mod.wearer, COMSIG_PROCESS_BORGCHARGER_OCCUPANT)
	UnregisterSignal(mod, COMSIG_MOD_WEARER_UNSET)

/obj/item/mod/core/standard/proc/on_borg_charge(datum/source, datum/callback/charge_cell, seconds_per_tick)
	SIGNAL_HANDLER

	var/obj/item/stock_parts/power_store/target_cell = charge_source()
	if(isnull(target_cell))
		return

	if(charge_cell.Invoke(target_cell, seconds_per_tick))
		mod.update_charge_alert()
