# Redstone Additions V3 — Development Plans

**Current Version:** 3.3.0  
**Target Version:** 4.0.0  
**Minecraft:** 1.21+

---

## Table of Contents

1. [Critical Fixes](#1-critical-fixes)
2. [Blast Forge Rework](#2-blast-forge-rework)
3. [Goggles (New Tool)](#3-goggles-new-tool)
4. [Uninstall Rewrite](#4-uninstall-rewrite)
5. [Naming Convention Overhaul](#5-naming-convention-overhaul)
6. [Pack Tidying](#6-pack-tidying)
7. [Guidelines Document](#7-guidelines-document)

---

## 1. Critical Fixes

> Fix broken references, ghost blocks, and missing implementations before adding new features.

### 1.1 Beamer — Ghost Block
- [ ] Or remove all Beamer references if it's not ready for release

### 1.2 Conveyor — Recipe/Advancement Without Implementation
`ra_interactive/recipe/conveyor.json` and `ra_advancements/advancement/ra_interactive/unlock_conveyor.json` exist, but there is no `blocks/conveyor/` folder.  
- [ ] Implement the Conveyor block (placement, tick, break, process)
- [ ] Or disable the recipe and advancement until implemented by setting wrong file extension

### 1.3 Clock — Missing Recipe
`ra_gates/function/blocks/clock/` exists but there is no `ra_gates/recipe/clock.json`.  
- [ ] Add a crafting recipe for the Clock block (the items generally used for a clock)

### 1.4 `ra_wireless/pack.mcmeta` — Stray File
`data/ra_wireless/pack.mcmeta` should not exist inside a namespace folder.  
- [ ] Delete `data/ra_wireless/pack.mcmeta`

### 1.5 `ra.cooldown` Scoreboard — Duplicate Definition
Created in both `ra/function/load.mcfunction` and `ra_lib/function/placement/init.mcfunction`.  
- [ ] Remove one of the duplicate definitions (keep it in `ra_lib` where it's used)

### 1.6 Blast Forge `on_break` — Empty Function
`ra_multiblock/function/blocks/blast_forge/on_break.mcfunction` is empty.  
- [ ] Implement cleanup: drop items from barrels, remove marker, play effects
    Note blast forge doesn't use on break, will be used for unstable reactors / other

### 1.8 Version Mismatches
README badge says 3.1.0, WIKI says 3.0.1, code is 3.3.0.  
- [ ] Update README badge to 3.3.0 (or target version)
- [ ] Either update WIKI.md or fully remove it (it's deprecated per its own notice)

---

## 2. Blast Forge Rework

> The forge currently processes items on a flat 5-second timer with no heat mechanic. Rework it to use a heat system.

### 2.1 Heat Counter System
- [ ] Add status `data.status.heat` for per-forge heat tracking (stored in multiblock marker)
- [ ] Heat increases when fuel is consumed, decreases by 1 every N ticks passively
- [ ] Processing only occurs when heat is above a threshold (e.g., `heat >= 100`)
- [ ] Different fuel tiers:

| Fuel | Heat Given |
|------|-----------|
| Coal | +50 |
| Charcoal | +40 |
| Blaze Powder | +500 |
| Blaze Rod | +1500 |
| Lava Bucket | +5000 |

### 2.2 Heat-Based Processing Speed
- [ ] Higher heat = faster processing (reduce tick interval or process multiple items)
- [ ] Cap heat at a max value (e.g., 1000) to prevent infinite stacking
- [ ] Add visual feedback: particle intensity scales with heat level

### 2.3 Fuel Consumption Logic
- [ ] Fuel is consumed only when heat is below max and there are items to process
- [ ] Fuel slot checked every processing cycle
- [ ] Empty fuel → heat decays, processing eventually stops

### 2.4 Status Data
- [ ] Store heat, current recipe, progress in marker's `data.status`:
  ```
  data.status: {heat: 250, processing: "iron_ingot", progress: 3}
  ```
- [ ] This data is readable by Goggles (see §3)

### 2.5 Higher-Tier Forge Variants
- [ ] Iron/Gold/Diamond/Netherite bases should allow for other multiblocks added later on

---

## 3. Goggles (New Tool)

> A wearable/holdable tool that reveals information about custom blocks and multiblocks.

### 3.1 Crafting Recipe
- [ ] Copper Helmet + 2* Glass Pane + 1* Gold Ingot → Goggles
- [ ] Recipe shape:
  ```
  [] [Helmet] []]
  [Glass pane] [Gold ingot] [Glass pane]
  ```
- [ ] Custom model data or use a custom item via components (a helmet)

### 3.2 Block Name Billboards
- [ ] When holding/wearing Goggles, detect nearby custom blocks (`@e[tag=ra.custom_block, distance=..16]`)
- [ ] For each custom block, summon a temporary `text_display` entity (billboard) above it showing the block's name 
- [ ] Use **macro functions** to dynamically generate the billboard text from the block's type tag
- [ ] Billboards despawn if no player is arround
- [ ] Implementation: `ra/function/tools/goggles/scan_blocks.mcfunction` with `$(...)`macro dispatch
- [ ] Goggles dispaly to max distance of 16

### 3.3 Multiblock I/O Indicators
- [ ] For multiblock structures, summon `block_display` entities at I/O positions:
  - **Green stained glass** block display → Input slots (barrels receiving materials)
  - **Red stained glass** block display → Output slots (barrels holding results)
  - **Yellow stained glass** block display → Control blocks (redstone, base block)
- [ ] Show billboards on each I/O indicating what it accepts (e.g., "Raw Ores", "Fuel", "Output")
- [ ] Read positions from `ra:multiblock bf_dir.{facing}` storage (already has all block offsets)

### 3.4 Block Status Display
- [ ] Use same system as data handler to get current block
- [ ] Read `data.properties` from the block's marker entity
- [ ] Display status info as billboard text:
  - Forge: `Heat: 250/1000 | Processing: Iron Ingot (60%)`
  - Gates: `Mode: AND | Input A: ON | Input B: OFF`
  - Wireless: `Channel: "main" | Signal: 12`
  - Sensors: `Detecting: 3 entities`
- [ ] Update every scan cycle (~2 sec)

### 3.5 File Structure
```
ra/function/tools/goggles/
├── give.mcfunction
├── tick.mcfunction           # detect if player is holding/wearing goggles
├── scan_blocks.mcfunction    # find nearby custom blocks, dispatch billboards
├── scan_multiblocks.mcfunction  # find nearby multiblock markers, show I/O
├── billboard/
│   ├── handle_billboards.mcfunction      # macro: summon text_display with $(name)
└── status/
    ├── read_status_macro.mcfunction
```

---

## 4. Uninstall Rewrite

> Current uninstall is broken: removes wrong scoreboards, misses multiblock markers, doesn't clear storage.

### 4.1 Confirmation Prompt
- [ ] When `/function ra:uninstall` is called, show a clickable chat message:
  ```
  [RA] Are you sure you want to uninstall Redstone Additions?
  [CONFIRM] [CANCEL]
  ```
- [ ] `[CONFIRM]` runs `ra:uninstall/confirm`
- [ ] `[CANCEL]` sends "Uninstall cancelled" message

### 4.2 Full Cleanup — `uninstall/confirm.mcfunction`
- [ ] Kill all custom block entities: `kill @e[tag=ra.custom_block]`
- [ ] Kill all multiblock markers: `kill @e[tag=ra.multiblock]`
- [ ] Kill all goggle billboards: `kill @e[tag=ra.billboard]`
- [ ] Kill all display entities: `kill @e[tag=ra.display]`
- [ ] Remove **all** scoreboards:
  ```
  ra.edit_type, ra.edit_step, ra.cooldown, ra.temp, ra.facing,
  ra.yaw, ra.pitch, ra.power, ra.power.up, ra.power.down,
  ra.power.north, ra.power.south, ra.power.east, ra.power.west,
  ra.inv.slot, ra.inv.count, ra.act_red, ra.inac_red, ra.dir,
  ra.channel, ra.pulse_timer, ra.multiblock, ra.mb_timer,
  ra.mb_enabled, ra.craft_id, ra.heat
  ```
- [ ] Clear data storage:
  ```
  data remove storage ra:multiblock {}
  data remove storage ra:temp {}
  data remove storage ra:block {}
  data remove storage ra:cdh {}
  ```
- [ ] Cancel scheduled ticks: `schedule clear ra:tick`
- [ ] Remove player-held tags: `tag @a remove ra.wrench_active`, `tag @a remove ra.cdh_active`, `tag @a remove ra.goggles_active`
- [ ] Final message: `[RA] Redstone Additions has been uninstalled. You may now disable the datapack.`

---

## 5. Naming Convention Overhaul

> Standardize all naming across the pack for consistency.

### 5.1 Current Conventions (Keep)
These are already consistent — keep them:
- **Entity tags:** `ra.{category}.{name}` (e.g., `ra.custom_block.block_breaker`)
- **Scoreboards:** `ra.{name}` (e.g., `ra.power`, `ra.temp`)
- **Storage:** `ra:{namespace}` (e.g., `ra:multiblock`, `ra:temp`)
- **Custom data:** `ra:{block_name:1b}` (e.g., `ra:{block_breaker:1b}`)
- **Properties, data, statuses** `data.properties, data.(...), data.status`

### 5.2 Fixes Needed
- [ ] `ra_gates:load` should call `register_block` for each gate block (like `ra_interactive` and `ra_sensors` do)
- [ ] Ensure all block folders follow the exact same file set:
  ```
  blocks/{name}/
  ├── give.mcfunction
  ├── handle_placement.mcfunction
  ├── register_block.mcfunction
  ├── tick.mcfunction
  ├── on_break.mcfunction
  └── process.mcfunction (if applicable)
  ```
- [ ] Rename any files that don't match this pattern
- [ ] Ensure all `give.mcfunction` files use the same item component format
- [ ] Standardize `tellraw` message format across all blocks (same prefix style, same colors)

### 5.3 Namespace Boundaries
- [ ] Verify each namespace only handles its own blocks (no cross-namespace function calls except to `ra_lib`/`ra_lib_multiblock`)
- [ ] Remove `ra_wireless/pack.mcmeta` (namespaces shouldn't have their own pack metadata)

---

## 6. Pack Tidying

> Clean up dead code, legacy artifacts, and organizational clutter.

### 6.3 Clean Up `give_all_items.mcfunction`
- [ ] Remove debug/test items (Output 1/2/3)
- [ ] Organize items by category with comments:
  ```
  # === Tools ===
  # === Interactive Blocks ===
  # === Gate Blocks ===
  # === Sensor Blocks ===
  # === Wireless Blocks ===
  # === Multiblock Bases ===
  ```

### 6.4 Unused File Audit
- [ ] Search for unreferenced `.mcfunction` files
- [ ] Remove or implement any stub functions that are empty
- [ ] Check all JSON predicates/advancements still point to valid functions

### 6.5 Comment Standards
- [ ] Add a header comment to every `.mcfunction` file:
  ```
  # /path/to/file.mcfunction
  # Short comment
  # Longer comment if complicated fucntions
  ```
- [ ] Add inline comments for complex logic (especially macro functions and NBT manipulation)

---

## 7. Guidelines Document

> Write a CONTRIBUTING.md or GUIDELINES.md for maintainers.

### 7.1 Naming Conventions Reference
- [ ] Document all naming patterns (tags, scoreboards, storage, custom data, functions)
- [ ] Provide templates for new blocks

### 7.2 New Block Checklist
When adding a new custom block, update:
- [ ] `{namespace}/function/blocks/{name}/` — all 5-6 standard files
- [ ] `{namespace}/function/items/give_{name}.mcfunction`
- [ ] `{namespace}/recipe/{name}.json`
- [ ] `ra_advancements/advancement/{category}/unlock_{name}.json`
- [ ] `ra/function/give_all_items.mcfunction`
- [ ] `{namespace}/function/load.mcfunction` — register the block
- [ ] `{namespace}/function/tick.mcfunction` — add tick dispatch
- [ ] `ra/function/tools/cdh/found_block.mcfunction` — add CDH support
- [ ] CHANGELOG.md — document the addition

### 7.3 Release Checklist
- [ ] Update version in `pack.mcmeta` (description + pack_format)
- [ ] Update README badge version
- [ ] Update CHANGELOG.md with all changes
- [ ] Run full test: place every block, verify crafting, verify wrench, verify uninstall
- [ ] Remove all debug/test items and functions
- [ ] Verify no broken function calls (`/reload` in-game and check logs)

### 7.4 Multiblock Checklist
When adding a new multiblock structure:
- [ ] Define direction data in `ra_multiblock/function/load.mcfunction`
- [ ] Create structure validation macro functions
- [ ] Create processing logic
- [ ] Add wrench assembly support (`ra/function/tools/wrench/try_assemble_{tier}.mcfunction`)
- [ ] Add I/O data for Goggles display
- [ ] Add recipes for required base tier
- [ ] Add advancement

---

## Priority Order

| Priority | Task | Effort | Impact |
|----------|------|--------|--------|
| **P0** | §1 Critical Fixes | Low | Prevents runtime errors |
| **P1** | §4 Uninstall Rewrite | Low | Essential functionality |
| **P1** | §5 Naming Conventions | Medium | Code quality |
| **P2** | §2 Blast Forge Rework | High | Core gameplay feature |
| **P2** | §6 Pack Tidying | Medium | Code quality |
| **P3** | §3 Goggles | High | New feature |
| **P3** | §7 Guidelines | Low | Maintainability |

### IGNORE NEXT INSTRUCTIONs
Make data handler modular and auto list properties without having to have spearate files for each block.