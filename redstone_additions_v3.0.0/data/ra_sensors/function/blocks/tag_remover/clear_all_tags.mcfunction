# /ra_sensors:blocks/tag_remover/clear_all_tags
# Clear all tags from entities in range. As armor stand, at position.

# Clear all tags (except ra. system tags) from entities in range
execute if score #range ra.temp matches 1 as @e[distance=..1,tag=!ra.custom_block] run data modify entity @s Tags set value []
execute if score #range ra.temp matches 2 as @e[distance=..2,tag=!ra.custom_block] run data modify entity @s Tags set value []
execute if score #range ra.temp matches 3 as @e[distance=..3,tag=!ra.custom_block] run data modify entity @s Tags set value []
execute if score #range ra.temp matches 4 as @e[distance=..4,tag=!ra.custom_block] run data modify entity @s Tags set value []
execute if score #range ra.temp matches 5 as @e[distance=..5,tag=!ra.custom_block] run data modify entity @s Tags set value []
execute if score #range ra.temp matches 6.. as @e[distance=..6,tag=!ra.custom_block] run data modify entity @s Tags set value []

playsound minecraft:block.note_block.bit block @a[distance=..16] ~ ~ ~ 0.5 0.5
