/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/blush/run_emote(mob/user, params)
	. = ..()
	if(. && isrobotic(user))
		do_fake_sparks(5,FALSE,user)

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "кланяется."
	message_param = "кланяется при виде %t."
	restraint_check = TRUE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/choke/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(. && iscarbon(user))
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			playsound(C, pick('sound/voice/gasp_female1.ogg', 'sound/voice/gasp_female2.ogg', 'sound/voice/gasp_female3.ogg', 'sound/voice/gasp_female4.ogg', 'sound/voice/gasp_female5.ogg', 'sound/voice/gasp_female6.ogg', 'sound/voice/gasp_female7.ogg'), 50, 1)
		else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
			playsound(C, pick('sound/voice/gasp_male1.ogg', 'sound/voice/gasp_male2.ogg', 'sound/voice/gasp_male3.ogg', 'sound/voice/gasp_male4.ogg', 'sound/voice/gasp_male5.ogg', 'sound/voice/gasp_male6.ogg', 'sound/voice/gasp_male7.ogg',), 50, 1)

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрещивает свои руки."
	restraint_check = TRUE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "усмехается."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите
	emote_cooldown = 3 SECONDS

/datum/emote/living/chuckle/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(. && iscarbon(user))
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			playsound(C, pick('sound/voice/chuckle_f.ogg'), 50, 1)
		else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
			playsound(C, pick('sound/voice/chuckle_m.ogg'), 50, 1)

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "падает с ног!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/cough/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(. && iscarbon(user))
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			playsound(C, pick('sound/voice/female_cough1.ogg', 'sound/voice/female_cough2.ogg', 'sound/voice/female_cough3.ogg', 'sound/voice/female_cough4.ogg', 'sound/voice/female_cough5.ogg', 'sound/voice/female_cough6.ogg'), 50, 1)
		else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
			playsound(C, pick('sound/voice/male_cough1.ogg', 'sound/voice/male_cough2.ogg', 'sound/voice/male_cough3.ogg', 'sound/voice/male_cough4.ogg'), 50, 1)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "радостно танцует."
	restraint_check = TRUE
	emote_cooldown = 3 SECONDS

/datum/emote/living/dance/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(ishuman(user))
		user.SpinAnimation(8,4)
		user.spin(30, 1)

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "застывает и падает без сил, глаза мертвы и безжизненны..."
	message_robot = "на мгновение яростно вздрагивает, а затем падает неподвижно. Его механические глаза медленно темнеют."
	message_AI = "выпускает шквал искр. Его экран мерцает, когда его системы медленно останавливаются..."
	message_alien = "издает слабеющий гортанный крик, когда зеленая кровь пузырится из его пасти..."
	message_larva = "выпускает воздух с тошнотворным шипением и падает на пол...."
	message_monkey = "издает свой последний крик, когда последние частицы души уходят из тела и наконец-то... перестает двигаться..."
	message_simple =  "прекращает всякое движение..."
	emote_cooldown = 9 SECONDS // BLUEMOON EDIT - повысил кулдаун эмоута в связи с возможно слишком долгими/громкими кастомными звуками
	stat_allowed = UNCONSCIOUS

// BLUEMOON EDIT START - настройки эмоута смерти в преференсах
/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(user?.client?.prefs?.features["custom_deathgasp"])
		message = user.client.prefs.features["custom_deathgasp"]
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message = initial(message)
	message_simple = initial(message_simple)
	if(!.)
		return
	var/deathsound = pick(user.deathsound)
	if(isalienadult(user))
		deathsound = 'sound/voice/hiss6.ogg'
	if(user?.client?.prefs?.features["custom_deathsound"]) // Если у клиента выбран соответствующий преференс - он приоритетнее всего
		var/preference_deathsound = GLOB.deathgasp_sounds[user.client.prefs.features["custom_deathsound"]]
		if(preference_deathsound == -1) // Беззвучный
			return
		if(preference_deathsound)
			deathsound = preference_deathsound
	if(deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || (L.oxyloss >= 50 && !HAS_TRAIT(L, TRAIT_NOBREATH)))
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, deathsound, 200, 0, 0)
// BLUEMOON EDIT END

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."
	stat_allowed = SOFT_CRIT // BLUEMOON ADD - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "падает без сознания."
	stat_allowed = SOFT_CRIT

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "хлопает крыльями."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if(H.dna.species.mutant_bodyparts["wingsopen"])
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? TYPE_PROC_REF(/mob/living/carbon/human, OpenWings) : TYPE_PROC_REF(/mob/living/carbon/human, CloseWings)), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "ГНЕВНО хлопает крыльями!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "издаёт гулкий зук."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
//bluemoon add start
/datum/emote/living/gasp/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(. && iscarbon(user))
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			playsound(C, pick(
				'sound/voice/gasp_female1.ogg',
				'sound/voice/gasp_female2.ogg',
				'sound/voice/gasp_female3.ogg',
				'sound/voice/gasp_female4.ogg',
				'sound/voice/gasp_female5.ogg',
				'sound/voice/gasp_female6.ogg',
				'sound/voice/gasp_female7.ogg'),
			10, TRUE, extrarange = -13) //2 tiles around
		else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
			playsound(C, pick(
				'sound/voice/gasp_male1.ogg',
				'sound/voice/gasp_male2.ogg',
				'sound/voice/gasp_male3.ogg',
				'sound/voice/gasp_male4.ogg',
				'sound/voice/gasp_male5.ogg',
				'sound/voice/gasp_male6.ogg',
				'sound/voice/gasp_male7.ogg'),
			10, TRUE, extrarange = -13) //2 tiles around
//bluemoon add end
/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "тихо хихикает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/run_emote(mob/user, params)
	. = ..()
	var/mob/living/carbon/C = user
	if(. && iscarbon(user))
		if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
			playsound(C, pick('sound/voice/female_giggle1.ogg', 'sound/voice/female_giggle2.ogg'), 50, 1)
		else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
			playsound(C, pick('sound/voice/male_giggle1.ogg', 'sound/voice/male_giggle2.ogg'), 50, 1)

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "смотрит с ненавистью."
	message_param = "смотрит с ненавистью на %t."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "ухмыляется."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "рычит!"
	var/sound = 'sound/voice/roar.ogg'
	message_mime = "делает вид, что рычит!"

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "гримасничает."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "отправляет воздушный поцелуй."
	message_param = "отправляет воздушный поцелуй для %t."

/datum/emote/living/kiss/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/kiss_type = /obj/item/hand_item/kisser

	if(HAS_TRAIT(user, TRAIT_KISS_OF_DEATH))
		kiss_type = /obj/item/hand_item/kisser/death

	var/obj/item/kiss_blower = new kiss_type(user)
	if(user.put_in_hands(kiss_blower))
		to_chat(user, span_notice("You ready your kiss-blowing hand."))
	else
		qdel(kiss_blower)
		to_chat(user, span_warning("You're incapable of blowing a kiss in your current state."))

/datum/emote/living/kiss2
	key = "kiss2"
	key_third_person = "kisses"
	message = "blows a kiss."
	message_param = "blows a kiss to %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/audio_emote
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 1 SECONDS

/datum/emote/living/audio_emote/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent && (!C.mind || !C.mind.miming)

/datum/emote/living/audio_emote/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеётся."
	message_mime = "тихо смеётся!"
	emote_cooldown = 3 SECONDS

/datum/emote/living/audio_emote/laugh/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user)) //Citadel Edit because this is hilarious
		var/mob/living/carbon/C = user
		if(iscatperson(C))	//we ask for is cat first because they're a subtype that tests true for ishumanbasic because HERESY
			playsound(C, pick('sound/voice/catpeople/nyahaha1.ogg',
			'sound/voice/catpeople/nyahaha2.ogg',
			'sound/voice/catpeople/nyaha.ogg',
			'sound/voice/catpeople/nyahehe.ogg'),
			50, 1)
			return
		else if(isinsect(C))
			playsound(C, 'sound/voice/moth/mothlaugh.ogg', 50, 1)
		else if(isvox(C))
			playsound(C, 'modular_bluemoon/kovac_shitcode/sound/species/voxrustle.ogg', 50, 1)
		else if(isjellyperson(C))
			var/mob/living/carbon/human/H = C
			if(H.dna.features["mam_ears"] == "Cat" || H.dna.features["mam_ears"] == "Cat, Big") //slime have cat ear. slime go nya.
				playsound(C, pick('sound/voice/jelly/nyahaha1.ogg',
				'sound/voice/jelly/nyahaha2.ogg',
				'sound/voice/jelly/nyaha.ogg',
				'sound/voice/jelly/nyahehe.ogg'),
				50, 1)
				return
			else if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
				playsound(C, 'sound/voice/jelly/womanlaugh.ogg', 50, 1)
				return
			else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
				playsound(C, pick('sound/voice/jelly/manlaugh1.ogg', 'sound/voice/jelly/manlaugh2.ogg'), 50, 1)
				return
		else if(ishumanbasic(C))
			if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
				playsound(C, pick('sound/voice/human/womanlaugh.ogg', 'sound/voice/female_laugh1.ogg', 'sound/voice/female_laugh2.ogg', 'sound/voice/female_laugh3.ogg'), 50, 1)
			else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
				playsound(C, pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg', 'sound/voice/laugh_m1.ogg', 'sound/voice/laugh_m2.ogg', 'sound/voice/laugh_m3.ogg'), 50, 1)

/datum/emote/living/audio_emote/chitter
	key = "chitter"
	key_third_person = "chitters"
	message = "бубнит."
	message_mime = "тихо бубнит."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/audio_emote/chitter/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user)) //Citadel Edit because this is hilarious
		var/mob/living/carbon/C = user
		if(isinsect(C))
			playsound(C, 'sound/voice/moth/mothchitter.ogg', 50, 1)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает головой."
	message_param = "кивает головой в согласии с %t."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='userdanger'>falling down</span> in the process!"
				H.DefaultCombatKnockdown(20)
			else
				message_param = "<span class='userdanger'>bumps [user.ru_ego()] head on the ground</span> trying to motion towards %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "дуется."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит."
	message_mime = "изображает крик!"
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 3 SECONDS

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмурится."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "качает своей головой в отрицании."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "вздрагивает."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sigh/run_emote(mob/user, params)
	. = ..()
	if(!. || !isliving(user))
		return
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
		playsound(C, pick('sound/voice/sigh_female.ogg'), 50, 1)
	else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
		playsound(C, pick('sound/voice/sigh_male.ogg'), 50, 1)

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "садится."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/smirk
	key = "smirk"
	key_third_person = "smirks"
	message = "ухмыляется."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихает."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sneeze/run_emote(mob/user, params)
	. = ..()
	if(!isliving(user) || !.)
		return
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
		playsound(C, pick('sound/voice/sneezef1.ogg', 'sound/voice/sneezef2.ogg'), 50, 1)
	else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
		playsound(C, pick('sound/voice/sneezem1.ogg', 'sound/voice/sneezem2.ogg'), 50, 1)

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "самодовольно ухмыляется."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sniff/run_emote(mob/user, params)
	. = ..()
	if(!. || !isliving(user))
		return
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
		playsound(C, pick('sound/voice/sniff_f1.ogg'), 50, 1)
	else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
		playsound(C, pick('sound/voice/sniff_m1.ogg'), 50, 1)

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "храпит."
	message_mime = "храпит с необычным звуком."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пристально смотрит."
	message_param = "пристально смотрит на %t."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "вытягивает руки."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "печально опускает руки."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "складывает руки за голову и падает на землю, <b>ОДНОЗНАЧНО сдается!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		//Skyrat change start
		if(L.client?.prefs?.autostand)
			if(!(L.combat_flags & COMBAT_FLAG_INTENTIONALLY_RESTING))
				TOGGLE_BITFIELD(L.combat_flags, COMBAT_FLAG_INTENTIONALLY_RESTING)
		L.DefaultCombatKnockdown(300)
		L.Stun(50) //Skyrat Change
		L.set_resting(TRUE) //Skyrat change

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "головокружительно раскачивается."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "дрожит от страха!"
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дёргается."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дёргается."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет рукой."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "изображает боль."

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слабо улыбается."
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите
	emote_cooldown = 3 SECONDS

/datum/emote/living/yawn/run_emote(mob/user, params)
	. = ..()
	if(!iscarbon(user) || !.)
		return
	var/mob/living/carbon/C = user
	if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
		playsound(C, pick('sound/voice/female_yawn1.ogg', 'sound/voice/female_yawn2.ogg'), 50, 1)
	else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
		playsound(C, pick('sound/voice/male_yawn1.ogg', 'sound/voice/male_yawn2.ogg'), 50, 1)


/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null
	stat_allowed = SOFT_CRIT // BLUEMOON EDIT - некоторые эмоуты можно использовать в софткрите
	emote_type = EMOTE_BOTH

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Custom Emote", null, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			message = custom_emote
	else
		message = params
	message = user.say_emphasis(message)
	. = ..()
	message = null

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"
	stat_allowed = DEAD

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sort_list(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/sound/AISyndiHack
	key = "hack"
	key_third_person = "hacks"
	message = "в процессе взлома Синдикатом."
	sound = 'sound/machines/AISyndiHack.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human, /mob/camera/aiEye)
	emote_cooldown = 10 SECONDS

/datum/emote/sound/beep
	key = "beep"
	key_third_person = "beeps"
	message = "издаёт звуковые сигналы."
	message_param = "издаёт звуковые сигналы на %t."
	sound = 'sound/machines/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human, /mob/camera/aiEye)

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/hand_item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>Вы делаете круг пальцами своей руки.</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>У вас нет свободных рук, чтобы сделать круг..</span>")

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/hand_item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>Ты готовишь свою руку для пощечины.</span>")
	else
		to_chat(user, "<span class='warning'>Ты не способен на пощечины в своем нынешнем состоянии.</span>")

/datum/emote/living/audio_emote/blorble
	key = "blorble"
	key_third_person = "blorbles"
	message = "блорбл!"
	message_param = "блорбит на %t!!"

/datum/emote/living/audio_emote/blorble/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(isjellyperson(C))
			playsound(C, 'sound/effects/attackblob.ogg', 50, 1)

/datum/emote/living/audio_emote/blurp
	key = "blurp"
	key_third_person = "blurps"
	message = "блурп!"
	message_param = "блурпит прямо на %t!!"

/datum/emote/living/audio_emote/blurp/run_emote(mob/user, params)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(isjellyperson(C))
			pick(playsound(C, 'sound/effects/meatslap.ogg', 50, 1),playsound(C, 'sound/effects/gib_step.ogg', 50, 1))
