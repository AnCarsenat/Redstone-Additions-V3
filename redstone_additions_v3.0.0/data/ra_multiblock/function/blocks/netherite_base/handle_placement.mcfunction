# Handle netherite multiblock base placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.multiblock_base.netherite] run return 0

# Place the block using library (dir_type:0 = no facing)
function ra_lib:placement/place {block_id:"minecraft:netherite_block",block_tag:"multiblock_base.netherite",dir_type:0}

# Initialize properties
data modify entity @e[tag=ra.new,limit=1] data.properties.tier set value "netherite"
data modify entity @e[tag=ra.new,limit=1] data.properties.tier_level set value 5

# Add multiblock base tag for detection
tag @e[tag=ra.new,limit=1] add ra.multiblock_base

# Remove ra.new tag
tag @e[tag=ra.custom_block.multiblock_base.netherite,tag=ra.new] remove ra.new

# Cool placement effects
playsound minecraft:block.respawn_anchor.charge block @a[distance=..16] ~ ~ ~ 0.8 0.6
particle minecraft:soul_fire_flame ~ ~0.5 ~ 0.3 0.3 0.3 0.02 20

return 1
