/datum/evolution_store
	var/name = "Evolution store"
	var/data
	var/datum/antagonist/living_latex/living_latex

/datum/evolution_store/New(my_living_latex)
	. = ..()
	living_latex = my_living_latex

/datum/evolution_store/Destroy()
	living_latex = null
	. = ..()

/datum/evolution_store/ui_state(mob/user)
	return GLOB.always_state

/datum/evolution_store/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "EvolveShop", name)
		ui.open()

/datum/evolution_store/ui_data(mob/user)

	var/list/abilities = list()

	for(var/path in living_latex.all_abilities)
		var/datum/action/cooldown/latexmob/ability = path

		var/stage_required = initial(ability.stage_required)

		var/list/AL = list()
		AL["name"] = initial(ability.name)
		AL["desc"] = initial(ability.desc)
		AL["stage_required"] = initial(ability.stage_required)
		AL["can_purchase"] = (living_latex.stage >= ability.stage_required)

		abilities += list(AL)

		data["abilities"] = abilities

		return data

/datum/evolution_store/ui_act(action, params)
	if(..())
		return

	// switch(action)
	// 	if("readapt")
	// 		if(changeling.can_respec)
	// 			changeling.readapt()
	// 	if("evolve")
	// 		var/sting_name = params["name"]
	// 		changeling.purchase_power(sting_name)

/datum/action/innate/evolution_store
	name = "Evolution Store"
	icon_icon = 'icons/obj/drinks.dmi'
	button_icon_state = "changelingsting"
	background_icon_state = "bg_changeling"
	var/datum/evolution_store/evolution

/datum/action/innate/evolution_store/New()
	. = ..()
	var/datum/antagonist/living_latex/living_latex = usr.mind.antag_datums
	evolution = living_latex.evolution_store
	if(!evolution)
		CRASH("evolution_store action created with non store")

/datum/action/innate/evolution_store/Activate()
	evolution.ui_interact(usr)