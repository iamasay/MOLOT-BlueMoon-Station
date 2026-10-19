/obj/item/mod/module/visor/rave
	name = "MOD rave visor module"
	desc = "Развлекательный визор переливается цветами радуги и воспроизводит музыку только своему владельцу."
	icon = 'icons/obj/clothing/modsuit/mod_modules_maint_whitemoon.dmi'
	icon_state = "rave_visor"
	complexity = MOD_COMPLEXITY_SMALL
	var/datum/client_colour/mod_rave/rave_screen
	var/mob/living/carbon/human/rave_user
	var/datum/track/selection
	var/music_channel
	var/music_client_ref
	var/rave_number = MOD_RAVE_FIRST_COLOR
	var/static/list/rainbow_order = list(COLOR_RED, "#ff8000", COLOR_YELLOW, "#00ff00", "#0080ff", "#ff00ff")

/obj/item/mod/module/visor/rave/Destroy()
	clear_rave()
	selection = null
	return ..()

/obj/item/mod/module/visor/rave/on_activation()
	if(!..())
		return FALSE
	rave_user = mod.wearer
	RegisterSignal(rave_user, COMSIG_PARENT_QDELETING, PROC_REF(on_user_deleted))
	rave_screen = rave_user.add_client_colour(/datum/client_colour/mod_rave)
	update_color()
	start_music()
	return TRUE

/obj/item/mod/module/visor/rave/on_deactivation(display_message = TRUE, deleting = FALSE)
	clear_rave()
	return ..()

/obj/item/mod/module/visor/rave/on_unequip()
	clear_rave()

/obj/item/mod/module/visor/rave/proc/on_user_deleted()
	SIGNAL_HANDLER
	clear_rave()

/obj/item/mod/module/visor/rave/proc/clear_rave()
	stop_music()
	if(rave_user)
		UnregisterSignal(rave_user, COMSIG_PARENT_QDELETING)
		rave_user.client_colours -= rave_screen
		rave_user.update_client_colour()
	rave_user = null
	QDEL_NULL(rave_screen)

/obj/item/mod/module/visor/rave/proc/update_color()
	if(!rave_screen || !rave_user)
		return
	rave_screen.colour = rainbow_order[rave_number]
	rave_user.update_client_colour()
	rave_user.update_inv_back()

/obj/item/mod/module/visor/rave/on_active_process(delta_time)
	if(!rave_user)
		return
	rave_number = rave_number % length(rainbow_order) + MOD_RAVE_FIRST_COLOR
	update_color()
	if(music_channel && music_client_ref != REF(rave_user.client))
		stop_music()
	if(!SSjukeboxes.jukebox_sound_enabled(rave_user, TRUE))
		stop_music()
	else if(!music_channel)
		start_music()

/obj/item/mod/module/visor/rave/proc/start_music()
	if(!rave_user || music_channel || !SSjukeboxes.jukebox_sound_enabled(rave_user, TRUE))
		return FALSE
	if(!selection && length(SSjukeboxes.songs))
		selection = SSjukeboxes.songs[1]
	if(!selection?.song_path)
		return FALSE
	music_channel = SSsounds.reserve_sound_channel(src)
	if(!music_channel)
		return FALSE
	music_client_ref = REF(rave_user.client)
	SEND_SOUND(rave_user, sound(selection.song_path, repeat = TRUE, channel = music_channel, volume = MOD_RAVE_VOLUME))
	return TRUE

/obj/item/mod/module/visor/rave/proc/stop_music()
	music_client_ref = null
	if(!music_channel)
		return
	if(rave_user)
		SEND_SOUND(rave_user, sound(null, channel = music_channel))
	SSsounds.free_sound_channel(music_channel)
	music_channel = null

/obj/item/mod/module/visor/rave/get_configuration()
	. = ..()
	var/list/songs = list()
	for(var/datum/track/song in SSjukeboxes.songs)
		songs += song.song_name
	if(!selection && length(SSjukeboxes.songs))
		selection = SSjukeboxes.songs[1]
	if(length(songs))
		.["selection"] = add_ui_configuration("Музыка", "list", selection?.song_name, songs)

/obj/item/mod/module/visor/rave/configure_edit(key, value)
	if(key != "selection" || active)
		return
	for(var/datum/track/song in SSjukeboxes.songs)
		if(song.song_name == value)
			selection = song
			return

/obj/item/mod/module/visor/rave/generate_worn_overlay()
	. = ..()
	if(!active || !check_required_modpart())
		return
	var/static/list/states = icon_states('icons/mob/clothing/modsuit/mod_visor_whitemoon.dmi')
	var/state = "[mod.skin]-helmet-visor"
	if(!(state in states))
		state = "standard-helmet-visor"
	var/mutable_appearance/visor = mutable_appearance('icons/mob/clothing/modsuit/mod_visor_whitemoon.dmi', state)
	visor.appearance_flags |= RESET_COLOR
	visor.color = rainbow_order[rave_number]
	. += visor

/datum/client_colour/mod_rave
	priority = MOD_RAVE_PRIORITY
