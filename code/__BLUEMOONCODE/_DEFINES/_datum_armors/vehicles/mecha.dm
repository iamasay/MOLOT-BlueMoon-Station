// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: vehicles/mecha. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/durand/tu802 — modular_bluemoon/kovac_shitcode/code/modules/vehicles/mecha.dm
//   /obj/vehicle/sealed/mecha/combat/marauder/mauler/loaded/ares — modular_bluemoon/krashly/code/modules/mecha/mecha.dm
// (Схожая броня: /datum/armor/profiles/shared/vehicle/sealed/mecha/combat/durand__marauder; другой профиль, не объединять.)
/datum/armor/profiles/shared/mecha/durand_tu802_and_ares
	melee = 60
	bullet = 65
	laser = 50
	energy = 40
	bomb = 50
	bio = 0
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/gygax — code/modules/vehicles/mecha/combat/gygax.dm
//   /obj/vehicle/sealed/mecha/combat/reticence — code/modules/vehicles/mecha/combat/reticence.dm
//   /obj/vehicle/sealed/mecha/medical/medigax — code/modules/vehicles/mecha/combat/medigax.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_changeling_weak__suit_armor_changeling_weak; другой профиль, не объединять.)
/datum/armor/profiles/shared/mecha/gygax_reticence_and_medigax
	melee = 25
	bullet = 20
	laser = 30
	energy = 15
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/durand — code/modules/vehicles/mecha/combat/durand.dm
//   /obj/vehicle/sealed/mecha/combat/marauder — code/modules/vehicles/mecha/combat/marauder.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/gygax/dark/loaded/hermes; другой профиль, не объединять.)
/datum/armor/profiles/shared/vehicle/sealed/mecha/combat/durand__marauder
	melee = 50
	bullet = 55
	laser = 40
	energy = 30
	bomb = 30
	bio = 0
	rad = 60
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/working/ripley/firefighter — code/modules/vehicles/mecha/working/ripley.dm
//   /obj/vehicle/sealed/mecha/working/ripley/mkii — code/modules/vehicles/mecha/working/ripley.dm
// (Схожая броня: /datum/armor/profiles/shared/vehicle/sealed/mecha/combat/durand__marauder; другой профиль, не объединять.)
/datum/armor/profiles/shared/vehicle/sealed/mecha/working/ripley/firefighter__mkii
	melee = 40
	bullet = 30
	laser = 30
	energy = 30
	bomb = 60
	bio = 0
	rad = 70
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha — code/modules/vehicles/mecha/_mecha.dm
// (Схожая броня: /datum/armor/profiles/structure/table/plasmaglass; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha
	melee = 20
	bullet = 10
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat — code/modules/vehicles/mecha/combat/combat.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_changeling_weak__suit_armor_changeling_weak; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat
	melee = 30
	bullet = 30
	laser = 15
	energy = 20
	bomb = 20
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/durand/zeus — modular_bluemoon/kovac_shitcode/code/modules/vehicles/mecha.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/honker/dark; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/durand/zeus
	melee = 40
	bullet = 50
	laser = 70
	energy = 75
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/five_stars — code/modules/vehicles/mecha/combat/five_stars.dm
// (Схожая броня: /datum/armor/profiles/machinery/requests_console; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/five_stars
	melee = 100
	bullet = 50
	laser = 35
	energy = 35
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/gygax/dark — code/modules/vehicles/mecha/combat/gygax.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/honker/dark; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/gygax/dark
	melee = 40
	bullet = 40
	laser = 50
	energy = 35
	bomb = 20
	bio = 0
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/gygax/dark/loaded/hermes — modular_bluemoon/krashly/code/modules/mecha/mecha.dm
// (Схожая броня: /datum/armor/profiles/shared/vehicle/sealed/mecha/combat/durand__marauder; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/gygax/dark/loaded/hermes
	melee = 50
	bullet = 50
	laser = 50
	energy = 35
	bomb = 30
	bio = 0
	rad = 40
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/honker — code/modules/vehicles/mecha/combat/honker.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_and_acidproof_misc; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/honker
	melee = -20
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/honker/dark — code/game/gamemodes/clown_ops/clown_weapons.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/gygax/dark; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/honker/dark
	melee = 40
	bullet = 40
	laser = 50
	energy = 35
	bomb = 20
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/neovgre — code/modules/vehicles/mecha/combat/neovgre.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/chronos; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/neovgre
	melee = 70
	bullet = 80
	laser = 75
	energy = 75
	bomb = 70
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/phazon — code/modules/vehicles/mecha/combat/phazon.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/shielded/wizard/helmet; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/phazon
	melee = 10
	bullet = 25
	laser = 25
	energy = 25
	bomb = 20
	bio = 0
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/combat/savannah_ivanov — modular_splurt/code/modules/vehicles/mecha/combat/savannah_ivanov.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/tank; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/combat/savannah_ivanov
	melee = 45
	bullet = 40
	laser = 30
	energy = 30
	bomb = 40
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/vehicle/sealed/mecha/working/ripley — code/modules/vehicles/mecha/working/ripley.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/shielded/wizard/helmet; другой профиль, не объединять.)
/datum/armor/profiles/vehicle/sealed/mecha/working/ripley
	melee = 40
	bullet = 20
	laser = 10
	energy = 20
	bomb = 40
	bio = 0
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 0
