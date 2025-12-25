#block_placer
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_placer] at @s unless block ~ ~ ~ minecraft:dispenser run kill @e[type=item,nbt={Item:{id:"minecraft:dispenser"}},sort=nearest,limit=1]
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_placer] at @s unless block ~ ~ ~ minecraft:dispenser run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"minecraft:dispenser","minecraft:item_name":[{'text': 'Block Placer'}],"minecraft:custom_data":{"block_placer":true},"minecraft:entity_data":{id:"item_frame",Tags:['reddition.blocks.block_place.block_placer', 'reddition.blocks', 'reddition.has_cooldown']}}}}
execute as @e[type=armor_stand,tag=reddition.blocks.block_place.block_placer] at @s unless block ~ ~ ~ minecraft:dispenser run kill @s
execute at @e[type=armor_stand,tag=reddition.blocks.block_place.block_placer] run function placeblocks:tick

schedule function redstone_additions:blocks/block_placer 1t