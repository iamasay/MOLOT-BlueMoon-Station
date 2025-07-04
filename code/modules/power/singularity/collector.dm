// stored_power += (pulse_strength-RAD_COLLECTOR_EFFICIENCY)*RAD_COLLECTOR_COEFFICIENT
#define RAD_COLLECTOR_EFFICIENCY 80 	// radiation needs to be over this amount to get power
#define RAD_COLLECTOR_COEFFICIENT 125
#define RAD_COLLECTOR_STORED_OUT 0.05	// (this*100)% of stored power outputted per tick. Doesn't actualy change output total, lower numbers just means collectors output for longer in absence of a source
#define RAD_COLLECTOR_MINING_CONVERSION_RATE 0.00001 //This is gonna need a lot of tweaking to get right. This is the number used to calculate the conversion of watts to research points per process()
#define RAD_COLLECTOR_OUTPUT min(stored_power, (stored_power*RAD_COLLECTOR_STORED_OUT)+1000) //Produces at least 1000 watts if it has more than that stored

/obj/machinery/power/rad_collector
	name = "Radiation Collector Array"
	desc = "A device which uses Hawking Radiation and plasma to produce power."
	icon = 'icons/obj/singularity.dmi'
	icon_state = "ca"
	anchored = FALSE
	density = TRUE
	req_access = list(ACCESS_ENGINE_EQUIP)
//	use_power = NO_POWER_USE
	max_integrity = 350
	integrity_failure = 0.2
	circuit = /obj/item/circuitboard/machine/rad_collector
	var/obj/item/tank/internals/plasma/loaded_tank = null
	var/stored_power = 0
	var/last_push
	var/active = 0
	var/locked = FALSE
	var/drainratio = 1
	var/powerproduction_drain = 0.001

	var/bitcoinproduction_drain = 0.15
	var/bitcoinmining = FALSE
	rad_insulation = RAD_EXTREME_INSULATION
	var/obj/item/radio/Radio

/obj/machinery/power/rad_collector/anchored
	anchored = TRUE

/obj/machinery/power/rad_collector/Initialize(mapload)
	. = ..()
	Radio = new /obj/item/radio(src)
	Radio.listening = 0
	Radio.set_frequency(FREQ_ENGINEERING)
	if(anchored)
		connect_to_network()

/obj/machinery/power/rad_collector/Destroy()
	QDEL_NULL(Radio)
	return ..()

/obj/machinery/power/rad_collector/process()
	if(!loaded_tank)
		return
	if(!bitcoinmining)
		if(loaded_tank.air_contents.get_moles(GAS_PLASMA) < 0.0001)
			investigate_log("<font color='red'>out of fuel</font>.", INVESTIGATE_SINGULO)
			playsound(src, 'sound/machines/ding.ogg', 50, 1)
			Radio.talk_into(src, "Insufficient plasma in [get_area(src)] [src], ejecting \the [loaded_tank].", FREQ_ENGINEERING)
			eject()
		else
			var/gasdrained = min(powerproduction_drain*drainratio,loaded_tank.air_contents.get_moles(GAS_PLASMA))
			loaded_tank.air_contents.adjust_moles(GAS_PLASMA, -gasdrained)
			loaded_tank.air_contents.adjust_moles(GAS_TRITIUM, gasdrained)

			var/power_produced = RAD_COLLECTOR_OUTPUT
			add_avail(power_produced)
			stored_power-=power_produced
	else if(is_station_level(z) && SSresearch.science_tech)
		if(!loaded_tank.air_contents.get_moles(GAS_TRITIUM) || !loaded_tank.air_contents.get_moles(GAS_O2))
			playsound(src, 'sound/machines/ding.ogg', 50, 1)
			Radio.talk_into(src, "Insufficient oxygen and tritium in [get_area(src)] [src] to produce research points, ejecting \the [loaded_tank].", FREQ_ENGINEERING)
			eject()
		else
			var/gasdrained = bitcoinproduction_drain*drainratio
			loaded_tank.air_contents.adjust_moles(GAS_TRITIUM, -gasdrained)
			loaded_tank.air_contents.adjust_moles(GAS_O2, -gasdrained)
			loaded_tank.air_contents.adjust_moles(GAS_CO2, gasdrained*2)
			var/bitcoins_mined = stored_power*RAD_COLLECTOR_MINING_CONVERSION_RATE
			var/datum/bank_account/D = SSeconomy.get_dep_account(ACCOUNT_ENG)
			if(D)
				D.adjust_money(bitcoins_mined)
			SSresearch.science_tech.add_point_type(TECHWEB_POINT_TYPE_DEFAULT, bitcoins_mined)
			last_push = stored_power
			stored_power = 0

/obj/machinery/power/rad_collector/interact(mob/user)
	if(anchored)
		if(!src.locked)
			toggle_power()
			user.visible_message("[user.name] turns the [src.name] [active? "on":"off"].", \
			"<span class='notice'>You turn the [src.name] [active? "on":"off"].</span>")
			var/fuel = loaded_tank?.air_contents.get_moles(GAS_PLASMA)
			investigate_log("turned [active?"<font color='green'>on</font>":"<font color='red'>off</font>"] by [key_name(user)]. [loaded_tank?"Fuel: [round(fuel/0.29)]%":"<font color='red'>It is empty</font>"].", INVESTIGATE_SINGULO)
			return
		else
			to_chat(user, "<span class='warning'>The controls are locked!</span>")
			return

/obj/machinery/power/rad_collector/can_be_unfasten_wrench(mob/user, silent)
	if(loaded_tank)
		if(!silent)
			to_chat(user, "<span class='warning'>Remove the plasma tank first!</span>")
		return FAILED_UNFASTEN
	return ..()

/obj/machinery/power/rad_collector/default_unfasten_wrench(mob/user, obj/item/I, time = 20)
	. = ..()
	if(. == SUCCESSFUL_UNFASTEN)
		if(anchored)
			connect_to_network()
		else
			disconnect_from_network()

/obj/machinery/power/rad_collector/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/tank/internals/plasma))
		if(!anchored)
			to_chat(user, "<span class='warning'>[src] needs to be secured to the floor first!</span>")
			return TRUE
		if(loaded_tank)
			to_chat(user, "<span class='warning'>There's already a plasma tank loaded!</span>")
			return TRUE
		if(panel_open)
			to_chat(user, "<span class='warning'>Close the maintenance panel first!</span>")
			return TRUE
		if(!user.transferItemToLoc(W, src))
			return
		loaded_tank = W
		update_icon()
	else if(W.GetID())
		if(allowed(user))
			if(active)
				locked = !locked
				to_chat(user, "<span class='notice'>You [locked ? "lock" : "unlock"] the controls.</span>")
			else
				to_chat(user, "<span class='warning'>The controls can only be locked when \the [src] is active!</span>")
		else
			to_chat(user, "<span class='danger'>Доступ запрещён.</span>")
			return TRUE
	else
		return ..()

/obj/machinery/power/rad_collector/wrench_act(mob/living/user, obj/item/I)
	default_unfasten_wrench(user, I)
	return TRUE

/obj/machinery/power/rad_collector/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(loaded_tank)
		to_chat(user, "<span class='warning'>Remove the plasma tank first!</span>")
	else
		default_deconstruction_screwdriver(user, icon_state, icon_state, I)
	return TRUE

/obj/machinery/power/rad_collector/crowbar_act(mob/living/user, obj/item/I)
	if(loaded_tank)
		if(locked)
			to_chat(user, "<span class='warning'>The controls are locked!</span>")
			return TRUE
		eject()
		return TRUE
	if(default_deconstruction_crowbar(I))
		return TRUE
	to_chat(user, "<span class='warning'>There isn't a tank loaded!</span>")
	return TRUE

/obj/machinery/power/rad_collector/multitool_act(mob/living/user, obj/item/I)
	if(!is_station_level(z) && !SSresearch.science_tech)
		to_chat(user, "<span class='warning'>[src] isn't linked to a research system!</span>")
		return TRUE
	if(locked)
		to_chat(user, "<span class='warning'>[src] is locked!</span>")
		return TRUE
	if(active)
		to_chat(user, "<span class='warning'>[src] is currently active, producing [bitcoinmining ? "research points":"power"].</span>")
		return TRUE
	bitcoinmining = !bitcoinmining
	to_chat(user, "<span class='warning'>You [bitcoinmining ? "enable":"disable"] the research point production feature of [src].</span>")
	return TRUE

/obj/machinery/power/rad_collector/analyzer_act(mob/living/user, obj/item/I)
	if(loaded_tank)
		loaded_tank.analyzer_act(user, I)
	return TRUE

/obj/machinery/power/rad_collector/return_analyzable_air()
	if(loaded_tank)
		return loaded_tank.return_analyzable_air()
	else
		return null

/obj/machinery/power/rad_collector/examine(mob/user)
	. = ..()
	if(active)
		if(!bitcoinmining)
			. += "<span class='notice'>[src]'s display states that it has stored <b>[DisplayEnergy(stored_power)]</b>, and is processing <b>[DisplayPower((RAD_COLLECTOR_OUTPUT)*((1 SECONDS)/SSmachines.wait))]</b>. <br>The <b>plasma</b> within it's tank is being irradiated into <b>tritium</b>.</span>"
		else
			. += "<span class='notice'>[src]'s display states that it's producing a total of <b>[(last_push*RAD_COLLECTOR_MINING_CONVERSION_RATE)*((60 SECONDS)/SSmachines.wait)]</b> research points per minute. <br>The <b>tritium</b> and <b>oxygen</b> within it's tank is being combusted into <b>carbon dioxide</b>.</span>"
	else
		if(!bitcoinmining)
			. += "<span class='notice'><b>[src]'s display displays the words:</b> \"Power production mode. Please insert <b>Plasma</b>. Use a multitool to change production modes.\"</span>"
		else
			. += "<span class='notice'><b>[src]'s display displays the words:</b> \"Research point production mode. Please insert <b>Tritium</b> and <b>Oxygen</b>. Use a multitool to change production modes.\"</span>"

/obj/machinery/power/rad_collector/obj_break(damage_flag)
	if(!(machine_stat & BROKEN) && !(flags_1 & NODECONSTRUCT_1))
		eject()
		machine_stat |= BROKEN

/obj/machinery/power/rad_collector/proc/eject()
	locked = FALSE
	var/obj/item/tank/internals/plasma/Z = src.loaded_tank
	if (!Z)
		return
	Z.forceMove(drop_location())
	Z.layer = initial(Z.layer)
	Z.plane = initial(Z.plane)
	src.loaded_tank = null
	if(active)
		toggle_power()
	else
		update_icon()

/obj/machinery/power/rad_collector/rad_act(pulse_strength)
	. = ..()
	if(loaded_tank && active && pulse_strength > RAD_COLLECTOR_EFFICIENCY)
		stored_power += (pulse_strength-RAD_COLLECTOR_EFFICIENCY)*RAD_COLLECTOR_COEFFICIENT

/obj/machinery/power/rad_collector/update_overlays()
	. = ..()
	if(loaded_tank)
		. += "ptank"
	if(machine_stat & (NOPOWER|BROKEN))
		return
	if(active)
		. += "on"


/obj/machinery/power/rad_collector/proc/toggle_power()
	active = !active
	if(active)
		icon_state = "ca_on"
		flick("ca_active", src)
	else
		icon_state = "ca"
		flick("ca_deactive", src)
	update_icon()
	return

#undef RAD_COLLECTOR_EFFICIENCY
#undef RAD_COLLECTOR_COEFFICIENT
#undef RAD_COLLECTOR_STORED_OUT
#undef RAD_COLLECTOR_MINING_CONVERSION_RATE
#undef RAD_COLLECTOR_OUTPUT
