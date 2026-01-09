# Redstone Additions V3 - Complete Wiki

**Version:** 3.0.1  
**Minecraft Version:** 1.21+  
**Author:** AnCarsenat

> A complete redstone expansion datapack featuring logic gates, interactive machines, sensors, and developer tools.

---

## 📑 Table of Contents

1. [Installation](#installation)
2. [Quick Start](#quick-start)
3. [Block Categories](#block-categories)
   - [Logic Gates](#logic-gates)
   - [Interactive Machines](#interactive-machines)
   - [Sensors](#sensors)
   - [Wireless Redstone](#wireless-redstone)
4. [Tools](#tools)
5. [Library System (ra_lib)](#library-system)
6. [Developer Guide](#developer-guide)
7. [Crafting Recipes](#crafting-recipes)
8. [Technical Details](#technical-details)

---

## 🚀 Installation

### Method 1: Direct Installation
1. Download the `redstone_additions_v3.0.0` folder
2. Place it in your world's `datapacks` folder
3. Run `/reload` in-game
4. Use `/function ra:give_all_items` to get all items in creative mode

### Method 2: From Repository
```bash
git clone https://github.com/AnCarsenat/Redstone-Additions-V3.git
cd Redstone-Additions-V3
# Copy redstone_additions_v3.0.0 to your world's datapacks folder
```

### Verification
After installation, you should see:
```
[Minecraft] [RA] Redstone Additions loaded successfully!
```

---

## 🎮 Quick Start

### Get All Items (Creative)
```mcfunction
/function ra:give_all_items
```

### Get Specific Category
```mcfunction
/function ra_interactive:items/give_all  # Interactive machines
/function ra_gates:items/give_all        # Logic gates
/function ra_sensors:items/give_all      # Sensors
```

### Get Tools
```mcfunction
/function ra:tools/wrench/give              # Wrench (cycle blocks)
/function ra:tools/creative_data_handler/give  # Data viewer
```

---

## 🧩 Block Categories

## Logic Gates

All logic gates are **compact 3×3×3 multiblock structures** that detect redstone input from all 6 directions and output via iron/redstone block transformation.

### 🔵 UNI Gate (Universal Gate)
**Description:** A single programmable gate that can function as any of the 7 logic gate types.  
**Item Model:** Smooth Stone Slab  
**Recipe:** 8 Smooth Stone Slabs + 1 Redstone (center)

**Unique Feature:** Use the **Wrench** (Shift+Right-Click) to cycle through gate modes:
- **AND** - Output when ALL inputs are powered
- **OR** - Output when ANY input is powered  
- **NOT** - Output when NO inputs are powered
- **XOR** - Output when EXACTLY ONE input is powered
- **NAND** - Output when NOT all inputs are powered
- **NOR** - Output when NO inputs are powered
- **XNOR** - Output when NOT exactly one input is powered

**Default Mode:** AND

**Example Usage:**
```mcfunction
# Place a UNI Gate
# Use Shift+Right-Click with Wrench to change modes
# Current mode is displayed in chat
# Mode is saved to the block
```

### 🟢 Individual Logic Gates

All gates below are **NOT craftable** - they are obtained via `/function ra_gates:items/give_all` only. Use the **UNI Gate** for survival gameplay.

#### AND Gate
- **Output:** TRUE when ALL inputs are powered
- **Item Model:** Smooth Stone Slab

#### OR Gate  
- **Output:** TRUE when ANY input is powered
- **Item Model:** Smooth Stone Slab

#### NOT Gate
- **Output:** TRUE when NO inputs are powered  
- **Item Model:** Smooth Stone Slab

#### XOR Gate
- **Output:** TRUE when EXACTLY ONE input is powered
- **Item Model:** Smooth Stone Slab

#### NAND Gate
- **Output:** TRUE when NOT all inputs are powered
- **Item Model:** Smooth Stone Slab

#### NOR Gate
- **Output:** TRUE when NO inputs are powered
- **Item Model:** Smooth Stone Slab

#### XNOR Gate
- **Output:** TRUE when NOT exactly one input is powered
- **Item Model:** Smooth Stone Slab

### ⏰ Clock
**Description:** Programmable redstone clock with customizable interval.  
**Item Model:** Daylight Detector  
**Properties:**
- `interval` - Ticks between pulses (default: 20)

---

## Interactive Machines

All interactive machines are **survival-craftable** and use dispensers/droppers as their base blocks.

### 🔨 Block Breaker
**Description:** Breaks the block in front when powered.  
**Base Block:** Dispenser (facing direction matters)  
**Item Model:** Dispenser  
**Recipe:** [View in recipe book]

**Behavior:**
- Breaks block in facing direction when powered
- Drops items like a player
- Has 2-second cooldown (40 ticks)
- Can break any block (including custom blocks)

**Example Setup:**
```
[Lever] → [Block Breaker] → [Target Block]
```

### 📦 Block Placer  
**Description:** Places stored block in front when powered.
**Base Block:** Dispenser (facing direction matters)
**Item Model:** Dispenser  
**Recipe:** [View in recipe book]

**Behavior:**
- Places block from internal inventory
- Works with any placeable item
- Has 2-second cooldown (40 ticks)
- Facing direction determines placement

### 🚚 Item Pipe
**Description:** Transfers items between containers.  
**Base Block:** Dispenser (facing direction matters)  
**Item Model:** Dispenser  
**Recipe:** 6 Cobblestone/Blackstone + 1 Redstone + 1 Copper + 1 Iron = 8 Item Pipes

**Behavior:**
- Transfers one item per pulse
- Directional transfer (from → to)
- Works with: chests, barrels, hoppers, furnaces, other machines

### 💨 Spitter
**Description:** Spits out items as entities when powered.  
**Base Block:** Dropper (facing direction matters)  
**Item Model:** Dropper  
**Recipe:** [View in recipe book]

**Behavior:**
- Launches items like a dropper
- Has cooldown
- Can be used for item sorting systems

### 🔀 Pusher
**Description:** Pushes entities above it upward.  
**Base Block:** Magenta Glazed Terracotta  
**Item Model:** Magenta Glazed Terracotta  
**Recipe:** [View in recipe book]

**Behavior:**
- Applies upward velocity to entities above
- Continuous operation (no trigger needed)
- Great for elevators and launchers

### 🐣 Breeder
**Description:** Automatically breeds animals when powered.  
**Base Block:** Dispenser  
**Item Model:** Dispenser  
**Recipe:** [View in recipe book]

**Behavior:**
- Breeds animals in front when powered
- Uses items from internal inventory
- Detects breedable mobs automatically

### 💧 Infinite Water Cauldron
**Description:** Cauldron that never empties.  
**Base Block:** Water Cauldron (level 3)  
**Item Model:** Cauldron  
**Recipe:** [View in recipe book]

**Behavior:**
- Always refills to level 3
- Can be used infinitely
- No water source needed

### 🔥 Infinite Lava Cauldron  
**Description:** Cauldron that never empties.
**Base Block:** Lava Cauldron  
**Item Model:** Cauldron  
**Recipe:** [View in recipe book]

**Behavior:**
- Always contains lava
- Infinite lava source
- Great for item destruction

### ❄️ Infinite Snow Cauldron
**Description:** Cauldron that never empties.  
**Base Block:** Powder Snow Cauldron  
**Item Model:** Cauldron  
**Recipe:** [View in recipe book]

**Behavior:**
- Always contains powder snow
- Infinite powder snow source

### 💬 Message Block
**Description:** Displays custom messages when powered.  
**Base Block:** Note Block  
**Item Model:** Note Block  
**Recipe:** [View in recipe book]

**Properties:**
- `message` - Text to display (default: "Hello World!")
- `range` - Display range in blocks (default: 16)

**Behavior:**
- Shows message to players in range
- Triggered by redstone power
- Customizable via Creative Data Handler tool

---

## Sensors

Sensors detect conditions and output redstone signals.

### 👁️ Entity Detector
**Description:** Detects entities in range and outputs redstone signal.  
**Base Block:** Waxed Chiseled Copper  
**Item Model:** Waxed Chiseled Copper  
**Recipe:** [View in recipe book]

**Behavior:**
- Detects any entity within range
- Outputs redstone when entity present
- Adjustable detection range (via data)

### 🏷️ Tag Adder
**Description:** Adds custom tags to entities when powered.  
**Base Block:** Green Glazed Terracotta  
**Item Model:** Green Glazed Terracotta  
**Recipe:** [View in recipe book]

**Behavior:**
- Rising edge trigger (activates on power on)
- Adds specified tag to entities in range
- Works with any entity

### 🚫 Tag Remover
**Description:** Removes custom tags from entities when powered.  
**Base Block:** Red Glazed Terracotta  
**Item Model:** Red Glazed Terracotta  
**Recipe:** [View in recipe book]

**Behavior:**
- Rising edge trigger (activates on power on)
- Removes specified tag from entities in range
- Works with any entity

---

## Wireless Redstone

Wireless redstone allows you to transmit signals across any distance using channels.

### 📡 Wireless Emitter
**Description:** Transmits redstone signals wirelessly on a specific channel.  
**Base Block:** End Stone Bricks  
**Item Model:** End Stone Bricks  
**Recipe:** 4 Gold Ingots + 4 End Stone Bricks + 1 Redstone

**Properties:**
- `channel` - Wireless channel (1-65535, default: 1)
- `enabled` - Whether the emitter is active

**Behavior:**
- When powered, transmits signal to all receivers on same channel
- Works across any distance in the same dimension
- Configure channel with Creative Data Handler

### 📻 Wireless Receiver
**Description:** Receives wireless signals and outputs redstone.  
**Base Block:** Purpur Block  
**Item Model:** Purpur Block  
**Recipe:** 4 Gold Ingots + 4 Purpur Blocks + 1 Redstone

**Properties:**
- `channel` - Wireless channel (1-65535, default: 1)
- `enabled` - Whether the receiver is active
- `mode` - Output mode (toggle/pulse)

**Behavior:**
- Outputs redstone when receiving signal on matching channel
- Can be controlled by Redstone Remote
- Pulse mode: 4-tick pulse duration

### 🎮 Redstone Remote
**Item:** Warped Fungus on a Stick (appears as Red Dye)  
**Obtain:** `/function ra_wireless:items/remote/give`  
**Recipe:** 3 Gold Ingots + 1 Redstone + 1 Stick

**Properties:**
- `channel` - Remote channel (1-65535, default: 1)

**Functions:**
- **Right-Click:** Pulse all receivers on current channel
- **Shift+Right-Click:** Change channel (opens chat input)

**Behavior:**
- Sends 4-tick pulse to all receivers on matching channel
- Works across any distance in the same dimension
- Channel displayed in item lore

---

## 🔧 Tools

### Wrench
**Item:** Blaze Rod (with enchantment glint)  
**Obtain:** `/function ra:tools/wrench/give`

**Functions:**
- **Right-Click:** Interact with multiblock structures
- **Shift+Right-Click:** Cycle block modes (currently only UNI Gate)

**Usage Examples:**
```mcfunction
# Cycle UNI Gate mode
1. Hold wrench
2. Aim at UNI Gate
3. Shift+Right-Click
4. Mode cycles: AND → OR → NOT → XOR → NAND → NOR → XNOR → AND
5. Chat displays current mode
```

### Creative Data Handler
**Item:** Blaze Rod (with enchantment glint)  
**Obtain:** `/function ra:tools/creative_data_handler/give`

**Functions:**
- **Shift+Right-Click on Block:** View and edit block properties
- Shows: Block type, facing direction, all editable properties
- Each property has **[Modify]** and **[-]** (remove) buttons
- **[+Add]** button to add new properties
- **[Edit All]** button to edit all properties at once

**Supported Properties:**
- `channel` - Wireless channel (emitters, receivers)
- `cooldown` - Block cooldown timer
- `delay` - Signal delay (delayer blocks)
- `distance` - Detection/operation distance
- `enabled` - Block enabled state
- `entity_selector` - Entity target selector
- `entity_type` - Entity type filter
- `extend` - Signal extension time
- `gate_type` - Logic gate mode
- `inverted` - Invert output signal
- `message` - Message text (message blocks)
- `mode` - Operation mode
- `power` - Power level output
- `pulse` - Pulse duration
- `range` - Detection range
- `tag` - Entity tag filter
- `target` - Target selector

**Usage:**
```mcfunction
# Edit block properties
1. Hold Creative Data Handler
2. Shift+Right-Click on any custom block
3. Chat menu shows all properties with values
4. Click [Modify] to change a property value
5. Click [-] to remove a property
6. Click [+Add] to add new properties
7. Click [Edit All] for bulk editing
```

---

## 📚 Library System (ra_lib)

The library provides reusable systems for creating custom blocks. **Note:** The removal system has been removed in V3.0.0 - blocks now use direct break detection in their tick functions.

### Available Modules

#### Orientation System
**Purpose:** Calculate block facing from player rotation.

**Function:** `ra_lib:orientation/get_facing {dir_type:N}`
- `dir_type: 0` - No facing
- `dir_type: 1` - Horizontal only (N/S/E/W)
- `dir_type: 2` - Full 6-directional (includes Up/Down)

**Output:**
- `@s ra.facing` score (0-5)
- `storage ra:temp Rotation` - Armor stand rotation

**Facing Values:**
| Value | Direction | Rotation |
|-------|-----------|----------|
| 0 | Down | `[0f, 90f]` |
| 1 | Up | `[0f, -90f]` |
| 2 | North | `[180f, 0f]` |
| 3 | South | `[0f, 0f]` |
| 4 | West | `[90f, 0f]` |
| 5 | East | `[-90f, 0f]` |

#### Placement System
**Purpose:** Place custom blocks with invisible armor stand markers.

**Function:** `ra_lib:placement/place {block_id:"...",block_tag:"...",dir_type:N}`
- `block_id` - Physical block to place (e.g., "minecraft:dispenser")
- `block_tag` - Custom tag suffix (becomes `ra.custom_block.{tag}`)
- `dir_type` - Facing mode (0/1/2)

**Creates:**
- Physical block with facing
- Invisible marker armor stand with tags
- Initialized data structure

#### Redstone Detection
**Purpose:** Detect redstone power from all directions.

**Function:** `ra_lib:redstone/detect`

**Output Scores:**
- `ra.power` - Max power (0-15)
- `ra.power.north/south/east/west/up/down` - Directional power

**Output Tags:**
- `ra.powered` - Has any power
- `ra.powered.strong` - Power level is 15
- `ra.powered.{direction}` - Powered from specific direction
- `ra.powered.{source}` - dust/repeater/comparator/lever/button/block/torch

#### Inventory System
**Purpose:** Manage container inventories programmatically.

**Functions:**
- `ra_lib:inventory/give {id:"...",count:N}` - Add item to container
- `ra_lib:inventory/give_nbt` - Add item with full NBT
- `ra_lib:inventory/find_slot` - Find empty slot
- `ra_lib:inventory/clear_all` - Remove all items

---

## 👨‍💻 Developer Guide

### Creating Custom Blocks

#### 1. Block Structure
```
your_namespace/function/blocks/your_block/
├── handle_placement.mcfunction  # Placement handler
├── tick.mcfunction              # Per-tick logic
├── on_break.mcfunction          # Break handler
├── give.mcfunction              # Give item command
└── process.mcfunction           # (optional) Main logic
```

#### 2. Placement Handler Template
```mcfunction
# /your_ns:blocks/your_block/handle_placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.your_block] run return 0
function ra_lib:placement/place {block_id:"minecraft:dispenser",block_tag:"your_block",dir_type:2}
return 1
```

#### 3. Tick Function Template
```mcfunction
# /your_ns:blocks/your_block/tick

# Break detection - MUST kill vanilla drops BEFORE killing armor stand
execute as @e[tag=ra.custom_block.your_block] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.your_block] at @s run function your_ns:blocks/your_block/on_break

# Cooldown management (if needed)
execute as @e[tag=ra.custom_block.your_block] if score @s ra.cooldown matches 1.. run scoreboard players remove @s ra.cooldown 1

# Redstone detection (if needed)
execute as @e[tag=ra.custom_block.your_block] at @s run function ra_lib:redstone/detect

# Main logic
execute as @e[tag=ra.custom_block.your_block] at @s run function your_ns:blocks/your_block/process
```

#### 4. On Break Handler Template
```mcfunction
# /your_ns:blocks/your_block/on_break
# Context: as armor stand, at position

# CRITICAL: Kill vanilla drop FIRST (before killing armor stand)
kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},distance=..2,limit=1,sort=nearest]

# Drop custom item
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":"Your Block","minecraft:custom_data":{your_ns:{your_block:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.your_block"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

# Effects
playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

# Kill armor stand LAST
kill @s
```

#### 5. Give Function Template
```mcfunction
# /your_ns:blocks/your_block/give

give @s bat_spawn_egg[item_model="minecraft:dispenser",item_name="Your Block",custom_data={your_ns:{your_block:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.your_block"],Silent:1b,NoAI:1b,Invulnerable:1b}]
```

### Important Rules

#### ⚠️ Critical Bug Prevention
**ALWAYS kill vanilla drops BEFORE killing the armor stand!**

❌ **WRONG:**
```mcfunction
kill @s  # Kills armor stand first
kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},distance=..2,limit=1,sort=nearest]  # Too late!
```

✅ **CORRECT:**
```mcfunction
kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},distance=..2,limit=1,sort=nearest]  # Kill drop first
kill @s  # Then kill armor stand
```

**Why?** If you kill the armor stand first, the vanilla block drop timing may cause duplication in survival mode.

#### Break Detection Patterns
Use direct air check in tick function:
```mcfunction
execute as @e[tag=ra.custom_block.your_block] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.your_block] at @s run function your_ns:blocks/your_block/on_break
```

### Scoreboards Reference

| Scoreboard | Purpose |
|------------|---------|
| `ra.temp` | Temporary calculations |
| `ra.facing` | Block facing (0-5) |
| `ra.cooldown` | Block cooldown timer |
| `ra.power` | Max redstone power |
| `ra.power.{dir}` | Directional power (north/south/east/west/up/down) |
| `ra.act_red` | Active redstone inputs (gates) |
| `ra.inac_red` | Inactive redstone inputs (gates) |
| `ra.inv.slot` | Inventory slot operations |
| `ra.inv.count` | Inventory count operations |

### Entity Tags Reference

| Tag | Purpose |
|-----|---------|
| `ra.custom_block` | All custom block markers |
| `ra.custom_block.{type}` | Specific block type |
| `ra.placer` | Player placing a block |
| `ra.broken` | Marker whose block was broken |
| `ra.place.{type}` | Bat carrying specific item |
| `ra.spawned` | Spawned by custom item |
| `ra.powered` | Has redstone power |
| `ra.powered.{source}` | Power source type |
| `ra.new` | Newly spawned marker (temporary) |
| `ra.out_success` | Gate output state |

### Storage Reference

| Storage | Purpose |
|---------|---------|
| `ra:temp` | Temporary data (Rotation, facing, etc.) |
| `ra:inventory` | Inventory operations |
| `ra:cdh` | Creative Data Handler data |

---

## 📖 Crafting Recipes

### Survival Craftable Blocks

#### UNI Gate (Only Craftable Gate)
```
[S] [S] [S]
[S] [R] [S]
[S] [S] [S]

S = Smooth Stone Slab
R = Redstone
Result: 1 UNI Gate
```

#### Item Pipe
```
[C] [C] [C]
[R] [K] [I]
[C] [C] [C]

C = Cobblestone or Blackstone
R = Redstone
K = Copper Ingot
I = Iron Ingot
Result: 8 Item Pipes
```

**Note:** All other blocks have recipes shown in the recipe book. Use the Creative Data Handler tool to inspect crafted blocks.

---

## 🔬 Technical Details

### Architecture

The datapack uses a **modular namespace system**:

```
redstone_additions_v3.0.0/
├── data/
│   ├── minecraft/tags/function/
│   │   └── load.json              # Loads ra:load
│   ├── ra/                        # Core namespace
│   │   ├── function/
│   │   │   ├── load.mcfunction
│   │   │   ├── tick.mcfunction
│   │   │   └── placement/         # Bat-based placement
│   │   └── tags/function/
│   ├── ra_lib/                    # Reusable library
│   │   └── function/
│   │       ├── orientation/       # Facing calculations
│   │       ├── placement/         # Block placement
│   │       ├── redstone/          # Power detection
│   │       └── inventory/         # Container management
│   ├── ra_interactive/            # Interactive machines
│   │   ├── function/blocks/
│   │   └── recipe/
│   ├── ra_gates/                  # Logic gates
│   │   ├── function/blocks/
│   │   └── recipe/
│   └── ra_sensors/                # Sensor blocks
│       ├── function/blocks/
│       └── recipe/
```

### Placement System

Custom blocks use a **bat-based placement system**:

1. Player uses bat spawn egg with custom data
2. Bat spawns at block-aligned position
3. System detects bat with `ra.spawned` tag
4. Routes to appropriate placement handler
5. Handler calls `ra_lib:placement/place`
6. Physical block + marker armor stand created
7. Bat is killed

This ensures:
- Survival compatibility
- Precise block alignment
- Easy item distribution
- Recipe book integration

### Performance

- **Tick Rate:** All blocks tick every game tick
- **Optimization:** Uses targeted selectors (`@e[tag=ra.custom_block.type]`)
- **Scalability:** Modular design allows easy addition of new blocks
- **Memory:** Minimal - uses entity tags and scoreboards

### Compatibility

- **Version:** Minecraft 1.21+
- **Server:** Fully server-compatible
- **Multiplayer:** Fully multiplayer-compatible
- **Other Datapacks:** Should be compatible with most datapacks
- **Mods:** Vanilla-compatible, no mods required

### Known Limitations

- Custom blocks are entities (armor stands), not true blocks
- Breaking a custom block in creative drops the item (not consumed)
- Maximum recommended: ~1000 custom blocks per world (performance)
- Some blocks require specific base blocks to function

---

## 🎯 Examples & Tutorials

### Example 1: Simple AND Gate

**Goal:** Create a door that opens only when two levers are ON.

**Setup:**
1. Get UNI Gate: `/function ra_gates:blocks/uni_gate/give`
2. Place UNI Gate (default mode is AND)
3. Place iron blocks around it (3×3×3 cube)
4. Connect two levers to adjacent sides
5. Place redstone torch on top of iron block
6. Connect torch to door

**Result:** Door opens only when BOTH levers are ON.

### Example 2: Automatic Farm with Block Breaker

**Goal:** Auto-harvest crops.

**Setup:**
1. Get Block Breaker: `/function ra_interactive:blocks/block_breaker/give`
2. Place Block Breaker facing crops
3. Connect to redstone clock
4. Add hopper below to collect drops

**Result:** Automatically harvests crops every 2 seconds.

### Example 3: Item Sorting with Entity Detector

**Goal:** Detect when items drop and activate sorting system.

**Setup:**
1. Get Entity Detector: `/function ra_sensors:blocks/entity_detector/give`
2. Place above item drop area
3. Connect output to item collection system
4. System activates when item entities present

**Result:** Automatic item detection and sorting.

### Example 4: Cycling UNI Gate Modes

**Goal:** Change UNI Gate from AND to OR mode.

**Setup:**
1. Place UNI Gate (starts in AND mode)
2. Get Wrench: `/function ra:tools/wrench/give`
3. Aim at UNI Gate
4. Shift+Right-Click with Wrench
5. Chat displays: "UNI Gate mode: or"

**Result:** Gate now functions as OR gate.

---

## ❓ FAQ

### Q: Why aren't individual gates craftable?
**A:** To reduce recipe clutter and promote the UNI Gate as the universal solution. The UNI Gate can be any gate type, making it more flexible.

### Q: How do I change a UNI Gate's mode?
**A:** Use the Wrench tool (Shift+Right-Click). Get it with `/function ra:tools/wrench/give`.

### Q: Do custom blocks work in survival?
**A:** Yes! All craftable blocks work perfectly in survival mode.

### Q: Can I break custom blocks in survival?
**A:** Yes. Breaking in survival drops the custom item (not the base block).

### Q: Why do some blocks use dispensers/droppers?
**A:** For directional functionality and inventory storage. The base block provides the mechanics.

### Q: How many custom blocks can I place?
**A:** Recommended maximum: ~1000 blocks per world for optimal performance.

### Q: Do custom blocks cause lag?
**A:** Minimal lag. Each block ticks once per game tick with optimized selectors.

### Q: Can I add my own custom blocks?
**A:** Yes! See the [Developer Guide](#developer-guide) section.

### Q: Where are the recipes?
**A:** Most blocks show recipes in the recipe book. The UNI Gate recipe is documented in this wiki.

### Q: What happened to the ra_lib removal system?
**A:** Removed in V3.0.0. Blocks now use direct break detection in tick functions for simplicity.

---

## 🐛 Bug Reports & Support

**Repository:** [https://github.com/AnCarsenat/Redstone-Additions-V3](https://github.com/AnCarsenat/Redstone-Additions-V3)

**Issues:** Please report bugs via GitHub Issues with:
- Minecraft version
- Datapack version
- Steps to reproduce
- Expected vs actual behavior
- Screenshots/videos if applicable

---

## 📜 Changelog

### V3.0.1 (Current)
- Added Wireless Redstone system (ra_wireless namespace)
  - Wireless Emitter: Transmit signals across any distance
  - Wireless Receiver: Receive signals on matching channels
  - Redstone Remote: Handheld remote to pulse receivers
- Remote now pulses receivers (4-tick duration) instead of toggling
- Creative Data Handler major improvements:
  - Can now edit all block properties interactively
  - Added [Modify] buttons to each property
  - Added [Edit All] button for bulk editing
  - Supports all properties: channel, distance, extend, pulse, entity_type, etc.
- Fixed JSON text event syntax (hover_event/click_event with underscores)
- Fixed tool lore formatting (no longer resets to italic)
- Added missing advancements for all blocks:
  - ra_wireless: emitter, receiver, remote
  - ra_gates: beamer, delayer, extender, randomizer, shortener
  - ra_interactive: item_pipe, message_block, pusher, spitter, infinite cauldrons
  - ra_sensors: entity_detector

### V3.0.0
- Complete rewrite from V1
- Added 20+ custom blocks
- Added UNI Gate with 7 modes
- Added Wrench cycling system
- Removed ra_lib removal system (simplified break detection)
- Fixed all block duplication bugs
- Added comprehensive wiki
- Removed individual gate recipes (UNI Gate only)
- Removed player_detector and tag_checker (unfinished)
- Renamed "Conveyor" to "Item Pipe"

---

## 📄 License

This datapack is free to use and modify for personal and server use. Please credit the original author when sharing or redistributing.

---

## 🙏 Credits

**Created by:** AnCarsenat  
**Minecraft Version:** 1.21+  
**Thanks to:** The Minecraft datapacking community for tools and support.

---

*Last Updated: January 9, 2026 (V3.0.1)*
