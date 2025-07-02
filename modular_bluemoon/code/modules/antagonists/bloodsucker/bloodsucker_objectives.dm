// Иметь не менее определённого количества вассалов
/datum/objective/bloodsucker/gain_vassals/update_explanation_text()
	explanation_text = "Подчините себе не менее [target_amount] слуг."

/datum/objective/bloodsucker/gain_vassals/generate_objective()
	target_amount = rand(3,5)
	update_explanation_text()

//	УСЛОВИЯ ПОБЕДЫ
/datum/objective/bloodsucker/gain_vassals/check_completion()
	var/datum/antagonist/bloodsucker/antagdatum = owner.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)

	if(antagdatum?.count_vassals(owner) >= target_amount)
		return TRUE
	return FALSE
