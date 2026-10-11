// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: items/materials. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/shard — code/game/objects/items/stacks/sheets/glass.dm
// (Схожая броня: /datum/armor/profiles/structure/sign/barsign; другой профиль, не объединять.)
/datum/armor/profiles/shard
	melee = 100
	bullet = 0
	laser = 0
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/glass — code/game/objects/items/stacks/sheets/glass.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/rglass; другой профиль, не объединять.)
/datum/armor/profiles/stack/sheet/glass
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/plasmaglass — code/game/objects/items/stacks/sheets/glass.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/rglass; другой профиль, не объединять.)
/datum/armor/profiles/stack/sheet/plasmaglass
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 75
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/plasmarglass — code/game/objects/items/stacks/sheets/glass.dm
// (Схожая броня: /datum/armor/profiles/shared/clothing_and_stack_and_structure/fire80_acid100; другой профиль, не объединять.)
/datum/armor/profiles/stack/sheet/plasmarglass
	melee = 20
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/plasteel — code/game/objects/items/stacks/sheets/sheet_types.dm
// (Схожая броня: /datum/armor/profiles/shared/banhammer__dualsaber__plasmascythe__stack_tile_plasteel; другой профиль, не объединять.)
/datum/armor/profiles/stack/sheet/plasteel
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/item/stack/sheet/rglass — code/game/objects/items/stacks/sheets/glass.dm
// (Схожая броня: /datum/armor/profiles/stack/sheet/plasmaglass; другой профиль, не объединять.)
/datum/armor/profiles/stack/sheet/rglass
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 70
	acid = 100
	magic = 0
	wound = 0
