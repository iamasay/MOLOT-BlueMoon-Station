//Способности
/datum/action/cooldown/latexmob
	//var/mob/living/simple_animal/latexmob/target = src.owner
	var/stage_required
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/venomAction
	stage_required = 1
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."

/datum/action/cooldown/latexmob/venomAction/Activate()
	var/mob/living/carbon/host = owner.loc
	if(!istype(host, /mob/living/carbon))
		var/list/choices = list()
		for(var/mob/living/carbon/C in oview(1,owner))
			choices += C
			to_chat(owner, "[C]")
		var/choice = show_radial_menu(owner, owner, choices = choices)
		if(choice)
			var/datum/antagonist/living_latex/L = owner.mind.antag_datums
		//	do_after(owner, 3 SECONDS)
			L.merging(choice)
			return
	else
		var/turf/targetTurf = host.loc
		var/datum/antagonist/living_latex/living_latex = owner.mind.antag_datums
		var/datum/species/old_species = living_latex.old_host_spec
		host.set_species(old_species)
		new /obj/effect/temp_visual/latexmob/venom_out(targetTurf)
		targetTurf.contents += new /mob/living/simple_animal/latexmob
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = locate(/obj/item/organ/latexOrgan)
		if(OrganToRemove)
			OrganToRemove.Remove()
		for(var/mob/living/simple_animal/latexmob/MobForTransfer in oview(1,host))
			owner.transfer_ckey(MobForTransfer)
			return

/datum/action/cooldown/latexmob/takeControl
	//if(istype(target.loc, /mob/living/carbon))
	stage_required = 1
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	var/datum/antagonist/living_latex/venom = owner.mind.antag_datums
	var/datum/species/old_species
	if(venom.current_controller == "OWNER" || !venom.current_controller)
		var/mob/living/carbon/body = owner.loc
		if(!body.ckey)
			body.mind = owner.mind
			body.ckey = owner.ckey
			venom.current_controller = "VENOM"
			var/datum/antagonist/living_latex/latex = body.mind.antag_datums
			
			old_species= body.dna.species
			var/datum/species/jelly/roundstartslime/living_latex/new_species = new
			new_species.copy_properties_from(old_species)
			venom.old_host_spec = old_species
			body.set_species(new_species)
			latex.grant_abilities(body)
		else
			var/datum/mind/CurrentObserverMind = owner.mind

			body.mind = owner.mind
			owner.mind = CurrentObserverMind

			var/BodyOwnerKey = body.ckey

			body.ckey = owner.ckey
			owner.ckey = BodyOwnerKey

			venom.current_controller = "VENOM"
			old_species = body.dna.species
			var/datum/species/jelly/roundstartslime/living_latex/new_species = new
			var/datum/antagonist/living_latex/latex = body.mind.antag_datums	
			new_species.copy_properties_from(old_species)
			venom.old_host_spec = old_species
			body.set_species(new_species)
			latex.grant_abilities(body)
	else
		var/obj/item/organ/latexOrgan/organ = locate(/obj/item/organ/latexOrgan)
		var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
		var/datum/mind/ObserverMind = backseat.mind
		if(backseat)
			owner.mind = ObserverMind
			backseat.mind = owner.mind

			var/ObserverKey = backseat.ckey
			var/BodyOwnerKey = owner.ckey

			backseat.ckey = BodyOwnerKey
			owner.ckey = ObserverKey

			venom.current_controller = "OWNER"
			var/datum/antagonist/living_latex/latex2 = backseat.mind.antag_datums
			latex2.grant_abilities(backseat)

/datum/antagonist/living_latex/proc/merging(mob/living/carbon/T)
	var/mob/living/old_body = usr
	var/obj/item/organ/latexOrgan/O = new /obj/item/organ/latexOrgan
	new /obj/effect/temp_visual/latexmob/venom_in(T.loc)
	O.Insert(T)
	O.ObserverBackseat = new /mob/living/simple_animal/latexmob/venom
	O.ObserverBackseat.loc = T
	usr.transfer_ckey(O.ObserverBackseat)
	qdel(old_body)