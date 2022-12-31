VermilionPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenter_TextPointers:
	dw VermilionHealNurseText
	dw VermilionPokecenterText2
	dw VermilionPokecenterText3 ; BUDDY
	dw VermilionTradeNurseText

VermilionHealNurseText:
	script_pokecenter_nurse

VermilionPokecenterText2:
	text_far _VermilionPokecenterText2
	text_end

VermilionPokecenterText3:
	text_asm ; taken from SilphCo7Text1 (start)
	ld a, [wNuzlockeFlags]
	bit 2, a ; check if got BUDDY
	jr z, .giveBuddy ; jump if not got BUDDY
	ld hl, .BuddyGuyText
	call PrintText
	jr .done
.giveBuddy
	ld hl, .MeetBuddyGuyText
	call PrintText
	call YesNoChoice ; taken from OaksLabMonChoiceMenu (start)
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .didNotTakeBuddy ; taken from OaksLabMonChoiceMenu (end)
	ld hl, .HeresBuddyText
	call PrintText
	ld hl, wNuzlockeFlags
	set 3, [hl] ; set bit for adding BUDDY
	lb bc, MEW, 5
	call GivePokemon
	ld hl, wNuzlockeFlags
	res 3, [hl] ; clear bit for adding BUDDY
	jr nc, .done
	ld hl, wNuzlockeFlags
	set 2, [hl] ; set bit for got BUDDY
	jr .done
.didNotTakeBuddy
	ld hl, .DidNotTakeBuddyText
	call PrintText
.done
	jp TextScriptEnd

.MeetBuddyGuyText ; text/VermilionPokecenter.asm
	text_far _MeetBuddyGuyText
	text_end

.HeresBuddyText ; text/VermilionPokecenter.asm
	text_far _HeresBuddyText
	text_end

.DidNotTakeBuddyText ; text/VermilionPokecenter.asm
	text_far _DidNotTakeBuddyText
	text_end

.BuddyGuyText ; text/VermilionPokecenter.asm
	text_far _BuddyGuyText
	text_end ; taken from SilphCo7Text1 (end)

VermilionTradeNurseText:
	script_cable_club_receptionist
