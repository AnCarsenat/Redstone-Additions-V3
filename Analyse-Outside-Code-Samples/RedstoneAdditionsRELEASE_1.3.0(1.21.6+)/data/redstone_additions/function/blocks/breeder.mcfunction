#breeder
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Breeder'}],"minecraft:custom_data":{"breeder":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.breeder', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute at @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] positioned ^ ^ ^1 run function redstone_additions:blocks/breeder
scoreboard players reset @e[type=armor_stand,tag=reddition.blocks.block_place.breeder] redstone_additions.temp
scoreboard players add @e[tag=reddition.has_cooldown] redstone_additions.delay 1

schedule function redstone_additions:blocks/breeder 1t