**Important Notice!**

Dolgeon is being resumed after careful consideration and major changes!

1. I am going to start with the bare minimum first.
2. Before making a full game, I will release a demo.
3. Going to remake most of it from scratch.
4. The new version will be closed source (I may be looking for help in the future).

You may continue to work on this open-source version freely.

# Dolgeon
A procedural dolphin-themed dungeon crawler.

This README is to be treated as a **living Game Design Document**. Meaning it
should be consulted whenever deciding on changes, and it may change throughout
the life of the project.

## Organization
__This is the development version of Dolgeon.__ The release version will be
published to other platforms.

- Core files will be placed into the root of this repository.
- Game files will be placed in **src**.
  - **scripts** - Script assets.
  - **images** - Exported image assets.
  - **resources** - Resource files such as materials and nodes.
- Documentation will be in **docs**.
  - **items** - Describes collectable items.
- Assets will be placed it **assets**.
  - Images will be created as Aseprite project files.
  - 3D assets will be made in Blender.

## Contributing
Contributions are welcome! As long as:

- You follow Discord Community Guidelines at all times.
- You have read through this entire README.
- An issue is created to discuss your changes (not necessary for minor changes,
such as spelling corrections).
- It fits within the project Scope.

Often the best way to contribute is to participate in discussions. If you would
like to contribute more directly, please feel free to open a pull request.

## Scope
Below is a list of what *could* and *would not* be included in this project.

### In
- A web game.
- A downloadable game (only if required).
- Single player.
- Multiplayer (through Discord).
- Earnable accessories and upgrades.
- Discord integration.

### Out
- In-game purchases.
- Mini-games.
- A story arc.

## Gameplay
Dolgeon will be a dungeon crawler game where a dolphin character,

- Swims around at fast speeds.
- Damages enemies at close range by swiping at them.
- Uses items to deal damage or change appearance.
- Defeat bosses to progress to lower, harder floors.
- Taking damage and returning to the beginning upon loosing all health.

Each area will be a collection of rooms which will contain a collection of
tiles (floor and wall layers) and enemies. Some rooms may contain an item.

## Look
The game will be based on 2D pixel art with a slanted overhead view (e.g. https://duckduckgo.com/?q=gungeon&t=newext&atb=v244-1&iax=images&ia=images). Scenary such as walls will be layered to create a psuedo 3D look (e.g. https://youtu.be/CWZvPZ5mGmY).

Each time the player progresses to the next area, the theme will change:

1. Ocean floor (tutorial/lobby) - Only loaded once.
2. Shipwreck
3. Flooded castle
4. Caves
