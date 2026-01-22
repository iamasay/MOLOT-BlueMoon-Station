SUBSYSTEM_DEF(npcpool)
	name = "NPC Pool"
	flags = SS_KEEP_TIMING | SS_NO_INIT
	priority = FIRE_PRIORITY_NPC
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/currentrun = list()
	/// catches sleeping
	var/invoking = FALSE
	/// Invoke start time
	var/invoke_start = 0
	var/static/npcpool_log_enabled = TRUE
	var/static/npcpool_fire_count = 0

/datum/controller/subsystem/npcpool/stat_entry(msg)
	var/list/activelist = GLOB.simple_animals[AI_ON]
	msg = "NPCS:[length(activelist)]"
	return ..()

/datum/controller/subsystem/npcpool/fire(resumed = FALSE)
	var/fire_start_time = world.timeofday

	if (!resumed)
		npcpool_fire_count++

		var/copy_start = world.time
		var/list/activelist = GLOB.simple_animals[AI_ON]
		src.currentrun = activelist.Copy()
		var/copy_time = world.time - copy_start

		if(npcpool_log_enabled)
			log_npcpool_data("FIRE_START", list(
				"resumed" = FALSE,
				"copy_time_ms" = copy_time,
				"npc_count" = src.currentrun.len,
				"fire_number" = npcpool_fire_count,
				"world_time" = world.time,
				"active_by_ai_status" = list(
					"AI_ON" = LAZYLEN(GLOB.simple_animals[AI_ON]),
					"AI_IDLE" = LAZYLEN(GLOB.simple_animals[AI_IDLE]),
					"AI_OFF" = LAZYLEN(GLOB.simple_animals[AI_OFF]),
					"AI_Z_OFF" = LAZYLEN(GLOB.simple_animals[AI_Z_OFF])
				)
			))
		send_to_python_backend("start", list(
			"subsystem" = "npcpool",
			"fire_number" = npcpool_fire_count,
			"count" = src.currentrun.len,
			"copy_time_ms" = copy_time,
			"world_time" = world.time
		))

	var/list/currentrun = src.currentrun
	var/removes_nulls = FALSE
	var/list/results = list()
	var/qdeleted_count = 0

	while(currentrun.len)
		var/mob/living/simple_animal/SA = currentrun[currentrun.len]
		--currentrun.len

		if(QDELETED(SA))
			qdeleted_count++
			if(!removes_nulls)
				removeNullsFromList(GLOB.simple_animals[AI_ON])
				removes_nulls = TRUE
				if(npcpool_log_enabled)
					log_npcpool_data("CLEANUP_NULLS", list(
						"trigger_index" = currentrun.len,
						"total_nulls_removed" = qdeleted_count
					))
			continue

		var/process_start = world.time
		invoking = TRUE
		invoke_start = world.time
		INVOKE_ASYNC(src, PROC_REF(invoke_process), SA)

		if(invoking)
			if(npcpool_log_enabled)
				log_npcpool_data("SLEEP_VIOLATION", list(
					"npc_ref" = REF(SA),
					"npc_type" = SA.type,
					"npc_name" = SA.name
				))
			stack_trace("WARNING: [SA] ([SA.type]) slept during NPCPool processing.")
			invoking = FALSE

		var/process_time = world.time - process_start

		results += list(list(
			"ref" = REF(SA),
			"type" = SA.type,
			"name" = SA.name,
			"stat" = SA.stat,
			"x" = SA.x,
			"y" = SA.y,
			"z" = SA.z,
			"ckey" = SA.ckey,
			"process_time" = process_time,
			"ai_status" = SA.AIStatus
		))

		if (MC_TICK_CHECK)
			if(npcpool_log_enabled)
				var/total_time = (world.timeofday - fire_start_time) * 100
				log_npcpool_data("MC_TICK_CHECK_PAUSE", list(
					"processed_count" = (GLOB.simple_animals[AI_ON].len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time" = total_time,
					"qdeleted_during_cycle" = qdeleted_count,
					"will_resume" = TRUE
				))
				send_to_python_backend("pause", list(
					"subsystem" = "npcpool",
					"fire_number" = npcpool_fire_count,
					"processed_count" = (GLOB.simple_animals[AI_ON].len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time_ms" = total_time
				))
			return

	var/total_time = (world.timeofday - fire_start_time) * 100
	if(npcpool_log_enabled)
		log_npcpool_data("FIRE_END", list(
			"total_npc_processed" = GLOB.simple_animals[AI_ON].len,
			"total_time_ms" = total_time,
			"avg_time_per_npc" = (total_time / max(1, GLOB.simple_animals[AI_ON].len)),
			"qdeleted_count" = qdeleted_count,
			"results_count" = results.len,
			"first_result" = results.len > 0 ? results : null[1]
		))
		send_to_python_backend("end", list(
			"subsystem" = "npcpool",
			"fire_number" = npcpool_fire_count,
			"total_processed" = GLOB.simple_animals[AI_ON].len,
			"total_time_ms" = total_time,
		))

/proc/log_npcpool_data(event_type, data)
	var/timestamp = "[time2text(world.timeofday, "hh:mm:ss")]"
	var/json_data = json_encode(data)
	var/log_line = "[timestamp] [event_type]: [json_data]\n"

	WRITE_LOG("[GLOB.log_directory]/npcpool.log", log_line)

/datum/controller/subsystem/npcpool/proc/invoke_process(mob/living/simple_animal/SA)
	if(!SA.ckey && !SA.mob_transforming)
		if(SA.stat != DEAD)
			SA.handle_automated_movement()
			if(QDELETED(SA))
				invoking = FALSE
				return
		if(SA.stat != DEAD)
			SA.handle_automated_action()
		if(SA.stat != DEAD)
			SA.handle_automated_speech()
	invoking = FALSE
