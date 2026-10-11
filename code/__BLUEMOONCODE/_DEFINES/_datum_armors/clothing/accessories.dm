// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/accessories. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/kevlar — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/science_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/accessory/kevlar
	melee = 0
	bullet = 10
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 0
	acid = 25
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/medal/gold/captain/family — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/clothing/accessory/medal/gold/captain/family
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/medal/plasma — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/clothing/accessory/medal/plasma
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = -10
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/padding — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/clothing/shoes/jackboots/sec; другой профиль, не объединять.)
/datum/armor/profiles/clothing/accessory/padding
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 5
	bio = 0
	rad = 0
	fire = -20
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/plastics — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/bridgeofficer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/accessory/plastics
	melee = 5
	bullet = 0
	laser = 10
	energy = 10
	bomb = 0
	bio = 0
	rad = 0
	fire = 20
	acid = -40
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/skullcodpiece — code/modules/clothing/under/accessories.dm
//   /obj/item/clothing/accessory/talisman — code/modules/clothing/under/accessories.dm
// (Схожая броня: /datum/armor/profiles/clothing/accessory/kevlar; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/accessory/skullcodpiece__talisman
	melee = 5
	bullet = 5
	laser = 0
	energy = 0
	bomb = 10
	bio = 20
	rad = 5
	fire = 0
	acid = 25
	magic = 0
	wound = 0
