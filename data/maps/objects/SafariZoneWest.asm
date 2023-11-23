	object_const_def
	const_export SAFARIZONEWEST_MAX_POTION
	const_export SAFARIZONEWEST_TM_DOUBLE_TEAM
	const_export SAFARIZONEWEST_MAX_REVIVE
	const_export SAFARIZONEWEST_GOLD_TEETH

SafariZoneWest_Object:
	db $0 ; border block

	def_warp_events
	warp_event 20,  0, SAFARI_ZONE_NORTH, 1
	warp_event 21,  0, SAFARI_ZONE_NORTH, 2
	warp_event 26,  0, SAFARI_ZONE_NORTH, 3
	warp_event 27,  0, SAFARI_ZONE_NORTH, 4
	warp_event 29, 22, SAFARI_ZONE_CENTER, 3
	warp_event 29, 23, SAFARI_ZONE_CENTER, 4
	warp_event  3,  3, SAFARI_ZONE_SECRET_HOUSE, 1
	warp_event 11, 11, SAFARI_ZONE_WEST_REST_HOUSE, 1

	def_bg_events
	bg_event 12, 12, TEXT_SAFARIZONEWEST_REST_HOUSE_SIGN
	bg_event 17,  3, TEXT_SAFARIZONEWEST_FIND_WARDENS_TEETH_SIGN
	bg_event 26,  4, TEXT_SAFARIZONEWEST_TRAINER_TIPS
	bg_event 24, 22, TEXT_SAFARIZONEWEST_SIGN

	def_object_events
	object_event  8, 20, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_MAX_POTION, MAX_POTION
	object_event  9,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_TM_DOUBLE_TEAM, TM_DOUBLE_TEAM
	object_event 18, 18, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_HYPER_POTION, HYPER_POTION
	object_event 19,  7, SPRITE_POKE_BALL, STAY, NONE, TEXT_SAFARIZONEWEST_GOLD_TEETH, GOLD_TEETH

	def_warps_to SAFARI_ZONE_WEST
