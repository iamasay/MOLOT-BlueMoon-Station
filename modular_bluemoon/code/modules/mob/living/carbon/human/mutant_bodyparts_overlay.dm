#define SNOUT_APPEARANCE "snout"
#define TAIL_APPEARANCE "tail"
#define EARS_APPEARANCE "ears"
#define INSECT_WINGS_APPEARANCE "insect_wings"
#define TAUR_APPEARANCE "taur"
#define INSECT_FLUFF_APPEARANCE "insect_fluff"
#define HORNS_APPEARANCE ""
#define HAIR_APPEARANCE "hair"

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
	INSECT_WINGS_APPEARANCE, \
	INSECT_FLUFF_APPEARANCE, \
	TAUR_APPEARANCE, \
	HORNS_APPEARANCE, \
	HAIR_APPEARANCE, \
)

//-----MUTABLE_APPERANCE-----

//Я не знаю, как иначе передавать эффекты, не сохраняя их. Поэтому создал переменные
/mutable_appearance
	var/color_tone
	var/used_effect_icon
	var/used_effect_state

//Этот прок важен для пересоздания точно такого же оверлея
//Он сохраняет наложенный эффект,цвет и т.д.
/mutable_appearance/proc/copy_special_MA_params(layer, color, effect_icon, effect_state)
	var/list/params = list()
	params += isnull(layer) ? src.name : layer
	params += isnull(color) ? color_tone : color
	params += isnull(effect_icon) ? used_effect_icon : effect_icon
	params += isnull(effect_state) ? used_effect_state : effect_state
	return params

//---HUMAN PROCS---

/mob/living/carbon/human
	var/list/mutant_part_appearances = list() //Хранит списки по ключам слоя. tail = list(tail_FRONT, tail_ADJ). Содержимое это mutable_apperance
	var/list/layers_need_to_be_overlayed = list()

//По сути, просто берёт иконку, красит её в цвет, в половину меняет прозрачность и накладывает эффект через блэнд.
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
	for(var/mutable_appearance/base_MA in target_MAs)
		if(!(layer in layers_need_to_be_overlayed))
			layers_need_to_be_overlayed[layer] = list(layer, color, effect_icon, effect_state)

/mob/living/carbon/human/proc/remove_overlay_from_bodypart(layer)
	for(var/mutable_appearance/overlay in overlays_standing[SPECIAL_OVERLAYS_LAYER])
		if(overlay.name == layer)
			overlays_standing[SPECIAL_OVERLAYS_LAYER] -= overlay

/mob/living/carbon/human/proc/make_overlayed(mutable_appearance/accessory_overlay, list/tail_params)
	if(!accessory_overlay)
		return FALSE
	var/icon/tail_icon = icon(accessory_overlay.icon, accessory_overlay.icon_state)
	var/icon/tail_with_effect
	var/color
	if(tail_params[2])
		color = BlendRGB(accessory_overlay.color, tail_params[2])
	var/effect_icon = tail_params[3]
	var/effect_icon_state = tail_params[4]
	tail_with_effect = get_MOD_overlay_icon(tail_icon, TRUE, tail_params[2], effect_icon, effect_icon_state)
	if(tail_with_effect)
		var/icon/initial_icon = icon(accessory_overlay.icon, accessory_overlay.icon_state)
		initial_icon.Blend(tail_icon, ICON_OVERLAY)
		if(accessory_overlay.color && color)
			initial_icon.ColorTone(color)
		return mutable_appearance(
			initial_icon,
			"",
			accessory_overlay.layer,
			accessory_overlay.plane,
			accessory_overlay.alpha,
			accessory_overlay.appearance_flags,
			)

/mob/living/carbon/human/proc/apply_all_overlays()
	for(var/layer in OVERLAY_LAYERS)
		apply_overlay_on_bodypart(layer, MOD_STANDART_COLOR, 'icons/effects/effects.dmi', "scanline")
	dna.species.handle_mutant_bodyparts(src)
	update_hair(src)

/datum/species/proc/update_overlay_by_key(key, mob/living/carbon/human/H, mutable_appearance/accessory_overlay)

	if(!H.layers_need_to_be_overlayed[key])
		return accessory_overlay // <--отдаёт то же самое, что попало на вход, т.к нет необходимости модифицировать

	var/overlay_params = H.layers_need_to_be_overlayed[key]
	accessory_overlay = H.make_overlayed(accessory_overlay, overlay_params)

	return accessory_overlay // <-- а тут уже с оверлеем, модифицированная версия

/datum/species/proc/save_part_appearance(mob/living/carbon/human/H, mutant_part_string, accessory_overlay)
	if(!H.mutant_part_appearances[mutant_part_string])
		H.mutant_part_appearances[mutant_part_string] = list()
	H.mutant_part_appearances[mutant_part_string] += accessory_overlay

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
