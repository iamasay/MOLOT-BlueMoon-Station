// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/gloves. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/bracer — code/modules/clothing/gloves/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/martial_arts_extended; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/bracer
	melee = 15
	bullet = 35
	laser = 35
	energy = 20
	bomb = 35
	bio = 35
	rad = 35
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/cbrn/mopp/advance — modular_splurt/code/modules/clothing/gloves.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/sechailer/mopp/advance; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/cbrn/mopp/advance
	melee = 15
	bullet = 0
	laser = 15
	energy = 15
	bomb = 20
	bio = 110
	rad = 110
	fire = 60
	acid = 110
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/clockwork — code/modules/antagonists/clockcult/clock_items/clockwork_armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/clockwork; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/clockwork
	melee = 80
	bullet = 70
	laser = 50
	energy = 50
	bomb = 60
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 70
	wound = 85

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/color/captain — code/modules/clothing/gloves/color.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/combat_and_martial_arts; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/color/captain
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 70
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/color/yellow/nuclear_sanitation — modular_splurt/code/modules/antagonists/ert_cleanup/ert_cleanup.dm
// (Схожая броня: /datum/armor/profiles/clothing/shoes/jackboots/nuclear_sanitation; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/color/yellow/nuclear_sanitation
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 20
	rad = 100
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/fingerless/pugilist/brassmountain — code/modules/clothing/gloves/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/fingerless/pugilist/hungryghost; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/fingerless/pugilist/brassmountain
	melee = 10
	bullet = 0
	laser = -10
	energy = 0
	bomb = 0
	bio = 35
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/fingerless/pugilist/hungryghost — code/modules/clothing/gloves/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/fingerless/pugilist/brassmountain; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/fingerless/pugilist/hungryghost
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 35
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/fingerless/pugilist/mauler — code/modules/clothing/gloves/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beanie_durathread__helmet_durathread; другой профиль, не объединять.)
/datum/armor/profiles/clothing/gloves/fingerless/pugilist/mauler
	melee = 35
	bullet = 35
	laser = 20
	energy = 10
	bomb = 55
	bio = 15
	rad = 15
	fire = 100
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/combat — code/modules/clothing/gloves/miscellaneous.dm
//   /obj/item/clothing/gloves/combat — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits.dm
//   /obj/item/clothing/gloves/krav_maga/combatglovesplus — code/datums/martial/krav_maga.dm
//   /obj/item/clothing/gloves/krav_maga/combatglovesplus — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits.dm
//   /obj/item/clothing/gloves/toggled/hug/combat_maid_civil — modular_bluemoon/fluffs/code/gloves.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/color/captain; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/gloves/combat_and_martial_arts
	melee = 0
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
//   /obj/item/clothing/gloves/claws — code/modules/antagonists/changeling/powers/mutations.dm
//   /obj/item/clothing/gloves/fingerless/pugilist/cling — code/modules/antagonists/changeling/powers/mutations.dm
//   /obj/item/clothing/gloves/krav_maga/combatglovesplus/extended — modular_bluemoon/code/modules/antagonists/changeling/powers/mutations.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/bracer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/gloves/martial_arts_extended
	melee = 20
	bullet = 20
	laser = 20
	energy = 20
	bomb = 35
	bio = 35
	rad = 35
	fire = 0
	acid = 0
	magic = 0
	wound = 0
