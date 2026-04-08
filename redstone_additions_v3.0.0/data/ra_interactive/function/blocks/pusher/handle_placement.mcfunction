# /ra_interactive:blocks/pusher/handle_placement
# Handle pusher placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.pusher] run return 0

# Place magenta glazed terracotta with armor stand marker (dir_type:1 = horizontal only)
function ra_lib:placement/place {block_id:"minecraft:magenta_glazed_terracotta",block_tag:"pusher",dir_type:1}

# Remove ra.new tag now that setup is complete
tag @e[tag=ra.custom_block.pusher,tag=ra.new] remove ra.new

return 1
