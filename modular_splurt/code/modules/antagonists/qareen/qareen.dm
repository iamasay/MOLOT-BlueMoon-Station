//qareens: based off of revenant from TG
//"Ghosts" that are invisible and move like ghosts, cannot take damage while invisible
//Can hear deadchat, but are NOT normal ghosts and do NOT have x-ray vision
//Admin-spawn or random event

// TODO
// new ability - manifest - gives visible simplemob form untill de-activated (can still use abilities) (add after spriting)

#define INVISIBILITY_QAREEN 50
#define QAREEN_NAME_FILE "qareen_names.json"

/mob/living/simple_animal/qareen
	name = "Qareen"
	desc = "A horny spirit."
	icon = 'modular_bluemoon/Gardelin0/icons/mob/qareen.dmi'	//It looks pretty tho! - Gardelin0
	icon_state = "qareen_none_idle"
	var/icon_idle = "qareen_none_idle"
	var/icon_reveal = "qareen_none_revealed"
	var/icon_stun = "qareen_none_stun"
	var/icon_drain = "qareen_none_draining"
	var/stasis = FALSE
	mob_biotypes = MOB_SPIRIT
	incorporeal_move = INCORPOREAL_MOVE_JAUNT
	invisibility = INVISIBILITY_QAREEN
	health = INFINITY //qareens don't use health, they use essence instead
	maxHealth = INFINITY
	layer = GHOST_LAYER
	healable = FALSE
	spacewalk = TRUE
	sight = SEE_SELF
	throwforce = 0
	blood_volume = 0
	has_field_of_vision = FALSE //we are a spoopy ghost
	rad_flags = RAD_NO_CONTAMINATE | RAD_PROTECT_CONTENTS

	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "swings through"
	response_disarm_simple = "swing through"
	response_harm_continuous = "punches through"
	response_harm_simple = "punch through"
	unsuitable_atmos_damage = 0
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0) //I don't know how you'd apply those, but qareens no-sell them anyway.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	harm_intent_damage = 0
	friendly_verb_continuous = "touches"
	friendly_verb_simple = "touch"
	status_flags = 0
	wander = FALSE
	density = FALSE
	movement_type = FLYING
	move_resist = MOVE_FORCE_OVERPOWERING
	mob_size = MOB_SIZE_TINY
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	speed = 1
	unique_name = TRUE
	hud_possible = list(ANTAG_HUD)
	hud_type = /datum/hud/qareen

	var/essence = 150 //The resource, and health, of qareens.
	var/essence_regen_cap = 150 //The regeneration cap of essence (go figure); regenerates every Life() tick up to this amount.
	var/essence_regenerating = TRUE //If the qareen regenerates essence or not
	var/essence_regen_amount = 5 //How much essence regenerates
	var/essence_accumulated = 0 //How much essence the qareen has stolen
	var/essence_excess = 0 //How much stolen essence available for unlocks
	var/revealed = FALSE //If the qareen can take damage from normal sources.
	var/unreveal_time = 0 //How long the qareen is revealed for, is about 2 seconds times this var.
	var/unstun_time = 0 //How long the qareen is stunned for, is about 2 seconds times this var.
	var/inhibited = FALSE //If the qareen's abilities are blocked by a chaplain's power.
	var/essence_drained = 0 //How much essence the qareen will drain from the corpse it's feasting on.
	var/draining = FALSE //If the qareen is draining someone.
	var/list/drained_mobs = list() //Cannot harvest the same mob twice
	var/perfectsouls = 0 //How many perfect, regen-cap increasing souls the qareen has. //TODO, add objective for getting a perfect soul(s?)
	var/generated_objectives_and_spells = FALSE
	var/telekinesis_cooldown

/mob/living/simple_animal/qareen/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SIXTHSENSE, INNATE_TRAIT)
	AddSpell(new /obj/effect/proc_holder/spell/targeted/night_vision/qareen(null))
	AddSpell(new /obj/effect/proc_holder/spell/targeted/telepathy/qareen(null))
//	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/qareen/defile(null))	Reserved for later. - Gardelin0
	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/qareen/overload(null))
//	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/qareen/bliss(null))		Reserved for later. - Gardelin0
//	AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/qareen/malfunction(null))	Reserved for later. - Gardelin0

//Removed random names, because revenant names seem too hostile

/mob/living/simple_animal/qareen/Login()
	..()
	var/qareen_greet
	qareen_greet += "<span class='deadsay'><span class='big bold'>Вы есть qareen.</span></span>" //Rough translation by Gardelin0
	qareen_greet += "<b>Ваш прежде мирской дух был запитан инопланетной энергией и преобразован в qareen.</b>"
	qareen_greet += "<b>Вы не являетесь ни живым, ни мёртвым, а чем-то посередине. Вы способны взаимодействовать с обоими мирами.</b>"
	qareen_greet += "<b>Вы неуязвимы и невидимы для живых, но не для призраков.</b>"
	qareen_greet += "<b><i>Вы ничего не помните о своих прошлых жизнях и ничего не вспомните о текущей после своей смерти.</i></b>"
	qareen_greet += "<b>Не забывайте следовать правилам для антагонистов.</b>"
	qareen_greet += "<b>Вы также можете телекинетически бросать предметы, перетаскивая их с помощью мыши.</b>"
	to_chat(src, qareen_greet)
	if(!generated_objectives_and_spells)
		generated_objectives_and_spells = TRUE
		mind.assigned_role = ROLE_QAREEN
		mind.special_role = ROLE_QAREEN
		SEND_SOUND(src, sound('sound/effects/ghost.ogg'))
		mind.add_antag_datum(/datum/antagonist/qareen)

//Life, Stat, Hud Updates, and Say
/mob/living/simple_animal/qareen/Life(seconds, times_fired)
	. = ..()
	if(stasis)
		return
	if(revealed && essence <= 0)
		INVOKE_ASYNC(src, PROC_REF(death))
	if(unreveal_time && world.time >= unreveal_time)
		unreveal_time = 0
		revealed = FALSE
		incorporeal_move = INCORPOREAL_MOVE_JAUNT
		invisibility = INVISIBILITY_QAREEN
		to_chat(src, "<span class='revenboldnotice'>You are once more concealed.</span>")
	if(unstun_time && world.time >= unstun_time)
		unstun_time = 0
		mob_transforming = FALSE
		to_chat(src, "<span class='revenboldnotice'>You can move again!</span>")
	if(essence_regenerating && !inhibited && essence < essence_regen_cap) //While inhibited, essence will not regenerate
		essence = min(essence_regen_cap, essence+essence_regen_amount)
		update_action_buttons_icon() //because we update something required by our spells in life, we need to update our buttons
	update_spooky_icon()
	update_health_hud()

/mob/living/simple_animal/qareen/get_status_tab_items()
	. = ..()
	. += "Current essence: [essence]/[essence_regen_cap]E"
	. += "Stolen essence: [essence_accumulated]E"
	. += "Unused stolen essence: [essence_excess]E)"
	. += "Taken from sexually frustrateds: [perfectsouls]"

/mob/living/simple_animal/qareen/update_health_hud()
	if(hud_used)
		var/essencecolor = "#8F48C6"
		if(essence > essence_regen_cap)
			essencecolor = "#9A5ACB" //oh boy you've got a lot of essence
		else if(!essence)
			essencecolor = "#1D2953" //oh jeez you're dying
		hud_used.healths.maptext = "<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='[essencecolor]'>[essence]E</font></div>"

/mob/living/simple_animal/qareen/med_hud_set_health()
	return //we use no hud

/mob/living/simple_animal/qareen/med_hud_set_status()
	return //we use no hud

/mob/living/proc/qareen_talk(message, bubble_type, var/list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(!message)
		return
	src.log_talk(message, LOG_SAY)
	var/rendered = "<span class='revennotice'><b>[src]</b> says, \"[message]\"</span>"
	for(var/mob/M in GLOB.mob_list)
		if(isqareen(M))
			to_chat(M, rendered)
		else if(isobserver(M))
			var/link = FOLLOW_LINK(M, src)
			to_chat(M, "[link] [rendered]")
	return


//Immunities

/mob/living/simple_animal/qareen/ex_act(severity, target, origin)
	return 1 //Immune to the effects of explosions.

/mob/living/simple_animal/qareen/wave_ex_act(power, datum/wave_explosion/explosion, dir)
	return power

/mob/living/simple_animal/qareen/blob_act(obj/structure/blob/B)
	return //blah blah blobs aren't in tune with the spirit world, or something.

/mob/living/simple_animal/qareen/singularity_act()
	return //don't walk into the singularity expecting to find corpses, okay?

/mob/living/simple_animal/qareen/narsie_act()
	return //most humans will now be either bones or harvesters, but we're still un-alive.

/mob/living/simple_animal/qareen/ratvar_act()
	return //clocks get out reee

//damage, gibbing, and dying
/mob/living/simple_animal/qareen/attackby(obj/item/W, mob/living/user, params)
	. = ..()
	if(istype(W, /obj/item/nullrod))
		visible_message("<span class='warning'>[src] violently flinches!</span>", \
						"<span class='revendanger'>As \the [W] passes through you, you feel your essence draining away!</span>")
		adjustBruteLoss(25) //hella effective
		inhibited = TRUE
		update_action_buttons_icon()
		addtimer(CALLBACK(src, PROC_REF(reset_inhibit)), 30)

/datum/reagent/toxin/on_mob_life(mob/living/simple_animal/qareen/Q) //So the holy water will damage it! - Gardelin0
	if(istype(Q))
		Q.adjustFireLoss(4)
		. = TRUE
	..()

/mob/living/simple_animal/qareen/proc/reset_inhibit()
	inhibited = FALSE
	update_action_buttons_icon()

/mob/living/simple_animal/qareen/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	if(!forced && !revealed)
		return FALSE
	. = amount
	essence = max(0, essence-amount)
	if(updating_health)
		update_health_hud()
	if(!essence)
		death()

/mob/living/simple_animal/qareen/dust(just_ash, drop_items, force)
	death()

/mob/living/simple_animal/qareen/gib()
	death()

/mob/living/simple_animal/qareen/death()
	if(!revealed || stasis) //qareens cannot die if they aren't revealed //or are already dead
		return 0
	stasis = TRUE
	to_chat(src, "<span class='revendanger'>NO! No... it's too late, you can feel your essence [pick("spewing out", "bursting out")]...</span>")
	mob_transforming = TRUE
	revealed = TRUE
	invisibility = 0
	playsound(src, 'sound/effects/screech.ogg', 100, 1)
	visible_message("<span class='warning'>[src] lets out a waning screech as violet mist swirls around its dissolving body!</span>")
	icon_state = icon_drain
	for(var/i = alpha, i > 0, i -= 10)
		stoplag()
		alpha = i
	visible_message("<span class='danger'>[src]'s body breaks apart into a fine pile of blue dust.</span>")
	var/reforming_essence = essence_regen_cap //retain the gained essence capacity
	var/obj/item/ectoplasm/qareen/R = new(get_turf(src))
	R.essence = max(reforming_essence - 15 * perfectsouls, 75) //minus any perfect souls
	R.old_key = client.key //If the essence reforms, the old qareen is put back in the body
	R.qareen = src
	invisibility = INVISIBILITY_ABSTRACT
	revealed = FALSE
	ghostize(0)//Don't re-enter invisible corpse


//reveal, stun, icon updates, cast checks, and essence changing
/mob/living/simple_animal/qareen/proc/reveal(time)
	if(!src)
		return
	if(time <= 0)
		return
	revealed = TRUE
	invisibility = 0
	incorporeal_move = FALSE
	if(!unreveal_time)
		to_chat(src, "<span class='revendanger'>You have been revealed!</span>")
		unreveal_time = world.time + time
	else
		to_chat(src, "<span class='revenwarning'>You have been revealed!</span>")
		unreveal_time = unreveal_time + time
	update_spooky_icon()

/mob/living/simple_animal/qareen/proc/stun(time)
	if(!src)
		return
	if(time <= 0)
		return
	mob_transforming = TRUE
	if(!unstun_time)
		to_chat(src, "<span class='revendanger'>You cannot move!</span>")
		unstun_time = world.time + time
	else
		to_chat(src, "<span class='revenwarning'>You cannot move!</span>")
		unstun_time = unstun_time + time
	update_spooky_icon()

/mob/living/simple_animal/qareen/proc/update_spooky_icon()
	if(revealed)
		if(mob_transforming)
			if(draining)
				icon_state = icon_drain
			else
				icon_state = icon_stun
		else
			icon_state = icon_reveal
	else
		icon_state = icon_idle

/mob/living/simple_animal/qareen/proc/castcheck(essence_cost)
	if(!src)
		return
	var/turf/T = get_turf(src)
	if(isclosedturf(T))
		to_chat(src, "<span class='revenwarning'>You cannot use abilities from inside of a wall.</span>")
		return FALSE
	for(var/obj/O in T)
		if(O.density && !O.CanPass(src, T))
			to_chat(src, "<span class='revenwarning'>You cannot use abilities inside of a dense object.</span>")
			return FALSE
	if(inhibited)
		to_chat(src, "<span class='revenwarning'>Your powers have been suppressed by nulling energy!</span>")
		return FALSE
	if(!change_essence_amount(essence_cost, TRUE))
		to_chat(src, "<span class='revenwarning'>You lack the essence to use that ability.</span>")
		return FALSE
	return TRUE

/mob/living/simple_animal/qareen/proc/unlock(essence_cost)
	if(essence_excess < essence_cost)
		return FALSE
	essence_excess -= essence_cost
	update_action_buttons_icon()
	return TRUE

/mob/living/simple_animal/qareen/proc/change_essence_amount(essence_amt, silent = FALSE, source = null)
	if(!src)
		return
	if(essence + essence_amt < 0)
		return
	essence = max(0, essence+essence_amt)
	update_health_hud()
	if(essence_amt > 0)
		essence_accumulated = max(0, essence_accumulated+essence_amt)
		essence_excess = max(0, essence_excess+essence_amt)
	update_action_buttons_icon()
	if(!silent)
		if(essence_amt > 0)
			to_chat(src, "<span class='revennotice'>Gained [essence_amt]E[source ? " from [source]":""].</span>")
		else
			to_chat(src, "<span class='revenminor'>Lost [essence_amt]E[source ? " from [source]":""].</span>")
	return 1

/mob/living/simple_animal/qareen/proc/telekinesis_cooldown_end()
	if(!telekinesis_cooldown)
		CRASH("telekinesis_cooldown_end ran when telekinesis_cooldown on [src] was false")
	else
		telekinesis_cooldown = FALSE

/mob/living/simple_animal/qareen/proc/death_reset()
	revealed = FALSE
	unreveal_time = 0
	mob_transforming = 0
	unstun_time = 0
	inhibited = FALSE
	draining = FALSE
	incorporeal_move = INCORPOREAL_MOVE_JAUNT
	invisibility = INVISIBILITY_QAREEN
	alpha=255
	stasis = FALSE


//reforming
/obj/item/ectoplasm/qareen
	name = "glimmering residue"
	desc = "A pile of fine blue dust. Small tendrils of violet mist swirl around it."
	icon = 'modular_splurt/icons/effects/effects.dmi'
	icon_state = "qareenEctoplasm"
	w_class = WEIGHT_CLASS_SMALL
	var/essence = 150 //the maximum essence of the reforming qareen
	var/reforming = TRUE
	var/inert = FALSE
	var/old_key //key of the previous qareen, will have first pick on reform.
	var/mob/living/simple_animal/qareen/qareen

/obj/item/ectoplasm/qareen/New()
	..()
	addtimer(CALLBACK(src, PROC_REF(try_reform)), 600)

/obj/item/ectoplasm/qareen/proc/scatter()
	qdel(src)

/obj/item/ectoplasm/qareen/proc/try_reform()
	if(reforming)
		reforming = FALSE
		reform()
	else
		inert = TRUE
		visible_message("<span class='warning'>[src] settles down and seems lifeless.</span>")

/obj/item/ectoplasm/qareen/attack_self(mob/user)
	if(!reforming || inert)
		return ..()
	user.visible_message("<span class='notice'>[user] scatters [src] in all directions.</span>", \
						 "<span class='notice'>You scatter [src] across the area. The particles slowly fade away.</span>")
	user.dropItemToGround(src)
	scatter()

/obj/item/ectoplasm/qareen/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	if(inert)
		return
	visible_message("<span class='notice'>[src] breaks into particles upon impact, which fade away to nothingness.</span>")
	scatter()

/obj/item/ectoplasm/qareen/examine(mob/user)
	. = ..()
	if(inert)
		. += "<span class='revennotice'>It seems inert.</span>"
	else if(reforming)
		. += "<span class='revenwarning'>It is shifting and distorted. It would be wise to destroy this.</span>"

/obj/item/ectoplasm/qareen/proc/reform()
	if(QDELETED(src) || QDELETED(qareen) || inert)
		return
	var/key_of_qareen = FALSE
	message_admins("Qareen ectoplasm was left undestroyed for 1 minute and is reforming into a new qareen.")
	forceMove(drop_location()) //In case it's in a backpack or someone's hand
	qareen.forceMove(loc)
	if(old_key)
		for(var/mob/M in GLOB.dead_mob_list)
			if(M.client && M.client.key == old_key) //Only recreates the mob if the mob the client is in is dead
				M.transfer_ckey(qareen, FALSE)
				key_of_qareen = TRUE
				break
	if(!key_of_qareen)
		message_admins("The new qareen's old client either could not be found or is in a new, living mob - grabbing a random candidate instead...")
		var/list/candidates = pollCandidatesForMob("Do you want to be [qareen.name] (reforming)?", ROLE_QAREEN, null, ROLE_QAREEN, 50, qareen)
		if(!LAZYLEN(candidates))
			qdel(qareen)
			message_admins("No candidates were found for the new qareen. Oh well!")
			inert = TRUE
			visible_message("<span class='revenwarning'>[src] settles down and seems lifeless.</span>")
			return
		var/mob/C = pick(candidates)
		C.transfer_ckey(qareen, FALSE)
		if(!qareen.key)
			qdel(qareen)
			message_admins("No ckey was found for the new qareen. Oh well!")
			inert = TRUE
			visible_message("<span class='revenwarning'>[src] settles down and seems lifeless.</span>")
			return

	message_admins("[qareen.key] has been [old_key == qareen.key ? "re":""]made into a qareen by reforming ectoplasm.")
	log_game("[qareen.key] was [old_key == qareen.key ? "re":""]made as a qareen by reforming ectoplasm.")
	visible_message("<span class='revenboldnotice'>[src] suddenly rises into the air before fading away.</span>")

	qareen.essence = essence
	qareen.essence_regen_cap = essence
	qareen.death_reset()
	qareen = null
	qdel(src)

/obj/item/ectoplasm/qareen/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is inhaling [src]! It looks like [user.ru_who()] trying to visit the shadow realm!</span>")
	scatter()
	return (OXYLOSS)

/obj/item/ectoplasm/qareen/Destroy()
	if(!QDELETED(qareen))
		qdel(qareen)
	..()

/* BlueMoon Edit Start: Qareens are stated to be able to do this too so I'm fixing this - Flauros
/mob/living/simple_animal/qareen/proc/qareenThrow(over, mob/user, obj/item/throwable)
*/
/proc/QareenThrow(over, mob/user, obj/item/throwable)
// BlueMoon Edit End
	var/mob/living/simple_animal/qareen/spooker = user
	if(!istype(throwable))
		return
	if(!throwable.anchored && !spooker.telekinesis_cooldown && spooker.essence > 20)
		if(7 < get_dist(throwable, spooker))
			return
		if(3 >=  get_dist(throwable, spooker))
			spooker.stun(10)
			spooker.reveal(25)
		else
			spooker.stun(20)
			spooker.reveal(50)
		spooker.change_essence_amount(-20, FALSE, "telekinesis")
		spooker.telekinesis_cooldown = TRUE
		throwable.float(TRUE, TRUE)
		sleep(20)
		throwable.DoRevenantThrowEffects(over)
		throwable.throw_at(over, 10, 2)
		ADD_TRAIT(throwable, TRAIT_SPOOKY_THROW, "qareen")
		log_combat(throwable, over, "spooky telekinesised at", throwable)
		var/obj/effect/temp_visual/telekinesis/T = new(get_turf(throwable))
		T.color = "#8715b4"
		addtimer(CALLBACK(spooker, TYPE_PROC_REF(/mob/living/simple_animal/qareen, telekinesis_cooldown_end)), 50)
		sleep(5)
		throwable.float(FALSE, TRUE)


//Use this for effects you want to happen when a qareen throws stuff, check the TRAIT_SPOOKY_THROW if you want to know if its still being thrown
/obj/item/proc/DoQareenThrowEffects(atom/target)
	return TRUE

//objectives		Reserved for later. - Gardelin0
//datum/objective/qareen
//	var/targetAmount = 100
//
//datum/objective/qareen/New()
//	targetAmount = rand(150,300)
//	explanation_text = "Absorb [targetAmount] of essence from this sector of space."
//	..()
//
//datum/objective/qareen/check_completion()
//	if(!isqareen(owner.current))
//		return FALSE
//	var/mob/living/simple_animal/qareen/R = owner.current
//	if(!R || R.stat == DEAD)
//		return FALSE
//	var/essence_stolen = R.essence_accumulated
//	if(essence_stolen < targetAmount)
//		return FALSE
//	return TRUE
//
//datum/objective/qareenFluff
//
//datum/objective/qareenFluff/New()
//	var/list/explanationTexts = list("Избегайте высасывания эссенции у всех на виду.",
//									 "Распространите заболевание похоти на тех, кого можете.",
//									 "Оставьте на полу как можно больше следов любовных жидкостей.",
//									 "Возбудите всех, кого можете.",
//	)
//	explanation_text = pick(explanationTexts)
//	..()
//
//datum/objective/qareenFluff/check_completion()
//	return TRUE
