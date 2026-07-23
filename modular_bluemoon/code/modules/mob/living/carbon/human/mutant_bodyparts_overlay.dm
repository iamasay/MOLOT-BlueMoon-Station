#define SNOUT_APPEARANCE "snout"
#define EARS_APPEARANCE "ears"
#define INSECT_WINGS_APPEARANCE "insect_wings"
#define TAUR_APPEARANCE "taur"
#define INSECT_FLUFF_APPEARANCE "insect_fluff"
#define HORNS_APPEARANCE ""

#define LAYER_TEXT list( \
	"[BODY_BEHIND_LAYER]"     = "BEHIND", \
	"[BODY_ADJ_LAYER]"        = "ADJ", \
	"[BODY_ADJ_UPPER_LAYER]"  = "ADJUP", \
	"[BODY_FRONT_LAYER]"      = "FRONT", \
	"[HORNS_LAYER]"           = "HORNS" \
)

// /mob/living/carbon/human/proc/get_overlays_copy(list/unwantedLayers)

/mob/living/carbon/human
	var/list/mutant_part_appearances = list()

/mob/living/carbon/human/proc/get_layer_from_name(mutable_appearance/MA)
	for(var/layer in LAYER_TEXT)
		var/text_mark = LAYER_TEXT[layer]
		if(findtext(MA.icon_state, text_mark))
			return layer

	return null

/mob/living/carbon/human/proc/getIconMask_with_layer(target_layer)
	if(isnull(target_layer))
		return null

	var/icon/alpha_mask = new(icon, icon_state)

	for(var/mutable_appearance/MA in overlays)
		if(MA.layer != target_layer)
			continue

		var/icon/image_overlay = new(MA.icon, MA.icon_state)

		alpha_mask.Blend(image_overlay, ICON_OR)

	return alpha_mask

/mob/living/carbon/human/proc/apply_snout_overlay(mutable_appearance/adding_MA)
	var/list/snout_icons = get_snout_appearance()
	if(!snout_icons)
		return

	for(var/mutable_appearance/base_MA in snout_icons)
		var/layer = get_layer_from_name(base_MA)
		if(isnull(layer))
			continue

		var/icon/mask = getIconMask_with_layer(layer)
		if(!mask)
			continue

		var/icon/adding_icon = new(adding_MA.icon, adding_MA.icon_state)

		adding_icon.UseAlphaMask(mask)

		var/mutable_appearance/new_MA = mutable_appearance(adding_icon)

		overlays_standing[layer] = new_MA
		apply_overlay(layer)

/mob/living/carbon/human/proc/reset_to_initial_overlay(slot)
	overlays_standing[slot] = initial(overlays_standing[slot])
	apply_overlay(slot)

/mob/living/carbon/human/proc/apply_test_overlay()
	var/icon/icon_file = 'modular_bluemoon/icons/mob/human/MOD_mask.dmi'
	var/icon/icon_state = "standard_blue"

	var/mutable_appearance/new_MA = mutable_appearance(icon_file, icon_state)
	apply_snout_overlay(new_MA)

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
