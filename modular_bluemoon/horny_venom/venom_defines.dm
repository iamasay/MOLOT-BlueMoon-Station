//------------------------------SETUP------------------------------//

//Простые постоянные, которые подсказывают механу, кто сейчас находится
// в теле хоста. От их значения обычно зависит то, что будет делать абилка takeControl

#define islatexmob(A) (istype(A, /mob/living/simple_animal/latexmob)) //Простая проверка на latexmob
#define isbackseatmob(A) (istype(A, /mob/living/simple_animal/latexmob/venom)) //аналогично для venom
#define checkplayerssd(M) (!M.client && M.mind) //Майнд есть, а клиента нет. Типичный признак ливнувшего игрока.

#define BODY_OWNER "OWNER" //Если тело находится под контролем изначального владельца
#define VENOM_USER "VENOM" //Если телом сейчас управляет игрок на латексном паразите
#define IN 			"in"   //Применяется при трансфере BACKSEAT <--> BODY
#define OUT 		"out"  //Применяется при трансфере BODY <--> BACKSEAT

//-----Скорости слияния с хостом-----
#define DEFAULT_MERGING_DELAY 10 SECONDS	//Начальная стадия
#define MEDIUM_MERGING_DELAY   8 SECONDS	//Последующие стадии
#define BEST_MERGING_DELAY     5 SECONDS	//Самая последняя стадия, наименьшая задержка
#define DEBUG_MERGING_DELAY    1 SECONDS    //Только для разработки

//TGUI ALERTS сообщения, выводимые в виде окна игроку. Носят важный характер.
// Сюда выносятся только важные сообщения.
#define LOGIN_WARNING_MESSAGE(user) (tgui_alert(user, "Не совершайте самоубиство и не ставьте чужое тело в неловкое положение. Так же вам крайне не следует делать сомнительные, или откровенные(ЕРП) действия, без явного одобрения со стороны хозяина тела(Noncon = Yes считается за явное одобрение, в противном случае ОБЯЗАТЕЛЬНО спрашивайте в LOOC).", "Предупреждение", list("Я осознаю это")))
#define MERGING_SSD_ERROR(user) (tgui_alert(user, "Вы не можете пытаться поглотить/взять контроль SSD игроков", "ОШИБКА", list("Хорошо")))

//-----Разнообразные сообщения, используемые в to_chat-----
#define DEFAULT_ABILITY_ERROR_MESSAGE(user)  to_chat(user, span_warning("Вы не можете использовать эту способность из текущего состояния!"))
#define LEAK_OUT_ERROR_MESSAGE(user)         to_chat(user, span_warning("Ваше тело недостаточно гибкое для использования этой способности. Попробуйте сменить форму тела на слайма"))
#define SLOW_DOWN_ANTISPAM_MESSAGE(user)     to_chat(user, span_danger("В данный момент вы уже пытаетесь поглотить кого-то"))
#define NO_AIRLOCK_NEABY(user)               to_chat(user, span_warning("Шлюзы по-близости не найдены"))
#define TOO_FAR_ERROR(user)                  to_chat(user, span_warning("Вы слишком далеко"))
#define SPACE_SUIT_ERROR(user)               to_chat(user, span_warning("Цель одета в скафандр, некуда пролезть!"))
#define HANDLE_MERGING_TO_HOST_MESSAGE(user) to_chat(user, span_boldwarning("Что-то склизкое и темное обхватывает вас с ног, начиная ползти вверх по вашему телу, пробирай до дрожи!"))
//-----Постоянные для "заднего сидения". Это промежуточное место, куда попадает игрок на паразите/владельце тела при смене "рулящего" телом-----
#define LOGIN_NOTICE_MESSAGE(user)  to_chat(user, span_notice("Вы находитесь на так называемом заднем сидении данного тела. Вы можете говорить как и привыкли, но ваши слова услышит лишь владелец тела. В данном состоянии вы можете только наблюдать."))

//-----Скорости регенерации очков эволюции-----
#define POINTS_REGEN_DEBUG    0.5
#define POINTS_REGEN_NORMAL   0.001
#define POINTS_REGEN_HOSTLESS 0.0005
