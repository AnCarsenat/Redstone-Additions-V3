# /ra_interactive:goggles/draw_displays
# Draw goggles billboards for all interactive block types
# Context: as player with goggles, at player position

execute as @e[tag=ra.custom_block.block_breaker,distance=..16] at @s run function ra_interactive:goggles/draw_display_block_breaker
execute as @e[tag=ra.custom_block.block_placer,distance=..16] at @s run function ra_interactive:goggles/draw_display_block_placer
execute as @e[tag=ra.custom_block.breeder,distance=..16] at @s run function ra_interactive:goggles/draw_display_breeder
execute as @e[tag=ra.custom_block.pusher,distance=..16] at @s run function ra_interactive:goggles/draw_display_pusher
execute as @e[tag=ra.custom_block.spitter,distance=..16] at @s run function ra_interactive:goggles/draw_display_spitter
execute as @e[tag=ra.custom_block.item_pipe,distance=..16] at @s run function ra_interactive:goggles/draw_display_item_pipe
execute as @e[tag=ra.custom_block.item_mover,distance=..16] at @s run function ra_interactive:goggles/draw_display_item_mover
execute as @e[tag=ra.custom_block.infinite_water_cauldron,distance=..16] at @s run function ra_interactive:goggles/draw_display_inf_water
execute as @e[tag=ra.custom_block.infinite_lava_cauldron,distance=..16] at @s run function ra_interactive:goggles/draw_display_inf_lava
execute as @e[tag=ra.custom_block.infinite_snow_cauldron,distance=..16] at @s run function ra_interactive:goggles/draw_display_inf_snow
execute as @e[tag=ra.custom_block.message_block,distance=..16] at @s run function ra_interactive:goggles/draw_display_message
