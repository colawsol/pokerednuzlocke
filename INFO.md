# Info

## Changelog

### Nuzlocke
* Fainted Pokémon are no longer revived during party-healing events, e.g. using Pokémon Centers, talking to Mom etc (except immediately after the first rival battle, if specified).
* Revives and Max Revives have been removed from the game.
* Fainted Pokémon cannot be taken into the Cable Club or used for in-game trades.
* Rare Candies have no effect on fainted Pokémon, preventing a quirk where they can be used for revival.
* Fainted Pokémon cannot be deposited into the Daycare, as withdrawing them would restore their HP.
* Fainted Pokémon cannot evolve, preventing them from regaining HP.
* Wild encounters are logged after obtaining Balls or entering the Safari Zone and only the first encounter in each area can be caught.
	* Encounters are logged when a wild Pokémon is fainted, captured or escaped from (either by running or using a Poké Doll, unless escaping from a ghost or ghost Marowak); when an encounter ends through either party using Teleport, Roar or Whirlwind; and when a wild Pokémon flees from the player (i.e. in the Safari Zone).
	* Duplicates clause can be implemented in one of three ways:
		* Allow: the first encounter in an area **_may_** be re-rolled if a Pokémon of the same evolution line is owned already and no attempt is made to catch the duplicate.
		* Enforce: the first encounter in an area **_must_** be re-rolled if a Pokémon of the same evolution line is owned already.
		* Off: **_no_** re-rolling of encounters is allowed, meaning only the first encounter in each area can be caught regardless of whether another Pokémon of the same evolution line is owned already or not.

	N.B. Duplicates clause currently only applies to Pokémon encountered through "wild" battles; there are no restrictions on obtaining "overworld" encounters (i.e. gift Pokémon, traded Pokémon and Game Corner Pokémon but **_not_** Snorlax/the legendary birds/Mewtwo, as these start a "wild" battle in which the Pokémon must be caught) in terms of duplicates.
	* Encounter maps can also be split or linked to accommodate different playing styles:
		* Split: all maps are handled individually, meaning the first encounter from each map can be caught. Taking Mt. Moon as an example, the first encounter on 1F, B1F **_and_** B2F could all be caught.
		* Link: associated maps are handled collectively (based on the "met in" data from Pokémon Fire Red), meaning only the first encounter from any of the linked maps can be caught. Taking Mt. Moon as an example, only the first encounter on 1F, B1F **_or_** B2F could be caught.

	N.B. Some quirks about the current grouping system that may or may not be changed in the future (not an exhaustive list):
	* Quirks:
		* Despite Oaks Lab being grouped with Pallet Town, starter Pokémon do not set the encounter flag for Pallet Town when Link is chosen.
		* Due to a bug in the vanilla game enabling fishing in the bottom of certain statues, encounters can be generated using the Old Rod within gyms and some Elite-4 rooms. This functionality is still present in this hack, although these encounters are grouped with the respective city/town when Link is chosen.
		* Maps that do not naturally generate encounters are grouped with other maps regardless of whether Split or Link is chosen, meaning the amount of glitch Pokémon that can be obtained will be limited.
	* Graphics are displayed under the name of a wild Pokémon to indicate that it can be caught:
		* An empty ball indicates an encounter that **_cannot_** be re-rolled.
		* A filled ball indicates an encounter that **_can_** be re-rolled if desired, as a Pokémon of that evolution line is owned already.
* Access to an HM-compatible Pokémon is provided as a gift in Vermilion Pokémon Center to prevent being unable to progress due to available encounters.
* All Pokémon must be nicknamed, if specified.

### Quality of Life
* Various Nuzlocke options can be selected when starting a new game.
* Holding B increases your movement speed, imitating the function of the Mach Bike and Running Shoes.
* Text speed defaults to fast.
* An automated Repel system has been implemented, similar to that of Black 2 and White 2, meaning you are prompted to use another when the current one expires.
* Kadabra, Graveler, Machoke and Haunter can be evolved with the Trade Stone, a new item made available in the Celadon Mart.
* Struggle has been given its own type, allowing for neutral damage against all other types.
* The random number generator has been improved, removing constraints on DV combinations for wild Pokémon.
* A Pokémon's DVs are viewable in an additional Stats page.

## To Do

### Permadeath
* Test extensively for edge-cases in which fainted Pokémon can be revived.

### Encounters
* Test extensively for edge-cases in which encounter-setting/checking routines should be implemented.
