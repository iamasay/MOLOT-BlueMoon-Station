// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/tables. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/table/plasmaglass — code/game/objects/structures/tables_racks.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/plasmarglass; другой профиль, не объединять.)
/datum/armor/profiles/structure/table/plasmaglass
	melee = 10
	bullet = 5
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 80
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/table/reinforced — code/game/objects/structures/tables_racks.dm
// (Схожая броня: /datum/armor/profiles/shared/structure/closet/crate_secure__secure_closet; другой профиль, не объединять.)
/datum/armor/profiles/structure/table/reinforced
	melee = 10
	bullet = 30
	laser = 30
	energy = 100
	bomb = 20
	bio = 0
	rad = 0
	fire = 80
	acid = 70
	magic = 0
	wound = 0
