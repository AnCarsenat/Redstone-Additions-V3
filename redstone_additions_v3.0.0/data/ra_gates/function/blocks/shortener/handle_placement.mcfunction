# /ra_gates:blocks/shortener/handle_placement
# Handle Shortener placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.shortener] run return 0

# Place mossy stone bricks with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:mossy_stone_bricks",block_tag:"shortener",dir_type:0}

# Set default pulse length property (2 ticks)
data modify entity @n[tag=ra.custom_block.shortener,tag=ra.new] data.properties.pulse set value 2

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.shortener,tag=ra.new] add ra.checkRed
tag @e[tag=ra.custom_block.shortener,tag=ra.new] remove ra.new

# Remove placement tag
tag @s remove ra.place.shortener

return 1
