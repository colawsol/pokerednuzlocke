# Info

## Changelog

### Nuzlocke
* Fainted Pokémon are no longer revived during party-healing events, e.g. using Pokémon Centers, talking to Mom etc (except immediately after the first rival battle).
* Revives and Max Revives have been removed from the game.
* Fainted Pokémon cannot be taken into the Cable Club or used for in-game trades.
* Rare Candies have no effect on fainted Pokémon, preventing a quirk where they can be used for revival.
* Fainted Pokémon cannot be deposited into the Daycare, as withdrawing them would restore their HP.
* Fainted Pokémon cannot evolve, preventing them from regaining HP.
* Wild encounters are logged after obtaining Balls or entering the Safari Zone and only the first encounter in each area can be caught.
	* Encounters are logged when a wild Pokémon is fainted, captured or escaped from (either by running or using a Poké Doll, unless escaping from a ghost or ghost Marowak); when an encounter ends through either party using Teleport, Roar or Whirlwind; and when a wild Pokémon flees from the player (i.e. in the Safari Zone).
	* Duplicates clause has been implemented, allowing the first encounter in an area to be re-rolled if a Pokémon of the same evolution line has already been caught and no attempt was made to catch the duplicate.
	* Graphics are displayed under the name of a wild Pokémon to indicate that it can be caught:
		* An empty ball indicates a new evolution line that can be caught.
		* A filled ball indicates an encounter that can be re-rolled if desired, as a Pokémon of that evolution line has already been caught.
* Provided access to HM-compatible Pokémon as a gift in Vermilion Pokémon Center to prevent being unable to progress due to available encounters.
* All Pokémon must be nicknamed.

### Quality of Life
* Holding B increases your movement speed, imitating the function of the Mach Bike and Running Shoes.
* Text speed defaults to fast.
* An automated Repel system has been implemented, similar to that of Black 2 and White 2, meaning you are prompted to use another when the current one expires.

## To Do

### Permadeath
* Test extensively for edge-cases in which fainted Pokémon can be revived.

### Encounters
* Test extensively for edge-cases in which encounter-setting/checking routines should be implemented.
