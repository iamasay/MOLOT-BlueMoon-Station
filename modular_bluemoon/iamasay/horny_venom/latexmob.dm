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
	var/stage
	var/datum/species/old_host_spec
	var/datum/evolution_store
	var/list/available_abilities = list(
		new /datum/action/cooldown/latexmob/venomAction,
		new /datum/action/cooldown/latexmob/takeControl
	)
	var/list/all_abilities = list()

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

/mob/living/simple_animal/latexmob/stage1
	name = ""

/mob/living/simple_animal/latexmob/venom
	name = "split personality"
	real_name = "unknown conscience"
	var/mob/living/carbon/body
	var/obj/item/organ/latexOrgan/organ


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
