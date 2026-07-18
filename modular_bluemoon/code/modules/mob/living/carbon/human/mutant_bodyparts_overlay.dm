GLOBAL_LIST_INIT(ignored_mutant_pseudo_parts, list(
    "meat_type",
    "mam_body_markings",
    "insect_markings"
))

/mob/living/carbon/human
    /// виртуальные части тела по имени
    var/list/mutant_part_appearances = list()

/// Сбросить сохранённые ссылки перед новым пересбором мутантских частей.
/mob/living/carbon/human/proc/clear_mutant_part_appearances()
    mutant_part_appearances = list()

/// Зарегистрировать, что overlay M относится к логической части tag.
/mob/living/carbon/human/proc/register_mutant_part_appearance(tag, mutable_appearance/M)
    if(!tag || !M)
        return
    if(!mutant_part_appearances)
        mutant_part_appearances = list()
    if(!mutant_part_appearances[tag])
        mutant_part_appearances[tag] = list()
    mutant_part_appearances[tag] += M

/mob/living/carbon/human/proc/get_mutant_part_appearances(tag)
    if(!mutant_part_appearances)
        return null
    return mutant_part_appearances[tag]

/mob/living/carbon/human/proc/get_mutant_part_appearance(tag)
    var/list/L = get_mutant_part_appearances(tag)
    if(L && L.len)
        return L[1]
    return null

/mob/living/carbon/human/proc/get_tail_overlays()
    var/list/out = list()

    var/list/tail_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

    for(var/L in tail_layers)
        var/entry = overlays_standing[L]
        if(!entry)
            continue

        if(istype(entry, /list))
            var/list/LST = entry
            for(var/mutable_appearance/M in LST)
                if(findtext("[M.icon]", "mam_tails.dmi") || findtext("[M.icon_state]", "m_tail_"))
                    out += M
        else if(istype(entry, /mutable_appearance))
            var/mutable_appearance/M2 = entry
            if(findtext("[M2.icon]", "mam_tails.dmi") || findtext("[M2.icon_state]", "m_tail_"))
                out += M2

    return out

/mob/living/carbon/human/proc/get_tail_overlay()
    var/list/tails = get_tail_overlays()
    if(tails && tails.len)
        return tails[1]
    return null
