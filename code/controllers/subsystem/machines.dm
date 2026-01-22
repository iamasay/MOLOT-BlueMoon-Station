GLOBAL_LIST_EMPTY(processing)
SUBSYSTEM_DEF(machines)
	name = "Machines"
	init_order = INIT_ORDER_MACHINES
	flags = SS_KEEP_TIMING
	wait = 2 SECONDS

	/// Assosciative list of all machines that exist.
	VAR_PRIVATE/list/machines_by_type = list()

	/// All machines, not just those that are processing.
	VAR_PRIVATE/list/all_machines = list()

	var/list/processing = list()
	var/list/currentrun = list()
	///List of all powernets on the server.
	var/list/datum/powernet/powernets = list()
	var/static/list/bluespaceminer_by_zlevel[][] //BLUEMOON ADD счётчик бс майнеров на z уровне
	var/static/machine_log_data = list()
	var/static/machine_log_enabled = TRUE
	var/static/machine_fire_count = 0

/datum/controller/subsystem/machines/Initialize()
	makepowernets()
	fire()
	return ..()

//BLUEMOON ADD счётчик бс майнеров на z уровне
/datum/controller/subsystem/machines/proc/MaxZChanged()
	if (!islist(bluespaceminer_by_zlevel))
		bluespaceminer_by_zlevel = new /list(world.maxz,0)
	while (SSmachines.bluespaceminer_by_zlevel.len < world.maxz)
		SSmachines.bluespaceminer_by_zlevel.len++
		SSmachines.bluespaceminer_by_zlevel[bluespaceminer_by_zlevel.len] = list()
//BLUEMOON ADD END

/datum/controller/subsystem/machines/proc/makepowernets()
	for(var/datum/powernet/power_network as anything in powernets)
		qdel(power_network)
	powernets.Cut()

	for(var/obj/structure/cable/power_cable as anything in GLOB.cable_list)
		if(!power_cable.powernet)
			var/datum/powernet/new_powernet = new()
			new_powernet.add_cable(power_cable)
			propagate_network(power_cable, power_cable.powernet)

/datum/controller/subsystem/machines/fire(resumed = FALSE)
	var/fire_start_time = world.timeofday
	if (!resumed)
		machine_fire_count++
		var/copy_start = world.time
		src.currentrun = src.processing.Copy()
		var/copy_time = world.time - copy_start

		if(machine_log_enabled)
			log_machine_data("FIRE_START", list(
				"resumed" = FALSE,
				"copy_time_ms" = copy_time,
				"machines_count" = src.currentrun.len,
				"fire_number" = machine_fire_count,
				"world_time" = world.time
			))
		send_to_python_backend("start", list(
			"subsystem" = "machines",
			"fire_number" = machine_fire_count,
			"count" = src.currentrun.len,
			"copy_time_ms" = copy_time,
			"world_time" = world.time
		))

	var/list/currentrun = src.currentrun
	var/list/results = list()

	while(currentrun.len)
		var/obj/machinery/O = currentrun[currentrun.len]
		currentrun.len--

		if(QDELETED(O))
			if(machine_log_enabled)
				log_machine_data("QDELETED", list(
					"object_type" = "[O.type]",
					"index" = currentrun.len
				))
			GLOB.processing -= O
			continue

		var/process_start = world.time
		O.process()
		var/process_time = world.time - process_start

		results += list(list(
			"ref" = REF(O),
			"type" = O.type,
			"process_time" = process_time,
			"x" = O.x,
			"y" = O.y,
			"z" = O.z,
			"active" = O.anchored // пример статуса
		))

		if (MC_TICK_CHECK)
			if(machine_log_enabled)
				var/total_time = (world.timeofday - fire_start_time) * 100
				log_machine_data("MC_TICK_CHECK_PAUSE", list(
					"processed_count" = (src.processing.len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time" = total_time,
					"will_resume" = TRUE
				))
				send_to_python_backend("pause", list(
					"subsystem" = "machines",
					"fire_number" = machine_fire_count,
					"processed_count" = (src.processing.len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time_ms" = total_time,
					"will_resume" = TRUE
				))
			return

	var/total_time = (world.timeofday - fire_start_time) * 100
	if(machine_log_enabled)
		log_machine_data("FIRE_END", list(
			"total_machines_processed" = src.processing.len,
			"total_time_ms" = total_time,
			"avg_time_per_machine" = (total_time / max(1, src.processing.len)),
			"results_sample" = results.len > 0 ? results : null[1]
		))
		send_to_python_backend("end", list(
			"subsystem" = "machines",
			"fire_number" = machine_fire_count,
			"total_processed" = src.processing.len,
			"total_time_ms" = total_time,
		))

/proc/log_machine_data(event_type, data)
	var/timestamp = "[time2text(world.timeofday, "hh:mm:ss")]"
	var/json_data = json_encode(data)
	var/log_line = "[timestamp] [event_type]: [json_data]\n"

	// В файл
	WRITE_LOG("[GLOB.log_directory]/machines_debug.log", log_line)

/// Registers a machine with the machine subsystem; should only be called by the machine itself during its creation.
/datum/controller/subsystem/machines/proc/register_machine(obj/machinery/machine)
	LAZYADD(machines_by_type[machine.type], machine)
	all_machines |= machine

/// Removes a machine from the machine subsystem; should only be called by the machine itself inside Destroy.
/datum/controller/subsystem/machines/proc/unregister_machine(obj/machinery/machine)
	var/list/existing = machines_by_type[machine.type]
	existing -= machine
	if(!length(existing))
		machines_by_type -= machine.type
	all_machines -= machine

/// Gets a list of all machines that are either the passed type or a subtype.
/datum/controller/subsystem/machines/proc/get_machines_by_type_and_subtypes(obj/machinery/machine_type)
	if(!ispath(machine_type))
		machine_type = machine_type.type
	if(!ispath(machine_type, /obj/machinery))
		CRASH("called get_machines_by_type_and_subtypes with a non-machine type [machine_type]")
	var/list/machines = list()
	for(var/next_type in typesof(machine_type))
		var/list/found_machines = machines_by_type[next_type]
		if(found_machines)
			machines += found_machines
	return machines

/// Gets a list of all machines that are the exact passed type.
/datum/controller/subsystem/machines/proc/get_machines_by_type(obj/machinery/machine_type)
	if(!ispath(machine_type))
		machine_type = machine_type.type
	if(!ispath(machine_type, /obj/machinery))
		CRASH("called get_machines_by_type with a non-machine type [machine_type]")

	var/list/machines = machines_by_type[machine_type]
	return machines?.Copy() || list()

/datum/controller/subsystem/machines/proc/get_all_machines()
	return all_machines.Copy()

/datum/controller/subsystem/machines/stat_entry(msg)
	msg = "M:[length(all_machines)]|MT:[length(machines_by_type)]|PM:[length(processing)]|PN:[length(powernets)]"
	return ..()

/datum/controller/subsystem/machines/proc/setup_template_powernets(list/cables)
	var/obj/structure/cable/PC
	for(var/A in 1 to cables.len)
		PC = cables[A]
		if(!PC.powernet)
			var/datum/powernet/NewPN = new()
			NewPN.add_cable(PC)
			propagate_network(PC,PC.powernet)

/datum/controller/subsystem/machines/Recover()
	if(islist(SSmachines.processing))
		processing = SSmachines.processing
	if(islist(SSmachines.powernets))
		powernets = SSmachines.powernets
	if(islist(SSmachines.all_machines))
		all_machines = SSmachines.all_machines
	if(islist(SSmachines.machines_by_type))
		machines_by_type = SSmachines.machines_by_type
