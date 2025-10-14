//Способности

/datum/action/cooldown/latexmob
	//var/mob/living/simple_animal/latexmob/target = src.owner
	icon_icon = 'modular_bluemoon/iamasay/horny_venom/icons/latex_abilities.dmi'
	button_icon = 'modular_bluemoon/iamasay/horny_venom/icons/latex_abilities.dmi'
	background_icon_state = "background"
	var/stage_required
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/takeControl
	stage_required = 1
	button_icon_state = "Infiltrate"
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	var/datum/antagonist/living_latex/venom = locate(/datum/antagonist/living_latex) in owner.mind.antag_datums
	var/datum/species/old_species
	if(venom.current_controller == "OWNER" || !venom.current_controller)
		var/mob/living/carbon/body = owner.loc
		owner.mind.transfer_to(body)
		venom.current_controller = "VENOM"
		var/datum/antagonist/living_latex/latex =locate(/datum/antagonist/living_latex) in body.mind.antag_datums
		old_species = body.dna.species
		var/datum/species/jelly/roundstartslime/living_latex/new_species = new
		new_species.copy_properties_from(old_species)
		venom.old_host_spec = old_species
		body.set_species(new_species)
		latex.grant_abilities(body)
	else
		var/obj/item/organ/latexOrgan/organ = locate(/obj/item/organ/latexOrgan)
		var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
		if(backseat)
			owner.mind.transfer_to(backseat)
			venom.current_controller = "OWNER"
			var/datum/antagonist/living_latex/latex2 = locate(/datum/antagonist/living_latex) in backseat.mind.antag_datums
			latex2.grant_abilities(backseat)

/datum/action/cooldown/latexmob/venomAction
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."
	button_icon_state = "Infiltrate"
	stage_required = 1

/datum/action/cooldown/latexmob/venomAction/Activate()
	var/mob/living/carbon/host = owner.loc
	if(!istype(host, /mob/living/carbon))
		var/list/choices = list()
		for(var/mob/living/carbon/C in oview(1,owner))
			choices += C
			to_chat(owner, "[C]")
		var/choice = show_radial_menu(owner, owner, choices = choices)
		if(choice)
			var/datum/antagonist/living_latex/L = locate (/datum/antagonist/living_latex) in owner.mind.antag_datums
		//	do_after(owner, 3 SECONDS)
			L.merging(choice)
			return
	else
		var/turf/targetTurf = host.loc
		var/datum/antagonist/living_latex/living_latex = locate (/datum/antagonist/living_latex) in owner.mind.antag_datums
		var/datum/species/old_species = living_latex.old_host_spec
		host.set_species(old_species)
		new /obj/effect/temp_visual/latexmob/venom_out(targetTurf)
		new /mob/living/simple_animal/latexmob(targetTurf)
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = locate(/obj/item/organ/latexOrgan) in host.internal_organs
		if(OrganToRemove)
			OrganToRemove.Remove()
		for(var/mob/living/simple_animal/latexmob/MobForTransfer in oview(1,host))
			owner.mind.transfer_to(MobForTransfer)
			living_latex.grant_abilities(MobForTransfer)
			return

/datum/action/cooldown/latexmob/ferral_form
	name = "Форма животного"
	desc = "Принять форму животного"
	stage_required = 1

/datum/action/cooldown/latexmob/ferral_form/Activate()
	. = ..()
	if(istype(owner, /mob/living/simple_animal/latexmob) || !istype(owner, /mob/living/simple_animal/latexmob/ferral))
		var/mob/old_body = owner
		var/turf/targetTurf = owner.loc
		var/mob/living/simple_animal/latexmob/ferral/mob
		targetTurf += new mob
		owner.transfer_ckey(mob)
		qdel(old_body)

	if(istype(owner, /mob/living/simple_animal/latexmob/ferral))
		var/mob/old_body = owner
		var/turf/targetTurf = owner.loc
		var/mob/living/simple_animal/latexmob/mob
		targetTurf += new mob
		owner.transfer_ckey(mob)
		qdel(old_body)

	else
		to_chat(owner, "<span class='warning'>Вы не можете использовать способность из текущего положения</span>")
		return

/datum/action/cooldown/latexmob/medscan
	name = "Проверить здоровье"
	desc = "Позволяет вам понять состояние своего носителя и реагенты в его крови. С более высокой стадией вашего развития этот сканер станет лучше."
	button_icon_state = "medscan"
	stage_required = 1

/datum/action/cooldown/latexmob/medscan/Activate()
	. = ..()
	if(istype(owner.loc, /mob/living/carbon))
		healthscan(owner, owner.loc)
	else
		healthscan(owner, owner)

/datum/action/cooldown/latexmob/heal
	name = "Лечение"
	desc = "Впрыскивает в кровь носителя реагенты на выбор, для лечения или иных нужд. Чем выше стадия - тем больше выбора реагентов."
	button_icon_state = "heal"
	stage_required = 2

/datum/action/cooldown/latexmob/heal/Activate()
	. = ..()
	return

/datum/action/cooldown/latexmob/stasis
	name = "Стазис"
	desc = "Позволяет спрятаться на время от сканеров и какого-либо обнаружения вне тела хозяина. Полностью отключает все ваши способности на время."
	button_icon_state = "Stasis"
	stage_required = 2

/datum/action/cooldown/latexmob/stasis/Activate()
	. = ..()
	return

/datum/action/cooldown/latexmob/leak_out
	name = "Проползти под чем-либо"
	desc = "Позволяет вашему гибкому телу проползать под шлюзами и прочими преградами, вроде столов и стеклянных дверей."
	button_icon_state = "leak_out"
	stage_required = 3

/datum/action/cooldown/latexmob/leak_out/Activate()
	. = ..()
	return
/datum/action/cooldown/latexmob/human_form
	name = "Сформировать самостоятельное человеческое тело"
	desc = "Вы накопили достаточно биоматериала, чтобы сформировать свое собственное отдельное тело"
	stage_required = 3
/datum/action/cooldown/latexmob/human_form/Activate()
	. = ..()
	return
