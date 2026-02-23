# Handle diamond multiblock base placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.multiblock_base.diamond] run return 0

# Place the block using library (dir_type:0 = no facing)
function ra_lib:placement/place {block_id:"minecraft:diamond_block",block_tag:"multiblock_base.diamond",dir_type:0}

# Initialize properties
data modify entity @e[tag=ra.new,limit=1] data.properties.tier set value "diamond"
data modify entity @e[tag=ra.new,limit=1] data.properties.tier_level set value 4

# Add multiblock base tag for detection
tag @e[tag=ra.new,limit=1] add ra.multiblock_base

# Remove ra.new tag
tag @e[tag=ra.custom_block.multiblock_base.diamond,tag=ra.new] remove ra.new

# Cool placement effects
playsound minecraft:block.amethyst_block.chime block @a[distance=..16] ~ ~ ~ 1 1.2
particle minecraft:electric_spark ~ ~0.5 ~ 0.3 0.3 0.3 0.05 20

return 1
