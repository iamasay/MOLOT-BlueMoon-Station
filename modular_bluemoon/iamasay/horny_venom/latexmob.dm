/datum/species/jelly/roundstartslime/living_latex
	name = "Unknown latex lifeform" //Мы не знаем что это такое, если мы знали что это такое, мы не знаем что это такое
	default_color = "2c2c2c"
	say_mod = "states"
	coldmod = 1.5 //застывает и становится хрупким
	heatmod = 1.2 //плавится и теряет форму
	burnmod = 1.2
	brutemod = 0.5 //Латекс мягкий и гибкий и ему легче переносить удары твердыми предметами

// ABILITIES SHOP START
//----------------------------------------------------------------------------------

/datum/evolution_store
	var/name = "Evolution store"
	var/datum/antagonist/living_latex/living_latex

/datum/evolution_store/New(my_living_latex)
	. = ..()
	living_latex = my_living_latex

/datum/evolution_store/Destroy()
	living_latex = null
	. = ..()

/datum/evolution_store/ui_state(mob/user)
	return GLOB.always_state

/datum/evolution_store/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CellularEmporium", name)
		ui.open()

/datum/evolution_store/ui_data(mob/user)


//	var/can_readapt = changeling.can_respec
//	var/genetic_points_remaining = changeling.geneticpoints
//	var/absorbed_dna_count = changeling.absorbedcount
//	var/true_absorbs = changeling.trueabsorbs

//	data["can_readapt"] = can_readapt
//	data["genetic_points_remaining"] = genetic_points_remaining
//	data["absorbed_dna_count"] = absorbed_dna_count

	// var/list/abilities = list()

	// for(var/path in changeling.all_powers)
	// 	var/datum/action/changeling/ability = path

	// 	var/dna_cost = initial(ability.dna_cost)
	// 	if(dna_cost <= 0)
	// 		continue

	// 	var/list/AL = list()
	// 	AL["name"] = initial(ability.name)
	// 	AL["desc"] = initial(ability.desc)
	// 	AL["helptext"] = initial(ability.helptext)
	// 	AL["owned"] = changeling.has_sting(ability)
	// 	var/req_dna = initial(ability.req_dna)
	// 	var/req_absorbs = initial(ability.req_absorbs)
	// 	AL["dna_cost"] = dna_cost
	// 	AL["can_purchase"] = ((req_absorbs <= true_absorbs) && (req_dna <= absorbed_dna_count) && (dna_cost <= genetic_points_remaining))

	// 	abilities += list(AL)

	// data["abilities"] = abilities

	// return data

/datum/evolution_store/ui_act(action, params)
	if(..())
		return

	// switch(action)
	// 	if("readapt")
	// 		if(changeling.can_respec)
	// 			changeling.readapt()
	// 	if("evolve")
	// 		var/sting_name = params["name"]
	// 		changeling.purchase_power(sting_name)

/datum/action/innate/evolution_store
	name = "Evolution Store"
	icon_icon = 'icons/obj/drinks.dmi'
	button_icon_state = "changelingsting"
	background_icon_state = "bg_changeling"
	var/datum/evolution_store/evolution

/datum/action/innate/evolution_store/New()
	. = ..()
	var/datum/antagonist/living_latex/living_latex = usr.mind.antag_datums
	evolution = living_latex.evolution_store
	if(!evolution)
		CRASH("evolution_store action created with non store")

/datum/action/innate/evolution_store/Activate()
	evolution.ui_interact(usr)
// ------------------------------------------------------------------------------
//END OF ABILITIES SHOT

/datum/antagonist/living_latex
	name = "Living latex"
	show_to_ghosts = TRUE
	antag_moodlet = /datum/mood_event/focused
	var/current_controller
	var/datum/species/old_host_spec
	var/datum/evolution_store
	var/list/available_abilities = list(
		new /datum/action/cooldown/latexmob/venomAction,
		new /datum/action/cooldown/latexmob/takeControl
	)

/datum/antagonist/living_latex/proc/grant_abilities(user)
	for(var/datum/action/action in available_abilities)
		action.Grant(user)

/datum/antagonist/living_latex/Destroy()
	. = ..()
	QDEL_NULL(evolution_store)

/obj/effect/mob_spawn/horny_venom
	name = "Living latex"
	mob_name = "Living latex"
	mob_type = 	/mob/living/simple_animal/latexmob
	death = FALSE
	roundstart = FALSE
	random = FALSE
	uses = 1
	category = "special"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	assignedrole = "Living latex"
	flavour_text = "Вы - живой латекс. Пришелец, возможно результат чьих-то экспериментов. Найдите себе носителя и эволюционируйте."
	important_info = "НЕ ГРИФЕРИТЬ, ИНАЧЕ ВАС ЗАБАНЯТ!!\n Ваша роль направленна впервую очерень на ролевое взаимодействие. Уважайте других игроков."

/obj/effect/temp_visual/latexmob
	icon = 'modular_bluemoon/iamasay/horny_venom/icons/sybm_icons.dmi'
	duration = 12

/obj/effect/temp_visual/latexmob/venom_in
	icon_state = "synt_on"

/obj/effect/temp_visual/latexmob/venom_out
	icon_state = "synt_off"

/obj/effect/mob_spawn/horny_venom/attack_ghost(mob/user, latejoinercalling)
	if(GLOB.master_mode == "Extended")
		. = ..()
	else
		return to_chat(user, "<span class='warning'>Игра за ЕРП-антагонистов допускается лишь в Режим Extended!</span>")

/mob/living/simple_animal/latexmob
	name = "Сгусток латекса"
	icon = 'icons/mob/mob.dmi'
	icon_state = "puddle"
	color = "#0A0707"
	desc = "На первый взгляд, это обычный черный слайм, однако он выглядит в разы плотнее и быстрее."

/obj/item/organ/latexOrgan
	name = "strange black organ"
	//icon =
	zone = BODY_ZONE_HEAD
	organ_flags = ORGAN_NO_SPOIL
	var/mob/living/simple_animal/latexmob/venom/ObserverBackseat

/mob/living/simple_animal/latexmob/Initialize(mapload, new_colour, new_is_adult)
	. = ..()
	src.mind = new
	color = "#3f3f3f"
	var/datum/antagonist/living_latex/living_latex = src.mind.antag_datums += new /datum/antagonist/living_latex
	var/datum/evolution_store/ev_store = new
	living_latex.evolution_store = ev_store
	living_latex.available_abilities += new /datum/action/innate/evolution_store
	living_latex.grant_abilities(src)

/mob/living/simple_animal/latexmob/ferral
	name = "Маленькое латексное существо"
	desc = "Маленькое существо, с блестящей черной кожей, чем-то напоминающей слайма. Оно с голодными глазами смотрит на вас."
	icon = 'modular_bluemoon/iamasay/horny_venom/icons/latexmob.dmi'
	icon_state = "ferral"
	health = 150
	maxHealth = 150
	speak = list() //Добавить сюда галлком хотя бы
	var/current_stage //1,2,3
	var/mergingDelay = 5 //Скорость поглощения носителя
	var/need_to_next_stade //200u, 500u, 1000u of semen/femcum. Yeeah )O)

//Способности
/datum/action/cooldown/latexmob
	//var/mob/living/simple_animal/latexmob/target = src.owner
	var/stage_required
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/venomAction
	stage_required = 1
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."

/datum/action/cooldown/latexmob/venomAction/Activate()
	var/mob/living/carbon/host = owner.loc
	if(!istype(host, /mob/living/carbon))
		var/list/choices = list()
		for(var/mob/living/carbon/C in oview(1,owner))
			choices += C
			to_chat(owner, "[C]")
		var/choice = show_radial_menu(owner, owner, choices = choices)
		if(choice)
			var/datum/antagonist/living_latex/L = owner.mind.antag_datums
		//	do_after(owner, 3 SECONDS)
			L.merging(choice)
			return
	else
		var/turf/targetTurf = host.loc
		var/datum/antagonist/living_latex/living_latex = owner.mind.antag_datums
		var/datum/species/old_species = living_latex.old_host_spec
		host.set_species(old_species)
		new /obj/effect/temp_visual/latexmob/venom_out(targetTurf)
		targetTurf.contents += new /mob/living/simple_animal/latexmob
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = locate()
		if(OrganToRemove)
			OrganToRemove.Remove()
		for(var/mob/living/simple_animal/latexmob/MobForTransfer in oview(1,host))
			owner.transfer_ckey(MobForTransfer)
			return

/datum/action/cooldown/latexmob/takeControl
	//if(istype(target.loc, /mob/living/carbon))
	stage_required = 1
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	var/datum/antagonist/living_latex/venom = owner.mind.antag_datums
	var/datum/species/old_species
	if(venom.current_controller == "OWNER" || !venom.current_controller)
		var/mob/living/carbon/body = owner.loc
		if(!body.ckey)
			body.mind = owner.mind
			body.ckey = owner.ckey
			venom.current_controller = "VENOM"
			var/datum/antagonist/living_latex/latex = body.mind.antag_datums
			
			old_species= body.dna.species
			var/datum/species/jelly/roundstartslime/living_latex/new_species = new
			new_species.copy_properties_from(old_species)
			venom.old_host_spec = old_species
			body.set_species(new_species)
			latex.grant_abilities(body)
		else
			var/datum/mind/CurrentObserverMind = owner.mind

			body.mind = owner.mind
			owner.mind = CurrentObserverMind

			var/BodyOwnerKey = body.ckey

			body.ckey = owner.ckey
			owner.ckey = BodyOwnerKey

			venom.current_controller = "VENOM"
			old_species = body.dna.species
			var/datum/species/jelly/roundstartslime/living_latex/new_species = new
			var/datum/antagonist/living_latex/latex = body.mind.antag_datums	
			new_species.copy_properties_from(old_species)
			venom.old_host_spec = old_species
			body.set_species(new_species)
			latex.grant_abilities(body)
	else
		var/obj/item/organ/latexOrgan/organ = locate()
		var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
		var/datum/mind/ObserverMind = backseat.mind
		if(backseat)
			owner.mind = ObserverMind
			backseat.mind = owner.mind

			var/ObserverKey = backseat.ckey
			var/BodyOwnerKey = owner.ckey

			backseat.ckey = BodyOwnerKey
			owner.ckey = ObserverKey

			venom.current_controller = "OWNER"
			var/datum/antagonist/living_latex/latex2 = backseat.mind.antag_datums
			latex2.grant_abilities(backseat)

/datum/antagonist/living_latex/proc/merging(mob/living/carbon/T)
	var/mob/living/old_body = usr
	var/obj/item/organ/latexOrgan/O = new /obj/item/organ/latexOrgan
	new /obj/effect/temp_visual/latexmob/venom_in(T.loc)
	O.Insert(T)
	O.ObserverBackseat = new /mob/living/simple_animal/latexmob/venom
	O.ObserverBackseat.loc = T
	usr.transfer_ckey(O.ObserverBackseat)
	qdel(old_body)

///obj/item/organ/latexOrgan/Initialize(mapload)
//	. = ..()
//	venomUser_backseat = new /mob/living/simple_animal/latexmob/venom
//	hostUser_backseat = new /mob/living/simple_animal/latexmob/venom

//Стадия 1

/mob/living/simple_animal/latexmob/stage1
	name = ""

/mob/living/simple_animal/latexmob/venom
	name = "split personality"
	real_name = "unknown conscience"
	var/mob/living/carbon/body
	var/obj/item/organ/latexOrgan/organ



	//if one of the two ghosts, the other one stays permanently
//	if(!body.client && trauma.initialized)
//		trauma.switch_personalities()
//		qdel(trauma)

/mob/living/simple_animal/latexmob/venom/Login()
	..()
	to_chat(src, "<span class='notice'>As a split personality, you cannot do anything but observe. However, you will eventually gain control of your body, switching places with the current personality.</span>")
	to_chat(src, "<span class='warning'><b>Do not commit suicide or put the body in a deadly position. Behave like you care about it as much as the owner.</b></span>")

/mob/living/simple_animal/latexmob/venom/say(message, bubble_type, var/list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(length(message) && body)
		to_chat(body, "You hear a strange voice in your head... \"[message]\"")
	return

/mob/living/simple_animal/latexmob/venom/emote(act, m_type = null, message = null, intentional = FALSE)
	return
