// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/atmospherics. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/airalarm — code/modules/atmospherics/machinery/airalarm.dm
// (Схожая броня: /datum/armor/profiles/machinery/atmospherics/components/unary/shuttle/heater; другой профиль, не объединять.)
/datum/armor/profiles/machinery/airalarm
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 90
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/atmospherics/components/unary/cryo_cell — code/modules/atmospherics/machinery/components/unary_devices/cryo.dm
// (Схожая броня: /datum/armor/profiles/machinery/portable_atmospherics; другой профиль, не объединять.)
/datum/armor/profiles/machinery/atmospherics/components/unary/cryo_cell
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 30
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/atmospherics/components/unary/shuttle/heater — code/game/machinery/shuttle/shuttle_heater.dm
// (Схожая броня: /datum/armor/profiles/machinery/airalarm; другой профиль, не объединять.)
/datum/armor/profiles/machinery/atmospherics/components/unary/shuttle/heater
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 100
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/atmospherics — code/modules/atmospherics/machinery/atmosmachinery.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery_disposal__structure_disposalpipe; другой профиль, не объединять.)
/datum/armor/profiles/machinery/atmospherics/standard
	melee = 25
	bullet = 10
	laser = 10
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 100
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/electrolyzer — code/modules/atmospherics/machinery/components/electrolyzer/electrolyzer.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/cargo/miner; другой профиль, не объединять.)
/datum/armor/profiles/machinery/electrolyzer
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/meter — code/modules/atmospherics/machinery/other/meter.dm
// (Схожая броня: /datum/armor/profiles/machinery/atmospherics/components/unary/cryo_cell; другой профиль, не объединять.)
/datum/armor/profiles/machinery/meter
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 40
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/portable_atmospherics — code/modules/atmospherics/machinery/portable/portable_atmospherics.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/atmospherics/thermal_devices; другой профиль, не объединять.)
/datum/armor/profiles/machinery/portable_atmospherics
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 60
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/portable_atmospherics/canister — code/modules/atmospherics/machinery/portable/canister.dm
// (Схожая броня: /datum/armor/profiles/machinery/power/apc; другой профиль, не объединять.)
/datum/armor/profiles/machinery/portable_atmospherics/canister
	melee = 50
	bullet = 50
	laser = 50
	energy = 100
	bomb = 10
	bio = 100
	rad = 100
	fire = 80
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/air_sensor — code/game/machinery/computer/atmos_control.dm
//   /obj/machinery/air_sensor/tarkon — modular_bluemoon/code/modules/mapping/tarkon_atmos_control.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_tools_and_weapons; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/air_sensor/base__tarkon
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/atmospherics/components/binary/crystallizer — code/modules/atmospherics/machinery/components/gas_recipe_machines/crystallizer.dm
//   /obj/machinery/atmospherics/components/unary/thermomachine — code/modules/atmospherics/machinery/components/unary_devices/thermomachine.dm
// (Схожая броня: /datum/armor/profiles/machinery/airalarm; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/atmospherics/thermal_devices
	melee = 0
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 80
	acid = 30
	magic = 0
	wound = 0
