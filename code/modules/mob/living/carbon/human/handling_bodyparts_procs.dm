/mob/living/carbon/human/proc/cleanup_overlays()
	remove_overlay(BODY_BEHIND_LAYER)
	remove_overlay(BODY_ADJ_LAYER)
	remove_overlay(BODY_ADJ_UPPER_LAYER)
	remove_overlay(BODY_FRONT_LAYER)
	remove_overlay(HORNS_LAYER)
	remove_overlay(SPECIAL_OVERLAYS_LAYER)

/mob/living/carbon/human/proc/add_all_overlays()
	apply_overlay(BODY_BEHIND_LAYER)
	apply_overlay(BODY_ADJ_LAYER)
	apply_overlay(BODY_ADJ_UPPER_LAYER)
	apply_overlay(BODY_FRONT_LAYER)
	apply_overlay(HORNS_LAYER)
	// apply_overlay(SPECIAL_OVERLAYS_LAYER)

/mob/living/carbon/human/proc/have_tauric_body()
	if(dna.species.mutant_bodyparts["taur"] && dna.features["taur"] && dna.features["taur"] != "None")
		return TRUE
	else
		return FALSE

/mob/living/carbon/human/proc/handle_overlay_tailwag(list/overlays_to_add, mutable_appearance/tail_overlay, tail_type)
	switch(tail_type)
		if("tailwag")
			var/list/overlay_options = tail_overlay.copy_special_MA_params(layer = "tailwag")
			apply_overlay_on_bodypart(arglist(overlay_options))
		if("tail")
			var/list/overlay_options = tail_overlay.copy_special_MA_params(layer = "tail")
			apply_overlay_on_bodypart(arglist(overlay_options))
	to_chat(src, "[tail_type]")

/datum/species/proc/search_coiling_action(mob/living/carbon/human/H)
	for(var/datum/action/A in H.actions)
		if(A.type == /datum/action/innate/ability/coiling)
			return A

/datum/species/proc/grant_of_remove_coiling_action(mob/living/carbon/human/H, datum/action/found_action, var/tauric)
	if(found_action && (!tauric || (H.dna.features["taur"] != "Naga" && H.dna.features["taur"] != "Naga (coiled)")))
		found_action.Remove(H)

	if(!found_action && tauric && (H.dna.features["taur"] == "Naga" || H.dna.features["taur"] == "Naga (coiled)"))
		found_action = new /datum/action/innate/ability/coiling()
		found_action.Grant(H)
