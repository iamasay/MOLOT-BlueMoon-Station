//Способности

/datum/action/cooldown/latexmob
	//var/mob/living/simple_animal/latexmob/target = src.owner
	icon_icon = 'modular_bluemoon/iamasay/horny_venom/icons/latex_abilities.dmi'
	button_icon = 'modular_bluemoon/iamasay/horny_venom/icons/latex_abilities.dmi'
	background_icon_state = "background"
	var/stage_required
	var/datum/antagonist/living_latex/my_living_latex
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/Activate(atom/target)
	if(owner.mind)
		my_living_latex = locate(/datum/antagonist/living_latex) in owner.mind.antag_datums
	else
		return

/datum/action/cooldown/latexmob/takeControl
	stage_required = 1
	button_icon_state = "Infiltrate"
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	. = ..()
	var/datum/species/old_species
	if(my_living_latex.current_controller == "OWNER" || !my_living_latex.current_controller)
		var/mob/living/carbon/body = owner.loc
		if(istype(body, /mob/living))
			owner.mind.transfer_to(body)
		else
			to_chat(owner, span_notice("Вы не можете использовать эту способность сейчас!"))
			return
		my_living_latex.current_controller = "VENOM"
		var/datum/antagonist/living_latex/latex =locate(/datum/antagonist/living_latex) in body.mind.antag_datums
		old_species = body.dna.species
		var/datum/species/jelly/roundstartslime/living_latex/new_species = new
		new_species.copy_properties_from(old_species)
		my_living_latex.old_host_spec = old_species
		body.set_species(new_species)
		latex.grant_abilities(body)
	else
		var/obj/item/organ/latexOrgan/organ = locate(/obj/item/organ/latexOrgan)
		var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
		if(backseat)
			owner.mind.transfer_to(backseat)
			my_living_latex.current_controller = "OWNER"
			my_living_latex.grant_abilities(backseat)

/datum/action/cooldown/latexmob/venomAction
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."
	button_icon_state = "Infiltrate"
	stage_required = 1

/datum/action/cooldown/latexmob/venomAction/Activate()
	. = ..()
	var/mob/living/carbon/host = owner.loc
	if(!istype(host, /mob/living/carbon))
		var/list/choices = list()
		for(var/mob/living/carbon/C in oview(1,owner))
			choices += C
			to_chat(owner, "[C]")
		var/choice = show_radial_menu(owner, owner, choices = choices)
		if(choice)
		//	do_after(owner, 3 SECONDS)
			my_living_latex.merging(choice)
			return
	else
		var/turf/targetTurf = host.loc
		var/datum/species/old_species = my_living_latex.old_host_spec
		host.set_species(old_species)
		new /obj/effect/temp_visual/latexmob/venom_out(targetTurf)
		new /mob/living/simple_animal/latexmob(targetTurf)
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = locate(/obj/item/organ/latexOrgan) in host.internal_organs
		if(OrganToRemove)
			OrganToRemove.Remove()
		for(var/mob/living/simple_animal/latexmob/MobForTransfer in oview(1,host))
			owner.mind.transfer_to(MobForTransfer)
			my_living_latex.grant_abilities(MobForTransfer)
			return

/datum/action/cooldown/latexmob/ferral_form
	name = "Форма животного"
	desc = "Принять форму животного"
	stage_required = 1

/datum/action/cooldown/latexmob/ferral_form/Activate()
	. = ..()
	if(istype(owner, /mob/living/simple_animal) && !istype(owner, /mob/living/simple_animal/latexmob/ferral))
		var/mob/old_body = owner
		var/turf/targetTurf = owner.loc
		var/mob/living/simple_animal/latexmob/ferral/ferral = new /mob/living/simple_animal/latexmob/ferral(targetTurf)
		owner.mind.transfer_to(ferral)
		ferral.color = null //иначе будет красить в черный цвет
		my_living_latex.grant_abilities(ferral)
		qdel(old_body)
		return

	if(istype(owner, /mob/living/simple_animal/latexmob/ferral))
		var/mob/old_body = owner
		var/turf/targetTurf = owner.loc
		var/mob/living/simple_animal/latexmob/mob = new /mob/living/simple_animal/latexmob(targetTurf)
		owner.mind.transfer_to(mob)
		my_living_latex.grant_abilities(mob)
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
	var/datum/inject_menu/inject_menu

/datum/action/cooldown/latexmob/heal/Grant(var/mob/user)
	. = ..()
	inject_menu = new /datum/inject_menu(owner, my_living_latex)
	if(!my_living_latex)
		CRASH("inject menu cant locate living latex datum")
	if(!inject_menu)
		CRASH("inject_menu action created with non menu")

/datum/inject_menu
	var/name = "Injecting menu"
	var/data
	var/datum/antagonist/living_latex/living_latex
	var/datum/owner
	var/last_action_time = 0
	var/cooldown_duration = 50 // 5 секунд

/datum/inject_menu/New(my_owner, my_living_latex)
	living_latex = my_living_latex
	owner = my_owner

/datum/inject_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/inject_menu/ui_data(mob/user)
	var/list/data = list()
	var/list/reagents = list()
	for(var/type_of_reagent in living_latex.avaible_reagents)
		var/list/Reag = list()
		var/datum/reagent/R = new type_of_reagent
		Reag["name"] = R.name

		reagents += list(Reag)
		data["subject"] = living_latex.owner.current
		data["reagents"] = reagents
		data["cooldown_remaining"] = max(0, (last_action_time + cooldown_duration - world.time) / 10)
		data["evolve_poins"] = living_latex.evolve_points
		qdel(R)
	return data

/datum/inject_menu/ui_act(action, params)
	if(..())
		return

	if(world.time < last_action_time + cooldown_duration)
		to_chat(owner, "Подождите [round((last_action_time + cooldown_duration - world.time) / 10)] секунд перед следующей инъекцией.")
		return

	if(action == "inject")
		var/reagent_name = params["reagent_name"]
		living_latex.inject_reagent(reagent_name)
		last_action_time = world.time

/datum/inject_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "InjectMenu", name)
		ui.open()

/datum/action/cooldown/latexmob/heal/Activate()
	inject_menu.ui_interact(usr)

/datum/action/cooldown/latexmob/stasis
	name = "Стазис"
	desc = "Позволяет спрятаться на время от сканеров и какого-либо обнаружения вне тела хозяина. Полностью отключает все ваши способности на время."
	button_icon_state = "Stasis"
	stage_required = 2

/datum/action/cooldown/latexmob/stasis/Activate()
	. = ..()
	return

/datum/action/cooldown/latexmob/leak_out
	name = "Проползти под шлюзом"
	desc = "Позволяет вашему гибкому телу проползать под шлюзами."
	button_icon_state = "leak_out"
	stage_required = 3

/datum/action/cooldown/latexmob/leak_out/Activate()
	. = ..()
	var/list/nearby_things = range(1, get_turf(src))
	var/list/valid_doors = list()
	for(var/atom/thing in nearby_things)
		if(!istype(thing, /obj/machinery/door/airlock))
			continue
		valid_doors.Add(thing)
	if(valid_doors.len > 1)
		var/choice = pick(valid_doors)
		owner.forceMove(get_turf(choice))
	else if(valid_doors)
		do_after(usr, 1.5 SECONDS, usr)
		owner.forceMove(get_turf(valid_doors[1]))
	else
		to_chat(owner, "Шлюзы по-близости не найдены")

/datum/action/cooldown/latexmob/human_form
	name = "Сформировать самостоятельное человеческое тело"
	desc = "Вы накопили достаточно биоматериала, чтобы сформировать свое собственное отдельное тело"
	stage_required = 3
/datum/action/cooldown/latexmob/human_form/Activate()
	. = ..()
	return
