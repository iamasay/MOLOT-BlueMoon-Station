// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/hardsuits. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/advancedpa — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/advancedpahelmet/helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/advancedpa/suit
	melee = 95
	bullet = 95
	laser = 70
	energy = 80
	bomb = 70
	bio = 100
	rad = 40
	fire = 100
	acid = 100
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/advancedpahelmet — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/advancedpa/suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/advancedpahelmet/helmet
	melee = 95
	bullet = 90
	laser = 70
	energy = 80
	bomb = 70
	bio = 100
	rad = 40
	fire = 100
	acid = 100
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/corpus — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/standard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/corpus/helmet
	melee = 10
	bullet = 5
	laser = 10
	energy = 5
	bomb = 10
	bio = 100
	rad = 75
	fire = 50
	acid = 75
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/corpus — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/standard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/corpus/suit
	melee = 15
	bullet = 10
	laser = 15
	energy = 10
	bomb = 10
	bio = 100
	rad = 100
	fire = 50
	acid = 75
	magic = 0
	wound = 25

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/cult — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/cult/suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/cult/helmet
	melee = 60
	bullet = 50
	laser = 30
	energy = 15
	bomb = 30
	bio = 30
	rad = 30
	fire = 100
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/cult — code/modules/antagonists/cult/cult_items.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/cult/helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/cult/suit
	melee = 70
	bullet = 50
	laser = 30
	energy = 15
	bomb = 30
	bio = 30
	rad = 30
	fire = 100
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/mining — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/mining/helmet
	melee = 20
	bullet = 15
	laser = 15
	energy = 15
	bomb = 30
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/mining — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/mining — modular_sand/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/mining/suit
	melee = 30
	bullet = 15
	laser = 15
	energy = 15
	bomb = 30
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/rd/hev — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ancient/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/rd/hev/helmet
	melee = 30
	bullet = 10
	laser = 10
	energy = 5
	bomb = 80
	bio = 100
	rad = 100
	fire = 60
	acid = 60
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/rd/hev — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_freedom__suit_space_freedom; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/rd/hev/suit
	melee = 35
	bullet = 25
	laser = 25
	energy = 5
	bomb = 100
	bio = 100
	rad = 100
	fire = 80
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/shielded — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/shielded/suit
	melee = 30
	bullet = 15
	laser = 30
	energy = 10
	bomb = 10
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/shielded/wizard — code/modules/clothing/suits/wiz_robe.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_wizard__suit_wizrobe; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/shielded/wizard/helmet
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
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/shielded/wizard — code/modules/clothing/suits/wiz_robe.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/engine/atmos/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/shielded/wizard/suit
	melee = 30
	bullet = 20
	laser = 20
	energy = 20
	bomb = 20
	bio = 100
	rad = 20
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/suit/space/hardsuit/teslapa — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/teslapahelmet/helmet; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/teslapa/suit
	melee = 70
	bullet = 70
	laser = 90
	energy = 90
	bomb = 70
	bio = 100
	rad = 40
	fire = 100
	acid = 100
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/teslapahelmet — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/teslapa/suit; другой профиль, не объединять.)
/datum/armor/profiles/clothing/hardsuit/teslapahelmet/helmet
	melee = 70
	bullet = 70
	laser = 90
	energy = 90
	bomb = 70
	bio = 100
	rad = 10
	fire = 100
	acid = 100
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ancient — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/ancient — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/engineering/fire_protected/advanced; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ancient/helmet__suit
	melee = 40
	bullet = 5
	laser = 10
	energy = 10
	bomb = 75
	bio = 100
	rad = 100
	fire = 100
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ancient/mason — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/ancient/mason — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/hunter; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ancient/mason/helmet__suit
	melee = 50
	bullet = 15
	laser = 15
	energy = 45
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/blue_shield — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/captain — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/blue_shield — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/captain — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert_and_hos; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/blueshield_and_captain
	melee = 50
	bullet = 50
	laser = 50
	energy = 60
	bomb = 50
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/carp — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/syndi/elite — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/carp — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/syndi/elite — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/inteq_nuclear; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/carp_and_syndicate_elite
	melee = 60
	bullet = 60
	laser = 50
	energy = 50
	bomb = 55
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/clown — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/clown — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/standard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/clown/helmet__suit
	melee = 25
	bullet = 5
	laser = 20
	energy = 20
	bomb = 10
	bio = 100
	rad = 75
	fire = 60
	acid = 30
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/contractor — code/modules/clothing/spacesuits/contractor_hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/contractor — code/modules/clothing/spacesuits/contractor_hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/shielded/syndi/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/contractor/helmet__suit
	melee = 40
	bullet = 50
	laser = 30
	energy = 30
	bomb = 35
	bio = 100
	rad = 75
	fire = 75
	acid = 90
	magic = 0
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/cybersun — modular_bluemoon/code/modules/antagonists/inteq_ghostrole/cybersun_tech.dm
//   /obj/item/clothing/suit/space/hardsuit/cybersun — modular_bluemoon/code/modules/antagonists/inteq_ghostrole/cybersun_tech.dm
// (Схожая броня: /datum/armor/profiles/structure/deployable_barricade/metal; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/cybersun/helmet__suit
	melee = 30
	bullet = 40
	laser = 70
	energy = 70
	bomb = 30
	bio = 100
	rad = 60
	fire = 60
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/deathsquad/praetor — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
//   /obj/item/clothing/suit/space/hardsuit/deathsquad/praetor — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/space/hostile_environment; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/deathsquad/praetor/helmet__suit
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
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/deathsquad — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/shielded/goldenpa — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/shielded/swat — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/shielded/goldenpa — modular_splurt/code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/shielded/swat — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/deathsquad_and_officer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/deathsquad_and_shielded
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
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/engine/atmos — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine/atmos — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine/atmos — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/engine/atmos/helmet__suit
	melee = 30
	bullet = 15
	laser = 15
	energy = 15
	bomb = 25
	bio = 100
	rad = 25
	fire = 100
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/engine/elite — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine/elite — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine/elite — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/modsuit/engineering/fire_protected/advanced; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/engine/elite/helmet__suit
	melee = 40
	bullet = 15
	laser = 25
	energy = 15
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 90
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/engine/ftu — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/suit/space/hardsuit/engine/ftu — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/modsuit/engineering/fire_protected/advanced; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/engine/ftu/helmet__suit
	melee = 30
	bullet = 5
	laser = 10
	energy = 5
	bomb = 60
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/engine — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/engine — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/modsuit/engineering/default_engineer; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/engine/helmet__suit
	melee = 30
	bullet = 15
	laser = 15
	energy = 10
	bomb = 25
	bio = 100
	rad = 75
	fire = 100
	acid = 25
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/debug — modular_sand/code/modules/clothing/outfits/standard.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert/debug — modular_sand/code/modules/clothing/outfits/standard.dm
// (Схожая броня: /datum/armor/profiles/shared/secure_and_special_objects; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert/alert/debug/helmet__suit
	melee = 99
	bullet = 99
	laser = 99
	energy = 99
	bomb = 99
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/nri/adv — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert/nri/adv — modular_bluemoon/kovac_shitcode/code/rus.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert_alert; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert/alert/nri/adv/helmet__suit
	melee = 70
	bullet = 65
	laser = 60
	energy = 60
	bomb = 80
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 60

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sol/adv — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert/sol/adv — modular_bluemoon/kovac_shitcode/code/solfed.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert/alert/nri/adv/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert/alert/sol/adv/helmet__suit
	melee = 75
	bullet = 75
	laser = 75
	energy = 75
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 75

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/engi — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/engi — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/carp_and_syndicate_elite; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert/engi/helmet__suit
	melee = 60
	bullet = 45
	laser = 45
	energy = 45
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 80
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/paranormal — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert_and_hos; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert/paranormal/helmet__suit
	melee = 75
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
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/nri — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sol — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert/nri — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/alert/sol — modular_bluemoon/kovac_shitcode/code/solfed.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/carp_and_syndicate_elite; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert_alert
	melee = 70
	bullet = 55
	laser = 50
	energy = 50
	bomb = 65
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 50

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/security/hos — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/ert — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/security/hos — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/security; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/ert_and_hos
	melee = 50
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
//   /obj/item/clothing/head/helmet/space/hardsuit/exploration — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
//   /obj/item/clothing/suit/space/hardsuit/exploration — modular_bluemoon/code/modules/vanguard/vanguard_clothing.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/security/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/exploration/helmet__suit
	melee = 35
	bullet = 20
	laser = 40
	energy = 40
	bomb = 25
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/gearsuit — modular_splurt/code/modules/awaymissions/mission_code/AGRComplex.dm
//   /obj/item/clothing/suit/space/hardsuit/gearsuit — modular_splurt/code/modules/awaymissions/mission_code/AGRComplex.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/engine/elite/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/gearsuit/helmet__suit
	melee = 40
	bullet = 20
	laser = 35
	energy = 15
	bomb = 30
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/iron_tombstone — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/suit/space/hardsuit/iron_tombstone — modular_bluemoon/Ren/Code/cloth.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_hooded_explorer_exo__suit_hooded_explorer_exo; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/iron_tombstone/helmet__suit
	melee = 50
	bullet = 75
	laser = 25
	energy = 10
	bomb = 40
	bio = 70
	rad = 10
	fire = 10
	acid = 10
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/lavaknight — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/lavaknight — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/centcom/safeguard; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/lavaknight/helmet__suit
	melee = 50
	bullet = 10
	laser = 10
	energy = 10
	bomb = 50
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/medical — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/medical — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/standard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/medical/helmet__suit
	melee = 15
	bullet = 15
	laser = 15
	energy = 15
	bomb = 10
	bio = 100
	rad = 60
	fire = 60
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/nano — modular_bluemoon/code/modules/clothing/nanosuit/nanosuit.dm
//   /obj/item/clothing/suit/space/hardsuit/nano — modular_bluemoon/code/modules/clothing/nanosuit/nanosuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_elder_atmosian__suit_armor_elder_atmosian; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/nano/helmet__suit
	melee = 45
	bullet = 45
	laser = 45
	energy = 50
	bomb = 80
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 40

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker/damaged — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor/damaged — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker/damaged — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor/damaged — modular_sand/code/modules/mining/lavaland/necropolis_chests.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/hooded/explorer/standard/improved; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/paranormal_damaged
	melee = 65
	bullet = 25
	laser = 20
	energy = 10
	bomb = 50
	bio = 100
	rad = 50
	fire = 100
	acid = 40
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker/old — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor/old — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker/old — code/modules/clothing/spacesuits/miscellaneous.dm
//   /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor/old — code/modules/clothing/spacesuits/miscellaneous.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/nvg/hecu; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/paranormal_old
	melee = 55
	bullet = 40
	laser = 40
	energy = 40
	bomb = 40
	bio = 80
	rad = 80
	fire = 60
	acid = 60
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/powerarmor — modular_sand/code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/powerarmor — modular_sand/code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/soviet/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/powerarmor/helmet__suit
	melee = 40
	bullet = 35
	laser = 30
	energy = 20
	bomb = 40
	bio = 100
	rad = 5
	fire = 75
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/rd — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/rd — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/research; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/rd/helmet__suit
	melee = 20
	bullet = 15
	laser = 15
	energy = 15
	bomb = 100
	bio = 100
	rad = 60
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/security — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/security — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/security; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/security/helmet__suit
	melee = 35
	bullet = 20
	laser = 40
	energy = 40
	bomb = 25
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/shielded/ctf — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/shielded/ctf — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/structure/projected_forcefield; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/shielded/ctf/helmet__suit
	melee = 0
	bullet = 30
	laser = 30
	energy = 30
	bomb = 50
	bio = 100
	rad = 100
	fire = 95
	acid = 95
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/shielded/syndi — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/shielded/syndi — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/wizard/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/shielded/syndi/helmet__suit
	melee = 40
	bullet = 50
	laser = 30
	energy = 15
	bomb = 35
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/soviet — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/soviet — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/swat; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/soviet/helmet__suit
	melee = 40
	bullet = 30
	laser = 30
	energy = 15
	bomb = 35
	bio = 100
	rad = 20
	fire = 50
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/medical/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/standard/helmet__suit
	melee = 10
	bullet = 15
	laser = 15
	energy = 15
	bomb = 10
	bio = 100
	rad = 75
	fire = 50
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/syndi — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/syndi — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/syndicate; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/syndi/helmet__suit
	melee = 50
	bullet = 50
	laser = 40
	energy = 50
	bomb = 40
	bio = 100
	rad = 100
	fire = 50
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/syndi/vox — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
//   /obj/item/clothing/suit/space/hardsuit/syndi/vox — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_vox__suit_space_vox; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/syndi/vox/helmet__suit
	melee = 65
	bullet = 50
	laser = 70
	energy = 20
	bomb = 30
	bio = 30
	rad = 30
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/head/helmet/space/hardsuit/wizard — code/modules/clothing/spacesuits/hardsuit.dm
//   /obj/item/clothing/suit/space/hardsuit/wizard — code/modules/clothing/spacesuits/hardsuit.dm
// (Схожая броня: /datum/armor/profiles/modsuit/centcom/safeguard; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/hardsuit/wizard/helmet__suit
	melee = 40
	bullet = 40
	laser = 40
	energy = 40
	bomb = 35
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30
