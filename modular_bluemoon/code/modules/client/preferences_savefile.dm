/datum/preferences/proc/bluemoon_character_pref_load(savefile/S) //TODO: modularize our other savefile edits... maybe?
	S["pda_style"] >> pda_style
	S["pda_color"] >> pda_color
	S["pda_skin"] >> pda_skin
	S["pda_ringtone"] >> pda_ringtone

	S["silicon_lawset"] >> silicon_lawset

	pda_style = sanitize_inlist(pda_style, GLOB.pda_styles, initial(pda_style))
	pda_color = sanitize_hexcolor(pda_color, 6, 1, initial(pda_color))
	pda_skin = sanitize_inlist(pda_skin, GLOB.pda_reskins, PDA_SKIN_ALT)
	// pda_ringtone = ??? // none for now

	silicon_lawset = sanitize_inlist(silicon_lawset, CONFIG_GET(keyed_list/choosable_laws), null)

/datum/preferences/proc/bluemoon_character_pref_save(savefile/S) //TODO: modularize our other savefile edits... maybe?
	WRITE_FILE(S["pda_style"], pda_style)
	WRITE_FILE(S["pda_color"], pda_color)
	WRITE_FILE(S["pda_skin"], pda_skin)
	WRITE_FILE(S["pda_ringtone"], pda_ringtone)

	WRITE_FILE(S["silicon_lawset"], silicon_lawset)

/obj/item/pda/proc/update_style(client/C)
	background_color = C.prefs.pda_color
	ttone = C.prefs.pda_ringtone || ttone
	switch(C.prefs.pda_style)
		if(MONO)
			font_index = MODE_MONO
			font_mode = FONT_MONO
		if(SHARE)
			font_index = MODE_SHARE
			font_mode = FONT_SHARE
		if(ORBITRON)
			font_index = MODE_ORBITRON
			font_mode = FONT_ORBITRON
		if(VT)
			font_index = MODE_VT
			font_mode = FONT_VT
		else
			font_index = MODE_MONO
			font_mode = FONT_MONO
	var/pref_skin = GLOB.pda_reskins[C.prefs.pda_skin]["icon"]
	if(icon != pref_skin)
		icon = pref_skin
		new_overlays = TRUE
		update_icon()
	equipped = TRUE
