# /ra_sensors:blocks/entity_detector/on_break
# Called when entity detector is broken. As armor stand, at position.

# Drop the entity detector item with its properties
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:waxed_chiseled_copper","minecraft:item_name":'Entity Detector',"minecraft:custom_data":{ra:{entity_detector:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.entity_detector"],Silent:1b,NoAI:1b,Invulnerable:1b,properties:{range:5,entity_selector:"@e[type=minecraft:pig]"}}}},Tags:["ra.drop_temp"]}

# Copy the properties to the dropped item
data modify entity @e[type=item,tag=ra.drop_temp,limit=1,sort=nearest] Item.components."minecraft:entity_data".properties set from entity @s data.properties
tag @e[type=item,tag=ra.drop_temp] remove ra.drop_temp

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s
