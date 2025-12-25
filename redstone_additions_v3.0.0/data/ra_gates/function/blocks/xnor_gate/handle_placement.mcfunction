# /ra_gates:blocks/xnor_gate/handle_placement
# Handle XNOR gate placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.xnor_gate] run return 0

# Place smooth stone slab with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:smooth_stone_slab",block_tag:"xnor_gate",dir_type:0}

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.xnor_gate,tag=ra.new] add ra.checkRed

# Remove ra.new tag now that setup is complete
tag @e[tag=ra.custom_block.xnor_gate,tag=ra.new] remove ra.new

return 1
