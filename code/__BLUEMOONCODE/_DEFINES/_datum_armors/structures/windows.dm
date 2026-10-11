// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/windows. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/window/plastitanium — code/game/objects/structures/window.dm
//   /obj/structure/window/shuttle — code/game/objects/structures/window.dm
// (Схожая броня: /datum/armor/profiles/structure/window/reinforced; другой профиль, не объединять.)
/datum/armor/profiles/shared/structure/window/plastitanium__shuttle
	melee = 50
	bullet = 0
	laser = 0
	energy = 0
	bomb = 50
	bio = 100
	rad = 100
	fire = 80
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/window/plasma — code/game/objects/structures/window.dm
// (Схожая броня: /datum/armor/profiles/structure/window/plasma/reinforced; другой профиль, не объединять.)
/datum/armor/profiles/structure/window/plasma
	melee = 75
	bullet = 5
	laser = 0
	energy = 0
	bomb = 45
	bio = 100
	rad = 100
	fire = 99
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/window/plasma/reinforced — code/game/objects/structures/window.dm
// (Схожая броня: /datum/armor/profiles/structure/window/plasma; другой профиль, не объединять.)
/datum/armor/profiles/structure/window/plasma/reinforced
	melee = 85
	bullet = 20
	laser = 0
	energy = 0
	bomb = 60
	bio = 100
	rad = 100
	fire = 99
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/window/reinforced — code/game/objects/structures/window.dm
// (Схожая броня: /datum/armor/profiles/shared/structure/window/plastitanium__shuttle; другой профиль, не объединять.)
/datum/armor/profiles/structure/window/reinforced
	melee = 50
	bullet = 0
	laser = 0
	energy = 0
	bomb = 25
	bio = 100
	rad = 100
	fire = 80
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/window/reinforced/clockwork — code/game/objects/structures/window.dm
// (Схожая броня: /datum/armor/profiles/structure/window/reinforced; другой профиль, не объединять.)
/datum/armor/profiles/structure/window/reinforced/clockwork
	melee = 60
	bullet = 25
	laser = 0
	energy = 0
	bomb = 25
	bio = 100
	rad = 100
	fire = 80
	acid = 100
	magic = 0
	wound = 0
