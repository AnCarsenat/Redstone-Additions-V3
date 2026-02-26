# /ra_multiblock:goggles/draw_displays
# Draw goggles billboards for all multiblock types
# Context: as player with goggles, at player position

execute as @e[tag=ra.multiblock.blast_forge,distance=..16] at @s run function ra_multiblock:goggles/draw_display_blast_forge
execute as @e[tag=ra.multiblock.upgrade_platform,distance=..16] at @s run function ra_multiblock:goggles/draw_display_upgrade_platform
