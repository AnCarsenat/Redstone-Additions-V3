#organic_reactor
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.organic_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.organic_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Organic Reactor'}],"minecraft:custom_data":{"organic_reactor":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.organic_reactor', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.organic_reactor] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.organic_reactor] at @s run setblock ^ ^ ^1 grass_block keep
scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.organic_reactor] redstone_additions.temp

schedule function redstone_additions:blocks/organic_reactor 1t