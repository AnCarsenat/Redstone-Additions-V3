# RA_Lib Wiki v3.1.0

A modular Minecraft datapack library for custom blocks, redstone detection, and inventory management.

---

## Quick Reference

| Function | Description |
|----------|-------------|
| `ra_lib:init` | Initialize all modules |
| `ra_lib:orientation/get_facing {dir_type:N}` | Get facing from player rotation |
| `ra_lib:placement/place {block_id,block_tag,dir_type}` | Place custom block with marker |
| `ra_lib:removal/check` | Check if block was broken |
| `ra_lib:removal/drop {id,name,custom_data}` | Drop item (doesn't kill marker) |
| `ra_lib:redstone/detect` | Detect all redstone power |
| `ra_lib:inventory/give {id,count}` | Add item to container |
| `ra_lib:inventory/give_nbt` | Add item with components |
| `ra_lib:inventory/find_slot` | Find empty container slot |
| `ra_lib:inventory/clear_all` | Empty container |

---

## Modules

### Orientation

Calculate block facing from player look direction.

#### `ra_lib:orientation/get_facing {dir_type:N}`

**Context:** As player  
**Macro:** `dir_type` - 0=none, 1=horizontal only, 2=all 6 directions

**Output:**
- `@s ra.facing` - Facing value 0-5
- `storage ra:temp Rotation` - `[yaw, pitch]` for armor stands

**Facing Values:**
| Value | Direction | Rotation |
|-------|-----------|----------|
| 0 | Down | `[0f, 90f]` |
| 1 | Up | `[0f, -90f]` |
| 2 | North | `[180f, 0f]` |
| 3 | South | `[0f, 0f]` |
| 4 | West | `[90f, 0f]` |
| 5 | East | `[-90f, 0f]` |

**Behavior:**
- Looking down (pitch > 45) → facing UP (1)
- Looking up (pitch < -45) → facing DOWN (0)  
- Horizontal: Block faces toward player (opposite of look direction)

```mcfunction
# Example: Get full directional facing
execute as @p run function ra_lib:orientation/get_facing {dir_type:2}
# @p now has ra.facing score 0-5
```

---

### Placement

Place custom blocks with invisible armor stand markers.

#### `ra_lib:placement/place {block_id:"...",block_tag:"...",dir_type:N}`

**Context:** At placement position  
**Requires:** Player with tag `ra.placer` nearby

**Macro:**
- `block_id` - Block to place (e.g., `"minecraft:dispenser"`)
- `block_tag` - Tag suffix (becomes `ra.custom_block.{tag}`)
- `dir_type` - Directionality (0/1/2)

**Creates:**
- Physical block with facing
- Invisible marker armor stand with tags:
  - `ra.custom_block`
  - `ra.custom_block.{block_tag}`

```mcfunction
# Example: Place a custom dispenser
tag @p add ra.placer
execute at @p run function ra_lib:placement/place {block_id:"minecraft:dispenser",block_tag:"my_block",dir_type:2}
tag @p remove ra.placer
```

---

### Removal

Detect broken blocks and handle drops. **You control cleanup.**

#### `ra_lib:removal/check`

**Context:** As armor stand, at position  
**Output:** Tag `ra.broken` added if air, returns 1/0

```mcfunction
# Example: Check all my blocks
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.my_block] at @s run function my:on_break
```

#### `ra_lib:removal/drop {item:"..."}`

**Context:** At position  
**Note:** Does NOT kill armor stand - handle cleanup yourself

**Macro:**
- `item` - Full Item compound as string (id, count, components)

```mcfunction
# Example: Drop and cleanup
function ra_lib:removal/drop {item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":'{"text":"My Block"}'}}}
kill @s
```

---

### Redstone

Detect redstone power from all sources.

#### `ra_lib:redstone/detect`

**Context:** As entity, at position

**Detects:**
- Redstone dust (power 0-15)
- Repeaters (power 15)
- Comparators (power 15)
- Levers (power 15)
- Buttons (power 15)
- Redstone blocks (power 15)
- Redstone torches (power 15)

**Output Scores:**
| Score | Description |
|-------|-------------|
| `ra.power` | Max power from any direction (0-15) |
| `ra.power.north` | Power from north |
| `ra.power.south` | Power from south |
| `ra.power.east` | Power from east |
| `ra.power.west` | Power from west |
| `ra.power.up` | Power from above |
| `ra.power.down` | Power from below |

**Output Tags:**
| Tag | Description |
|-----|-------------|
| `ra.powered` | Has any power |
| `ra.powered.strong` | Power level is 15 |
| `ra.powered.{dir}` | north/south/east/west/up/down |
| `ra.powered.{source}` | dust/repeater/comparator/lever/button/block/torch |

```mcfunction
# Example: React to power
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_lib:redstone/detect
execute as @e[tag=ra.powered] if score @s ra.power matches 10.. run say High power!
execute as @e[tag=ra.powered.lever] run say Lever activated!
```

#### `ra_lib:redstone/clear`

**Context:** As entity  
Clears all `ra.powered*` tags. Called automatically by `detect`.

---

### Inventory

Manage block container inventories.

#### `ra_lib:inventory/give {id:"...",count:N}`

**Context:** At container position  
**Returns:** 1 on success, 0 if full

```mcfunction
execute positioned 0 64 0 run function ra_lib:inventory/give {id:"minecraft:diamond",count:64}
```

#### `ra_lib:inventory/give_nbt`

**Context:** At container position  
**Input:** `storage ra:inventory item {id, count, components:{...}}`  
**Returns:** 1 on success, 0 if full

```mcfunction
data modify storage ra:inventory item set value {id:"minecraft:diamond_sword",count:1,components:{custom_name:'"Epic Sword"',enchantments:{levels:{"minecraft:sharpness":5}}}}
execute positioned 0 64 0 run function ra_lib:inventory/give_nbt
```

#### `ra_lib:inventory/find_slot`

**Context:** At container position  
**Output:** `#slot ra.inv.slot` (0-26, or -1 if full)

#### `ra_lib:inventory/clear_all`

**Context:** At container position  
Removes all items from container.

---

## Creating Custom Blocks

### Structure

```
your_pack/data/your_ns/function/blocks/my_block/
├── handle_placement.mcfunction   # Called when placed
├── tick.mcfunction               # Called every tick
└── on_break.mcfunction           # Called when broken
```

### 1. Placement Handler

```mcfunction
# /your_ns:blocks/my_block/handle_placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.my_block] run return 0
function ra_lib:placement/place {block_id:"minecraft:dropper",block_tag:"my_block",dir_type:2}
return 1
```

### 2. Tick Function

```mcfunction
# /your_ns:blocks/my_block/tick

# Check for breaks
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_lib:removal/check
execute as @e[tag=ra.broken,tag=ra.custom_block.my_block] at @s run function your_ns:blocks/my_block/on_break

# Cooldown management
execute as @e[tag=ra.custom_block.my_block] if score @s ra.cooldown matches 1.. run scoreboard players remove @s ra.cooldown 1

# Redstone detection
execute as @e[tag=ra.custom_block.my_block] at @s run function ra_lib:redstone/detect
execute as @e[tag=ra.custom_block.my_block,tag=ra.powered] at @s if score @s ra.cooldown matches 0 run function your_ns:blocks/my_block/on_powered
```

### 3. Break Handler

```mcfunction
# /your_ns:blocks/my_block/on_break
# Context: as armor stand with ra.broken

function ra_lib:removal/drop {id:"minecraft:dropper",name:'{"text":"My Block","color":"aqua"}',custom_data:"{your_ns:{my_block:1b}}"}
kill @s
```

### 4. Register in Function Tags

**`data/ra/tags/function/register_placement_handlers.json`:**
```json
{"values": ["your_ns:blocks/my_block/handle_placement"]}
```

**`data/ra/tags/function/tick_custom_blocks.json`:**
```json
{"values": ["your_ns:blocks/my_block/tick"]}
```

### 5. Give Item Function

```mcfunction
# /your_ns:items/give_my_block
give @s dropper[custom_name='{"text":"My Block","color":"aqua"}',custom_data={your_ns:{my_block:1b}}] 1
```

### 6. Bat Detection (in ra:placement/process_bat)

Add detection for your item's custom_data:
```mcfunction
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{your_ns:{my_block:1b}}}}}] run tag @s add ra.place.my_block
```

---

## Scoreboards

| Scoreboard | Purpose |
|------------|---------|
| `ra.temp` | Temporary calculations |
| `ra.facing` | Block facing (0-5) |
| `ra.yaw` | Player yaw |
| `ra.pitch` | Player pitch |
| `ra.cooldown` | Block cooldown timer |
| `ra.power` | Max redstone power |
| `ra.power.{dir}` | Directional power |
| `ra.inv.slot` | Inventory slot operations |
| `ra.inv.count` | Inventory count operations |

---

## Entity Tags

| Tag | Purpose |
|-----|---------|
| `ra.custom_block` | All custom block markers |
| `ra.custom_block.{type}` | Specific block type |
| `ra.placer` | Player placing a block |
| `ra.broken` | Marker whose block was broken |
| `ra.place.{type}` | Bat carrying specific item |
| `ra.powered` | Has redstone power |
| `ra.powered.{source}` | Power source type |
| `ra.powered.{dir}` | Power direction |
| `ra.new` | Newly spawned marker (temp) |

---

## Storage

| Storage | Purpose |
|---------|---------|
| `ra:temp` | Temporary data (Rotation, facing, facing_name) |
| `ra:block` | Block placement data |
| `ra:inventory` | Inventory operations (item, slot) |
