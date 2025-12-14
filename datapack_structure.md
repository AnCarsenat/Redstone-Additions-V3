# Redstone Additions V3.0.0 - Complete Datapack Structure

## File Structure

```
data/
├── ra/
│   ├── function/
│   │   ├── load.mcfunction
│   │   ├── tick.mcfunction
│   │   ├── uninstall.mcfunction
│   │   │
│   │   ├── lib/
│   │   │   ├── import.mcfunction
│   │   │   │
│   │   │   ├── orientation/
│   │   │   │   ├── import.mcfunction
│   │   │   │   ├── get_player_facing.mcfunction
│   │   │   │   ├── calculate_block_direction.mcfunction
│   │   │   │   └── get_rotation_from_facing.mcfunction
│   │   │   │
│   │   │   ├── placement/
│   │   │   │   ├── import.mcfunction
│   │   │   │   ├── detect_bats.mcfunction
│   │   │   │   ├── process_bat.mcfunction
│   │   │   │   ├── place_block.mcfunction
│   │   │   │   └── summon_armor_stand.mcfunction
│   │   │   │
│   │   │   └── removal/
│   │   │       ├── import.mcfunction
│   │   │       ├── detect_break.mcfunction
│   │   │       └── drop_item.mcfunction
│   │   │
│   │   ├── custom_blocks/
│   │   │   ├── block_breaker/
│   │   │   │   └── (defined in ra_interactive)
│   │   │   │
│   │   │   ├── block_placer/
│   │   │   │   └── (future)
│   │   │   │
│   │   │   ├── conveyor/
│   │   │   │   └── (future)
│   │   │   │
│   │   │   └── reactors/
│   │   │       └── (future)
│   │   │
│   │   └── items/
│   │       ├── give_all.mcfunction
│   │       └── give_block_breaker.mcfunction
│   │
│   └── tags/
│       └── block/
│           └── unbreakable.json
│
├── ra_interactive/
│   ├── function/
│   │   ├── load.mcfunction
│   │   ├── tick.mcfunction
│   │   │
│   │   └── custom_blocks/
│   │       └── block_breaker/
│   │           ├── register.mcfunction
│   │           ├── tick.mcfunction
│   │           ├── on_powered.mcfunction
│   │           └── break_block.mcfunction
│   │
│   └── tags/
│       └── function/
│           └── ra_tick_blocks.json
│
└── minecraft/
    └── tags/
        └── function/
            └── load.json

---

## RA Interactive Namespace (Example Implementation)

### `data/ra_interactive/function/load.mcfunction`

```mcfunction
# RA Interactive - Example Custom Blocks

# Register custom blocks
function ra_interactive:custom_blocks/block_breaker/register

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Interactive blocks loaded!","color":"aqua"}]
```

---z

### `data/ra_interactive/function/tick.mcfunction`

```mcfunction
# Tick all interactive custom blocks

function ra_interactive:custom_blocks/block_breaker/tick
```

---

### `data/ra_interactive/function/custom_blocks/block_breaker/register.mcfunction`

```mcfunction
# Register block breaker


tellraw @a [{"text":"[RA] ","color":"gold"},{"text":"Block Breaker registered","color":"gray"}]
```

---

### `data/ra_interactive/function/custom_blocks/block_breaker/placement.mcfunction`

```mcfunction
# Handle block breaker placement
# Context: as bat, at bat position
# Called via function tag ra:register_placement

# Only process if this is a block breaker bat
execute unless entity @s[tag=ra.place.block_breaker] run return 0

# Set block definition in storage
data modify storage ra:block set value {block_tag:"block_breaker",block_id:"minecraft:dispenser",dir_type:2}

# Place the block using the library
execute align xyz positioned ~0.5 ~ ~0.5 run function ra:lib/placement/place_block

return 1
```

---

### `data/ra_interactive/function/custom_blocks/block_breaker/tick.mcfunction`

```mcfunction
# Tick all block breakers

# Decrease cooldowns
execute as @e[tag=ra.custom_block.block_breaker,scores={ra.bb.cooldown=1..}] run scoreboard players remove @s ra.bb.cooldown 1

# Check for powered dispensers
execute as @e[tag=ra.custom_block.block_breaker] at @s if block ~ ~ ~ dispenser[triggered=true] run function ra_interactive:custom_blocks/block_breaker/on_powered
```

---

### `data/ra_interactive/function/custom_blocks/block_breaker/on_powered.mcfunction`

```mcfunction
# Called when block breaker dispenser is powered
# Context: as armor stand, at armor stand

# Check cooldown
execute if score @s ra.bb.cooldown matches 1.. run return fail

# Set cooldown (20 ticks = 1 second)
scoreboard players set @s ra.bb.cooldown 20

# Break block in front
function ra_interactive:custom_blocks/block_breaker/break_block
```

---

### `data/ra_interactive/function/custom_blocks/block_breaker/break_block.mcfunction`

```mcfunction
# Break the block in front of the armor stand
# Context: as armor stand facing the target direction, at armor stand

# Use armor stand's rotation to break block in front
# ^ ^ ^1 means 1 block in the direction the armor stand is facing
execute positioned ^ ^ ^1 unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy

# Alternative: Use stored facing data
# execute if score @s ra.block_facing matches 0 positioned ~ ~-1 ~ unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
# execute if score @s ra.block_facing matches 1 positioned ~ ~1 ~ unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
# execute if score @s ra.block_facing matches 2 positioned ~ ~ ~-1 unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
# execute if score @s ra.block_facing matches 3 positioned ~ ~ ~1 unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
# execute if score @s ra.block_facing matches 4 positioned ~-1 ~ ~ unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy
# execute if score @s ra.block_facing matches 5 positioned ~1 ~ ~ unless block ~ ~ ~ #ra:unbreakable run fill ~ ~ ~ ~ ~ ~ air destroy

# Play sound
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 0.8

# Particle effect
execute positioned ^ ^ ^1 run particle minecraft:block{block_state:"minecraft:stone"} ~ ~ ~ 0.3 0.3 0.3 0.1 20
```

---

### `data/ra_interactive/tags/function/ra_register_placement.json`

```json
{
  "values": [
    "ra_interactive:custom_blocks/block_breaker/placement"
  ]
}
```

---

### `data/ra_interactive/tags/function/ra_tick_blocks.json`

```json
{
  "values": [
    "ra_interactive:tick"
  ]
}
```

---

## How to Add New Custom Blocks (Step-by-Step Guide)

### Example: Adding a "Block Placer"

#### 1. Create bat spawn egg item function

`data/my_namespace/function/items/give_block_placer.mcfunction`:
```mcfunction
give @s bat_spawn_egg[item_name='{"text":"Block Placer","color":"gold"}',lore=['{"text":"Places blocks when powered","color":"gray","italic":false}'],custom_data={block_placer:true},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.block_placer"],Silent:1b,NoAI:1b,Invulnerable:1b}]
```

#### 2. Create placement handler

`data/my_namespace/function/custom_blocks/block_placer/placement.mcfunction`:
```mcfunction
# Handle block placer placement
# Context: as bat, at bat position

# Only process if this is a block placer bat
execute unless entity @s[tag=ra.place.block_placer] run return 0

# Set block definition
# dir_type: 0 = non-directional, 1 = planar (4-way), 2 = full directional (6-way)
data modify storage ra:block set value {block_tag:"block_placer",block_id:"minecraft:dispenser",dir_type:2}

# Place using library
execute align xyz positioned ~0.5 ~ ~0.5 run function ra:lib/placement/place_block

return 1
```

#### 3. Register placement in function tag

`data/my_namespace/tags/function/ra_register_placement.json`:
```json
{
  "values": [
    "my_namespace:custom_blocks/block_placer/placement"
  ]
}
```

#### 4. Create tick logic

`data/my_namespace/function/custom_blocks/block_placer/tick.mcfunction`:
```mcfunction
# Tick all block placers
execute as @e[tag=ra.custom_block.block_placer] at @s if block ~ ~ ~ dispenser[triggered=true] run function my_namespace:custom_blocks/block_placer/place_block
```

#### 5. Create your custom logic

`data/my_namespace/function/custom_blocks/block_placer/place_block.mcfunction`:
```mcfunction
# Place a block in front
# Context: as armor stand, at armor stand

# Use armor stand rotation to place 1 block ahead
execute positioned ^ ^ ^1 if block ~ ~ ~ air run setblock ~ ~ ~ stone

# Or use stored facing data:
# execute if score @s ra.block_facing matches 0 positioned ~ ~-1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ stone
# execute if score @s ra.block_facing matches 1 positioned ~ ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ stone
# etc...
```

#### 6. Register tick in function tag

`data/my_namespace/tags/function/ra_tick_blocks.json`:
```json
{
  "values": [
    "my_namespace:custom_blocks/block_placer/tick"
  ]
}
```

#### 7. Add removal handling

`data/my_namespace/function/custom_blocks/block_placer/on_break.mcfunction`:
```mcfunction
# Drop bat spawn egg when broken
# Context: as armor stand, at armor stand

summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_name":'{"text":"Block Placer","color":"gold"}',custom_data:{block_placer:true},entity_data:{id:"minecraft:bat",Tags:["ra.spawned","ra.place.block_placer"],Silent:1b,NoAI:1b}}}}

kill @s
```

Register in `data/ra/function/lib/removal/drop_item.mcfunction`:
```mcfunction
execute if entity @s[tag=ra.custom_block.block_placer] run function my_namespace:custom_blocks/block_placer/on_break
```

---

## Summary

### System Architecture

1. **Universal Placement System**:
   - Any namespace can register custom blocks via `#ra:register_placement` function tag
   - Each block handler checks if the bat has its tag
   - Defines block properties in storage: `{block_tag, block_id, dir_type}`
   - Core library handles orientation calculation and placement
   - No hardcoded block types in the core system!

2. **Block Definition Storage**:
   ```mcfunction
   data modify storage ra:block set value {
     block_tag: "block_breaker",      # Armor stand tag: ra.custom_block.{block_tag}
     block_id: "minecraft:dispenser",  # Physical Minecraft block
     dir_type: 2                       # 0=none, 1=planar, 2=full directional
   }
   ```

3. **Directional Types**:
   - **0 (Non-directional)**: No rotation, block always faces "up" (e.g., reactors, machines)
   - **1 (Planar)**: 4-way horizontal only (N/S/E/W) - e.g., conveyors
   - **2 (Full directional)**: 6-way including vertical (N/S/E/W/U/D) - e.g., block breaker

4. **Armor Stand Data**:
   - `Rotation[0]` and `Rotation[1]` - Direction the block faces
   - `ra.block_facing` scoreboard - Numeric facing (0-5)
   - `ra.custom_block.{name}` tag - Block type identifier
   - Position is at block center (aligned + 0.5 offset)

5. **Two Ways to Use Direction**:
   - **Method A**: Use armor stand rotation with `positioned ^ ^ ^1` (cleaner!)
   - **Method B**: Use `ra.block_facing` scoreboard for manual direction checks

6. **Modular Design**:
   - **Core (ra)**: Placement/removal/orientation library - never needs modification!
   - **Custom namespaces**: Implement blocks by hooking into function tags
   - Each block is completely isolated in its own namespace
   - Zero coupling between custom block implementations

### Function Tags for Extension

- `#ra:register_placement` - Called when bat is placed, return 1 if handled
- `#ra:tick_blocks` - Called every tick for custom block logic

### Quick Start Checklist

To add a new custom block:
- [ ] Create bat spawn egg give function
- [ ] Create placement handler (check bat tag, set storage, call library)
- [ ] Add to `#ra:register_placement` function tag
- [ ] Create tick logic
- [ ] Add to `#ra:tick_blocks` function tag
- [ ] Add removal handler in `drop_item.mcfunction`
- [ ] Done! Your block works with the entire system

The block breaker example in `ra_interactive` shows the complete pattern!