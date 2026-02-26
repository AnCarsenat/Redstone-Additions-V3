# /ra_gates:goggles/draw_displays
# Draw goggles billboards for all gate block types
# Context: as player with goggles, at player position

execute as @e[tag=ra.custom_block.uni_gate,distance=..16] at @s run function ra_gates:goggles/draw_display_uni_gate
execute as @e[tag=ra.custom_block.clock,distance=..16] at @s run function ra_gates:goggles/draw_display_clock
execute as @e[tag=ra.custom_block.delayer,distance=..16] at @s run function ra_gates:goggles/draw_display_delayer
execute as @e[tag=ra.custom_block.extender,distance=..16] at @s run function ra_gates:goggles/draw_display_extender
execute as @e[tag=ra.custom_block.rand,distance=..16] at @s run function ra_gates:goggles/draw_display_rand
execute as @e[tag=ra.custom_block.shortener,distance=..16] at @s run function ra_gates:goggles/draw_display_shortener
