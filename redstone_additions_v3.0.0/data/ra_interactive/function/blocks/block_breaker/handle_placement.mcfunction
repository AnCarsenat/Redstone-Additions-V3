# Handle block breaker placement
# Context: as bat, at bat position
# Called via function tag ra:register_placement
say hi
# Only process if this is a block breaker bat
execute unless entity @s[tag=ra.place.block_breaker] run return 0

# Set block definition in storage
data modify storage ra:block data set value {block_tag:"block_breaker",block_id:"minecraft:dispenser",dir_type:2}

# Place the block using the library
execute run function ra_lib:placement/place_block
say sucess
return 1