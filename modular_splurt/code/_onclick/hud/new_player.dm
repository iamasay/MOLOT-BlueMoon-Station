/datum/hud/new_player/populate_buttons(mob/dead/new_player/owner)
	if(!(owner.client?.prefs.toggles & TG_PLAYER_PANEL))
		return
	. = ..()

/atom/movable/screen/lobby/button/Click(location, control, params)
	var/vibe_check = SSdiscord?.check_login(usr)
	if(isnull(vibe_check))
		to_chat(usr, span_notice("The server is still starting up. Please wait... "))
		return
	else if(vibe_check == FALSE) //Dirty but I guess we gotta tell when the subsystem hasn't started
		to_chat(usr, span_warning("You must link your discord account to your ckey in order to join the game. Join our <a style=\"color: #ff00ff;\" href=\"[CONFIG_GET(string/discordurl)]\">discord</a> and use the <span style=\"color: #ff00ff;\">[CONFIG_GET(string/discordbotcommandprefix)][CONFIG_GET(string/verification_command)]</span> command [CONFIG_GET(string/verification_channel) ? "as indicated in #[CONFIG_GET(string/verification_channel)] " : ""]. It won't take you more than two minutes :)<br>Ahelp or ask staff in the discord if this is an error."))
		return

	if(!(usr.client?.prefs.toggles & TG_PLAYER_PANEL))
		return

	. = ..()
