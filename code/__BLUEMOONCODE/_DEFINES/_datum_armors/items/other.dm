// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: items/other. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/electronic_assembly — code/modules/integrated_electronics/core/assemblies.dm
// (Схожая броня: /datum/armor/profiles/structure/grille; другой профиль, не объединять.)
/datum/armor/profiles/electronic_assembly
	melee = 50
	bullet = 70
	laser = 70
	energy = 100
	bomb = 10
	bio = 100
	rad = 100
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/modular_computer — code/modules/modular_computers/computers/item/computer.dm
// (Схожая броня: /datum/armor/profiles/machinery/meter; другой профиль, не объединять.)
/datum/armor/profiles/modular_computer
	melee = 0
	bullet = 20
	laser = 20
	energy = 100
	bomb = 0
	bio = 100
	rad = 100
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/reagent_containers/glass/bucket — code/modules/reagents/reagent_containers/glass.dm
//   /obj/item/reagent_containers/glass/bucket — modular_bluemoon/code/modules/reagents/reagent_containers.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/combat_and_martial_arts; другой профиль, не объединять.)
/datum/armor/profiles/reagent_containers/glass/bucket
	melee = 10
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 75
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/reagent_containers/rag/towel/syndicate — code/modules/reagents/reagent_containers/rags.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_general_objects; другой профиль, не объединять.)
/datum/armor/profiles/reagent_containers/rag/towel/syndicate
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 20
	bio = 20
	rad = 20
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/tank — code/game/objects/items/tanks/tanks.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_gloves_botanic_leather__vending_refill; другой профиль, не объединять.)
/datum/armor/profiles/tank
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 80
	acid = 30
	magic = 0
	wound = 0
