# /ra:tools/wrench/handle_multiblock_base
# Handle wrench interaction with multiblock base
# Context: as multiblock base armor stand, at its position

# Check if already assembled (has multiblock marker nearby)
execute if entity @e[tag=ra.multiblock,distance=..2,limit=1] run return run function ra:tools/wrench/toggle_multiblock

# Not assembled yet - try to assemble based on tier
execute if entity @s[tag=ra.custom_block.multiblock_base.copper] run function ra:tools/wrench/try_assemble_copper
execute if entity @s[tag=ra.custom_block.multiblock_base.iron] run function ra:tools/wrench/try_assemble_iron
execute if entity @s[tag=ra.custom_block.multiblock_base.gold] run function ra:tools/wrench/try_assemble_gold
execute if entity @s[tag=ra.custom_block.multiblock_base.diamond] run function ra:tools/wrench/try_assemble_diamond
execute if entity @s[tag=ra.custom_block.multiblock_base.netherite] run function ra:tools/wrench/try_assemble_netherite
