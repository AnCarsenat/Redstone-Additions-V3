# /ra_sensors:blocks/entity_detector/give
# Give Entity Detector block item to player
# Properties: range (default 5), entity_type (default "minecraft:pig")

give @s bat_spawn_egg[item_model="minecraft:sculk_sensor",item_name='"Entity Detector"',custom_data={ra:{entity_detector:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.entity_detector"],Silent:1b,NoAI:1b,Invulnerable:1b,properties:{range:5,entity_type:"minecraft:pig"}}]
