GLOBAL_LIST_INIT(mutant_overlays_cache, list())

#define SNOUT_APPEARANCE "snout"
#define TAIL_APPEARANCE "tail"
#define EARS_APPEARANCE "ears"
#define INSECT_WINGS_APPEARANCE "insect_wings"
#define TAUR_APPEARANCE "taur"
#define INSECT_FLUFF_APPEARANCE "insect_fluff"
#define HORNS_APPEARANCE ""
#define HAIR_APPEARANCE "hair"

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
	var/list/layers_for_apply_effect = list()

//По сути, просто берёт иконку, красит её в цвет, в половину меняет прозрачность и накладывает эффект через блэнд.
/mob/living/carbon/human/proc/get_MOD_overlay_icon(icon/A, safety = TRUE, color = MOD_STANDART_COLOR, effect_icon, effect_state)
	var/icon/flat_icon = safety ? A : new(A)
	flat_icon.ChangeOpacity(0.5)
	flat_icon.Scale(A.Width(), A.Height())
	if(effect_icon) //Может накладывать любой эффект по форме спрайта
		var/icon/alpha_mask = new(effect_icon, effect_state)
		var/icon/M = new(alpha_mask)
		flat_icon.Blend(M, ICON_ADD)
	return flat_icon

/mob/living/carbon/human/proc/apply_overlay_on_bodypart(layer, color, effect_icon, effect_state)
	if(!(layer in layers_for_apply_effect))
		layers_for_apply_effect[layer] = list(layer, color, effect_icon, effect_state)

/mob/living/carbon/human/proc/use_effect_by_params(mutable_appearance/accessory_overlay, list/tail_params)
	//в этом proc-е происходит творческий беспорядок. Я уберу, правда.
	if(!accessory_overlay)
		return FALSE
	var/icon/tail_icon = icon(accessory_overlay.icon, accessory_overlay.icon_state)
	var/icon/tail_with_effect
	var/icon/initial_icon
	var/color
	if(tail_params[2])
		color = BlendRGB(accessory_overlay.color, tail_params[2])
	var/effect_icon = tail_params[3]
	var/effect_icon_state = tail_params[4]
	var/cache_list_key = "[accessory_overlay.icon][accessory_overlay.icon_state][effect_icon][effect_icon_state][color]"
	if(cache_list_key in GLOB.mutant_overlays_cache)
		initial_icon = GLOB.mutant_overlays_cache[cache_list_key]
	else
		tail_with_effect = get_MOD_overlay_icon(tail_icon, TRUE, tail_params[2], effect_icon, effect_icon_state)
		if(tail_with_effect)
			initial_icon = icon(accessory_overlay.icon, accessory_overlay.icon_state)
			initial_icon.Blend(tail_icon, ICON_OVERLAY)
			if(accessory_overlay.color && color)
				initial_icon.ColorTone(color)
			GLOB.mutant_overlays_cache[cache_list_key] = initial_icon
	return mutable_appearance(
		initial_icon,
		"",
		accessory_overlay.layer,
		accessory_overlay.plane,
		accessory_overlay.alpha,
		accessory_overlay.appearance_flags,
		pixel_x = accessory_overlay.pixel_x,
		pixel_y = accessory_overlay.pixel_y
		)

/mob/living/carbon/human/proc/apply_bodypart_overlays(list/layers, color, update = TRUE)
	var/list/target_layers = layers ? layers : OVERLAY_LAYERS //если подали на вход, то юзаем то, что подали. Если нет - то дефолт все.
	for(var/layer in target_layers)
		apply_overlay_on_bodypart(layer, color, 'icons/effects/effects.dmi', "scanline")
	if(update)
		regenerate_icons()

/mob/living/carbon/human/proc/clear_bodypart_overlays(update = TRUE)
	layers_for_apply_effect = list()
	if(update)
		regenerate_icons()

/mob/living/carbon/human/proc/remove_overlay_by_bodypart_key(key, need_update_body)
	if(key in layers_for_apply_effect)
		layers_for_apply_effect -= key
		if(need_update_body)
			regenerate_icons()
		return TRUE
	return FALSE

/datum/species/proc/update_overlay_by_key(key, mob/living/carbon/human/H, mutable_appearance/accessory_overlay)

	if(!H.layers_for_apply_effect[key])
		return accessory_overlay // <--отдаёт то же самое, что попало на вход, т.к нет необходимости модифицировать

	var/overlay_params = H.layers_for_apply_effect[key]
	accessory_overlay = H.use_effect_by_params(accessory_overlay, overlay_params)

	return accessory_overlay // <-- а тут уже с оверлеем, модифицированная версия

/datum/species/proc/save_part_appearance(mob/living/carbon/human/H, mutant_part_string, accessory_overlay)
	if(!H.mutant_part_appearances[mutant_part_string])
		H.mutant_part_appearances[mutant_part_string] = list()
	H.mutant_part_appearances[mutant_part_string] += accessory_overlay

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
