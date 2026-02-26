# /ra:tools/wrench/handle_multiblock_base
# Handle wrench interaction with multiblock base
# Context: as multiblock base armor stand, at its position

# Check if already assembled (has multiblock marker at same block position)
# Use align xyz to normalize position, distance=..0.5 to match only THIS block's marker
execute at @s align xyz positioned ~0.5 ~ ~0.5 if entity @e[tag=ra.multiblock,distance=..0.5,limit=1,sort=nearest] run return run function ra:tools/wrench/toggle_multiblock

# Not assembled yet - try to assemble based on tier
execute if entity @s[tag=ra.custom_block.multiblock_base.copper] run function ra:tools/wrench/try_assemble_copper
execute if entity @s[tag=ra.custom_block.multiblock_base.iron] run function ra:tools/wrench/try_assemble_iron
execute if entity @s[tag=ra.custom_block.multiblock_base.gold] run function ra:tools/wrench/try_assemble_gold
execute if entity @s[tag=ra.custom_block.multiblock_base.diamond] run function ra:tools/wrench/try_assemble_diamond
execute if entity @s[tag=ra.custom_block.multiblock_base.netherite] run function ra:tools/wrench/try_assemble_netherite
