# /ra_gates:blocks/nor_gate/process
# Process NOR gate logic. As armor stand, at position.
# NOR: Output TRUE if all inputs are off (NOT OR)

# NOR logic: output if no inputs powered and has inactive inputs (act_red=0 AND inac_red >= 1)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 0 if score @s ra.inac_red matches 1.. run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
