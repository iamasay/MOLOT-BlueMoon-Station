/obj/item/storage/box/donator/bm/case_ds
	name = "Dmitry Strelnikov military case"
	desc = "A military supply box."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	icon_state = "case_ds"
	var/box_state = "case_ds"
	var/opened = FALSE
	item_state = "ds-case"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_righthand.dmi'
	drop_sound = 'modular_bluemoon/fluffs/sound/case_drop.ogg'
	pickup_sound =  'modular_bluemoon/fluffs/sound/case_pickup.ogg'
	foldable = FALSE
	illustration = null

/obj/item/storage/box/donator/bm/case_ds/PopulateContents()
	. = ..()
	new /obj/item/clothing/under/syndicate/camo(src)
	new /obj/item/clothing/accessory/medal/delta(src)
	new /obj/item/clothing/mask/bandana/skull(src)
	new /obj/item/lighter/donator/bm/militaryzippo(src)
	new /obj/item/storage/fancy/cigarettes/cigars/cohiba(src)

/obj/item/storage/box/donator/bm/case_ds/update_icon()
	. = ..()
	if(opened)
		icon_state = "[box_state]-open"
	else
		icon_state = box_state

/obj/item/storage/box/donator/bm/case_ds/AltClick(mob/user)
	. = ..()
	opened = !opened
	update_icon()

/obj/item/storage/box/donator/bm/case_ds/attack_self(mob/user)
	. = ..()
	opened = !opened
	update_icon()
