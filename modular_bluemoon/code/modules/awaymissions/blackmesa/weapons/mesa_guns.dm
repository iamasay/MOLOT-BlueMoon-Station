/obj/item/gun/ballistic/automatic/pistol/hl9mm
	name = "9mm pistol"
	desc = " пистолет Beretta 92FS или же 9mm pistol является довольно распространённым пистолетом у охранников комплекса чёрной мезы... Выглядит невероятно старомодно "
	icon = 'modular_bluemoon/icons/obj/guns/projectile.dmi'
	icon_state = "hl9mmpistol"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	can_suppress = FALSE
	burst_size = 1
	spread = 7
	fire_delay = 0
	fire_select_modes = list(SELECT_SEMI_AUTOMATIC)
	automatic_burst_overlay = FALSE
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/9mm.ogg'

/obj/item/gun/ballistic/automatic/pistol/hl9mm/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/sniper_rifle/m4oa1
	name = "m40a1 sniper rifle"
	desc = "Довольно старая, но верная и мощная снайперская винтовка прямиком из далёкого прошлого"
	icon = 'modular_bluemoon/icons/obj/guns/projectile48x32.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "m4oa1"
	item_state = "m4oa1"
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/sniper_fire.ogg'
	recoil = 1
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds/m4oa1
	fire_delay = 25
	burst_size = 1
	can_unsuppress = TRUE
	can_suppress = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	inaccuracy_modifier = 0.5
	zoomable = TRUE
	zoom_amt = 7
	zoom_out_amt = 5
	slot_flags = ITEM_SLOT_BACK
	automatic_burst_overlay = FALSE
	actions_types = list()

/obj/item/gun/ballistic/automatic/sniper_rifle/m4oa1/update_icon_state()
	if(magazine)
		icon_state = "m4oa1"
	else
		icon_state = "m4oa1_mag"

/obj/item/ammo_box/magazine/sniper_rounds/m4oa1
	name = "m4oa1 magazine"
	icon = 'modular_bluemoon/icons/obj/ammo.dmi'
	icon_state = "m4oa1"
	ammo_type = /obj/item/ammo_casing/p50
	max_ammo = 8
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/m4oa1/update_icon()
	. = ..()
	if(ammo_count())
		icon_state = "[initial(icon_state)]-ammo"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/mp5
	name = "MP5 machinegun"
	desc = "Heckler Koch Mp5 является хоть и устаревшим, но невероятно сильным оружием в виду своей скорострельности. Какой идиот вообще подумал, что будет отличной идеей отобрать его у морпеха Хеку?"
	icon = 'modular_bluemoon/icons/obj/guns/projectile.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "mp5"
	item_state = "mp5"
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/mp5.ogg'
	mag_type = /obj/item/ammo_box/magazine/mp5
	can_suppress = FALSE
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	spread = 9
	burst_size = 3
	burst_shot_delay = 2
	fire_delay = 2.5 ///Это пиздец!
	can_bayonet = FALSE
	automatic_burst_overlay = FALSE

/obj/item/gun/ballistic/automatic/mp5/update_icon_state()
	if(magazine)
		icon_state = "mp5"
	else
		icon_state = "mp5nomag"

/obj/item/ammo_box/magazine/mp5
	name = "MP5 magazine (10mm Auto)"
	desc = "Magazines taking 10mm ammunition; it fits in the MP5."
	icon = 'modular_bluemoon/icons/obj/ammo.dmi'
	icon_state = "mp5"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 30

/obj/item/ammo_box/magazine/mp5/update_icon()
	. = ..()
	if(ammo_count())
		icon_state = "[initial(icon_state)]-ammo"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/spas
	name = "SPAS 12 shotgun"
	desc = "Этот невероятно старый и брутальный дробовик заставляет вас надеть балаклаву с горнолыжными очками."
	icon = 'modular_bluemoon/icons/obj/guns/projectile48x32.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "spas"
	item_state = "spas"
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 2
	recoil = 4
	force = 35
	fire_delay = 15
	mag_type = /obj/item/ammo_box/magazine/internal/shot/spas
	pumpsound = 'modular_bluemoon/sound/weapons/mesa/shotgun_rack.ogg'
	weapon_weight = WEAPON_HEAVY

/obj/item/ammo_box/magazine/internal/shot/spas
	name = "shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = "shotgun"
	max_ammo = 8

/obj/item/gun/ballistic/automatic/mp5/underbarrel
	desc = "Версия MP5 с подствольным гранатомётом и невероятным желанием выстрелить из него"
	var/obj/item/gun/ballistic/revolver/grenadelauncher/halflife/underbarrel
	icon_state = "mp5grenade"
	item_state = "mp5"

/obj/item/gun/ballistic/automatic/mp5/underbarrel/Initialize(mapload)
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/revolver/grenadelauncher/halflife(src)
	update_icon()

/obj/item/gun/ballistic/automatic/mp5/underbarrel/afterattack(atom/target, mob/living/user, flag, params)
	if(select == 2)
		underbarrel.afterattack(target, user, flag, params)
	else
		. = ..()
		return
/obj/item/gun/ballistic/automatic/mp5/underbarrel/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_casing))
		if(istype(A, underbarrel.magazine.ammo_type))
			underbarrel.attack_self()
			underbarrel.attackby(A, user, params)
	else
		..()

/obj/item/gun/ballistic/automatic/mp5/underbarrel/update_icon_state()
	if(magazine)
		icon_state = "mp5grenade"
	else
		icon_state = "mp5grenadenomag"


/obj/item/gun/ballistic/automatic/mp5/underbarrel/fire_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			burst_size = initial(burst_size)
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		if(1)
			select = 2
			to_chat(user, "<span class='notice'>You switch to grenades.</span>")
		if(2)
			select = 0
			burst_size = 1
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return


/obj/item/gun/ballistic/revolver/grenadelauncher/halflife
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/underbarrel.ogg'
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/automatic/m16a4/mesa
	name = "\improper old M16 rifle"
	desc = "Невероятно старая версия М16 с сломанным подствольным гранатомётом и... Большей отдачей что-ли? Держа её в руках, вы чувствуете странные ощущения"
	icon = 'modular_bluemoon/icons/obj/guns/projectile48x32.dmi'
	icon_state = "m16hl"
	burst_size = 1
	fire_delay = 3
	spread = 11
	fire_sound = 'modular_bluemoon/sound/weapons/mesa/m16.ogg'

/obj/item/gun/ballistic/automatic/m16a4/mesa/update_icon_state()
	if(magazine)
		icon_state = "m16hl"
	else
		icon_state = "m16hl_mag"

/obj/item/uber_teleporter
	name = "\improper Nihilanth's Divinity"
	desc = "It glows harshly, the power of a portal wielding monster lays within."
	icon = 'modular_bluemoon/icons/obj/structures/mesa_plants.dmi'
	icon_state = "crystal_pylon"

/obj/item/uber_teleporter/attack_self(mob/living/user, modifiers)
	. = ..()
	playsound(get_turf(user), 'sound/magic/LightningShock.ogg', 50, TRUE)
	var/area/area_to_teleport_to = tgui_input_list(usr, "Area to teleport to", "Teleport", GLOB.teleportlocs)
	if(!area_to_teleport_to)
		return

	var/area/teleport_area = GLOB.teleportlocs[area_to_teleport_to]

	var/list/possible_turfs = list()
	for(var/turf/iterating_turf in get_area_turfs(teleport_area.type))
		if(!iterating_turf.density)
			var/clear = TRUE
			for(var/obj/iterating_object in iterating_turf)
				if(iterating_object.density)
					clear = FALSE
					break
			if(clear)
				possible_turfs += iterating_turf

	if(!LAZYLEN(possible_turfs))
		to_chat(user, span_warning("The spell matrix was unable to locate a suitable teleport destination for an unknown reason. Sorry."))
		return

	if(user.buckled)
		user.buckled.unbuckle_mob(user, force=1)

	var/list/temp_turfs = possible_turfs
	var/attempt = null
	var/success = FALSE
	while(length(temp_turfs))
		attempt = pick(temp_turfs)
		do_teleport(user, attempt, channel = TELEPORT_CHANNEL_FREE)
		if(get_turf(user) == attempt)
			success = TRUE
			break
		else
			temp_turfs.Remove(attempt)

	if(!success)
		do_teleport(user, possible_turfs, channel = TELEPORT_CHANNEL_FREE)
		playsound(get_turf(user), 'sound/magic/LightningShock.ogg', 50, TRUE)
