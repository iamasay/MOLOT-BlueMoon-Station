//Science modules for MODsuits

///Reagent Scanner - Lets the user scan reagents.
/obj/item/mod/module/reagent_scanner
	name = "MOD reagent scanner module"
	desc = "Модуль, основанный на исследовательских дисплеях Nanotrasen, способный сканировать содержимое \
		контейнеров и отображать информацию в удобном для чтения формате на экране носителя. \
		Он не может определять вкусы, так что это зависит от вас."
	icon_state = "scanner"
	module_type = MODULE_TOGGLE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.2
	incompatible_modules = list(/obj/item/mod/module/reagent_scanner)
	cooldown_time = 0.5 SECONDS
	mod_module_flags = MOD_MODULE_SCIENCE // BLUEMOON ADD

/obj/item/mod/module/reagent_scanner/on_activation()
	. = ..()
	if(!.)
		return
	ADD_TRAIT(mod.wearer, TRAIT_REAGENT_SCANNER, MOD_TRAIT)

/obj/item/mod/module/reagent_scanner/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	REMOVE_TRAIT(mod.wearer, TRAIT_REAGENT_SCANNER, MOD_TRAIT)

/obj/item/mod/module/reagent_scanner/advanced
	name = "MOD advanced reagent scanner module"
	complexity = 0
	removable = FALSE
	var/explosion_detection_dist = 21
	var/had_research_scanner = FALSE

/obj/item/mod/module/reagent_scanner/advanced/on_activation()
	. = ..()
	if(!.)
		return
	had_research_scanner = mod.wearer.research_scanner
	mod.wearer.research_scanner = TRUE
	RegisterSignal(SSdcs, COMSIG_GLOB_EXPLOSION, PROC_REF(sense_explosion))

/obj/item/mod/module/reagent_scanner/advanced/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	mod.wearer.research_scanner = had_research_scanner
	had_research_scanner = FALSE
	UnregisterSignal(SSdcs, COMSIG_GLOB_EXPLOSION)

/obj/item/mod/module/reagent_scanner/advanced/proc/sense_explosion(datum/source, turf/epicenter,
	devastation_range, heavy_impact_range, light_impact_range, took, orig_dev_range, orig_heavy_range, orig_light_range)
	SIGNAL_HANDLER
	var/turf/wearer_turf = get_turf(mod.wearer)
	if(wearer_turf.z == epicenter.z)
		return
	if(get_dist(epicenter, wearer_turf) > explosion_detection_dist)
		return
	to_chat(mod.wearer, span_notice("Explosion detected! Epicenter: [devastation_range], Outer: [heavy_impact_range], Shock: [light_impact_range]"))

///Anti-Gravity - Makes the user weightless.
/obj/item/mod/module/anomaly_locked/antigrav
	name = "MOD anti-gravity module"
	desc = "Модуль, использующий гравитационное ядро для полного обнуления веса пользователя. К сожалению, не способен работать когда пользователь лежит."
	icon_state = "antigrav"
	module_type = MODULE_TOGGLE
	complexity = 3
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.7
	incompatible_modules = list(/obj/item/mod/module/anomaly_locked)
	cooldown_time = 0.5 SECONDS
	accepted_anomalies = list(/obj/item/assembly/signaler/anomaly/grav)
	mod_module_flags = MOD_MODULE_SCIENCE // BLUEMOON ADD

/obj/item/mod/module/anomaly_locked/antigrav
	var/resume_on_standing = FALSE

/obj/item/mod/module/anomaly_locked/antigrav/on_equip()
	. = ..()
	RegisterSignal(mod.wearer, COMSIG_LIVING_SET_BODY_POSITION, PROC_REF(check_lying_down))

/obj/item/mod/module/anomaly_locked/antigrav/on_unequip()
	UnregisterSignal(mod.wearer, COMSIG_LIVING_SET_BODY_POSITION)
	resume_on_standing = FALSE
	if(active)
		on_deactivation()
	return ..()

/obj/item/mod/module/anomaly_locked/antigrav/on_suit_deactivation()
	resume_on_standing = FALSE
	return ..()

/obj/item/mod/module/anomaly_locked/antigrav/proc/check_lying_down(datum/source)
	SIGNAL_HANDLER
	if(mod.wearer.body_position == LYING_DOWN)
		if(active)
			on_deactivation()
			resume_on_standing = TRUE
		return
	if(resume_on_standing && mod.is_active() && !mod.is_activating())
		on_activation()

/obj/item/mod/module/anomaly_locked/antigrav/on_select(atom/target)
	if(!mod?.wearer)
		return FALSE
	if(mod.wearer.body_position == LYING_DOWN)
		balloon_alert(mod.wearer, "Модуль сбоит!")
		to_chat(mod.wearer, span_boldwarning("Антиграв нельзя использовать лёжа!"))
		return FALSE
	. = ..()

/obj/item/mod/module/anomaly_locked/antigrav/on_activation()
	if(!mod?.wearer || mod.wearer.body_position == LYING_DOWN)
		return FALSE
	. = ..()
	if(!.)
		return
	resume_on_standing = FALSE
	if(mod.wearer.has_gravity())
		new /obj/effect/temp_visual/mook_dust(get_turf(mod))
	mod.wearer.AddElement(/datum/element/forced_gravity, 0)
	mod.wearer.refresh_gravity()
	playsound(mod, 'sound/effects/gravhit.ogg', 50)

/obj/item/mod/module/anomaly_locked/antigrav/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	if(!.)
		return
	resume_on_standing = FALSE
	mod.wearer.RemoveElement(/datum/element/forced_gravity, 0)
	mod.wearer.refresh_gravity()
	if(deleting)
		return
	if(mod.wearer.has_gravity())
		new /obj/effect/temp_visual/mook_dust(get_turf(mod))
	playsound(mod, 'sound/effects/gravhit.ogg', 50)

/obj/item/mod/module/anomaly_locked/antigrav/prebuilt
	prebuilt = TRUE

///Teleporter - Lets the user teleport to a nearby location.
/obj/item/mod/module/anomaly_locked/teleporter
	name = "MOD teleporter module"
	desc = "Модуль, использующий блюспейс-ядро для перемещения частиц пользователя в другое место."
	icon_state = "teleporter"
	module_type = MODULE_ACTIVE
	complexity = 3
	use_power_cost = DEFAULT_CHARGE_DRAIN * 5
	cooldown_time = 5 SECONDS
	accepted_anomalies = list(/obj/item/assembly/signaler/anomaly/bluespace)
	/// Time it takes to teleport
	var/teleport_time = 3 SECONDS
	var/mob/living/carbon/human/teleporting_user
	var/matrix/teleport_transform
	var/teleport_color
	mod_module_flags = MOD_MODULE_SCIENCE // BLUEMOON ADD
	have_shortcut_activation = TRUE

/obj/item/mod/module/anomaly_locked/teleporter/on_select_use(atom/target)
	if(teleporting_user || !..())
		return FALSE
	var/turf/open/target_turf = get_turf(target)
	if(!istype(target_turf) || is_blocked_turf(target_turf) || !(target_turf in view(mod.wearer)))
		mod.balloon_alert(mod.wearer, "неверная цель!")
		return FALSE
	var/mob/living/carbon/human/user = mod.wearer
	mod.balloon_alert(user, "телепортируем...")
	begin_teleport(user)
	var/ready = do_after(user, teleport_time, target = mod)
	if(teleporting_user != user)
		return FALSE
	end_teleport()
	if(!ready || !active || mod?.wearer != user || !check_required_modpart() || QDELETED(core))
		return FALSE
	if(!check_power(use_power_cost) || is_blocked_turf(target_turf) || !(target_turf in view(user)))
		return FALSE
	if(!do_teleport(user, target_turf, asoundin = 'sound/effects/phasein.ogg'))
		return FALSE
	drain_power(use_power_cost)
	return TRUE

/obj/item/mod/module/anomaly_locked/teleporter/proc/begin_teleport(mob/living/carbon/human/user)
	teleporting_user = user
	teleport_transform = matrix(user.transform)
	teleport_color = user.color
	RegisterSignal(user, COMSIG_PARENT_QDELETING, PROC_REF(on_teleport_user_deleted))
	var/matrix/stretch = matrix(teleport_transform)
	stretch.Scale(MOD_TELEPORT_STRETCH, 1 / MOD_TELEPORT_STRETCH)
	animate(user, teleport_time, color = COLOR_CYAN, transform = stretch, easing = SINE_EASING | EASE_OUT)

/obj/item/mod/module/anomaly_locked/teleporter/proc/end_teleport()
	if(teleporting_user)
		UnregisterSignal(teleporting_user, COMSIG_PARENT_QDELETING)
		animate(teleporting_user)
		teleporting_user.transform = teleport_transform
		teleporting_user.color = teleport_color
	teleporting_user = null
	teleport_transform = null
	teleport_color = null

/obj/item/mod/module/anomaly_locked/teleporter/proc/on_teleport_user_deleted(datum/source)
	SIGNAL_HANDLER
	end_teleport()

/obj/item/mod/module/anomaly_locked/teleporter/on_deactivation(display_message = TRUE, deleting = FALSE)
	end_teleport()
	return ..()

/obj/item/mod/module/anomaly_locked/teleporter/Destroy()
	end_teleport()
	return ..()

/obj/item/mod/module/anomaly_locked/teleporter/prebuilt
	prebuilt = TRUE

/obj/item/mod/module/jump_jet
	name = "Jump Jet Module"
	icon_state = "jump_jet"
	desc = "Специализированный нагнетатель газа, которы при наборе нужного давления способен \
	с огромной силой высвободить накопленный безвредный газ, чтобы отправить пользователя в непродолжительный\
	полет. Работает как в атмосфере, так и в космосе, благодаря встроенным бакам. Несовместим с джетпаком, потому что \
	крепится ровно туда же."
	incompatible_modules = list(/obj/item/mod/module/jetpack, /obj/item/mod/module/jump_jet)
	module_type = MODULE_USABLE
	cooldown_time = 10 SECONDS
	required_modpart_index = MOD_PART_FEET
	var/beam_icon = 'icons/effects/effects.dmi'
	var/beam_state = "ion_fade"
	var/jumpdistance = 5
	var/jumpspeed = 3
	var/jumps_max = 1
	var/jumps_avaible

/obj/item/mod/module/jump_jet/on_use()
	. = ..()
	if(!.)
		return
	var/turf/start_from = mod.wearer.loc
	if(mod.wearer.body_position == LYING_DOWN)
		balloon_alert(mod.wearer, "Нужна опора!")
		return
	var/atom/target = get_edge_target_turf(mod.wearer, mod.wearer.dir)
	if(mod.wearer.throw_at(target, jumpdistance, jumpspeed, spin = FALSE, diagonals_first = TRUE))
		start_from.Beam(mod.wearer, beam_state, beam_icon, 0.5 SECONDS)
		playsound(mod, 'sound/effects/stealthoff.ogg', 50, 1, 1)
		mod.wearer.visible_message("<span class='warning'>[mod.wearer] мгновенно срывается вперёд, взмывая в воздух!</span>")
	else
		to_chat(mod.wearer, "<span class='warning'>Что-то мешает вам это сделать!</span>")
