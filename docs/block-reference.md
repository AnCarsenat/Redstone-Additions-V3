# Block Reference

This matrix is generated from block folders, placement handler registrations, and recipe files in `redstone_additions_v3.0.0/data`.

For lifecycle internals and marker architecture, see [How It Works](how-it-works.md).

## Placeable Blocks

| Module | Block ID | Display name | Item model | Recipe |
|---|---|---|---|---|
| ra_gates | uni_gate | UNI Gate | smooth_stone_slab | Yes |
| ra_gates | clock | Clock | daylight_detector | Yes |
| ra_gates | delayer | Delayer | quartz_block | Yes |
| ra_gates | extender | Extender | quartz_block | Yes |
| ra_gates | rand | Randomizer | bookshelf | Yes (`randomizer.json`) |
| ra_gates | shortener | Shortener | quartz_block | Yes |
| ra_interactive | block_breaker | Block Breaker | dispenser | Yes |
| ra_interactive | block_placer | Block Placer | dispenser | Yes |
| ra_interactive | item_pipe | Item Pipe | dispenser | No |
| ra_interactive | item_mover | Item Mover | observer | Yes |
| ra_interactive | spitter | Spitter | dropper | Yes |
| ra_interactive | pusher | Pusher | magenta_glazed_terracotta | Yes |
| ra_interactive | breeder | Breeder | dispenser | Yes |
| ra_interactive | infinite_water_cauldron | Infinite Water Cauldron | cauldron | Yes |
| ra_interactive | infinite_lava_cauldron | Infinite Lava Cauldron | cauldron | Yes |
| ra_interactive | infinite_snow_cauldron | Infinite Snow Cauldron | cauldron | Yes |
| ra_interactive | message_block | Message Block | note_block | Yes (`message.json`) |
| ra_storage | boxer | Boxer | dropper | Yes |
| ra_storage | unboxer | Unboxer | dispenser | Yes |
| ra_sensors | entity_detector | Entity Detector | waxed_chiseled_copper | Yes |
| ra_sensors | tag_adder | Tag Adder | green_glazed_terracotta | Yes |
| ra_sensors | tag_remover | Tag Remover | red_glazed_terracotta | Yes |
| ra_wireless | emitter | Wireless Emitter | end_stone_bricks | Yes |
| ra_wireless | receiver | Wireless Receiver | purpur_block | Yes |
| ra_wires | liquid_pipe (copper) | Copper Liquid Pipe | orange_stained_glass_pane | Yes (`liquid_pipe_copper.json`) |
| ra_wires | liquid_pipe (netherite) | Netherite Liquid Pipe | black_stained_glass_pane | Yes (`liquid_pipe_netherite.json`) |
| ra_wires | liquid_tank | Liquid Tank | copper_block | Yes |
| ra_wires | liquid_pump | Liquid Pump | dispenser | Yes |
| ra_wires | liquid_valve | Liquid Valve | cut_copper | Yes |
| ra_wires | liquid_drain | Liquid Drain | dropper | Yes |
| ra_wires | gas_pipe (copper) | Copper Gas Pipe | light_gray_stained_glass_pane | Yes (`gas_pipe_copper.json`) |
| ra_wires | gas_pipe (netherite) | Netherite Gas Pipe | gray_stained_glass_pane | Yes (`gas_pipe_netherite.json`) |
| ra_wires | gas_tank | Gas Tank | iron_block | Yes |
| ra_wires | gas_pump | Gas Pump | smoker | Yes |
| ra_wires | gas_valve | Gas Valve | smooth_basalt | Yes |
| ra_wires | electric_wire (copper) | Copper Electric Wire | mud_brick_wall | Yes (`electric_wire_copper.json`) |
| ra_wires | electric_wire (netherite) | Netherite Electric Wire | polished_blackstone_wall | Yes (`electric_wire_netherite.json`) |
| ra_wires | electric_generator | EU Generator | blast_furnace | Yes |
| ra_wires | electric_consumer | EU Consumer | observer | Yes |
| ra_wires | electric_switch | EU Switch | redstone_lamp | Yes |
| ra_chunk_loader | chunk_loader | Chunk Loader | lodestone | Yes |
| ra_multiblock | copper_base | Copper Multiblock Base | copper_block | Yes |
| ra_multiblock | iron_base | Iron Multiblock Base | iron_block | Yes |
| ra_multiblock | gold_base | Gold Multiblock Base | gold_block | Yes |
| ra_multiblock | diamond_base | Diamond Multiblock Base | diamond_block | Yes |
| ra_multiblock | netherite_base | Netherite Multiblock Base | netherite_block | Yes |

## Tools

| Module | Tool | Give function | Item |
|---|---|---|---|
| ra | Wrench | `ra:tools/wrench/give` | blaze_rod (orange dye model) |
| ra | Creative Data Handler | `ra:tools/creative_data_handler/give` | blaze_rod (light_blue dye model) |
| ra | Data Handler | `ra:tools/data_handler/give` | blaze_rod (light_blue dye model) |
| ra | Goggles | `ra:tools/goggles/give` | leather_helmet |
| ra_wireless | Redstone Remote | `ra_wireless:tools/remote/give` | blaze_rod (red dye model) |

## Naming Notes

- Gate randomizer uses block ID `rand` and recipe file `randomizer.json`.
- Message block uses item/tag ID `message_block` even though files are under `blocks/message`.

---
