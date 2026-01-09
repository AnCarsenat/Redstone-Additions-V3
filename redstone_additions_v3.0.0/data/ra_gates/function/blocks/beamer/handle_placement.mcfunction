# /ra_gates:blocks/beamer/handle_placement
# Handle Beamer placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.beamer] run return 0

# Place cyan glazed terracotta with armor stand marker (directional)
function ra_lib:placement/place {block_id:"minecraft:cyan_glazed_terracotta",block_tag:"beamer",dir_type:1}

# Set default distance property (5 blocks)
data modify entity @n[tag=ra.custom_block.beamer,tag=ra.new] data.properties.distance set value 5

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.beamer,tag=ra.new] add ra.checkRed
tag @e[tag=ra.custom_block.beamer,tag=ra.new] remove ra.new

# Remove placement tag
tag @s remove ra.place.beamer

return 1
