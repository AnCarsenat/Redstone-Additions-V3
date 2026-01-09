# /ra_wireless:blocks/emitter/handle_placement
# Handle Emitter placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.emitter] run return 0

# Place end stone bricks with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:end_stone_bricks",block_tag:"emitter",dir_type:0}

# Set default channel and enabled state
data modify entity @n[tag=ra.custom_block.emitter,tag=ra.new] data.properties.channel set value 1
data modify entity @n[tag=ra.custom_block.emitter,tag=ra.new] data.properties.enabled set value 1b

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.emitter,tag=ra.new] add ra.checkRed
tag @e[tag=ra.custom_block.emitter,tag=ra.new] remove ra.new

# Remove placement tag
tag @s remove ra.place.emitter

return 1
