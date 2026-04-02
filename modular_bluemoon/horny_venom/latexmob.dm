/datum/species/jelly/roundstartslime/living_latex
	name = "Unknown latex lifeform" //Мы не знаем что это такое, если мы знали что это такое, мы не знаем что это такое
	default_color = "2c2c2c"
	say_mod = "states"
	coldmod = 1.5 //застывает и становится хрупким
	heatmod = 1.2 //плавится и теряет форму
	burnmod = 1.2
	brutemod = 0.5 //Латекс мягкий и гибкий и ему легче переносить удары твердыми предметами

/datum/antagonist/living_latex
	name = "Living latex"
	show_to_ghosts = TRUE
	antag_moodlet = /datum/mood_event/focused
	var/current_controller
	var/alert_has_been_viewed = FALSE
	var/stage = 0
	var/evolve_points = 0
	var/mergingDelay = DEBUG_MERGING_DELAY
	var/datum/species/old_host_spec
	var/datum/species/jelly/roundstartslime/living_latex/self_species
	var/datum/evolution_store
	var/list/available_abilities = list(
		new /datum/action/cooldown/latexmob/venomAction,
		new /datum/action/cooldown/latexmob/takeControl
	)
	var/list/avaible_reagents = list(
		/datum/reagent/medicine/adminordrazine,
		/datum/reagent/medicine/atropine
	)
	var/list/all_abilities = list(
		new /datum/action/cooldown/latexmob/takeControl,
		new /datum/action/cooldown/latexmob/venomAction,
		new /datum/action/cooldown/latexmob/ferral_form,
		new /datum/action/cooldown/latexmob/medscan,
		new /datum/action/cooldown/latexmob/heal,
		new /datum/action/cooldown/latexmob/stasis,
		new /datum/action/cooldown/latexmob/leak_out,
		new /datum/action/cooldown/latexmob/human_form
	)

/datum/antagonist/living_latex/process()
	. = ..()
	if(evolve_points < 1)
		evolve_points += POINTS_REGEN_DEBUG

/datum/antagonist/living_latex/on_gain()
	. = ..()
	var/datum/evolution_store/ev_store = new(src)
	self_species = new /datum/species/jelly/roundstartslime/living_latex
	evolution_store = ev_store
	available_abilities += new /datum/action/innate/evolution_store
	set_name(usr)
	grant_abilities(usr)

/datum/antagonist/living_latex/on_body_transfer(mob/living/old_body, mob/living/new_body)
	. = ..()
	for(var/datum/action/cooldown/latexmob/all_powers as anything in available_abilities)
		all_powers.Remove(old_body)
		all_powers.Grant(new_body)

/datum/antagonist/living_latex/proc/set_name(var/mob/living/user)
	user.name = tgui_input_text(user, "Введите псевдоним", "Set name", "Сгусток латекса", 30)
	if(!user.name)
		user.name = "Сгусток латекса"

/datum/antagonist/living_latex/proc/grant_abilities(user)
	for(var/datum/action/action in available_abilities)
		action.Grant(user)

/datum/antagonist/living_latex/proc/search_ability_path(ability_name)
	var/datum/action/cooldown/latexmob/ability_to_grant
	for(var/path in src.all_abilities)
		var/datum/action/cooldown/latexmob/ability = path
		if(ability.name == ability_name)
			ability_to_grant = ability
			src.add_new_ability(ability_to_grant, src)
	return

/datum/antagonist/living_latex/proc/add_new_ability(var/datum/action/cooldown/latexmob/ability_to_grant)
	if(locate(ability_to_grant) in available_abilities)
		to_chat(usr, "<span_class='warning'>У вас уже есть эта способность!</span>")
		return
	if(ability_to_grant.stage_required <= stage && evolve_points == 1)
		available_abilities += ability_to_grant
		evolve_points = 0
		grant_abilities(usr)
	else
		to_chat(usr, "<span_class='warning'>У вас не хватает стадии или очков эволюции, чтобы приобрести данную способность!</span>")

/datum/antagonist/living_latex/proc/inject_reagent(reagent_name)
	for(var/path in src.avaible_reagents)
		var/datum/reagent/reagent = path
		var/datum/reagent/R = new path
		if(R.name == reagent_name)
			usr.reagents.add_reagent(reagent, 5)
			evolve_points -= 0.1
		qdel(R)

/datum/antagonist/living_latex/proc/upgrade_stage(NewStage, user)
	stage = NewStage
	for(var/datum/action/cooldown/latexmob/venomAction/action in all_abilities)
		if(action.stage_required == stage)
			action.Grant(user)

/datum/antagonist/living_latex/Destroy()
	. = ..()
	QDEL_NULL(evolution_store)

/datum/antagonist/living_latex/proc/merging(mob/living/carbon/T)
	var/mob/living/old_body = usr
	var/obj/item/organ/latexOrgan/O = new /obj/item/organ/latexOrgan
	new /obj/effect/temp_visual/latexmob/venom_in(T.loc)
	O.Insert(T)
	O.ObserverBackseat = new /mob/living/simple_animal/latexmob/venom(T)
	old_body.mind.transfer_to(O.ObserverBackseat)
	grant_abilities(O.ObserverBackseat)
	qdel(old_body)

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
	icon = 'modular_bluemoon/horny_venom/icons/sybm_icons.dmi'
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
	reagents = new /datum/reagents

/mob/living/simple_animal/latexmob/Life(seconds, times_fired)
	. = ..()
	if(!src.mind)
		//добавить сюда логгирование в рантаймы
		return
	var/datum/antagonist/living_latex/my_antag_datum = locate(/datum/antagonist/living_latex) in src.mind.antag_datums
	my_antag_datum?.process()

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

/mob/living/simple_animal/latexmob/ferral
	name = "Маленькое латексное существо"
	desc = "Маленькое существо, с блестящей черной кожей, чем-то напоминающей слайма. Оно с голодными глазами смотрит на вас."
	icon = 'modular_bluemoon/horny_venom/icons/latexmob.dmi'
	icon_state = "ferral"
	health = 150
	maxHealth = 150
	speak = list() //Добавить сюда галлком хотя бы
	var/current_stage //1,2,3
	var/need_to_next_stade //200u, 500u, 1000u of semen/femcum. Yeeah )O)


/mob/living/simple_animal/latexmob/venom
	name = "split personality"
	real_name = "unknown conscience"
	var/mob/living/carbon/human/body
	var/obj/item/organ/latexOrgan/organ

/mob/living/simple_animal/latexmob/venom/Login()
	..()
	body = src.loc
	LOGIN_NOTICE_MESSAGE(src)
	var/datum/antagonist/living_latex/antag_datum = check_LL_antagDatum(src)
	if(antag_datum && !antag_datum.alert_has_been_viewed) //Показывается только один раз и только носителю антаг датума.
		LOGIN_WARNING_MESSAGE(src)
		antag_datum.alert_has_been_viewed = TRUE


/mob/living/simple_animal/latexmob/venom/say(message, bubble_type, var/list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(length(message) && body)
		to_chat(body, span_bold("Странный голос раздается эхом и гласит: \"[message]\""))
		to_chat(src, span_bold("Вы говорите: [message]"))
	return

/mob/living/simple_animal/latexmob/venom/emote(act, m_type = null, message = null, intentional = FALSE)
	if(length(message) && body)
		to_chat(body, span_love("[message]"))
		to_chat(src, span_warning("Вы совершили действие над хостом:")+span_love("[message]"))
	return
