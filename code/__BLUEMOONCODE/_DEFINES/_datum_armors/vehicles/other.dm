// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: vehicles/other. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/ridden/wheelchair — code/modules/vehicles/wheelchair.dm
//   /obj/vehicle/sealed/vectorcraft/rideable/wheelchair — modular_citadel/code/modules/festive/wheelchair.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/shared/vehicle/ridden_wheelchair__sealed_vectorcraft_rideable_wheelchair
	melee = 10
	bullet = 10
	laser = 10
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 20
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle — code/modules/vehicles/_vehicle.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/armored_headgear; другой профиль, не объединять.)
/datum/armor/profiles/vehicle
	melee = 30
	bullet = 30
	laser = 30
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/car/clowncar — code/modules/vehicles/cars/clowncar.dm
// (Схожая броня: /datum/armor/profiles/shared/shield/base__adamantineshield; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/car/clowncar
	melee = 70
	bullet = 40
	laser = 40
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/tank — modular_bluemoon/code/modules/vehicles/tank.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/porta_turret/syndicate/energy/pirate/base__inteq; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/tank
	melee = 50
	bullet = 30
	laser = 30
	energy = 30
	bomb = 50
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0
