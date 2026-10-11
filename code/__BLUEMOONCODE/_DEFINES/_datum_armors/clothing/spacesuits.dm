// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/spacesuits. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/chronos — modular_sand/code/modules/clothing/spacesuits/chronosuit.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/computer_cryopod__cryopod; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/chronos
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	bomb = 30
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/deprivation_helmet — modular_splurt/code/modules/clothing/lewd_clothing/head/deprivation_helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/tscmask; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/deprivation_helmet
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 25
	rad = 0
	fire = 20
	acid = 15
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hostile_environment — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/hostile_environment; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/hostile_environment
	melee = 70
	bullet = 40
	laser = 10
	energy = 10
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/plasmaman/captain — code/modules/clothing/spacesuits/plasmamen.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/blueshield_and_captain; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/plasmaman/captain
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 40
	bio = 100
	rad = 10
	fire = 100
	acid = 85
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/plasmaman/engineering — code/modules/clothing/spacesuits/plasmamen.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_plasmaman__suit_space_eva_plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/plasmaman/engineering
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 10
	fire = 100
	acid = 75
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/plasmaman/rd — code/modules/clothing/spacesuits/plasmamen.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_plasmaman__suit_space_eva_plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/plasmaman/rd
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 100
	rad = 0
	fire = 100
	acid = 75
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/plasmaman/security/blueshield — modular_splurt/code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/thunderdome; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/space/plasmaman/security/blueshield
	melee = 40
	bullet = 30
	laser = 25
	energy = 10
	bomb = 25
	bio = 10
	rad = 0
	fire = 50
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/chronos — modular_sand/code/modules/clothing/spacesuits/chronosuit.dm
// (Схожая броня: /datum/armor/profiles/inactive_source/clothing/suit/space/chronos; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/chronos
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	bomb = 30
	bio = 100
	rad = 100
	fire = 100
	acid = 1000
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hostile_environment — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/deathsquad/praetor/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/hostile_environment
	melee = 70
	bullet = 40
	laser = 10
	energy = 10
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 50
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hunter — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_elder_atmosian__suit_armor_elder_atmosian; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/hunter
	melee = 60
	bullet = 40
	laser = 40
	energy = 50
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 25

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/space_ninja/ronin — code/modules/ninja/suit/suit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/rabbit_gear; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/space_ninja/ronin
	melee = 50
	bullet = 50
	laser = 40
	energy = 50
	bomb = 45
	bio = 30
	rad = 30
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/space_ninja/wisdom — code/modules/ninja/suit/suit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/shielded/wizard/helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/space_ninja/wisdom
	melee = 20
	bullet = 20
	laser = 15
	energy = 15
	bomb = 25
	bio = 30
	rad = 30
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/swat — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/wizard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/space/swat
	melee = 40
	bullet = 30
	laser = 30
	energy = 30
	bomb = 50
	bio = 90
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 25

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/chronos — code/modules/clothing/spacesuits/chronosuit.dm (не подключён в tgstation.dme)
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/chronos; другой профиль, не объединять.)
/datum/armor/profiles/inactive_source/clothing/head/helmet/space/chronos
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	bomb = 30
	bio = 90
	rad = 90
	fire = 100
	acid = 100
	magic = 0
	wound = 80

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/chronos — code/modules/clothing/spacesuits/chronosuit.dm (не подключён в tgstation.dme)
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/chronos; другой профиль, не объединять.)
/datum/armor/profiles/inactive_source/clothing/suit/space/chronos
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	bomb = 30
	bio = 90
	rad = 90
	fire = 100
	acid = 1000
	magic = 0
	wound = 80

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/syndicate/darktemplar — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/suit/space/syndicate/darktemplar — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/modsuit/inteq_nuclear; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/darktemplar_spacesuit
	melee = 50
	bullet = 50
	laser = 35
	energy = 30
	bomb = 60
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/beret — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/deathsquad — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/officer — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/deathsquad_and_shielded; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/deathsquad_and_officer
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/changeling — code/modules/antagonists/changeling/powers/mutations.dm
//   /obj/item/clothing/suit/space/changeling — code/modules/antagonists/changeling/powers/mutations.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_and_acidproof_misc; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_changeling__suit_space_changeling
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/eva — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/eva — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space__suit_space; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_eva__suit_space_eva
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 20
	fire = 50
	acid = 65
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/fragile — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/fragile — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/enclave_and_russian_army; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_fragile__suit_space_fragile
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 10
	fire = 0
	acid = 0
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/freedom — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/freedom — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/rd/hev/suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_freedom__suit_space_freedom
	melee = 20
	bullet = 40
	laser = 30
	energy = 25
	bomb = 100
	bio = 100
	rad = 100
	fire = 80
	acid = 80
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/pirate — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/pirate — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_syndicate__suit_space_syndicate; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_pirate__suit_space_pirate
	melee = 20
	bullet = 40
	laser = 30
	energy = 15
	bomb = 30
	bio = 30
	rad = 30
	fire = 60
	acid = 75
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/pirate/eva — code/modules/events/pirates.dm
//   /obj/item/clothing/suit/space/pirate/eva — code/modules/events/pirates.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/helmet; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_pirate_eva__suit_space_pirate_eva
	melee = 20
	bullet = 40
	laser = 30
	energy = 25
	bomb = 50
	bio = 100
	rad = 50
	fire = 80
	acid = 80
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/plasmaman — code/modules/clothing/spacesuits/plasmamen.dm
//   /obj/item/clothing/suit/space/eva/plasmaman — code/modules/clothing/spacesuits/plasmamen.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/plasmaman/rd; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_plasmaman__suit_space_eva_plasmaman
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 100
	acid = 75
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/rad — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/rad — modular_sand/code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/rad — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/rad — modular_sand/code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/machinery/space_heater; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_rad__suit_space_rad
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 100
	fire = 0
	acid = 0
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/syndicate — code/modules/clothing/spacesuits/syndi.dm
//   /obj/item/clothing/suit/space/syndicate — code/modules/clothing/spacesuits/syndi.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/cult/helmet; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_syndicate__suit_space_syndicate
	melee = 40
	bullet = 50
	laser = 30
	energy = 15
	bomb = 30
	bio = 30
	rad = 30
	fire = 80
	acid = 85
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/vanguard — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
//   /obj/item/clothing/suit/space/vanguard — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/soviet/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_vanguard__suit_space_vanguard
	melee = 20
	bullet = 15
	laser = 15
	energy = 0
	bomb = 35
	bio = 100
	rad = 20
	fire = 50
	acid = 65
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/vox — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
//   /obj/item/clothing/suit/space/vox — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_vox_medic__suit_space_vox_medic; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_vox__suit_space_vox
	melee = 60
	bullet = 50
	laser = 40
	energy = 15
	bomb = 30
	bio = 30
	rad = 30
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/vox/medic — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
//   /obj/item/clothing/suit/space/vox/medic — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_vox__suit_space_vox; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_vox_medic__suit_space_vox_medic
	melee = 45
	bullet = 40
	laser = 45
	energy = 20
	bomb = 25
	bio = 30
	rad = 30
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/vox/stealth — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
//   /obj/item/clothing/suit/space/vox/stealth — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/martial_arts_extended; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space_vox_stealth__suit_space_vox_stealth
	melee = 25
	bullet = 25
	laser = 20
	energy = 5
	bomb = 15
	bio = 30
	rad = 30
	fire = 0
	acid = 0
	magic = 0
	wound = 0
