# /ra_gates:blocks/xor_gate/give
# Give XOR Gate block item to player
# Input: all adjacent redstone, Output: redstone torch on top
# Outputs TRUE if exactly one input on, one off (for 2 inputs)

give @s bat_spawn_egg[item_model="minecraft:smooth_stone_slab",item_name="XOR Gate",custom_data={ra:{xor_gate:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.xor_gate"],Silent:1b,NoAI:1b,Invulnerable:1b}]
