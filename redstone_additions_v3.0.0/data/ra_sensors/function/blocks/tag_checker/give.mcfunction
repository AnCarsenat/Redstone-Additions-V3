# /ra_sensors:blocks/tag_checker/give
# Give Entity Tag Checker block item to player
# Properties: range (default 5), tag (default "custom_tag"), entity_type (default all entities)

give @s bat_spawn_egg[item_model="minecraft:purple_glazed_terracotta",item_name='"Tag Checker"',custom_data={ra:{tag_checker:1b}},entity_data={id:"minecraft:bat",Tags:["ra.spawned","ra.place.tag_checker"],Silent:1b,NoAI:1b,Invulnerable:1b,properties:{range:5,tag:"custom_tag",entity_type:""}}]
