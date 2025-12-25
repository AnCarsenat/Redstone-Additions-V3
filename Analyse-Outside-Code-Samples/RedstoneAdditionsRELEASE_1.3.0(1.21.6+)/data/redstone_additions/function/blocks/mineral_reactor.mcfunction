#mineral_reactor
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Mineral Reactor'}],"minecraft:custom_data":{"mineral_reactor":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.mineral_reactor', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] if score @s redstone_additions.delay matches 200.. at @s if block ^ ^ ^1 #air run tag @s add triggered
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor,tag=triggered] at @s unless block ~ ~ ~ minecraft:dispenser[triggered=true] run function redstone_additions:blocks/logic/mineral_reactor
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor,tag=triggered] run scoreboard players set @s redstone_additions.delay 0
tag @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] remove triggered
scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.mineral_reactor] redstone_additions.temp

schedule function redstone_additions:blocks/mineral_reactor 1t