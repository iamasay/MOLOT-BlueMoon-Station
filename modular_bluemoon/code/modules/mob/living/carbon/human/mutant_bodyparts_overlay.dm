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

#define LAYERS list( \
	SNOUT_APPEARANCE, \
	TAIL_APPEARANCE, \
	EARS_APPEARANCE, \
	TAILWAG_APPERANCE, \
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

/mob/living/carbon/human/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TOGGLE_TAILWAG, PROC_REF(handle_tailwag)) //для виляния необходима жёсткая синхронизация.

//update_body в дефолте просто накладывал спрайты поверх оверлея. Чтобы этого не происходило
//приходится перерисовывать их при каждом обновлении тела.
/mob/living/carbon/human/update_body(update_genitals, block_recursive_calls)
	. = ..()
	regenerate_overlays() //удаляет и рисует заново оверлеи

/mob/living/carbon/human/proc/regenerate_overlays()
	var/list/overlays_copy = list()
	for(var/layer_name in mutant_part_appearances)
		var/list/overlays_by_layer = get_special_overlay_by_name(layer_name)
		if(!overlays_by_layer)
			continue
		for(var/mutable_appearance/overlay in overlays_by_layer)
			if(overlay)
				overlays -= overlay
				if(!overlays_copy[layer_name])
					overlays_copy[layer_name] = list()
				overlays_copy[layer_name] += overlay
				remove_overlay(layer_name)
	for(var/layer in overlays_copy)
		remove_or_add_overlay_by_list(overlays_copy[layer], layer, OVERLAY_ADD)//по индексу лежит список конкретного ключа. Например tail

/mob/living/carbon/human/proc/remove_or_add_overlay_by_list(overlays_list, layer_name, mode)
	for(var/mutable_appearance/overlay in overlays_list)
		switch(mode)
			if(OVERLAY_REMOVE)
				overlays -= overlay
				remove_overlay(layer_name)
			if(OVERLAY_ADD)
				overlays_standing[layer_name] = overlay
				apply_overlay(layer_name)

/mob/living/carbon/human/proc/get_MOD_overlay_icon(icon/A, safety = TRUE, color = MOD_STANDART_COLOR, effect_icon, effect_state)
	var/icon/flat_icon = safety ? A : new(A)
	flat_icon.ColorTone(color)
	flat_icon.ChangeOpacity(0.5)
	if(effect_icon) //Может накладывать любой эффект по форме спрайта
		var/icon/alpha_mask = new(effect_icon, effect_state)
		var/icon/M = new(alpha_mask)
		flat_icon.Blend(M, ICON_ADD)
	return flat_icon

/mob/living/carbon/human/proc/get_special_overlay_by_name(layer_name)
	var/list/overlays_to_return = list()
	for(var/mutable_appearance/overlay in overlays)
		if(overlay.name == layer_name)
			overlays_to_return += overlay
	return overlays_to_return

/mob/living/carbon/human/proc/handle_tailwag(datum/source, params)
    SIGNAL_HANDLER
    toggle_tailwagging_overlay(params)

/mob/living/carbon/human/proc/toggle_tailwagging_overlay(params)
	var/removing_layer
	var/target_layer
	var/list/overlays_to_remove = list()
	var/mutable_appearance/picked_MA
	switch(params)
		if(WAGGING_START)
			removing_layer = TAIL_APPEARANCE
			target_layer = TAILWAG_APPERANCE
			overlays_to_remove = get_special_overlay_by_name(removing_layer)
		if(WAGGING_STOP)
			removing_layer = TAILWAG_APPERANCE
			target_layer = TAIL_APPEARANCE
			overlays_to_remove = get_special_overlay_by_name(removing_layer)

	picked_MA = pick(overlays_to_remove)
	var/list/MA_args = picked_MA.copy_special_MA_params(target_layer)
	apply_overlay_on_bodypart(arglist(MA_args))
	remove_or_add_overlay_by_list(overlays_to_remove, removing_layer, OVERLAY_REMOVE)

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
		new_MA.color_tone = color
		new_MA.used_effect_icon = effect_icon
		new_MA.used_effect_state = effect_state
		new_MA.name = layer
		overlays_standing[layer] = new_MA
		apply_overlay(layer)
	return list(new_MA, layer)

/mob/living/carbon/human/proc/test_overlays()
	for(var/layer in LAYERS)
		apply_overlay_on_bodypart(layer, MOD_STANDART_COLOR, 'icons/effects/effects.dmi', "scanline")

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
