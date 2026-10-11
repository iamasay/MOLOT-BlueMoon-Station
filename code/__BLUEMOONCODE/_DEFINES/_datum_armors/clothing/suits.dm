// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/suits. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/abductor/vest — combat_armor_type — code/modules/antagonists/abductor/equipment/abduction_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/rabbit_gear; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/abductor/vest/combat_armor
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 50
	rad = 50
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/blastwave — modular_bluemoon/code/modules/clothing/blastwave_outfits/blastwave_suit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/armor_hos__hooded_teshari_beltcloak_jobs_hos; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/blastwave
	melee = 40
	bullet = 40
	laser = 40
	energy = 50
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/bone — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/security_and_syndicate_basic; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/bone
	melee = 35
	bullet = 25
	laser = 25
	energy = 35
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/bulletproof — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_skull_ftu__suit_armor_vest_ftu; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/bulletproof
	melee = 35
	bullet = 60
	laser = 20
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/centcom — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/heavy; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/centcom
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	rad = 100
	fire = 90
	acid = 90
	magic = 0
	wound = 90

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/clockwork — code/modules/antagonists/clockcult/clock_items/clockwork_armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/clockwork; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/clockwork
	melee = 60
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
//   /obj/item/clothing/suit/armor/heavy — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/deathsquad_and_shielded; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/heavy
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	rad = 100
	fire = 90
	acid = 90
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/heavy/adamantine — code/modules/research/xenobiology/crossbreeding/_clothing.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/tdome; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/heavy/adamantine
	melee = 70
	bullet = 70
	laser = 40
	energy = 40
	bomb = 80
	bio = 80
	rad = 80
	fire = 70
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/hos/ordinator — modular_bluemoon/code/modules/clothing/outfits/sets/ordinator.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/alt; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/hos/ordinator
	melee = 10
	bullet = 50
	laser = 0
	energy = 10
	bomb = 50
	bio = 0
	rad = 0
	fire = 20
	acid = 30
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/hos/ordinator/leader — modular_bluemoon/code/modules/clothing/outfits/sets/ordinator.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/hos/ordinator/leader
	melee = 20
	bullet = 60
	laser = 10
	energy = 40
	bomb = 50
	bio = 0
	rad = 30
	fire = 70
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/hos/platecarrier — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/security_and_syndicate_basic; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/hos/platecarrier
	melee = 40
	bullet = 35
	laser = 35
	energy = 45
	bomb = 25
	bio = 0
	rad = 0
	fire = 60
	acid = 60
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/riot — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/riot/knight; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/riot
	melee = 60
	bullet = 20
	laser = 20
	energy = 10
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/riot/knight — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/riot; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/riot/knight
	melee = 80
	bullet = 40
	laser = 10
	energy = 10
	bomb = 10
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/tdome — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/deathsquad_and_officer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/tdome
	melee = 80
	bullet = 80
	laser = 50
	energy = 50
	bomb = 100
	bio = 100
	rad = 100
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/agent — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/armor_hos__hooded_teshari_beltcloak_jobs_hos; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/agent
	melee = 50
	bullet = 40
	laser = 40
	energy = 45
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/blueshield — modular_splurt/code/modules/clothing/suits/vest.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/storage/fluff/modernfedcoat/sec; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/blueshield
	melee = 35
	bullet = 35
	laser = 30
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/darkcarapace/debug — modular_sand/code/modules/clothing/outfits/standard.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert/alert/debug/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/darkcarapace/debug
	melee = 95
	bullet = 95
	laser = 95
	energy = 95
	bomb = 95
	bio = 95
	rad = 100
	fire = 98
	acid = 98
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/durathread — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/armor/secjacket__vest_dragoncora; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/durathread
	melee = 20
	bullet = 10
	laser = 30
	energy = 20
	bomb = 15
	bio = 0
	rad = 0
	fire = 40
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/infiltrator — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/vehicle/sealed/mecha/combat/savannah_ivanov; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/infiltrator
	melee = 40
	bullet = 40
	laser = 30
	energy = 40
	bomb = 70
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/stripper — modular_splurt/code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/miner_and_officer_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/armor/vest/stripper
	melee = 15
	bullet = 10
	laser = 10
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/blackops — modular_bluemoon/code/modules/awaymissions/blackmesa/mesa_clothing.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/biker; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/blackops
	melee = 30
	bullet = 40
	laser = 5
	energy = 0
	bomb = 20
	bio = 15
	rad = 5
	fire = 5
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/caution — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/miner_and_officer_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/caution
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/cbrn/mopp — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/cbrn/mopp; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/cbrn/mopp
	melee = 35
	bullet = 35
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
//   /obj/item/clothing/suit/cbrn/mopp/advance — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert_and_hos; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/cbrn/mopp/advance
	melee = 45
	bullet = 25
	laser = 50
	energy = 50
	bomb = 40
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/cbrn/security — modular_splurt/code/modules/clothing/suits/heavy.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/cbrn/mopp; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/cbrn/security
	melee = 25
	bullet = 25
	laser = 25
	energy = 30
	bomb = 0
	bio = 100
	rad = 100
	fire = 40
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/flakjack — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/science_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/flakjack
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 5
	bio = 0
	rad = 0
	fire = -5
	acid = -15
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/goner — modular_splurt/code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/curator__det_suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/goner
	melee = 25
	bullet = 10
	laser = 25
	energy = 10
	bomb = 5
	bio = 5
	rad = 5
	fire = 5
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/corpus/jp — modular_splurt/code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/admiral_uniform_and_prison; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/corpus/jp
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 0
	rad = 50
	fire = 50
	acid = 50
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/corpus/s — modular_splurt/code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/toggle/captains_parade/hop_formal; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/corpus/s
	melee = 30
	bullet = 30
	laser = 30
	energy = 20
	bomb = 20
	bio = 20
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/cultrobes/eldritch — code/modules/antagonists/eldritch_cult/eldritch_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/magusred; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/cultrobes/eldritch
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 35
	bio = 20
	rad = 0
	fire = 20
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/cultrobes/flagellantcuirass — modular_splurt/code/modules/awaymissions/mission_code/AGRComplex.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/stripper; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/cultrobes/flagellantcuirass
	melee = 10
	bullet = 10
	laser = 10
	energy = 5
	bomb = 5
	bio = 5
	rad = 5
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/explorer — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hooded/explorer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/explorer
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
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/explorer/heva — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/machinery/door/firedoor; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/explorer/heva
	melee = 20
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 100
	rad = 80
	fire = 100
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/explorer/standard/improved — code/modules/mining/equipment/explorer_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hooded/explorer/standard/improved; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/explorer/standard/improved
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
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/plaguedoc_new — modular_bluemoon/krashly/code/modules/clothing/armor.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_bio_hood__suit_bio_suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/plaguedoc_new
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 75
	fire = 50
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/mining — modular_splurt/code/modules/clothing/suits/cloaks.dm
// (Схожая броня: /datum/armor/profiles/shared/wood_and_bamboo; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/teshari/beltcloak/jobs/mining
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 20
	bio = 0
	rad = 0
	fire = 70
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/captain — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/security_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/captain
	melee = 25
	bullet = 30
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/captain/jungle — code/modules/awaymissions/mission_code/jungleresort.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_service__wintercoat; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/captain/jungle
	melee = 5
	bullet = 5
	laser = 5
	energy = 0
	bomb = 0
	bio = 10
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/chemistry — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/fingerless/pugilist/hungryghost; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/chemistry
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 30
	rad = 0
	fire = 30
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/cmo — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/jacket/puffer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/cmo
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 50
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/durathread — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/helmet/bluetaghelm__redtaghelm; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/durathread
	melee = 15
	bullet = 8
	laser = 25
	energy = 5
	bomb = 12
	bio = 0
	rad = 0
	fire = 0
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/hop — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/hop
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 5
	bio = 5
	rad = 0
	fire = 0
	acid = 5
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/hos — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/captain; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/hos
	melee = 35
	bullet = 35
	laser = 35
	energy = 15
	bomb = 30
	bio = 0
	rad = 0
	fire = 0
	acid = 55
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/narsie — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/rus_cap; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/narsie
	melee = 30
	bullet = 20
	laser = 30
	energy = 10
	bomb = 30
	bio = 10
	rad = 10
	fire = 30
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/ratvar — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/vehicle; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/ratvar
	melee = 30
	bullet = 45
	laser = -10
	energy = 0
	bomb = 30
	bio = 0
	rad = 0
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/rd — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/abductor; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/rd
	melee = 0
	bullet = 0
	laser = 5
	energy = 0
	bomb = 15
	bio = 5
	rad = 5
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/syndicate — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/security_and_syndicate_basic; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/hooded/wintercoat/syndicate
	melee = 25
	bullet = 15
	laser = 30
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 45
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/jacket/puffer — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/cmo; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/jacket/puffer
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 50
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/magusred — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_culthood__suit_cultrobes; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/magusred
	melee = 50
	bullet = 30
	laser = 50
	energy = 20
	bomb = 25
	bio = 10
	rad = 0
	fire = 10
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/storage/fluff/modernfedcoat/sec — modular_citadel/code/modules/clothing/trek.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/storage/fluff/modernfedcoat/sec
	melee = 30
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/toggle/captains_parade/hop_formal — modular_splurt/code/modules/clothing/suits/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head/beret_sec__brigdoc__helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/toggle/captains_parade/hop_formal
	melee = 30
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
//   /obj/item/clothing/suit/toggle/labcoat/depjacket/eng/chief_engineer — code/modules/clothing/suits/labcoat.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_ce__wintercoat_ce; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/toggle/labcoat/depjacket/eng/chief_engineer
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 40
	fire = 60
	acid = 65
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/toggle/labcoat/rd — modular_bluemoon/phenyamomota/code/modules/clothing/labcoat.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_plasmaman__suit_space_eva_plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/toggle/labcoat/rd
	melee = 5
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 80
	rad = 0
	fire = 80
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/toggle/lawyer/black/syndie — code/modules/clothing/suits/jobs.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/inteq__syndicate__syndicate_skirt; другой профиль, не объединять.)
/datum/armor/profiles/clothing/suit/toggle/lawyer/black/syndie
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 10
	rad = 10
	fire = 40
	acid = 40
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/abductor/vest — code/modules/antagonists/abductor/equipment/abduction_gear.dm
//   /obj/item/clothing/suit/armor/abductor/vest — stealth_armor_type — code/modules/antagonists/abductor/equipment/abduction_gear.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hooded/winterhood/durathread; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/armor/abductor/vest/base__stealth_armor
	melee = 15
	bullet = 15
	laser = 15
	energy = 15
	bomb = 15
	bio = 15
	rad = 15
	fire = 70
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/nri_coat — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/suit/armor/nri_vest — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/suit/armor/solfed_coat — modular_bluemoon/kovac_shitcode/code/solfed.dm
// (Схожая броня: /datum/armor/profiles/shared/admiral_uniform_and_prison; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/armor/nri_coat__nri_vest__solfed_coat
	melee = 55
	bullet = 65
	laser = 65
	energy = 65
	bomb = 40
	bio = 50
	rad = 100
	fire = 40
	acid = 50
	magic = 0
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/secjacket — code/modules/clothing/suits/armor.dm
//   /obj/item/clothing/suit/armor/vest/dragoncora — modular_bluemoon/fluffs/code/dragoncora.dm
// (Схожая броня: /datum/armor/profiles/shared/kitchen/knife/shiv/plasma__titanium; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/armor/secjacket__vest_dragoncora
	melee = 20
	bullet = 20
	laser = 25
	energy = 20
	bomb = 25
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/hos — code/modules/clothing/suits/armor.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/hos — modular_splurt/code/modules/clothing/suits/cloaks.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/blastwave; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/armor_hos__hooded_teshari_beltcloak_jobs_hos
	melee = 40
	bullet = 40
	laser = 40
	energy = 50
	bomb = 25
	bio = 0
	rad = 0
	fire = 70
	acid = 90
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/brigdoc — modular_splurt/code/modules/clothing/suits/vest.dm
//   /obj/item/clothing/suit/fakearmor/press — modular_splurt/code/modules/clothing/suits/vest.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/corpus/s; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/brigdoc__fakearmor_press
	melee = 30
	bullet = 30
	laser = 30
	energy = 10
	bomb = 0
	bio = 40
	rad = 0
	fire = 50
	acid = 40
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/armor/vest/capcarapace — code/modules/clothing/suits/armor.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/command — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/storage/fluff/fedcoat/capt — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/storage/fluff/modernfedcoat — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/toggle/captains_parade — code/modules/clothing/suits/armor.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/armor/vest/agent; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/command
	melee = 50
	bullet = 40
	laser = 50
	energy = 50
	bomb = 25
	bio = 0
	rad = 0
	fire = 100
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/curator — code/modules/clothing/suits/jobs.dm
//   /obj/item/clothing/suit/det_suit — code/modules/clothing/suits/jobs.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/goner; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/curator__det_suit
	melee = 25
	bullet = 10
	laser = 25
	energy = 10
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/ce — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/wintercoat/ce — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_and_suit/rad20_fire30_acid45; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_ce__wintercoat_ce
	melee = 0
	bullet = 0
	laser = 5
	energy = 0
	bomb = 10
	bio = 0
	rad = 30
	fire = 35
	acid = 45
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/service — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/wintercoat — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/rank/civilian_and_medical/bio10_wound5; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_service__wintercoat
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 10
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/viro — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/jacket/puffer/vest — code/modules/clothing/suits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/jacket/puffer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/hooded_wintercoat_viro__jacket_puffer_vest
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 30
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/suns_labcoat — modular_bluemoon/fluffs/code/modules/suns/code/suns.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/cmo — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/hooded/teshari/beltcloak/jobs/medical — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/suit/toggle/labcoat — code/modules/clothing/suits/labcoat.dm
//   /obj/item/clothing/suit/toggle/labcoat — modular_bluemoon/phenyamomota/code/modules/clothing/labcoat.dm
// (Схожая броня: /datum/armor/profiles/clothing/gloves/fingerless/pugilist/hungryghost; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/medical_coats
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 50
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/miner — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/toggle/captains_parade/hos_formal/officerian_coat — modular_bluemoon/fluffs/code/suit.dm
//   /obj/item/clothing/suit/toggle/captains_parade/hos_formal/officerian_coat_oversized — modular_bluemoon/fluffs/code/suit.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/miner_and_officer_coats
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/robotics — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/hooded/wintercoat/science — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/toggle/labcoat/depjacket/sci — code/modules/clothing/suits/labcoat.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/rnd/scientist; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/science_coats
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/hooded/wintercoat/security — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/toggle/labcoat/depjacket/sec — code/modules/clothing/suits/labcoat.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/wintercoat/captain; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/suit/security_coats
	melee = 25
	bullet = 15
	laser = 30
	energy = 10
	bomb = 25
	bio = 0
	rad = 0
	fire = 0
	acid = 45
	magic = 0
	wound = 0
