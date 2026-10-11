// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: structures/closets. Mixed categories use shared.dm.

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet/crate/secure — code/game/objects/structures/crates_lockers/crates/secure.dm
//   /obj/structure/closet/secure_closet — code/game/objects/structures/crates_lockers/closets/secure/secure_closets.dm
// (Схожая броня: /datum/armor/profiles/structure/table/reinforced; другой профиль, не объединять.)
/datum/armor/profiles/shared/structure/closet/crate_secure__secure_closet
	melee = 30
	bullet = 50
	laser = 50
	energy = 100
	bomb = 0
	bio = 0
	rad = 0
	fire = 80
	acid = 80
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet — code/game/objects/structures/crates_lockers/closets.dm
//   /obj/structure/closet — code/modules/holiday/halloween/halloween.dm
// (Схожая броня: /datum/armor/profiles/structure/closet/crate/coffin/metalcoffin; другой профиль, не объединять.)
/datum/armor/profiles/structure/closet
	melee = 20
	bullet = 10
	laser = 10
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 70
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet/crate/coffin/blackcoffin — code/modules/antagonists/bloodsucker/objects/bloodsucker_coffin.dm
// (Схожая броня: /datum/armor/profiles/structure/closet/crate/coffin/metalcoffin; другой профиль, не объединять.)
/datum/armor/profiles/structure/closet/crate/coffin/blackcoffin
	melee = 20
	bullet = 10
	laser = 15
	energy = 0
	bomb = 35
	bio = 0
	rad = 0
	fire = 50
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet/crate/coffin/meatcoffin — code/modules/antagonists/bloodsucker/objects/bloodsucker_coffin.dm
// (Схожая броня: /datum/armor/profiles/structure/displaycase; другой профиль, не объединять.)
/datum/armor/profiles/structure/closet/crate/coffin/meatcoffin
	melee = 40
	bullet = 5
	laser = 5
	energy = 0
	bomb = 50
	bio = 0
	rad = 0
	fire = 50
	acid = 100
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet/crate/coffin/metalcoffin — code/modules/antagonists/bloodsucker/objects/bloodsucker_coffin.dm
// (Схожая броня: /datum/armor/profiles/shared/machinery/standard; другой профиль, не объединять.)
/datum/armor/profiles/structure/closet/crate/coffin/metalcoffin
	melee = 25
	bullet = 10
	laser = 25
	energy = 0
	bomb = 10
	bio = 0
	rad = 0
	fire = 50
	acid = 60
	magic = 0
	wound = 0

// Используется (и наследниками без собственного armor):
//   /obj/structure/closet/supplypod — code/modules/cargo/supplypod.dm
// (Схожая броня: /datum/armor/profiles/shared/structure/closet/crate_secure__secure_closet; другой профиль, не объединять.)
/datum/armor/profiles/structure/closet/supplypod
	melee = 30
	bullet = 50
	laser = 50
	energy = 100
	bomb = 100
	bio = 0
	rad = 0
	fire = 100
	acid = 80
	magic = 0
	wound = 0
