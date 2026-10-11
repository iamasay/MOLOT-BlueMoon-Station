// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/other. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob — code/modules/antagonists/blob/blob/theblob.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/gloves/combat_and_martial_arts; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/core — code/modules/antagonists/blob/blob/blobs/core.dm
// (Схожая броня: /datum/armor/profiles/machinery/porta_turret/syndicate/shuttle; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/core
	melee = 30
	bullet = 30
	laser = 20
	energy = 5
	bomb = 70
	bio = 0
	rad = 0
	fire = 75
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/factory — code/modules/antagonists/blob/blob/blobs/factory.dm
// (Схожая броня: /datum/armor/profiles/structure/blob/resource; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/factory
	melee = 10
	bullet = 20
	laser = 15
	energy = 10
	bomb = 40
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/node — code/modules/antagonists/blob/blob/blobs/node.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/rglass; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/node
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 65
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/resource — code/modules/antagonists/blob/blob/blobs/resource.dm
// (Схожая броня: /datum/armor/profiles/structure/table/plasmaglass; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/resource
	melee = 10
	bullet = 10
	laser = 0
	energy = 0
	bomb = 15
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/shield — code/modules/antagonists/blob/blob/blobs/shield.dm
// (Схожая броня: /datum/armor/profiles/structure/blob/shield/reflective; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/shield
	melee = 25
	bullet = 50
	laser = 25
	energy = 10
	bomb = 20
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/blob/shield/reflective — code/modules/antagonists/blob/blob/blobs/shield.dm
// (Схожая броня: /datum/armor/profiles/structure/blob/shield; другой профиль, не объединять.)
/datum/armor/profiles/structure/blob/shield/reflective
	melee = 25
	bullet = 25
	laser = 50
	energy = 10
	bomb = 20
	bio = 0
	rad = 0
	fire = 90
	acid = 90
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/carp_rift — code/modules/mob/living/simple_animal/hostile/space_dragon.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/ancient/mason/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/structure/carp_rift
	melee = 30
	bullet = 30
	laser = 30
	energy = 100
	bomb = 100
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/checkoutmachine — code/game/objects/items/crab17.dm
// (Схожая броня: /datum/armor/profiles/machinery/porta_turret/syndicate/shuttle; другой профиль, не объединять.)
/datum/armor/profiles/structure/checkoutmachine
	melee = 80
	bullet = 30
	laser = 30
	energy = 60
	bomb = 90
	bio = 0
	rad = 0
	fire = 100
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/cloth_pile — code/modules/mob/living/carbon/human/species_types/golems.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/hardsuit/iron_tombstone/helmet__suit; другой профиль, не объединять.)
/datum/armor/profiles/structure/cloth_pile
	melee = 90
	bullet = 90
	laser = 25
	energy = 80
	bomb = 50
	bio = 100
	rad = 0
	fire = -50
	acid = -50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/deployable_barricade/guardrail — modular_bluemoon/code/game/objects/structures/barricades.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/button__turnstile; другой профиль, не объединять.)
/datum/armor/profiles/structure/deployable_barricade/guardrail
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 25
	bio = 100
	rad = 100
	fire = 100
	acid = 25
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/deployable_barricade/metal — modular_bluemoon/code/game/objects/structures/barricades.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/button__turnstile; другой профиль, не объединять.)
/datum/armor/profiles/structure/deployable_barricade/metal
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 25
	bio = 100
	rad = 100
	fire = 50
	acid = 75
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/displaycase — code/game/objects/structures/displaycase.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/plasmarglass; другой профиль, не объединять.)
/datum/armor/profiles/structure/displaycase
	melee = 30
	bullet = 0
	laser = 0
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 70
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/fireaxecabinet — code/game/objects/structures/fireaxe.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery_disposal__structure_disposalpipe; другой профиль, не объединять.)
/datum/armor/profiles/structure/fireaxecabinet
	melee = 50
	bullet = 20
	laser = 0
	energy = 100
	bomb = 10
	bio = 100
	rad = 100
	fire = 90
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/grille — code/game/objects/structures/grille.dm
// (Схожая броня: /datum/armor/profiles/electronic_assembly; другой профиль, не объединять.)
/datum/armor/profiles/structure/grille
	melee = 50
	bullet = 70
	laser = 70
	energy = 100
	bomb = 10
	bio = 100
	rad = 100
	fire = 50
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/holosign — code/game/objects/structures/holosign.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/hooded/cultrobes/eldritch; другой профиль, не объединять.)
/datum/armor/profiles/structure/holosign
	melee = 0
	bullet = 50
	laser = 50
	energy = 50
	bomb = 0
	bio = 0
	rad = 0
	fire = 20
	acid = 20
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/ice_stasis — code/modules/research/xenobiology/crossbreeding/_misc.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/head_helmet_space_rad__suit_space_rad; другой профиль, не объединять.)
/datum/armor/profiles/structure/ice_stasis
	melee = 30
	bullet = 50
	laser = -50
	energy = -50
	bomb = 0
	bio = 100
	rad = 100
	fire = -80
	acid = 30
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/inflatable — modular_bluemoon/code/game/objects/structures/inflatable.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing/chameleon; другой профиль, не объединять.)
/datum/armor/profiles/structure/inflatable
	melee = 0
	bullet = 30
	laser = 20
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/legionturret — code/modules/mob/living/simple_animal/hostile/megafauna/legion.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/profiles/structure/legionturret
	melee = 0
	bullet = 0
	laser = 100
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 0
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/light_construct — code/modules/power/lighting.dm
// (Схожая броня: /datum/armor/profiles/shared/structure/industrial_lift__lattice; другой профиль, не объединять.)
/datum/armor/profiles/structure/light_construct
	melee = 50
	bullet = 10
	laser = 10
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/marker_beacon — code/modules/mining/equipment/marker_beacons.dm
// (Схожая броня: /datum/armor/profiles/structure/grille; другой профиль, не объединять.)
/datum/armor/profiles/structure/marker_beacon
	melee = 50
	bullet = 75
	laser = 75
	energy = 75
	bomb = 25
	bio = 100
	rad = 100
	fire = 25
	acid = 0
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/mineral_door — code/game/objects/structures/mineral_doors.dm
// (Схожая броня: /datum/armor/profiles/machinery/portable_atmospherics; другой профиль, не объединять.)
/datum/armor/profiles/structure/mineral_door
	melee = 10
	bullet = 0
	laser = 0
	energy = 100
	bomb = 10
	bio = 100
	rad = 100
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/particle_accelerator — code/modules/power/singularity/particle_accelerator/particle_accelerator.dm
// (Схожая броня: /datum/armor/profiles/shared/mecha/gygax_reticence_and_medigax; другой профиль, не объединять.)
/datum/armor/profiles/structure/particle_accelerator
	melee = 30
	bullet = 20
	laser = 20
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 90
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/plasticflaps — code/game/objects/structures/plasticflaps.dm
// (Схожая броня: /datum/armor/profiles/clothing/hardsuit/corpus/suit; другой профиль, не объединять.)
/datum/armor/profiles/structure/plasticflaps
	melee = 10
	bullet = 10
	laser = 10
	energy = 10
	bomb = 10
	bio = 100
	rad = 100
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/projected_forcefield — code/game/objects/items/devices/forcefieldprojector.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/cbrn/sec; другой профиль, не объединять.)
/datum/armor/profiles/structure/projected_forcefield
	melee = 0
	bullet = 25
	laser = 25
	energy = 25
	bomb = 25
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/reagent_dispensers/urbanismbarrel — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/structure/barricade/urbanism; другой профиль, не объединять.)
/datum/armor/profiles/structure/reagent_dispensers/urbanismbarrel
	melee = 60
	bullet = 50
	laser = 10
	energy = 10
	bomb = 30
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/shuttle — code/game/shuttle_engines.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/standard; другой профиль, не объединять.)
/datum/armor/profiles/structure/shuttle
	melee = 50
	bullet = 10
	laser = 10
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/sign/barsign — code/game/objects/structures/barsigns.dm
//   /obj/structure/sign/barsign — modular_bluemoon/code/game/objects/structures/barsigns.dm
// (Схожая броня: /datum/armor/profiles/structure/table/reinforced; другой профиль, не объединять.)
/datum/armor/profiles/structure/sign/barsign
	melee = 20
	bullet = 20
	laser = 20
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/urbanismbillboard — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/structure/urbanismcars; другой профиль, не объединять.)
/datum/armor/profiles/structure/urbanismbillboard
	melee = 80
	bullet = 80
	laser = 70
	energy = 60
	bomb = 80
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/urbanismcars — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/shared/structure/urbanism_reinforced; другой профиль, не объединять.)
/datum/armor/profiles/structure/urbanismcars
	melee = 70
	bullet = 60
	laser = 50
	energy = 80
	bomb = 50
	bio = 10
	rad = 10
	fire = 50
	acid = 50
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/urbanismtire — modular_bluemoon/code/modules/awaymissions/urbanism.dm
// (Схожая броня: /datum/armor/profiles/structure/barricade/urbanism; другой профиль, не объединять.)
/datum/armor/profiles/structure/urbanismtire
	melee = 20
	bullet = 40
	laser = 10
	energy = 10
	bomb = 30
	bio = 10
	rad = 0
	fire = 50
	acid = 50
	magic = 0
	wound = 0
