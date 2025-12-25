# /ra_gates:blocks/not_gate/give
# Give NOT Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Inverts the input signal

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="NOT Gate",custom_data={ra:{not_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.not_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
