# /ra_gates:blocks/uni_gate/process
# Process UNI gate logic. As armor stand, at position.

# UNI: Ouput TURE based on it's "gate:str" property
# AND: Output TRUE only if ALL inputs are powered and at least one input exists
# AND logic: output if all inputs powered (act_red >= 1 AND inac_red == 0)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 1.. if score @s ra.inac_red matches 0 run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
