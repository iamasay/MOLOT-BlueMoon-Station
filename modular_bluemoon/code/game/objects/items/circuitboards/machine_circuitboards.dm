/obj/item/circuitboard/machine/pdapainter
	name = "PDA painter (Machine Board)"
	icon_state = "service"
	build_path = /obj/machinery/pdapainter
	req_components = list(
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stack/sheet/glass = 2)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/aug_manipulator
	name = "Augment manipulator (Machine Board)"
	icon_state = "science"
	build_path = /obj/machinery/aug_manipulator
	req_components = list(
		/obj/item/stock_parts/micro_laser = 1,
		/obj/item/stack/cable_coil = 2,
		/obj/item/stack/sheet/glass = 2)
	needs_anchored = FALSE

// Плата для генератора полезных для робототехника жидкостей
/obj/item/circuitboard/machine/robo_liquid_generator
	name = "RoboLiquid Generator (Machine Board)"
	icon_state = "science"
	build_path = /obj/machinery/robo_liquid_generator
	desc = "Звучит достаточно инновационно?"
	req_components = list(
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stack/sheet/glass = 1)
	needs_anchored = FALSE
