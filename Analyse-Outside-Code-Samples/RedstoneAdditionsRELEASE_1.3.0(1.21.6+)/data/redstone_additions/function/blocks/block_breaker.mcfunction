#block_breaker
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Block Breaker'}],"minecraft:custom_data":{"block_breaker":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.block_breaker', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker] if score @s redstone_additions.delay matches 19.. at @s unless block ^ ^ ^1 #air unless block ^ ^ ^1 bedrock run tag @s add triggered
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker,tag=triggered] at @s if block ~ ~ ~ minecraft:dispenser[triggered=true] run setblock ^ ^0 ^1 air destroy
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker,tag=triggered] run scoreboard players set @s redstone_additions.delay 0
tag @e[type=armor_stand,tag=reddition.blocks.block_place.block_breaker] remove triggered

schedule function redstone_additions:blocks/block_breaker 1t