# Redstone Additions V3

> **A complete rewrite of [Redstone Additions V1](https://modrinth.com/datapack/redstone-additions?version=1.21.9&loader=datapack)**

Redstone Additions is the new "all-around" content pack for Minecraft redstone. It bridges all the gaps of default redstone and makes certain contraptions more compact whilst still keeping redstone fun!

Due to the success of V1, this version has been completely rebuilt from the ground up—not only for Minecraft 1.21.10 but with **over 30 custom new blocks** planned!

---

## 📦 Installation

1. Download the `redstone_additions_v3.0.0` folder
2. Place it in your world's `datapacks` folder
3. Run `/reload` in-game
4. Use `/function ra:give_all_items` to get all custom blocks

---

## 🏗️ Architecture

The datapack is split into three namespaces for modularity:

| Namespace | Purpose |
|-----------|---------|
| `ra` | Core functions, load/tick, and main commands |
| `ra_lib` | Reusable library systems (placement, orientation, inventory, removal) |
| `ra_interactive` | All custom block implementations |

### File Structure
```
redstone_additions_v3.0.0/
├── pack.mcmeta
└── data/
    ├── minecraft/tags/function/load.json
    ├── ra/
    │   ├── function/
    │   │   ├── load.mcfunction
    │   │   ├── tick.mcfunction
    │   │   └── give_all_items.mcfunction
    │   └── tags/function/
    │       └── register_placement_handlers.json
    ├── ra_lib/
    │   └── function/
    │       ├── placement/    # Block placement system
    │       ├── orientation/  # Facing calculation
    │       ├── removal/      # Break detection
    │       └── inventory/    # Container operations
    └── ra_interactive/
        └── function/
            ├── load.mcfunction
            ├── tick.mcfunction
            ├── items/give_all.mcfunction
            └── blocks/
                ├── block_breaker/
                ├── block_placer/
                ├── spitter/
                ├── pusher/
                ├── conveyor/
                └── ... (more blocks)
```

---

## 🔧 Library Systems (ra_lib)

### Placement System
Handles custom block placement with proper orientation.

```mcfunction
# Place a block with full 6-direction facing (dispensers, droppers)
function ra_lib:placement/place {block_id:"minecraft:dispenser",block_tag:"my_block",dir_type:2}

# Place a block with horizontal-only facing (glazed terracotta)
function ra_lib:placement/place {block_id:"minecraft:magenta_glazed_terracotta",block_tag:"my_block",dir_type:1}
```

**dir_type values:**
- `0` = No rotation
- `1` = Horizontal only (4 directions)
- `2` = Full 6-direction (up/down/north/south/east/west)

### Removal System
Detects when custom blocks are broken.

```mcfunction
# Check if block was broken (call in tick)
function ra_lib:removal/check

# The armor stand gets tagged with ra.broken if block is missing
execute as @e[tag=ra.broken,tag=ra.custom_block.my_block] at @s run function my_namespace:on_break
```

### Inventory System
Transfer items between containers with proper stacking.

```mcfunction
# Give item to container at position
function ra_lib:inventory/give_nbt

# Try to stack items, find empty slots
function ra_lib:inventory/try_stack
function ra_lib:inventory/find_empty_slot
```

---

## ➕ Adding New Blocks

Creating a new custom block is easy! Follow this template:

### 1. Create the block folder
```
ra_interactive/function/blocks/my_block/
├── give.mcfunction
├── handle_placement.mcfunction
├── tick.mcfunction
├── process.mcfunction (or on_powered.mcfunction)
├── on_break.mcfunction
└── register_block.mcfunction
```

### 2. give.mcfunction
```mcfunction
# Give item to player
give @s bat_spawn_egg[item_model="minecraft:dispenser",item_name="My Block",custom_data={ra:{my_block:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.my_block"],Silent:1b,NoAI:1b,Invulnerable:1b}]
```

### 3. handle_placement.mcfunction
```mcfunction
# Check if this is our block being placed
execute unless entity @s[tag=ra.place.my_block] run return 0

# Place the physical block with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:dispenser",block_tag:"my_block",dir_type:2}

return 1
```

### 4. tick.mcfunction
```mcfunction
# Check for break detection
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.my_block] at @s run function ra_interactive:blocks/my_block/on_break

# Process each block
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_interactive:blocks/my_block/process
```

### 5. Register in tags
Add to `ra/tags/function/register_placement_handlers.json`:
```json
{
  "values": [
    "ra_interactive:blocks/my_block/handle_placement"
  ]
}
```

Add tick call to `ra_interactive/function/tick.mcfunction`:
```mcfunction
function ra_interactive:blocks/my_block/tick
```

---

## 📋 Current Blocks

| Block | Description | Base Block |
|-------|-------------|------------|
| **Block Breaker** | Breaks blocks in front when powered | Dispenser |
| **Block Placer** | Places blocks from inventory when powered | Dispenser |
| **Spitter** | Ejects items forward every 4 ticks | Dropper |
| **Pusher** | Pushes entities above forward (20 tick cooldown) | Magenta Glazed Terracotta |
| **Item Pipe** | Transfers items between containers with filtering | Dispenser |

### Planned Blocks (30+)
- Vacuum Hopper
- Chunk Loader
- Wireless Redstone
- Block Swapper
- Entity Sensor
- Timer
- Counter
- Randomizer
- And many more...

---

## 🎮 Commands

| Command | Description |
|---------|-------------|
| `/function ra:give_all_items` | Get all custom block items |
| `/function ra_interactive:items/give_all` | Get all interactive blocks |
| `/function ra_interactive:blocks/<block>/give` | Get a specific block |

---

## 📝 Technical Notes

- Custom blocks use **bat spawn eggs** with custom models
- Armor stands mark block positions and store rotation
- Uses **MCFunction macros** for dynamic block placement
- Local coordinates (`^ ^ ^`) for directional operations
- Compatible with Minecraft **1.21.10**

---

## 📜 License

Feel free to use, modify, and distribute. Credit appreciated!

---

## 🔗 Links

- **Original V1**: [Modrinth](https://modrinth.com/datapack/redstone-additions?version=1.21.9&loader=datapack)
- **Version**: 3.1.0
- **Minecraft**: 1.21.10
