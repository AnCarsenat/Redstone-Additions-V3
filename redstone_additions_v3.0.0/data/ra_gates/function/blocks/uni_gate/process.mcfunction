# /ra_gates:blocks/uni_gate/process
# Process UNI gate logic. As armor stand, at position.

# Initialize gate_type if not set (default to AND)
execute unless data entity @s data.properties.gate_type run data modify entity @s data.properties.gate_type set value "and"

# Clear output tag
tag @s remove ra.out_success

# AND: Output TRUE only if ALL inputs are powered and at least one input exists
execute if data entity @s data.properties{gate_type:"and"} if score @s ra.act_red matches 1.. if score @s ra.inac_red matches 0 run tag @s add ra.out_success

# OR: Output TRUE if ANY input is powered
execute if data entity @s data.properties{gate_type:"or"} if score @s ra.act_red matches 1.. run tag @s add ra.out_success

# NOT: Output TRUE if NO inputs are powered
execute if data entity @s data.properties{gate_type:"not"} if score @s ra.act_red matches 0 run tag @s add ra.out_success

# XOR: Output TRUE if exactly ONE input is powered
execute if data entity @s data.properties{gate_type:"xor"} if score @s ra.act_red matches 1 run tag @s add ra.out_success

# NAND: Output TRUE if NOT all inputs are powered (inverse of AND)
execute if data entity @s data.properties{gate_type:"nand"} unless score @s ra.act_red matches 1.. run tag @s add ra.out_success
execute if data entity @s data.properties{gate_type:"nand"} if score @s ra.inac_red matches 1.. run tag @s add ra.out_success

# NOR: Output TRUE if NO inputs are powered (inverse of OR)
execute if data entity @s data.properties{gate_type:"nor"} if score @s ra.act_red matches 0 run tag @s add ra.out_success

# XNOR: Output TRUE if NOT exactly one input is powered (inverse of XOR)
execute if data entity @s data.properties{gate_type:"xnor"} unless score @s ra.act_red matches 1 run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
