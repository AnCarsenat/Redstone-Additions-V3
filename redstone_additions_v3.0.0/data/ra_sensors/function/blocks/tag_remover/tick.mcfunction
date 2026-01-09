# /ra_sensors:blocks/tag_remover/tick
# Tick all tag removers

# Check for break detection
execute as @e[tag=ra.custom_block.tag_remover] at @s if block ~ ~ ~ #minecraft:air run tag @s add ra.broken
execute as @e[tag=ra.broken,tag=ra.custom_block.tag_remover] at @s run function ra_sensors:blocks/tag_remover/on_break
tag @e[tag=ra.broken,tag=ra.custom_block.tag_remover] remove ra.broken

# Redstone detection
execute as @e[tag=ra.custom_block.tag_remover] at @s run function ra_lib:redstone/detect

# Trigger on rising edge (just powered)
execute as @e[tag=ra.custom_block.tag_remover,tag=ra.powered,tag=!ra.was_powered] at @s run function ra_sensors:blocks/tag_remover/on_powered

# Track power state for edge detection
tag @e[tag=ra.custom_block.tag_remover,tag=ra.powered] add ra.was_powered
tag @e[tag=ra.custom_block.tag_remover,tag=!ra.powered] remove ra.was_powered
