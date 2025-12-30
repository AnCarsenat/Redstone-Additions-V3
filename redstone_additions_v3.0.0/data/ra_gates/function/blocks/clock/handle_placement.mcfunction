# /ra_gates:blocks/clock/handle_placement
# Handle AND gate placement
# Context: as bat, at bat position

execute unless entity @s[tag=ra.place.clock] run return 0

# Place daylight sensor with armor stand marker
function ra_lib:placement/place {block_id:"minecraft:daylight_detector",block_tag:"clock",dir_type:0}

# Copy properties from the spawned bat to the armor stand (overrides defaults if bat has them)
execute if data entity @s properties run data modify entity @e[tag=ra.custom_block.clock,tag=ra.new,limit=1] data.properties set from entity @s properties
# Always set cooldown property to 20 after copying (overwrites any delay property)
data modify entity @e[tag=ra.custom_block.clock,tag=ra.new,limit=1] data.properties.cooldown set value 20
scoreboard players set @e[tag=ra.custom_block.clock,tag=ra.new] ra.cooldown 0

return 1