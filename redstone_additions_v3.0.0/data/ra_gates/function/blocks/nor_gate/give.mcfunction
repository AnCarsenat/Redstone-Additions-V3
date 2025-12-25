# /ra_gates:blocks/nor_gate/give
# Give NOR Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE if all inputs are off (NOT OR)

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="NOR Gate",custom_data={ra:{nor_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.nor_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
