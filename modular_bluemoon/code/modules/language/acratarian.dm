/datum/language/modular_bluemoon/acratarian
	name = LANGUAGE_ACRATARIAN
	desc = "A main language across the globe of Acratar, the planet of Acradors in Trios system. Primary spoken by all nations, like Rohai Empire, Irellian Republic and Norn. A form with much of gang-slang could be found in Corvex. (Используйте русскую букву для префикса)."
	icon = 'modular_bluemoon/icons/misc/language.dmi'
	icon_state = "acratarian"
	speech_verb = "snarls"
	ask_verb = "snarls"
	exclaim_verb = "growls"
	key = "ц"
	space_chance = 65
	default_priority = 90
	restricted = FALSE

	complex_language = TRUE

	syllables = list(
		"man", "tral", "corvum", "ahex", "gint", "morv", "karv", "raj", "khaz", "kurz",
		"dar", "jun", "tal", "acra", "trio", "dar", "marh", "foot", "tout", "prin", "empr",
		"rest", "ben", "die", "eine", "beson", "land", "sie", "zieg", "wohn", "komm",
		"nat", "norn", "roh", "irel", "anom", "mons", "see", "sam", "cresh", "ragh", "hal",
		"qara", "baq", "dyhn", "cez"
	)
	syllables_additions_chance = 95
	syllables_prefix = list(
		"ab", "bi", "con", "des", "ex", "irum", "pos", "wer", "ze", "gran", "un"
	)
	syllables_endings = list(
		"ish", "tas", "us", "ria", "to", "dia", "gio", "tum", "num", "tas",
		"is", "as", "u", "ri", "a", "di", "gi", "um", "mo", "tia"
	)
