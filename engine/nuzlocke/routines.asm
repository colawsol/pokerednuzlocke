LandmarkIndex:: ; find corresponding LANDMARK for wCurMap
	cp REDS_HOUSE_1F
	ret c ; return if current map is not INDOOR_MAP
	ld hl, LandmarkIndexTable
.search ; search for corresponding LANDMARK
	cp [hl]
	jr c, .done ; jump if LANDMARK found
	inc hl
	inc hl
	jr .search
.done
	inc hl
	ld a, [hl] ; load a with corresponding LANDMARK
	ret

EvolutionIndex:: ; find corresponding EVOLUTION for wEnemyMonSpecies
	ld hl, EvolutionIndexTable
.search ; search for corresponding EVOLUTION
	cp [hl]
	jr c, .done ; jump if EVOLUTION found
	inc hl
	inc hl
	jr .search
.done
	inc hl
	ld a, [hl] ; load a with corresponding EVOLUTION
	ret

SetEncounter:: ; set EncounterFlag for corresponding LANDMARK
	ld a, [wNuzlockeFlags]
	bit 0, a ; check Nuzlocke state
	ret z ; return if Nuzlocke state not set
	ld a, [wCurMap] ; taken from missable_objects (start)
	call LandmarkIndex
	ld c, a
	ld b, FLAG_SET
	ld hl, wEncounterFlags
	predef FlagActionPredef ; taken from missable_objects (end)
	ret

SetEvolution:: ; set EvolutionFlag for corresponding EVOLUTION
	ld a, [wEnemyMonSpecies]
	call EvolutionIndex
	ld c, a
	ld b, FLAG_SET
	ld hl, wEvolutionFlags
	predef FlagActionPredef
	ret

HadEncounter:: ; check EncounterFlag for corresponding LANDMARK
	ld a, [wCurMap] ; taken from missable_objects (start)
	call LandmarkIndex
	ld c, a
	ld b, FLAG_TEST
	ld hl, wEncounterFlags
	predef FlagActionPredef ; taken from missable_objects (end)
	ld e, c
	ret

OwnEvolution:: ; check EvolutionFlag for corresponding EVOLUTION
	ld a, [wEnemyMonSpecies]
	call EvolutionIndex
	ld c, a
	ld b, FLAG_TEST
	ld hl, wEvolutionFlags
	predef FlagActionPredef
	ld e, c
	ret

INCLUDE "engine/nuzlocke/index_tables.asm"
