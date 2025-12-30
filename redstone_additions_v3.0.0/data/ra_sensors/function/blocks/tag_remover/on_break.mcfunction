# /ra_sensors:blocks/tag_remover/on_break
# Called when tag remover is broken. As armor stand, at position.

# Drop the tag remover item with its properties


playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s
