// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/barricades. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/barricade/security — code/game/machinery/deployable.dm
// (Схожая броня: /datum/armor/profiles/electronic_assembly; другой профиль, не объединять.)
/datum/armor/profiles/structure/barricade/security
	melee = 10
	bullet = 50
	laser = 50
	energy = 50
	bomb = 10
	bio = 100
	rad = 100
	fire = 10
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/barricade/urbanism — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/structure/urbanismtire; другой профиль, не объединять.)
/datum/armor/profiles/structure/barricade/urbanism
	melee = 30
	bullet = 40
	laser = 10
	energy = 10
	bomb = 30
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0
