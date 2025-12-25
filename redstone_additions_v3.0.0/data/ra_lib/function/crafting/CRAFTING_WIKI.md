# RA_LIB Crafting System Wiki

## Overview

The ra_lib crafting module provides two custom crafting systems:
1. **Press Crafting** - Drop items on a smithing table and press with a piston
2. **Dispenser Crafting** - Place items in specific slots of a special crafter dispenser

---

## Press Crafting

### How It Works
1. Player drops two items on top of a **smithing table**
2. Player activates a **piston** above the items
3. When the piston head extends over the items, the recipe is checked
4. If valid, ingredients are consumed and result is spawned

### Setup for Developers

#### 1. Initialize the system
Add to your `load.mcfunction`:
```mcfunction
function ra_lib:crafting/init
```

#### 2. Add tick function
Add to your `tick.mcfunction`:
```mcfunction
function ra_lib:crafting/press/tick
```

#### 3. Register recipes
Create a function that checks your recipe and add it to the tag `#ra_lib:crafting/press/recipes`.

**Example recipe function** (`my_pack:crafting/press/my_item.mcfunction`):
```mcfunction
# Recipe: reactor + lava_core = Lava Reactor
function ra_lib:crafting/press/check_recipe {item1_data:{reactor:1b},item2_data:{lava_core:1b},result_id:"minecraft:bat_spawn_egg",result_components:{item_name:"Lava Reactor",custom_data:{lava_reactor:1b},entity_data:{id:"minecraft:bat",Tags:["my_pack.place.lava_reactor"]}},craft_tag:"my_pack.lava_reactor_craft"}
```

**Add to tag** (`data/ra_lib/tags/function/crafting/press/recipes.json`):
```json
{
  "values": [
    "my_pack:crafting/press/my_item"
  ]
}
```

### Macro Parameters for check_recipe

| Parameter | Description | Example |
|-----------|-------------|---------|
| `item1_data` | NBT custom_data matcher for first ingredient | `{reactor:1b}` |
| `item2_data` | NBT custom_data matcher for second ingredient | `{lava_core:1b}` |
| `result_id` | Minecraft item ID for result | `"minecraft:bat_spawn_egg"` |
| `result_components` | Full components for result item | `{item_name:"My Item",custom_data:{my_item:1b}}` |
| `craft_tag` | Unique tag to prevent conflicts | `"my_pack.my_item_craft"` |

---

## Dispenser Crafting

### How It Works
1. Player places a special **RA Crafter** block (looks like a dispenser)
2. Player arranges items in the 3x3 grid inside the dispenser
3. Recipe is automatically checked and center slot is replaced with result

### Slot Layout
```
+---+---+---+
| 0 | 1 | 2 |
+---+---+---+
| 3 | 4 | 5 |
+---+---+---+
| 6 | 7 | 8 |
+---+---+---+
```

### Setup for Developers

#### 1. Initialize the system
Add to your `load.mcfunction`:
```mcfunction
function ra_lib:crafting/init
```

#### 2. Add tick function
Add to your `tick.mcfunction`:
```mcfunction
function ra_lib:crafting/dispenser/tick
```

#### 3. Give player the crafter
```mcfunction
function ra_lib:crafting/dispenser/give_crafter
```

#### 4. Register recipes
Create a function that checks your recipe and add it to the tag `#ra_lib:crafting/dispenser/recipes`.

**Example recipe function** (`my_pack:crafting/dispenser/gates.mcfunction`):
```mcfunction
# Recipe for Logic Gates item
# Layout:
#   [redstone_torch] [empty] [empty]
#   [redstone] [repeater] [redstone]
#   [cobblestone_slab] [cobblestone_slab] [cobblestone_slab]

function ra_lib:crafting/dispenser/check_recipe {recipe_slots:'[{Slot:0b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:redstone",Count:1b},{Slot:4b,id:"minecraft:repeater",Count:1b},{Slot:5b,id:"minecraft:redstone",Count:1b},{Slot:6b,id:"minecraft:cobblestone_slab",Count:1b},{Slot:7b,id:"minecraft:cobblestone_slab",Count:1b},{Slot:8b,id:"minecraft:cobblestone_slab",Count:1b}]',craft_id:1,result_slot:4b,result_item:'{id:"minecraft:armor_stand",count:1,components:{"minecraft:custom_name":"\"Logic Gates\"","minecraft:custom_data":{gates:1b}}}'}
```

**Add to tag** (`data/ra_lib/tags/function/crafting/dispenser/recipes.json`):
```json
{
  "values": [
    "my_pack:crafting/dispenser/gates"
  ]
}
```

### Macro Parameters for check_recipe

| Parameter | Description | Example |
|-----------|-------------|---------|
| `recipe_slots` | JSON array of slot/item definitions | `'[{Slot:0b,id:"minecraft:iron",Count:1b}]'` |
| `craft_id` | Unique numeric ID (1+) | `1` |
| `result_slot` | Which slot to place result | `4b` (center) |
| `result_item` | Full NBT for result item | `'{id:"minecraft:diamond",count:1}'` |

### Recipe Slot Format
Each slot in `recipe_slots` needs:
- `Slot:Xb` - Slot number (0-8) as byte
- `id:"minecraft:item"` - Item ID
- `Count:1b` - Count as byte (usually 1b)

Optional:
- `components:{...}` - For checking custom items

---

## Tips

### Creating Ingredient Items
Give players custom ingredient items:
```mcfunction
give @s paper[item_name="Reactor Core",custom_data={reactor:1b},enchantment_glint_override=true]
give @s magma_cream[item_name="Lava Core",custom_data={lava_core:1b}]
```

### Multiple Recipes
You can have multiple recipes in one function file or split them across files.

### Conflicts
- Use unique `craft_tag` values to prevent recipe conflicts
- Use unique `craft_id` numbers for dispenser recipes

### Sound Effects
Both systems play `anvil.land` or `anvil.use` by default. Modify the check_recipe function if you want custom sounds.

---

## File Structure Example

```
data/
  my_pack/
    function/
      load.mcfunction
      tick.mcfunction
      crafting/
        press/
          lava_reactor.mcfunction
          mineral_reactor.mcfunction
        dispenser/
          gates.mcfunction
          sensors.mcfunction
    tags/
      function/
        ... (add your recipes to ra_lib tags)
  ra_lib/
    tags/
      function/
        crafting/
          press/
            recipes.json   <- Add your press recipes here
          dispenser/
            recipes.json   <- Add your dispenser recipes here
```
