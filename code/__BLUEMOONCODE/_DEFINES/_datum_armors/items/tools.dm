// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: items/tools. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/crowbar — code/game/objects/items/tools/crowbar.dm
//   /obj/item/crowbar — modular_bluemoon/phenyamomota/code/modules/tools/tools.dm
//   /obj/item/screwdriver — code/game/objects/items/tools/screwdriver.dm
//   /obj/item/spear — code/game/objects/items/spear.dm
//   /obj/item/wirecutters — code/game/objects/items/tools/wirecutters.dm
//   /obj/item/wrench — code/game/objects/items/tools/wrench.dm
//   /obj/item/wrench — modular_bluemoon/phenyamomota/code/modules/tools/tools.dm
// (Схожая броня: /datum/armor/profiles/machinery/computer; другой профиль, не объединять.)
/datum/armor/profiles/shared/tools_and_misc
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 30
	magic = 0
	wound = 0
