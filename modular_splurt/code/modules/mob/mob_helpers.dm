// Modular-friendly way of adding new quirk-based inspect text
// Hijacks the function used for abductor examine
/mob/common_trait_examine()
	// The ever-important funny BYOND dots
	. = ..()
	// Pronoun stuff
	var/t_He = ru_who(FALSE)
	var/t_his = ru_ego()
	//var/t_is = p_are()

	// BLUEMOON ADDITION AHEAD
	// Проверка на трейт сверхтяжёлого
	if(HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY_SUPER))
		. += span_warning("Выглядит так, будто весит как машина.\n")
	// Проверка на трейт тяжёлого персонажа
	else if (HAS_TRAIT(src, TRAIT_BLUEMOON_HEAVY))
		. += span_warning("Выглядит грузно. Тащить будет сложно.\n")
	else if (HAS_TRAIT(src, TRAIT_BLUEMOON_LIGHT))
		. += span_info("С виду [t_He] весит весьма немного.\n")
	// BLUEMOON ADDITION END

	// Empathy abilities escape clause
	// Please change this when adding new quirk detection
	if(!(HAS_TRAIT(usr, TRAIT_EMPATH) || HAS_TRAIT(usr, TRAIT_FRIENDLY) || src == usr))
		return

	// Check for Distant (no touch head!)
	if(HAS_TRAIT(src, TRAIT_DISTANT))
		. += "<span class='warning'>Вы понимаете, что [t_his] может беспокоить физическая близость и вам лучше соблюдать дистанцию.</span>\n"
	// Check for Heatpat Slut (pls touch head!)
	if(HAS_TRAIT(src, TRAIT_HEADPAT_SLUT))
		. += span_info("Вы понимаете, что [t_He] ценит физическую привязанность больше, чем обычно.")

/mob/can_read(obj/O)
	// Check for D4C craving
	if(HAS_TRAIT(src, TRAIT_DUMB_CUM_CRAVE))
		// Warn user, then return
		to_chat(src, span_love("Вы пытаетесь прочитать [O], но вам приходит на ум только теплое семя.!"))
		return

	// Return normally
	. = ..()
