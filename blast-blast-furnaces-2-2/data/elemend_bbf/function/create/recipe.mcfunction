scoreboard players reset @s elemend_bbf_create

execute unless score @s elemend_bbf_calc matches 0 run scoreboard players add @s elemend_bbf_calc 1

# look for the fire charge, the block with the "recipe" in it and stop if there is a marker there already. If conditions are met create the furnace output.
execute at @s as @e[type=item,distance=..6,nbt={Item:{id:"minecraft:fire_charge",count:1}}] at @s unless entity @e[type=marker,distance=..1,tag=elemend_bbf_marker,limit=1] if block ~ ~ ~ minecraft:hopper{Items:[{Slot:0b,id:"minecraft:iron_block",count:2},{Slot:1b,id:"minecraft:magma_block",count:1},{Slot:2b,id:"minecraft:diamond_block",count:1},{Slot:3b,id:"minecraft:magma_block",count:1},{Slot:4b,id:"minecraft:iron_block",count:2}]} run function elemend_bbf:create/summon

# the ticking of the advancement and this function will stop after some time:
advancement revoke @s[scores={bbf_calc=..150}] only elemend_bbf:create
scoreboard players reset @s[scores={bbf_calc=151..}] elemend_bbf_calc