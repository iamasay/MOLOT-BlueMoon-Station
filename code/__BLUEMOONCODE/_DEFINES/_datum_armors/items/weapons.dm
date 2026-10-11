// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: items/weapons. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/kitchen/knife/shiv/plastitanium — code/game/objects/items/kitchen.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/crusader_plate; другой профиль, не объединять.)
/datum/armor/profiles/kitchen/knife/shiv/plastitanium
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 0
	rad = 0
	fire = 75
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/melee/baton — code/game/objects/items/stunbaton.dm
// (Схожая броня: /datum/armor/profiles/shared/disk_and_hand_tele_and_storage/bomb30_fire100_acid100; другой профиль, не объединять.)
/datum/armor/profiles/melee/baton
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 50
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/melee/powerfist — code/game/objects/items/powerfist.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_tools_and_weapons; другой профиль, не объединять.)
/datum/armor/profiles/melee/powerfist
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 40
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/kitchen/knife/shiv/plasma — code/game/objects/items/kitchen.dm
//   /obj/item/kitchen/knife/shiv/titanium — code/game/objects/items/kitchen.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/armor/secjacket__vest_dragoncora; другой профиль, не объединять.)
/datum/armor/profiles/shared/kitchen/knife/shiv/plasma__titanium
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield — code/game/objects/items/shields.dm
//   /obj/item/shield/adamantineshield — code/modules/research/xenobiology/crossbreeding/burning.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/car/clowncar; другой профиль, не объединять.)
/datum/armor/profiles/shared/shield/base__adamantineshield
	melee = 50
	bullet = 50
	laser = 50
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 80
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield/makeshift — code/game/objects/items/shields.dm
// (Схожая броня: /datum/armor/profiles/structure/closet; другой профиль, не объединять.)
/datum/armor/profiles/shield/makeshift
	melee = 25
	bullet = 25
	laser = 5
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 70
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield/riot/energy_proof — code/game/objects/items/shields.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/curator__det_suit; другой профиль, не объединять.)
/datum/armor/profiles/shield/riot/energy_proof
	melee = 30
	bullet = -10
	laser = 80
	energy = 80
	bomb = -40
	bio = 0
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield/riot/kinetic_proof — code/game/objects/items/shields.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/knight; другой профиль, не объединять.)
/datum/armor/profiles/shield/riot/kinetic_proof
	melee = 30
	bullet = 80
	laser = 0
	energy = 0
	bomb = -40
	bio = 0
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield/riot/ratvarian — code/modules/antagonists/clockcult/clock_items/clock_weapons/ratvarian_shield.dm
// (Схожая броня: /datum/armor/profiles/singularityhammer; другой профиль, не объединять.)
/datum/armor/profiles/shield/riot/ratvarian
	melee = 80
	bullet = 70
	laser = -10
	energy = -20
	bomb = 60
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/shield/riot/tower — code/game/objects/items/shields.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_juggernaut__suit_armor_heavy_juggernaut; другой профиль, не объединять.)
/datum/armor/profiles/shield/riot/tower
	melee = 95
	bullet = 95
	laser = 75
	energy = 60
	bomb = 90
	bio = 90
	rad = 0
	fire = 90
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/singularityhammer — code/game/objects/items/singularityhammer.dm
// (Схожая броня: /datum/armor/profiles/shared/shield/base__adamantineshield; другой профиль, не объединять.)
/datum/armor/profiles/singularityhammer
	melee = 50
	bullet = 50
	laser = 50
	energy = 0
	bomb = 50
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0
