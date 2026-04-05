# /ra_wires:electric/tick
# Tick electric wires, generator, consumer, and switch

# Migrate legacy wall-based electric wires to conduit visuals.
execute as @e[type=marker,tag=ra.custom_block.electric_wire] at @s if block ~ ~ ~ mud_brick_wall run setblock ~ ~ ~ conduit[waterlogged=false]
execute as @e[type=marker,tag=ra.custom_block.electric_wire] at @s if block ~ ~ ~ polished_blackstone_wall run setblock ~ ~ ~ conduit[waterlogged=false]

# Keep electric wire conduits non-waterlogged.
execute as @e[type=marker,tag=ra.custom_block.electric_wire] at @s if block ~ ~ ~ conduit[waterlogged=true] run setblock ~ ~ ~ conduit[waterlogged=false]

# Self-heal missing wire displays without forcing per-tick full rebuilds.
execute as @e[type=marker,tag=ra.custom_block.electric_wire] at @s if block ~ ~ ~ conduit unless entity @e[type=block_display,tag=ra.wires.wire_display.center,distance=..0.6,limit=1] run function ra_wires:common/update_model_local_and_neighbors

# One-time refresh for display geometry updates.
execute as @e[type=marker,tag=ra.custom_block.electric_wire,tag=!ra.wires.wire_display_v1] at @s if block ~ ~ ~ conduit run function ra_wires:common/update_model_local_and_neighbors
execute as @e[type=marker,tag=ra.custom_block.electric_wire,tag=!ra.wires.wire_display_v1] at @s if block ~ ~ ~ conduit run tag @s add ra.wires.wire_display_v1

# Break detection
execute as @e[type=marker,tag=ra.custom_block.electric_wire] at @s unless block ~ ~ ~ conduit run tag @s add ra.broken
execute as @e[type=marker,tag=ra.custom_block.electric_generator] at @s unless block ~ ~ ~ blast_furnace run tag @s add ra.broken
execute as @e[type=marker,tag=ra.custom_block.electric_consumer] at @s unless block ~ ~ ~ observer run tag @s add ra.broken
execute as @e[type=marker,tag=ra.custom_block.electric_switch] at @s unless block ~ ~ ~ redstone_lamp run tag @s add ra.broken

execute as @e[type=marker,tag=ra.custom_block.electric_wire,tag=ra.broken] at @s run function ra_wires:blocks/on_break/electric_wire
execute as @e[type=marker,tag=ra.custom_block.electric_generator,tag=ra.broken] at @s run function ra_wires:blocks/on_break/electric_generator
execute as @e[type=marker,tag=ra.custom_block.electric_consumer,tag=ra.broken] at @s run function ra_wires:blocks/on_break/electric_consumer
execute as @e[type=marker,tag=ra.custom_block.electric_switch,tag=ra.broken] at @s run function ra_wires:blocks/on_break/electric_switch

tag @e[type=marker,tag=ra.broken,tag=ra.custom_block.electric_wire] remove ra.broken
tag @e[type=marker,tag=ra.broken,tag=ra.custom_block.electric_generator] remove ra.broken
tag @e[type=marker,tag=ra.broken,tag=ra.custom_block.electric_consumer] remove ra.broken
tag @e[type=marker,tag=ra.broken,tag=ra.custom_block.electric_switch] remove ra.broken

# Ensure every electric node has complete runtime data before processing.
execute as @e[type=marker,tag=ra.wires.electric_node] at @s run function ra_wires:electric/init_node

# Generator production
execute as @e[type=marker,tag=ra.custom_block.electric_generator] at @s run function ra_wires:electric/generator_tick

# Transfer through network
execute as @e[type=marker,tag=ra.wires.electric_node] at @s run function ra_wires:electric/process_source

# Consumer draw
execute as @e[type=marker,tag=ra.custom_block.electric_consumer] at @s run function ra_wires:electric/consumer_tick

# Status refresh
execute as @e[type=marker,tag=ra.wires.electric_node] at @s run function ra_wires:electric/update_status
