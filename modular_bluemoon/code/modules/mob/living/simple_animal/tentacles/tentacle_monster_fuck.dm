/mob/living/simple_animal/hostile/tentacles/proc/tentacle_vaginal(mob/living/carbon/human/M)
	if(prob(15))
		to_chat(M, span_userdanger(pick("Сильные фрикции в моей киске сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своей киски!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST*2 * 2)
		M.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_VAGINA, M)
		M.Jitter(3)
		M.Stun(30)
		M.emote("moan")
	else
		to_chat(M, span_love(pick("Я чувствую что-то глубоко в своей киске!", "Оно трахает мою киску!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST * 2)
		M.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST, CUM_TARGET_VAGINA, M)
	playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang1.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang2.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang3.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang4.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang5.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang6.ogg'), 70, 1, -1)

/mob/living/simple_animal/hostile/tentacles/proc/tentacle_vaginal_double(mob/living/carbon/human/M)
	if(prob(15))
		to_chat(M, span_userdanger(pick("Сильные фрикции внутри сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своих дырочек!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST*2 * 2)
		M.handle_post_sex(HIGH_LUST*2, CUM_TARGET_PENIS, src)
		src.handle_post_sex(HIGH_LUST*2, CUM_TARGET_VAGINA, M)
		M.Jitter(3)
		M.Stun(30)
		M.emote("moan")
	else
		to_chat(M, span_love(pick("Я чувствую что-то глубоко в своих дырочках!", "Оно трахает мои дырочки!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST * 2)
		M.handle_post_sex(HIGH_LUST, CUM_TARGET_PENIS, src)
		src.handle_post_sex(HIGH_LUST, CUM_TARGET_VAGINA, M)
	playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang1.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang2.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang3.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang4.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang5.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang6.ogg'), 70, 1, -1)

/mob/living/simple_animal/hostile/tentacles/proc/tentacle_penis(mob/living/carbon/human/M)
	if(prob(15))
		to_chat(M, span_userdanger(pick("Движения в уретре сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST*2 * 2)
		M.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_PENIS, M)
		M.Jitter(3)
		M.Stun(30)
		M.emote("moan")
	else
		to_chat(M, span_love(pick("Я чувствую что-то у своего члена!", "Оно обсасывает мой член!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST * 2)
		M.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, M)
	playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang1.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang2.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang3.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang4.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang5.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang6.ogg'), 70, 1, -1)

/mob/living/simple_animal/hostile/tentacles/proc/tentacle_penis_double(mob/living/carbon/human/M)
	if(prob(15))
		to_chat(M, span_userdanger(pick("Движения в уретре и в заднице сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции своего члена и щупалец в занице!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST*2 * 2)
		M.handle_post_sex(HIGH_LUST*2, CUM_TARGET_PENIS, src)
		src.handle_post_sex(HIGH_LUST*2, CUM_TARGET_ANUS, M)
		M.Jitter(3)
		M.Stun(30)
		M.emote("moan")
	else
		to_chat(M, span_love(pick("Я чувствую что-то у своего члена и внутри совего зада!", "Оно обсасывает мой член и трахает мой зад!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST * 2)
		M.handle_post_sex(HIGH_LUST, CUM_TARGET_PENIS, src)
		src.handle_post_sex(HIGH_LUST, CUM_TARGET_ANUS, M)
	playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang1.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang2.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang3.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang4.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang5.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang6.ogg'), 70, 1, -1)

/mob/living/simple_animal/hostile/tentacles/proc/tentacle_anal(mob/living/carbon/human/M)
	if(prob(15))
		to_chat(M, span_userdanger(pick("Сильные фрикции в моей попе сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильных фрикций внутри своей попы!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST*2 * 2)
		M.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST*2, CUM_TARGET_ANUS, M)
		M.Jitter(3)
		M.Stun(30)
		M.emote("moan")
	else
		to_chat(M, span_love(pick("Я чувствую что-то глубоко в своей попе!", "Оно трахает мою попу!")))
		M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, NORMAL_LUST * 2)
		M.handle_post_sex(NORMAL_LUST, CUM_TARGET_PENIS, src)
		src.handle_post_sex(NORMAL_LUST, CUM_TARGET_ANUS, M)
	playsound(loc, pick('modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang1.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang2.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang3.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang4.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang5.ogg',
						'modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang6.ogg'), 70, 1, -1)
