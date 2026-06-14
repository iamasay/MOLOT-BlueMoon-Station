/datum/component/latex_mimicry
	dupe_mode = COMPONENT_DUPE_UNIQUE
	var/valid_object_type = /obj/item
	var/mob/living/simple_animal/latexmob/stored_latexmob

/datum/component/latex_mimicry/Initialize(object_type)

/datum/component/latex_mimicry/chair
	valid_object_type = /obj/structure/chair

/datum/component/latex_mimicry/book
	valid_object_type = /obj/item/book

/datum/component/latex_mimicry/clothing
	valid_object_type = /obj/item/clothing

/datum/component/latex_mimicry/food_container
	valid_object_type = /obj/item/reagent_containers/food

/datum/component/latex_mimicry/closet
	valid_object_type = /obj/structure/closet

/datum/component/latex_mimicry/sleeper
	valid_object_type = /obj/machinery/sleeper

/datum/component/latex_mimicry/crate
	valid_object_type = /obj/structure/closet/crate

/datum/component/latex_mimicry/vending_machine
	valid_object_type = /obj/machinery/vending

/datum/component/latex_mimicry/computer
	valid_object_type = /obj/machinery/computer

/datum/component/latex_mimicry/washing_machine
	valid_object_type = /obj/machinery/washing_machine
