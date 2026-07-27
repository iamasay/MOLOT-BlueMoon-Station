#define MOD_STANDART_COLOR rgb(140, 192, 235, 213)
#define MOD_SYNDICATE_COLOR rgb(243, 70, 57)
#define MOD_INTEQ_COLOR rgb(245, 117, 32)
#define MA_INDEX 1
#define LAYER_INDEX 2

/obj/item/mod/control
	var/list/need_to_conseal = list()
	var/hardlight_color = MOD_STANDART_COLOR
	var/list/hardlight_in_use = list()

/obj/item/mod/control/conceal(mob/user, part)
	. = ..()
	remove_hardlight()
	helmet.visor_flags_inv = initial(helmet.visor_flags_inv)
	wearer.regenerate_icons()

/obj/item/mod/control/toggle_activate(mob/user, force_deactivate)
	. = ..()
	if(activating)
		update_hardlight()
		return

	remove_hardlight()

/obj/item/mod/control/deploy(mob/user, part)
	. = ..()
	if(hardlight_in_use)
		helmet.visor_flags_inv = null
		wearer.update_inv_head()
		update_hardlight()

/obj/item/mod/control/proc/update_hardlight()
	for(var/part in need_to_conseal)
		var/list/result = wearer.apply_overlay_on_bodypart(part, hardlight_color)
		hardlight_in_use["[result[LAYER_INDEX]]"] = result[MA_INDEX]

/obj/item/mod/control/proc/remove_hardlight(var/index)
	if(!index)
		for(var/hardlight in hardlight_in_use)
			wearer.overlays_standing[hardlight[LAYER_INDEX]] -= hardlight[MA_INDEX]
			wearer.remove_overlay(hardlight[LAYER_INDEX])
			wearer.update_inv_back()
		return
	var/mutable_appearance/target_MA = hardlight_in_use[index]
	wearer.overlays_standing[index] -= target_MA
	wearer.remove_overlay(index)

// /datum/action/item_action/mod/hardlight_deploy/chooce_color
// 	name = "Choice hardlight color"
// 	button_icon_state = "color"
// 	var/modsuit_color

// /datum/action/item_action/mod/hardlight_deploy/chooce_color/Trigger(trigger_flags)
// 	var/chosen_colour = input(mod.wearer, "", "Choose Color", modsuit_color) as color|null
// 	mod.hardlight_color = chosen_colour

/datum/action/item_action/mod/hardlight_deploy
	name = "Activate Hardlight field"
	icon_icon = 'modular_bluemoon/icons/mob/actions/mod_radial.dmi'
	button_icon_state = "open"
	var/list/radial_menu_choises

/datum/action/item_action/mod/hardlight_deploy/Trigger(trigger_flags)
	. = ..()
	if(!radial_menu_choises)
		radial_menu_choises = list( //Я не знаю почему, но дефайны тут не резолвятся в райнтайме. Я того рот наоборот.
			"ears" = new /image(icon_icon, "ears"),
			"snout" = new /image(icon_icon, "snout"),
			"tail" = new /image(icon_icon, "tail"),
			"taur" = new /image(icon_icon, "taur"),
			"" = new /image(icon_icon, "horns"),
			"insect_wings" = new /image(icon_icon, "moth_wings"),
			"ipc_antenna" = new /image(icon_icon, "ipc_antenna"),
			"xenodorsal" = new /image(icon_icon, "xenodorsal"),
			"spines" = new /image(icon_icon, "spines"),
		)
	var/choice = show_radial_menu(mod.wearer, mod.wearer, radial_menu_choises)
	if(choice in mod.need_to_conseal)
		mod.need_to_conseal -= choice
		mod.remove_hardlight(choice)
		mod.wearer.regenerate_icons()
		mod.wearer.balloon_alert(mod.wearer, "Защитный слой успешно убран!")
	else
		mod.need_to_conseal += choice
		if(!mod.active)
			mod.wearer.balloon_alert(mod.wearer, "Защитный слой активируется вместе с костюмом!")


