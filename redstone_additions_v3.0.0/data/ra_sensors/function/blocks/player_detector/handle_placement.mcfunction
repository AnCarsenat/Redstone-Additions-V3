# /ra_sensors:blocks/player_detector/handle_placement
# Handle player detector placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.player_detector] run return 0

# Place observer block with armor stand marker (dir_type:2 = full 6-directional)
function ra_lib:placement/place {block_id:"minecraft:observer",block_tag:"player_detector",dir_type:2}

# Copy properties from the spawned bat to the armor stand
data modify entity @e[tag=ra.custom_block.player_detector,tag=ra.new,limit=1] data.properties set from entity @s properties

return 1
