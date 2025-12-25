# /ra_gates:blocks/xnor_gate/process
# Process XNOR gate logic. As armor stand, at position.
# XNOR: Output TRUE if all inputs same state (all on or all off)

# XNOR logic: output if (all on: act_red >= 1, inac_red = 0) OR (all off: act_red = 0, inac_red >= 1)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 1.. if score @s ra.inac_red matches 0 run tag @s add ra.out_success
execute if score @s ra.act_red matches 0 if score @s ra.inac_red matches 1.. run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
