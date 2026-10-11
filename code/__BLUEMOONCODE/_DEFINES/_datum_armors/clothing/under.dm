// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/under. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under — code/modules/clothing/under/_under.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/enclave_and_russian_army; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/abductor — code/modules/antagonists/abductor/equipment/abduction_gear.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/rank/rnd/research_director/alt__turtleneck; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/abductor
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 10
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/bm/sigu — modular_bluemoon/code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/light_duty; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/bm/sigu
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 30
	acid = 30
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/costume/gladiator/ash_walker — code/modules/clothing/under/costume.dm
// (Схожая броня: /datum/armor/profiles/structure/closet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/costume/gladiator/ash_walker
	melee = 25
	bullet = 5
	laser = 0
	energy = 0
	bomb = 10
	bio = 10
	rad = 0
	fire = 70
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/goner — modular_splurt/code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/light_duty; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/goner
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 5
	rad = 5
	fire = 30
	acid = 30
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/inteq/baseball — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/syndicate/baseball; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/inteq/baseball
	melee = 15
	bullet = 20
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 40
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/inteq/tactical_gorka — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/inteq__syndicate__syndicate_skirt; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/inteq/tactical_gorka
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 0
	bio = 0
	rad = 10
	fire = 50
	acid = 20
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/misc/adminsuit — code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/modsuit/debug; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/misc/adminsuit
	melee = 100
	bullet = 100
	laser = 100
	energy = 100
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 1000

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/misc/durathread — code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/machinery/computer; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/misc/durathread
	melee = 10
	bullet = 0
	laser = 10
	energy = 0
	bomb = 5
	bio = 0
	rad = 0
	fire = 40
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/plasmaman — code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman/engineering; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/plasmaman
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 95
	acid = 95
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/plasmaman/captain — code/modules/clothing/under/jobs/Plasmaman/civilian_service.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman/security; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/plasmaman/captain
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 95
	acid = 95
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/plasmaman/engineering — code/modules/clothing/under/jobs/Plasmaman/engineering.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/plasmaman/engineering
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 10
	fire = 95
	acid = 95
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/plasmaman/rd — code/modules/clothing/under/jobs/Plasmaman/medsci.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/plasmaman/rd
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 100
	rad = 0
	fire = 95
	acid = 95
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/plasmaman/security — code/modules/clothing/under/jobs/Plasmaman/security.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman/captain; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/plasmaman/security
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 95
	acid = 95
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/radkini — modular_splurt/code/modules/clothing/under/jobs/engineering.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/gas/radmask; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/radkini
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 50
	fire = 10
	acid = 10
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/bridgeofficer — code/modules/clothing/under/jobs/command.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/bridgeofficer
	melee = 5
	bullet = 0
	laser = 5
	energy = 5
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/brigdoc — modular_splurt/code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/light_duty; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/brigdoc
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 10
	rad = 0
	fire = 20
	acid = 30
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/cargo/miner — code/modules/clothing/under/jobs/cargo.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/air_sensor/base__tarkon; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/cargo/miner
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 0
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/engineering/atmospheric_technician — code/modules/clothing/under/jobs/engineering.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_gloves_botanic_leather__vending_refill; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/engineering/atmospheric_technician
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 70
	acid = 20
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/engineering/chief_engineer — code/modules/clothing/under/jobs/engineering.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/combat_and_martial_arts; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/engineering/chief_engineer
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 10
	fire = 80
	acid = 40
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/engineering/engineer — code/modules/clothing/under/jobs/engineering.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/engineering/atmospheric_technician; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/engineering/engineer
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 10
	fire = 60
	acid = 20
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/medical/chemist — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/chemist — modular_bluemoon/phenyamomota/code/modules/clothing/under_med.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/syndicate_civil; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/medical/chemist
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 10
	rad = 0
	fire = 50
	acid = 65
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/rnd/research_director — code/modules/clothing/under/jobs/rnd.dm
// (Схожая броня: /datum/armor/profiles/clothing/accessory/kevlar; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/rnd/research_director
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 10
	rad = 0
	fire = 0
	acid = 35
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/rnd/scientist — code/modules/clothing/under/jobs/rnd.dm
//   /obj/item/clothing/under/rank/rnd/scientist — modular_bluemoon/phenyamomota/code/modules/clothing/under_sci.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/science_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/rnd/scientist
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
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/security/officer/util/syndicate — code/modules/clothing/under/jobs/security.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/rank/security/officer/util/syndicate
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/suit/lobotomy/rabbit — modular_bluemoon/code/modules/clothing/outfits/sets/rabbit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/tactical; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/suit/lobotomy/rabbit
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 10
	rad = 10
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/baseball — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/inteq/baseball; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/baseball
	melee = 15
	bullet = 5
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 40
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/bloodred/sleepytime — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/shared/fireproof_and_acidproof_misc; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/bloodred/sleepytime
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 100
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/coldres — code/modules/awaymissions/mission_code/snowdin.dm
// (Схожая броня: /datum/armor/profiles/clothing/mask/infiltrator; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/coldres
	melee = 20
	bullet = 10
	laser = 0
	energy = 5
	bomb = 0
	bio = 0
	rad = 0
	fire = 25
	acid = 25
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/ordinator — modular_bluemoon/code/modules/clothing/outfits/sets/ordinator.dm
// (Схожая броня: /datum/armor/profiles/shared/vehicle/ridden_wheelchair__sealed_vectorcraft_rideable_wheelchair; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/ordinator
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 0
	rad = 0
	fire = 10
	acid = 20
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/ordinator/leader — modular_bluemoon/code/modules/clothing/outfits/sets/ordinator.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/armor/secjacket__vest_dragoncora; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/ordinator/leader
	melee = 20
	bullet = 20
	laser = 30
	energy = 30
	bomb = 20
	bio = 0
	rad = 10
	fire = 50
	acid = 40
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/soviet — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/miner_and_officer_coats; другой профиль, не объединять.)
/datum/armor/profiles/clothing/under/syndicate/soviet
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
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/blastwave — modular_bluemoon/code/modules/clothing/blastwave_outfits/blastwave_uniform.dm
//   /obj/item/clothing/under/plasmaman/security/blueshield — modular_splurt/code/modules/clothing/under/miscellaneous.dm
//   /obj/item/clothing/under/rank/blueshield — modular_splurt/code/modules/clothing/under/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/under/light_duty; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/blueshield
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 0
	bio = 0
	rad = 0
	fire = 20
	acid = 30
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/captain/util — code/modules/clothing/under/jobs/command.dm
//   /obj/item/clothing/under/rank/captain/utility/syndicate — code/modules/clothing/under/jobs/command.dm
//   /obj/item/clothing/under/rank/engineering/engineer/util/syndicate — code/modules/clothing/under/jobs/engineering.dm
//   /obj/item/clothing/under/rank/rnd/scientist/utility/syndicate — code/modules/clothing/under/jobs/rnd.dm
//   /obj/item/clothing/under/syndicate/scrubs — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/medical_coats; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/command_and_syndicate_utility
	melee = 10
	bullet = 5
	laser = 0
	energy = 0
	bomb = 0
	bio = 50
	rad = 0
	fire = 50
	acid = 40
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/enclave — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/enclave_alt — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/rus_army — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/rus_army_alt — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/enclave_and_russian_army
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
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/security/head_of_security — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/trek/command/orv/sec — code/modules/clothing/under/trek.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/rank/security/officer/util/syndicate; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/hos_and_orville_security
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/inteq — modular_bluemoon/krashly/code/modules/clothing/under.dm
//   /obj/item/clothing/under/syndicate — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/skirt — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/inteq/tactical_gorka; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/inteq__syndicate__syndicate_skirt
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 0
	bio = 0
	rad = 10
	fire = 50
	acid = 40
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/bm/caprevskirt — modular_bluemoon/code/modules/clothing/under/skirt_dress.dm
//   /obj/item/clothing/under/bm/regaloutfit — modular_bluemoon/code/modules/clothing/under/miscellaneous.dm
//   /obj/item/clothing/under/costume/gamberson/military — modular_bluemoon/code/modules/clothing/under/costume.dm
//   /obj/item/clothing/under/rank/captain — code/modules/clothing/under/jobs/command.dm
//   /obj/item/clothing/under/rank/security/detective — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/rank/security/officer — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/rank/security/skirt/slut — modular_splurt/code/modules/clothing/under/miscellaneous.dm
//   /obj/item/clothing/under/rank/security/warden — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/trek/sec/orv — code/modules/clothing/under/trek.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/bm/sigu; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/light_duty
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 30
	acid = 30
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/civilian/janitor — code/modules/clothing/under/jobs/civilian/civilian.dm
//   /obj/item/clothing/under/rank/medical/chief_medical_officer — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/chief_medical_officer — modular_bluemoon/phenyamomota/code/modules/clothing/under_med.dm
//   /obj/item/clothing/under/rank/medical/doctor — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/doctor — modular_bluemoon/phenyamomota/code/modules/clothing/under_med.dm
//   /obj/item/clothing/under/rank/medical/doctor/nurse — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/geneticist — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/paramedic — code/modules/clothing/under/jobs/medical.dm
//   /obj/item/clothing/under/rank/medical/paramedic — modular_bluemoon/phenyamomota/code/modules/clothing/under_med.dm
//   /obj/item/clothing/under/rank/medical/virologist — code/modules/clothing/under/jobs/medical.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/suit/hooded/teshari_beltcloak_jobs_service__wintercoat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/rank/civilian_and_medical/bio10_wound5
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
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/rank/rnd/research_director/alt — code/modules/clothing/under/jobs/rnd.dm
//   /obj/item/clothing/under/rank/rnd/research_director/turtleneck — code/modules/clothing/under/jobs/rnd.dm
//   /obj/item/clothing/under/rank/rnd/research_director/turtleneck — modular_bluemoon/phenyamomota/code/modules/clothing/under_sci.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/abductor; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/rank/rnd/research_director/alt__turtleneck
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 10
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/syndicate/bloodred/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/camo/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/combat/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/maid/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/overalls/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/overalls/skirt/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/skirt/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/sniper/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/tacticool — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/tacticool/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
//   /obj/item/clothing/under/syndicate/tacticool/skirt — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/under/syndicate/tacticool/skirt/civil — modular_bluemoon/code/modules/clothing/syndie_edits/syndie_edits_civil-version.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/syndicate_civil
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/under/alliance/tactical_gorka — modular_bluemoon/code/modules/clothing/assasin_suit.dm
//   /obj/item/clothing/under/color/grey/glorf — code/modules/clothing/under/color.dm
//   /obj/item/clothing/under/pact_ninja/tactical_gorka — modular_bluemoon/code/modules/clothing/pact_ninja_suit.dm
//   /obj/item/clothing/under/syndicate/bloodred — code/modules/clothing/under/syndicate.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/suit/lobotomy/rabbit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/under/tactical
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 0
	bio = 0
	rad = 10
	fire = 100
	acid = 100
	magic = 0
	wound = 10
