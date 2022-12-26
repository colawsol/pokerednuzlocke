LandmarkIndexTable: ; takes INDOOR_MAPS and points them to LANDMARK
	db $28, LANDMARK_PALLET_TOWN          ; REDS_HOUSE_1F/2F, BLUES_HOUSE
	db $29, LANDMARK_OAKS_LAB             ; OAKS_LAB
	db $2D, LANDMARK_VIRIDIAN_CITY        ; VIRIDIAN_POKECENTER/MART/SCHOOL_HOUSE/NICKNAME_HOUSE
	db $2E, LANDMARK_VIRIDIAN_GYM         ; VIRIDIAN_GYM
	db $2F, LANDMARK_DIGLETTS_CAVE        ; DIGLETTS_CAVE_ROUTE_2
	db $30, LANDMARK_VIRIDIAN_FOREST      ; VIRIDIAN_FOREST_NORTH_GATE
	db $32, LANDMARK_ROUTE_2              ; ROUTE_2_TRADE_HOUSE/GATE
	db $34, LANDMARK_VIRIDIAN_FOREST      ; VIRIDIAN_FOREST_SOUTH_GATE/FOREST
	db $36, LANDMARK_PEWTER_CITY          ; MUSEUM_1F/2F
	db $37, LANDMARK_PEWTER_GYM           ; PEWTER_GYM
	db $3B, LANDMARK_PEWTER_CITY          ; PEWTER_NIDORAN_HOUSE/MART/SPEECH_HOUSE/POKECENTER
	db $3C, LANDMARK_MT_MOON_1F           ; MT_MOON_1F
	db $3D, LANDMARK_MT_MOON_B1F          ; MT_MOON_B1F
	db $3E, LANDMARK_MT_MOON_B2F          ; MT_MOON_B2F
	db $41, LANDMARK_CERULEAN_CITY        ; CERULEAN_TRASHED_HOUSE/TRADE_HOUSE/POKECENTER
	db $42, LANDMARK_CERULEAN_GYM         ; CERULEAN_GYM
	db $44, LANDMARK_CERULEAN_CITY        ; BIKE_SHOP, CERULEAN_MART
	db $45, LANDMARK_ROUTE_4              ; MT_MOON_POKECENTER
	db $46, LANDMARK_CERULEAN_CITY        ; CERULEAN_TRASHED_HOUSE_COPY
	db $49, LANDMARK_ROUTE_5              ; ROUTE_5_GATE, UNDERGROUND_PATH_ROUTE_5, DAYCARE
	db $4C, LANDMARK_ROUTE_6              ; ROUTE_6_GATE, UNDERGROUND_PATH_ROUTE_6/COPY
	db $4F, LANDMARK_ROUTE_7              ; ROUTE_7_GATE, UNDERGROUND_PATH_ROUTE_7/COPY
	db $51, LANDMARK_ROUTE_8              ; ROUTE_8_GATE, UNDERGROUND_PATH_ROUTE_8
	db $52, LANDMARK_ROUTE_10             ; ROCK_TUNNEL_POKECENTER
	db $53, LANDMARK_ROCK_TUNNEL_1F       ; ROCK_TUNNEL_1F
	db $54, LANDMARK_POWER_PLANT          ; POWER_PLANT
	db $55, LANDMARK_ROUTE_11             ; ROUTE_11_GATE_1F
	db $56, LANDMARK_DIGLETTS_CAVE        ; DIGLETTS_CAVE_ROUTE_11
	db $57, LANDMARK_ROUTE_11             ; ROUTE_11_GATE_2F
	db $58, LANDMARK_ROUTE_12             ; ROUTE_12_GATE_1F
	db $59, LANDMARK_ROUTE_25             ; BILLS_HOUSE
	db $5C, LANDMARK_VERMILION_CITY       ; VERMILION_POKECENTER, POKEMON_FAN_CLUB, VERMILION_MART
	db $5D, LANDMARK_VERMILION_GYM        ; VERMILION_GYM
	db $5E, LANDMARK_VERMILION_CITY       ; VERMILION_PIDGEY_HOUSE
	db $69, LANDMARK_VERMILION_DOCK       ; VERMILION_DOCK, SS_ANNE_1F/2F/3F/B1F/BOW/KITCHEN/CAPTAINS_ROOM/1F_ROOMS/2F_ROOMS/B1F_ROOMS
	db $6D, LANDMARK_VICTORY_ROAD_1F      ; UNUSED_MAP_69/6A/6B, VICTORY_ROAD_1F
	db $72, LANDMARK_LANCES_ROOM          ; UNUSED_MAP_6D/6E/6F/70, LANCES_ROOM
	db $77, LANDMARK_INDIGO_PLATEAU       ; UNUSED_MAP_72/73/74/75, HALL_OF_FAME
	db $78, LANDMARK_ROUTE_5              ; UNDERGROUND_PATH_NORTH_SOUTH
	db $79, LANDMARK_CHAMPIONS_ROOM       ; CHAMPIONS_ROOM
	db $7A, LANDMARK_ROUTE_7              ; UNDERGROUND_PATH_WEST_EAST
	db $86, LANDMARK_CELADON_CITY         ; CELADON_MART_1F/2F/3F/4F/ROOF/ELEVATOR, CELADON_MANSION_1F/2F/3F/ROOF/ROOF_HOUSE, CELADON_POKECENTER
	db $87, LANDMARK_CELADON_GYM          ; CELADON_GYM
	db $8D, LANDMARK_CELADON_CITY         ; GAME_CORNER, CELADON_MART_5F, GAME_CORNER_PRIZE_ROOM, CELADON_DINER/CHIEF_HOUSE/HOTEL
	db $8E, LANDMARK_LAVENDER_TOWN        ; LAVENDER_POKECENTER
	db $91, LANDMARK_POKEMON_TOWER_3F     ; POKEMON_TOWER_1F/2F/3F
	db $92, LANDMARK_POKEMON_TOWER_4F     ; POKEMON_TOWER_4F
	db $93, LANDMARK_POKEMON_TOWER_5F     ; POKEMON_TOWER_5F
	db $94, LANDMARK_POKEMON_TOWER_6F     ; POKEMON_TOWER_6F
	db $95, LANDMARK_POKEMON_TOWER_7F     ; POKEMON_TOWER_7F
	db $98, LANDMARK_LAVENDER_TOWN        ; LAVENDER_POKECENTER, POKEMON_TOWER_1F/2F/3F/4F/5F/6F/7F, MR_FUJIS_HOUSE, LAVENDER_MART/CUBONE_HOUSE
	db $9D, LANDMARK_FUCHSIA_CITY         ; FUCHSIA_MART/BILLS_GRANDPAS_HOUSE/POKECENTER, WARDENS_HOUSE, SAFARI_ZONE_GATE
	db $9E, LANDMARK_FUCHSIA_GYM          ; FUCHSIA_GYM
	db $9F, LANDMARK_FUCHSIA_CITY         ; FUCHSIA_MEETING_ROOM
	db $A0, LANDMARK_SEAFOAM_ISLANDS_B1F  ; SEAFOAM_ISLANDS_B1F
	db $A1, LANDMARK_SEAFOAM_ISLANDS_B2F  ; SEAFOAM_ISLANDS_B2F
	db $A2, LANDMARK_SEAFOAM_ISLANDS_B3F  ; SEAFOAM_ISLANDS_B3F
	db $A3, LANDMARK_SEAFOAM_ISLANDS_B4F  ; SEAFOAM_ISLANDS_B4F
	db $A4, LANDMARK_VERMILION_CITY       ; VERMILION_OLD_ROD_HOUSE
	db $A5, LANDMARK_FUCHSIA_CITY         ; FUCHSIA_GOOD_ROD_HOUSE
	db $A6, LANDMARK_POKEMON_MANSION_1F   ; POKEMON_MANSION_1F
	db $A7, LANDMARK_CINNABAR_GYM         ; CINNABAR_GYM
	db $AE, LANDMARK_CINNABAR_ISLAND      ; CINNABAR_LAB/TRADE_ROOM/METRONOME_ROOM/FOSSIL_ROOM/MART/COPY
	db $AF, LANDMARK_INDIGO_PLATEAU       ; INDIGO_PLATEAU_LOBBY
	db $B2, LANDMARK_SAFFRON_CITY         ; COPYCATS_HOUSE_1F/2F, FIGHTING_DOJO
	db $B3, LANDMARK_SAFFRON_GYM          ; SAFFRON_GYM
	db $B8, LANDMARK_SAFFRON_CITY         ; SAFFRON_PIDGEY_HOUSE/MART, SILPH_CO_1F, SAFFRON_POKECENTER, MR_PSYCHICS_HOUSE
	db $BA, LANDMARK_ROUTE_15             ; ROUTE_15_GATE_1F/2F
	db $BD, LANDMARK_ROUTE_16             ; ROUTE_16_GATE_1F/2F/FLY_HOUSE
	db $BE, LANDMARK_ROUTE_12             ; ROUTE_12_SUPER_ROD_HOUSE
	db $C0, LANDMARK_ROUTE_18             ; ROUTE_18_GATE_1F/2F
	db $C1, LANDMARK_SEAFOAM_ISLANDS_1F   ; SEAFOAM_ISLANDS_1F
	db $C2, LANDMARK_ROUTE_22             ; ROUTE_22_GATE
	db $C3, LANDMARK_VICTORY_ROAD_2F      ; VICTORY_ROAD_2F
	db $C4, LANDMARK_ROUTE_12             ; ROUTE_12_GATE_2F
	db $C5, LANDMARK_VERMILION_CITY       ; VERMILION_TRADE_HOUSE
	db $C6, LANDMARK_DIGLETTS_CAVE        ; DIGLETTS_CAVE
	db $C7, LANDMARK_VICTORY_ROAD_3F      ; VICTORY_ROAD_3F
	db $CC, LANDMARK_CELADON_CITY         ; ROCKET_HIDEOUT_B1F/B2F/B3F/B4F/ELEVATOR
	db $D6, LANDMARK_SAFFRON_CITY         ; UNUSED_MAP_CC/CD/CE, SILPH_CO_2F/3F/4F/5F/6F/7F/8F
	db $D7, LANDMARK_POKEMON_MANSION_2F   ; POKEMON_MANSION_2F
	db $D8, LANDMARK_POKEMON_MANSION_3F   ; POKEMON_MANSION_3F
	db $D9, LANDMARK_POKEMON_MANSION_B1F  ; POKEMON_MANSION_B1F
	db $DA, LANDMARK_SAFARI_ZONE_EAST     ; SAFARI_ZONE_EAST
	db $DB, LANDMARK_SAFARI_ZONE_NORTH    ; SAFARI_ZONE_NORTH
	db $DC, LANDMARK_SAFARI_ZONE_WEST     ; SAFARI_ZONE_WEST
	db $E2, LANDMARK_SAFARI_ZONE_CENTER   ; SAFARI_ZONE_CENTER/REST_HOUSE/SECRET_HOUSE/WEST_REST_HOUSE/EAST_REST_HOUSE/NORTH_REST_HOUSE
	db $E3, LANDMARK_CERULEAN_CAVE_2F     ; CERULEAN_CAVE_2F
	db $E4, LANDMARK_CERULEAN_CAVE_B1F    ; CERULEAN_CAVE_B1F
	db $E5, LANDMARK_CERULEAN_CAVE_1F     ; CERULEAN_CAVE_1F
	db $E6, LANDMARK_LAVENDER_TOWN        ; NAME_RATERS_HOUSE
	db $E7, LANDMARK_CERULEAN_CITY        ; CERULEAN_BADGE_HOUSE
	db $E9, LANDMARK_ROCK_TUNNEL_B1F      ; UNUSED_MAP_E7, ROCK_TUNNEL_B1F
	db $ED, LANDMARK_SAFFRON_CITY         ; SILPH_CO_9F/10F/11F/ELEVATOR
	db $F1, LANDMARK_INDIGO_PLATEAU       ; UNUSED_MAP_ED/EE, TRADE_CENTER, COLOSSEUM
	db $F6, LANDMARK_LORELEIS_ROOM        ; UNUSED_MAP_F1/F2/F3/F4, LORELEIS_ROOM
	db $F7, LANDMARK_BRUNOS_ROOM          ; BRUNOS_ROOM
	db $F8, LANDMARK_AGATHAS_ROOM         ; AGATHAS_ROOM
	db $FF
