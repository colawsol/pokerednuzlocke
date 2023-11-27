# Releases

N.B. Check the Changelog in INFO.md for a detailed list of differences.

### v0.0.1
pret/pokered disassembly.

### v1.0.0
Basic Nuzlocke rules enforced: fainted Pokémon can no longer be revived (except following the first rival battle) or traded away and only the first encounter in each area can be caught. Individual floors of dungeons etc (e.g. Mt Moon, Pokémon Tower) are counted as separate areas and duplicate encounters can be re-rolled, accommodating those who would choose to play with these clauses while others can simply choose to ignore them. There are no restrictions on accepting gift Pokémon or obtaining Game Corner prizes and the starter Pokémon is not counted as a Pallet Town encounter. There are also no specific consequences for blacking-out. Limited testing performed.

### v1.1.0
Enforces nicknaming of Pokémon on top of v1.0.0. No further testing performed on the basic Nuzlocke rules.

### v1.1.1
Adds CREDITS.md to the repository and fixes some minor issues:
* Due to LANDMARK_UNUSED_MAP_0B being missing from landmark_constants.asm, any encounters from maps indexed between SAFFRON_CITY and REDS_HOUSE_1F would be logged in the landmark ahead of where they should be (e.g. an encounter on Route 1 would be stored in the landmark for Route 2, an encounter on Route 2 would be stored in the landmark for Route 3 etc). This is due to the LandmarkIndex routine simply using the index number of any non-INDOOR_MAPS as the index number for the corresponding landmark, but these being out-of-sync due to the omission of LANDMARK_UNUSED_MAP_0B. However, this would only have affected gameplay if an encounter was logged from OAKS_LAB (e.g. the starter Pokémon); in this case, an encounter from ROUTE_25 would be unobtainable due to LandmarkIndex pointing to the already set LANDMARK_OAKS_LAB, while LANDMARK_ROUTE_1 would go unused.
* CINNABAR_POKECENTER was missing from the LandmarkIndexTable comments.
No further testing performed on previous versions.

### v1.1.2
Fixes evolution-setting routine only logging caught wild encounters by implementing the routine in all necessary situations (e.g. receiving starter Pokémon, receiving traded Pokémon, receiving Game Corner prize Pokémon etc). Limited testing performed on edited code only.
