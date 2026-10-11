// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/computers. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/computer — code/game/machinery/computer/_computer.dm
//   /obj/machinery/computer — modular_bluemoon/code/modules/aesthetics/connecting_computer/_computer.dm
// (Схожая броня: /datum/armor/profiles/shared/tools_and_misc; другой профиль, не объединять.)
/datum/armor/profiles/machinery/computer
	melee = 0
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 40
	acid = 20
	magic = 0
	wound = 0
