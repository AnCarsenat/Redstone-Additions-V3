# RA_Lib Wiki - Redstone Additions Library

A modular library for Minecraft datapacks providing reusable systems for custom block placement, orientation, inventory management, and more.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Orientation Module](#orientation-module)
3. [Placement Module](#placement-module)
4. [Removal Module](#removal-module)
5. [Inventory Module](#inventory-module)
6. [Scoreboards Reference](#scoreboards-reference)
7. [Storage Reference](#storage-reference)

---

## Getting Started

### Installation

RA_Lib is automatically initialized when the datapack loads. All modules are initialized via:

```mcfunction
function ra_lib:initialize
```

This sets up all required scoreboards and subsystems.

### Namespace

All functions are under the `ra_lib:` namespace. Storage uses `ra:` namespace.

---

## Orientation Module

**Path:** `ra_lib:orientation/`

Handles calculating block facing directions based on player look direction and converting those to armor stand rotations. Used for block placement.

### Functions

#### `ra_lib:orientation/calculate_block_facing`

Calculates which direction a block should face based on the player's look direction.

**Context:** Execute as player (`@s` = player)

**Input:**
- `@s ra.dir_type` - Directionality type:
  - `0` = Non-directional (always faces default)
  - `1` = Horizontal only (N/S/E/W)
  - `2` = Full directional (N/S/E/W/Up/Down)

**Output:**
- `@s ra.block_facing` - Facing value (0-5):
  - `0` = Down
  - `1` = Up
  - `2` = North
  - `3` = South
  - `4` = West
  - `5` = East

**Behavior:**
- When looking **down** (pitch > 45°) → block faces **UP**
- When looking **up** (pitch < -45°) → block faces **DOWN**
- Horizontal directions face **toward** the player (opposite of look direction)

**Example:**
```mcfunction
# Set player to use full directional
scoreboard players set @s ra.dir_type 2

# Calculate facing
function ra_lib:orientation/calculate_block_facing

# Result is now in @s ra.block_facing
```

---

#### `ra_lib:orientation/get_rotation_from_facing`

Converts a block facing value to armor stand rotation values.

**Context:** Execute as entity with `ra.block_facing` score

**Input:**
- `@s ra.block_facing` - Facing value (0-5)

**Output:**
- `storage ra:temp Rotation` - Array `[yaw, pitch]` for armor stand

**Rotation Values:**
| Facing | Direction | Yaw | Pitch |
|--------|-----------|-----|-------|
| 0 | Down | 0 | 90 |
| 1 | Up | 0 | -90 |
| 2 | North | 180 | 0 |
| 3 | South | 0 | 0 |
| 4 | West | 90 | 0 |
| 5 | East | -90 | 0 |

**Example:**
```mcfunction
# After calculating block_facing
function ra_lib:orientation/get_rotation_from_facing

# Apply to armor stand
data modify entity @e[tag=my_stand,limit=1] Rotation set from storage ra:temp Rotation
```

---

## Placement Module

**Path:** `ra_lib:placement/`

Handles placing custom blocks with correct orientation and associated armor stands.

### Functions

#### `ra_lib:placement/place_block`

Main entry point for placing a custom block with proper facing.

**Context:** At placement position

**Input via Storage:**
```
storage ra:block data {
    block_tag: "string",      # Tag for the armor stand (e.g., "block_breaker")
    block_id: "minecraft:...", # The physical block to place
    dir_type: 0/1/2           # Directionality type
}
```

**Requirements:**
- A player must have tag `ra.placer`

**Example:**
```mcfunction
# Set up block data
data modify storage ra:block data set value {block_tag:"my_block",block_id:"minecraft:dispenser",dir_type:2}

# Tag the placing player
tag @p add ra.placer

# Place at position
execute positioned 100 64 200 run function ra_lib:placement/place_block

# Clean up
tag @p remove ra.placer
```

---

#### `ra_lib:placement/summon_armor_stand`

Summons an armor stand marker for a custom block with correct rotation.

**Context:** At block position

**Input:**
- `storage ra:temp Rotation` - The rotation array
- Macro parameter: `block_tag` - Tag to apply

**Example:**
```mcfunction
# Usually called internally by place_block
function ra_lib:placement/summon_armor_stand with storage ra:block data
```

---

#### `ra_lib:placement/place_physical_block`

Places the actual Minecraft block with facing property.

**Context:** At block position

**Input:**
- `#facing ra.temp` - Facing value (0-5)
- Macro parameter: `block_id` - Block to place

**Facing to Block State:**
| Value | Block State |
|-------|-------------|
| 0 | `[facing=down]` |
| 1 | `[facing=up]` |
| 2 | `[facing=north]` |
| 3 | `[facing=south]` |
| 4 | `[facing=west]` |
| 5 | `[facing=east]` |

---

## Removal Module

**Path:** `ra_lib:removal/`

Handles detecting when custom blocks are broken and dropping appropriate items.

### Functions

#### `ra_lib:removal/detect_break`

Checks all custom block armor stands to see if their physical block was broken.

**Usage:** Call every tick or periodically.

```mcfunction
# In your tick function
function ra_lib:removal/detect_break
```

**Behavior:**
- Checks all entities with tag `ra.custom_block`
- If the block at their position is air, triggers `drop_item`

---

#### `ra_lib:removal/drop_item`

Drops the appropriate item when a custom block is broken.

**Context:** As armor stand, at armor stand position

**Behavior:**
- Summons the correct item based on armor stand tags
- Plays break sound
- Removes the armor stand

**Note:** Currently uses hardcoded item drops per block type. Extend by adding more conditions for different `ra.custom_block.*` tags.

---

## Inventory Module

**Path:** `ra_lib:inventory/`

Provides `/give` and `/clear` like functionality for container blocks (chests, barrels, hoppers, etc.).

### Functions

#### `ra_lib:inventory/give_item`

Insert an item into a container block's inventory.

**Context:** At the container block position

**Input via Storage:**
```
storage ra:inventory item {
    id: "minecraft:item_id",    # Required - Item ID
    count: 1,                   # Optional - Amount (default: 1)
    slot: -1,                   # Optional - Target slot (-1 = first empty)
    components: {...}           # Optional - Item components
}
```

**Supported Components:**
- `custom_name` - Display name
- `lore` - Item lore lines
- `enchantments` - Enchantment data
- `custom_data` - Custom NBT data for datapacks
- Any other valid item component

**Examples:**

```mcfunction
# Simple item
data modify storage ra:inventory item set value {id:"minecraft:diamond", count:64}
execute positioned 100 64 200 run function ra_lib:inventory/give_item

# Item with custom name
data modify storage ra:inventory item set value {id:"minecraft:diamond_sword", components:{custom_name:'"Excalibur"'}}
execute positioned 100 64 200 run function ra_lib:inventory/give_item

# Item with lore
data modify storage ra:inventory item set value {id:"minecraft:golden_apple", components:{lore:['"Legendary"','"Heals all wounds"']}}
execute positioned 100 64 200 run function ra_lib:inventory/give_item

# Item with custom data (for your datapack)
data modify storage ra:inventory item set value {id:"minecraft:stick", components:{custom_data:{my_pack:{magic_wand:true,power:5}}}}
execute positioned 100 64 200 run function ra_lib:inventory/give_item

# Item in specific slot
data modify storage ra:inventory item set value {id:"minecraft:emerald", count:32, slot:13}
execute positioned 100 64 200 run function ra_lib:inventory/give_item

# Enchanted item
data modify storage ra:inventory item set value {id:"minecraft:diamond_pickaxe", components:{enchantments:{levels:{"minecraft:efficiency":5,"minecraft:fortune":3}}}}
execute positioned 100 64 200 run function ra_lib:inventory/give_item
```

---

#### `ra_lib:inventory/clear`

Remove items from a container, with optional count limit and component filtering.

**Context:** At the container block position

**Input via Storage:**
```
storage ra:inventory clear {
    id: "minecraft:item_id",    # Required - Item ID to remove
    count: -1,                  # Optional - Max to remove (-1 or omit = all)
    components: {...}           # Optional - Only match items with these components
}
```

**Returns:** Number of items removed (for `execute store result`)

**Examples:**

```mcfunction
# Clear ALL diamonds from chest
data modify storage ra:inventory clear set value {id:"minecraft:diamond"}
execute positioned 100 64 200 run function ra_lib:inventory/clear

# Clear exactly 32 diamonds
data modify storage ra:inventory clear set value {id:"minecraft:diamond", count:32}
execute positioned 100 64 200 run function ra_lib:inventory/clear

# Clear and get count removed
data modify storage ra:inventory clear set value {id:"minecraft:iron_ingot", count:64}
execute store result score #removed ra.temp positioned 100 64 200 run function ra_lib:inventory/clear
tellraw @a ["Removed ",{"score":{"name":"#removed","objective":"ra.temp"}}," iron ingots"]

# Clear only items with specific custom_data
data modify storage ra:inventory clear set value {id:"minecraft:stick", components:{custom_data:{my_pack:{magic_wand:true}}}}
execute positioned 100 64 200 run function ra_lib:inventory/clear

# Clear only items with specific name
data modify storage ra:inventory clear set value {id:"minecraft:diamond_sword", components:{custom_name:'"Excalibur"'}}
execute positioned 100 64 200 run function ra_lib:inventory/clear
```

---

#### `ra_lib:inventory/clear_slot`

Remove the item from a specific slot.

**Context:** At the container block position

**Input:**
```
storage ra:inventory clear.slot <byte 0-26>
```

**Example:**
```mcfunction
# Clear slot 0 (first slot)
data modify storage ra:inventory clear.slot set value 0b
execute positioned 100 64 200 run function ra_lib:inventory/clear_slot
```

---

#### `ra_lib:inventory/clear_all`

Remove ALL items from a container.

**Context:** At the container block position

**Example:**
```mcfunction
execute positioned 100 64 200 run function ra_lib:inventory/clear_all
```

---

## Scoreboards Reference

| Scoreboard | Purpose |
|------------|---------|
| `ra.temp` | General temporary calculations |
| `ra.player_yaw` | Player's horizontal rotation |
| `ra.player_pitch` | Player's vertical rotation |
| `ra.block_facing` | Calculated block facing (0-5) |
| `ra.dir_type` | Block directionality type (0-2) |
| `ra.axis` | Axis helper for calculations |
| `ra.inv.slot` | Current slot for inventory operations |
| `ra.inv.count` | Item count for inventory operations |
| `ra.inv.max_slot` | Maximum slot number |

---

## Storage Reference

### `ra:block`

Used for block placement data.

```
ra:block data {
    block_tag: string,
    block_id: string,
    dir_type: int
}
```

### `ra:temp`

Temporary storage for calculations.

```
ra:temp {
    Rotation: [float, float],  # [yaw, pitch]
    facing: int,
    slot: byte
}
```

### `ra:inventory`

Used for inventory operations.

```
ra:inventory {
    item: {
        id: string,
        count: int,
        slot: int,
        components: {...}
    },
    clear: {
        id: string,
        count: int,
        components: {...},
        slot: byte
    },
    temp: {...}  # Internal use
}
```

---

## Quick Reference Card

### Place a Custom Block
```mcfunction
data modify storage ra:block data set value {block_tag:"my_block",block_id:"minecraft:dispenser",dir_type:2}
tag @p add ra.placer
execute positioned ~ ~ ~ run function ra_lib:placement/place_block
tag @p remove ra.placer
```

### Give Item to Container
```mcfunction
data modify storage ra:inventory item set value {id:"minecraft:diamond", count:64}
execute positioned ~ ~ ~ run function ra_lib:inventory/give_item
```

### Clear Items from Container
```mcfunction
data modify storage ra:inventory clear set value {id:"minecraft:diamond", count:32}
execute store result score #removed ra.temp positioned ~ ~ ~ run function ra_lib:inventory/clear
```

---

## Version

**RA_Lib v3.0.0** - Part of Redstone Additions Datapack
