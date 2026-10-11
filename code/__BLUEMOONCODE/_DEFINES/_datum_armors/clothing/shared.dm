// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/shared. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/cbrn — modular_splurt/code/modules/clothing/gloves.dm
//   /obj/item/clothing/head/helmet/cbrn — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/shoes/jackboots/cbrn — modular_splurt/code/modules/clothing/shoes/miscellaneous.dm
//   /obj/item/clothing/suit/cbrn — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_cbrn_sci__suit_cbrn_science; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cbrn
	melee = 5
	bullet = 0
	laser = 5
	energy = 5
	bomb = 0
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/eng — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/mask/gas/cbrn — modular_splurt/code/modules/clothing/masks/miscellaneous.dm
//   /obj/item/clothing/suit/cbrn/engineering — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_cbrn_cargo__suit_cbrn_cargo; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cbrn_engineering
	melee = 5
	bullet = 0
	laser = 5
	energy = 5
	bomb = 0
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/cbrn/mopp — modular_bluemoon/code/modules/clothing/gloves.dm
//   /obj/item/clothing/gloves/cbrn/mopp — modular_splurt/code/modules/clothing/gloves.dm
//   /obj/item/clothing/shoes/jackboots/cbrn/mopp — modular_bluemoon/code/modules/clothing/shoes/miscellaneous.dm
//   /obj/item/clothing/shoes/jackboots/cbrn/mopp — modular_splurt/code/modules/clothing/shoes/miscellaneous.dm
//   /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance — modular_splurt/code/modules/clothing/shoes/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/mask/gas/full__goner__sechailer_mopp; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cbrn_mopp
	melee = 10
	bullet = 0
	laser = 10
	energy = 10
	bomb = 10
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/winterhood/centcom — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/hooded/wintercoat/centcom — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/knight/ordinator; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/centcom_winter
	melee = 40
	bullet = 45
	laser = 45
	energy = 35
	bomb = 40
	bio = 25
	rad = 25
	fire = 35
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/donator/bm/cerberus_helmet/armored — modular_bluemoon/krashly/code/modules/clothing/armor.dm
//   /obj/item/clothing/suit/donator/bm/cerberus_suit/armored — modular_bluemoon/krashly/code/modules/clothing/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/storage/fluff/modernfedcoat/sec; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cerberus_armored
	melee = 45
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/glasses/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/gloves/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/shoes/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/suit/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/under/chameleon — code/modules/clothing/chameleon.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_chameleon__mask_chameleon; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/chameleon
	melee = 10
	bullet = 10
	laser = 10
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/chaplain — code/game/objects/items/holy_weapons.dm
//   /obj/item/clothing/suit/hooded/adept_mech — code/game/objects/items/holy_weapons.dm
//   /obj/item/clothing/suit/hooded/adept_mech_follower — code/game/objects/items/holy_weapons.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/knight; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/chaplain_and_adept_mech
	melee = 41
	bullet = 15
	laser = 5
	energy = 5
	bomb = 5
	bio = 2
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/plate/crusader — code/game/objects/items/religion.dm
//   /obj/item/clothing/shoes/plate — code/game/objects/items/religion.dm
//   /obj/item/clothing/suit/armor/plate/crusader — code/game/objects/items/religion.dm
// (Схожая броня: /datum/armor/profiles/kitchen/knife/shiv/plastitanium; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/crusader_plate
	melee = 50
	bullet = 50
	laser = 50
	energy = 40
	bomb = 60
	bio = 0
	rad = 0
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/berserkerhood — code/modules/antagonists/cult/cult_items.dm
//   /obj/item/clothing/suit/hooded/cultrobes/berserker — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/foilhat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cult_berserker
	melee = -50
	bullet = -50
	laser = -50
	energy = -50
	bomb = -50
	bio = -50
	rad = -50
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/cult_hoodie — code/modules/antagonists/cult/cult_items.dm
//   /obj/item/clothing/suit/hooded/cultrobes/cult_shield — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/hostile_environment; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/cult_shield
	melee = 75
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 75
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/gloves/tackler/combat/insulated/nano — modular_bluemoon/code/modules/clothing/nanosuit/nanosuit.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/rd/hev/cosmetic — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/mask/gas — code/modules/clothing/masks/gasmask.dm
//   /obj/item/clothing/mask/gas — modular_splurt/code/modules/clothing/masks/gasmask.dm
//   /obj/item/clothing/mask/surgical — code/modules/clothing/masks/miscellaneous.dm
//   /obj/item/clothing/mask/surgical/aesthetic — code/modules/clothing/masks/miscellaneous.dm
//   /obj/item/clothing/shoes/combat/coldres/nano — modular_bluemoon/code/modules/clothing/nanosuit/nanosuit.dm
//   /obj/item/clothing/suit/space/hardsuit/rd/hev/cosmetic — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/plaguedoctor; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/gloves_and_hardsuit_and_mask_and_shoes/bio100
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/invisihat/hatred — modular_bluemoon/code/modules/antagonists/hatred/hatred.dm
//   /obj/item/clothing/suit/jacket/leather/overcoat/hatred — modular_bluemoon/code/modules/antagonists/hatred/hatred.dm
// (Схожая броня: /datum/armor/profiles/shared/admiral_uniform_and_prison; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hatred_gear
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 40
	rad = 20
	fire = 70
	acid = 40
	magic = 0
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/caphat/formal/fedcover/medsci — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/kepi/orvi/medsci — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/hooded/wintercoat/medical — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/hooded/wintercoat/paramedic — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/storage/fluff/fedcoat/medsci — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/storage/fluff/modernfedcoat/medsci — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/toggle/labcoat/depjacket/med — code/modules/clothing/suits/labcoat.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/jacket/puffer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_and_suit/bio50_acid45
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 50
	rad = 0
	fire = 0
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/caphat/formal/fedcover/eng — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/kepi/orvi/eng — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/engineer — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/wintercoat/engineering — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/storage/fluff/fedcoat/eng — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/storage/fluff/modernfedcoat/eng — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/toggle/labcoat/depjacket/eng — code/modules/clothing/suits/labcoat.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_ce__wintercoat_ce; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_and_suit/rad20_fire30_acid45
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 20
	fire = 30
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/bio_hood — code/modules/clothing/suits/bio.dm
//   /obj/item/clothing/suit/bio_suit — code/modules/clothing/suits/bio.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/plaguedoc_new; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_bio_hood__suit_bio_suit
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 60
	fire = 30
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/bio_hood/security — code/modules/clothing/suits/bio.dm
//   /obj/item/clothing/suit/bio_suit/security — code/modules/clothing/suits/bio.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/mask/gas/full__goner__sechailer_mopp; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_bio_hood_security__suit_bio_suit_security
	melee = 25
	bullet = 15
	laser = 25
	energy = 10
	bomb = 25
	bio = 100
	rad = 80
	fire = 30
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/bomb_hood — code/modules/clothing/suits/utility.dm
//   /obj/item/clothing/suit/bomb_suit — code/modules/clothing/suits/utility.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/shoes/combat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_bomb_hood__suit_bomb_suit
	melee = 20
	bullet = 0
	laser = 20
	energy = 10
	bomb = 100
	bio = 0
	rad = 0
	fire = 80
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/bronze — code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/suit/bronze — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/machinery/computer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_bronze__suit_bronze
	melee = 5
	bullet = 0
	laser = -5
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 20
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/chameleon — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/mask/chameleon — code/modules/clothing/chameleon.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_chameleon__mask_chameleon
	melee = 5
	bullet = 5
	laser = 5
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/culthood — code/modules/antagonists/cult/cult_items.dm
//   /obj/item/clothing/suit/cultrobes — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/magusred; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_culthood__suit_cultrobes
	melee = 40
	bullet = 30
	laser = 40
	energy = 20
	bomb = 65
	bio = 10
	rad = 0
	fire = 10
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hardhat — code/modules/clothing/head/hardhat.dm
//   /obj/item/clothing/head/hardhat — modular_splurt/code/modules/clothing/head/hardhat.dm
//   /obj/item/clothing/suit/fire — code/modules/clothing/suits/utility.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beanie_durathread__helmet_durathread; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hardhat__suit_fire
	melee = 15
	bullet = 5
	laser = 20
	energy = 10
	bomb = 20
	bio = 10
	rad = 20
	fire = 100
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/cargo — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/suit/cbrn/cargo — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/cbrn_engineering; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_cbrn_cargo__suit_cbrn_cargo
	melee = 5
	bullet = 5
	laser = 5
	energy = 5
	bomb = 10
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/sci — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/suit/cbrn/science — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/cbrn; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_cbrn_sci__suit_cbrn_science
	melee = 5
	bullet = 0
	laser = 5
	energy = 5
	bomb = 20
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/changeling — code/modules/antagonists/changeling/powers/mutations.dm
//   /obj/item/clothing/suit/armor/changeling — code/modules/antagonists/changeling/powers/mutations.dm
// (Схожая броня: /datum/armor/profiles/machinery/requests_console; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_changeling__suit_armor_changeling
	melee = 70
	bullet = 60
	laser = 30
	energy = 40
	bomb = 10
	bio = 4
	rad = 0
	fire = 50
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/changeling/weak — modular_bluemoon/code/modules/antagonists/changeling/changeling_zombie.dm
//   /obj/item/clothing/suit/armor/changeling/weak — modular_bluemoon/code/modules/antagonists/changeling/changeling_zombie.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_changeling_weak__suit_armor_changeling_weak
	melee = 35
	bullet = 30
	laser = 15
	energy = 20
	bomb = 5
	bio = 4
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/elder_atmosian — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/suit/armor/elder_atmosian — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/hunter; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_elder_atmosian__suit_armor_elder_atmosian
	melee = 50
	bullet = 45
	laser = 55
	energy = 55
	bomb = 95
	bio = 100
	rad = 100
	fire = 100
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/exp — code/modules/jobs/job_types/research/expeditor.dm
//   /obj/item/clothing/suit/armor/vest/exp — code/modules/jobs/job_types/research/expeditor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/captain; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_exp__suit_armor_vest_exp
	melee = 40
	bullet = 40
	laser = 30
	energy = -20
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/hank — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/suit/armor/hank — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/changeling_hivehead; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_hank__suit_armor_hank
	melee = 20
	bullet = 20
	laser = 20
	energy = 10
	bomb = 0
	bio = 50
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 35

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/juggernaut — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/armor/heavy/juggernaut — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/tdome; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_juggernaut__suit_armor_heavy_juggernaut
	melee = 95
	bullet = 80
	laser = 50
	energy = 60
	bomb = 80
	bio = 100
	rad = 50
	fire = 95
	acid = 95
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/military — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/suit/armor/vest/knight/military — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/knight_warlord; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_military__suit_armor_vest_knight_military
	melee = 20
	bullet = 40
	laser = 40
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 10
	acid = 50
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/skull/ftu — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/head/helmet/skull/ftu — modular_bluemoon/fluffs/code/dragoncora.dm
//   /obj/item/clothing/suit/armor/vest/ftu — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/bulletproof; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_skull_ftu__suit_armor_vest_ftu
	melee = 30
	bullet = 60
	laser = 25
	energy = 20
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space — code/modules/clothing/spacesuits/_spacesuits.dm
//   /obj/item/clothing/suit/space — code/modules/clothing/spacesuits/_spacesuits.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_eva__suit_space_eva; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_space__suit_space
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 50
	fire = 80
	acid = 70
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/vanguard — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
//   /obj/item/clothing/suit/armor/vanguard — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_helmet_vanguard__suit_armor_vanguard
	melee = 35
	bullet = 35
	laser = 35
	energy = 35
	bomb = 25
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/ablative — code/modules/clothing/suits/ablativecoat.dm
//   /obj/item/clothing/suit/hooded/ablative — code/modules/clothing/suits/ablativecoat.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/durand/zeus; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hooded_ablative__suit_hooded_ablative
	melee = 10
	bullet = 10
	laser = 60
	energy = 60
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/cloakhood/drake — code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/cloak/drake — code/modules/clothing/suits/cloaks.dm
// (Схожая броня: /datum/armor/profiles/machinery/requests_console; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hooded_cloakhood_drake__suit_hooded_cloak_drake
	melee = 70
	bullet = 20
	laser = 35
	energy = 25
	bomb = 25
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/cloakhood/goliath — code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/cloak/goliath — code/modules/clothing/suits/cloaks.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/centhat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hooded_cloakhood_goliath__suit_hooded_cloak_goliath
	melee = 35
	bullet = 10
	laser = 25
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/cult_hoodie/void — code/modules/antagonists/eldritch_cult/eldritch_items.dm
//   /obj/item/clothing/suit/hooded/cultrobes/void — code/modules/antagonists/eldritch_cult/eldritch_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/magus; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hooded_cult_hoodie_void__suit_hooded_cultrobes_void
	melee = 30
	bullet = 30
	laser = 30
	energy = 30
	bomb = 15
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/explorer/exo — code/modules/mining/equipment/explorer_gear.dm
//   /obj/item/clothing/suit/hooded/explorer/exo — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/sec/empire_head; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_hooded_explorer_exo__suit_hooded_explorer_exo
	melee = 45
	bullet = 10
	laser = 10
	energy = 10
	bomb = 50
	bio = 25
	rad = 25
	fire = 10
	acid = 10
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/radiation — code/modules/clothing/suits/utility.dm
//   /obj/item/clothing/head/radiation — modular_splurt/code/modules/clothing/suits/utility.dm
//   /obj/item/clothing/suit/radiation — code/modules/clothing/suits/utility.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/color/yellow/nuclear_sanitation; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_radiation__suit_radiation
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 60
	rad = 100
	fire = 30
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/wizard — code/modules/clothing/suits/wiz_robe.dm
//   /obj/item/clothing/suit/wizrobe — code/modules/clothing/suits/wiz_robe.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/shielded/wizard/helmet; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head_wizard__suit_wizrobe
	melee = 30
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 20
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/knight/warlord — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/suit/armor/riot/knight/warlord — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_military__suit_armor_vest_knight_military; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/knight_warlord
	melee = 40
	bullet = 40
	laser = 40
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/space_ninja — code/modules/ninja/suit/head.dm
//   /obj/item/clothing/shoes/space_ninja — code/modules/ninja/suit/shoes.dm
//   /obj/item/clothing/suit/space/space_ninja — code/modules/ninja/suit/suit.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/space_ninja/wisdom; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/ninja_gear
	melee = 40
	bullet = 30
	laser = 20
	energy = 30
	bomb = 30
	bio = 30
	rad = 30
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/rabbit_helmet — modular_bluemoon/code/modules/clothing/outfits/sets/rabbit.dm
//   /obj/item/clothing/head/rabbit_helmet/grunt — modular_bluemoon/code/modules/clothing/outfits/sets/rabbit.dm
//   /obj/item/clothing/suit/armor/ego_gear/rabbit — modular_bluemoon/code/modules/clothing/outfits/sets/rabbit.dm
//   /obj/item/clothing/suit/armor/ego_gear/rabbit/grunts — modular_bluemoon/code/modules/clothing/outfits/sets/rabbit.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/abductor/vest/combat_armor; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/rabbit_gear
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 50
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/winterhood/syndicate — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits.dm
//   /obj/item/clothing/suit/armor — code/modules/clothing/suits/armor.dm
//   /obj/item/clothing/suit/armor/hos/platecarrier/makeshift — code/modules/clothing/suits/armor.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/sec — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/storage/fluff/fedcoat — modular_citadel/code/modules/clothing/trek.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/bone; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/security_and_syndicate_basic
	melee = 35
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10
