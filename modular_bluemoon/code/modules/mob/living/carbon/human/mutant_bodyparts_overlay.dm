#define SNOUT_APPEARANCE "snout"
#define TAIL_APPEARANCE "tail"
#define TAILWAG_APPERANCE "tailwag"
#define EARS_APPEARANCE "ears"
#define INSECT_WINGS_APPEARANCE "insect_wings"
#define TAUR_APPEARANCE "taur"
#define INSECT_FLUFF_APPEARANCE "insect_fluff"
#define HORNS_APPEARANCE ""

#define OVERLAY_ADD "add"
#define OVERLAY_REMOVE "remove"


#define LAYER_TEXT list( \
	"[BODY_BEHIND_LAYER]"     = "BEHIND", \
	"[BODY_ADJ_LAYER]"        = "ADJ", \
	"[BODY_ADJ_UPPER_LAYER]"  = "ADJUP", \
	"[BODY_FRONT_LAYER]"      = "FRONT", \
	"[HORNS_LAYER]"           = "HORNS" \
)

#define OVERLAY_LAYERS list( \
	SNOUT_APPEARANCE, \
	TAIL_APPEARANCE, \
	EARS_APPEARANCE, \
	TAILWAG_APPERANCE, \
)

//---HUMAN PROCS---

/mob/living/carbon/human
	var/list/body_front_standing

/mob/living/carbon/human
	var/list/mutant_part_appearances = list() //Хранит списки по ключам слоя. tail = list(tail_FRONT, tail_ADJ). Содержимое это mutable_apperance

/mob/living/carbon/human/proc/get_MOD_overlay_icon(icon/A, safety = TRUE, color = MOD_STANDART_COLOR, effect_icon, effect_state)
	var/icon/flat_icon = safety ? A : new(A)
	flat_icon.ColorTone(color)
	flat_icon.ChangeOpacity(0.5)
	if(effect_icon) //Может накладывать любой эффект по форме спрайта
		var/icon/alpha_mask = new(effect_icon, effect_state)
		var/icon/M = new(alpha_mask)
		flat_icon.Blend(M, ICON_ADD)
	return flat_icon

/mob/living/carbon/human/proc/apply_overlay_on_bodypart(layer, color, effect_icon, effect_state)
	var/list/target_MAs = get_appearance_by_layer(layer)
	if(!target_MAs)
		return
	var/mutable_appearance/new_MA
	for(var/mutable_appearance/base_MA in target_MAs)
		var/icon/mask = icon(base_MA.icon, base_MA.icon_state)
		if(!mask)
			continue

		var/icon/adding_icon = get_MOD_overlay_icon(mask, TRUE, color, effect_icon, effect_state)
		adding_icon.Blend(mask, ICON_UNDERLAY)
		new_MA = mutable_appearance(
			adding_icon,
			"",
			base_MA.layer,
			base_MA.plane,
			LIGHTING_PLANE_ALPHA_VISIBLE,
			base_MA.appearance_flags,
			)
		new_MA.name = layer
		overlays_standing[BODY_FRONT_LAYER] += new_MA
	return list(new_MA, layer)

/mob/living/carbon/human/proc/test_overlays()
	for(var/layer in OVERLAY_LAYERS)
		apply_overlay_on_bodypart(layer, MOD_STANDART_COLOR, 'icons/effects/effects.dmi', "scanline")

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
