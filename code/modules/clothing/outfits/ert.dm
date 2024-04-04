/datum/outfit/ert
	name = "ERT Common"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	uniform = /obj/item/clothing/under/syndicate/combat/ert
	shoes = /obj/item/clothing/shoes/combat/swat/knife
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/headset_cent/alt

	l_pocket = /obj/item/storage/bag/security
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	suit_store = /obj/item/gun/energy/e_gun/nuclear/ert

	give_space_cooler_if_synth = TRUE // BLUEMOON ADD

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/deathrattle, /obj/item/implant/weapons_auth)
	cybernetic_implants = list(/obj/item/organ/cyberimp/eyes/hud/security,/obj/item/organ/cyberimp/chest/nutrimentextreme, /obj/item/organ/cyberimp/chest/chem_implant)


/datum/outfit/ert/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/implant/mindshield/L = new
	L.implant(H, null, 1)

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	if(W)
		W.registered_name = H.real_name
		W.update_label(W.registered_name, W.assignment)

/datum/outfit/ert/commander/green
	name = "ERT Commander - Green Alert"

	id = /obj/item/card/id/ert
	head = /obj/item/clothing/head/helmet/swat/command
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/armor/hos/command
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	back = /obj/item/storage/backpack/ert_commander
	belt = /obj/item/storage/belt/military/ert_min
	l_hand = null
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/firstaid/regular=1,\
		)
	cybernetic_implants = list(/obj/item/organ/cyberimp/eyes/hud/security,/obj/item/organ/cyberimp/chest/nutrimentextreme, /obj/item/organ/cyberimp/chest/chem_implant)

/datum/outfit/ert/commander
	name = "ERT Commander - Blue Alert"

	id = /obj/item/card/id/ert
	suit = /obj/item/clothing/suit/space/hardsuit/ert
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	back = /obj/item/storage/backpack/ert_commander
	belt = /obj/item/storage/belt/military/ert_min
	l_hand = /obj/item/gun/ballistic/automatic/wt550
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/storage/box/ammo/wt=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/shield,
	)

// BLUEMOON ADD START - командная коробочка для командира
/datum/outfit/ert/commander/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	var/list/extra_backpack_items = list(
		/obj/item/storage/box/pinpointer_squad
	)
	LAZYADD(backpack_contents, extra_backpack_items)
// BLUEMOON ADD END

/datum/outfit/ert/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	. = ..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/commander/alert
	name = "ERT Commander - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_max
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/storage/box/ammo/smgap = 1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/commander/alert/red
	name = "ERT Commander - Red Alert"
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	l_hand = /obj/item/gun/ballistic/automatic/ar
	suit_store = /obj/item/gun/energy/pulse/pistol/loyalpin
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/box/ammo/m556=1,\
		/obj/item/storage/firstaid/regular=1,\
		)
	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/security/green
	name = "ERT Security - Green Alert"

	id = /obj/item/card/id/ert/Security
	head = /obj/item/clothing/head/helmet/swat/security
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/armor/hos/security
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_min
	l_hand = null
	back = /obj/item/storage/backpack/ert_commander/ert_security
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/regular=1,
		/obj/item/storage/box/handcuffs=1,\
		)
	cybernetic_implants = list(/obj/item/organ/cyberimp/eyes/hud/security,/obj/item/organ/cyberimp/chest/nutrimentextreme, /obj/item/organ/cyberimp/chest/chem_implant)

/datum/outfit/ert/security
	name = "ERT Security - Blue Alert"

	id = /obj/item/card/id/ert/Security
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/sec
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_min
	back = /obj/item/storage/backpack/ert_commander/ert_security
	l_hand = /obj/item/gun/ballistic/automatic/wt550
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\

		/obj/item/storage/box/handcuffs=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/storage/box/ammo/wt = 1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/shield,
	)

/datum/outfit/ert/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hos
	R.recalculateChannels()

/datum/outfit/ert/security/alert
	name = "ERT Security - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/sec
	internals_slot = ITEM_SLOT_SUITSTORE
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	belt = /obj/item/storage/belt/military/ert_max

	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/storage/box/ammo/smgap=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/security/alert/red
	name = "ERT Security - Red Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	l_hand = /obj/item/gun/ballistic/automatic/ar
	suit_store = /obj/item/gun/energy/pulse/pistol/loyalpin
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\

		/obj/item/storage/box/handcuffs=1,\
		/obj/item/storage/box/ammo/m556=1,\
		/obj/item/storage/firstaid/regular=1)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/medic/green
	name = "ERT Medic - Green Alert"

	id = /obj/item/card/id/ert/Medical
	head = /obj/item/clothing/head/helmet/swat/medical
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/armor/hos/medical
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	back = /obj/item/storage/backpack/ert_commander/ert_medical
	belt = /obj/item/defibrillator/compact/loaded_ert
	l_hand = null
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/tactical/ert_first = 1,
		/obj/item/storage/firstaid/tactical/ert_second = 1,
		/obj/item/gun/medbeam=1,
		/obj/item/roller=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/surgery,
	)

/datum/outfit/ert/medic
	name = "ERT Medic - Blue Alert"

	id = /obj/item/card/id/ert/Medical
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/med
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	back = /obj/item/storage/backpack/ert_commander/ert_medical
	belt = /obj/item/defibrillator/compact/loaded_ert
	internals_slot = ITEM_SLOT_SUITSTORE
	l_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/tactical/ert_first = 1,
		/obj/item/storage/firstaid/tactical/ert_second = 1,
		/obj/item/storage/box/ammo/wt=1,
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1,
		/obj/item/roller=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/surgery/advanced,
	)


/datum/outfit/ert/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	ADD_TRAIT(H, TRAIT_SURGEON, TRAIT_GENERIC)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/cmo
	R.recalculateChannels()

/datum/outfit/ert/medic/alert
	name = "ERT Medic - Amber Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/med
	internals_slot = ITEM_SLOT_SUITSTORE
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/firstaid/tactical/ert_first = 1,
		/obj/item/storage/firstaid/tactical/ert_second = 1,
		/obj/item/storage/box/ammo/smgap=1,\
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1,\
		/obj/item/roller=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/surgery/advanced,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/medic/alert/red
	name = "ERT Medic - Red Alert"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	l_hand = /obj/item/gun/ballistic/automatic/ar
	suit_store = /obj/item/gun/energy/pulse/pistol/loyalpin
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/tactical/ert_first = 1,
		/obj/item/storage/firstaid/tactical/ert_second = 1,
		/obj/item/storage/box/ammo/m556=1,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1,
		/obj/item/roller=1,)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/surgery/advanced,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/engineer/green
	name = "ERT Engineer - Green Alert"

	id = /obj/item/card/id/ert/Engineer
	head = /obj/item/clothing/head/helmet/swat/engineer
	mask = /obj/item/clothing/mask/gas/welding/up
	suit = /obj/item/clothing/suit/armor/hos/engineer
	glasses =  /obj/item/clothing/glasses/meson/night/ert
	back = /obj/item/storage/backpack/ert_commander/ert_engineering
	belt = /obj/item/storage/belt/utility/chief/full
	l_hand = null
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/rcd_ammo/large=2,
		/obj/item/construction/rcd/combat=1,
		/obj/item/inducer=1,
		/obj/item/stock_parts/cell/bluespacereactor=1,
	)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/toolset,
	)


/datum/outfit/ert/engineer
	name = "ERT Engineer - Blue Alert"

	mask = /obj/item/clothing/mask/gas/welding/up
	id = /obj/item/card/id/ert/Engineer
	suit = /obj/item/clothing/suit/space/hardsuit/ert/engi
	glasses =  /obj/item/clothing/glasses/meson/night/ert
	back = /obj/item/storage/backpack/ert_commander/ert_engineering
	belt = /obj/item/storage/belt/utility/chief/full
	internals_slot = ITEM_SLOT_SUITSTORE
	l_hand = /obj/item/gun/ballistic/automatic/wt550
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/box/ammo/wt=1,
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/rcd_ammo/large=2,
		/obj/item/construction/rcd/combat=1,
		/obj/item/inducer=1,
		/obj/item/stock_parts/cell/bluespacereactor=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/toolset/advanced,
	)

/datum/outfit/ert/engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/ce
	R.recalculateChannels()

/datum/outfit/ert/engineer/alert
	name = "ERT Engineer - Amber Alert"

	mask = /obj/item/clothing/mask/gas/welding/up
	suit = /obj/item/clothing/suit/space/hardsuit/ert/alert/engi
	internals_slot = ITEM_SLOT_SUITSTORE
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/box/ammo/smgap=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/construction/rcd/combat=1,
		/obj/item/inducer/sci/combat=1,
		/obj/item/stock_parts/cell/bluespacereactor=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/toolset/advanced,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/engineer/alert/red
	name = "ERT Engineer - Red Alert"

	l_hand = /obj/item/gun/ballistic/automatic/ar
	mask = /obj/item/clothing/mask/gas/welding/up
	suit_store = /obj/item/gun/energy/pulse/pistol/loyalpin
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/box/ammo/m556=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/construction/rcd/combat=1,
		/obj/item/inducer/sci/combat=1,
		/obj/item/stock_parts/cell/bluespacereactor=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/toolset/advanced,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/janitor
	name = "ERT Janitor"

	id = /obj/item/card/id/ert
	mask = /obj/item/clothing/mask/gas/sechailer/syndicate
	head = /obj/item/clothing/head/helmet/swat/janitor
	suit = /obj/item/clothing/suit/armor/hos/janitor
	internals_slot = ITEM_SLOT_SUITSTORE
	glasses = /obj/item/clothing/glasses/night/syndicate
	back = /obj/item/storage/backpack/ert_commander/ert_janitor
	belt = /obj/item/storage/belt/janitor/ert_maid
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,\
		/obj/item/storage/firstaid/regular=1,\

		/obj/item/bodybag/bluespace=1,
		/obj/item/mop/advanced=1)

/datum/outfit/ert/janitor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/captain
	R.recalculateChannels()

/datum/outfit/ert/greybois
	name = "Emergency Assistant"

	uniform = /obj/item/clothing/under/color/grey/glorf
	shoes = /obj/item/clothing/shoes/sneakers/black
	gloves = /obj/item/clothing/gloves/color/fyellow
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt/utility/full
	back = /obj/item/storage/backpack
	mask = /obj/item/clothing/mask/gas
	l_hand = /obj/item/storage/toolbox/emergency/old
	id = /obj/item/card/id

/datum/outfit/ert/greybois/greygod
	suit = /obj/item/clothing/suit/hazardvest
	l_hand = /obj/item/storage/toolbox/plastitanium
	gloves = /obj/item/clothing/gloves/color/yellow

/datum/outfit/ert/greybois/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return
	var/obj/item/card/id/W = H.wear_id
	W.registered_name = H.real_name
	W.assignment = "Assistant"
	W.access = list(ACCESS_MAINT_TUNNELS,ACCESS_CENT_GENERAL)
	W.update_label(W.registered_name, W.assignment)

/datum/outfit/centcom_official
	name = "CentCom Official"

	uniform = /obj/item/clothing/under/rank/centcom/officer
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset/headset_cent/alt
	head = /obj/item/clothing/head/beret/sec/ntr_beret
	glasses = /obj/item/clothing/glasses/sunglasses
	belt = /obj/item/gun/energy/e_gun/nuclear/ert
	back = /obj/item/storage/backpack/satchel
	l_hand = /obj/item/clipboard
	id = /obj/item/card/id/ert
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/pda/heads=1,
		/obj/item/pen=1)

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/deathrattle, /obj/item/implant/weapons_auth)

	cybernetic_implants = list(/obj/item/organ/cyberimp/eyes/hud/security,
	/obj/item/organ/cyberimp/chest/nutrimentextreme,
	/obj/item/organ/cyberimp/chest/chem_implant)

/datum/outfit/centcom_official/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/card/id/W = H.wear_id
	W.icon_state = "centcom"
	W.access = get_all_accesses()//They get full station access.
	W.access += get_centcom_access("Death Commando")//Let's add their alloted CentCom access.
	W.assignment = "CentCom Official"
	W.registered_name = H.real_name
	W.update_label(W.registered_name, W.assignment)

/datum/outfit/ert/commander/inquisitor
	name = "Inquisition Commander"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	r_hand = /obj/item/nullrod/scythe/talking/chainsword
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/storage/box/ammo/holy=1,
		/obj/item/storage/box/ammo/smgap=1,
		/obj/item/nullrod=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)


/datum/outfit/ert/security/inquisitor
	name = "Inquisition Security"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	r_hand = /obj/item/nullrod/scythe/talking/chainsword
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/firstaid/regular=1,
		/obj/item/storage/box/ammo/smgap=1,
		/obj/item/storage/box/ammo/holy=1,
		/obj/item/storage/box/handcuffs=1,
		/obj/item/nullrod=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)


/datum/outfit/ert/medic/inquisitor
	name = "Inquisition Medic"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	l_hand = /obj/item/gun/ballistic/automatic/proto/unrestricted
	r_hand = /obj/item/nullrod/scythe/talking/chainsword
	belt = /obj/item/defibrillator/compact/loaded_ert
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/storage/box/ammo/smgap=1,\
		/obj/item/storage/box/ammo/holy=1,
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1,\
		/obj/item/roller=1,
		/obj/item/nullrod=1,
		)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant,
		/obj/item/organ/cyberimp/arm/surgery/advanced,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/chaplain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	..()

	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/heads/hop
	R.recalculateChannels()

/datum/outfit/ert/chaplain
	name = "ERT Chaplain"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor // Chap role always gets this suit
	id = /obj/item/card/id/ert/chaplain
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	back = /obj/item/storage/backpack/cultpack
	belt = /obj/item/storage/belt/soulstone
	r_hand = /obj/item/gun/ballistic/automatic/laser
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,
		/obj/item/nullrod=1,
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/ammo_box/magazine/recharge=4)

/datum/outfit/ert/chaplain/inquisitor
	name = "Inquisition Chaplain"

	mask = /obj/item/clothing/mask/gas/sechailer/swat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	belt = /obj/item/storage/belt/soulstone/full/chappy
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1,

		/obj/item/grenade/chem_grenade/holy=1,
		/obj/item/nullrod=1,
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/ammo_box/magazine/recharge=4)
