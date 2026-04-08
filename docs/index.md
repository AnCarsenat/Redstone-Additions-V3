# Redstone Additions V3

<img src="images/icon.png" alt="Redstone Additions V3" width="128">

**Version:** v5.1.1  
**Minecraft:** 1.21+  
**Author:** [AnCarsenat](https://github.com/AnCarsenat)

---

Redstone Additions V3 is a vanilla datapack with modular systems for automation, storage, redstone logic, sensors, wireless signaling, chunk control, multiblock infrastructure, and transport networks.

This documentation is synced to the source layout in `redstone_additions_v3.0.0/data`.

## What Is New In v5.1.1

- New `ra_wires` namespace with liquid pipes, gas pipes, and electric wires.
- Added liquid drain block with fallback particle/status behavior when no source can be drained.
- Added goggles tinkering for transport blocks (toggle enabled states and cycle source medium IDs).
- Added full recipe and advancement coverage for transport and EU network blocks.
- Main branch now includes `ra_storage` with Boxer, Unboxer, and Item Crate workflows.
- Goggles module `draw_displays` wrappers were removed and inlined into core scanner functions.

## Feature Map

| Module | Namespace | Content |
|---|---|---|
| [Logic Gates](logic-gates.md) | `ra_gates` | 6 logic/timing blocks (UNI Gate, Clock, Delayer, Extender, Randomizer, Shortener) |
| [Interactive Machines](interactive-machines.md) | `ra_interactive` | 11 machine blocks (automation, transport, utility, messaging) |
| Storage | `ra_storage` | Boxer + Unboxer block pair and storage-box item flow |
| [Sensors](sensors.md) | `ra_sensors` | 3 detection/tagging blocks |
| [Wireless Redstone](wireless-redstone.md) | `ra_wireless` | Emitter, Receiver, and Remote tool |
| [Transport Networks](transport-networks.md) | `ra_wires` | 16 transport/electric blocks with liquid, gas, and EU flow |
| [Chunk Loader](chunk-loader.md) | `ra_chunk_loader` | 1 force-load block |
| [Multiblocks](multiblocks.md) | `ra_multiblock`, `ra_lib_multiblock` | 5 base tiers plus assembled structures |

Current pack totals (from give/recipe/tag registrations):

- 46 placeable custom blocks
- 5 tools (Wrench, Creative Data Handler, Data Handler, Goggles, Redstone Remote)

## Installation

1. Download from [Modrinth](https://modrinth.com/datapack/redstone-additions-v3) or clone from GitHub.
2. Place `redstone_additions_v3.0.0` in your world datapacks folder.
3. Run `/reload`.
4. Run `/function ra:give_all_items` for the categorized namespace bundle kit.

Path example:

```text
.minecraft/saves/<world>/datapacks/redstone_additions_v3.0.0/
```

## Core Commands

| Command | Purpose |
|---|---|
| `/function ra:give_all_items` | Give one prefilled bundle per namespace |
| `/function ra:items/bundles/give_all` | Direct entrypoint for the categorized bundle kit |
| `/function ra:items/bundles/give_storage_bundle` | Give only the storage namespace bundle |
| `/function ra_interactive:items/give_all` | Interactive machines |
| `/function ra_storage:items/give_all` | Storage blocks and storage-box item |
| `/function ra_gates:items/give_all` | Gates and timing blocks |
| `/function ra_sensors:items/give_all` | Sensor blocks |
| `/function ra_wireless:items/give_all` | Wireless blocks and remote |
| `/function ra_wires:items/give_all` | Transport pipes, drains, and EU blocks |
| `/function ra_chunk_loader:items/give_all` | Chunk loader |
| `/function ra_multiblock:blocks/give_all` | Multiblock bases |
| `/function ra:uninstall` | Opens uninstall confirmation dialog |

## Tooling

### Wrench

- Give: `/function ra:tools/wrench/give`
- Item: blaze rod with custom model
- Main use: mode cycling and multiblock assembly interactions

### Creative Data Handler

- Give: `/function ra:tools/creative_data_handler/give`
- Item: blaze rod with custom model
- Main use: inspect/edit `data.properties` on nearby custom block markers

### Data Handler

- Give: `/function ra:tools/data_handler/give`
- Item: blaze rod with custom model
- Main use: non-OP-friendly property editing menus with trigger actions and modular numeric/text input

### Goggles

- Give: `/function ra:tools/goggles/give`
- Item: leather helmet
- Main use: visual status overlay for nearby blocks and multiblocks

### Redstone Remote

- Give: `/function ra_wireless:tools/remote/give`
- Item: blaze rod with custom model
- Main use: pulse all wireless receivers on a selected channel

## How Placement Works

1. Block items are bat spawn eggs with `ra.spawned` and `ra.place.*` tags.
2. `ra:placement/detect_bats` picks up new bats each tick.
3. Placement handlers from `ra:placement_handlers` route each block type.
4. `ra_lib:placement/place` places a real block and creates an invisible marker entity.
5. Module tick functions process marker logic every tick.

For the full internal pipeline, read [How It Works](how-it-works.md).

## Architecture Snapshot

| Namespace | Role |
|---|---|
| `ra` | Core load/tick loop, tools, uninstall, placement dispatch |
| `ra_lib` | Shared utilities (placement, orientation, redstone, inventory, input) |
| `ra_lib_multiblock` | Multiblock assembly/validation/disassembly runtime |
| `ra_gates` | Logic and timing blocks |
| `ra_interactive` | Automation and utility machines |
| `ra_storage` | Boxer/Unboxer automation and storage-box data flow |
| `ra_sensors` | Entity detection and tag operations |
| `ra_wireless` | Channel-based signal transmission |
| `ra_wires` | Liquid/gas/EU transport, network transfer, and goggles tinkering |
| `ra_chunk_loader` | Force-load control block |
| `ra_multiblock` | Base tiers and concrete multiblock implementations |
| `ra_advancements` | Advancements for progression/unlock flow |

## Reference Pages

- [Transport Networks](transport-networks.md)
- [How It Works](how-it-works.md)
- [Block Reference](block-reference.md)
- [Recipe Reference](recipe-reference.md)
- [Developer Guide](developer-guide.md)
- [Extension Examples](extension-examples.md)
- [Changelog](changelog.md)

## Support

- [GitHub Repository](https://github.com/AnCarsenat/Redstone-Additions-V3)
- [Issues](https://github.com/AnCarsenat/Redstone-Additions-V3/issues)
- [Modrinth](https://modrinth.com/datapack/redstone-additions-v3)
