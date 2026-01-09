# /ra_wireless:blocks/emitter/tick
# Tick all emitters

# Check for break detection (using end_stone_bricks as emitter block)
execute as @e[tag=ra.custom_block.emitter] at @s unless block ~ ~ ~ end_stone_bricks run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.emitter] at @s run function ra_wireless:blocks/emitter/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.emitter] remove ra.broken

# Process emitter logic
execute as @e[tag=ra.custom_block.emitter] at @s run function ra_wireless:blocks/emitter/process
