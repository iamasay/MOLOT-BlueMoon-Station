SUBSYSTEM_DEF(mobs)
	name = "Mobs"
	priority = FIRE_PRIORITY_MOBS
	flags = SS_KEEP_TIMING | SS_NO_INIT
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/currentrun = list()
	var/static/list/clients_by_zlevel[][]
	var/static/list/dead_players_by_zlevel[][] = list(list()) // Needs to support zlevel 1 here, MaxZChanged only happens when z2 is created and new_players can login before that.
	var/static/list/cubemonkeys = list()
	var/static/list/cheeserats = list()
	var/static/mobs_log_enabled = TRUE
	var/static/mobs_fire_count = 0

/datum/controller/subsystem/mobs/stat_entry(msg)
	msg = "P:[length(GLOB.mob_living_list)]"
	return ..()

/datum/controller/subsystem/mobs/proc/MaxZChanged()
	if (!islist(clients_by_zlevel))
		clients_by_zlevel = new /list(world.maxz,0)
		dead_players_by_zlevel = new /list(world.maxz,0)
	while (clients_by_zlevel.len < world.maxz)
		clients_by_zlevel.len++
		clients_by_zlevel[clients_by_zlevel.len] = list()
		dead_players_by_zlevel.len++
		dead_players_by_zlevel[dead_players_by_zlevel.len] = list()

/datum/controller/subsystem/mobs/fire(resumed = FALSE)
	var/seconds = wait * 0.1
	var/fire_start_time = world.timeofday

	var/current_runlevel = Master.current_runlevel

	if (!resumed)
		mobs_fire_count++

		var/copy_start = world.time
		// создаём новый список только при новом fire
		src.currentrun = GLOB.mob_living_list.Copy()
		var/list/mob_list_copy = src.currentrun.Copy()
		var/copy_time = world.time - copy_start

		if(mobs_log_enabled)
			log_mobs_data("FIRE_START", list(
				"resumed" = FALSE,
				"copy_time_ms" = copy_time,
				"mobs_count" = mob_list_copy.len,
				"fire_number" = mobs_fire_count,
				"world_time" = world.time,
				"runlevel" = current_runlevel
			))
		send_to_python_backend("start", list(
			"subsystem" = "mobs",
			"fire_number" = mobs_fire_count,
			"count" = src.currentrun.len,
			"copy_time_ms" = copy_time,
			"world_time" = world.time
		))

	// при resumed используем старый src.currentrun
	var/list/currentrun = src.currentrun
	var/list/results = list()
	while(currentrun.len)
		var/mob/living/L = currentrun[currentrun.len]
		currentrun.len--

		if(!L)
			if(mobs_log_enabled)
				log_mobs_data("NULL_MOB", list(
					"index" = currentrun.len
				))
			GLOB.mob_living_list.Remove(L)
			continue

		var/process_start = world.time
		L.Life(seconds, src.times_fired)
		var/process_time = world.time - process_start

		results += list(list(
			"ref" = REF(L),
			"type" = L.type,
			"name" = L.name,
			"health" = L.health,
			"max_health" = L.maxHealth,
			"stat" = L.stat,
			"x" = L.x,
			"y" = L.y,
			"z" = L.z,
			"process_time" = process_time
		))

		if (MC_TICK_CHECK)
			if(mobs_log_enabled)
				var/total_time = (world.timeofday - fire_start_time) * 100
				log_mobs_data("MC_TICK_CHECK_PAUSE", list(
					"processed_count" = (GLOB.mob_living_list.len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time" = total_time,
					"will_resume" = TRUE
				))
				send_to_python_backend("pause", list(
					"subsystem" = "mobs",
					"fire_number" = mobs_fire_count,
					"processed_count" = (GLOB.mob_living_list.len - currentrun.len),
					"remaining_count" = currentrun.len,
					"total_time_ms" = total_time,
				))
			return

	var/total_time = (world.timeofday - fire_start_time) * 100
	if(mobs_log_enabled)
		log_mobs_data("FIRE_END", list(
			"total_mobs_processed" = GLOB.mob_living_list.len,
			"total_time_ms" = total_time,
			"avg_time_per_mob" = (total_time / max(1, GLOB.mob_living_list.len)),
			"results_sample_count" = results.len,
			"first_result" = results.len > 0 ? results : null[1]
		))
		send_to_python_backend("end", list(
			"subsystem" = "mobs",
			"fire_number" = mobs_fire_count,
			"total_processed" = GLOB.mob_living_list.len,
			"total_time_ms" = total_time,
		))

/proc/log_mobs_data(event_type, data)
	var/timestamp = "[time2text(world.timeofday, "hh:mm:ss")]"
	var/json_data = json_encode(data)
	var/log_line = "[timestamp] [event_type]: [json_data]\n"

	WRITE_LOG("[GLOB.log_directory]/mobs_debug.log", log_line)
