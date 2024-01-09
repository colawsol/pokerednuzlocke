Random_::
; Generate a random 8-bit value.

; 8-bit Xor-Shift random number generator.
; Created by Patrik Rak in 2008 and revised in 2011/2012.
; See http://www.worldofspectrum.org/forums/showthread.php?t=23070
; Adapted for gbZ80.
; See https://gist.github.com/raxoft/c074743ea3f926db0037

	ldh a, [hRandomSub+1]
	ld b, a ; b = hRandomSub+1
	ldh a, [hRandomAdd+1]
	ldh [hRandomSub+1], a ; hRandomAdd+1 to hRandomSub+1
	ldh a, [hRandomSub]
	ldh [hRandomAdd+1], a ; hRandomSub to hRandomAdd+1
	ldh a, [hRandomAdd]
	ldh [hRandomSub], a ; hRandomAdd to hRandomSub
	ld c, a ; c = hRandomAdd
	add a
	add a
	add a
	xor c
	ld c, a
	ld a, b
	add a
	xor b
	ld d, a
	rra
	xor d
	xor c
	ldh [hRandomAdd], a ; random value to hRandomAdd
	ret
