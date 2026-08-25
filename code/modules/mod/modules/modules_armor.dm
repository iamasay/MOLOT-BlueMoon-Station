/obj/item/mod/module/armor
	name = "Base MOD armor"
	icon_state = "base_armor"
	desc = "Незавершенная плитка дополнительной брони, защищающая владельца от указанного на этикетке типа повреждений. Стоит понимать, что \
	каждая такая плитка имеет вес и, следовательно, повышает энергопотребление из-за нагрузки на сервоприводы."
	module_type = MODULE_ARMOR
	var/armor_type //MELEE, BULLET, LASER
	var/armor_bonus = 3.5 //15 единиц брони. Is класс
	var/need_sheets = 10
	var/slowdown_bonus = 0.25
	idle_power_cost = DEFAULT_CHARGE_DRAIN * 0.5
	var/list/material_to_armor_list = list(
		/obj/item/stack/sheet/durathread 			= MELEE,
		/obj/item/stack/sheet/plasteel 				= BULLET,
		/obj/item/stack/sheet/mineral/titanium 		= LASER,
		/obj/item/stack/sheet/mineral/diamond		= ENERGY,
		/obj/item/stack/sheet/mineral/gold			= BOMB,
		/obj/item/stack/sheet/mineral/silver		= BIO,
		/obj/item/stack/sheet/mineral/plastitanium 	= RAD,
		/obj/item/stack/sheet/plastitaniumglass		= FIRE,
		/obj/item/stack/sheet/rglass				= ACID,
		/obj/item/stack/sheet/mineral/adamantine	= MAGIC,
		/obj/item/stack/sheet/mineral/abductor		= WOUND,
	)
	complexity = 2

/obj/item/mod/module/armor/examine_more(mob/user)
	. = ..()
	if(armor_type)
		return
	. += span_boldnotice("Сейчас доступны варианты:")
	for(var/material in material_to_armor_list)
		. += (span_alert("Материал [(material)] позволяет сделать защиту от:") + span_revenminor("[material_to_armor_list[material]]"))

/obj/item/mod/module/armor/proc/add_armor_bonus()
	for(var/index in mod.mod_parts)
		if(index == MOD_PART_CELL)
			continue
		var/obj/item/clothing/mod_part/part = mod.mod_parts[index]
		part.armor.vars[armor_type] += armor_bonus
	mod.slowdown_active += slowdown_bonus	//в модулях опасно обращаться напрямую к wearer, потому что его может не быть
	mod.slowdown_inactive += slowdown_bonus //лучше просто моду самому поменять слоудаун.

/obj/item/mod/module/armor/proc/remove_armor_bonus()
	for(var/index in mod.mod_parts)
		if(index == MOD_PART_CELL)
			continue
		var/obj/item/clothing/mod_part/part = mod.mod_parts[index]
		part.armor.vars[armor_type] -= armor_bonus
	mod.slowdown_active -= slowdown_bonus
	mod.slowdown_inactive -= slowdown_bonus

/obj/item/mod/module/armor/proc/get_armor_by_material(obj/item/stack/sheet/material)
    if (!(material.type in material_to_armor_list))
        return null
    return material_to_armor_list[material.type]

/obj/item/mod/module/armor/on_install()
	. = ..()
	if(!armor_type)
		return
	mod.current_armor_module_installed += 1
	add_armor_bonus()

/obj/item/mod/module/armor/on_uninstall()
	. = ..()
	if(!armor_type)
		return
	mod.current_armor_module_installed -= 1
	remove_armor_bonus()

/obj/item/mod/module/armor/attackby(obj/item/I, mob/living/user, params)
//Чекает в списке какую броню ставить, если это материал и меняет icon_state с названием
	. = ..()
	if(armor_type)
		return
	var/mob/living/carbon/C = user
	if(!istype(I, /obj/item/stack/sheet))
		return
	var/obj/item/stack/sheet/material = I
	armor_type = get_armor_by_material(material)
	if(material.amount < need_sheets || !armor_type)
		var/ballon_message = armor_type ? "Нужно 10 листов" : "Не подходящий материал!"
		C.balloon_alert(C, ballon_message)
		armor_type = null
		return
	if(do_after(user, 2 SECONDS, src))
		name = "[armor_type] MOD armor"
		icon_state = "armor-[armor_type]"
		desc = "Завершенный модуль брони для МОДа, который защищает от повреждений типа [armor_type]"
		material.use(need_sheets)
	else
		armor_type = null

/obj/item/mod/module/armor/prebuild
	name = "Base prebuild"

/obj/item/mod/module/armor/prebuild/Initialize(mapload)
	. = ..()
	name = "[armor_type] MOD armor"
	icon_state = "armor-[armor_type]"

/obj/item/mod/module/armor/prebuild/melee
	armor_type = MELEE

/obj/item/mod/module/armor/prebuild/bullet
	armor_type = BULLET

/obj/item/mod/module/armor/prebuild/laser
	armor_type = LASER

/obj/item/mod/module/armor/prebuild/energy
	armor_type = ENERGY

/obj/item/mod/module/armor/prebuild/bomb
	armor_type = BOMB

/obj/item/mod/module/armor/prebuild/bio
	armor_type = BIO

/obj/item/mod/module/armor/prebuild/rad
	armor_type = RAD

/obj/item/mod/module/armor/prebuild/fire
	armor_type = FIRE

/obj/item/mod/module/armor/prebuild/acid
	armor_type = ACID

/obj/item/mod/module/armor/prebuild/magic
	armor_type = MAGIC

/obj/item/mod/module/armor/prebuild/wound
	armor_type = WOUND
