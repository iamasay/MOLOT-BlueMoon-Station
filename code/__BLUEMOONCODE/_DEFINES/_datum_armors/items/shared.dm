// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: items/shared. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/banhammer — code/game/objects/items/weaponry.dm
//   /obj/item/dualsaber — code/game/objects/items/dualsaber.dm
//   /obj/item/plasmascythe — modular_bluemoon/Ren/Code/staff/plasma_weapon.dm
//   /obj/item/stack/tile/plasteel — code/game/objects/items/stacks/tiles/tile_types.dm
//   /obj/item/stack/tile/plasteel — modular_bluemoon/code/game/objects/items/stacks/tiles/tile_plasteel.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/plasteel; другой профиль, не объединять.)
/datum/armor/profiles/shared/banhammer__dualsaber__plasmascythe__stack_tile_plasteel
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/disk/nuclear — code/modules/antagonists/nukeop/equipment/nuclearbomb.dm
//   /obj/item/hand_tele — code/game/objects/items/teleportation.dm
//   /obj/item/storage/lockbox/departmental_lathe/cargo — code/game/objects/items/storage/secure.dm
//   /obj/item/storage/lockbox/departmental_lathe/engineering — code/game/objects/items/storage/secure.dm
//   /obj/item/storage/lockbox/departmental_lathe/medical — code/game/objects/items/storage/secure.dm
//   /obj/item/storage/lockbox/departmental_lathe/science — code/game/objects/items/storage/secure.dm
//   /obj/item/storage/lockbox/departmental_lathe/security — code/game/objects/items/storage/secure.dm
//   /obj/item/storage/lockbox/departmental_lathe/service — code/game/objects/items/storage/secure.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_and_acidproof_misc; другой профиль, не объединять.)
/datum/armor/profiles/shared/disk_and_hand_tele_and_storage/bomb30_fire100_acid100
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/fireaxe — code/game/objects/items/fireaxe.dm
//   /obj/item/fireaxe — modular_bluemoon/code/game/objects/items/fireaxe.dm
//   /obj/item/melee/transforming/energy — code/game/objects/items/melee/energy.dm
//   /obj/item/pitchfork — code/game/objects/items/pitchfork.dm
//   /obj/item/watertank — code/game/objects/items/tanks/watertank.dm
//   /obj/item/weldingtool — code/game/objects/items/tools/weldingtool.dm
//   /obj/item/weldingtool — modular_bluemoon/phenyamomota/code/modules/tools/tools.dm
// (Схожая броня: /datum/armor/profiles/melee/powerfist; другой профиль, не объединять.)
/datum/armor/profiles/shared/fireproof_tools_and_weapons
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/pneumatic_cannon — code/game/objects/items/pneumaticCannon.dm
//   /obj/item/storage/backpack/holding — code/game/objects/items/storage/bag_of_holding.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/shared/pneumatic_cannon__storage_backpack_holding
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 60
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/claymore — code/game/objects/items/weaponry.dm
//   /obj/item/construction — code/game/objects/items/RCD.dm
//   /obj/item/katana — code/game/objects/items/weaponry.dm
//   /obj/item/khopesh — modular_splurt/code/game/objects/items/weaponry.dm
//   /obj/item/pipe_dispenser — code/game/objects/items/RPD.dm
//   /obj/item/shuttle_creator — code/modules/shuttle/shuttle_creation/shuttle_creator.dm
// (Схожая броня: /datum/armor/profiles/melee/powerfist; другой профиль, не объединять.)
/datum/armor/profiles/shared/weapons_and_construction_tools
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 50
	magic = 0
	wound = 0
