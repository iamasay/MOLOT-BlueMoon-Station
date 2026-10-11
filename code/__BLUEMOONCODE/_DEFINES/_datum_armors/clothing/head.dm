// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/head. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/beret/durathread — code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beanie_durathread__helmet_durathread; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/beret/durathread
	melee = 25
	bullet = 10
	laser = 20
	energy = 10
	bomb = 30
	bio = 15
	rad = 20
	fire = 100
	acid = 50
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/beret/sec/navywarden/syndicate — code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/security_and_syndicate_basic; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/beret/sec/navywarden/syndicate
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 25
	acid = 50
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/centhat — code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hopcap; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/centhat
	melee = 30
	bullet = 15
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/condom — modular_splurt/code/game/objects/items/lewd_items/genital_equipment/condom.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_service__wintercoat; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/condom
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 5
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/crown — code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/welding; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/crown
	melee = 15
	bullet = 0
	laser = 0
	energy = 15
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/fedora/det_hat — code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/durathread; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/fedora/det_hat
	melee = 25
	bullet = 5
	laser = 25
	energy = 10
	bomb = 0
	bio = 0
	rad = 0
	fire = 30
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/foilhat — code/modules/clothing/head/misc_special.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/foilhat
	melee = 0
	bullet = 0
	laser = -5
	energy = 0
	bomb = 0
	bio = 0
	rad = -5
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/goatpelt/king — modular_sand/code/modules/clothing/head/misc_special.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/space_ninja/ronin; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/goatpelt/king
	melee = 60
	bullet = 55
	laser = 55
	energy = 45
	bomb = 100
	bio = 20
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/alt — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/structure/urbanismtire; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/alt
	melee = 15
	bullet = 60
	laser = 10
	energy = 10
	bomb = 40
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/biker — modular_bluemoon/code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/soft/sec; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/biker
	melee = 40
	bullet = 25
	laser = 15
	energy = 10
	bomb = 20
	bio = 0
	rad = 0
	fire = 20
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/mopp — modular_splurt/code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/cbrn/mopp; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/cbrn/mopp
	melee = 35
	bullet = 40
	laser = 35
	energy = 40
	bomb = 25
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/mopp/advance — modular_splurt/code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/cbrn/mopp; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/cbrn/mopp/advance
	melee = 50
	bullet = 40
	laser = 40
	energy = 40
	bomb = 35
	bio = 110
	rad = 110
	fire = 50
	acid = 110
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/cbrn/sec — modular_splurt/code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/cbrn_engineering; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/cbrn/sec
	melee = 20
	bullet = 20
	laser = 20
	energy = 10
	bomb = 0
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/changeling_hivehead — modular_bluemoon/code/modules/antagonists/changeling/powers/hive_head.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/medical_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/changeling_hivehead
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 0
	bio = 50
	rad = 0
	fire = 30
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/clockwork — code/modules/antagonists/clockcult/clock_items/clockwork_armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/clockwork; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/clockwork
	melee = 50
	bullet = 70
	laser = 50
	energy = 50
	bomb = 60
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 60
	wound = 65

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/goner — modular_splurt/code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/armored_headgear; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/goner
	melee = 40
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 5
	rad = 5
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/infiltrator — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/knight_warlord; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/infiltrator
	melee = 40
	bullet = 40
	laser = 30
	energy = 40
	bomb = 70
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 35

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/knight — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/chaplain_and_adept_mech; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/knight
	melee = 60
	bullet = 35
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
//   /obj/item/clothing/head/helmet/knight/greyscale — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/toggle/lawyer/black/syndie; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/knight/greyscale
	melee = 35
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 10
	rad = 10
	fire = 40
	acid = 40
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/knight/ordinator — modular_bluemoon/code/modules/clothing/outfits/sets/ordinator.dm
// (Схожая броня: /datum/armor/profiles/structure/reagent_dispensers/urbanismbarrel; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/knight/ordinator
	melee = 50
	bullet = 50
	laser = 10
	energy = 30
	bomb = 35
	bio = 10
	rad = 30
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/nvg/hecu — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/swat; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/nvg/hecu
	melee = 40
	bullet = 40
	laser = 40
	energy = 40
	bomb = 50
	bio = 90
	rad = 30
	fire = 50
	acid = 50
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/plate/crusader/prophet — code/game/objects/items/religion.dm
// (Схожая броня: /datum/armor/profiles/shared/admiral_uniform_and_prison; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/plate/crusader/prophet
	melee = 60
	bullet = 60
	laser = 60
	energy = 50
	bomb = 70
	bio = 50
	rad = 50
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/riot — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/shared/sign__structure_sign; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/riot
	melee = 45
	bullet = 15
	laser = 5
	energy = 5
	bomb = 5
	bio = 2
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/roman — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/crown; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/roman
	melee = 25
	bullet = 0
	laser = 25
	energy = 10
	bomb = 10
	bio = 0
	rad = 0
	fire = 100
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/rus_cap — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/soft/sec; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/rus_cap
	melee = 30
	bullet = 25
	laser = 20
	energy = 10
	bomb = 25
	bio = 0
	rad = 20
	fire = 30
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/rus_ushanka — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/cmo; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/rus_ushanka
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 5
	bio = 50
	rad = 20
	fire = -10
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/sec/empire_head — modular_bluemoon/fluffs/code/head.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/stripper; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/sec/empire_head
	melee = 20
	bullet = 5
	laser = 10
	energy = 0
	bomb = 40
	bio = 0
	rad = 0
	fire = 5
	acid = 0
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/skull — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/knight/greyscale; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/skull
	melee = 25
	bullet = 25
	laser = 25
	energy = 10
	bomb = 10
	bio = 5
	rad = 20
	fire = 40
	acid = 20
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/swat — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/nvg/hecu; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/swat
	melee = 40
	bullet = 30
	laser = 30
	energy = 30
	bomb = 50
	bio = 90
	rad = 20
	fire = 50
	acid = 50
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/thunderdome — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/plasmaman/security/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/helmet/thunderdome
	melee = 40
	bullet = 30
	laser = 25
	energy = 10
	bomb = 25
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/explorer — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/explorer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hooded/explorer
	melee = 30
	bullet = 20
	laser = 20
	energy = 20
	bomb = 50
	bio = 100
	rad = 50
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/explorer/heva — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/engine/atmos/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hooded/explorer/heva
	melee = 20
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 100
	rad = 20
	fire = 100
	acid = 20
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/explorer/standard/improved — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/explorer/standard/improved; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hooded/explorer/standard/improved
	melee = 40
	bullet = 20
	laser = 20
	energy = 20
	bomb = 50
	bio = 100
	rad = 50
	fire = 100
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hooded/winterhood/durathread — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_hardhat__suit_fire; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hooded/winterhood/durathread
	melee = 20
	bullet = 8
	laser = 15
	energy = 8
	bomb = 25
	bio = 10
	rad = 15
	fire = 75
	acid = 37
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hopcap — code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/toggle/captains_parade/hop_formal; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hopcap
	melee = 30
	bullet = 25
	laser = 25
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/hunter — code/modules/clothing/head/misc.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/bridgeofficer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/hunter
	melee = 5
	bullet = 5
	laser = 5
	energy = 15
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/magus — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_hooded_cult_hoodie_void__suit_hooded_cultrobes_void; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/magus
	melee = 30
	bullet = 30
	laser = 30
	energy = 20
	bomb = 0
	bio = 0
	rad = 0
	fire = 10
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/soft/sec — code/modules/clothing/head/soft_caps.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hopcap; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/soft/sec
	melee = 30
	bullet = 25
	laser = 25
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 20
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/warden — code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beret_sec__brigdoc__helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/warden
	melee = 40
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 30
	acid = 60
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/welding — code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/head/welding — modular_splurt/code/modules/clothing/head/misc_special.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/welding; другой профиль, не объединять.)
/datum/armor/profiles/clothing/head/welding
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/HoS/beret/nri/security — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/head/HoS/beret/sol/security — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/head/cowboyhat/sec — code/modules/clothing/head/misc.dm
//   /obj/item/clothing/head/helmet/space/plasmaman/security — code/modules/clothing/spacesuits/plasmamen.dm
//   /obj/item/clothing/head/hooded/flagellantcuirass — modular_splurt/code/modules/awaymissions/mission_code/AGRComplex.dm
//   /obj/item/clothing/head/press_helmet — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/head/utilcover — modular_bluemoon/code/modules/clothing/head/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beret_sec__brigdoc__helmet; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/armored_headgear
	melee = 40
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/beanie/durathread — code/modules/clothing/head/beanie.dm
//   /obj/item/clothing/head/helmet/durathread — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/beret/durathread; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/beanie_durathread__helmet_durathread
	melee = 25
	bullet = 10
	laser = 20
	energy = 10
	bomb = 30
	bio = 15
	rad = 20
	fire = 100
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/beret/sec — code/modules/clothing/head/jobs.dm
//   /obj/item/clothing/head/brigdoc — modular_splurt/code/modules/clothing/lewd_clothing/head/hats.dm
//   /obj/item/clothing/head/helmet — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/head/helmet — modular_splurt/code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/armored_headgear; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/beret_sec__brigdoc__helmet
	melee = 40
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/caphat — code/modules/clothing/head/jobs.dm
//   /obj/item/clothing/head/caphat/formal/fedcover — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/caphat/formal/fedcover/black — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/kepi/orvi/command — modular_citadel/code/modules/clothing/trek.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beret_sec__brigdoc__helmet; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/captain
	melee = 40
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 25

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/HoS — code/modules/clothing/head/jobs.dm
//   /obj/item/clothing/head/blueshield — modular_splurt/code/modules/clothing/lewd_clothing/head/hats.dm
//   /obj/item/clothing/head/caphat/formal/fedcover/sec — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/helmet/blueshirt/blueshield — modular_splurt/code/modules/clothing/lewd_clothing/head/hats.dm
//   /obj/item/clothing/head/helmet/sec/blueshield — modular_splurt/code/modules/clothing/lewd_clothing/head/hats.dm
//   /obj/item/clothing/head/kepi/orvi/sec — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/head/soft/blueshield — modular_splurt/code/modules/clothing/lewd_clothing/head/hats.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/plasmaman/security/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/command_and_security
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
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/bluetaghelm — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/head/helmet/redtaghelm — code/modules/clothing/head/helmet.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/durathread; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/helmet/bluetaghelm__redtaghelm
	melee = 15
	bullet = 10
	laser = 20
	energy = 10
	bomb = 20
	bio = 0
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/soft/baseball — code/modules/clothing/head/soft_caps.dm
//   /obj/item/clothing/head/soft/inteq/baseball — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/soft/sec; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/head/soft/baseball__inteq_baseball
	melee = 35
	bullet = 35
	laser = 25
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 20
	acid = 90
	magic = 0
	wound = 5
