//Технически, это очень сильно переделанная версия arousal.dm, предназначенная для боргов
//Это связано с тем, что борги не имеют собственных органов и нет возможности ссылаться на них
//А также из-за привязки к карбонам в целом

/mob/living/silicon/robot
	var/datum/reagents/silicon_fluid = new /datum/reagents //Хранилище жидкости для киборгов
	var/datum/reagent/current_fluid = /datum/reagent/consumable/semen/siliconcum //Текущая установленная жидкость
	var/fluid_amount = 25 //Количество вещества

/mob/living/silicon/robot/verb/toggle_liquit()
	set name = "Liquit"
	set desc = "Allows you to choose a liquid for the cyborg"
	set category = "Robot Commands"
	change_silicon_fluid()

/mob/living/silicon/robot/proc/change_silicon_fluid() //Смена жидкостей для киборга
	var/datum/reagent/new_fluid
	var/list/full_options = list()
	LAZYADD(full_options, GLOB.genital_fluids_list)
	new_fluid = tgui_input_list(src, "Silicon Liquid", "Liquid selection", full_options)
	if(new_fluid && iscyborg(src))
		var/mob/living/silicon/robot/R = src
		R.current_fluid = new_fluid
		refill_fluid(R)

/mob/living/silicon/robot/verb/silicon_climax_verb()
	set category = "Robot Commands"
	set name = "Climax"
	set desc = "Lets you choose a couple ways to ejaculate"
	mob_climax_silicon()

/mob/living/silicon/robot/verb/set_liquit_amount()
	set category = "Robot Commands"
	set name = "Set Liquit Amount"
	set desc = "You can change the amount of lubricant released"
	change_fluid_amount()

/mob/living/silicon/robot/proc/change_fluid_amount() //Изменение текущего количества вещества
	var/amount = input("Какое количество жидкости Вы хотите установить?") as num
	if(!amount || !isnum(amount))
		return
	if(amount > 300)
		to_chat(src, "<span class='danger'>Ваше хранилище не вмещает более 300 юнитов за раз!</span>")
		return
	if(amount < 5)
		to_chat(src, "<span class='danger'>Нельзя установить значение ниже 5!</span>")
		return
	if(iscyborg(src))
		var/mob/living/silicon/robot/R = src
		R.fluid_amount = amount

/mob/living/silicon/robot/proc/refill_fluid(mob/living/silicon/robot/R) //Восполнение жидкости киборга
	R.silicon_fluid.clear_reagents()
	var/fluid_type = R.current_fluid.type
	R.silicon_fluid.add_reagent(fluid_type, R.fluid_amount)

/mob/living/silicon/robot/proc/do_climax_silicon(mob/living/silicon/robot/R, atom/target, spill = TRUE, obj/item/organ/genital/receiver, anonymous = FALSE) //Кульминация
	if(!target || !R || !R.silicon_fluid)
		return
	refill_fluid(R)
	client?.plug13.send_emote(PLUG13_EMOTE_GROIN, PLUG13_STRENGTH_MAX, PLUG13_DURATION_ORGASM)
	var/turfing = isturf(target)
	if(spill)
		var/turf/location = get_turf(target)
		var/obj/effect/decal/cleanable/semen/siliconcum/S = locate(/obj/effect/decal/cleanable/semen/siliconcum) in location
		if (S)
			if(R.silicon_fluid.trans_to(S, R.silicon_fluid.total_volume))
				S.blood_DNA |= get_blood_dna_list()
				S.update_icon()
				return
		else
			var/obj/effect/decal/cleanable/semendrip/drip = (locate(/obj/effect/decal/cleanable/semendrip) in location) || new(location)
			if(R.silicon_fluid.trans_to(drip, R.silicon_fluid.total_volume))
				drip.blood_DNA |= get_blood_dna_list()
				drip.update_icon()
				if(drip.reagents.total_volume >= 10)
					S = new(location)
					drip.reagents.trans_to(S, drip.reagents.total_volume)
					S.blood_DNA |= drip.blood_DNA
					S.update_icon()
					qdel(drip)
				return
	if (!turfing)
		var/mob/living/carbon/human/cummed_on = target
		if(istype(cummed_on))
			var/datum/reagents/copy = new()
			R.silicon_fluid.copy_to(copy, R.silicon_fluid.total_volume)
			if(istype(receiver, /obj/item/organ/genital/vagina) || istype(receiver, /obj/item/organ/genital/anus))
				cummed_on.apply_status_effect(STATUS_EFFECT_DRIPPING_CUM, copy, get_blood_dna_list(), receiver)
		R.silicon_fluid.trans_to(target,R.silicon_fluid.total_volume, log = TRUE)

	if(!Process_Spacemove(turn(dir, 180)))
		newtonian_move(turn(dir, 180))

/mob/living/silicon/robot/proc/mob_climax_outside_silicon(mob/living/silicon/robot/R, mb_time = 30)
	var/datum/reagents/fluid_source = R.silicon_fluid
	if(!fluid_source)
		return
	if(mb_time)
		to_chat(src,"<span class='userlove'>Вы чувствуете, что вот-вот достигнете оргазма!</span>")
		if(!do_after(src, mb_time, target = src))
			return
	to_chat(src,"<span class='userlove'>Вы оргазмируете[isturf(loc) ? ", обливая пространство под собой" : ""]!</span>")
	do_climax_silicon(R, loc)

/mob/living/silicon/robot/proc/mob_climax_partner_silicon(mob/living/silicon/robot/R, mob/living/L, spillage = TRUE, mb_time = 30, obj/item/organ/genital/Lgen = null, forced = FALSE, anonymous = FALSE) //Кульминация со стоящим рядом партнёром
	var/datum/reagents/fluid_source = R.silicon_fluid
	if(!fluid_source)
		return
	if(mb_time)
		if(!do_after(src, mb_time, target = src) || !in_range(src, L))
			return
	SEND_SIGNAL(L, COMSIG_ADD_MOOD_EVENT, "orgasm", /datum/mood_event/orgasm)
	do_climax_silicon(R, spillage ? loc : L, spillage, Lgen, anonymous)

/mob/living/silicon/robot/proc/mob_fill_container_silicon(mob/living/silicon/robot/R, obj/item/reagent_containers/container, mb_time = 30) //Заполнение контейнера жидкостью
	var/datum/reagents/fluid_source = R.silicon_fluid
	if(!fluid_source)
		return
	if(mb_time)
		to_chat(src,"<span class='userlove'>Вы начали выделять смазку прямо над <b>[container]</b>. Ваш орган в готовности к этому...</span>")
		if(!do_after(src, mb_time, target = src) || !in_range(src, container))
			return
	to_chat(src,"<span class='userlove'>Синтетический орган стимулируется вашими же усилиями, вы пытаетесь наполнить <b>[container]</b>.</span>")
	message_admins("[ADMIN_LOOKUPFLW(src)] использует [ru_ego()] синтетический орган, чтобы наполнить <b>[container]</b> [R.current_fluid.name].")
	log_consent("[key_name(src)] использует [ru_ego()] синтетический орган, чтобы наполнить <b>[container]</b> [R.current_fluid.name].")
	do_climax_silicon(R, container, FALSE)

//Функции выбора партнёра и контейнера единственные остались практически без изменений, был изменён только путь для корректной работы
/mob/living/silicon/robot/proc/pick_partner_silicon(silent = FALSE)
	var/list/partners = list()
	if(pulling)
		partners += pulling
	if(pulledby)
		partners += pulledby
	for(var/mob/living/L in partners)
		if(!L.client || !L.mind)
			partners -= L
		if(iscarbon(L))
			var/mob/living/carbon/C = L
			if(!C.exposed_genitals.len && !C.is_groin_exposed() && !C.is_chest_exposed() && C.is_mouth_covered())
				partners -= C
	if(!partners.len)
		if(!silent)
			to_chat(src, "<span class='warning'>Вы не можете сделать это в одиночку.</span>")
		return
	var/mob/living/target = input(src, "С кем?", "Партнёр по Совокуплению", null) as null|anything in partners
	if(target && in_range(src, target))
		to_chat(src,"<span class='notice'>Ожидание согласия...</span>")
		var/consenting = input(target, "Вы хотите, чтобы [src] кончил совместно с вами?","Механика Кульминации","Нет") in list("Да","Нет")
		if(consenting == "Да")
			return target
		else
			message_admins("[ADMIN_LOOKUPFLW(src)] tried to climax with [target], but [target] did not consent.")
			log_consent("[key_name(src)] tried to climax with [target], but [target] did not consent.")

/mob/living/silicon/robot/proc/pick_climax_container_silicon(silent = FALSE)
	var/list/containers_list = list()
	for(var/obj/item/reagent_containers/C in held_items)
		if(C.is_open_container() || istype(C, /obj/item/reagent_containers/food/snacks))
			containers_list += C
	for(var/obj/item/reagent_containers/C in range(1, src))
		if((C.is_open_container() || istype(C, /obj/item/reagent_containers/food/snacks)) && CanReach(C))
			containers_list += C
	if(containers_list.len)
		var/obj/item/reagent_containers/SC = input(src, "В или на что? (Отмена, если никуда)", null)  as null|obj in containers_list
		if(SC && CanReach(SC))
			return SC
	else if(!silent)
		to_chat(src, "<span class='warning'>Вы не сможете сделать это без соответствующего контейнера.</span>")

/mob/living/silicon/robot/proc/mob_climax_over_silicon(mob/living/silicon/robot/R, mob/living/L, spillage = TRUE, mb_time = 30) //Кульминация на выбранную цель
	var/datum/reagents/fluid_source = R.silicon_fluid
	if(!fluid_source)
		return
	if(mb_time)
		to_chat(src,"<span class='userlove'>You're about to climax over [L]!</span>")
		to_chat(L,"<span class='userlove'>[src] is about to climax over you!</span>")
		if(!do_after(src, mb_time, target = src) || !in_range(src, L))
			return
	to_chat(src,"<span class='userlove'>You climax all over [L] using your synthetic organ!</span>")
	to_chat(L, "<span class='userlove'>[src] climaxes all over you using [ru_ego()] synthetic organ!</span>")
	do_climax_silicon(R, L, spillage)

/mob/living/silicon/robot/proc/mob_climax_silicon(forced_climax = FALSE, cause = "", var/mob/living/forced_partner = null, var/forced_spillage = TRUE, var/obj/item/organ/genital/forced_receiving_genital = null, anonymous = FALSE)
	set waitfor = FALSE
	var/mob/living/silicon/robot/R
	if (!iscyborg(src))
		return
	R = src
	if(mb_cd_timer > world.time)
		if(!forced_climax)
			to_chat(src, "<span class='warning'>Вы должны подождать [DisplayTimeText((mb_cd_timer - world.time), TRUE)] до того, как можете сделать это снова!</span>")
		return

	if(!(client?.prefs.arousable || !ckey))
		return

	if(stat == DEAD)
		if(!forced_climax)
			to_chat(src, "<span class='warning'>Ты не можешь сделать это, будучи уничтоженным!</span>")
		return
	if(forced_climax)
		log_message("was forced to climax by [cause]",LOG_EMOTE)
		var/mob/living/partner
		var/check_target
		if (forced_receiving_genital)
			if (pulling)
				if (isliving(pulling))
					check_target = pulling
			if (pulledby && !check_target)
				if(isliving(pulledby))
					check_target = pulledby
			if(check_target)
				if(iscarbon(check_target))
					var/mob/living/carbon/C = check_target
					if(C.exposed_genitals.len || C.is_groin_exposed() || C.is_chest_exposed())
						partner = C
				else
					partner = check_target
			if(forced_partner)
				if((forced_partner == "none") || (!istype(forced_partner)))
					partner = null
				else
					partner = forced_partner
			if(partner)
				mob_climax_partner_silicon(R, partner, forced_spillage, 0, forced_receiving_genital, forced_climax, anonymous)
		mob_climax_outside_silicon(R, mb_time = 0)
		mb_cd_timer = world.time + mb_cd_length
		return

	if(stat == UNCONSCIOUS)
		to_chat(src, "<span class='warning'>Вы не должны быть оглушены, чтобы сделать это!</span>")
		return

	var/choice = input(src, "Выбор Сексуальной Активности", "Сексуальная Активность:") as null|anything in list("Оргазмировать в одиночестве","Оргазмировать совместно с кем-то", "Оргазмировать на кого-то (CTRL+ЛКМ)", "Наполнить контейнер половыми жидкостями")
	if(!choice)
		return

	switch(choice)
		if("Оргазмировать в одиночестве")
			mob_climax_outside_silicon(R)
		if("Оргазмировать совместно с кем-то")
			var/obj/item/organ/genital/picked_target = null
			var/mob/living/partner = pick_partner_silicon()
			if(partner)
				picked_target = pick_receiving_organ(partner)
				var/spillage = input(src, "Would your fluids spill outside?", "Choose overflowing option", "Yes") as null|anything in list("Yes", "No")
				if(spillage && in_range(src, partner))
					mob_climax_partner_silicon(R, partner, spillage == "Yes" ? TRUE : FALSE, Lgen = picked_target)
		if("Наполнить контейнер половыми жидкостями")
			var/obj/item/reagent_containers/fluid_container = pick_climax_container_silicon()
			if (fluid_container)
				mob_fill_container_silicon(R, fluid_container)
		if("Оргазмировать на кого-то (CTRL+ЛКМ)")
			var/mob/living/partner = pick_partner_silicon()
			if(partner)
				mob_climax_over_silicon(R, partner, TRUE)

	mb_cd_timer = world.time + mb_cd_length
