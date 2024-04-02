
// --------------------------------------------------------------------------------
// ----------------- TERROR SPIDERS: T2 WIDOW TERROR ------------------------------
// --------------------------------------------------------------------------------
// -------------: ROLE: assassin, poisoner, DoT expert
// -------------: AI: attacks to inject its venom, then retreats. Will inject its enemies multiple times then hang back to ensure they die.
// -------------: SPECIAL: venom that does more damage the more of it is in you
// -------------: TO FIGHT IT: if bitten once, retreat, get charcoal/etc treatment, and come back with a gun.
// -------------: SPRITES FROM: FoS, https://www.paradisestation.org/forum/profile/335-fos

/mob/living/simple_animal/hostile/retaliate/poison/terror_spider/widow
	name = "Widow of Terror"
	desc = "An ominous-looking spider, black as the darkest night. It has merciless eyes, and a blood-red hourglass pattern on its back."
	ai_target_method = TS_DAMAGE_POISON
	icon_state = "terror_widow"
	icon_living = "terror_widow"
	icon_dead = "terror_widow_dead"
	speed = -0.1
	maxHealth = 120
	health = 120
	death_sound = 'sound/creatures/terrorspiders/death2.ogg'
	ranged = 1
	rapid = 2
	projectilesound = 'sound/creatures/terrorspiders/spit3.ogg'
	projectiletype = /obj/item/projectile/terrorspider/widow
	ranged_cooldown_time = 25
	melee_damage_lower = 10
	melee_damage_upper = 15
	web_type = /obj/structure/spider/terrorweb/widow
	special_abillity = list(/obj/effect/proc_holder/spell/aimed/fireball/smoke_spit,
							/obj/effect/proc_holder/spell/aimed/fireball/venom_spit)
	stat_attack = UNCONSCIOUS // ensures they will target people in crit, too!
	spider_tier = TS_TIER_2
	spider_intro_text = "Будучи Вдовой Ужаса, ваша цель - внести хаос на поле боя при помощи своих плевков, вы также смертоносны вблизи и с каждым укусом вводите в противников опасный яд. Несмотря на скорость и смертоносность, вы довольно хрупки, поэтому не стоит атаковать тяжело вооружённых противников!"

/mob/living/simple_animal/hostile/retaliate/poison/terror_spider/widow/spider_specialattack(mob/living/carbon/human/L, poisonable)
	L.AdjustSilence(10 SECONDS)
	if(!poisonable)
		return ..()
	if(L.reagents.has_reagent(/datum/reagent/terror_black_toxin, 100))
		return ..()
	var/inject_target = pick("chest", "head")
	if(L.IsStun() || L.can_inject(null, FALSE, inject_target, FALSE))
		L.reagents.add_reagent(/datum/reagent/terror_black_toxin, 33) // inject our special poison
		visible_message("<span class='danger'>[src] buries its long fangs deep into the [inject_target] of [target]!</span>")
	else
		L.reagents.add_reagent(/datum/reagent/terror_black_toxin, 20)
		visible_message("<span class='danger'>[src] pierces armour and buries its long fangs deep into the [inject_target] of [target]!</span>")
	L.attack_animal(src)
	if(!ckey && (!(target in enemies) || L.reagents.has_reagent(/datum/reagent/terror_black_toxin, 60)))
		step_away(src, L)
		step_away(src, L)
		LoseTarget()
		step_away(src, L)
		visible_message("<span class='notice'>[src] jumps away from [L]!</span>")


/obj/structure/spider/terrorweb/widow
	name = "sinister web"
	desc = "This web has beads of a dark fluid on its strands."

/obj/structure/spider/terrorweb/black/web_special_ability(mob/living/carbon/C)
	if(istype(C))
		if(!C.reagents.has_reagent("terror_black_toxin", 60))
			var/inject_target = pick("chest","head")
			if(C.can_inject(null, FALSE, inject_target, FALSE))
				to_chat(C, "<span class='danger'>[src] slices into you!</span>")
				C.reagents.add_reagent("terror_black_toxin", 45)

/obj/item/projectile/terrorspider/widow
	name = "widow venom"
	icon_state = "toxin5"
	damage = 15
	stamina = 24
