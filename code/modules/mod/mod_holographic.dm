/datum/mod_theme/holographic
	name = "Holographic MOD"
	desc = "Герметичный голографический MOD без защиты от холода."
	extended_desc = "Проекторы создают герметичную оболочку по форме тела носителя. Во включённом состоянии голограммы нельзя скрыть. Для дыхания нужен отдельный источник кислорода."
	default_skin = "standard"
	armor_type = /datum/armor/none
	complexity_max = 4
	min_cold_protection_temperature = null
	max_heat_protection_temperature = null
	hide_worn_sprites = TRUE
	body_hardlight = TRUE
	locked_hardlight = TRUE
	hardlight_color = COLOR_CYAN
	inbuilt_modules = list(/obj/item/mod/module/holographic)
	skins = list("standard" = MOD_PRESET_DEFAULT)

/datum/mod_theme/holographic/New()
	. = ..()
	var/list/preset = skins[default_skin]
	preset[HELMET_FLAGS][UNSEALED_INVISIBILITY] = NONE
	preset[HELMET_FLAGS][SEALED_INVISIBILITY] = NONE
	preset[CHESTPLATE_FLAGS][SEALED_INVISIBILITY] = NONE

/obj/item/mod/control/pre_equipped/holographic
	theme = /datum/mod_theme/holographic

/obj/item/mod/control/pre_equipped/holographic/Initialize(mapload, new_theme, new_skin)
	. = ..()
	name = "Holographic MOD"

/obj/item/mod/control/build_worn_icon(default_layer = 0, default_icon_file = null, isinhands = FALSE, femaleuniform = NO_FEMALE_UNIFORM, override_state, style_flags = NONE, use_mob_overlay_icon = TRUE, alpha_mask)
	if(!isinhands && theme?.hide_worn_sprites && !visual_skin)
		return mutable_appearance('icons/effects/effects.dmi', "nothing", layer = -default_layer)
	return ..()

/obj/item/clothing/mod_part/build_worn_icon(default_layer = 0, default_icon_file = null, isinhands = FALSE, femaleuniform = NO_FEMALE_UNIFORM, override_state, style_flags = NONE, use_mob_overlay_icon = TRUE, alpha_mask)
	if(!isinhands && mod?.theme?.hide_worn_sprites && !mod.visual_skin)
		return mutable_appearance('icons/effects/effects.dmi', "nothing", layer = -default_layer)
	return ..()

/obj/item/mod/module/holographic
	name = "MOD holographic field projector"
	desc = "Создаёт герметичный голографический костюм без теплоизоляции."
	icon_state = "rad_protection"
	removable = FALSE

/obj/item/mod/module/holographic/on_install()
	. = ..()
	mod.need_to_conseal |= GLOB.body_hardlight_layers
	mod.need_to_conseal |= GLOB.mutant_overlay_layers

