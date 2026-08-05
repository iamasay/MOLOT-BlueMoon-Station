#define SNOUT_APPEARANCE "snout"
#define TAIL_APPEARANCE "tail"
// #define TAILWAG_APPERANCE "tailwag"
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
)

//Пояснение:
//Любой overlay должен быть добавлен в overlays_standing по своему месту, на индекс
//Делать apply_overlay лишний раз - плохо, если нет гарантии, что добавленные оверлеи будут очищены корректно
//Внутри handle_mutant_bodyparts сначала все спрайты очищаются, потом добавляются вновь и делают это послойно
//Нёт чёткого разделения на то, нужно ли обновить конкретно хвост, или морду. Обновляется тупо всё, так как перебирается циклом.

// Наложение оверлея работает вполне просто. Копируется спрайт целевой части тела, эффект обрезается под его форму
//добавляется в свой слой на overlays_standing и производится apply. В handle_mutant_bodyparts стоит условие, позволяющее
//перерисовать оверлеи, добавленные таким способом, если они вообще есть.

//Минусы: Невозможно синхронизировать хвост. Не прописано таргетное исключение конкретных оверлеев.(легко исправить, но не приоритет)
// По какой-то причине оверлей обрезается под хвост так,что он максимально неккоретно анимируется. Дёргано, рвано.
// В теории, если была бы возможность максимально чётко обрезать его с нулевой секунды анимации, то проблемы синхронизации бы не было
//Однако, это невозможно. Убрать сам хвост попросту недостаточно, так как анимация именно оверлея рваная.

//Возможное решение: Красить сам хвост напрямую в целевой цвет и накидывать на него эффект через блэнд.
// такое решение является абсолютным архитектурным костылём, ведь тогда обработка эксклюзивно хвоста будет отличатсья ото всего остального.
// да и вообще не факт, что оно будет работать, но звучит как то, что должно работать.

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

//ВАЖНО: Данный proc создаёт видимый overlay на основе видимой части тела. Если части тела нет, то оверлея тоже не будет.
// тут нужно обращать на переменную mutant_part_appearances, которая записывается внутри handle_mutant_bodyparts
//Каждый раз, когда handle_mutant_bodyparts вызывается, то и содержимое handle_mutant_bodyparts меняется(Наличие/отсутствие ключей в нём)
/mob/living/carbon/human/proc/apply_overlay_on_bodypart(layer, color, effect_icon, effect_state)
	var/list/target_MAs = get_appearance_by_layer(layer)
	if(!target_MAs)
		return
	var/mutable_appearance/new_MA
	for(var/mutable_appearance/base_MA in target_MAs)
		var/icon/mask = icon(base_MA.icon, base_MA.icon_state)
		// if(layer == TAILWAG_APPERANCE && target_MAs)
		// 	mask = rebuild_tailwag(base_icon_state)
		if(!mask)
			continue

		var/icon/adding_icon = get_MOD_overlay_icon(mask, TRUE, color, effect_icon, effect_state)
		new_MA = mutable_appearance(
			adding_icon,
			"",
			base_MA.layer,
			base_MA.plane,
			LIGHTING_PLANE_ALPHA_VISIBLE,
			base_MA.appearance_flags,
			)
		new_MA.name = layer
		new_MA.color_tone = color
		new_MA.used_effect_icon = effect_icon
		new_MA.used_effect_state = effect_state
		if(!overlays_standing[SPECIAL_OVERLAYS_LAYER])
			overlays_standing[SPECIAL_OVERLAYS_LAYER] = list()
		overlays_standing[SPECIAL_OVERLAYS_LAYER] += new_MA
	return list(new_MA, layer)

// /mob/living/carbon/human/proc/rebuild_tailwag(target_icon_state) //Не выдаёт иконку
// 	var/list/bodyparts_to_add = dna.species.mutant_bodyparts.Copy()
// 	var/target_part = "mam_waggingtail"
// 	if(target_part in bodyparts_to_add)
// 		var/reference_list = GLOB.mutant_reference_list[target_part]
// 		if(reference_list)
// 			var/datum/sprite_accessory/S
// 			var/transformed_part = GLOB.mutant_transform_list[target_part]
// 			if(transformed_part)
// 				S = reference_list[dna.features[transformed_part]]
// 			else
// 				S = reference_list[dna.features[target_part]]

// 			var/icon/accessory_overlay = icon(S.icon, target_icon_state)
// 			return accessory_overlay

/mob/living/carbon/human/proc/build_overlays()
	for(var/layer in OVERLAY_LAYERS)
		apply_overlay_on_bodypart(layer, MOD_STANDART_COLOR, 'icons/effects/effects.dmi', "scanline")
	apply_overlay(SPECIAL_OVERLAYS_LAYER)

/mob/living/carbon/human/proc/get_appearance_by_layer(layer)
	return mutant_part_appearances[layer]
