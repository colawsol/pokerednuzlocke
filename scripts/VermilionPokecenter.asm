VermilionPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenter_TextPointers:
	def_text_pointers
	dw_const VermilionPokecenterNurseText,            TEXT_VERMILIONPOKECENTER_NURSE
	dw_const VermilionPokecenterFishingGuruText,      TEXT_VERMILIONPOKECENTER_FISHING_GURU
	dw_const VermilionPokecenterSailorText,           TEXT_VERMILIONPOKECENTER_SAILOR
	dw_const VermilionPokecenterLinkReceptionistText, TEXT_VERMILIONPOKECENTER_LINK_RECEPTIONIST

VermilionPokecenterNurseText:
	script_pokecenter_nurse

VermilionPokecenterFishingGuruText:
	text_far _VermilionPokecenterFishingGuruText
	text_end

VermilionPokecenterSailorText:
	text_asm ; taken from SilphCo7FSilphWorkerM1Text (start)
	ld a, [wNuzlockeFlags]
	bit 2, a ; check if got BUDDY
	jr z, .giveBuddy ; jump if not got BUDDY
	ld hl, .BuddySailorText
	call PrintText
	jr .done
.giveBuddy
	ld hl, .MeetBuddySailorText
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

.MeetBuddySailorText ; text/VermilionPokecenter.asm
	text_far _MeetBuddySailorText
	text_end

.HeresBuddyText ; text/VermilionPokecenter.asm
	text_far _HeresBuddyText
	text_end

.DidNotTakeBuddyText ; text/VermilionPokecenter.asm
	text_far _DidNotTakeBuddyText
	text_end

.BuddySailorText ; text/VermilionPokecenter.asm
	text_far _BuddySailorText
	text_end ; taken from SilphCo7FSilphWorkerM1Text (end)

VermilionPokecenterLinkReceptionistText:
	script_cable_club_receptionist
