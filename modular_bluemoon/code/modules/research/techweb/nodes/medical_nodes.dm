/datum/techweb_node/syndicate_augments
	id = "syndicate_augments"
	display_name = "Syndicate-grade Augmentations"
	description = "Experimental schemes of syndicate augmentations reverse-engineered by NT RnD department."
	prereq_ids = list("syndicate_basic")
	design_ids = list("ci-mantis", "ci-scanner", "ci-pumpextreme", "ci-binolenses")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/techweb_node/syndicate_healing_augs
	id = "syndicate_augments_healing"
	display_name = "Revitilizer-line Augmentations"
	description = "Brand-new healing augmentations, developed earlier by Syndicate RnD department."
	prereq_ids = list("syndicate_augments")
	design_ids = list("ci-healerext", "ci-healerint","ci-cortex")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
