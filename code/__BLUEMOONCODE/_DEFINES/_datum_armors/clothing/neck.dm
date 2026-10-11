// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: clothing/neck. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/neck/cloak/centcom — modular_splurt/code/modules/clothing/suits/cloaks.dm
//   /obj/item/clothing/neck/cloak/cybersun — modular_bluemoon/code/modules/antagonists/inteq_ghostrole/forgottenship.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/plasmaman/security/blueshield; другой профиль, не объединять.)
/datum/armor/profiles/shared/clothing/neck/cloak/centcom__cybersun
	melee = 35
	bullet = 40
	laser = 25
	energy = 10
	bomb = 25
	bio = 20
	rad = 20
	fire = 60
	acid = 60
	magic = 0
	wound = 0
