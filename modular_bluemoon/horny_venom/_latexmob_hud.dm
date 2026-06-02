/datum/hud/dextrous/latexmob
	// ui_style = 'icons/mob/screen_alien.dmi' надо будет своё крутое с

/datum/hud/dextrous/latexmob/New(mob/owner)
	..()

	action_intent = new /atom/movable/screen/act_intent(null, src)
	action_intent.icon_state = mymob.a_intent
	static_inventory += action_intent
