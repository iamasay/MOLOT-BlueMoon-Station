// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/masks. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/atmos — code/modules/clothing/masks/gasmask.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_plasmaman__suit_space_eva_plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/atmos
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 100
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/dagoth — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/rd/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/dagoth
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/heva — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_and_suit/rad20_fire30_acid45; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/heva
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 60
	fire = 40
	acid = 50
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/plaguedoctor — code/modules/clothing/masks/gasmask.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves_and_hardsuit_and_mask_and_shoes/bio100; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/plaguedoctor
	melee = 0
	bullet = 0
	laser = 5
	energy = 5
	bomb = 0
	bio = 100
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/plaguedoctor/red — modular_splurt/code/game/objects/items/plaguedoc.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves_and_hardsuit_and_mask_and_shoes/bio100; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/plaguedoctor/red
	melee = 0
	bullet = 0
	laser = 2
	energy = 2
	bomb = 0
	bio = 75
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/radmask — modular_splurt/code/modules/clothing/masks/gasmask.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/radkini; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/radmask
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 30
	fire = 10
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/sechailer/mopp/advance — modular_splurt/code/modules/clothing/masks/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/cbrn/mopp/advance; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/sechailer/mopp/advance
	melee = 20
	bullet = 10
	laser = 20
	energy = 20
	bomb = 20
	bio = 110
	rad = 110
	fire = 50
	acid = 110
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/tscmask — modular_splurt/code/modules/clothing/masks/gasmask.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/deprivation_helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/tscmask
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 20
	rad = 10
	fire = 10
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/welding — code/modules/clothing/masks/gasmask.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/welding; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/gas/welding
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 55
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/infiltrator — code/modules/clothing/masks/boxing.dm
//   /obj/item/clothing/mask/infiltrator — modular_splurt/code/modules/clothing/masks/boxing.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/clothing/mask/infiltrator
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 0
	bio = 0
	rad = 10
	fire = 30
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/exo — code/modules/mining/equipment/explorer_gear.dm
//   /obj/item/clothing/mask/gas/explorer — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_and_suit/bio50_acid45; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/mask/gas/exo__explorer
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 5
	bio = 50
	rad = 0
	fire = 20
	acid = 40
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mask/gas/full — modular_bluemoon/code/modules/clothing/blastwave_outfits/blastwave_mask.dm
//   /obj/item/clothing/mask/gas/goner — modular_splurt/code/modules/clothing/masks/gasmask.dm
//   /obj/item/clothing/mask/gas/sechailer/mopp — modular_splurt/code/modules/clothing/masks/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/cbrn_mopp; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/mask/gas/full__goner__sechailer_mopp
	melee = 10
	bullet = 5
	laser = 10
	energy = 10
	bomb = 10
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0
