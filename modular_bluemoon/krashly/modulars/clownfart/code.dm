/datum/emote/living/fart/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!farted_on_something)
		if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(30))
			confettigibs(user)
			user.adjustToxLoss(-2)
			var/datum/reagent/R
			user.reagents.remove_reagent(R.type, 2)

/proc/confettigibs(atom/location)
	new /obj/effect/gibspawner/confetti(get_turf(location))

/obj/effect/gibspawner/confetti
	gibtypes = list(/obj/effect/decal/cleanable/confetti, /obj/effect/decal/cleanable/confetti)
	gibamounts = list(3, 1)
	sound_to_play = 'sound/items/party_horn.ogg'
	sound_vol = 30

/obj/effect/gibspawner/confetti/New()
	gibdirections = list(GLOB.alldirs, list())
	..()
