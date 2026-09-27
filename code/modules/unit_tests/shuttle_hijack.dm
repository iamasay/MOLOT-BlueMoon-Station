// Хиджак аварийного шаттла: консоль снимает ровно столько навигационных стадий, сколько за
// одну попытку вскрывает антагонист, и никогда не перескакивает за HIJACKED.
//
// Стадий всего HIJACKED (5), и исторически каждая попытка снимала ровно одну: боевой одиночка
// возвращался к консоли пять раз. Защитнику диска, которому ещё и караулить сам диск, это
// слишком долго, поэтому одна его попытка закрывает три стадии - ровно две попытки до захвата.
// Статус при этом обязан прижиматься к HIJACKED: announce_hijack_stage() выбирает ветку по
// точному значению стадии, и значение выше HIJACKED не имеет ни ветки, ни сообщения.

// Стадии хиджака объявлены #define в code/modules/shuttle/emergency.dm, но в конце того же
// файла они #undef'ятся, а юнит-тесты включаются позже - поэтому константы дублируются здесь.
#define HIJACK_TEST_NOT_BEGUN 0
#define HIJACK_TEST_STAGE_3 3
#define HIJACK_TEST_HIJACKED 5

/// Защитник диска вскрывает навигационные протоколы за две попытки и не уводит статус за HIJACKED.
/datum/unit_test/shuttle_hijack_keeper_two_attempts/Run()
	if(!SSshuttle.emergency)
		return // без шаттла проверять нечего
	// Мутируем живое состояние шаттла - возвращаем даже при упавшем ассерте (Fail бросает исключение).
	var/saved_status = SSshuttle.emergency.hijack_status
	var/saved_mode = SSshuttle.emergency.mode
	var/saved_timer = SSshuttle.emergency.timer
	var/obj/machinery/computer/emergency_shuttle/console = allocate(/obj/machinery/computer/emergency_shuttle)
	// Настоящий антагонист выдаётся разуму штатным add_antag_datum, а не напихивается в
	// antag_datums руками: тест обязан ловить и поломку в /datum/antagonist, и в агрегаторе
	// разума, иначе фикстурой прикроет ровно тот код, который меняем.
	var/mob/living/carbon/human/keeper = allocate(/mob/living/carbon/human)
	keeper.mind_initialize()
	var/datum/antagonist/nukeop/lone/syndicate/keeper_antag = new
	// Одиночкам спавнпоинт не полагается (send_to_spawnpoint = FALSE в /lone), а
	// move_to_spawnpoint делит на длину списка ландмарок, которых в тестовой сцене нет.
	keeper_antag.send_to_spawnpoint = FALSE
	keeper.mind.add_antag_datum(keeper_antag)
	TEST_ASSERT_NOTNULL(keeper.mind.has_antag_datum(/datum/antagonist/nukeop/lone/syndicate), "Датум защитника диска не выдался разуму")
	try
		TEST_ASSERT_EQUAL(keeper.mind.hijack_stages_per_attempt(), 3, "Защитник диска обязан снимать три стадии за попытку")
		SSshuttle.emergency.hijack_status = HIJACK_TEST_NOT_BEGUN
		TEST_ASSERT_EQUAL(console.increase_hijack_stage(keeper), HIJACK_TEST_STAGE_3, "Первая попытка защитника обязана закрыть три стадии")
		TEST_ASSERT(!SSshuttle.emergency.is_hijacked(), "Одной попытки защитнику хватать не должно")
		TEST_ASSERT_EQUAL(console.increase_hijack_stage(keeper), HIJACK_TEST_HIJACKED, "Вторая попытка обязана завершить взлом")
		TEST_ASSERT(SSshuttle.emergency.is_hijacked(), "Взлом не засчитан, хотя статус дошёл до HIJACKED")
		// Страховка от статуса выше HIJACKED: у такого значения нет ветки в объявлении.
		TEST_ASSERT_EQUAL(console.increase_hijack_stage(keeper), HIJACK_TEST_HIJACKED, "Взлом не должен уводить статус за HIJACKED")
	catch(var/exception/e)
		SSshuttle.emergency.hijack_status = saved_status
		SSshuttle.emergency.mode = saved_mode
		SSshuttle.emergency.timer = saved_timer
		throw e
	SSshuttle.emergency.hijack_status = saved_status
	SSshuttle.emergency.mode = saved_mode
	SSshuttle.emergency.timer = saved_timer

/// Буфет стадий не должен раздаваться кому попало: обычный антагонист по-прежнему вскрывает
/// прошивку по одной стадии за попытку, то есть за все HIJACKED попыток.
/datum/unit_test/shuttle_hijack_plain_antag_one_stage_per_attempt/Run()
	if(!SSshuttle.emergency)
		return // без шаттла проверять нечего
	var/saved_status = SSshuttle.emergency.hijack_status
	var/saved_mode = SSshuttle.emergency.mode
	var/saved_timer = SSshuttle.emergency.timer
	var/obj/machinery/computer/emergency_shuttle/console = allocate(/obj/machinery/computer/emergency_shuttle)
	var/mob/living/carbon/human/hijacker = allocate(/mob/living/carbon/human)
	hijacker.mind_initialize()
	// Голый /datum/antagonist - минимальный не-soft_антаг: у него нет ни экипировки, ни
	// ядерной команды, способной упасть на ландмарках тестовой сцены.
	var/datum/antagonist/plain = new
	plain.silent = TRUE
	hijacker.mind.add_antag_datum(plain)
	try
		SSshuttle.emergency.hijack_status = HIJACK_TEST_NOT_BEGUN
		TEST_ASSERT_EQUAL(hijacker.mind.hijack_stages_per_attempt(), 1, "Антаг без буфета обязан снимать ровно одну стадию за попытку")
		for(var/stage in 1 to HIJACK_TEST_HIJACKED - 1)
			TEST_ASSERT_EQUAL(console.increase_hijack_stage(hijacker), stage, "Обычная попытка обязана поднимать статус ровно на одну стадию")
		TEST_ASSERT(!SSshuttle.emergency.is_hijacked(), "Обычному взломщику не хватает меньше HIJACKED попыток")
		TEST_ASSERT_EQUAL(console.increase_hijack_stage(hijacker), HIJACK_TEST_HIJACKED, "Обычному взломщику нужен весь HIJACKED попыток")
	catch(var/exception/e)
		SSshuttle.emergency.hijack_status = saved_status
		SSshuttle.emergency.mode = saved_mode
		SSshuttle.emergency.timer = saved_timer
		throw e
	SSshuttle.emergency.hijack_status = saved_status
	SSshuttle.emergency.mode = saved_mode
	SSshuttle.emergency.timer = saved_timer

#undef HIJACK_TEST_NOT_BEGUN
#undef HIJACK_TEST_STAGE_3
#undef HIJACK_TEST_HIJACKED
