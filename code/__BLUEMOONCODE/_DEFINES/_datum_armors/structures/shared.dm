// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/shared. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/lattice — code/game/objects/structures/lattice.dm
// (Схожая броня: /datum/armor/profiles/structure/light_construct; другой профиль, не объединять.)
/datum/armor/profiles/structure/lattice
	melee = 50
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/deadmesa — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismbigcrate — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismdisplay — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismdisplay/urbanismchalk — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismpower — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismradio — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/crusader_plate; другой профиль, не объединять.)
/datum/armor/profiles/shared/structure/urbanism_reinforced
	melee = 50
	bullet = 40
	laser = 50
	energy = 60
	bomb = 50
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/urbanismmachines — modular_bluemoon/code/modules/awaymissions/urbanism.dm
//   /obj/structure/urbanismmounted — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/narsie; другой профиль, не объединять.)
/datum/armor/profiles/shared/structure/urbanismmachines__urbanismmounted
	melee = 30
	bullet = 50
	laser = 30
	energy = 20
	bomb = 70
	bio = 15
	rad = 10
	fire = 40
	acid = 30
	magic = 0
	wound = 0
