DisplayNuzlockeOptionMenu: ; taken from DisplayOptionMenu (start)
	hlcoord 0, 0
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
	ld de, NuzlockeOptionMenuConfirmText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	inc a
	ld [wLetterPrintingDelayFlags], a
	ld [wNuzlockeOptionsConfirmCursorX], a
	ld a, 3
	ld [wTopMenuItemY], a
	ld a, 1
	call SetNuzlockeOptionMenuCursorPositions
	ld [wTopMenuItemX], a
	ldh [hAutoBGTransferEnabled], a
	call Delay3
.loop
	call PlaceMenuCursor
	call SetNuzlockeOptionsFromCursorPositions
.getJoypadStateLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	ld b, a
	and A_BUTTON | D_RIGHT | D_LEFT | D_UP | D_DOWN
	jr z, .getJoypadStateLoop
	bit BIT_A_BUTTON, b
	jr z, .checkDirectionKeys
	ld a, [wTopMenuItemY]
	cp 16 ; is the cursor on Confirm?
	jr nz, .loop
.exitMenu
	ld a, SFX_PRESS_AB
	call PlaySound
	ret
.eraseOldMenuCursor
	ld [wTopMenuItemX], a
	call EraseMenuCursor
	jr .loop
.checkDirectionKeys
	ld a, [wTopMenuItemY]
	bit BIT_D_DOWN, b
	jr nz, .downPressed
	bit BIT_D_UP, b
	jr nz, .upPressed
	cp 8 ; cursor in After Rival 1 Loss section?
	jr z, .cursorInAfterRival1Loss
	cp 13 ; cursor in Duplicates Clause?
	jr z, .cursorInDuplicatesClause
	cp 16 ; cursor on Confirm?
	jr z, .loop
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
	inc hl
	jr z, .updateMenuVariables
	cp 8
	inc hl
	jr z, .updateMenuVariables
	ld b, 3
	inc hl
	jr .updateMenuVariables
.upPressed
	cp 8
	ld b, -5
	ld hl, wNuzlockeOptionsEnforceNicknamingCursorX
	jr z, .updateMenuVariables
	cp 13
	inc hl
	jr z, .updateMenuVariables
	cp 16
	ld b, -3
	inc hl
	jr z, .updateMenuVariables
	ld b, 13
	inc hl
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
	bit BIT_D_LEFT, b
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

EnforceNicknamingOptionText:
	db   "ENFORCE NICKNAMING"
	next " OFF      ON@"

AfterRival1LossOptionText:
	db   "AFTER RIVAL 1 LOSS"
	next " HEAL     BLACKOUT@"

DuplicatesClauseOptionText:
	db   "DUPLICATES CLAUSE"
	next " ALLOW ENFORCE OFF@"

NuzlockeOptionMenuConfirmText:
	db "CONFIRM@"

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
	jr .storeNuzlockeOptions
.duplicatesClauseAllow
	res 2, d
	jr .storeNuzlockeOptions
.duplicatesClauseEnforce
	res 3, d
	set 2, d
.storeNuzlockeOptions
	ld a, d
	ld [wNuzlockeOptions], a
	ret ; taken from SetOptionsFromCursorPositions (end)

; places menu cursors in the first positions within the Nuzlocke options menu
SetNuzlockeOptionMenuCursorPositions: ; taken from SetCursorPositionsFromOptions (start)
	ld [wNuzlockeOptionsEnforceNicknamingCursorX], a
	ld [wNuzlockeOptionsAfterRival1LossCursorX], a
	ld [wNuzlockeOptionsDuplicatesClauseCursorX], a
	hlcoord 1, 3
	ld [hl], "▷"
	hlcoord 1, 8
	ld [hl], "▷"
	hlcoord 1, 13
	ld [hl], "▷"
; cursor in front of Confirm
	hlcoord 1, 16
	ld [hl], "▷"
	ret ; taken from SetCursorPositionsFromOptions (end)
