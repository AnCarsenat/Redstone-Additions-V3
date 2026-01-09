# /ra_gates:blocks/delayer/handle_placement
# Handle Delayer placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.delayer] run return 0

# Place chiseled stone bricks with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:chiseled_stone_bricks",block_tag:"delayer",dir_type:0}

# Set default delay property (20 ticks = 1 second)
data modify entity @n[tag=ra.custom_block.delayer,tag=ra.new] data.properties.delay set value 20

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.delayer,tag=ra.new] add ra.checkRed
tag @e[tag=ra.custom_block.delayer,tag=ra.new] remove ra.new

# Remove placement tag
tag @s remove ra.place.delayer

return 1
