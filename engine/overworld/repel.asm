; adapted from huderlem's maize, with fixes from JustRegularLuna
; checks bag for last REPEL used first to offer same again
; otherwise offers longest-lasting REPEL in bag
_DisplayRepelWoreOffText::
	ld hl, RepelWoreOffText
	call PrintText
; check for REPELs in bag
	ld a, [wLastRepelUsed]
	ld b, a
	call IsItemInBag
	ld a, [wLastRepelUsed]
	ld b, a
	jr nz, .gotRepel ; jump if still got last REPEL used
	ld b, MAX_REPEL
	call IsItemInBag
	ld b, MAX_REPEL
	jr nz, .gotRepel ; jump if got MAX_REPEL
	ld b, SUPER_REPEL
	call IsItemInBag
	ld b, SUPER_REPEL
	jr nz, .gotRepel ; jump if got SUPER_REPEL
	ld b, REPEL
	call IsItemInBag
	ld b, REPEL
	ret z ; return if no REPELs in bag
.gotRepel
	push bc ; to preserve item ID
	ld a, b
	ld [wd11e], a
	call GetItemName
	call CopyToStringBuffer
	ld hl, RepelUseAnotherText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
	pop bc ; to restore item ID
	ld a, b
	ld [wcf91], a
	ld [wPseudoItemID], a
; find where REPEL is in bag
	ld hl, wBagItems
	ld c, 0 ; start at top of bag
.search
	ld a, [hli]
	cp b
	jr z, .found
	inc c
	inc hl
	jr .search
.found
	ld a, c ; copy slot number of REPEL
	ld [wWhichPokemon], a ; store slot number for future reference
	call UseItem
	ret
.choseNo
	pop bc ; to restore stack
	ret

RepelWoreOffText::
	text_far _RepelWoreOffText
	text_end

RepelUseAnotherText::
	text_far _RepelUseAnotherText
	text_end
