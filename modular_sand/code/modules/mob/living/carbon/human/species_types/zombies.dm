// BLUEMOON ADD START
/datum/species/zombies/New()
	. = ..()
	var/modular_inherent_traits = list(CAN_BE_OPERATED_WITHOUT_PAIN)
	LAZYADD(inherent_traits, modular_inherent_traits)

/datum/species/zombies/notspaceproof/New()
	. = ..()
	var/modular_inherent_traits = list(CAN_BE_OPERATED_WITHOUT_PAIN)
	LAZYADD(inherent_traits, modular_inherent_traits)

/datum/species/zombies/infectious/New()
	. = ..()
	var/modular_inherent_traits = list(CAN_BE_OPERATED_WITHOUT_PAIN)
	LAZYADD(inherent_traits, modular_inherent_traits)
// BLUEMOON ADD END
