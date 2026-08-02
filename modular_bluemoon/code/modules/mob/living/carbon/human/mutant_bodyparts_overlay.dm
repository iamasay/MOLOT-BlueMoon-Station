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
	var/list/test_var = list()
	var/list/test_overlay_to_remove = list()
	var/list/body_front_standing

/mob/living/carbon/human/proc/save_special_overlays()
	var/list/special_overlays_to_copy = list()
	var/list/body_front_layers = overlays_standing[BODY_FRONT_LAYER]
	var/list/colors = list()
	var/list/effect_icons = list()
	var/list/effect_states = list()

	for(var/mutable_appearance/overlay in body_front_layers)
		if(!overlay)
			continue

		if(overlay.name in OVERLAY_LAYERS)
			special_overlays_to_copy += overlay
			colors += overlay.color_tone
			effect_icons += overlay.used_effect_icon
			effect_states += overlay.used_effect_state

	return list(special_overlays_to_copy, colors, effect_icons, effect_states)

/mob/living/carbon/human/proc/apply_copied_special_overlays(list/special_overlays_to_copy, list/colors, list/effect_icons, list/effect_states)
	if(special_overlays_to_copy)
		for(var/special_overlay in special_overlays_to_copy)
			var/color = pick(colors)
			var/effect_icon = pick(effect_icons)
			var/effect_state = pick(effect_states)
			apply_overlay_on_bodypart(special_overlay, color, effect_icon, effect_state)

/mob/living/carbon/human
	var/list/mutant_part_appearances = list() //Хранит списки по ключам слоя. tail = list(tail_FRONT, tail_ADJ). Содержимое это mutable_apperance

/mob/living/carbon/human/proc/remove_or_add_overlay_by_list(overlays_list, layer_name, mode)
	switch(mode)
		if(OVERLAY_REMOVE)
			// cut_overlay(overlays_list)
			for(var/mutable_appearance/overlay in overlays_list)
				overlays_standing[BODY_FRONT_LAYER] -= overlay
		if(OVERLAY_ADD)
			for(var/mutable_appearance/overlay in overlays_list)
				overlays_standing[BODY_FRONT_LAYER] += overlay //фактически добавится только после handle_mutant_bodyparts

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
	var/list/body_front_overlays = overlays_standing[BODY_FRONT_LAYER]

	for(var/mutable_appearance/overlay in body_front_overlays)
		if(!overlay)
			continue

		if(overlay.name == layer_name)
			overlays_to_return += overlay

	test_overlay_to_remove = overlays_to_return
	return overlays_to_return

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
	for(var/message in overlays_to_remove)
		to_chat(src, "removing: [message]")
	remove_or_add_overlay_by_list(overlays_to_remove, removing_layer, OVERLAY_REMOVE)
	apply_overlay_on_bodypart(arglist(MA_args))

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
		overlays_standing[BODY_FRONT_LAYER] += new_MA
	return list(new_MA, layer)

/mob/living/carbon/human/proc/test_overlays()
	for(var/layer in OVERLAY_LAYERS)
		apply_overlay_on_bodypart(layer, MOD_STANDART_COLOR, 'icons/effects/effects.dmi', "scanline")

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
