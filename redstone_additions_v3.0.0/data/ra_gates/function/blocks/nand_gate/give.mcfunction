# /ra_gates:blocks/nand_gate/give
# Give NAND Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE if at least one input is off (NOT AND)

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="NAND Gate",custom_data={ra:{nand_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.nand_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
