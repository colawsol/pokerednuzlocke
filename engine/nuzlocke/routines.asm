SetEncounter:: ; set EncounterFlag for corresponding LANDMARK
	ld a, [wNuzlockeFlags]
	bit 0, a ; check Nuzlocke state
	ret z ; return if Nuzlocke state not set
	ld a, [wCurMapLandmark]
	ld c, a ; taken from missable_objects (start)
	ld b, FLAG_SET
	ld hl, wEncounterFlags
	predef FlagActionPredef ; taken from missable_objects (end)
	ret

SetEvolution:: ; set EvolutionFlag for corresponding EVOLUTION
	ld a, [wMonHEvolution]
	ld c, a
	ld b, FLAG_SET
	ld hl, wEvolutionFlags
	predef FlagActionPredef
	ret

HadEncounter:: ; check EncounterFlag for corresponding LANDMARK
	ld a, [wCurMapLandmark]
	ld c, a ; taken from missable_objects (start)
	ld b, FLAG_TEST
	ld hl, wEncounterFlags
	predef FlagActionPredef ; taken from missable_objects (end)
	ld e, c
	ret

OwnEvolution:: ; check EvolutionFlag for corresponding EVOLUTION
	ld a, [wCurMonEvolution]
	ld c, a
	ld b, FLAG_TEST
	ld hl, wEvolutionFlags
	predef FlagActionPredef
	ld e, c
	ret
