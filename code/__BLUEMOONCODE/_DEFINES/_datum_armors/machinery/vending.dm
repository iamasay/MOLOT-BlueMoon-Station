// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/vending. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/vending/magivend — code/modules/vending/magivend.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/vending_durable; другой профиль, не объединять.)
/datum/armor/profiles/machinery/vending/magivend
	melee = 100
	bullet = 100
	laser = 100
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 50
	magic = 100
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/vending/cart — code/modules/vending/cartridge.dm
//   /obj/machinery/vending/dinnerware — code/modules/vending/dinnerware.dm
//   /obj/machinery/vending/liberationstation — modular_bluemoon/code/modules/vending/liberation.dm
//   /obj/machinery/vending/toyliberationstation — code/modules/vending/liberation_toy.dm
//   /obj/machinery/vending/ultimateliberation — modular_bluemoon/code/modules/vending/liberation.dm
// (Схожая броня: /datum/armor/profiles/machinery/vending/magivend; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/vending_durable
	melee = 100
	bullet = 100
	laser = 100
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 100
	acid = 50
	magic = 0
	wound = 0
