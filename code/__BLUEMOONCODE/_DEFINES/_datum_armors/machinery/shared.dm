// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: machinery/shared. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/machinery/button — code/game/machinery/buttons.dm
//   /obj/machinery/turnstile — code/game/machinery/turnstile.dm
// (Схожая броня: /datum/armor/profiles/structure/deployable_barricade/metal; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/button__turnstile
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 10
	bio = 100
	rad = 100
	fire = 90
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/computer/cryopod — code/game/machinery/cryopod.dm
//   /obj/machinery/cryopod — code/game/machinery/cryopod.dm
// (Схожая броня: /datum/armor/profiles/clothing/head/helmet/space/chronos; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/computer_cryopod__cryopod
	melee = 10
	bullet = 60
	laser = 60
	energy = 60
	bomb = 30
	bio = 100
	rad = 100
	fire = 100
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery/mailmat — modular_bluemoon/code/modules/mail/mail.dm
//   /obj/machinery/vending — code/modules/vending/_vending.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/standard; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/mailmat__vending
	melee = 20
	bullet = 0
	laser = 0
	energy = 0
	bomb = 0
	bio = 0
	rad = 0
	fire = 50
	acid = 70
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/machinery — code/game/machinery/_machinery.dm
//   /obj/machinery/blackbox_recorder — code/game/machinery/telecomms/machines/message_server.dm
//   /obj/machinery/satellite — code/modules/station_goals/shield.dm
// (Схожая броня: /datum/armor/profiles/structure/shuttle; другой профиль, не объединять.)
/datum/armor/profiles/shared/machinery/standard
	melee = 25
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
