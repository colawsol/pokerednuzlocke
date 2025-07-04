DisplayNuzlockeOptionMenus:
	ld a, 1
	ld [wNuzlockeOptionsEnforceNicknamingCursorX], a
	ld [wNuzlockeOptionsAfterRival1LossCursorX], a
	ld [wNuzlockeOptionsDuplicatesClauseCursorX], a
	ld [wNuzlockeOptionsEncounterMapsCursorX], a
DisplayNuzlockeOptionMenu1:
	call ClearScreen
	hlcoord 0, 0 ; taken from DisplayOptionMenu (start)
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 0, 5
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 0, 10
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, EnforceNicknamingOptionText
	call PlaceString
	hlcoord 1, 6
	ld de, AfterRival1LossOptionText
	call PlaceString
	hlcoord 1, 11
	ld de, DuplicatesClauseOptionText
	call PlaceString
	hlcoord 2, 16
	ld de, NuzlockeOptionMenuBackText
	call PlaceString
	hlcoord 11, 16
	ld de, NuzlockeOptionMenuNextText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	ld a, 3
	ld [wTopMenuItemY], a
	call SetNuzlockeOptionMenu1CursorPositions
	ld a, [wNuzlockeOptionsEnforceNicknamingCursorX]
	ld [wTopMenuItemX], a
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.loop
	call PlaceMenuCursor
	call SetNuzlockeOptionsFromCursorPositions
.getJoypadStateLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and PAD_A | PAD_B | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	jr z, .getJoypadStateLoop
	bit B_PAD_B, b
	jr nz, .pressedB
	bit B_PAD_A, b
	jr z, .checkDirectionKeys
	ld a, [wTopMenuItemY]
	cp 16 ; is the cursor on Back/Next?
	jr nz, .loop
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX]
	dec a
	push af ; to preserve af
	ld a, SFX_PRESS_AB
	call PlaySound
	pop af ; to restore af
	jp nz, DisplayNuzlockeOptionMenu2
.exitMenu
	ret
.pressedB
	ld a, 1
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	jr .exitMenu
.eraseOldMenuCursor
	ld [wTopMenuItemX], a
	call EraseMenuCursor
	jr .loop
.checkDirectionKeys
	ld a, [wTopMenuItemY]
	bit B_PAD_DOWN, b
	jr nz, .downPressed
	bit B_PAD_UP, b
	jr nz, .upPressed
	cp 8 ; cursor in After Rival 1 Loss section?
	jr z, .cursorInAfterRival1Loss
	cp 13 ; cursor in Duplicates Clause?
	jr z, .cursorInDuplicatesClause
	cp 16 ; cursor on Back/Next?
	jp z, .cursorOnBackNext
.cursorInEnforceNicknaming
	ld a, [wNuzlockeOptionsEnforceNicknamingCursorX] ; Enforce Nicknaming cursor X coordinate
	xor $0B
	ld [wNuzlockeOptionsEnforceNicknamingCursorX], a
	jr .eraseOldMenuCursor
.downPressed
	cp 16
	ld b, -13
	ld hl, wNuzlockeOptionsEnforceNicknamingCursorX
	jr z, .updateMenuVariables
	ld b, 5
	cp 3
	ld hl, wNuzlockeOptionsAfterRival1LossCursorX
	jr z, .updateMenuVariables
	cp 8
	ld hl, wNuzlockeOptionsDuplicatesClauseCursorX
	jr z, .updateMenuVariables
	ld b, 3
	ld hl, wNuzlockeOptionsBackNextConfirmCursorX
	jr .updateMenuVariables
.upPressed
	cp 8
	ld b, -5
	ld hl, wNuzlockeOptionsEnforceNicknamingCursorX
	jr z, .updateMenuVariables
	cp 13
	ld hl, wNuzlockeOptionsAfterRival1LossCursorX
	jr z, .updateMenuVariables
	cp 16
	ld b, -3
	ld hl, wNuzlockeOptionsDuplicatesClauseCursorX
	jr z, .updateMenuVariables
	ld b, 13
	ld hl, wNuzlockeOptionsBackNextConfirmCursorX
.updateMenuVariables
	add b
	ld [wTopMenuItemY], a
	ld a, [hl]
	ld [wTopMenuItemX], a
	call PlaceUnfilledArrowMenuCursor
	jp .loop
.cursorInAfterRival1Loss
	ld a, [wNuzlockeOptionsAfterRival1LossCursorX] ; After Rival 1 Loss cursor X coordinate
	xor $0B
	ld [wNuzlockeOptionsAfterRival1LossCursorX], a
	jr .eraseOldMenuCursor
.cursorInDuplicatesClause
	bit B_PAD_LEFT, b
	jr nz, .pressedLeftInDuplicatesClause
	jr .pressedRightInDuplicatesClause
.pressedLeftInDuplicatesClause
	ld a, [wNuzlockeOptionsDuplicatesClauseCursorX] ; Duplicates Clause cursor X coordinate
	cp 1
	jr z, .updateDuplicatesClauseXCoord
	cp 7
	jr nz, .fromOffToEnforce
	sub 6
	jr .updateDuplicatesClauseXCoord
.fromOffToEnforce
	sub 8
	jr .updateDuplicatesClauseXCoord
.pressedRightInDuplicatesClause
	ld a, [wNuzlockeOptionsDuplicatesClauseCursorX] ; Duplicates Clause cursor X coordinate
	cp 15
	jr z, .updateDuplicatesClauseXCoord
	cp 7
	jr nz, .fromAllowToEnforce
	add 8
	jr .updateDuplicatesClauseXCoord
.fromAllowToEnforce
	add 6
.updateDuplicatesClauseXCoord
	ld [wNuzlockeOptionsDuplicatesClauseCursorX], a ; Duplicates Clause cursor X coordinate
	jp .eraseOldMenuCursor
.cursorOnBackNext
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX] ; Back/Next cursor X coordinate
	xor $0B
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	jp .eraseOldMenuCursor ; taken from DisplayOptionMenu (end)

DisplayNuzlockeOptionMenu2:
	call ClearScreen
	hlcoord 0, 0 ; taken from DisplayOptionMenu (start)
	ld b, 3
	ld c, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, EncounterMapsOptionText
	call PlaceString
	hlcoord 2, 16
	ld de, NuzlockeOptionMenuBackText
	call PlaceString
	hlcoord 11, 16
	ld de, NuzlockeOptionMenuConfirmText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	ld a, 3
	ld [wTopMenuItemY], a
	call SetNuzlockeOptionMenu2CursorPositions
	ld a, [wNuzlockeOptionsEncounterMapsCursorX]
	ld [wTopMenuItemX], a
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.loop
	call PlaceMenuCursor
	call SetNuzlockeOptionsFromCursorPositions
.getJoypadStateLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and PAD_A | PAD_B | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	jr z, .getJoypadStateLoop
	bit B_PAD_B, b
	jr nz, .pressedB
	bit B_PAD_A, b
	jr z, .checkDirectionKeys
	ld a, [wTopMenuItemY]
	cp 16 ; is the cursor on Back/Confirm?
	jr nz, .loop
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX]
	dec a
	push af ; to preserve af
	ld a, SFX_PRESS_AB
	call PlaySound
	pop af ; to restore af
	jp z, DisplayNuzlockeOptionMenu1
.exitMenu ; no longer used for jumps but left for clarity
	ret
.pressedB
	ld a, 1
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	jp DisplayNuzlockeOptionMenu1
.eraseOldMenuCursor
	ld [wTopMenuItemX], a
	call EraseMenuCursor
	jr .loop
.checkDirectionKeys
	ld a, [wTopMenuItemY]
	bit B_PAD_DOWN, b
	jr nz, .downPressed
	bit B_PAD_UP, b
	jr nz, .upPressed
	cp 16 ; cursor on Back?
	jp z, .cursorInBackConfirm
.cursorInEncounterMaps
	ld a, [wNuzlockeOptionsEncounterMapsCursorX] ; Encounter Maps cursor X coordinate
	xor $0B
	ld [wNuzlockeOptionsEncounterMapsCursorX], a
	jr .eraseOldMenuCursor
.downPressed
	cp 16
	ld b, -13
	ld hl, wNuzlockeOptionsEncounterMapsCursorX
	jr z, .updateMenuVariables
	ld b, 13
	ld hl, wNuzlockeOptionsBackNextConfirmCursorX
	jr .updateMenuVariables
.upPressed
	cp 16
	ld b, -13
	ld hl, wNuzlockeOptionsEncounterMapsCursorX
	jr z, .updateMenuVariables
	ld b, 13
	ld hl, wNuzlockeOptionsBackNextConfirmCursorX
.updateMenuVariables
	add b
	ld [wTopMenuItemY], a
	ld a, [hl]
	ld [wTopMenuItemX], a
	call PlaceUnfilledArrowMenuCursor
	jp .loop
.cursorInBackConfirm
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX] ; Back/Next cursor X coordinate
	xor $0B
	ld [wNuzlockeOptionsBackNextConfirmCursorX], a
	jp .eraseOldMenuCursor

EnforceNicknamingOptionText:
	db   "ENFORCE NICKNAMING"
	next " OFF      ON@"

AfterRival1LossOptionText:
	db   "AFTER RIVAL 1 LOSS"
	next " HEAL     BLACKOUT@"

DuplicatesClauseOptionText:
	db   "DUPLICATES CLAUSE"
	next " ALLOW ENFORCE OFF@"

EncounterMapsOptionText:
	db   "ENCOUNTER MAPS"
	next " SPLIT    LINK@"

NuzlockeOptionMenuBackText:
	db "BACK@"

NuzlockeOptionMenuNextText:
	db "NEXT@"

NuzlockeOptionMenuConfirmText:
	db "CONFIRM@" ; taken from DisplayOptionMenu (end)

; sets the NuzlockeOptions variable according to the current placement of the menu cursors in the Nuzlocke options menu
SetNuzlockeOptionsFromCursorPositions: ; taken from SetOptionsFromCursorPositions (start)
	ld a, [wNuzlockeOptions]
	ld d, a
	ld a, [wNuzlockeOptionsEnforceNicknamingCursorX] ; Enforce Nicknaming cursor X coordinate
	dec a
	jr z, .enforceNicknamingOff
.enforceNicknamingOn
	set 0, d
	jr .checkAfterRival1Loss
.enforceNicknamingOff
	res 0, d
.checkAfterRival1Loss
	ld a, [wNuzlockeOptionsAfterRival1LossCursorX] ; After Rival 1 Loss cursor X coordinate
	dec a
	jr z, .AfterRival1LossHeal
.AfterRival1LossBlackout
	set 1, d
	jr .checkDuplicatesClause
.AfterRival1LossHeal
	res 1, d
.checkDuplicatesClause
	ld a, [wNuzlockeOptionsDuplicatesClauseCursorX] ; Duplicates Clause cursor X coordinate
	dec a
	jr z, .duplicatesClauseAllow
	sub 6
	jr z, .duplicatesClauseEnforce
.duplicatesClauseOff
	set 3, d
	jr .checkEncounterMaps
.duplicatesClauseAllow
	res 2, d
	jr .checkEncounterMaps
.duplicatesClauseEnforce
	res 3, d
	set 2, d
.checkEncounterMaps
	ld a, [wNuzlockeOptionsEncounterMapsCursorX] ; Encounter Maps cursor X coordinate
	dec a
	jr z, .encounterMapsSplit
.encounterMapsLink
	set 4, d
	jr .storeNuzlockeOptions
.encounterMapsSplit
	res 4, d
.storeNuzlockeOptions
	ld a, d
	ld [wNuzlockeOptions], a
	ret ; taken from SetOptionsFromCursorPositions (end)

; places menu cursors in the first positions within the Nuzlocke options menu
SetNuzlockeOptionMenu1CursorPositions: ; taken from SetCursorPositionsFromOptions (start)
	ld a, [wNuzlockeOptionsEnforceNicknamingCursorX]
	hlcoord 0, 3
	call .placeUnfilledRightArrow
	ld a, [wNuzlockeOptionsAfterRival1LossCursorX]
	hlcoord 0, 8
	call .placeUnfilledRightArrow
	ld a, [wNuzlockeOptionsDuplicatesClauseCursorX]
	hlcoord 0, 13
	call .placeUnfilledRightArrow
; cursor in front of Back
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX]
	hlcoord 0, 16
	call .placeUnfilledRightArrow
	ret
.placeUnfilledRightArrow
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▷"
	ret ; taken from SetCursorPositionsFromOptions (end)

SetNuzlockeOptionMenu2CursorPositions: ; taken from SetCursorPositionsFromOptions (start)
	ld a, [wNuzlockeOptionsEncounterMapsCursorX]
	hlcoord 0, 3
	call .placeUnfilledRightArrow
; cursor in front of Back
	ld a, [wNuzlockeOptionsBackNextConfirmCursorX]
	hlcoord 0, 16
	call .placeUnfilledRightArrow
	ret
.placeUnfilledRightArrow
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▷"
	ret ; taken from SetCursorPositionsFromOptions (end)
