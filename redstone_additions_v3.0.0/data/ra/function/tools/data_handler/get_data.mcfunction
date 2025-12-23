# /ra:tools/data_handler/get_data
# Get specific data from nearest custom block. Macro function.
# Usage: function ra:tools/data_handler/get_data {key:"range"}
# Run as player, at position near block

$data modify storage ra:temp get_value set from entity @e[tag=ra.custom_block,distance=..3,limit=1,sort=nearest] data.properties.$(key)
$tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"$(key)","color":"yellow"},{"text":" = ","color":"gray"},{"nbt":"get_value","storage":"ra:temp","color":"green"}]
