# /ra_gates:blocks/xor_gate/process
# Process XOR gate logic. As armor stand, at position.
# XOR: Output TRUE if exactly one input on, one off

# XOR logic: output if act_red=1 AND inac_red=1 (one on, one off)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 1 if score @s ra.inac_red matches 1 run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
