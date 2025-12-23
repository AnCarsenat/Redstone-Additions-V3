# /ra_interactive:blocks/message/handle_placement
# Handle message block placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.message_block] run return 0

# Place bamboo mosaic with armor stand marker (dir_type:0 = no direction)
function ra_lib:placement/place {block_id:"minecraft:bamboo_mosaic",block_tag:"message_block",dir_type:0}

# Copy properties from the spawned bat to the armor stand
data modify entity @e[tag=ra.custom_block.message_block,tag=ra.new,limit=1] data.properties set from entity @s properties

return 1
