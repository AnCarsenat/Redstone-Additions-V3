# /ra_sensors:goggles/draw_displays
# Draw goggles billboards for all sensor block types
# Context: as player with goggles, at player position

execute as @e[tag=ra.custom_block.entity_detector,distance=..16] at @s run function ra_sensors:goggles/draw_display_entity_detector
execute as @e[tag=ra.custom_block.tag_adder,distance=..16] at @s run function ra_sensors:goggles/draw_display_tag_adder
execute as @e[tag=ra.custom_block.tag_remover,distance=..16] at @s run function ra_sensors:goggles/draw_display_tag_remover
