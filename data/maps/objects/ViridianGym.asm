	object_const_def
	const_export VIRIDIANGYM_GIOVANNI
	const_export VIRIDIANGYM_COOLTRAINER_M1
	const_export VIRIDIANGYM_HIKER1
	const_export VIRIDIANGYM_ROCKER1
	const_export VIRIDIANGYM_HIKER2
	const_export VIRIDIANGYM_COOLTRAINER_M2
	const_export VIRIDIANGYM_HIKER3
	const_export VIRIDIANGYM_ROCKER2
	const_export VIRIDIANGYM_COOLTRAINER_M3
	const_export VIRIDIANGYM_GYM_GUIDE
	const_export VIRIDIANGYM_REVIVE

ViridianGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event 16, 17, LAST_MAP, 5
	warp_event 17, 17, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_GIOVANNI, STAY, DOWN, TEXT_VIRIDIANGYM_GIOVANNI, OPP_GIOVANNI, 3
	object_event 12,  7, SPRITE_COOLTRAINER_M, STAY, DOWN, TEXT_VIRIDIANGYM_COOLTRAINER_M1, OPP_COOLTRAINER_M, 9
	object_event 11, 11, SPRITE_HIKER, STAY, UP, TEXT_VIRIDIANGYM_HIKER1, OPP_BLACKBELT, 6
	object_event 10,  7, SPRITE_ROCKER, STAY, DOWN, TEXT_VIRIDIANGYM_ROCKER1, OPP_TAMER, 3
	object_event  3,  7, SPRITE_HIKER, STAY, LEFT, TEXT_VIRIDIANGYM_HIKER2, OPP_BLACKBELT, 7
	object_event 13,  5, SPRITE_COOLTRAINER_M, STAY, RIGHT, TEXT_VIRIDIANGYM_COOLTRAINER_M2, OPP_COOLTRAINER_M, 10
	object_event 10,  1, SPRITE_HIKER, STAY, DOWN, TEXT_VIRIDIANGYM_HIKER3, OPP_BLACKBELT, 8
	object_event  2, 16, SPRITE_ROCKER, STAY, RIGHT, TEXT_VIRIDIANGYM_ROCKER2, OPP_TAMER, 4
	object_event  6,  5, SPRITE_COOLTRAINER_M, STAY, DOWN, TEXT_VIRIDIANGYM_COOLTRAINER_M3, OPP_COOLTRAINER_M, 1
	object_event 16, 15, SPRITE_GYM_GUIDE, STAY, DOWN, TEXT_VIRIDIANGYM_GYM_GUIDE
	object_event 16,  9, SPRITE_POKE_BALL, STAY, NONE, TEXT_VIRIDIANGYM_SUPER_POTION, SUPER_POTION

	def_warps_to VIRIDIAN_GYM
