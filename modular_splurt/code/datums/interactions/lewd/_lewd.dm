/mob/living
	var/has_belly = FALSE

/mob/living/has_anus()
	if(getorganslot(ORGAN_SLOT_ANUS))
		return has_genital(ORGAN_SLOT_ANUS)
	. = ..()

/mob/living/add_lust(add)
	. = ..()
	SEND_SIGNAL(src, COMSIG_MOB_LUST_UPDATED)

/mob/living/set_lust(num)
	. = ..()
	SEND_SIGNAL(src, COMSIG_MOB_LUST_UPDATED)

/mob/living/toggle_anus_always_accessible(accessibility)
	var/obj/item/organ/genital/anus/donut = getorganslot(ORGAN_SLOT_ANUS)
	if(donut)
		return donut.toggle_accessibility(accessibility)
	. = ..()

/*
SPLURT теперь обрабатывают все это дело в /mob/living/proc/moan() -> весь код снизу теперь не имеет смысла.
/mob/living/moan()
	var/moaned = lastmoan
	var/miming = mind ? mind?.miming : FALSE
	. = ..()
	if((moaned == lastmoan) || is_muzzled() || miming || !prob(50))
		return
	var/list/moans
	if(isalien(src))
		moans = list('sound/voice/hiss6.ogg')
	else if(gender == FEMALE || (gender == PLURAL && isfeminine(src)))
		moans = list('modular_splurt/sound/voice/moan_f1.ogg', 'modular_splurt/sound/voice/moan_f2.ogg', 'modular_splurt/sound/voice/moan_f3.ogg', 'modular_splurt/sound/voice/moan_f4.ogg', 'modular_splurt/sound/voice/moan_f5.ogg', 'modular_splurt/sound/voice/moan_f6.ogg', 'modular_splurt/sound/voice/moan_f7.ogg')
	else
		moans = list('modular_splurt/sound/voice/moan_m1.ogg', 'modular_splurt/sound/voice/moan_m2.ogg', 'modular_splurt/sound/voice/moan_m3.ogg')
	playlewdinteractionsound(src, pick(moans), 50, 1, 4, 1.2, ignored_mobs = get_unconsenting())
*/

/mob/living/proc/get_refraction_dif() //Got snapped in upstream, may delete later when I figure something out
	var/dif = (refractory_period - world.time)
	if(dif < 0)
		return 0
	else
		return dif

/mob/living/proc/has_belly()
	var/mob/living/carbon/C = src
	if(has_belly || !istype(C))
		return TRUE
	return has_genital(ORGAN_SLOT_BELLY)

/mob/living/cum(mob/living/partner, target_orifice)
	var/message //if this doesn't exist it calls ..()
	var/cumin = FALSE
	var/obj/item/organ/genital/target_gen
	var/mob/living/carbon/c_partner
	//Carbon checks
	if(iscarbon(partner))
		c_partner = partner

	if(src != partner)
		if(!last_genital)
			if(has_penis())
				if(!istype(partner))
					target_orifice = null
				switch(target_orifice)
					if(CUM_TARGET_NIPPLE)
						cumin = TRUE
						if(partner.has_breasts())
							message = "кончает в сосок <b>[partner]</b>!."
							target_gen = partner.getorganslot(ORGAN_SLOT_BREASTS)
						else
							message = "кончает на грудь и шею <b>[partner]</b>."
							if((partner.client?.prefs.cit_toggles & BREAST_ENLARGEMENT) && c_partner)
								target_gen = new /obj/item/organ/genital/breasts
								target_gen.Insert(c_partner)
						if(target_gen)
							target_gen.climax_modify_size(src, getorganslot(ORGAN_SLOT_PENIS))
					if(CUM_TARGET_URETHRA)
						cumin = TRUE
						message = "кончает в уретру <b>[partner]</b>!"
						if(c_partner)
							target_gen = partner.getorganslot(ORGAN_SLOT_PENIS)
							target_gen.climax_modify_size(src, getorganslot(ORGAN_SLOT_PENIS))
					if(CUM_TARGET_THIGHS)
						if(partner.has_legs() >= 2)
							message = "кончает между бёдрами <b>[partner]</b>!"
						else
							message = "кончает... как-то..."
					if(CUM_TARGET_BELLY)
						cumin = TRUE
						if(partner.has_belly() == HAS_EXPOSED_GENITAL)
							message = "кончает в декольте <b>[partner]</b>, [pick(list("создавая там липкую лужу", "жидкость забавно фонтанирует наружу"))]."
							if(c_partner)
								target_gen = c_partner.getorganslot(ORGAN_SLOT_BELLY)
						else
							message = "кончает на тело <b>[partner]</b>."
						if(c_partner)
							if(partner.client?.prefs.cit_toggles & BELLY_INFLATION)
								var/obj/item/organ/genital/belly/gut = partner.getorganslot(ORGAN_SLOT_BELLY)
								if(!gut)
									gut = new
									gut.Insert(partner)
								gut.climax_modify_size(src, getorganslot(ORGAN_SLOT_PENIS), target_orifice)

					if(CUM_TARGET_ARMPIT)
						message = "кончает в подмышку <b>[partner]</b>."

					if(CUM_TARGET_MOUTH, CUM_TARGET_THROAT, CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
						if(c_partner)
							if(partner.client?.prefs.cit_toggles & BELLY_INFLATION)
								var/obj/item/organ/genital/belly/gut = partner.getorganslot(ORGAN_SLOT_BELLY)
								if(!gut)
									gut = new
									gut.Insert(partner)
								gut.climax_modify_size(src, getorganslot(ORGAN_SLOT_PENIS), target_orifice)
							else if((partner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT) && target_orifice == CUM_TARGET_ANUS)
								var/obj/item/organ/genital/butt/ass = partner.getorganslot(ORGAN_SLOT_BUTT)
								if(!ass)
									ass = new
									ass.Insert(partner)
								ass.climax_modify_size(src, getorganslot(ORGAN_SLOT_PENIS))
					// BLUEMOON ADD хвостики!
					if(CUM_TARGET_TAIL)
						message = "кончает на хвост <b>[partner]</b>!"
					// BLUEMOON ADD END

		else
			switch(last_genital.type)
				if(/obj/item/organ/genital/penis)
					if(!istype(partner))
						target_orifice = null
					switch(target_orifice)
						if(CUM_TARGET_NIPPLE)
							cumin = TRUE
							if(partner.has_breasts())
								message = "кончает в сосок <b>[partner]</b>!."
								target_gen = partner.getorganslot(ORGAN_SLOT_BREASTS)
							else
								message = "кончает на грудь и шею <b>[partner]</b>."
								if((partner.client?.prefs.cit_toggles & BREAST_ENLARGEMENT) && c_partner)
									target_gen = new /obj/item/organ/genital/breasts
									target_gen.Insert(partner)

							if(target_gen)
								target_gen.climax_modify_size(src, last_genital)
						if(CUM_TARGET_URETHRA)
							cumin = TRUE
							message = "кончает в уретру <b>[partner]</b>!"
							if(c_partner)
								target_gen = partner.getorganslot(ORGAN_SLOT_PENIS)
								target_gen.climax_modify_size(src, last_genital)
						if(CUM_TARGET_THIGHS)
							if(partner.has_legs() >= 2)
								message = "кончает между бёдер <b>[partner]</b>!"
							else
								message = "кончает... как-то..."
						if(CUM_TARGET_BELLY)
							cumin = TRUE
							if(partner.has_belly() == HAS_EXPOSED_GENITAL)
								message = "кончает в пупок <b>[partner]</b>, [pick(list("создавая там липкую лужу", "жидкость забавно фонтанирует наружу"))]."
								if(c_partner)
									target_gen = c_partner.getorganslot(ORGAN_SLOT_BELLY)
							else
								message = "кончает на тело <b>[partner]</b>."
							if(c_partner)
								if(partner.client?.prefs.cit_toggles & BELLY_INFLATION)
									var/obj/item/organ/genital/belly/gut = partner.getorganslot(ORGAN_SLOT_BELLY)
									if(!gut)
										gut = new
										gut.Insert(partner)
									gut.climax_modify_size(src, last_genital, target_orifice)
								else if((partner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT) && target_orifice == CUM_TARGET_ANUS)
									var/obj/item/organ/genital/butt/ass = partner.getorganslot(ORGAN_SLOT_BUTT)
									if(!ass)
										ass = new
										ass.Insert(partner)
									ass.climax_modify_size(src, last_genital)

						if(CUM_TARGET_MOUTH, CUM_TARGET_THROAT, CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
							if(c_partner)
								if(partner.client?.prefs.cit_toggles & BELLY_INFLATION)
									var/obj/item/organ/genital/belly/gut = partner.getorganslot(ORGAN_SLOT_BELLY)
									if(!gut)
										gut = new
										gut.Insert(partner)
									gut.climax_modify_size(src, last_genital, target_orifice)
								else if((partner.client?.prefs.cit_toggles & BUTT_ENLARGEMENT) && target_orifice == CUM_TARGET_ANUS)
									var/obj/item/organ/genital/butt/ass = partner.getorganslot(ORGAN_SLOT_BUTT)
									if(!ass)
										ass = new
										ass.Insert(partner)
									ass.climax_modify_size(src, last_genital)
						// BLUEMOON ADD хвостики!
						if(CUM_TARGET_TAIL)
							message = "кончает на собственный хвост!"
						// BLUEMOON ADD END
		if(iswendigo(partner) && partner.pulling == src)
			var/mob/living/carbon/wendigo/W = partner
			W.slaves |= src
			to_chat(src, "<font color='red'> Теперь ты раб <b>[W]</b>! Служи, служи и ещё раз служи!!! </font>")
	if(!message)
		return ..()
	if(gender == MALE || (gender == PLURAL && ismasculine(src)))
		playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/final_m1.ogg',
							'modular_sand/sound/interactions/final_m2.ogg',
							'modular_sand/sound/interactions/final_m3.ogg',
							'modular_sand/sound/interactions/final_m4.ogg',
							'modular_sand/sound/interactions/final_m5.ogg'), 90, 1, 0)
	else if(gender == FEMALE || (gender == PLURAL && isfeminine(src)))
		playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/final_f1.ogg',
							'modular_sand/sound/interactions/final_f2.ogg',
							'modular_sand/sound/interactions/final_f3.ogg'), 70, 1, 0)
	else
		playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/final_f1.ogg',
							'modular_sand/sound/interactions/final_f2.ogg',
							'modular_sand/sound/interactions/final_f3.ogg'), 70, 1, 0)
	visible_message(message = "<span class='userlove'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	multiorgasms += 1

	if(get_sexual_potency() == -1 || multiorgasms > (get_sexual_potency() * 0.34)) //AAAAA, WE DONT WANT NEGATIVES HERE, RE
		refractory_period = world.time + rand(300, 900) //sex cooldown
		// set_drugginess(rand(20, 30))
	else
		refractory_period = world.time + rand(300, 900) - get_sexual_potency()
		// set_drugginess(rand(5, 10))
	if(get_sexual_potency() == -1 || multiorgasms < get_sexual_potency()) // Climax limit | SPLURT EDIT: -1 sexual potency = no limit
		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			if(!partner)
				H.mob_climax(TRUE, "masturbation", "none")
			else
				H.mob_climax(TRUE, "sex", partner, !cumin, target_gen)
		if(iscyborg(src)) //BLUEMOON ADD Также добавлено взаимодействие с боргами
			var/mob/living/silicon/robot/R = src
			if(!partner)
				R.mob_climax_silicon(TRUE, "masturbation", "none")
			else
				R.mob_climax_silicon(TRUE, "sex", partner, !cumin, target_gen)
	set_lust(0)

	SEND_SIGNAL(src, COMSIG_MOB_POST_CAME, target_orifice, partner, cumin, last_genital)

	return TRUE

/mob/living/get_unconsenting(extreme, list/ignored_mobs, var/unholy)
	for(var/mob/M in range(7, src))
		if(M.client)
			var/client/cli = M.client
			if(unholy && (cli.prefs.unholypref == "No"))
				LAZYADD(ignored_mobs, M)
	. = ..()

/mob/living/proc/has_legs(nintendo = REQUIRE_ANY)
	var/legs = has_left_leg() + has_right_leg()
	if(legs)
		switch(nintendo)
			if(REQUIRE_EXPOSED)
				if(is_bottomless())
					return legs
			if(REQUIRE_UNEXPOSED)
				if(!is_bottomless())
					return legs
			if(REQUIRE_ANY)
				return legs
	return FALSE

// Interaction Procs

/mob/living/proc/do_oral_self(mob/living/user, var/fucktarget = "penis")
	var/message
	var/obj/item/organ/genital/peepee = null
	var/lust_increase = NORMAL_LUST

	if(user.is_fucking(src, CUM_TARGET_MOUTH))
		if(prob(user.get_sexual_potency()))
			if(istype(src, /mob/living)) // Argh.
				var/mob/living/H = src
				H.adjustOxyLoss(3)
			message = "сосёт себе."
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(user.has_vagina())
						message = pick(
							"довольно облизывается и зарывается своим лицом в свою же киску.",
							"прижимается своим мокрым и достаточно тёплым носиком к своей промежности.",
							"обнаруживает себя между своими бёдрами и раз за разом пытается сделать себе хорошо.",
							"погружает своё лицо в свои же бёдра и активно облизывается, проявляя у своей промежности всё больше влаги.",
							"целует свои нежные лепестки и довольно улыбается, удовлетворённо вздыхая.",
							"толкается своим языком к своей же собственной киске и проводит его кончик к самому клитору.",
							"пробует свою киску на вкус.",
						)
					else
						improv = TRUE
				if("penis")
					if(user.has_penis() || user.has_strapon())
						//var/genital_name = user.get_penetrating_genital_name()
						message = pick(
							"отсасывает сам себе!.",
							"обводит языком свой член.",
							"проводит языком вдоль своего члена.",
							"водит языком вокруг головки своего члена.",
							"медленно заглатывает свой член.",
							"целует ствол своего члена.",
							"заглатывает свой член поглубже.",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"облизывает себя.",
					"проводит языком между своих ног.",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(user.has_vagina())
					message = pick(
						"тыкается носом в свою киску",
						"вылизывает свою киску.",
						"зажимает свою голову между ног и отлизывает себе.",
					)
				else
					improv = TRUE
			if("penis")
				if(user.has_penis() || user.has_strapon())
					//var/genital_name = user.get_penetrating_genital_name()
					message = pick(
						"отсасывает сам себе!",
						"обводит языком свой член.",
						"проводит языком вдоль своего члена.",
						"водит языком вокруг головки своего члена.",
						"медленно заглатывает свой член.",
						"целует ствол своего члена.",
						"заглатывает свой член поглубже.",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"довольно облизывается и зарывается своим лицом в свою же киску.",
				"прижимается своим мокрым и достаточно тёплым носиком к своей промежности.",
				"обнаруживает себя между своими бёдрами и раз за разом пытается сделать себе хорошо.",
				"погружает своё лицо в свои же бёдра и активно облизывается, проявляя у своей промежности всё больше влаги.",
				"целует свои нежные лепестки и довольно улыбается, удовлетворённо вздыхая.",
				"толкается своим языком к своей же собственной киске и проводит его кончик к самому клитору.",
				"пробует свою киску на вкус.",
			)
			peepee = null
		else
			if(ishuman(user))
				var/mob/living/carbon/human/pardner = user
				switch(fucktarget)
					if("vagina")
						peepee = pardner.getorganslot(ORGAN_SLOT_VAGINA)
					if("penis")
						peepee = pardner.getorganslot(ORGAN_SLOT_PENIS)
		user.set_is_fucking(src, CUM_TARGET_MOUTH, peepee)

	playlewdinteractionsound(get_turf(src), pick('modular_sand/sound/interactions/bj1.ogg',
									'modular_sand/sound/interactions/bj2.ogg',
									'modular_sand/sound/interactions/bj3.ogg',
									'modular_sand/sound/interactions/bj4.ogg',
									'modular_sand/sound/interactions/bj5.ogg',
									'modular_sand/sound/interactions/bj6.ogg',
									'modular_sand/sound/interactions/bj7.ogg',
									'modular_sand/sound/interactions/bj8.ogg',
									'modular_sand/sound/interactions/bj9.ogg',
									'modular_sand/sound/interactions/bj10.ogg',
									'modular_sand/sound/interactions/bj11.ogg'), 50, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	if(fucktarget != "penis" || user.can_penetrating_genital_cum())
		user.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, src, fucktarget)
	lust_increase = NORMAL_LUST //RESET IT REE

/mob/living/proc/do_breastfuck_self(mob/living/user)
	var/message
	var/t_His = ru_ego()
	//var/genital_name = get_penetrating_genital_name()

	if(is_fucking(user, CUM_TARGET_BREASTS))
		message = "[pick("fucks [t_His] breasts.",
			"трёт свой член между своих сисек.",
			"трахает собственные сиськи.",
			"хватает свой член сиськами, проталкивая его между ними.")]"
	else
		message = "хватает свой член сиськами, проталкивая его между ними."
		set_is_fucking(user, CUM_TARGET_BREASTS, getorganslot(ORGAN_SLOT_PENIS) ? getorganslot(ORGAN_SLOT_PENIS) : null)

	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	visible_message(message = span_lewd("<b>\The [src]</b> [message]"), ignored_mobs = get_unconsenting())
	handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, user, ORGAN_SLOT_PENIS)

/mob/living/proc/nuzzle_belly(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/list/belly_names = list("живот", "животик", "брюхо")
	var/list/nuzzles = list(
		"толкается своим лицом в живот [target]!",
		"целует животик [target].",
		"толкается своим лицом в живот [target] и нежно целуется!",
		"целует и лижет пупок [target]."
		)

	message = "<span class='lewd'><b>\The [src]</b> [pick(nuzzles)]. </span>"
	visible_message(message, ignored_mobs = get_unconsenting())

/mob/living/proc/do_bellyfuck(mob/living/partner)
	var/message
	var/genital_name = get_penetrating_genital_name()

	if(is_fucking(partner, CUM_TARGET_BELLY))
		message = "[pick(
			"с силой загоняет свои гениталии в живот <b>[partner]</b>.",
			"трётся своим членом о живот <b>[partner]</b> с чавкающим звуком.",
			"смотрит в глаза <b>[partner]</b> с ухмылкой и довольно водит своим органом вдоль живота партнёра.",
			"держится за плечи <b>[partner]</b> и с усилием потирается пенисом о живот партнёра.")]"
	else
		message = "приподнимает свой [genital_name] и вводит его в ожидающий пупок \the <b>[partner]</b>."
		set_is_fucking(partner, CUM_TARGET_BELLY, getorganslot(ORGAN_SLOT_PENIS))

	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg'), 50, 1, -1)
	visible_message(message = "<span class='lewd'><b>\The [src]</b> [message]</span>", ignored_mobs = get_unconsenting())
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_BELLY, partner, ORGAN_SLOT_PENIS)
	//partner.handle_post_sex(NORMAL_LUST, null, src) //don't think we need it for this one

/mob/living/proc/do_breastsmother(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	var/list/lines = list(
		"сдавливает лицо <b>[target]</b> между своих сисек.",
		"прижимает свою грудь к лицу <b>[target]</b>.",
		"прижимает голову <b>[target]</b> к своему декольте."
		)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)

/mob/living/proc/lick_sweat(mob/living/target)
	var/message
	//var/t_His = target.ru_ego()
	var/list/lines = list("вылизывает тельце \the <b>[target]</b>.",
							"слизывает соленый пот, стекающий по коже <b>[target]</b>.",
							"наслаждается вкусом промокшего тела \the <b>[target]</b>.",
							"вдыхает запах мускуса и пьет теплый пот \the <b>[target]</b>.")

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)

/mob/living/proc/smother_armpit(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/list/musk = list("musky", "sweaty", "damp", "smelly")
	var/list/lines = list(
		"пихает лицо \the <b>[target]</b> в потную и соленую подмышку.",
		"стискивает нос \the <b>[target]</b> в мускусной подмышке.",
		"прослеживает, чтобы лицо \the <b>[target]</b> хорошо прижималось к потной подмышке и позволяет понюхать."
		)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick(
		'modular_sand/sound/interactions/squelch1.ogg',
		'modular_sand/sound/interactions/squelch2.ogg',
		'modular_sand/sound/interactions/squelch3.ogg'), 50, 1, -1)

/mob/living/proc/lick_armpit(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/list/musk = list("musky ", "sweaty ", "damp ", "smelly ", "")
	var/list/lines = list(
		"засовывает свой нос глубже в подмышку \the <b>[target]</b>, делая небольшой [pick(list("вдох носом", "лизь", "тычок"))].",
		"прижимает свое личико под мышкой \the <b>[target]</b> [pick(list("пробуя на вкус и облизывая", "внюхиваясь в этот запах"))].",
		"продвигает лицо глубже в подмышку \the <b>[target]</b>, обрабатывая там все языком и носом."
	)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick(
		'modular_sand/sound/interactions/squelch1.ogg',
		'modular_sand/sound/interactions/squelch2.ogg',
		'modular_sand/sound/interactions/squelch3.ogg'), 50, 1, -1)

/mob/living/proc/fuck_armpit(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/genital_name = get_penetrating_genital_name()
	//var/t_His = target.ru_ego()
	//var/list/musk = list("musky ", "sweaty ", "damp ", "smelly ", "")
	var/list/lines

	if(is_fucking(target, CUM_TARGET_ARMPIT))
		lines = list(
			"проводит член вперёд и назад под мышкой <b>[target]</b>.",
			"капает предэякулятом на всю потную подмышку <b>[target]</b>, грубо сношая эти теплые объятия.",
			"толкает свой орган под руку <b>[target]</b>, используя подмышку как мастурбатор."
		)
	else
		if(target.is_topless())
			lines = list(
				" подставляет детородный орган к влажной подмышке \the <b>[target]</b>, начиная двигаться всей длиной прямо под рукой!"
			)
		else // https://cdn.discordapp.com/attachments/802990353883070474/962478553117622322/NoName-480p.mp4
			lines = list(
				" делает дыру, разрывая одежду \the <b>[target]</b> так, чтобы подмышка была видна. \The <b>[target]</b> может внезапно почувствовать тепло пульсирующего члена, скользящеко по влажной и потной подмышке!"
			)
		set_is_fucking(target, CUM_TARGET_ARMPIT, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b>[pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_ARMPIT, target, ORGAN_SLOT_PENIS)

/mob/living/proc/do_pitjob(mob/living/target)
	var/message
	//var/list/musk = list("musky ", "sweaty ", "damp ", "smelly ", "")
	//var/u_His = ru_ego()
	//var/genital_name = target.get_penetrating_genital_name()
	//var/t_His = target.ru_ego()
	var/list/lines

	if(is_fucking(target, CUM_TARGET_ARMPIT))
		lines = list(
			"сжимает пульсирующий член <b>[target]</b>, массажируя всю длинну своей подмышкой!",
			"прижимает свою руку к протекающему члену <b>[target]</b>, будто выдаивая его своей потной подмышкой!",
			"потирает и всячески гладит свою подмышку по стержню <b>[target]</b>, глубоко сжимая прямо до основания!"
		)
	else
		if(target.is_topless())
			lines = list(
				"подставляет свою подмышку к органу <b>[target]</b>, поднимая руку перед тем как сжать его!",
			)
		else // https://cdn.discordapp.com/attachments/802990353883070474/962478553117622322/NoName-480p.mp4
			lines = list(
				"мягко проделывает дырку в ткани на задне стороне подмышки, погружая в объятия весь стержень!"
			)
		target.set_is_fucking(src, CUM_TARGET_ARMPIT, target.getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	if(target.can_penetrating_genital_cum())
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_ARMPIT, src, ORGAN_SLOT_PENIS)

/mob/living/proc/do_boobjob(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/genital_name = target.get_penetrating_genital_name()
	var/list/lines

	if(target.is_fucking(src, CUM_TARGET_BREASTS))
		lines = list(
			"водит своей мягкой грудью вверх и вниз по члену <b>[target]</b>.",
			"сжимает свои сиськи вокруг длины стержня <b>[target]</b>.",
			"похотливо мастурбирует орган <b>[target]</b> с помощью своих упругих сисек."
		)
	else
		lines = list(
			"зажимает грудь вокруг пульсирующщего члена <b>[target]</b>, окутывая теплотой и заботой всю длину.",
			"обволакивает твердый стержень <b>[target]</b> своими сиськами, плотно и с хлюпаньем сжимая его.",
			"ползволяет своим дыням упасть прямо на жирный член <b>[target]</b>, удерживая его в декольте."
		)
		target.set_is_fucking(src, CUM_TARGET_BREASTS, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	if(target.can_penetrating_genital_cum())
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_BREASTS, target, CUM_TARGET_PENIS)

/mob/living/proc/lick_nuts(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/t_His = target.ru_ego()
	var/lust_increase = 1
	//var/list/balls = list("balls", "nuts", "[pick(list("cum", "spunk", "nut", "jizz", "seed"))] [pick(list("orbs", "spheres", "tanks", "holders", "churners"))]")
	var/list/lines

	if(target.is_fucking(src, NUTS_TO_FACE))
		lines = list(
			"обрабатывает яички <b>[target]</b>своим языком.",
			"нюхает тяжелый мускусный запах семянников <b>[target]</b> и начинает слизывать с них пот.",
			"оставляет поцелуйчики по всем шарикам <b>[target]</b>, пробуя их на вкус и массажируя губами."
		)
	else
		lines = list(
			"откровает свою пасть и позволяет семянникам <b>[target]</b> проскользнуть внутрь.",
			"испрользует свой язык, чтобы поместить яйца <b>[target]</b> внутрь рта, внюхиваясь в этот запах.",
			"охотно дозволяет шарам <b>[target]</b> упасть в ротовую полость, похотливо обсасывая эти сферы."
		)
		target.set_is_fucking(src, NUTS_TO_FACE, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 70, 1, -1)
	target.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, src, ORGAN_SLOT_TESTICLES)

/mob/living/proc/do_cockfuck(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	//var/t_His = target.ru_ego()
	//var/u_genital_name = get_penetrating_genital_name()
	//var/t_genital_name = target.get_penetrating_genital_name()
	var/list/lines
	var/list/noises = list(
		'modular_sand/sound/interactions/bang1.ogg',
		'modular_sand/sound/interactions/bang2.ogg',
		'modular_sand/sound/interactions/bang3.ogg',
		'modular_sand/sound/interactions/bang4.ogg',
		'modular_sand/sound/interactions/bang5.ogg',
		'modular_sand/sound/interactions/bang6.ogg',
	)

	if(is_fucking(target, CUM_TARGET_URETHRA))
		lines = list(
			"трахает член <b>[target]</b>, растягивая его, своими яичками встречаясь с чужими с негромкими шлепками.",
			"проскальзывает своим членом внутрь конца <b>[target]</b>, ощущая всю узкость уретры!",
			"вонзает свой член и двигается взад-вперед в уретре <b>[target]</b>, невообразимо сношая эту маленькую дырочку."
		)
	else
		lines = list(
			"кончиком целует конец <b>[target]</b>, прямо перед тем как вдавить свою длину прямо в уретру.",
			"проводит своим концом члена по органу <b>[target]</b>, только для того, чтобы ввести свой орган прямо до упора внутрь.",
			"завставляет жирный член <b>[target]</b> растянуться и пульсировать, как только прибор находит свой путь глубже."
		)
		set_is_fucking(target, CUM_TARGET_URETHRA, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(src, pick(noises), 70, 1, -1)
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_URETHRA, target, ORGAN_SLOT_PENIS)
	if(target.can_penetrating_genital_cum())
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_URETHRA, ORGAN_SLOT_PENIS)

/mob/living/proc/do_nipfuck(mob/living/target)
	var/message
	var/list/lines
	var/genital_name = get_penetrating_genital_name()
	if(is_fucking(target, CUM_TARGET_NIPPLE) && target.has_breasts() == HAS_EXPOSED_GENITAL)
		lines = list(
			"вводит его член внутрь соска <b>[target]</b> и двигается в обратном направлении.",
			"двигается внутри текущего и пухлого сосочка <b>[target]</b>, вынуждая его хлюпать и протекать.",
			"шлепает своими семянниками по груди <b>[target]</b>, как в то же время сосок прогладывает всю длинну члена."
		)
	else if(target.has_breasts() == HAS_EXPOSED_GENITAL)
		lines = list(
			"прижимает свой пульсирующий конец к пухлому соску <b>[target]</b>, вдавливая всю длину до упора с влажным шлепком.",
			"обхватывает сосок <b>[target]</b> вводит в него свой палец, после чего вводит внутрь свой [genital_name]."
		)
	else
		lines = list(
			"нежно потирает свой кончик о сосок <b>[target]</b>.",
			"шлепает своей змеей по грудь <b>[target]</b>.",
			"целует сосок <b>[target]</b> своей уретрой."
		)

	if(!is_fucking(target, CUM_TARGET_NIPPLE))
		set_is_fucking(target, CUM_TARGET_NIPPLE, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]!</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(src, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_NIPPLE, target, ORGAN_SLOT_PENIS)
	target.handle_post_sex(NORMAL_LUST, null, src, ORGAN_SLOT_BREASTS)

/mob/living/proc/do_thighfuck(mob/living/target, spillage = TRUE,)
	var/message
	var/list/lines

	if(is_fucking(target, CUM_TARGET_THIGHS))
		lines = list(
			"входит внутрь ляжек <b>[target]</b> и выходит наружу, заставляя бёдра трястись как желе.",
			"похотливо скользит своим членом туда-сюда между бёдер <b>[target]</b>",
			"решительно трахает ноги \the <b>[target]</b>, заставляя свой кончик проталкиваться взад-вперед между этих упругих ляжек."
		)
	else
		lines = list(
			"прижимает свой кончик к мягким ляжкам <b>[target]</b>, вскоре проталкивая всю длинну прямо между ними.",
			"подставляет свой член к ногам <b>[target]</b>, вонзая во весь его размер в объятия бёдер.",
			"целует междуножье <b>[target]</b> своим кончиком, прямо перед тем как протиснуться между бёдер всем членом."
		)
		set_is_fucking(target, CUM_TARGET_THIGHS, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]!</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_THIGHS, target, ORGAN_SLOT_PENIS)
	target.handle_post_sex(LOW_LUST, CUM_TARGET_PENIS, src)

/mob/living/proc/do_thighjob(mob/living/target)
	var/message
	var/list/lines

	if(target.is_fucking(src, CUM_TARGET_THIGHS))
		lines = list(
			"потирает и прижимает бедра к члену <b>[target]</b>, массажируя всю длинну с помощью ляжек.",
			"сдавливает член <b>[target]</b> между своими упругими бедрами, придушивая его прямо под своей промежностью.",
			"скачет на члене <b>[target]</b> своими мягкими ляжками, позволяя ощутить эту душащую плоть."
		)
	else
		lines = list(
			"представляет свои мягкие ляжки <b>[target]</b>, вдалбливая член прямо между ними с смачным шлепком.",
			"проводит кончиком члена <b>[target]</b> по упругим бедрам, перед тем как позволить стержню вломиться меж ними.",
			"загоняет член <b>[target]</b> прямо в крепкий захват своих ляжек, глубоко и непристойно сжимая его."
		)
		target.set_is_fucking(src, CUM_TARGET_THIGHS, target.getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(lines)]!</span>"
	visible_message(message, ignored_mobs = get_unconsenting())
	playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang1.ogg',
								'modular_sand/sound/interactions/bang2.ogg',
								'modular_sand/sound/interactions/bang3.ogg'), 70, 1, -1)
	handle_post_sex(LOW_LUST, CUM_TARGET_PENIS, target)
	if(target.can_penetrating_genital_cum())
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_THIGHS, src, ORGAN_SLOT_PENIS)

////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// 									U N H O L Y										   /////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
/mob/living/proc/do_facefart(mob/living/carbon/target)
	var/message
	//var/t_His = target.ru_ego()
	//var/u_His = ru_ego()
	//var/u_He = ru_who()

	//var/list/asscheeks = list("asscheeks", "buttcheeks", "ass buns", "booty pillows", "dumptruck spheres", "[pick(list("jiggly", "bouncy", "wobbly"))] buttocks")
	//var/list/ass = list("ass", "butt", "dumptruck", "tush", "badonk", "booty", "rump")
	//var/jiggle = "[u_His] [pick(asscheeks)] [pick(list("jiggle", "bounce", "bounce around", "wobble"))] like crazy!"
	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	/*var/list/braps = list(
		"выдает массивный, зловонный метеоризм.",
		"громко разрывает задницу, выпуская клуб пахнущего газа.",
		"выпусакет немного вонючего газа.",
		"сбрасывает вонючую газовую бомбу.",
		"позволяет заднице расслабиться, выпуская ненормальное количество зловонного облака газа."
	)*/
	var/list/hell = list(
		" вжимается жопой в лицо <b>[target]</b>, сжимая анус и позволяет грому разреветься!",
		" толкает свою задницу на лицо <b>[target]</b>, зарывая нос в вонючую дырочку, как оттуда сразу же вырывается поток газа.",
		" душит <b>[target]</b>, зажимая целую голову между пахущих ягодиц, выталкивая оттуда дуновения зловония.",
		" задницей шлепает о нос <b>[target]</b>, прямо перед тем как смачно позволить аду вырваться на свободу."
	)

	message = "<span class='lewd'>\The <b>[src]</b>[pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/assbrap1.ogg',
						'modular_bluemoon/sound/interactions/assbrap2.ogg',
						'modular_bluemoon/sound/interactions/assbrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	if(!is_fucking(target, GRINDING_FACE_WITH_ANUS))
		set_is_fucking(target, GRINDING_FACE_WITH_ANUS, null)
	handle_post_sex(LOW_LUST, null, src)

/mob/living/proc/do_crotchfart(mob/living/carbon/target)
	var/message

	var/list/hell = list(
		" толкает свою жопу прямо на промежность <b>[target]</b>, выдавая смачные и вонючие газы.",
		" и <b>[target]</b> могут почувствовать запах зловония, заполняющего комнату, когда жопа просачивается между ляжек <b>[target]</b>!",
		" пукает прямо на гениталии <b>[target]</b>"
	)

	message = "<span class='lewd'>\The <b>[src]</b>[pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/assbrap1.ogg',
						'modular_bluemoon/sound/interactions/assbrap2.ogg',
						'modular_bluemoon/sound/interactions/assbrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	if(!target.is_fucking(src, CUM_TARGET_ANUS))
		var/obj/item/organ/genital/genital = target.has_penis() == HAS_EXPOSED_GENITAL ? target.getorganslot(ORGAN_SLOT_PENIS) : (target.has_vagina() == HAS_EXPOSED_GENITAL ? target.getorganslot(ORGAN_SLOT_VAGINA) : null)
		target.set_is_fucking(src, CUM_TARGET_ANUS, genital)
	if(!target.has_strapon() == HAS_EXPOSED_GENITAL)
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, src)
	handle_post_sex(NORMAL_LUST, null, target)

/mob/living/proc/do_fartfuck(mob/living/target)
	var/message
	var/list/hell
	//var/t_He = target.ru_who()
	//var/t_His = target.ru_ego()
	//var/u_His = ru_ego()
	//var/u_He = ru_who()
	//var/genital_name = get_penetrating_genital_name()

	//var/list/asscheeks = list("asscheeks", "buttcheeks", "ass buns", "booty pillows", "dumptruck spheres", "[pick(list("jiggly", "bouncy", "wobbly"))] buttocks")
	//var/list/ass = list("ass", "butt", "dumptruck", "tush", "badonk", "booty", "rump")
	//var/jiggle = "[t_His] [pick(asscheeks)] [pick(list("jiggle", "bounce", "bounce around", "wobble"))] like crazy!"
	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	//var/list/stankhole = list("greasy", "stinky", "dirty", "gassy", "brapping", "noisy", "quaking", "musky")
	/*var/list/braps = list(
		"выдает массивный, зловонный метеоризм.",
		"громко разрывает задницу, выпуская клуб пахнущего газа.",
		"выпусакет немного вонючего газа.",
		"сбрасывает вонючую газовую бомбу.",
		"позволяет заднице расслабиться, выпуская ненормальное количество зловонного облака газа."
	)*/
	if(is_fucking(target, CUM_TARGET_ANUS))
		hell = list(
			"двигается внутри задницы <b>[target]</b>, вынуждая нечестивые количества зловония вырываться наружу.",
			"проникает в жопу <b>[target]</b>, заставляя метеоризм проявиться.",
			"шлепается бедрами о задницу <b>[target]</b>, вызывая массовый всплеск газа из расщелины.",
			"загоняет по самые яйца в жопу <b>[target]</b>' снова и снова, не останавливаясь выдавливать вонючие газы из раскачивающейся задницы.")
	else
		hell = list(
			"может почувствовать зловоние, когда проникает в маленькую дыру <b>[target]</b>, получая длинный и теплый заряд.",
			"хватает основание члена и прижимает кончик прямо к аналу <b>[target]</b>, действуя как клапан, выпускающий невозможное количество чистого зловония.",
			"проталкивет свой член глубоко в жопу \the <b>[target]</b>, заставляя вырваться наружу легкий поток газа.")
		set_is_fucking(target, CUM_TARGET_ANUS, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/assbrap1.ogg',
						'modular_bluemoon/sound/interactions/assbrap2.ogg',
						'modular_bluemoon/sound/interactions/assbrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg',
						'modular_sand/sound/interactions/bang4.ogg',
						'modular_sand/sound/interactions/bang5.ogg',
						'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, target, ORGAN_SLOT_PENIS)
	target.handle_post_sex(NORMAL_LUST, null, src)

/mob/living/proc/suck_fart(mob/living/target)
	var/message
	var/list/hell
	//var/t_His = target.ru_ego()
	//var/u_His = ru_ego()

	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	//var/list/stankhole = list("greasy", "stinky", "dirty", "gassy", "brapping", "noisy", "quaking", "musky")

	if(is_fucking(target, GRINDING_FACE_WITH_ANUS))
		hell = list(
			"зацеловывает и сосет отходную дыру <b>[target]</b>, проглатывая целый шквал метеоризма!",
			"проникает в анус <b>[target]</b> с помощью языка, заставляя вонь вырваться наружу!",
			"засасывает жопу <b>[target]</b>, проглатывая вонючий газ!"
		)
	else
		hell = list(
			"прижимает свое лицо прямо к заднему отверстию <b>[target]</b>, раздвигая его и начиная сбор вонючего газа!",
			"использует губы, чтобы раздвинуть грязную дырочку <b>[target]</b>, начиная высасывать все потоки метеоризма оттуда!"
		)
		set_is_fucking(target, GRINDING_FACE_WITH_ANUS, null)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/assbrap1.ogg',
						'modular_bluemoon/sound/interactions/assbrap2.ogg',
						'modular_bluemoon/sound/interactions/assbrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	target.handle_post_sex(NORMAL_LUST, null, src)

/mob/living/proc/do_faceshit(mob/living/carbon/target)
	var/message
	//var/u_His = ru_ego()
	//var/t_His = target.ru_ego()

	//var/list/asscheeks = list("asscheeks", "buttcheeks", "ass buns", "booty pillows", "dumptruck spheres", "[pick(list("jiggly", "bouncy", "wobbly"))] buttocks")
	//var/list/ass = list("ass", "butt", "dumptruck", "tush", "badonk", "booty", "rump")
	//var/jiggle = "[u_His] [pick(asscheeks)] [pick(list("jiggle", "bounce", "bounce around", "wobble"))] like crazy!"
	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	//var/list/stankhole = list("greasy", "stinky", "dirty", "gassy", "shitting", "noisy", "quaking", "musky", "messy", "shitcaked", "nasty")

	var/list/hell = list(
		"прижимает свою жопу к лицу <b>[target]</b>', покрывая все слоем коричневого цвета.",
		"убеждается в том, чтобы рот <b>[target]</b> был широко разинут, выпуская наружу жирный поток отходной жижи внутрь.",
		"придушивает лицо <b>[target]</b> между мускусными, грязными ягодицами, вводя монструозную порцию фекалий прямо в рот."
	)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/asscrap1.ogg',
						'modular_bluemoon/sound/interactions/asscrap2.ogg',
						'modular_bluemoon/sound/interactions/asscrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	if(!is_fucking(target, GRINDING_FACE_WITH_ANUS))
		set_is_fucking(target, GRINDING_FACE_WITH_ANUS, null)
	handle_post_sex(LOW_LUST, null, src)

/mob/living/proc/do_crotchshit(mob/living/carbon/target)
	var/message

	var/list/hell = list(
		"прижимает свои ягодицы к промежности <b>[target]</b>, покрывая все большим количеством теплого дерьма,",
		"пихает испражняющуюся жопу прямо к ляжкам <b>[target]</b> и покрывает все между ними скользкой жижой.",
		"некотролируемо испражняется прямо на гениталии <b>[target]</b>."
	)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/asscrap1.ogg',
						'modular_bluemoon/sound/interactions/asscrap2.ogg',
						'modular_bluemoon/sound/interactions/asscrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))

	var/obj/item/organ/genital/G = target.has_penis() == HAS_EXPOSED_GENITAL ? target.getorganslot(ORGAN_SLOT_PENIS) : (target.has_vagina() == HAS_EXPOSED_GENITAL ? target.getorganslot(ORGAN_SLOT_VAGINA) : null)
	if(!target.is_fucking(src, CUM_TARGET_ANUS))
		target.set_is_fucking(src, CUM_TARGET_ANUS, G)
	if(!target.has_strapon() == HAS_EXPOSED_GENITAL)
		target.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, src, G)
	handle_post_sex(NORMAL_LUST, null, target)

/mob/living/proc/do_shitfuck(mob/living/carbon/target)
	var/message
	//var/t_He = target.ru_who()
	//var/t_His = target.ru_ego()
	//var/u_His = ru_ego()
	//var/u_He = ru_who()
	//var/genital_name = get_penetrating_genital_name()

	var/list/hell
	//var/list/asscheeks = list("asscheeks", "buttcheeks", "ass buns", "booty pillows", "dumptruck spheres", "[pick(list("jiggly", "bouncy", "wobbly"))] buttocks")
	//var/list/ass = list("ass", "butt", "dumptruck", "tush", "badonk", "booty", "rump")
	//var/jiggle = "[t_His] [pick(asscheeks)] [pick(list("jiggle", "bounce", "bounce around", "wobble"))] like crazy!"
	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	//var/list/stankhole = list("greasy", "stinky", "dirty", "gassy", "shitting", "noisy", "quaking", "musky", "messy", "shitcaked", "nasty")

	if(is_fucking(target, CUM_TARGET_ANUS))
		hell = list(
			"толкает член внутрь и выводит наружу в смазанном дерьмом анусе <b>[target]</b>, заставляя его просвистеть и выпустить тяжелые газы и отходы.",
			"сношает жопу <b>[target]</b>, не переставая выталкивать отходы!",
			"жестко хлопается своими ляжками о ягодицы <b>[target]</b>, вызывая большой выброс навоза из этой расщелины.",
			"вгоняет по самые яйца глубого в грязную жопу <b>[target]</b> снова и снова, от чего член полностью покрывается в коричневый цвет между прыгающих ягодиц.")
	else
		hell = list(
			"чувствует вонь, пока член отрабатывает свое в навозной дырке, наслаждаясь влажным и противным ощущением.",
			"хватает основание дергающегося члена и прижимает кончик к анусу <b>[target]</b>, немедленно проталкивая его внутрь жирного и влажного входа.",
			"вталкивает член глубоко внутрь жопы <b>[target]</b>, заставляя высвободиться огромное количество кашицы, приветствуя этот стержень.")
		set_is_fucking(target, CUM_TARGET_ANUS, getorganslot(ORGAN_SLOT_PENIS))

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE), ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/asscrap1.ogg',
						'modular_bluemoon/sound/interactions/asscrap2.ogg',
						'modular_bluemoon/sound/interactions/asscrap3.ogg'),
						70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_sand/sound/interactions/bang1.ogg',
					'modular_sand/sound/interactions/bang2.ogg',
					'modular_sand/sound/interactions/bang3.ogg',
					'modular_sand/sound/interactions/bang4.ogg',
					'modular_sand/sound/interactions/bang5.ogg',
					'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	if(can_penetrating_genital_cum())
		handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, target, ORGAN_SLOT_PENIS)
	target.handle_post_sex(NORMAL_LUST, null, src)

/mob/living/proc/suck_shit(mob/living/target)
	var/message
	var/list/hell
	//var/t_His = target.ru_ego()
	//var/u_His = ru_ego()

	//var/list/stank = list("greasy", "rancid", "pungent", "rotten", "boiling hot", "wet", "nose-burning", "heavy", "dense", "thick", "stinky", "stenchy", "warm")
	//var/list/stankhole = list("greasy", "stinky", "dirty", "gassy", "brapping", "noisy", "quaking", "musky")

	if(is_fucking(target, GRINDING_FACE_WITH_ANUS))
		hell = list(
			"целует и засасывает жопу <b>[target]</b>, проглатывая целую колбасу дерьма!",
			"проникает в анус <b>[target]</b> своим языком, заставляя его испражниться прямо себе в глотку!",
		)
	else
		hell = list(
			"прижимает своё лицо к потной заднице <b>[target]</b>, поедая его дерьмо!",
			"использует свои губы чтобы открыть анус <b>[target]</b> и высосать дерьмо из его задницы своим ртом!"
		)
		set_is_fucking(target, GRINDING_FACE_WITH_ANUS, null)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/crapjob.ogg',
									'modular_bluemoon/sound/interactions/crapjob1.ogg'), 90, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	target.handle_post_sex(NORMAL_LUST, null, src, ORGAN_SLOT_ANUS)

/mob/living/proc/piss_over(mob/living/target)
	var/message
	//var/u_His = ru_ego()
	var/pee_pee = (has_penis(REQUIRE_EXPOSED) ? getorganslot(ORGAN_SLOT_PENIS) : (has_vagina(REQUIRE_EXPOSED) ? getorganslot(ORGAN_SLOT_VAGINA) : null)) //BLUEMOON ADD
	var/list/hell = list(
		"опустошает свой мочевой пузырь на тело <b>[target]</b> покрывая его тёплой мочёй",
		"покрывает тело <b>[target]</b> золотым дождём ",
		"издаёт стоны наслаждения, наблюдая как золотой дождь проливается на тело <b>[target]</b>"
	)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	//BLUEMOON EDIT START
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/watering1.ogg',
											'modular_bluemoon/sound/interactions/watering2.ogg',
											'modular_bluemoon/sound/interactions/watering3.ogg'), 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	handle_post_sex(LOW_LUST, null, target, pee_pee)
	//BLUEMOON EDIT END

/mob/living/carbon/proc/piss_mouth(mob/living/target)
	var/message
	var/pee_pee = (has_penis(REQUIRE_EXPOSED) ? getorganslot(ORGAN_SLOT_PENIS) : (has_vagina(REQUIRE_EXPOSED) ? getorganslot(ORGAN_SLOT_VAGINA) : null))
	var/list/hell = list(
		"опустошает свой мочевой пузырь в рот <b>[target]</b> наполняя его тёплой мочёй",
		"покрывает глотку <b>[target]</b> золотым дождём ",
		"издаёт стоны наслаждения, наблюдая как жёлтая жидкость проливается на губы <b>[target]</b>"
	)

	message = "<span class='lewd'>\The <b>[src]</b> [pick(hell)]</span>"
	visible_message(message, ignored_mobs = get_unconsenting(unholy = TRUE))
	//BLUEMOON EDIT START
	playlewdinteractionsound(loc, 'modular_sand/sound/interactions/swallow.ogg', 100, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	playlewdinteractionsound(target.loc, pick('modular_bluemoon/sound/interactions/watering1.ogg',
											'modular_bluemoon/sound/interactions/watering2.ogg',
											'modular_bluemoon/sound/interactions/watering3.ogg'), 70, 1, -1, ignored_mobs = get_unconsenting(unholy = TRUE))
	//BLUEMOON EDIT END
	if(!is_fucking(target, CUM_TARGET_MOUTH))
		set_is_fucking(target, CUM_TARGET_MOUTH, pee_pee)
	handle_post_sex(NORMAL_LUST, CUM_TARGET_MOUTH, target, pee_pee)
