# /ra_gates:blocks/uni_gate/handle_placement
# Handle UNI gate placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.uni_gate] run return 0
# Place smooth stone slab with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:smooth_stone_slab",block_tag:"uni_gate",dir_type:0}

# Add checkRed tag for signal detection
tag @e[tag=ra.custom_block.uni_gate,tag=ra.new] add ra.checkRed

# Copy properties from the spawned bat to the armor stand (overrides defaults if bat has them)
execute if data entity @s properties run data modify entity @e[tag=ra.custom_block.uni_gate,tag=ra.new,limit=1] data.properties set from entity @s properties
# Always set cooldown property to 20 after copying (overwrites any delay property)
data modify entity @e[tag=ra.custom_block.uni_gate,tag=ra.new,limit=1] data.properties.gate set value "AND"
scoreboard players set @e[tag=ra.custom_block.uni_gate,tag=ra.new] ra.cooldown 0


# Remove ra.new tag now that setup is complete
tag @e[tag=ra.custom_block.uni_gate,tag=ra.new] remove ra.new

return 1
