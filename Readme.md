# Calandria

This is a game that uses the [Minetest engine](http://www.minetest.net) to
teach programming and other technical skills.

<img src="http://p.hagelb.org/calandria-shell.png" alt="shell screenshot" width="600" />

You are in a spaceship that has been damaged by asteroid impact. You're
trying to get home by repairing and operating vital ship systems.
There is a repair robot, but its programming has been destroyed in the
accident, so you need to reprogram it, among other things.

<img src="http://p.hagelb.org/calandria-corridor.png" alt="shell screenshot" width="600" />

This is nowhere near being finished. This repository is for the
Calandria "subgame" which runs directly on the Minetest engine, but
the [Calandria mod](https://github.com/technomancy/calandria) can be
used in combination with other games running on the Minetest engine.

## Playing

It is still *very* rough.

Download a copy of the game (either through `git clone` or
[as an archive](https://github.com/technomancy/calandria/archive/master.zip))
and place it in the `games/` subdirectory of your Minetest
installation. Launch Minetest and select the Calandria game at the
bottom (blue C icon with stars).

Create a new world in Creative mode. It will spawn you in a world with
a single block to stand on; you can build a ship out from there.

In order to start using the OS, you'll need to place a server block
first. Then place a terminal near it. Right-click on the terminal and
log in to the server using `/login (10,1,5) username` where the second
argument is the position of the server you've placed. At that point
you can enter shell commands.

There's also an unfinished
[pre-made world you can use](http://p.hagelb.org/calandria-ship.tar.gz).

## Repairs/Puzzles

Some samples of the challenges: (to implement in the future?)

* Restore power to a door
* Fix the robot (needs a power cell?)
* Bring main power back online
* Repair the hull (otherwise the oxygen will leak out)
* Fix life support (otherwise parts of the ship have no oxygen)

Some of these will involve simply placing blocks; some of them will
involve simply using the OS on the computer; some of them can't be
done without programming the main computer; some require programming
the robot.

## Ship

The ship is powered by a main power reactor with a backup solar array
for auxiliary power. There are a number of decks. Each deck will have
conduits running under it for bringing power and data channels to the
various systems.

Some areas of the ship have oxygen, but some are depressurized. The
robot can repair the hull breaches, and the oxygen system can pump
atmosphere into the breached rooms. It would be really cool if we
could model atmosphere as an invisible Minetest liquid, assuming we
can invert the normal damage logic.

A bunch of systems, including the robot, have been damaged. Some of
them you will need to get power to. When the game begins, the ship
will be running on auxiliary power, which doesn't have enough power to
activate all the ship's systems. Bringing main power online is a
significant goal. Power mechanics are inspired by FTL, but controlled
via a unixlike system.

Systems are broken up by decks; each deck has its own computer. Doors
and airlocks for each deck can be controlled by the deck computer if
powered, but also have a switch next to them that can be remotely
overridden.

<img src="http://p.hagelb.org/calandria-cargo-bay.png" alt="shell screenshot" width="600" />

### Command Deck

* Navigation
* Communication
* Shields
* Elevator

### Science Deck

* Sensors
* Lab
* Cargo Bay

### Habitat Deck

* Oxygen
* Gravity
* Mess hall
* Cabins

### Engineering Deck

* Reactor
* Engines
* Solar array
* Robotics

## OS

The ship's onboard computers run
[Orb](https://github.com/technomancy/orb) as their operating
system, which is roughly unixlike, but programmed completely in Lua.

You start out with access to your own user on a single computer via a
keypair. You only have access to a handful of diagnostic utilities. As
you progress, you can be added to new groups and gain private keys for
other users' accounts. You may start with access to the science
computer and need to gain access to engineering and command
separately.

## Blocks

### Decorative

* [x] Steel blocks
* [x] Duranium (decorative alternative to steel)
* [x] Tritanium (decorative alternative to steel)
* [x] Glass
* [ ] Corridor arches
* [ ] Signs (can't be wooden)
* [ ] Damaged wires
* [x] Beds

### Electronic

* [x] Computers
* [x] Terminals
* [ ] Switches
* [ ] buttons
* [x] Wires (use mesecons)
* [ ] Indicators (light up when power/signal is on)
* [ ] Analog meters (shows how powerful a signal is)
* [ ] Power receptacle

### Powered blocks

* [x] Light panels
* [ ] Light columns
* [ ] Doors
* [ ] Airlocks
* [ ] Elevators

### Other

* [ ] Hatches
* [ ] Vents
* [ ] Debris
* [ ] Chairs
* [ ] Ladders
* [ ] Coolant (liquid)

* [x] Remove non-space blocks (axes, dirt, etc)

## License

Textures: [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0/)
Sky textures from [Moontest](https://github.com/Amaz1/moontest).

Calandria-specific code (calandria/orb mods): GPLv3 or later; see COPYING.
Other bundled mods distributed under their own licenses as documented.
