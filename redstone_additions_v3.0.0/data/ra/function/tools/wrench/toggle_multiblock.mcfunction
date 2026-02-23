# /ra:tools/wrench/toggle_multiblock
# Toggle multiblock enabled state
# Context: at multiblock position

execute as @e[tag=ra.multiblock,distance=..0.5,limit=1] run function ra:tools/wrench/toggle_multiblock_entity
