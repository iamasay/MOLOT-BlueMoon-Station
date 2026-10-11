// Armor-only migration baseline: 2adb5057517d582402686140b63c11a10e2f55c2
// Deliberate exceptions: ordinary kitchen forks and spoons have no armor.
// Identical profiles share a datum; similar profiles remain separate.
// Consumers list explicit armor assignments; descendants without overrides inherit them.

// Category: none. Mixed categories use shared.dm.

// Zero armor deliberately overrides armored parents.
// Используется (и наследниками без собственного armor):
//   /obj/item/clothing/accessory/skullcodpiece/fake — code/modules/clothing/under/accessories.dm
//   /obj/item/clothing/head/HoS/beret/nri/cap/armorless — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/head/HoS/beret/sol/cap/armorless — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/head/HoS/beret/sol/plain/armorless — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/head/bridgeofficer — modular_splurt/code/modules/clothing/head/misc.dm
//   /obj/item/clothing/head/chameleon/drone — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/head/donator/bm/dm_pzgrnd_helmet — modular_bluemoon/fluffs/code/head.dm
//   /obj/item/clothing/head/festive — code/modules/events/holiday/xmas.dm
//   /obj/item/clothing/head/hardhat/cakehat — code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/head/hardhat/cakehat — modular_splurt/code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/head/hardhat/pumpkinhead — code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/head/hardhat/reindeer — code/modules/clothing/head/misc_special.dm
//   /obj/item/clothing/head/hardhat/reindeer/fluff — modular_citadel/code/modules/custom_loadout/custom_items.dm
//   /obj/item/clothing/head/hattip — modular_citadel/code/modules/reagents/objects/clothes.dm
//   /obj/item/clothing/head/helmet/aviator_helmet/no_armor — modular_bluemoon/kovac_shitcode/code/sprite_update.dm
//   /obj/item/clothing/head/helmet/dragoncora — modular_bluemoon/fluffs/code/dragoncora.dm
//   /obj/item/clothing/head/helmet/roman/fake — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/head/helmet/roman/legionnaire/fake — code/modules/clothing/head/helmet.dm
//   /obj/item/clothing/head/helmet/sec/gosei — modular_bluemoon/fluffs/code/head.dm
//   /obj/item/clothing/head/helmet/sec/ipai — modular_bluemoon/fluffs/code/head.dm
//   /obj/item/clothing/head/wizard/fake — code/modules/clothing/suits/wiz_robe.dm
//   /obj/item/clothing/head/wizard/marisa/fake — code/modules/clothing/suits/wiz_robe.dm
//   /obj/item/clothing/mask/chameleon/drone — code/modules/clothing/chameleon.dm
//   /obj/item/clothing/neck/cloak/cybersun/civil — modular_bluemoon/fluffs/code/neck.dm
//   /obj/item/clothing/suit — code/modules/clothing/suits/_suits.dm
//   /obj/item/clothing/suit — modular_bluemoon/code/modules/clothing/suits/_suits.dm
//   /obj/item/clothing/suit/armor/dragoncora — modular_bluemoon/fluffs/code/dragoncora.dm
//   /obj/item/clothing/suit/armor/nri_coat/armorless — modular_bluemoon/kovac_shitcode/code/rus.dm
//   /obj/item/clothing/suit/armor/riot/chaplain/hospitaller/loadout — modular_splurt/code/modules/custom_loadout/first_tier.dm
//   /obj/item/clothing/suit/armor/vest/darkcarapace — modular_citadel/code/modules/custom_loadout/custom_items.dm
//   /obj/item/clothing/suit/det_suit/lanyard/dragoncora — modular_bluemoon/fluffs/code/dragoncora.dm
//   /obj/item/clothing/suit/hooded/wintercoat/narsie/fake — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/hooded/wintercoat/ratvar/fake — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/hooded/wintercoat/security/no_armor — code/modules/clothing/suits/miscellaneous.dm
//   /obj/item/clothing/suit/storage/trek/ds9 — modular_citadel/code/modules/clothing/trek.dm
//   /obj/item/clothing/suit/wizrobe/fake — code/modules/clothing/suits/wiz_robe.dm
//   /obj/item/clothing/suit/wizrobe/marisa/fake — code/modules/clothing/suits/wiz_robe.dm
//   /obj/item/clothing/under/inteq/tactical_gorka/ftu — modular_bluemoon/Ren/Code/cloth.dm
//   /obj/item/clothing/under/rank/security/detective/grey/skirt/no_armor — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/rank/security/officer/formal/sol/armorless — modular_bluemoon/kovac_shitcode/code/solfed.dm
//   /obj/item/clothing/under/rank/security/officer/skirt/no_armor — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/rank/security/stripper — code/modules/clothing/under/jobs/security.dm
//   /obj/item/clothing/under/rank/security/stripper — modular_splurt/code/modules/clothing/under/miscellaneous.dm
//   /obj/item/clothing/under/syndicate/camo/cosmetic — code/modules/clothing/under/syndicate.dm
//   /obj/item/clothing/underwear — modular_sand/code/modules/clothing/underwear/_underwear.dm
//   /obj/item/disk/nuclear/fake/obvious — code/modules/antagonists/nukeop/equipment/nuclearbomb.dm
//   /obj/item/kitchen/fork — code/game/objects/items/kitchen.dm
//   /obj/item/kitchen/knife/shiv — code/game/objects/items/kitchen.dm
//   /obj/item/kitchen/spoon — code/game/objects/items/kitchen.dm
//   /obj/item/rsf — code/game/objects/items/RSF.dm
//   /obj/item/shield/riot/roman/fake — code/game/objects/items/shields.dm
//   /obj/machinery/door/airlock/cult/weak — code/game/machinery/doors/airlock_types.dm
//   /obj/structure/window/paperframe — code/game/objects/structures/window.dm
//   /obj/vehicle/sealed/cardboard_tank — modular_bluemoon/code/modules/vehicles/cardboard_tank.dm
// (Схожая броня: /datum/armor/profiles/clothing/suit/caution; другой профиль, не объединять.)
/datum/armor/none
