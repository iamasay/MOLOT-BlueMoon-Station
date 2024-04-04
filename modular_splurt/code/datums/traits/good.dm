/datum/quirk/tough
	name = "Стойкость"
	desc = "Ваше аномально крепкое тело не воспринимает физический урон ниже 10 единиц"
	value = 2
	mob_trait = TRAIT_TOUGHT
	medical_record_text = "Пациент продемонстрировал аномально высокую устойчивость к травмам."
	gain_text = "<span class='notice'>Вы чувствуете крепость в мышцах.</span>"
	lose_text = "<span class='notice'>Вы чувствуете себя менее крепким.</span>"

/*
/datum/quirk/tough/add()
	quirk_holder.maxHealth *= 1.20

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 0.909 //close enough
*/

/datum/quirk/ashresistance
	name = "Пепельная Устойчивость"
	desc = "Ваше тело адаптировалось к пылающим покровам пепла, которые застилают вулканические миры, но это не значит, что вы не будете уставать."
	value = 2 //Is not actually THAT good. Does not grant breathing and does stamina damage to the point you are unable to attack. Crippling on lavaland, but you'll survive. Is not a replacement for SEVA suits for this reason. Can be adjusted.
	mob_trait = TRAIT_ASHRESISTANCE
	medical_record_text = "У пациента аномально плотный эпидермис."
	gain_text = "<span class='notice'>Вы чувствуете себя устойчивее против горящей серы.</span>"
	lose_text = "<span class='notice'>Ваша плоть становится более легковоспламеняемой.</span>"

/* --FALLBACK SYSTEM INCASE THE TRAIT FAILS TO WORK. Do NOT enable this without editing ash_storm.dm to deal stamina damage with ash immunity.
/datum/quirk/ashresistance/add()
	quirk_holder.weather_immunities |= "ash"

/datum/quirk/ashresistance/remove()
	if(!quirk_holder)
		return
	quirk_holder.weather_immunities -= "ash"
*/

/datum/quirk/rad_fiend
	name = "Рад Фьенд"
	desc = "Вас благословил согревающий свет Атома, заставляющий вас постоянно излучать едва заметное свечение. Только особо интенсивное излучение способно проникнуть через ваш защитный барьер."
	value = 2
	mob_trait = TRAIT_RAD_FIEND
	gain_text = span_notice("Вы чувствуете в себе силы благодаря свечению Атома.")
	lose_text = span_notice("Вы понимаете, что радиация не такая уж безопасная.")

/datum/quirk/rad_fiend/add()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder
	// Add glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = new
	quirk_action.Grant(quirk_mob)

/datum/quirk/rad_fiend/remove()
	// Define quirk holder mob
	var/mob/living/carbon/human/quirk_mob = quirk_holder

	// Remove glow control action
	var/datum/action/rad_fiend/update_glow/quirk_action = locate() in quirk_mob.actions
	quirk_action.Remove(quirk_mob)

	// Remove glow effect
	quirk_mob.remove_filter("rad_fiend_glow")

/datum/quirk/dominant_aura
	name = "Аура Доминатора"
	desc = "Ваша аура силы и превосходства настолько выразительна, что пассивы ничего не могут поделать, кроме как броситься вам в ноги по щелчку пальцев."
	value = 1
	gain_text = "<span class='notice'>Вы хотите сделать кого-нибудь своим питомцем.</span>"
	lose_text = "<span class='notice'>Вы чувствуете себя менее напористо.</span>"

/datum/quirk/dominant_aura/add()
	. = ..()
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)
	RegisterSignal(quirk_holder, COMSIG_MOB_EMOTE, .proc/handle_snap)

/datum/quirk/dominant_aura/remove()
	. = ..()
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
	UnregisterSignal(quirk_holder, COMSIG_MOB_EMOTE)

/datum/quirk/dominant_aura/proc/on_examine_holder(atom/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/sub = user
	if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
		return

	examine_list += span_lewd("\nВы испытываете сильный стыд от взгляда на [quirk_holder.ru_na()] и отводите свой взгляд!")
	if(!TIMER_COOLDOWN_CHECK(user, COOLDOWN_DOMINANT_EXAMINE))
		to_chat(quirk_holder, span_notice("[user] пытается посмотреть на вас, но тут же отворачивается с красным лицом..."))
		TIMER_COOLDOWN_START(user, COOLDOWN_DOMINANT_EXAMINE, 10 SECONDS)
		sub.dir = turn(get_dir(sub, quirk_holder), pick(-90, 90))
		sub.emote("blush")

/datum/quirk/dominant_aura/proc/handle_snap(datum/source, list/emote_args)
	SIGNAL_HANDLER

	. = FALSE
	var/datum/emote/E
	E = E.emote_list[lowertext(emote_args[EMOTE_ACT])]
	if(TIMER_COOLDOWN_CHECK(quirk_holder, COOLDOWN_DOMINANT_SNAP) || !findtext(E?.key, "snap"))
		return
	for(var/mob/living/carbon/human/sub in hearers(DOMINANT_DETECT_RANGE, quirk_holder))
		if(!sub.has_quirk(/datum/quirk/well_trained) || (sub == quirk_holder))
			continue
		var/good_x = "питомец"
		switch(sub.gender)
			if(MALE)
				good_x = "мальчик"
			if(FEMALE)
				good_x = "девочка"
		switch(E?.key)
			if("snap")
				sub.dir = get_dir(sub, quirk_holder)
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_notice("\The <b>[sub]</b> застенчиво поворачивается и начинает покорное наблюдение за \the <b>[quirk_holder]</b>. Какая молодчинка!"),
									span_lewd("Ты покорно смотришь на \the [quirk_holder] и с трудом отводишь свой взгляд!"))
			if("snap2")
				sub.dir = get_dir(sub, quirk_holder)
				sub.KnockToFloor()
				sub.emote(pick("blush", "pant"))
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на колени и преклоняет свою голову<b>[quirk_holder]</b>."),
									span_lewd("Ты бросаешься на свои колени и преклоняешь голову перед <b>[quirk_holder]</b>, будто бы какое-то животное!"))
			if("snap3")
				sub.KnockToFloor()
				step(sub, get_dir(sub, quirk_holder))
				sub.emote(pick("blush", "pant"))
				sub.do_jitter_animation(30) //You're being moved anyways
				sub.visible_message(span_lewd("\The <b>[sub]</b> бросается на четвереньки и приближается на своих коленях к \the <b>[quirk_holder]</b>"),
									span_lewd("Ты бросаешься на четвереньки и приближаешься на своих коленях к \the <b>[quirk_holder]</b>! [good_x] в своём репертуаре."))
		. = TRUE

	if(.)
		TIMER_COOLDOWN_START(quirk_holder, COOLDOWN_DOMINANT_SNAP, DOMINANT_SNAP_COOLDOWN)

/datum/quirk/arachnid
	name = "Арахнид"
	desc = "Ваша анатомия позволяет плести паутину и коконы, будучи не арахнидом! (Учтите, что этот навык ничего не даёт расе арахнидов)"
	value = 1
	medical_record_text = "Пациент попытался покрыть комнату паутиной, заявляя, что \"делает гнездо\"."
	mob_trait = TRAIT_ARACHNID
	gain_text = "<span class='notice'>У вас появляется странное ощущение рядом с анусом...</span>"
	lose_text = "<span class='notice'>Вы чувствуете, что больше не можете вить паутину...</span>"
	processing_quirk = TRUE

/datum/quirk/arachnid/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		to_chat(H, "<span class='warning'>Этот навык ничего не даёт арахнидам, так как является встроенным для расы.</span>")
		return
	var/datum/action/innate/spin_web/SW = new
	var/datum/action/innate/spin_cocoon/SC = new
	SC.Grant(H)
	SW.Grant(H)

/datum/quirk/arachnid/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if(is_species(H,/datum/species/arachnid))
		return
	var/datum/action/innate/spin_web/SW = locate(/datum/action/innate/spin_web) in H.actions
	var/datum/action/innate/spin_cocoon/SC = locate(/datum/action/innate/spin_cocoon) in H.actions
	SC?.Remove(H)
	SW?.Remove(H)

/datum/quirk/flutter
	name = "Парение"
	desc = "Вы можете свободно двигаться в герметичной среде с низкой гравитацией при помощи крыльев, магии или другой физиологической чуши."
	value = 1
	mob_trait = TRAIT_FLUTTER

/datum/quirk/cloth_eater
	name = "Пожиратель Одежды"
	desc = "Вы можете съесть большинство одежды, чтобы получить прибавку к настроению и питательные вещества. (Насекомые владеют этим навыком.)"
	value = 1
	var/mood_category ="cloth_eaten"
	mob_trait = TRAIT_CLOTH_EATER

/datum/quirk/ropebunny
	name = "Верёвочный Кролик"
	desc = "Вы обучены искусно вязать верёвки любой формы. Вы можете создавать веревку из ткани, а из этой веревки - болы!"
	value = 2

/datum/quirk/ropebunny/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	if (!H)
		return
	var/datum/action/ropebunny/conversion/C = new
	C.Grant(H)

/datum/quirk/ropebunny/remove()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/action/ropebunny/conversion/C = locate() in H.actions
	C.Remove(H)
	. = ..()

/datum/quirk/hallowed
	name = "Святой Дух"
	desc = "Вы были благословлены высшими силами или каким-то иным образом наделены святой энергией. Святая вода восстановит ваше здоровье!"
	value = 2
	mob_trait = TRAIT_HALLOWED
	gain_text = span_notice("Вы чувствуете, как святая энергия начинает течь по вашему телу.")
	lose_text = span_notice("Вы чувствуете, как угасает ваша святая энергия...")
	medical_record_text = "У пациента обнаружены неопознанные освященные материалы в крови. Проконсультируйтесь с капелланом."

/datum/quirk/hallowed/add()
	// Add examine text.
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/on_examine_holder)

/datum/quirk/hallowed/remove()
	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text.
/datum/quirk/hallowed/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.p_they(TRUE)] излучает священную силу..."

/datum/quirk/russian
	name = "Русский дух"
	desc = "Вы были благословлены высшими силами или каким-то иным образом наделены святой энергией. С вами Бог!"
	value = 2
	mob_trait = TRAIT_RUSSIAN
	gain_text = span_notice("Вы чувствуете, как Бог следит за вами!")
	lose_text = span_notice("Вы чувствуете, как угасает ваша вера в Бога...")
	medical_record_text = "У пациента обнаружен Ангел-Хранитель."

/datum/quirk/russian/add()
	// Add examine text.
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, .proc/quirk_examine_russian)

/datum/quirk/russian/remove()
	// Remove examine text
	UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)

// Quirk examine text.
/datum/quirk/russian/proc/quirk_examine_russian(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.ru_who(TRUE)] излучает русский дух..."

///datum/quirk/bomber
//	name = "Подрывник-Самоубийца"
//	desc = "Благодаря своим связям с Красной Бригадой вы получили специальный имплант для самоуничтожения! Ну или почему-то вы решили ввести себе какую-то зелёную штуку из имплантера с мусорки и теперь вы научились делать что-то потрясное..."
//	value = 4
//
///datum/quirk/bomber/add()
//	. = ..()
//	var/mob/living/carbon/human/H = quirk_holder
//	if (!H)
//		return
//	var/obj/item/implant/explosive/E = new
//	E.implant(H)
//	H.update_icons()

/datum/quirk/breathing_tube
	name = "Трубка для Горлового Дыхания"
	desc = "Похоже, что вам не нравятся стандартные противогазы и прочие методы дыхания в безвоздушных условиях. Есть решение!"
	value = 1
	mood_quirk = FALSE
	processing_quirk = FALSE

/datum/quirk/breathing_tube/on_spawn()
	. = ..()

	// Create a new augment item
	var/obj/item/organ/cyberimp/mouth/breathing_tube/put_in = new

	// Apply the augment to the quirk holder
	put_in.Insert(quirk_holder, null, TRUE, TRUE)

/datum/quirk/restorative_metabolism
	name = "Восстановительный Метаболизм"
	desc = "Ваше органическое тело обладает дифференцированной способностью к восстановлению, что позволяет вам медленно восстанавливаться после травм. Однако обратите внимание, что критические травмы, ранения или генетические повреждения все равно потребуют медицинской помощи."
	value = 3
	mob_trait = TRAIT_RESTORATIVE_METABOLISM
	gain_text = span_notice("Вы чувствуете прилив жизненной силы, проходящей через ваше тело...")
	lose_text = span_notice("Вы чувствуете, как ваши улучшенные способности к восстановлению исчезают...")
	processing_quirk = TRUE

/datum/quirk/restorative_metabolism/on_process()
	. = ..()
	//Works only for organics #biopank_power
	var/mob/living/carbon/human/H = quirk_holder //person who'll be healed
	var/consumed_damage = H.getFireLoss() * 2 + H.getBruteLoss() // the damage, the person have. Burn is bad for regeneration, so its multiplied
	var/heal_multiplier = quirk_holder.getMaxHealth() / 100 // the heal is scaled by persons health, big guys heals faster
	var/bruteheal = -0.6
	var/burnheal = -0.2
	var/toxheal = -0.2
	if (consumed_damage > 50 * heal_multiplier) // if the damage exceeds the threshold the speed of healing significantly reduse
		heal_multiplier *= 0.5
	H.adjustBruteLoss(bruteheal * heal_multiplier, forced = TRUE)
	H.adjustFireLoss(burnheal * heal_multiplier, forced = TRUE)
	H.adjustToxLoss(toxheal * heal_multiplier, forced = TRUE)

/datum/quirk/breathless
	name = "Недышащий"
	desc = "Благодаря генной инженерии, технологиям или магии блюспейса вам больше не нужен воздух для жизнедеятельности. Это также означает, что проведение таких жизненно важных манипуляций, как искусственное дыхание, станет невозможным."
	value = 3
	medical_record_text = "Биологические показатели пациента свидетельствуют об отсутствии необходимости в дыхании."
	gain_text = span_notice("Вам больше не нужно дышать.")
	lose_text = span_notice("Вам нужно снова дышать...")
	processing_quirk = TRUE

/datum/quirk/breathless/add()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H,TRAIT_NOBREATH,ROUNDSTART_TRAIT)

/datum/quirk/breathless/remove()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	REMOVE_TRAIT(H,TRAIT_NOBREATH, ROUNDSTART_TRAIT)

/datum/quirk/breathless/on_process()
	. = ..()
	var/mob/living/carbon/human/H = quirk_holder
	H.adjustOxyLoss(-3) /* Bandaid-fix for a defibrillator "bug",
	Which causes oxy damage to stack for mobs that don't breathe */
