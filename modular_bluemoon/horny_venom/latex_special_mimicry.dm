/datum/action/cooldown/latexmob/mimicry
	var/list/list_of_shapes = list()

/mob/living/simple_animal/latexmob/proc/check_type_for_mimicry(object_type, list/avaible_types)
	for(var/obj/avaible_object in avaible_types)
		to_chat(src, "[avaible_object.type] + [object_type]")
		if(object_type == avaible_object.type)
			return TRUE

	src.balloon_alert(src, "Цель недоступна для копирования в текущий момент!")
	return FALSE

/mob/living/simple_animal/latexmob/proc/do_mimicry(appearance_to_copy, type_of_copied, list/list_of_shapes, mimicry_datum_type)
	var/turf/current_location
	if(isturf(src.loc))
		current_location = src.loc
		var/obj/mimicry_object =  new type_of_copied(current_location)
		var/some_one = mimicry_object.LoadComponent(mimicry_datum_type)
		to_chat(src, "[some_one]")

	if(!current_location)
		return

/mob/living/simple_animal/latexmob/proc/go_back()
