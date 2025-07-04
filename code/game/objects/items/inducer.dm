/obj/item/inducer
	name = "Engineer inducer"
	desc = "A tool for inductively charging internal power cells."
	icon = 'icons/obj/tools.dmi'
	icon_state = "inducer-engi"
	item_state = "inducer-engi"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	force = 7
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	item_flags = SURGICAL_TOOL
	var/powertransfer = 1000
	var/opened = FALSE
	var/cell_type = /obj/item/stock_parts/cell/high
	var/obj/item/stock_parts/cell/cell
	var/recharging = FALSE
	var/gun_charger = FALSE

/obj/item/inducer/Initialize(mapload)
	. = ..()
	if(!cell && cell_type)
		cell = new cell_type

/obj/item/inducer/proc/induce(obj/item/stock_parts/cell/target, coefficient)
	var/totransfer = min(cell.charge,(powertransfer * coefficient))
	var/transferred = target.give(totransfer)
	cell.use(transferred)
	cell.update_icon()
	target.update_icon()

/obj/item/inducer/get_cell()
	return cell

/obj/item/inducer/emp_act(severity)
	. = ..()
	if(cell && !(. & EMP_PROTECT_CONTENTS))
		cell.emp_act(severity)

/obj/item/inducer/attack_obj(obj/O, mob/living/carbon/user)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(cantbeused(user))
		return

	if(recharge(O, user))
		return

	return ..()

/obj/item/inducer/proc/cantbeused(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to use [src]!</span>")
		return TRUE

	if(!cell)
		to_chat(user, "<span class='warning'>[src] doesn't have a power cell installed!</span>")
		return TRUE

	if(!cell.charge)
		to_chat(user, "<span class='warning'>[src]'s battery is dead!</span>")
		return TRUE
	return FALSE


/obj/item/inducer/attackby(obj/item/W, mob/user)
	if(W.tool_behaviour == TOOL_SCREWDRIVER)
		W.play_tool_sound(src)
		if(!opened)
			to_chat(user, "<span class='notice'>You unscrew the battery compartment.</span>")
			opened = TRUE
			update_icon()
			return
		else
			to_chat(user, "<span class='notice'>You close the battery compartment.</span>")
			opened = FALSE
			update_icon()
			return
	if(istype(W, /obj/item/stock_parts/cell))
		if(opened)
			if(!cell)
				if(!user.transferItemToLoc(W, src))
					return
				to_chat(user, "<span class='notice'>You insert [W] into [src].</span>")
				cell = W
				update_icon()
				return
			else
				to_chat(user, "<span class='notice'>[src] already has \a [cell] installed!</span>")
				return

	if(cantbeused(user))
		return

	if(recharge(W, user))
		return

	return ..()

/obj/item/inducer/proc/recharge(atom/movable/A, mob/user)
	if(!isturf(A) && user.loc == A)
		return FALSE
	if(recharging)
		return TRUE
	else
		recharging = TRUE
	var/obj/item/stock_parts/cell/C = A.get_cell()
	var/obj/O
	var/coefficient = 1
	if(istype(A, /obj/item/gun/energy) && gun_charger != TRUE)
		to_chat(user,"Error unable to interface with device")
		return FALSE
	if(istype(A, /obj))
		O = A
	if(C)
		var/done_any = FALSE
		if(C.charge >= C.maxcharge)
			to_chat(user, "<span class='notice'>[A] is fully charged!</span>")
			recharging = FALSE
			return TRUE
		user.visible_message("[user] starts recharging [A] with [src].","<span class='notice'>You start recharging [A] with [src].</span>")
		while(C.charge < C.maxcharge)
			if(do_after(user, 10, target = user) && cell.charge)
				done_any = TRUE
				induce(C, coefficient)
				do_sparks(1, FALSE, A)
				if(O)
					O.update_icon()
			else
				break
		if(done_any) // Only show a message if we succeeded at least once
			user.visible_message("[user] recharged [A]!","<span class='notice'>You recharged [A]!</span>")
		recharging = FALSE
		return TRUE
	recharging = FALSE


/obj/item/inducer/attack(mob/M, mob/user)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(cantbeused(user))
		return

	if(recharge(M, user))
		return
	return ..()


/obj/item/inducer/attack_self(mob/user)
	if(opened && cell)
		user.visible_message("[user] removes [cell] from [src]!","<span class='notice'>You remove [cell].</span>")
		cell.update_icon()
		user.put_in_hands(cell)
		cell = null
		update_icon()


/obj/item/inducer/examine(mob/living/M)
	. = ..()
	if(cell)
		. += "<span class='notice'>Its display shows: [DisplayEnergy(cell.charge)].</span>"
	else
		. += "<span class='notice'>Its display is dark.</span>"
	if(opened)
		. += "<span class='notice'>Its battery compartment is open.</span>"

/obj/item/inducer/update_overlays()
	. = ..()
	if(!opened)
		return
	if(!cell)
		. += "inducer-nobat"
	else
		. += "inducer-bat"

/obj/item/inducer/dry
	cell_type = null
	opened = TRUE

/obj/item/inducer/dry/Initialize(mapload) //Just in case
	. = ..()
	update_icon()

/obj/item/inducer/sci
	name = "Science inducer"
	icon_state = "inducer-sci"
	item_state = "inducer-sci"
	desc = "A tool for inductively charging internal power cells. This one has a science color scheme, and is less potent than its engineering counterpart."
	cell_type = null
	powertransfer = 500
	opened = TRUE

/obj/item/inducer/sci/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/inducer/sci/combat
	name = "Combat inducer"
	icon_state = "inducer-combat"
	item_state = "inducer-combat"
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	desc = "A tool for inductively charging internal power cells. This one has been modified and upgraded, but cost weight to be able to charge into guns as well as normal electronics."
	cell_type = /obj/item/stock_parts/cell/hyper
	powertransfer = 1300
	opened = FALSE
	gun_charger = TRUE

/obj/item/inducer/sci/combat/dry
	cell_type = null
	opened = TRUE

/obj/item/inducer/sci/combat/dry/Initialize(mapload) //Just in case
	. = ..()
	update_icon()

/obj/item/inducer/sci/combat/Initialize(mapload)
	. = ..()
	update_icon()

/obj/item/inducer/sci/supply
	opened = FALSE
	cell_type = /obj/item/stock_parts/cell/inducer_supply

/obj/item/inducer/syndicate
	name = "Syndicate inducer"
	icon_state = "inducer-syndi"
	item_state = "inducer-syndi"
	desc = "A tool for inductively charging internal power cells. This one has a suspicious colour scheme, and seems to be rigged to transfer charge at a much faster rate."
	powertransfer = 2000
	cell_type = /obj/item/stock_parts/cell/super

/obj/item/inducer/syndicate/dry
	cell_type = null
	opened = TRUE

/obj/item/inducer/syndicate/dry/Initialize(mapload)
	. = ..()
	update_icon()
