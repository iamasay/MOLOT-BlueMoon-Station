// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/power. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/power/apc — code/modules/power/apc.dm
//   /obj/machinery/power/apc — modular_bluemoon/code/modules/apc_arcing/apc.dm
// (Схожая броня: /datum/armor/profiles/machinery/portable_atmospherics/canister; другой профиль, не объединять.)
/datum/armor/profiles/machinery/power/apc
	melee = 40
	bullet = 40
	laser = 40
	energy = 100
	bomb = 30
	bio = 100
	rad = 100
	fire = 90
	acid = 50
	magic = 0
	wound = 0
