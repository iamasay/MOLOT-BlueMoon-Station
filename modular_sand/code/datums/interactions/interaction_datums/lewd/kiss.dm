/datum/interaction/lewd/kiss
	description = "Поцеловать."
	required_from_user = INTERACTION_REQUIRE_MOUTH
	required_from_target = INTERACTION_REQUIRE_MOUTH
	write_log_user = "kissed"
	write_log_target = "was kissed by"
	interaction_sound = null
	p13user_emote = PLUG13_EMOTE_BASIC
	p13target_emote = PLUG13_EMOTE_BASIC
	p13user_strength = PLUG13_STRENGTH_LOW
	p13target_strength = PLUG13_STRENGTH_LOW

/datum/interaction/lewd/kiss/display_interaction(mob/living/user, mob/living/partner)
	if(user.a_intent == INTENT_HELP)
		user.visible_message(
			pick(span_lewd("\The <b>[user]</b> смотрит прямо в глаза \the <b>[partner]</b>, одаривая нежными прикосновениями губ."),
			span_lewd("\The <b>[user]</b> с трепетом касается губ \the <b>[partner]</b>."),
			span_lewd("\The <b>[user]</b> почти не прижимаясь к губам \the <b>[partner]</b>, дарит нежный поцелуй.")))
	if(user.a_intent == INTENT_DISARM)
		user.visible_message(
			pick(span_lewd("\The <b>[user]</b> прижимается к губкам \the <b>[partner]</b>, даря смущенный поцелуй."),
			span_lewd("\The <b>[user]</b> осторожно касается губ \the <b>[partner]</b> своими."),
			span_lewd("\The <b>[user]</b> неловко прижимается к губкам \the <b>[partner]</b>.")))
	if(user.a_intent == INTENT_GRAB)
		user.visible_message(
			pick(span_lewd("\The <b>[user]</b> настойчиво целует \the <b>[partner]</b>, заводя руку за шею и прижимая к себе."),
			span_lewd("\The <b>[user]</b> хватается руками за щёки \the <b>[partner]</b> и прижимает к своим губам."),
			span_lewd("\The <b>[user]</b> хватает за талию \the <b>[partner]</b> и прижимает к себе заключая в долгом поцелуе.")))
	if(user.a_intent == INTENT_HARM)
		user.visible_message(
			pick(span_lewd("\The <b>[user]</b> облизывает губы \the <b>[partner]</b>, проникая языком сквозь сжатые зубы."),
			span_lewd("\The <b>[user]</b> бъёт по щеке \the <b>[partner]</b>, и заглушает любой звук из рта своим поцелуем."),
			span_lewd("\The <b>[user]</b> душит \the <b>[partner]</b>, целуя в распухшие губы.")))
		if(HAS_TRAIT(user, TRAIT_KISS_OF_DEATH))
			partner.reagents.add_reagent(/datum/reagent/toxin/amanitin , 4)
			user.reagents.add_reagent(/datum/reagent/toxin/amanitin , 0.5)
