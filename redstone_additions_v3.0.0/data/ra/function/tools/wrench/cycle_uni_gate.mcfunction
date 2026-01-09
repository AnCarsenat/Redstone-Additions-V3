# /ra:tools/wrench/cycle_uni_gate
# Cycle UNI gate through different gate modes. As armor stand, at position.

# Initialize gate_type if not set
execute unless data entity @s data.properties.gate_type run data modify entity @s data.properties.gate_type set value "and"

# Store current gate type to check
data modify storage ra:temp current_gate set from entity @s data.properties.gate_type

# Cycle to next gate type
execute if data storage ra:temp{current_gate:"and"} run data modify entity @s data.properties.gate_type set value "or"
execute if data storage ra:temp{current_gate:"or"} run data modify entity @s data.properties.gate_type set value "not"
execute if data storage ra:temp{current_gate:"not"} run data modify entity @s data.properties.gate_type set value "xor"
execute if data storage ra:temp{current_gate:"xor"} run data modify entity @s data.properties.gate_type set value "nand"
execute if data storage ra:temp{current_gate:"nand"} run data modify entity @s data.properties.gate_type set value "nor"
execute if data storage ra:temp{current_gate:"nor"} run data modify entity @s data.properties.gate_type set value "xnor"
execute if data storage ra:temp{current_gate:"xnor"} run data modify entity @s data.properties.gate_type set value "and"

# Get the new gate type for display
data modify storage ra:temp current_gate set from entity @s data.properties.gate_type

# Notify player
tellraw @a[distance=..10] [{"text":"[Wrench] ","color":"gold"},{"text":"UNI Gate mode: ","color":"gray"},{"nbt":"current_gate","storage":"ra:temp","color":"light_purple","bold":true}]

# Play sound
playsound minecraft:block.note_block.hat block @a[distance=..16] ~ ~ ~ 0.5 2

# Visual feedback
particle minecraft:happy_villager ~ ~0.5 ~ 0.3 0.3 0.3 0 5

# Clear storage
data remove storage ra:temp current_gate
