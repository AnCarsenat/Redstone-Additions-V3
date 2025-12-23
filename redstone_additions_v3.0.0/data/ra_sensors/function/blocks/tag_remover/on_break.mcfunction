# /ra_sensors:blocks/tag_remover/on_break
# Called when tag remover is broken. As armor stand, at position.

# Drop the tag remover item with its properties
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:red_glazed_terracotta","minecraft:item_name":'Tag Remover',"minecraft:custom_data":{ra:{tag_remover:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.tag_remover"],Silent:1b,NoAI:1b,Invulnerable:1b,properties:{range:3,tag:"",entity_type:""}}}},Tags:["ra.drop_temp"]}

# Copy the properties to the dropped item
data modify entity @e[type=item,tag=ra.drop_temp,limit=1,sort=nearest] Item.components."minecraft:entity_data".properties set from entity @s data.properties
tag @e[type=item,tag=ra.drop_temp] remove ra.drop_temp

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s
