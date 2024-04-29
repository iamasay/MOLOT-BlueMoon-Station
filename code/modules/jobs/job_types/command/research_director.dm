/datum/job/rd
	title = "Research Director"
	flag = RD_JF
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Captain")
	department_flag = MEDSCI
	head_announce = list(RADIO_CHANNEL_SCIENCE)
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#7544cc"
	req_admin_notify = 1
	minimal_player_age = 35
	exp_type_department = EXP_TYPE_SCIENCE
	exp_requirements = 180
	exp_type = EXP_TYPE_CREW
	considered_combat_role = TRUE

	outfit = /datum/outfit/job/rd
	plasma_outfit = /datum/outfit/plasmaman/rd

	access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
						ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS,
						ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
						ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
						ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK)
	minimal_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_GENETICS, ACCESS_MORGUE,
						ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS,
						ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
						ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
						ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK)
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SCI
	bounty_types = CIV_JOB_SCI

	display_order = JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR
	starting_modifiers = list(/datum/skill_modifier/job/level/wiring)
	blacklisted_quirks = list(/datum/quirk/mute, /datum/quirk/brainproblems, /datum/quirk/insanity, /datum/quirk/bluemoon_criminal)
	threat = 5

	family_heirlooms = list(
		/obj/item/toy/plush/slimeplushie
	)

/datum/outfit/job/rd
	name = "Research Director"
	jobtype = /datum/job/rd

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/heads/rd
	ears = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/rnd/research_director
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/laser_pointer
	backpack_contents = list( /obj/item/modular_computer/tablet/preset/advanced=1)
	accessory = /obj/item/clothing/accessory/permit/special/research_director

	backpack = /obj/item/storage/backpack/science
	box = /obj/item/storage/box/survival/command
	satchel = /obj/item/storage/backpack/satchel/tox

	chameleon_extras = /obj/item/stamp/rd

/datum/outfit/job/rd/syndicate
	name = "Syndicate Research Director"
	jobtype = /datum/job/rd

	//belt = /obj/item/pda/syndicate/no_deto

	ears = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/captain/util
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	suit = /obj/item/clothing/suit/toggle/labcoat
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/laser_pointer
	neck = /obj/item/clothing/neck/cloak/syndiecap

	backpack = /obj/item/storage/backpack/duffelbag/syndie
	satchel = /obj/item/storage/backpack/duffelbag/syndie
	duffelbag = /obj/item/storage/backpack/duffelbag/syndie
	box = /obj/item/storage/box/survival/syndie
	pda_slot = ITEM_SLOT_BELT
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/modular_computer/tablet/preset/advanced=1, /obj/item/syndicate_uplink_high=1)
	accessory = /obj/item/clothing/accessory/permit/special/research_director

	neck = /obj/item/clothing/neck/cloak/syndiecap

/datum/outfit/job/rd/rig
	name = "Research Director (Hardsuit)"

	l_hand = null
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/hardsuit/rd
	suit_store = /obj/item/tank/internals/oxygen
	internals_slot = ITEM_SLOT_SUITSTORE
