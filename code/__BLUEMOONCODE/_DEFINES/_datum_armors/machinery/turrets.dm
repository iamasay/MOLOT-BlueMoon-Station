// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/turrets. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/porta_turret — code/game/machinery/porta_turret/portable_turret.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/porta_turret/syndicate/energy/pirate/base__inteq; другой профиль, не объединять.)
/datum/armor/profiles/machinery/porta_turret
	melee = 50
	bullet = 30
	laser = 30
	energy = 30
	bomb = 30
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/porta_turret/syndicate/shuttle — code/game/machinery/porta_turret/portable_turret.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/porta_turret/syndicate/energy/pirate/base__inteq; другой профиль, не объединять.)
/datum/armor/profiles/machinery/porta_turret/syndicate/shuttle
	melee = 50
	bullet = 30
	laser = 30
	energy = 30
	bomb = 80
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/porta_turret/syndicate/energy/pirate — code/game/machinery/porta_turret/portable_turret.dm
//   /obj/machinery/porta_turret/syndicate/energy/pirate/inteq — modular_bluemoon/kovac_shitcode/code/modules/antagonists/raiders.dm
// (Схожая броня: /datum/armor/profiles/machinery/porta_turret; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/porta_turret/syndicate/energy/pirate/base__inteq
	melee = 50
	bullet = 30
	laser = 30
	energy = 30
	bomb = 50
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0
