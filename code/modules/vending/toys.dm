/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\code\modules\vending\donksofttoyvendor.dm'
/obj/machinery/vending/donksofttoyvendor
	name = "\improper Donksoft Toy Vendor"
	desc = "Ages 8 and up approved vendor that dispenses toys."
	icon_state = "syndi"
	product_slogans = "Получите свои крутые игрушки сегодня!;Запустите действующего охотника сегодня!;Качественное игрушечное оружие по дешевым ценам!;Отдайте это ГП, чтобы получить бесплатный доступ!;Отдайте это ГСБ, чтобы получить путёвку в Пермабриг!;Почувствуйте себя сильным со своими игрушками!;Выразите своего внутреннего ребенка сегодня!;Игрушечное оружие не убивает людей, но действующие охотники убивают!;Кому нужна ответственность, когда у вас есть игрушечное оружие?;Сделайте свое следующее убийство веселым!!"
	vend_reply = "Возвращайся!!"
	light_mask = "donksoft-light-mask"
	circuit = /obj/item/circuitboard/machine/vending/donksofttoyvendor
	products = list(
		/obj/item/gun/ballistic/automatic/toy/unrestricted = 10,
		/obj/item/gun/ballistic/automatic/toy/pistol/unrestricted = 10,
		/obj/item/gun/ballistic/shotgun/toy/unrestricted = 10,
		/obj/item/toy/sword = 10,
		/obj/item/ammo_box/foambox = 20,
		/obj/item/toy/foamblade = 10,
		/obj/item/toy/syndicateballoon = 10,
		/obj/item/clothing/suit/syndicatefake = 5,
		/obj/item/clothing/head/syndicatefake = 5)
	contraband = list(
		/obj/item/gun/ballistic/shotgun/toy/crossbow = 10,
		/obj/item/gun/ballistic/automatic/c20r/toy/unrestricted = 10,
		/obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted = 10,
		/obj/item/toy/katana = 10,
		/obj/item/dualsaber/toy = 5)
	refill_canister = /obj/item/vending_refill/donksoft
	default_price = PRICE_ABOVE_NORMAL
	extra_price = PRICE_EXPENSIVE
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/donksoft
	machine_name = "Donksoft Toy Vendor"
	icon_state = "refill_donksoft"
*/
