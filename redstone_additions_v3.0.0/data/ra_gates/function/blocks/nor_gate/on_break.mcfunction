# /ra_gates:blocks/nor_gate/on_break
# Handle NOR gate break

# Revert any redstone blocks back to iron blocks
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 iron_block replace redstone_block

# Kill the armor stand
kill @s
