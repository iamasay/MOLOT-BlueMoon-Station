/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "рыдает."
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 4 SECONDS

/datum/emote/living/carbon/human/cry/run_emote(mob/user, params)
	. = ..()
	if(!. || !iscarbon(user))
		return
	var/mob/living/carbon/C = user
	if(. && isrobotic(user))
		do_fake_sparks(5,FALSE,user)
	if(user.gender == FEMALE || (user.gender == PLURAL && isfeminine(user)))
		playsound(C, pick('sound/voice/female_cry1.ogg', 'sound/voice/female_cry2.ogg'), 50, 1)
	else if(user.gender != FEMALE || (user.gender == PLURAL && ismasculine(user)))
		playsound(C, pick('sound/voice/male_cry1.ogg', 'sound/voice/male_cry2.ogg'), 50, 1)

/datum/emote/living/carbon/human/dap
	key = "dap"
	key_third_person = "daps"
	message = "делает ДЭП и... к сожалению, не может найти никого, кому можно было бы дать DAP. Стыдно."
	message_param = "ДЭПает при виде %t."
	restraint_check = TRUE

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "поднимает бровь."

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "ворчит что-то себе под нос!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "пожимает собственные руки."
	message_param = "пожимает руку %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/hug
	key = "hug"
	key_third_person = "hugs"
	message = "обнимает себя."
	message_param = "обнимает %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/mawp
	key = "mawp"
	key_third_person = "mawps"
	message = "раздраженно бормочет что-то на своём."
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 8 SECONDS

/datum/emote/living/carbon/human/mawp/run_emote(mob/living/user, params)
	. = ..()
	if(.)
		if(ishuman(user))
			if(prob(10))
				user.adjustEarDamage(-5, -5)
	playsound(user, 'modular_citadel/sound/voice/purr.ogg', 50, 1, -1)	//почему мурчание?

/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "бормочет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "бледнеет на секунду."

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "демонстративно поднимает свою руку."
	restraint_check = TRUE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "пожимает плечами."

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	message = "начинает вилять своим хвостом."

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	if(!H.dna.species.is_wagging_tail())
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE)
	if(!..() || !ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail())
		. = null

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "хлопает своими крыльями."

/datum/emote/living/carbon/human/wing/run_emote(mob/user, params)
	. = ..()
	if(.)
		var/mob/living/carbon/human/H = user
		if(H.dna.species.mutant_bodyparts["wings"])
			H.OpenWings()
		else
			H.CloseWings()

/datum/emote/living/carbon/human/wing/select_message_type(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(H.dna.species.mutant_bodyparts["wings"])
		. = "opens " + message
	else
		. = "closes " + message

/datum/emote/living/carbon/human/wing/can_run_emote(mob/user, status_check = TRUE)
	if(!..() || !ishuman(user))
		return FALSE
	var/mob/living/carbon/human/H = user
	if(H.dna && H.dna.species && (H.dna.features["wings"] != "None"))
		return TRUE

/mob/living/carbon/human/proc/OpenWings()
	if(!dna || !dna.species)
		return
	if("wings" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wings"
		dna.species.mutant_bodyparts |= "wingsopen"
	update_body()

/mob/living/carbon/human/proc/CloseWings()
	if(!dna || !dna.species)
		return
	if("wingsopen" in dna.species.mutant_bodyparts)
		dna.species.mutant_bodyparts -= "wingsopen"
		dna.species.mutant_bodyparts |= "wings"
	update_body()
	if(isturf(loc))
		var/turf/T = loc
		T.Entered(src)

/datum/emote/sound/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	emote_type = EMOTE_AUDIBLE

/datum/emote/sound/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "исполняет воинское приветствие."
	message_param = "исполняет воинское приветствие при виде %t."
	sound = 'sound/voice/salute.ogg'
	restraint_check = TRUE

/datum/emote/sound/human/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "жужжит."
	message_param = "жужжит при виде %t."
	sound = 'sound/machines/buzz-sigh.ogg'

/datum/emote/sound/human/buzz2
	key = "buzz2"
	message = "жужжит дважды."
	sound = 'sound/machines/buzz-two.ogg'

/datum/emote/sound/human/ping
	key = "ping"
	key_third_person = "pings"
	message = "звенит."
	message_param = "звенит при виде %t."
	sound = 'sound/machines/ping.ogg'

/datum/emote/sound/human/chime
	key = "chime"
	key_third_person = "chimes"
	message = "издаёт звон."
	sound = 'sound/machines/chime.ogg'

/datum/emote/sound/human/squeak
	key = "squeak"
	message = "пищит словно мышка."
	sound = 'sound/effects/mousesqueek.ogg'

/datum/emote/sound/human/shriek
	key = "shriek"
	key_third_person = "shrieks"
	message = "вскрикивает!"
	sound = 'sound/voice/shriek1.ogg'

/datum/emote/sound/human/syndicate
	key = "syndicate"
	key_third_person = "syndicates"
	message = "получает миссию со стороны Синдиката."
	sound = 'sound/voice/syndicate.ogg'
	emote_cooldown = 8 SECONDS

//rock paper scissors emote handling
/mob/living/carbon/human/proc/beginRockPaperScissors(var/chosen_move)
	GLOB.rockpaperscissors_players[src] = list(chosen_move, ROCKPAPERSCISSORS_NOT_DECIDED)
	do_after(src, ROCKPAPERSCISSORS_TIME_LIMIT, src, extra_checks = CALLBACK(src, PROC_REF(rockpaperscissors_tick)))
	var/new_entry = GLOB.rockpaperscissors_players[src]
	if(new_entry[2] == ROCKPAPERSCISSORS_NOT_DECIDED)
		to_chat(src, "Вы опускаете руку.")
	GLOB.rockpaperscissors_players -= src

/mob/living/carbon/human/proc/rockpaperscissors_tick() //called every cycle of the progress bar for rock paper scissors while waiting for an opponent
	var/mob/living/carbon/human/opponent
	for(var/mob/living/carbon/human/potential_opponent in (GLOB.rockpaperscissors_players - src)) //dont play against yourself
		if(get_dist(src, potential_opponent) <= ROCKPAPERSCISSORS_RANGE)
			opponent = potential_opponent
			break
	if(opponent)
		//we found an opponent before they found us
		var/move_to_number = list("rock" = 0, "paper" = 1, "scissors" = 2)
		var/our_move = move_to_number[GLOB.rockpaperscissors_players[src][1]]
		var/their_move = move_to_number[GLOB.rockpaperscissors_players[opponent][1]]
		var/result_us = ROCKPAPERSCISSORS_WIN
		var/result_them = ROCKPAPERSCISSORS_LOSE
		if(our_move == their_move)
			result_us = ROCKPAPERSCISSORS_TIE
			result_them = ROCKPAPERSCISSORS_TIE
		else
			if(((our_move + 1) % 3) == their_move)
				result_us = ROCKPAPERSCISSORS_LOSE
				result_them = ROCKPAPERSCISSORS_WIN
		//we decided our results so set them in the list
		GLOB.rockpaperscissors_players[src][2] = result_us
		GLOB.rockpaperscissors_players[opponent][2] = result_them

		//show what happened
		src.visible_message("<b>[src]</b> составляет '[GLOB.rockpaperscissors_players[src][1]]' своей рукой!")
		opponent.visible_message("<b>[opponent]</b> составляет '[GLOB.rockpaperscissors_players[opponent][1]]' своей рукой!")
		switch(result_us)
			if(ROCKPAPERSCISSORS_TIE)
				src.visible_message("Ничья!")
			if(ROCKPAPERSCISSORS_WIN)
				src.visible_message("<b>[src]</b> побеждает!")
			if(ROCKPAPERSCISSORS_LOSE)
				src.visible_message("<b>[opponent]</b> побеждает!")

		//make the progress bar end so that each player can handle the result
		return FALSE

	//no opponent was found, so keep searching
	return TRUE

//the actual emotes
/datum/emote/living/carbon/human/rockpaperscissors
	message = "пытается играть в 'Камень-Ножницы-Бумага'!"

/datum/emote/living/carbon/human/rockpaperscissors/rock
	key = "rock"

/datum/emote/living/carbon/human/rockpaperscissors/paper
	key = "paper"

/datum/emote/living/carbon/human/rockpaperscissors/scissors
	key = "scissors"

/datum/emote/living/carbon/human/rockpaperscissors/run_emote(mob/living/carbon/human/user, params)
	if(!(user in GLOB.rockpaperscissors_players)) //no using the emote again while already playing!
		. = ..()
		user.beginRockPaperScissors(key)
