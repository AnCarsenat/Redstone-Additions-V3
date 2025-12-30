# /ra_sensors:blocks/entity_detector/on_break
# Called when entity detector is broken. As armor stand, at position.

# Drop the entity detector item with its properties
summon item ~ ~ ~ {Item:{id:"minecraft:bat_spawn_egg",count:1,components:{"minecraft:item_model":"minecraft:waxed_chiseled_copper","minecraft:item_name":'Entity Detector',"minecraft:custom_data":{ra:{entity_detector:1b}},"minecraft:entity_data":{id:"minecraft:bat",Tags:["ra.spawned","ra.place.entity_detector"],Silent:1b,NoAI:1b,Invulnerable:1b}}}}

playsound minecraft:block.stone.break block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:cloud ~ ~ ~ 0.2 0.2 0.2 0.02 5

kill @s
