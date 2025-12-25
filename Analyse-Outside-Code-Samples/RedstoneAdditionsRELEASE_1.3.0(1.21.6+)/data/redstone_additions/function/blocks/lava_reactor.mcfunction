#lava_reactor
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Lava Reactor'}],"minecraft:custom_data":{"lava_reactor":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.lava_reactor', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor] if score @s redstone_additions.delay matches 99.. at @s if block ^ ^ ^1 #air run tag @s add triggered
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor,tag=triggered] at @s if block ~ ~ ~ minecraft:dispenser[triggered=true] run setblock ^ ^0 ^1 lava keep
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor,tag=triggered] run scoreboard players set @s redstone_additions.delay 0
scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor,tag=triggered] redstone_additions.delay
tag @e[type=armor_stand,tag=reddition.blocks.block_place.lava_reactor,tag=triggered] remove triggered

schedule function redstone_additions:blocks/lava_reactor 1t