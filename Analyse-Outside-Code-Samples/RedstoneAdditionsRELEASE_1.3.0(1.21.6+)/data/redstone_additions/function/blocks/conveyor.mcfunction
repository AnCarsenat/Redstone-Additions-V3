#conveyor
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dropper","minecraft:item_name":[{'text': 'Conveyor'}],"minecraft:custom_data":{"conveyor":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.conveyor', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
#execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s unless block ~ ~ ~ minecraft:dispenser[triggered=true] run return fail
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s if data block ~ ~ ~ Items[0] store success score @s redstone_additions.temp run data modify block ^ ^ ^1 Items append from block ~ ~ ~ Items[0]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] at @s if score @s redstone_additions.temp matches 1 run data remove block ~ ~ ~ Items[0]
scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.conveyor] redstone_additions.temp

schedule function redstone_additions:blocks/conveyor 1t