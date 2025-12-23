# /ra_interactive:blocks/message/tick
# Tick all message blocks

# Check for break detection
execute as @e[tag=ra.custom_block.message_block] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.message_block] at @s run function ra_interactive:blocks/message/on_break

# Redstone detection
execute as @e[tag=ra.custom_block.message_block] at @s run function ra_lib:redstone/detect

# Trigger on rising edge (just powered)
execute as @e[tag=ra.custom_block.message_block,tag=ra.powered,tag=!ra.was_powered] at @s run function ra_interactive:blocks/message/on_powered

# Track power state for edge detection
tag @e[tag=ra.custom_block.message_block,tag=ra.powered] add ra.was_powered
tag @e[tag=ra.custom_block.message_block,tag=!ra.powered] remove ra.was_powered
