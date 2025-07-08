//Слаймо-латексный хорни антаг
//Тут описание основного объекта-родителя:
/mob/living/simple_animal/latexmob
	name = "Маленькое латексное существо"
	desc = "Маленькое существо, с блестящей черной кожей, чем-то напоминающей слайма. Оно с голодными глазами смотрит на вас."
	icon = 'modular_bluemoon/iamasay/horny_venom/icons/latexmob.dmi'
	health = 50
	maxHealth = 50
	speak = list() //Добавить сюда галлком хотя бы
	var/latexSecret //переменная для хранения органа
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
	name = "Войти/выйти из носителя"
	desc = "Станьте одним целым с кем-то."

/datum/action/cooldown/latexmob/venomAction/Activate()
	var/list/choices = list()
	for(var/mob/living/carbon/C in oview(3,owner))
		choices += C
		to_chat(owner, "[C]")
	var/choice = show_radial_menu(owner, owner, choices = choices)
	to_chat(owner, " this is [choices] with center [target], finall choice is [choice]")
	if(choice)
		var/mob/living/simple_animal/latexmob/L = owner
		L.merging(choice)
		return
	var/mob/living/carbon/host = owner.loc
	var/turf/targetTurf = host.loc
	if(istype(host, /mob/living/carbon))
		targetTurf.contents += new /mob/living/simple_animal/latexmob
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = host.internal_organs.Find(/obj/item/organ/latexOrgan)
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
	if(istype(owner.loc, /mob/living/carbon))
		var/mob/living/carbon/host = owner.loc
		var/obj/item/organ/latexOrgan/targetOrgan = host.internal_organs.Find(/obj/item/organ/latexOrgan)
		targetOrgan.hostUser_backseat.ckey = host.ckey
		host.ckey = targetOrgan.venomUser_backseat.ckey

/mob/living/simple_animal/latexmob/Initialize(mapload)
	. = ..()
	RegisterSignal(/mob/living/carbon, COMSIG_CLICK_ALT, PROC_REF(merging))
	latexSecret = new /obj/item/organ/latexOrgan
	var/datum/action/cooldown/latexmob/venomAction/venomAction = new()
	var/datum/action/cooldown/latexmob/takeControl/takeControl = new()
	venomAction.Grant(src)
	takeControl.Grant(src)

/mob/living/simple_animal/latexmob/proc/merging(mob/living/carbon/T)
	var/obj/item/organ/latexOrgan/O = src.latexSecret
	O.venomUser_backseat = new /mob/living/simple_animal/latexmob/venom
	O.venomUser_backseat.loc = T
	usr.transfer_ckey(O.venomUser_backseat)
	O.Insert(T)
	qdel(src)

/obj/item/organ/latexOrgan
	name = "strange black organ"
	//icon =
	zone = BODY_ZONE_HEAD
	organ_flags = ORGAN_NO_SPOIL
	var/mob/living/simple_animal/latexmob/venom/venomUser_backseat
	var/mob/living/simple_animal/latexmob/venom/hostUser_backseat

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
