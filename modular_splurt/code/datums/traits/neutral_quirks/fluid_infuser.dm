/datum/quirk/fluid_infuser
	name = "Тядзин"
	desc = "Вы не упустили возможность приобрести новый жидкостный индуктор от NanoTrasen, как только он был выпущен, и теперь можете заскочить на станцию с изменяемым грудным молочком!"
	flavor_quirk = TRUE
	value = 0

/datum/quirk/fluid_infuser/on_spawn()
	. = ..()
	var/obj/item/implant/genital_fluid/put_in = new
	put_in.implant(quirk_holder, null, TRUE, TRUE)
