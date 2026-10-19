/mob/living/carbon/human
	var/infiltrator_active = FALSE

/obj/item/mod/module/infiltrator
	name = "infiltrator MOD module"
	desc = "Скрывает ваше лицо от трекинга ИИ и чужих глаз, делая полностью неузнаваемым."
	icon_state = "infiltrator"
	module_type = MODULE_TOGGLE
	complexity = 1
	idle_power_cost = 0
	removable = FALSE
	required_modpart_index = MOD_PART_HEAD
	startup_with_suit = TRUE

/obj/item/mod/module/infiltrator/on_install()
	. = ..()
	var/obj/item/clothing/mod_part/head/head = mod.mod_parts[MOD_PART_HEAD]
	head.blockTracking = TRUE

/obj/item/mod/module/infiltrator/on_uninstall()
	. = ..()
	var/obj/item/clothing/mod_part/head/head = mod.mod_parts[MOD_PART_HEAD]
	head.blockTracking = FALSE

/obj/item/mod/module/infiltrator/on_activation()
	. = ..()
	if(!mod.wearer || !.) //если родитель выдал FALSE
		return
	mod.wearer.infiltrator_active = TRUE
	mod.wearer.set_bark("bump")
	mod.wearer.digitalcamo = TRUE
	mod.wearer.digitalinvis = TRUE

/obj/item/mod/module/infiltrator/on_deactivation()
	. = ..()
	mod.wearer.infiltrator_active = FALSE
	mod.wearer.set_bark(mod.wearer.client.prefs.bark_id)
	mod.wearer.digitalinvis = FALSE
	mod.wearer.digitalcamo = FALSE

/mob/living/carbon/human/GetVoice()
	. = ..()
	if(. == src.real_name && src.infiltrator_active == TRUE)
		return "Unknown"

/mob/living/carbon/human/examine(mob/user, silent)
	var/mob/living/carbon/human/H
	if(istype(user, /mob/living/carbon/human))
		H = user
	if(H && infiltrator_active && !H.infiltrator_active) //Если осматривающий это человек, у осматриваемого инфильтраторка активна и осматривающий не имеет активной инфильтраторки
		return . = span_big_warning("Вы не можете разглядеть совершенно ничего на теле этого существа.")
	else
		. = ..()

/mob/living/carbon/human/examine_more(mob/user)
	var/mob/living/carbon/human/H
	if(istype(user, /mob/living/carbon/human))
		H = user
	if(H && infiltrator_active && !H.infiltrator_active)
		return . = span_warning("Это существо одето в странный желтый МОД, но лицо и любые возможные приметы скрыты белым шумом.")
	else
		. = ..()

/obj/item/mod/module/storage_upgrader
	name = "MOD Storage Upgrader"
	desc = "Модуль расширения для хранилища МОДа, работающий за счёт технологии BLUESPACE.\
	Позволяет увеличить размер встроенного рюкзака до уровня БС сумки."
	icon_state = "storage_updater"
	incompatible_modules = list(/obj/item/mod/module/storage_upgrader)

/obj/item/mod/module/storage_upgrader/on_install()
	. = ..()
	update_storage()

/obj/item/mod/module/storage_upgrader/on_uninstall()
	. = ..()
	update_storage()

/obj/item/mod/module/storage_upgrader/proc/update_storage()
	for(var/obj/item/mod/module/storage/storage in mod.modules)
		storage.update_capacity()

/obj/item/mod/module/power_kick
	name = "MOD PowerKick Module"
	desc = "Модуль, устанавливающийся в ботинки костюма и позволяющий пинать цель \
			с силой, отправляющей ту в полёт."
	icon_state = "power_kick"
	module_type = MODULE_ACTIVE
	cooldown_time = 30 SECONDS
	device = /obj/item/melee/baseball_bat/powerkick

/obj/item/melee/baseball_bat/powerkick
	name = "Powerkick Boots"
	desc = "Отправьте кого-нибудь в полёт!"
	icon = 'icons/obj/clothing/modsuit/mod_modules.dmi'
	lefthand_file = null //не должно отображаться в руках
	righthand_file = null
	icon_state = "power_kick"
	force = 35
	armour_penetration = MELEE_AP_EXCLUSIVE  //за 5 ТК норм.
	wound_bonus = 20

/obj/item/melee/baseball_bat/powerkick/attack(mob/living/target, mob/living/user)
	. = ..()
	doMove(drop_location()) //чтобы после одного использования уйти на кулдаун.

/obj/item/mod/module/anti_magic/wizard
	name = "Magic Neutralizer"
	desc = "Свиток защищающий носителя от магии, при условии, что тот вставлен в костюм. Имеет печать Федерации магов."
	icon_state = "magic_neutralizer"

/obj/item/mod/module/spellcasting
	name = "Spellcasting MOD enchanting"
	desc = "Благославляющий свиток, позволяющий колдовать, нося элементы МОДа, словно в робе мага."
	icon_state = "magic_neutralizer"
	removable = FALSE

/obj/item/mod/module/spellcasting/on_install()
	. = ..()
	var/obj/item/clothing/mod_part/suit/chest  = mod.get_chestplate()
	var/obj/item/clothing/mod_part/head/helmet = mod.get_helmet()

	chest.AddElement(/datum/element/spellcasting, SPELL_WIZARD_ROBE, ITEM_SLOT_OCLOTHING)
	helmet.AddElement(/datum/element/spellcasting, SPELL_WIZARD_HAT, ITEM_SLOT_HEAD)

/obj/item/mod/module/energy_shield/syndie
	name = "Cybersun Energy Shield module"
	desc = "Одна из совершенных версий модулярных энергощитов, способная выдерживать до 5-ти попаданий. \
	Является разработкой Синдиката в соответствующем стиле, со встроенным микро-ядерным реактором, почти полностью \
	покрывающим затраты щита."
	icon_state = "syndie_energy_shield"
	shield_state = "shield-red"
	used_modificator = MOD_ANTAG_SHIELD_CELL_DRAIN_MODIFICATOR
	recharge_delay = 17 SECONDS
	max_charges = 5

/obj/item/mod/module/energy_shield/syndie/inteq
	name = "InteQ Energy Shield module"
	desc = "Украденный у Синдиката незавершенный модуль щита, доработанный уже в лабораториях ЧВК. Всё ещё достаточно сильный,\
	однако не способен выдерживать столько же много попаданий, как старшая версия."
	icon_state = "inteq_energy_shield"
	shield_state = "shield-yellow"
	minimum_cell_charge = MOD_MINIMUM_CELL_CHARGE_SHIELD_ANTAG
	recharge_delay = 18 SECONDS
	max_charges = 3

/obj/item/mod/module/energy_shield/wizard
	name = "Battlemage Shield"
	desc = "Свиток благославленный лучшими монахами Федерации и защищающий носителя магическим силовым полем."
	icon_state = "battlemage_shield"
	shield_state = "at_shield1"
	recharge_delay = 15 SECONDS //на 10 секунд лучше станционного и на 5 лучше дефолтного от рига.
	need_drain_power = FALSE
	max_charges = 3

/obj/item/mod/module/stealth/adv
	name = "Improved Cloaking module"
	desc = "Улучшенная версия прототипа модуля визуальной маскировки для модулярного костюма, которая \
	, к сожалению, не обрела массового производства. Маскировка этого модуля более стабильная и не сбивается \
	при столкновениях, но атака, касание, удар или попавший в вас снаряд всё так же её снимают."
	icon_state = "cloak_traitor"
	bumpoff = FALSE
	stealth_alpha = 35

/obj/item/mod/module/jump_jet/ninja
	name = "Spider Clan Jump Module"
	desc = "Идейное продолжение прыжкового модуля, но уже под началом специалистов из клана Паука.\
	Скорость прыжков этого модуля настолько быстра, что сравнима с телепортацией и пользователь способен \
	выбирать несколько целей одновременно, дабы прыгнуть дальше обычного."
	icon_state = "jump_jet_ninja"
	beam_icon = 'icons/obj/clothing/modsuit/mod_modules.dmi'
	beam_state = "net_beam"
	incompatible_modules = list()

/obj/item/mod/module/stealth/adv/ninja
	name = "Spider Clan stealth module"
	desc = "Улучшенная версия прототипа модуля визуальной маскировки для модулярного костюма, которая \
	, к сожалению, не обрела массового производства. Маскировка этого модуля более стабильная и не сбивается \
	при столкновениях, но атака, касание, удар или попавший в вас снаряд всё так же её снимают."
	icon_state = "cloak_ninja"
	bumpoff = FALSE
	stealth_alpha = 10

/obj/item/mod/module/jump_jet/inteq
	name = "InteQ Jump Jet Module"
	desc = ""
	icon_state = "jump_jet_inteq"
	incompatible_modules = list()

/obj/item/mod/module/launch_kick
	name = "MOD launch kick module"
	desc = "Усиленные приводы разгоняют носителя для удара ногой с прыжка."
	icon_state = "power_kick"
	module_type = MODULE_ACTIVE
	use_power_cost = DEFAULT_CHARGE_DRAIN * 5
	cooldown_time = 5 SECONDS
	required_modpart_index = MOD_PART_FEET
	have_shortcut_activation = TRUE
	incompatible_modules = list(/obj/item/mod/module/launch_kick)
	var/mob/living/kicker
	var/matrix/initial_transform
	var/initial_height
	var/damage = MOD_KICK_DAMAGE
	var/wounding_power = MOD_KICK_WOUND_BONUS
	var/knockdown_time = 2 SECONDS

/obj/item/mod/module/launch_kick/on_select_use(atom/target)
	if(kicker || !..())
		return FALSE
	kicker = mod.wearer
	initial_height = kicker.pixel_z
	initial_transform = matrix(kicker.transform)
	RegisterSignal(kicker, COMSIG_PARENT_QDELETING, PROC_REF(on_kicker_deleted))
	playsound(mod, 'sound/items/modsuit/loader_charge.ogg', MOD_KICK_VOLUME, TRUE)
	animate(kicker, 0.3 SECONDS, pixel_z = initial_height + MOD_KICK_HEIGHT, easing = SINE_EASING | EASE_OUT)
	if(!do_after(kicker, 1 SECONDS, target = mod))
		finish_kick()
		return FALSE
	if(!kicker || QDELETED(target) || !active || mod?.wearer != kicker || !check_required_modpart() || !drain_power(use_power_cost))
		finish_kick()
		return FALSE
	playsound(mod, 'sound/items/modsuit/loader_launch.ogg', MOD_KICK_VOLUME, TRUE)
	kicker.transform = matrix(initial_transform).Turn(Get_Angle(kicker, target) + MOD_KICK_TURN)
	RegisterSignal(kicker, COMSIG_MOVABLE_IMPACT, PROC_REF(on_impact))
	if(!kicker.throw_at(target, range = MOD_KICK_RANGE, speed = MOD_KICK_SPEED, thrower = kicker, spin = FALSE, gentle = TRUE, callback = CALLBACK(src, PROC_REF(finish_kick))))
		finish_kick()
	return TRUE

/obj/item/mod/module/launch_kick/proc/on_impact(mob/living/source, atom/target, datum/thrownthing/thrownthing)
	SIGNAL_HANDLER
	UnregisterSignal(source, COMSIG_MOVABLE_IMPACT)
	if(!active || mod?.wearer != source)
		return
	if(isliving(target))
		var/mob/living/victim = target
		victim.apply_damage(damage, BRUTE, source.zone_selected, wound_bonus = wounding_power)
		victim.Knockdown(knockdown_time)
	else if(isobj(target))
		var/obj/obstacle = target
		obstacle.take_damage(damage, BRUTE, MELEE)
	source.do_attack_animation(target, ATTACK_EFFECT_SMASH)

/obj/item/mod/module/launch_kick/proc/on_kicker_deleted(datum/source)
	SIGNAL_HANDLER
	finish_kick()

/obj/item/mod/module/launch_kick/proc/finish_kick()
	if(kicker)
		UnregisterSignal(kicker, list(COMSIG_MOVABLE_IMPACT, COMSIG_PARENT_QDELETING))
		kicker.transform = initial_transform
		kicker.pixel_z = initial_height
	kicker = null
	initial_transform = null

/obj/item/mod/module/launch_kick/on_deactivation()
	finish_kick()
	return ..()

/obj/item/mod/module/launch_kick/on_uninstall(deleting, user)
	finish_kick()
	return ..()

/obj/item/mod/module/launch_kick/Destroy()
	finish_kick()
	return ..()
