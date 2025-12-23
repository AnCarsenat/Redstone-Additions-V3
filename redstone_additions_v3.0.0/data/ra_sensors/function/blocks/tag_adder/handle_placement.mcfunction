# /ra_sensors:blocks/tag_adder/handle_placement
# Handle tag adder placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.tag_adder] run return 0

# Place green glazed terracotta with armor stand marker (dir_type:0 = non-directional)
function ra_lib:placement/place {block_id:"minecraft:green_glazed_terracotta",block_tag:"tag_adder",dir_type:0}

# Copy properties from the spawned bat to the armor stand
data modify entity @e[tag=ra.custom_block.tag_adder,tag=ra.new,limit=1] data.properties set from entity @s properties

return 1
