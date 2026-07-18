/mob/living/carbon/human/proc/cleanup_overlays()
	remove_overlay(BODY_BEHIND_LAYER)
	remove_overlay(BODY_ADJ_LAYER)
	remove_overlay(BODY_ADJ_UPPER_LAYER)
	remove_overlay(BODY_FRONT_LAYER)
	remove_overlay(HORNS_LAYER)

/mob/living/carbon/human/proc/have_tauric_body()
	if(dna.species.mutant_bodyparts["taur"] && dna.features["taur"] && dna.features["taur"] != "None")
		return TRUE
	else
		return FALSE

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

