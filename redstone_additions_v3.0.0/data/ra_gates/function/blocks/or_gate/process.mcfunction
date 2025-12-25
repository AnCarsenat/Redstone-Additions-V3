# /ra_gates:blocks/or_gate/process
# Process OR gate logic. As armor stand, at position.
# OR: Output TRUE if ANY input is powered

# OR logic: output if any input powered (act_red >= 1)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 1.. run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
