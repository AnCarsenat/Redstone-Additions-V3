# Handle block breaker placement
# Context: as bat, at bat position
# Called via function tag ra:register_placement

# Only process if this is a block breaker bat
execute unless entity @s[tag=ra.place.block_breaker] run return 0

# Set block definition in storage
data modify storage ra block set value {block_tag:"block_breaker",block_id:"minecraft:dispenser",dir_type:2}

# Place the block using the library
execute align xyz positioned ~0.5 ~ ~0.5 run function ra_lib:placement/place_block

return 1