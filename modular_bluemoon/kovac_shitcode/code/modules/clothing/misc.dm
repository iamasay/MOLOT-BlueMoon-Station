/obj/item/clothing/neck/tie/cross
	name = "Christian Cross Necklace"
	desc = "Amen."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "cross"

/obj/item/clothing/neck/tie/bandagewraps
	name = "Bandage wraps"
	desc = "Poor soldier. Take some medkit."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "head1"
	unique_reskin = list(
		"Head 2" = list("icon_state" = "head2"),
		"Head 3" = list("icon_state" = "head3"),
		"Head Bloody" = list("icon_state" = "head1b"),
		"Head Bloody 2" = list("icon_state" = "headb"),
		"Head Bloody 3" = list("icon_state" = "head3b"),
		"Chest" = list("icon_state" = "chest1"),
		"Chest 2" = list("icon_state" = "chest2"),
		"Chest Bloody" = list("icon_state" = "chest1b"),
		"Chest 2 Bloody" = list("icon_state" = "chestb")
	)

///


/obj/item/clothing/mask/balaclava/breath/redscarf
	name = "Red facescarf"
	desc = "tacticool"
	icon_state = "red"
	item_state = "red"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	mutantrace_variation = STYLE_MUZZLE|STYLE_NO_ANTHRO_ICON
	clothing_flags = ALLOWINTERNALS

/obj/item/clothing/mask/balaclava/breath/redscarf/bluescarf
	name = "Blue facescarf"
	icon_state = "blue"
	item_state = "blue"

/obj/item/clothing/mask/balaclava/breath/redscarf/purplescarf
	name = "Purple facescarf"
	icon_state = "purple"
	item_state = "purple"

/obj/item/clothing/mask/balaclava/breath/redscarf/yellowscarf
	name = "Yellow facescarf"
	icon_state = "yellow"
	item_state = "yellow"


/obj/item/clothing/mask/balaclava/breath/redscarf/greenscarf
	name = "Green facescarf"
	icon_state = "green"
	item_state = "green"

/obj/item/clothing/mask/gas/syndicate/ds/wide
	name = "wide shape balaclava"
	desc = "For organising your tricky covert operations. Provided with additional fibers, allowing user to breath normally"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "balaclava_wide"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/mask/gas/syndicate/ds/mouth
	name = "mouth balaclava"
	desc = "Get down on the floor, cyka."
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "balaclava_mouth"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/mask/gas/syndicate/ds/coif
	name = "terra gov balaclava"
	desc = "Solar Federation tactical coif"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'
	icon_state = "coif"
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS|HIDEFACIALHAIR
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON


///

/obj/item/clothing/under/rank/security/officer/urban_camo
	name = "urban camouflage uniform"
	desc = "an urban painted military suit, developed the Bibis&Co. Usually associated with CEHU and LonoMith PMC's"
	icon_state = "urban_camo"
	item_state = "urban_camo"
	unique_reskin = list(
		"Urban" = list("icon_state" = "urban_camo")
	)

/obj/item/clothing/neck/cloak/cape_blue
	name = "blue cape"
	desc = "Stylish."
	icon_state = "cape_blue"
	item_state = "cape_blue"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'

/obj/item/clothing/neck/cloak/armplate_blue
	name = "blue armplate"
	desc = "Stylish."
	icon_state = "armplate_blue"
	item_state = "armplate_blue"
	icon = 'modular_bluemoon/kovac_shitcode/icons/obj/clothing/misc.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/mob/clothing/misc.dmi'

/// loadout additions
/datum/gear/neck/cross
	name = "Christian Cross Necklace"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/cross

/datum/gear/neck/bandagewraps
	name = "Bandage wraps"
	subcategory = LOADOUT_SUBCATEGORY_NECK_TIE
	path = /obj/item/clothing/neck/tie/bandagewraps

/datum/gear/suit/suspenders
	name = "Suspenders"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/suspenders

/datum/gear/suit/suspenders_white
	name = "White Suspenders"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/suspenders/suspenders_white

/datum/gear/head/syndicate_cap
	name = "Syndicate Cap"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_JOBS
	path = /obj/item/clothing/head/HoS/syndicate
	restricted_roles = list("Captain","Head of Security")

/datum/gear/uniform/solfed_formal
	name = "SolFed Formal Uniform"
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_SUITS
	path = /obj/item/clothing/under/rank/security/officer/formal/sol/armorless

/datum/gear/suit/solfed_dress
	name = "SolFed Dress"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/sol_dress

/datum/gear/suit/nri_coat
	name = "Russian Empire Coat"
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS
	path = /obj/item/clothing/suit/armor/nri_coat/armorless

/datum/gear/head/sol_beret
	name = "SolFed Beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_GENERAL
	path = /obj/item/clothing/head/HoS/beret/sol/plain/armorless

/datum/gear/head/sol_cap
	name = "SolFed Cap"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_GENERAL
	path = /obj/item/clothing/head/HoS/beret/sol/cap/armorless

/datum/gear/head/nri_cap
	name = "Russian Empire Cap"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_GENERAL
	path = /obj/item/clothing/head/HoS/beret/nri/cap/armorless

/datum/gear/neck/cape_blue
	name = "Blue Cape"
	subcategory = LOADOUT_SUBCATEGORY_NECK_GENERAL
	path = /obj/item/clothing/neck/cloak/cape_blue

/datum/gear/neck/armplate_blue
	name = "Blue Armplate"
	subcategory = LOADOUT_SUBCATEGORY_NECK_GENERAL
	path =/obj/item/clothing/neck/cloak/armplate_blue

/datum/gear/neck/sol_cape
	name = "SolFed Cape"
	subcategory = LOADOUT_SUBCATEGORY_NECK_GENERAL
	path = /obj/item/clothing/neck/cloak/cape

/datum/gear/neck/nri_cape
	name = "Russian Empire Cape"
	subcategory = LOADOUT_SUBCATEGORY_NECK_GENERAL
	path = /obj/item/clothing/neck/cloak/nri_cape

// start bluemoon edit - Katana Zero

/datum/gear/head/chronos_beret
	name = "New Mecca Beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_GENERAL
	path = /obj/item/clothing/head/beret/chronos

/datum/gear/uniform/chronos_uniform
	name = "New Mecca Uniform"
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_SUITS
	path = /obj/item/clothing/under/chronos

/datum/gear/neck/chronos_cape
	name = "New Mecca Cape"
	subcategory = LOADOUT_SUBCATEGORY_NECK_GENERAL
	path = /obj/item/clothing/neck/cloak/chronos

// end bluemoon edit - Katana Zero

/datum/gear/backpack/flag
	name = "Flag"
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_GENERAL
	path = /obj/item/sign/flag

/datum/gear/backpack/sol_poster
	name = "SolFed poster"
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_GENERAL
	path = /obj/item/poster/sol

/datum/gear/backpack/nri_poster
	name = "NRI poster"
	subcategory = LOADOUT_SUBCATEGORY_BACKPACK_GENERAL
	path = /obj/item/poster/nri

/obj/item/card/id/sol_citizen
	name = "SolFed Citizen ID"
	desc = "An ID made to recognize Solar Federation habbitants and tourists."
	icon_state = "sol"
	assignment = "Sol"
	uses_overlays = FALSE

/obj/item/card/id/nri_citizen
	name = "NRI Citizen ID"
	desc = "An ID made to recognize Novaya Rossiyskya Imperia habbitants and tourists."
	icon_state = "nri"
	assignment = "NRI"
	uses_overlays = FALSE

/obj/item/card/id/blumenland_citizen
	name = "Blumenland Citizen ID"
	desc = "An ID made to recognize Blumenland Confederation habbitants and tourists."
	icon_state = "blumland"
	assignment = "Blumenland Citizen"
	uses_overlays = FALSE

/datum/gear/hands/sol_citizen
	name = "Solar Federation Citizen ID"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/sol_citizen

/datum/gear/hands/nri_citizen
	name = "New Russian Empire Citizen ID"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/nri_citizen

/datum/gear/hands/blumenland_citizen
	name = "Blumenland Citizen ID"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/card/id/blumenland_citizen

//// The default nun robe change to uniform slot


/obj/item/clothing/under/rank/civilian/chaplain/nun
	name = "nun robe"
	desc = "Maximum piety in this star system."
	icon = 'icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit.dmi'
	icon_state = "nun"
	item_state = "nun"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	//flags_inv = HIDEJUMPSUIT
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	unique_reskin = list(
		"Nun 2" = list("icon_state" = "nun2"),
		"Nun 3" = list("icon_state" = "nun3"),
		"Nun 4" = list("icon_state" = "nun4"),
		"Nun 5" = list("icon_state" = "nun5"),
		"Nun 6" = list("icon_state" = "nun6"),
		"Nun 7" = list("icon_state" = "nun7")
	)

////////////////

/obj/item/clothing/suit/suspenders/suspenders_white
	name = "white suspenders"
	desc = "They suspend the illusion of painting."
	icon_state = "suspenders_white"

////////////////////////


/obj/effect/overlay/typing_indicator/lawyer
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/mob/talk.dmi'
	icon_state = "lawyer_typing"
	appearance_flags = RESET_COLOR | TILE_BOUND | PIXEL_SCALE
	layer = ABOVE_FLY_LAYER

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/uplink_item/stealthy_weapons/akimbo
	name = "Akimbo Guide"
	desc = "A book that provides the agent some abilities to shoot heavy two-handed weapons easily using just one arm."
	item = /obj/item/book/granter/trait/akimbo
	cost = 6
	purchasable_from = UPLINK_TRAITORS


/obj/item/book/granter/trait/akimbo
	name = "The Rules of Engagement"
	desc = "Allows to shoot two-handed weapons more effectively after reading."
	oneuse = TRUE
	granted_trait = TRAIT_AKIMBO
	traitname = "akimbo"
	icon_state = "book1"
	remarks = list("One smooth motion...", "Palm the pistol bolt...", "Push up, rotate back, push forward, down...", "Don't slap yourself with the second gun...", "Wait, what's this about shooting firearms?", "Who just scribbled \"Z\" and \"LMB\" on this page?")
