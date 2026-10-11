// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/modsuits. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/centcom/apocryphal — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/deathsquad_and_officer; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/centcom/apocryphal
	melee = 80
	bullet = 65
	laser = 35
	energy = 60
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/centcom/magnate — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/modsuit/centcom/responsory; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/centcom/magnate
	melee = 50
	bullet = 35
	laser = 35
	energy = 60
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/centcom/responsory — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/modsuit/centcom/magnate; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/centcom/responsory
	melee = 50
	bullet = 25
	laser = 35
	energy = 50
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 90
	magic = 0
	wound = 45

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/centcom/safeguard — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ert_and_hos; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/centcom/safeguard
	melee = 50
	bullet = 20
	laser = 35
	energy = 40
	bomb = 40
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/corporate — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/modsuit/security/blueshied; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/corporate
	melee = 40
	bullet = 35
	laser = 35
	energy = 60
	bomb = 50
	bio = 100
	rad = 85
	fire = 90
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/debug — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/secure_and_special_objects; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/debug
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
	wound = 100

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/elite — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/carp_and_syndicate_elite; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/elite
	melee = 60
	bullet = 45
	laser = 35
	energy = 50
	bomb = 55
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 45

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/engineering/default_engineer — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/engine/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/engineering/default_engineer
	melee = 30
	bullet = 5
	laser = 5
	energy = 10
	bomb = 25
	bio = 100
	rad = 75
	fire = 100
	acid = 25
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/engineering/fire_protected/advanced — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/engine/elite/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/engineering/fire_protected/advanced
	melee = 40
	bullet = 5
	laser = 10
	energy = 15
	bomb = 50
	bio = 100
	rad = 100
	fire = 100
	acid = 90
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/engineering/fire_protected/atmospheric — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/engineering/fire_protected/atmospheric
	melee = 30
	bullet = 5
	laser = 5
	energy = 15
	bomb = 25
	bio = 100
	rad = 75
	fire = 100
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/infiltrator — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/blueshield_and_captain; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/infiltrator
	melee = 45
	bullet = 50
	laser = 45
	energy = 55
	bomb = 55
	bio = 100
	rad = 70
	fire = 100
	acid = 100
	magic = 0
	wound = 55

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/inteq_nuclear — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/carp_and_syndicate_elite; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/inteq_nuclear
	melee = 60
	bullet = 60
	laser = 50
	energy = 25
	bomb = 55
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/mage — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/cbrn/mopp/advance; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/mage
	melee = 40
	bullet = 25
	laser = 25
	energy = 50
	bomb = 35
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/research — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/rd/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/research
	melee = 20
	bullet = 5
	laser = 5
	energy = 5
	bomb = 100
	bio = 100
	rad = 60
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/station_combat/security — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/security/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/security
	melee = 35
	bullet = 15
	laser = 25
	energy = 40
	bomb = 25
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 20

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/station_combat/security/blueshied — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/modsuit/corporate; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/security/blueshied
	melee = 40
	bullet = 35
	laser = 35
	energy = 60
	bomb = 50
	bio = 100
	rad = 50
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/spider_clan — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/shielded/wizard/suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/spider_clan
	melee = 40
	bullet = 15
	laser = 5
	energy = 30
	bomb = 30
	bio = 100
	rad = 30
	fire = 100
	acid = 100
	magic = 0
	wound = 10

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme — code/modules/mod/mod_customizing/mod_themes/_base_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/modsuit_parts_and_control; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/standard
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 5
	bio = 100
	rad = 5
	fire = 25
	acid = 25
	magic = 0
	wound = 5

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/station_medbay/medical — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/medical/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/station_medbay/medical
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 10
	bio = 100
	rad = 30
	fire = 60
	acid = 75
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/station_medbay/rescue — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/clothing/under/plasmaman/captain; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/station_medbay/rescue
	melee = 10
	bullet = 5
	laser = 5
	energy = 5
	bomb = 10
	bio = 100
	rad = 30
	fire = 100
	acid = 100
	magic = 0
	wound = 15

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/syndicate — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/syndi/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/syndicate
	melee = 50
	bullet = 35
	laser = 25
	energy = 50
	bomb = 40
	bio = 100
	rad = 80
	fire = 50
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/antagonist/traitor — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/modsuit/syndicate; другой профиль, не объединять.)
/datum/armor/profiles/modsuit/traitor
	melee = 40
	bullet = 35
	laser = 15
	energy = 15
	bomb = 55
	bio = 100
	rad = 100
	fire = 50
	acid = 90
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /datum/mod_theme/cargo_default/mining — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
//   /datum/mod_theme/cargo_default/prototype — code/modules/mod/mod_customizing/mod_themes/mod_theme.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/mining/suit; другой профиль, не объединять.)
/datum/armor/profiles/shared/modsuit/cargo_default/mining__prototype
	melee = 30
	bullet = 5
	laser = 5
	energy = 5
	bomb = 30
	bio = 100
	rad = 50
	fire = 100
	acid = 75
	magic = 0
	wound = 30

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/mod_part/gloves — code/modules/mod/mod_parts/mod_clothes.dm
//   /obj/item/clothing/mod_part/head — code/modules/mod/mod_parts/mod_clothes.dm
//   /obj/item/clothing/mod_part/shoes — code/modules/mod/mod_parts/mod_clothes.dm
//   /obj/item/clothing/mod_part/suit — code/modules/mod/mod_parts/mod_clothes.dm
//   /obj/item/mod/control — code/modules/mod/mod_control.dm
// (Схожая броня: /datum/armor/profiles/modsuit/standard; другой профиль, не объединять.)
/datum/armor/profiles/shared/modsuit_parts_and_control
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 100
	rad = 0
	fire = 25
	acid = 25
	magic = 0
	wound = 10
