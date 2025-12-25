# /ra_interactive:blocks/message/handle_placement
# Handle message block placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.message_block] run return 0

# Place note_block with armor stand marker (dir_type:0 = no direction)
function ra_lib:placement/place {block_id:"minecraft:note_block",block_tag:"message_block",dir_type:0}

# Initialize default properties first
data modify entity @e[tag=ra.custom_block.message_block,tag=ra.new,limit=1] data.properties set value {message:"Hello World!",range:16}

# Copy properties from the spawned bat to the armor stand (overrides defaults if bat has them)
execute if data entity @s properties run data modify entity @e[tag=ra.custom_block.message_block,tag=ra.new,limit=1] data.properties set from entity @s properties

# Remove ra.new tag now that setup is complete
tag @e[tag=ra.custom_block.message_block,tag=ra.new] remove ra.new

return 1
