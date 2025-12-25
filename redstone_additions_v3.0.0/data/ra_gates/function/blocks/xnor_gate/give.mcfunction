# /ra_gates:blocks/xnor_gate/give
# Give XNOR Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE if all inputs same (all on or all off)

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="XNOR Gate",custom_data={ra:{xnor_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.xnor_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
