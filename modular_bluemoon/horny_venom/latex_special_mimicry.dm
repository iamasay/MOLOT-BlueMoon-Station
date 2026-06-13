/datum/action/cooldown/latexmob/mimicry
	var/list/list_of_shapes = list()

/mob/living/simple_animal/latexmob/proc/check_type_for_mimicry(atom, list/avaible_types)
	for(var/typepath in avaible_types)
		if(istype(atom, typepath))
			return TRUE
		src.balloon_alert(src, "Цель недоступна для копирования в текущий момент!")
		return FALSE

/mob/living/simple_animal/latexmob/proc/do_mimicry(appearance_to_copy, type_of_copied, list/list_of_shapes)
	var/turf/current_location
	if(isturf(src.loc))
		current_location = src.loc
		new type_of_copied(current_location)
	if(!current_location)
		return

/mob/living/simple_animal/latexmob/proc/go_back()
