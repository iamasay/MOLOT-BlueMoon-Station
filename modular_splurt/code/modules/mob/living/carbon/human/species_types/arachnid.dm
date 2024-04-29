/datum/action/innate/spin_web
	var/web_cooldown = 200
	var/web_ready = TRUE
	var/spinner_rate = 25

/datum/action/innate/spin_cocoon
	var/web_cooldown = 200
	var/web_ready = TRUE
	var/spinner_rate = 25

/datum/action/innate/spin_web/Activate()
	var/mob/living/carbon/human/H = owner
	if(H.stat == "DEAD")
		return
	if(web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait a while to regenerate web fluid.</span>")
		return
	var/turf/T = get_turf(H)
	if(!T)
		to_chat(H, "<span class='warning'>There's no room to spin your web here!</span>")
		return
	var/obj/structure/spider/stickyweb/W = locate() in T
	var/obj/structure/spider/stickyweb/arachnid/W2 = locate() in T
	if(W || W2)
		to_chat(H, "<span class='warning'>There's already a web here!</span>")
		return
	// Should have some minimum amount of food before trying to activate
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition >= nutrition_threshold)
		to_chat(H, "<i>You begin spinning some web...</i>")
		if(!do_after(H, 10 SECONDS, T))
			to_chat(H, span_warning("Your web spinning was interrupted!"))
			return
		H.adjust_nutrition(-spinner_rate)
		addtimer(VARSET_CALLBACK(src, web_ready, TRUE), web_cooldown)
		to_chat(H, "<i>You use up a fair amount of energy weaving a web on the ground with your spinneret!</i>")
		new /obj/structure/spider/stickyweb/arachnid(T, owner)

	else
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return

/datum/action/innate/spin_cocoon/Activate()
	var/mob/living/carbon/human/H = owner
	if(H.stat == "DEAD")
		return
	if(web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
		return
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition >= nutrition_threshold)
		to_chat(H, "<span class='warning'>You pull out a strand from your spinneret, ready to wrap a target. (Press ALT+CLICK on the target to start wrapping.)</span>")
		H.adjust_nutrition(spinner_rate * -0.5)
		addtimer(VARSET_CALLBACK(src, web_ready, TRUE), web_cooldown)
		RegisterSignal(H, list(COMSIG_MOB_ALTCLICKON), PROC_REF(cocoonAtom))
		return
	else
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return

/datum/action/innate/spin_cocoon/cocoonAtom(mob/living/carbon/human/H, atom/movable/A)
	UnregisterSignal(H, list(COMSIG_MOB_ALTCLICKON))
	if (!H || !isarachnid(H))
		return COMSIG_MOB_CANCEL_CLICKON
	else
		if(web_ready == FALSE)
			to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
			return
		if(!H.Adjacent(A))	//No.
			return
		if(!isliving(A) && A.anchored)
			to_chat(H, "<span class='warning'>[A] is bolted to the floor!</span>")
			return
		if(istype(A, /obj/structure/spider/stickyweb/arachnid))
			to_chat(H, "<span class='warning'>No double wrapping.</span>")
			return
		if(istype(A, /obj/effect))
			to_chat(H, "<span class='warning'>You cannot wrap this.</span>")
			return
		if(isliving(A))
			var/mob/living/L = A
			if(L.key)
				to_chat(H, "<span class='warning'>You prepare to wrap [L] in a cocoon...</span>")
				var/response = alert(L, "Do you wish to be wrapped in a cocoon?", "Cocooning", "No", "Yes")
				if(response == "No")
					to_chat(H, "<span class='warning'>[L] resists your attempts to wrap [L.ru_na()]!</span>")
					return
		H.visible_message(span_danger("[H] starts to wrap [A] into a cocoon!"),span_warning("You start to wrap [A] into a cocoon."))
		if(!do_after(H, 10 SECONDS, A))
			to_chat(H, span_warning("Your web spinning was interrupted!"))
			return
		H.adjust_nutrition(spinner_rate * -3)
		var/obj/structure/spider/stickyweb/arachnid/cocoon/C = new(A.loc)
		if(isliving(A))
			C.icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a large cocoon!</span>")
			return
		else
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a cocoon!</span>")
			return
