/**
 * Проверяет, захвачена ли цель. Если да, то возвращает latexOrgan
 */
/proc/get_latexOrgan_if_captured_by_LL(mob/living/carbon/owner)
	var/obj/item/organ/latexOrgan/organ = locate(/obj/item/organ/latexOrgan) in owner
	if(!organ)
		to_chat(owner, DEFAULT_ABILITY_ERROR_MESSAGE)
		return FALSE
	return organ

/**
 * Поиск антаг датума Living Latex среди всех остальных. Возвращает сам датум, если его нет, то False
 * На вход подавать того, в ком искать.
 */
/proc/check_LL_antagDatum(mob/living/owner)
	var/datum/antagonist/living_latex/antag_datum = owner.mind ? locate(/datum/antagonist/living_latex) in owner.mind.antag_datums : FALSE
	return antag_datum
/**
 * Проверка на наличие прогрессбара не даёт спамить длительными процессами. Возвращает TRUE если прогрессбар есть.
 */
/proc/protect_from_spam(mob/living/owner)
	if(owner.progressbars)
		to_chat(owner, span_danger("В данный момент вы уже пытаетесь поглотить кого-то"))
		return TRUE
	else
		return FALSE
/**
 * Возвращает TRUE или FALSE в зависимости от того, кто контролирует текущее тело хоста
 * Зависит от переменной внутри датума living_latex под названием current_controller
 * Если она пуста, или содержит BODY_OWNER, то proc вернёт FALSE
 */
/proc/is_venom_controlling(datum/antagonist/living_latex/LL)
    return LL?.current_controller == VENOM_USER

/**
 * Меняет расу хоста при смене контроля. Определяет само кого и куда.
 */
/proc/swap_LL_species(datum/antagonist/living_latex/LL, mob/living/LL_mob)
	if(iscarbon(LL_mob.loc)) //Игрок LL на втором плане, захватывает тельце хоста
		var/mob/living/carbon/body = LL_mob.loc
		LL.old_host_spec = body.dna.species
		var/datum/species/new_species = LL.self_species
		new_species.copy_properties_from(body.dna.species)
		body.set_species(new_species)
	else //Игрок на LL возвращает контроль владельцу тела над телом(Локация LL = турф, а значит он за "рулём")
		LL_mob.set_species(LL.old_host_spec) // Возвращаем как было(в будущем опционально)
/**
 * Меняет backseat и тело host-а местами, вне зависимости от того, кто и где сидит.
 * Определение идёт на уровне сравнения LL_body с аргументом host_body. Если они равны, то становится понятно,
 * что игрок LL находится в теле host-а.
 */
/proc/easy_latexmob_minds_swap(datum/mind/LL_mind, datum/mind/host_mind, mob/living/host_body, datum/antagonist/living_latex/LL)
	var/mob/living/LL_body = LL_mind.current
	if(!host_mind)
		LL_mind.transfer_to(host_body)
		return
	if(LL_body == host_body)
		var/obj/item/organ/latexOrgan/organ = get_latexOrgan_if_captured_by_LL(host_body)
		var/mob/living/simple_animal/latexmob/venom/backseat  = organ.ObserverBackseat
		var/datum/mind/captured_host_mind = backseat.mind
		LL_mind.transfer_to(backseat)
		captured_host_mind.transfer_to(LL_body)
		LL.current_controller = BODY_OWNER
	else
		host_mind.transfer_to(host_body)
		LL_mind.transfer_to(LL_body)
		LL.current_controller = VENOM_USER

/**
 * Функция формата тумблер туда-обратно, завязанная на mind-ах.
 * Сработает один раз - махнёт один майнд в тело, а тот, что был на его месте - на backseat
 * Сработает второй раз, то вернёт обратно.
 * Если у цели нет mind-а(мартышки и прочие неразумные), то без лишних проверок позволяет захватить контроль
 */
/proc/swap_minds(datum/antagonist/living_latex/LL, mob/living/ability_owner, mob/living/simple_animal/latexmob/venom/backseat)
	if(!ability_owner || !backseat || !LL)
		return null
	var/mob/living/body = is_venom_controlling(LL) ? ability_owner : ability_owner.loc //Кто контролирует тело? Латекс? Нет? Ну тогда руль явно у body owner
	easy_latexmob_minds_swap(ability_owner.mind, body.mind, body, LL)
	LL.grant_abilities(ability_owner)
