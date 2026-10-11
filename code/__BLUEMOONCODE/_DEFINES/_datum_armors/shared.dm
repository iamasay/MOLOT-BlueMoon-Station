// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: shared. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/storage/trek/ds9/admiral — modular_citadel/code/modules/clothing/trek.dm
//   /obj/structure/puzzle_element/prison — code/modules/ruins/lavalandruin_code/puzzle.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/plate/crusader/prophet; другой профиль, не объединять.)
/datum/armor/profiles/shared/admiral_uniform_and_prison
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 50
	rad = 50
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/beret/sec/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/head/hats/warden/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/head/helmet/swat/ds/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/head/maid/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/head/soft/sec/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/neck/cloak/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/suit/armor/vest/fake — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/suit/armor/vest/infiltrator/gorlex_harness/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/suit/hooded/wintercoat/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/suit/toggle/captains_parade/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/suit/toggle/captains_parade/syndicate/winter/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/donator/bm/lotos_skirt — modular_bluemoon/fluffs/code/under.dm
//   /obj/item/defibrillator — code/game/objects/items/defib.dm
//   /obj/item/kitchen/efink — code/game/objects/items/kitchen.dm
//   /obj/item/kitchen/knife — code/game/objects/items/kitchen.dm
//   /obj/item/kitchen/knife — modular_bluemoon/krashly/code/modules/sound.dm
//   /obj/item/restraints/bondage_rope — modular_splurt/code/game/objects/items/lewd_items/rope.dm
//   /obj/item/restraints/handcuffs — code/game/objects/items/handcuffs.dm
//   /obj/structure — code/game/objects/structures.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/syndicate_civil; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing_and_general_objects
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/glasses/science — code/modules/clothing/glasses/_glasses.dm
//   /obj/item/stack/sheet/plastitaniumglass — code/game/objects/items/stacks/sheets/glass.dm
//   /obj/item/stack/sheet/titaniumglass — code/game/objects/items/stacks/sheets/glass.dm
//   /obj/structure/fence/handrail — modular_splurt/code/game/objects/structures/fence.dm
//   /obj/structure/table/glass — code/game/objects/structures/tables_racks.dm
//   /obj/structure/window — code/game/objects/structures/window.dm
//   /obj/structure/window — modular_bluemoon/code/game/objects/structures/window_airbag.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/plasmaglass; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing_and_stack_and_structure/fire80_acid100
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/botanic_leather — code/modules/clothing/gloves/miscellaneous.dm
//   /obj/item/vending_refill — code/game/objects/items/vending_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/engineering/atmospheric_technician; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing_gloves_botanic_leather__vending_refill
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 70
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/card/id — code/game/objects/items/cards_ids.dm
//   /obj/item/clothing/suit/armor/reactive — code/modules/clothing/suits/reactive_armour.dm
//   /obj/item/crucible — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
//   /obj/item/demolition_hammer — modular_bluemoon/code/game/objects/items/demolition_hammer.dm
//   /obj/item/kitchen/knife/claws — modular_bluemoon/code/game/objects/items/implants/implant_claws.dm
//   /obj/item/kitchen/knife/razor_claws — modular_bluemoon/code/game/objects/items/implants/implant_claws.dm
//   /obj/item/modular_computer/pda — code/modules/modular_computers/computers/item/pda.dm
//   /obj/machinery/warping_machine — code/game/machinery/machine_warp_beacon.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/syndicate/bloodred/sleepytime; другой профиль, не объединять.)
/datum/armor/profiles/shared/fireproof_and_acidproof_misc
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/disposal — code/modules/recycling/disposal/bin.dm
//   /obj/structure/disposalpipe — code/modules/recycling/disposal/pipe.dm
// (Схожая броня: /datum/armor/profiles/machinery/airalarm; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery_disposal__structure_disposalpipe
	melee = 25
	bullet = 10
	laser = 10
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 90
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/keycard — code/game/objects/items/puzzle_pieces.dm
//   /obj/machinery/door/password — code/game/machinery/doors/passworddoor.dm
//   /obj/structure/carp_rift/proc/update_check() — code/modules/mob/living/simple_animal/hostile/space_dragon.dm
//   /obj/structure/elite_tumor — code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/elite.dm
//   /obj/structure/elite_tumor — modular_sand/code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/elite.dm
//   /obj/structure/safe/spare_id — modular_bluemoon/code/game/objects/structures/safe.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert/alert/debug/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/secure_and_special_objects
	melee = 100
	bullet = 100
	laser = 100
	energy = 100
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/sign — code/game/objects/structures/signs/_signs.dm
//   /obj/structure/sign — code/game/objects/structures/signs/_signs.dm
//   /obj/structure/sign — modular_bluemoon/code/modules/aesthetics/sign/_signs.dm
// (Схожая броня: /datum/armor/profiles/machinery/newscaster; другой профиль, не объединять.)
/datum/armor/profiles/shared/sign__structure_sign
	melee = 50
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/power/floodlight/urbanismlight — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismdamagedbarrel — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/thunderdome; другой профиль, не объединять.)
/datum/armor/profiles/shared/urbanism_lights_and_barrels
	melee = 30
	bullet = 30
	laser = 20
	energy = 10
	bomb = 30
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/mineral/bamboo — code/game/objects/items/stacks/sheets/sheet_types.dm
//   /obj/item/stack/sheet/mineral/wood — code/game/objects/items/stacks/sheets/sheet_types.dm
//   /obj/item/stack/sheet/mineral/wood — modular_sand/code/game/objects/items/stacks/sheets/sheet_types.dm
//   /obj/structure/bookcase — code/modules/library/lib_items.dm
// (Схожая броня: /datum/armor/profiles/machinery/computer; другой профиль, не объединять.)
/datum/armor/profiles/shared/wood_and_bamboo
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/sign/tram_plate — modular_bluemoon/code/game/objects/structures/tram_signage.dm
//   /obj/machinery/transport — modular_bluemoon/code/modules/transport/_transport_machinery.dm
//   /obj/machinery/computer/tram_controls — modular_bluemoon/code/modules/transport/tram/tram_controls.dm
//   /obj/structure/thermoplastic — modular_bluemoon/code/modules/transport/tram/tram_floors.dm
//   /obj/structure/tram — modular_bluemoon/code/modules/transport/tram/tram_structures.dm
// (Схожая броня: /datum/armor/profiles/structure/closet/crate/coffin/meatcoffin; другой профиль, не объединять.)
/datum/armor/profiles/shared/transport
	melee = 40
	bullet = 10
	laser = 10
	energy = 0
	bomb = 45
	bio = 0
	rad = 0
	fire = 90
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/transport/linear — modular_bluemoon/code/modules/transport/transport_module.dm
//   /obj/machinery/transport/tram_controller — modular_bluemoon/code/modules/transport/tram/tram_cabinet.dm
//   /obj/machinery/transport/power_rectifier — modular_bluemoon/code/modules/transport/tram/tram_power.dm
// (Схожая броня: /datum/armor/profiles/shield/riot/ratvarian; другой профиль, не объединять.)
/datum/armor/profiles/shared/transport_reinforced
	melee = 80
	bullet = 90
	laser = 0
	energy = 0
	bomb = 70
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0
