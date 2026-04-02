//Способности

/datum/action/cooldown/latexmob
	icon_icon = 'modular_bluemoon/horny_venom/icons/latex_abilities.dmi'
	button_icon = 'modular_bluemoon/horny_venom/icons/latex_abilities.dmi'
	background_icon_state = "background"
	var/stage_required
	var/delay
	var/datum/antagonist/living_latex/my_living_latex
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/Activate(atom/target)
	if(owner.mind)
		my_living_latex = check_LL_antagDatum(owner)
		delay = my_living_latex.mergingDelay
	else
		return FALSE

/datum/action/cooldown/latexmob/takeControl
	stage_required = 1
	button_icon_state = "Infiltrate"
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	. = ..()
	var/mob/living/body = is_venom_controlling(my_living_latex) ? owner : owner.loc
	var/obj/item/organ/latexOrgan/organ = get_latexOrgan_if_captured_by_LL(body)
	if(!organ)
		return
	var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
	swap_LL_species(my_living_latex, owner)
	if(!swap_minds(my_living_latex, owner, backseat))
		swap_LL_species(my_living_latex, owner)
		return FALSE
	return TRUE

/datum/action/cooldown/latexmob/venomAction
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."
	button_icon_state = "Infiltrate"
	stage_required = 1

/datum/action/cooldown/latexmob/venomAction/Activate()
    . = ..()
    if(protect_from_spam(owner))
        return DEFAULT_ABILITY_ERROR_MESSAGE(owner)

    if(islatexmob(owner) && !isbackseatmob(owner))
        var/mob/living/carbon/target_host = pick_merge_target(owner)
		if(checkplayerssd(target_host))
			return MERGING_SSD_ERROR(owner)
        if(target_host && can_merge_target(owner, target_host))
            handle_merging(target_host)
            enter_in_host(my_living_latex, owner, delay, target_host)
    else
        var/mob/living/simple_animal/latexmob/venom/user = owner
        if(ishuman(user.body))
            exit_from_host(user.body.loc, owner.mind, user.body, delay, my_living_latex)
        else
            return DEFAULT_ABILITY_ERROR_MESSAGE(owner)

/datum/action/cooldown/latexmob/ferral_form
	name = "Форма животного"
	desc = "Принять форму животного"
	stage_required = 1

/datum/action/cooldown/latexmob/ferral_form/Activate()
	. = ..()
	var/mob/living/simple_animal/latexmob/new_body
	if(istype(owner, /mob/living/simple_animal) && !istype(owner, /mob/living/simple_animal/latexmob/ferral))
		new_body = swap_LL_body_to_new_form(owner, /mob/living/simple_animal/latexmob/ferral, owner.loc)

	else if(istype(owner, /mob/living/simple_animal/latexmob/ferral))
		new_body = swap_LL_body_to_new_form(owner, /mob/living/simple_animal/latexmob, owner.loc)

	else
		return DEFAULT_ABILITY_ERROR_MESSAGE(owner)

	my_living_latex.grant_abilities(new_body)

/datum/action/cooldown/latexmob/medscan
	name = "Проверить здоровье"
	desc = "Позволяет вам понять состояние своего носителя и реагенты в его крови. С более высокой стадией вашего развития этот сканер станет лучше."
	button_icon_state = "medscan"
	stage_required = 1

/datum/action/cooldown/latexmob/medscan/Activate()
	. = ..()
	var/mob/living/carbon/host = owner.loc
	healthscan(owner, istype(host) ? host : owner)

/datum/action/cooldown/latexmob/heal
	name = "Лечение"
	desc = "Впрыскивает в кровь носителя реагенты на выбор, для лечения или иных нужд. Чем выше стадия - тем больше выбора реагентов."
	button_icon_state = "heal"
	stage_required = 2
	var/datum/inject_menu/inject_menu

/datum/action/cooldown/latexmob/heal/Grant(var/mob/user)
	. = ..()
	if(!my_living_latex)
		CRASH("inject menu cant locate living latex datum")
	inject_menu = new /datum/inject_menu(owner, my_living_latex)
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
        var/list/reag = list()
        var/datum/reagent/R = new type_of_reagent
        reag["name"] = R.name
        reagents += list(reag)
        qdel(R)

    data["subject"] = living_latex.owner.current
    data["reagents"] = reagents
    data["cooldown_remaining"] = max(0, (last_action_time + cooldown_duration - world.time) / 10)
    data["evolve_poins"] = living_latex.evolve_points
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
    inject_menu.ui_interact(owner)

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
	if(!istype(owner, /mob/living/simple_animal/latexmob))
		return LEAK_OUT_ERROR_MESSAGE(owner)
	var/list/nearby_things = range(1, get_turf(src))
	var/list/valid_doors = list()
	for(var/atom/thing in nearby_things)
		if(!istype(thing, /obj/machinery/door/airlock))
			continue
		valid_doors.Add(thing)
	if(valid_doors.len >= 1)
		var/choice = pick(valid_doors)
		if(do_after(usr, 1.5 SECONDS, usr))
			owner.forceMove(get_turf(choice))
	else
		return NO_AIRLOCK_NEABY(owner)

/datum/action/cooldown/latexmob/human_form
	name = "Сформировать самостоятельное человеческое тело"
	desc = "Вы накопили достаточно биоматериала, чтобы сформировать свое собственное отдельное тело"
	stage_required = 3

/datum/action/cooldown/latexmob/human_form/Activate()
	. = ..()
	return
