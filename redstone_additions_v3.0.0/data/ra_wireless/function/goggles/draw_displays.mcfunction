# /ra_wireless:goggles/draw_displays
# Draw goggles billboards for all wireless block types
# Context: as player with goggles, at player position

execute as @e[tag=ra.custom_block.emitter,distance=..16] at @s run function ra_wireless:goggles/draw_display_emitter
execute as @e[tag=ra.custom_block.receiver,distance=..16] at @s run function ra_wireless:goggles/draw_display_receiver
