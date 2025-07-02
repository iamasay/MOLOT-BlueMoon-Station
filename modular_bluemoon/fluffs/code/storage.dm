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

/obj/item/storage/backpack/martian
	name = "Martian Backpack"
	desc = "Некий Марсианский Артефакт, использующийся в качестве рюкзака. Ткань ощущается довольно прочной. Это точно можно использовать в качестве оружия!"
	icon_state = "martian-backpack"
	item_state = "backpack"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	force = 5

/obj/item/storage/backpack/satchel/cheese
	name = "Cheese Backpack"
	desc = "Некий Мышиный Артефакт, использующийся в качестве рюкзака. Ткань ощущается довольно прочной. Это точно можно использовать в качестве оружия!"
	icon_state = "cheese-satchel"
	item_state = "satchel"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	force = 5

/obj/item/storage/box/donator/bm/wh_kit
	name = "A box of Unholy Armor"
	desc = "This is a box imbued with the demonic influence of the Dark Gods, containing armor modkit inside"
	icon_state = "box"

/obj/item/storage/box/donator/bm/wh_kit/PopulateContents()
	new /obj/item/modkit/whhelmet_kit(src)
	new /obj/item/modkit/wharmor_kit(src)

/////////////////////////////////////////////////////

/obj/item/storage/belt/medical/hahun_medvest
	name = "rescue task force vest"
	desc = "A convenient piece of equipment that sits on the chest, has many pouches and fastenings for medical instruments, drugs, bandages."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/clothing_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/clothing_right.dmi'
	icon_state = "hahun_belt"
	item_state = "hahun_belt"
	content_overlays = FALSE

/obj/item/storage/backpack/satchel/hahun_bag
	name = "unloading bag"
	desc = "Tactical and comfortable hip bag with lots of free space and pockets, has an Eidolon squad insignia on it."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/storage.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_righthand.dmi'
	icon_state = "hahun_satchel"
	item_state = "hahun_satchel"

/obj/item/storage/backpack/case/medical/hahun
	name = "Irellian rescue compartment case"
	desc = "A case full of medical acrador related clothing and equipment. Contains medvest, gloves and exosuit."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	icon_state = "hahun_case"
	item_state = "hahun_case"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_righthand.dmi'

/obj/item/storage/backpack/case/medical/hahun/PopulateContents()
	new /obj/item/storage/belt/medical/hahun_medvest(src)
	new /obj/item/clothing/gloves/color/latex/nitrile/hahun_eidolon(src)
	new /obj/item/clothing/suit/hooded/wintercoat/medical/hahun_exosuit(src)

/////////////////////////////////////////////////////

/obj/item/storage/backpack/satchel/dilivery_bag
	name = "Delivery Bag"
	desc = "A food delivery service backpack with aluminum foiling on the inside, which sustains heat. Smells oddly like fried chicken."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/storage.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_righthand.dmi'
	icon_state = "dilivery_bag"
	item_state = "dilivery_bag"
