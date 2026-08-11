#define MOD_STANDART_COLOR rgb(26, 209, 255, 255)
#define MOD_SYNDICATE_COLOR rgb(243, 70, 57)
#define MOD_INTEQ_COLOR rgb(245, 117, 32)
#define MA_INDEX 1
#define LAYER_INDEX 2

/obj/item/mod/control
	var/list/need_to_conseal = list()
	var/hardlight_color = MOD_STANDART_COLOR

/obj/item/mod/control/conceal(mob/user, part)
	. = ..()
	remove_hardlight()
	wearer.regenerate_icons()

/obj/item/mod/control/toggle_activate(mob/user, force_deactivate)
	. = ..()
	if(activating)
		update_hardlight()
		return

	remove_hardlight()

/obj/item/mod/control/deploy(mob/user, part)
	. = ..()
	if(need_to_conseal)
		update_hardlight()

/obj/item/mod/control/proc/update_hardlight()
	for(var/part in need_to_conseal)
		wearer.apply_bodypart_overlays(need_to_conseal)
	wearer.regenerate_icons()

/obj/item/mod/control/proc/remove_hardlight(var/index)
	if(index)
		wearer.remove_overlay_by_bodypart_key(index)
		return TRUE
	wearer.clear_bodypart_overlays()

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
			return
		mod.update_hardlight()


