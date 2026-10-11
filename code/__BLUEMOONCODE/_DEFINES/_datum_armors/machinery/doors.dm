// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/doors. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door — code/game/machinery/doors/door.dm
// (Схожая броня: /datum/armor/profiles/machinery/door/firedoor; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door
	melee = 30
	bullet = 30
	laser = 20
	energy = 20
	bomb = 10
	bio = 100
	rad = 100
	fire = 80
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/firedoor — code/game/machinery/doors/firedoor.dm
// (Схожая броня: /datum/armor/profiles/machinery/door; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door/firedoor
	melee = 30
	bullet = 30
	laser = 20
	energy = 20
	bomb = 10
	bio = 100
	rad = 100
	fire = 95
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/poddoor — code/game/machinery/doors/poddoor.dm
// (Схожая броня: /datum/armor/profiles/shared/secure_and_special_objects; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door/poddoor
	melee = 50
	bullet = 100
	laser = 100
	energy = 100
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/poddoor/shutters — code/game/machinery/doors/shutters.dm
// (Схожая броня: /datum/armor/profiles/machinery/door/poddoor/shutters/old; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door/poddoor/shutters
	melee = 20
	bullet = 20
	laser = 20
	energy = 75
	bomb = 25
	bio = 100
	rad = 100
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/poddoor/shutters/old — code/game/machinery/doors/shutters.dm
// (Схожая броня: /datum/armor/profiles/machinery/door/poddoor/shutters; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door/poddoor/shutters/old
	melee = 30
	bullet = 30
	laser = 30
	energy = 75
	bomb = 30
	bio = 100
	rad = 100
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/door/window — code/game/machinery/doors/windowdoor.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/button__turnstile; другой профиль, не объединять.)
/datum/armor/profiles/machinery/door/window
	melee = 20
	bullet = 50
	laser = 50
	energy = 50
	bomb = 10
	bio = 100
	rad = 100
	fire = 70
	acid = 100
	magic = 0
	wound = 0
