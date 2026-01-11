# /ra_interactive:blocks/message/tick
# Tick all message blocks

# Check for break detection (exclude new blocks, check for note_block)
execute as @e[tag=ra.custom_block.message_block,tag=!ra.new] at @s unless block ~ ~ ~ minecraft:note_block run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.message_block] at @s run function ra_interactive:blocks/message/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.message_block] remove ra.broken

# Redstone detection
execute as @e[tag=ra.custom_block.message_block,tag=!ra.new] at @s run function ra_lib:redstone/detect

# Trigger on rising edge (just powered)
execute as @e[tag=ra.custom_block.message_block,tag=!ra.was_powered] if score @s ra.power matches 1.. at @s run function ra_interactive:blocks/message/on_powered

# Track power state for edge detection
tag @e[tag=ra.custom_block.message_block,tag=ra.powered] add ra.was_powered
tag @e[tag=ra.custom_block.message_block,tag=!ra.powered] remove ra.was_powered
    