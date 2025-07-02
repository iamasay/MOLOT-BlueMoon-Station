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
