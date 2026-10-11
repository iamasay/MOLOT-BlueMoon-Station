// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/other. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/ai_slipper — code/game/machinery/ai_slipper.dm
// (Схожая броня: /datum/armor/profiles/machinery/holopad; другой профиль, не объединять.)
/datum/armor/profiles/machinery/ai_slipper
	melee = 50
	bullet = 20
	laser = 20
	energy = 20
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/bfl_lens — modular_bluemoon/code/modules/station_goals/bfl.dm
// (Схожая броня: /datum/armor/profiles/machinery/atmospherics/standard; другой профиль, не объединять.)
/datum/armor/profiles/machinery/bfl_lens
	melee = 0
	bullet = 0
	laser = 100
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/camera — code/game/machinery/camera/camera.dm
//   /obj/machinery/camera — code/game/machinery/camera/motion.dm
// (Схожая броня: /datum/armor/profiles/structure/light_construct; другой профиль, не объединять.)
/datum/armor/profiles/machinery/camera
	melee = 50
	bullet = 20
	laser = 20
	energy = 20
	bomb = 0
	bio = 0
	rad = 0
	fire = 90
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/field/generator — code/modules/power/singularity/field_generator.dm
// (Схожая броня: /datum/armor/profiles/structure/sign/barsign; другой профиль, не объединять.)
/datum/armor/profiles/machinery/field/generator
	melee = 25
	bullet = 10
	laser = 100
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 70
	magic = 0
	wound = 100

// Используется (и наследниками без собственного armor):
//   /obj/machinery/firealarm — code/game/machinery/firealarm.dm
// (Схожая броня: /datum/armor/profiles/machinery/space_heater; другой профиль, не объединять.)
/datum/armor/profiles/machinery/firealarm
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 100
	fire = 90
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/holopad — code/game/machinery/hologram.dm
// (Схожая броня: /datum/armor/profiles/machinery/ai_slipper; другой профиль, не объединять.)
/datum/armor/profiles/machinery/holopad
	melee = 50
	bullet = 20
	laser = 20
	energy = 20
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/igniter — code/game/machinery/igniter.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/honker/dark; другой профиль, не объединять.)
/datum/armor/profiles/machinery/igniter
	melee = 50
	bullet = 30
	laser = 70
	energy = 50
	bomb = 20
	bio = 0
	rad = 0
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/navbeacon — code/game/machinery/navbeacon.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/durand/zeus; другой профиль, не объединять.)
/datum/armor/profiles/machinery/navbeacon
	melee = 70
	bullet = 70
	laser = 70
	energy = 70
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/newscaster — code/modules/newscaster/newscaster_machine.dm
// (Схожая броня: /datum/armor/profiles/shared/sign__structure_sign; другой профиль, не объединять.)
/datum/armor/profiles/machinery/newscaster
	melee = 50
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/requests_console — code/game/machinery/requests_console.dm
// (Схожая броня: /datum/armor/profiles/machinery/porta_turret; другой профиль, не объединять.)
/datum/armor/profiles/machinery/requests_console
	melee = 70
	bullet = 30
	laser = 30
	energy = 30
	bomb = 0
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/space_heater — code/game/machinery/spaceheater.dm
// (Схожая броня: /datum/armor/profiles/machinery/firealarm; другой профиль, не объединять.)
/datum/armor/profiles/machinery/space_heater
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 100
	fire = 80
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/vitals_reader — code/game/machinery/wall_vitals.dm
// (Схожая броня: /datum/armor/profiles/shared/kitchen/knife/shiv/plasma__titanium; другой профиль, не объединять.)
/datum/armor/profiles/machinery/vitals_reader
	melee = 30
	bullet = 20
	laser = 20
	energy = 30
	bomb = 10
	bio = 0
	rad = 0
	fire = 50
	acid = 80
	magic = 0
	wound = 0
