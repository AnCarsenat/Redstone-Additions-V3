# /ra_gates:blocks/rand/handle_placement
# Handle Randomizer placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.rand] run return 0

# Place bookshelf with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:bookshelf",block_tag:"rand",dir_type:0}

# Initialize default properties (50% chance)
data modify entity @n[tag=ra.custom_block.rand,tag=ra.new] data.properties.chance set value 50

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.rand,tag=ra.new] add ra.checkRed
tag @e[tag=ra.custom_block.rand,tag=ra.new] remove ra.new

# Remove placement tag
tag @s remove ra.place.rand

return 1
