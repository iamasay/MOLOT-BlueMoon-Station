// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/shoes. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/combat/swat — code/modules/clothing/shoes/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/fingerless/pugilist/mauler; другой профиль, не объединять.)
/datum/armor/profiles/clothing/shoes/combat/swat
	melee = 40
	bullet = 30
	laser = 25
	energy = 25
	bomb = 50
	bio = 30
	rad = 30
	fire = 90
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/galoshes — code/modules/clothing/shoes/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/clothing/shoes/galoshes
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 40
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/jackboots/nuclear_sanitation — modular_splurt/code/modules/antagonists/ert_cleanup/ert_cleanup.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/color/yellow/nuclear_sanitation; другой профиль, не объединять.)
/datum/armor/profiles/clothing/shoes/jackboots/nuclear_sanitation
	melee = 0
	bullet = 0
	laser = 0
	energy = 5
	bomb = 5
	bio = 0
	rad = 100
	fire = 10
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/jackboots/powerbots — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/standard; другой профиль, не объединять.)
/datum/armor/profiles/clothing/shoes/jackboots/powerbots
	melee = 15
	bullet = 15
	laser = 15
	energy = 15
	bomb = 0
	bio = 0
	rad = 0
	fire = 40
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/jackboots/sec — code/modules/clothing/shoes/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/security/officer/util/syndicate; другой профиль, не объединять.)
/datum/armor/profiles/clothing/shoes/jackboots/sec
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 30
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/shoes/clown_shoes/banana_shoes/combat — code/game/gamemodes/clown_ops/clown_weapons.dm
//   /obj/item/clothing/shoes/clown_shoes/combat — code/game/gamemodes/clown_ops/clown_weapons.dm
//   /obj/item/clothing/shoes/combat — code/modules/clothing/shoes/miscellaneous.dm
//   /obj/item/clothing/shoes/combat — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits.dm
// (Схожая броня: /datum/armor/profiles/shared/kitchen/knife/shiv/plasma__titanium; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/shoes/combat
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 50
	bio = 10
	rad = 0
	fire = 70
	acid = 50
	magic = 0
	wound = 0
