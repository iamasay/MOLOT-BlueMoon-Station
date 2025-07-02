
// --------------------------------------------------------------------------------
// ----------------- TERROR SPIDERS: T3 PRINCE OF TERROR --------------------------
// --------------------------------------------------------------------------------
// -------------: ROLE: boss
// -------------: AI: no special ai
// -------------: SPECIAL: massive health
// -------------: TO FIGHT IT: a squad of at least 4 people with laser rifles.
// -------------: SPRITES FROM: Travelling Merchant, https://www.paradisestation.org/forum/profile/2715-travelling-merchant/

/mob/living/simple_animal/hostile/retaliate/poison/terror_spider/prince
	name = "Prince of Terror"
	desc = "An enormous, terrifying spider. It looks like it is judging everything it sees. Its hide seems armored, and it bears the scars of many battles."
	ai_target_method = TS_DAMAGE_BRUTE
	icon_state = "terror_allblack"
	icon_living = "terror_allblack"
	icon_dead = "terror_allblack_dead"
	maxHealth = 500
	health = 500
	speed = -0.1
	damage_coeff = list(BRUTE = 0.4, BURN = 0.7, TOX = 1, CLONE = 0, STAMINA = 0, OXY = 1)
	deathmessage =  "morbidly growls, flailing and crumbling as death finally washes away the burning hatred in it's eyes."
	death_sound = 'sound/creatures/terrorspiders/prince_dead.ogg'
	regeneration = 0 //no healing on life, prince should play agressive
	force_threshold = 30
	melee_damage_lower = 35
	melee_damage_upper = 45
	armour_penetration = 20
	wall_destroy_hardness = 10
	obj_damage = 100
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	var/delimb_chance = 10
	attack_sound = 'sound/creatures/terrorspiders/bite2.ogg'
	ventcrawler = 0
	ai_ventcrawls = FALSE
	idle_ventcrawl_chance = 0
	spider_tier = TS_TIER_3
	spider_opens_doors = 2
	web_type = null
	special_abillity = list(/obj/effect/proc_holder/spell/aoe_turf/terror_slam)
	spider_intro_text = "Будучи Принцом Ужаса, ваша задача - устроить резню. У вас больше здоровья и урона, чем у любого другого паука, вы можете отрывать конечности, быстро уничтожать мехи, однако, если вы не будете пожирать трупы, сразу потеряете способность регенерировать. Ваша активная способность оглушает противников в радиусе двух плиток, попутно замедляя их."
	gender = MALE
	move_resist = MOVE_FORCE_STRONG // no more pushing a several hundred if not thousand pound spider

/mob/living/simple_animal/hostile/retaliate/poison/terror_spider/prince/death(gibbed)
	if(can_die() && !hasdied && spider_uo71)
		UnlockBlastDoors("UO71_SciStorage")
	return ..()

/mob/living/simple_animal/hostile/retaliate/poison/terror_spider/prince/spider_specialattack(mob/living/carbon/human/L)
	L.adjustStaminaLoss(35) //3 hits for stam crit
	if(prob(delimb_chance))
		if(L.stat != DEAD) //no dismemberment for dead carbons, less griefy
			do_attack_animation(L)
			L.adjustBruteLoss(25)
			playsound(src, 'sound/creatures/terrorspiders/rip.ogg', 100, 1)
			var/obj/item/bodypart/NB = pick(L.bodyparts)
			visible_message("<span class='warning'>[src] Tears appart the [NB.name] of [L] with his razor sharp jaws!</span>")
			NB.drop_limb()  //dismemberment
	else
		..()
