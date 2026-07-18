#define SNOUT_APPEARANCE "snout"
#define EARS_APPEARANCE "ears"
#define INSECT_WINGS_APPEARANCE "insect_wings"
#define TAUR_APPEARANCE "taur"
#define INSECT_FLUFF_APPEARANCE "insect_fluff"
#define HORNS_APPEARANCE ""



/mob/living/carbon/human
	var/list/mutant_part_appearances = list()

/mob/living/carbon/human/proc/apply_snout_overlay(icon/overlay_icon, use_mask = FALSE)
    var/list/snout_icons = get_snout_appearance()

    for(var/icon/base_icon in snout_icons)
        if(use_mask)
            var/icon/mask = getIconMask(base_icon)
            var/mutable_appearance/MA = mutable_appearance(overlay_icon.UseAlphaMask(mask))
            add_overlay(MA)
        else
            var/mutable_appearance/MA = mutable_appearance(overlay_icon)
            add_overlay(MA)

/mob/living/carbon/human/proc/apply_test_overlay()
	var/icon/icon_file = 'modular_bluemoon/icons/mob/human/MOD_mask.dmi'
	var/icon/icon_state = "standard_blue"

	var/icon/overlay_icon = icon(icon_file, icon_state)
	apply_snout_overlay(overlay_icon, TRUE)

/mob/living/carbon/human/proc/get_snout_appearance()
	return mutant_part_appearances[SNOUT_APPEARANCE] //list() front, behind, adj

/mob/living/carbon/human/proc/get_ears_appearance()
	return mutant_part_appearances[EARS_APPEARANCE]

/mob/living/carbon/human/proc/get_wings_appearance()
	return mutant_part_appearances[INSECT_WINGS_APPEARANCE]

/mob/living/carbon/human/proc/get_taur_appearance()
	return mutant_part_appearances[TAUR_APPEARANCE]

/mob/living/carbon/human/proc/get_fluff_appearance()
	return mutant_part_appearances[INSECT_FLUFF_APPEARANCE]

/mob/living/carbon/human/proc/get_horns_appearance()
	return mutant_part_appearances[HORNS_APPEARANCE]
