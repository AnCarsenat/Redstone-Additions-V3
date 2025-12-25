# /ra_gates:blocks/nand_gate/process
# Process NAND gate logic. As armor stand, at position.
# NAND: Output TRUE if at least one input is off (NOT AND)

# NAND logic: output if any input is off (inac_red >= 1)
tag @s remove ra.out_success
execute if score @s ra.inac_red matches 1.. run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
