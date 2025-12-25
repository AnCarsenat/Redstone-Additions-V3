# /ra_gates:blocks/not_gate/process
# Process NOT gate logic. As armor stand, at position.
# NOT: Output TRUE if NO inputs are powered (inverts)

# NOT logic: output if no inputs powered (act_red == 0)
tag @s remove ra.out_success
execute if score @s ra.act_red matches 0 run tag @s add ra.out_success

# Set output - replace nearby iron blocks with redstone blocks or vice versa
execute if entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 redstone_block replace iron_block
execute unless entity @s[tag=ra.out_success] at @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block
