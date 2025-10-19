#define TRAIT_POISONOUS_FANGS = "poisonous fangs"

/datum/quirk/bite
	name = "Ядовитые зубы"
	desc = "По каким-то причинам в ваших зубах появились ядопроводящие трубки, которые впрыскивают яд при укусе в жертву. При появлении вы можете выбрать тип яда. Выбор реагента дается при первой активации"
	value = 1
	medical_record_text = "Пациент имеет ядопроводящие трубки в клыках, способные вводить яд."
//	mob_trait = TRAIT_POISONOUS_FANGS
	gain_text = span_notice("Вы ощущаете желание кого-то укусить")
	lose_text = span_notice("Ваши клыки больше не такие опасные")
	var/list/my_reagents = list(
		/datum/reagent/toxin,
		/datum/reagent/toxin/acid,
		/datum/reagent/toxin/mutetoxin
		)

/datum/quirk/bite/add()
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	var/datum/action/cooldown/bite/act_bite = new
	act_bite.Grant(quirk_mob)

/datum/quirk/bite_lewd
	name = "Клыки суккуба"
	desc = "Укус ваших зубов имеет особый эффект, который может как возбуждать жертву, так и усмирить. Выбор реагента дается при первой активации"
	value = 0
	var/my_reagents = list(
		/datum/reagent/drug/aphrodisiac,
		/datum/reagent/drug/aphrodisiacplus,
		/datum/reagent/toxin/chloralhydrate,
		/datum/reagent/consumable/ethanol/isloation_cell,
	)

/datum/quirk/bite_lewd/add()
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	var/datum/action/cooldown/bite/act_bite = new
	if(GLOB.round_type == ROUNDTYPE_EXTENDED)
		to_chat(quirk_holder, "В режим отличный от Extended из списка реагентов квирка Клыки суккуба были убраны опасные реагенты.")
		my_reagents -= /datum/reagent/toxin/chloralhydrate
	act_bite.Grant(quirk_mob)

/datum/action/cooldown/bite
	name = "Ядовитый укус"
	desc = "Sink your fangs into the person you are grabbing, and attempt to inject reagents into them."
	icon_icon = 'modular_bluemoon/icons/mob/actions/venom_bite.dmi'
	button_icon_state = "Bite"
	cooldown_time = 30 SECONDS
	var/time_interact = 30
	var/datum/quirk/bite/my_quirk
	var/datum/reagents/venom_bank

/datum/action/cooldown/bite/Grant()
	. = ..()
	var/mob/living/carbon/L = owner
	my_quirk = locate(/datum/quirk/bite) in L.roundstart_quirks
	if(!my_quirk)
		my_quirk = locate(/datum/quirk/bite_lewd) in L.roundstart_quirks
	venom_bank = new(100)

/datum/action/cooldown/bite/Activate()
	if(!venom_bank.reagent_list.len)
		var/datum/reagent/choose = tgui_input_list(owner, "Выберите яд, который будет впрыскиваться при укусе", "Выбор яда", my_quirk.my_reagents)
		if(!choose || choose == "Cancel")
			to_chat(owner, "Из-за отмены выбора яда вы не сможете что-либо вколоть через укус.")
			return
		venom_bank.add_reagent(choose, 50)
		return

	var/mob/living/carbon/action_owner = owner

	if(!action_owner.pulling)
		to_chat(action_owner, span_warning("Тебе нужна жертва для этого!"))
		return

	if(action_owner.is_muzzled())
		to_chat(action_owner, span_notice("Вы не можете кусаться с намордником!"))
		return

	if(action_owner.is_mouth_covered())
		to_chat(action_owner, span_notice("Вы не можете укусить, пока ваш рот прикрыт!"))
		return

	var/pull_target = action_owner.pulling
	var/mob/living/carbon/human/bite_target

	if(iscarbon(pull_target))
		bite_target = pull_target
	else
		var/message_invalid_target = ("Ты не можешь укусить [pull_target]!")
		to_chat(action_owner, span_warning(message_invalid_target))
		return

	var/target_zone = action_owner.zone_selected

	if(!bite_target.can_inject(action_owner, FALSE, target_zone, FALSE, TRUE))
		to_chat(action_owner, span_warning("Вы не можете укусить [bite_target]'s. Целевая часть тела прикрыта одеждой или чем-то плотным"))
		return

	var/obj/item/bodypart/bite_bodypart = bite_target.get_bodypart(target_zone)

	var/target_zone_name = "flesh"
	var/target_zone_effects = FALSE
	var/target_zone_check = bite_bodypart?.can_dismember() || TRUE

	switch(target_zone)
		if(BODY_ZONE_HEAD)
			target_zone_name = "neck"
		if(BODY_ZONE_CHEST)
			target_zone_name = "shoulder"
		if(BODY_ZONE_L_ARM)
			target_zone_name = "left arm"
		if(BODY_ZONE_R_ARM)
			target_zone_name = "right arm"
		if(BODY_ZONE_L_LEG)
			target_zone_name = "left thigh"
		if(BODY_ZONE_R_LEG)
			target_zone_name = "right thigh"
		if(BODY_ZONE_PRECISE_EYES)
			if(!bite_target.has_eyes() == HAS_EXPOSED_GENITAL)
				to_chat(action_owner, span_warning("Вы не можете найти [bite_target]'s глаза, чтобы укусить их!"))
				return
			target_zone_name = "eyes"
			target_zone_check = FALSE
			target_zone_effects = TRUE
		if(BODY_ZONE_PRECISE_MOUTH)
			if(!(bite_target.has_mouth() && bite_target.mouth_is_free()))
				to_chat(action_owner, span_warning("Вы не можете найти [bite_target]'s губы чтобы укусить их!"))
				return
			target_zone_name = "lips"
			target_zone_check = FALSE
			target_zone_effects = TRUE
		if(BODY_ZONE_PRECISE_GROIN)
			target_zone_name = "groin"
			target_zone_check = FALSE
		if(BODY_ZONE_PRECISE_L_HAND)
			target_zone_name = "left wrist"
		if(BODY_ZONE_PRECISE_R_HAND)
			target_zone_name = "right wrist"
		if(BODY_ZONE_PRECISE_L_FOOT)
			target_zone_name = "left ankle"
		if(BODY_ZONE_PRECISE_R_FOOT)
			target_zone_name = "right ankle"

	if(target_zone_check)
		if(!bite_bodypart)
			to_chat(action_owner, span_warning("[bite_target] не имеет [target_zone_name] чтобы их укусить!"))
			return

		if(!bite_bodypart.is_organic_limb())
			action_owner.visible_message(span_danger("[action_owner] пытается укусить [bite_target]'s [target_zone_name], но не может прокусить твердую оболочку синтетической конечности!"), span_warning("Ты пытаешься укусить [bite_target]'s [target_zone_name], но не можешь его прокусить!"))
			to_chat(bite_target, span_warning("[action_owner] пытается укусить твою [target_zone_name], но не может прокусить синтетическую оболочку"))
			playsound(bite_target, "sound/effects/clang[pick(1,2)].ogg", 30, 1, -2)
			StartCooldown()
			return

	if(target_zone_effects)
		if((target_zone == BODY_ZONE_PRECISE_EYES) || (target_zone == BODY_ZONE_PRECISE_MOUTH))
			if(findtext(bite_target.dna?.features["mam_snouts"], "Synthetic Lizard"))
				action_owner.visible_message(span_notice("[action_owner]'s клыки безвредно лязгают об [bite_target]'s лицевой экран!"), span_notice("Твои клыки безвредно лязгают об [bite_target]'s лицевой экран!"))
				playsound(bite_target, 'sound/effects/Glasshit.ogg', 30, 1, -2)
				StartCooldown()
				return

		switch(target_zone)
			if(BODY_ZONE_PRECISE_EYES)
				var/obj/item/organ/eyes/target_eyes = bite_target.getorganslot(ORGAN_SLOT_EYES)
				if(target_eyes)
					to_chat(bite_target, span_userdanger("Твои [target_eyes] ноют от боли после того как [action_owner]'s клыки царапают их поверхность!"))
					bite_target.blur_eyes(10)
					target_eyes.applyOrganDamage(20)

			if(BODY_ZONE_PRECISE_MOUTH)
				bite_target.stuttering = 10

	action_owner.visible_message(span_danger("[action_owner] кусает [bite_target]'s [target_zone_name]!"), span_danger("Вы кусаете [bite_target]'s [target_zone_name]!"))

	playsound(action_owner, 'sound/weapons/bite.ogg', 30, 1, -2)

	to_chat(bite_target, span_userdanger("[action_owner] кусает тебя в [target_zone_name], и вы можете ощутить, как что-то впрыскивается в место укуса!"))

	if(!do_after(action_owner, time_interact, target = bite_target))
		if(target_zone_check)
			bite_bodypart.receive_damage(brute = rand(4,8), sharpness = SHARP_POINTY)
		StartCooldown()
		return
	else
		// Проверка: есть ли реагенты в venom_bank для вкалывания
		if(venom_bank.total_volume < 10)  // Минимум 10 единиц;
			to_chat(action_owner, span_warning("You don't have enough reagents to inject!"))
			StartCooldown()
			return

		// Вкалываем реагенты в жертву
		var/injected_amount = 5 // Количество вкалываемых реагентов;
		venom_bank.trans_to(bite_target, injected_amount)  // Трансфер из venom_bank в реагенты жертвы
		to_chat(bite_target, span_danger("[action_owner] вкалывает через укус что-то в [target_zone_name]!"))
		to_chat(action_owner, span_notice("Вы успешно вкололи через укус яд в [bite_target]'s [target_zone_name]!"))

		StartCooldown()
