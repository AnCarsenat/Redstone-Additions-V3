# /ra_sensors:blocks/entity_detector/handle_placement
# Handle entity detector placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.entity_detector] run return 0

# Place sculk sensor with armor stand marker (dir_type:0 = non-directional)
function ra_lib:placement/place {block_id:"minecraft:sculk_sensor",block_tag:"entity_detector",dir_type:0}

# Copy properties from the spawned bat to the armor stand
data modify entity @e[tag=ra.custom_block.entity_detector,tag=ra.new,limit=1] data.properties set from entity @s properties

return 1
