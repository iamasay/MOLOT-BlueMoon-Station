//Способности

/datum/action/cooldown/latexmob
	icon_icon = 'modular_bluemoon/horny_venom/icons/latex_abilities.dmi'
	button_icon = 'modular_bluemoon/horny_venom/icons/latex_abilities.dmi'
	background_icon_state = "background"
	var/stage_required
	var/datum/antagonist/living_latex/my_living_latex
	name = "generic latexmob proc"
	desc = "Вы не должны это видеть в игре. Это базовый прок холдер, он содержит базовые свойства."

/datum/action/cooldown/latexmob/Activate(atom/target)
	if(owner.mind)
		my_living_latex = check_LL_antagDatum(owner)
	else
		return

/datum/action/cooldown/latexmob/takeControl
	stage_required = 1
	button_icon_state = "Infiltrate"
	name = "Захватить контроль над телом"
	desc = "Возьмите тело под свой контроль и управляйте им как своим"

/datum/action/cooldown/latexmob/takeControl/Activate()
	. = ..()
	var/obj/item/organ/latexOrgan/organ = get_latexOrgan_if_captured_by_LL(owner)
	if(!organ)
		return
	var/mob/living/simple_animal/latexmob/venom/backseat = organ.ObserverBackseat
	swap_LL_species(my_living_latex, owner)
	swap_minds(my_living_latex, owner, backseat)

/datum/action/cooldown/latexmob/venomAction
	name = "Поглотить/освободить"
	desc = "Станьте одним целым с кем-то."
	button_icon_state = "Infiltrate"
	stage_required = 1

/datum/action/cooldown/latexmob/venomAction/Activate()//TODO: произвести рефактор, убрать дублирование кода, засунуть сложные конструкции в отдельные proc для читаемости
	. = ..()
	if(protect_from_spam(owner)) return
	var/delay = my_living_latex.mergingDelay
	if(iscarbon(owner))
		to_chat(owner, "Вы не можете использовать эту способность из текущего состояния!")
		return
	var/mob/living/carbon/host = owner.loc
	if(!iscarbon(host))
		var/list/choices = list()
		var/list/choices_img = list()
		for(var/mob/living/carbon/C in oview(1,owner))
			choices += C
		for(var/mob/living/carbon/C in oview(1,owner))
			var/image/choice_image = image(icon = C.icon, icon_state = C.icon_state)
			choice_image.overlays = C.overlays
			choices_img[C.name] = choice_image
		var/choice = show_radial_menu(owner, owner, choices_img)
		if(choice)
			var/mob/living/carbon/true_choice = choices[choices_img.Find(choice)] //Списки choice и choices_img хранят объекты в одинаковом порядке, поэтому я беру индекс конкретного выбора и обращаюсь по этому индексу к списку, где реально хранится ссылка на хумана, а не на его картинку. Ибо если засунуть объект хумана в выбор, то мы не увидим его визуального изображения в радиальном меню
			if(get_dist(true_choice, owner) > 1)
				to_chat(owner, span_warning("Вы слишком далеко"))
				return
			if(ishuman(true_choice))
				var/mob/living/carbon/human/target = true_choice
				if(istype(target.wear_suit, /obj/item/clothing/suit/space))
					to_chat(owner, span_warning("Цель одета в скафандр, некуда пролезть!"))
					return
			if(do_after(owner, delay, owner))
				to_chat(choice, span_boldwarning("Что-то склизкое и темное обхватывает вас с ног, начиная ползти вверх по вашему телу, пробирай до дрожи!"))
				true_choice.Stun(4 SECONDS) //При условии, что минимальная задержка у паразита в пять секунд, а максимальная в десять, у жертвы есть все шансы выбраться.
				true_choice.drop_all_held_items()
				true_choice.stuttering += rand(5, 10)
				my_living_latex.merging(true_choice) //Тут возможен баг. Если цель на момент начала do_after была без скафандра, но успела каким-то образом его надеть уже после начала прогрессбара, то он всё равно завершится удачей, игнорируя скаф. В будущем надо будет заменить проверку на универсальный proc для уменьшения дублирования кода и распихать его в нужных местах.
				return
	if(!iscarbon(owner))
		if(!iscarbon(host))
			return
		var/turf/targetTurf = host.loc
		var/datum/species/old_species = my_living_latex.old_host_spec
		host.set_species(old_species)
		new /obj/effect/temp_visual/latexmob/venom_out(targetTurf)
		new /mob/living/simple_animal/latexmob(targetTurf)
		var/obj/item/organ/latexOrgan/OrganToRemove
		OrganToRemove = get_latexOrgan_if_captured_by_LL(owner)
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
		ferral.name = old_body.name
		qdel(old_body)
		return

	if(istype(owner, /mob/living/simple_animal/latexmob/ferral))
		var/mob/old_body = owner
		var/turf/targetTurf = owner.loc
		var/mob/living/simple_animal/latexmob/mob = new /mob/living/simple_animal/latexmob(targetTurf)
		owner.mind.transfer_to(mob)
		my_living_latex.grant_abilities(mob)
		mob.name = old_body.name
		qdel(old_body)
	else
		to_chat(owner, DEFAULT_ABILITY_ERROR_MESSAGE)
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
	var/datum/antagonist/living_latex/my_living_latex = check_LL_antagDatum(owner)
	inject_menu = new /datum/inject_menu(owner, my_living_latex)
	if(!my_living_latex || my_living_latex == null)
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
	if(!istype(owner, /mob/living/simple_animal/latexmob))
		to_chat(owner, LEAK_OUT_ERROR_MESSAGE)
		return
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
		to_chat(owner, "<span class='warning'>Шлюзы по-близости не найдены.</span>")

/datum/action/cooldown/latexmob/human_form
	name = "Сформировать самостоятельное человеческое тело"
	desc = "Вы накопили достаточно биоматериала, чтобы сформировать свое собственное отдельное тело"
	stage_required = 3

/datum/action/cooldown/latexmob/human_form/Activate()
	. = ..()
	return
