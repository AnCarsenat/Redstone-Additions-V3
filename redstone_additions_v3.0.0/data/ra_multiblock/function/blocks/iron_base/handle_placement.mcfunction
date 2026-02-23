# Handle iron multiblock base placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.multiblock_base.iron] run return 0

# Place the block using library (dir_type:0 = no facing)
function ra_lib:placement/place {block_id:"minecraft:iron_block",block_tag:"multiblock_base.iron",dir_type:0}

# Initialize properties
data modify entity @e[tag=ra.new,limit=1] data.properties.tier set value "iron"
data modify entity @e[tag=ra.new,limit=1] data.properties.tier_level set value 2

# Add multiblock base tag for detection
tag @e[tag=ra.new,limit=1] add ra.multiblock_base

# Remove ra.new tag
tag @e[tag=ra.custom_block.multiblock_base.iron,tag=ra.new] remove ra.new

# Cool placement effects
playsound minecraft:block.anvil.land block @a[distance=..16] ~ ~ ~ 0.5 1.2
particle minecraft:electric_spark ~ ~0.5 ~ 0.3 0.3 0.3 0.05 15

return 1
