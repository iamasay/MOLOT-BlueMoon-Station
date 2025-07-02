/obj/item/lighter/donator/bm/militaryzippo
	name = "military zippo"
	desc = "Army styled zippo with graved \"Dmitry Strelnikov\" on backside. Has a much hotter flame than normal."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "mzippo"
	heat = 2000
	light_color = LIGHT_COLOR_FIRE
	overlay_state = "mzippo"
	grind_results = list(/datum/reagent/iron = 1, /datum/reagent/fuel = 5, /datum/reagent/oil = 5)

/obj/item/reagent_containers/glass/beaker/elf_bottle
	name = "potion bottle"
	desc = "Фиолетовая бутылка, что выглядет очень старой. \
		Она выглядет так буд-то её используют для хранения зелий.  \
		На этикетке написано 'Зелье снятия одежды'."
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	icon_state = "elf_bottle"
	volume = 150
	possible_transfer_amounts = list(1,2,3,5,10,25,50,100,150)
	container_flags = APTFT_ALTCLICK|APTFT_VERB
	list_reagents = list(/datum/reagent/consumable/ethanol/panty_dropper = 50)
	container_HP = 10

////////////////////////

/obj/item/modkit/hahun_jukebox
	name = "Irrelian Jukebox"
	desc = "A modkit for making a jukebox into an acradorian version."
	product = /obj/item/jukebox/hahun
	fromitem = list(/obj/item/jukebox)

/obj/item/jukebox/hahun
	name = "Irellian music player"
	desc = "An Irellian musical player, resembles a phone with acratorian design, have two little antennas and a port for headphones"
	icon = 'modular_bluemoon/fluffs/icons/obj/items.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/items_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/items_right.dmi'
	icon_state = "hahun_jukebox"
	item_state = "hahun_jukebox"

/obj/item/jukebox/hahun/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/jukebox/hahun/update_icon_state()
	var/mutable_appearance/enabled = mutable_appearance('modular_citadel/icons/obj/boombox_righthand.dmi', "headphones_on")
	if(active)
		. += mutable_appearance('modular_citadel/icons/obj/boombox_righthand.dmi', "headphones_on")
		item_state = "[initial(icon_state)]-active"
		add_overlay(enabled)
	else
		icon_state = "[initial(icon_state)]"
		item_state = "[initial(item_state)]"
		cut_overlay(enabled)

////////////////////////
