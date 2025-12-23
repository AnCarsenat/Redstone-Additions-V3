# /ra:tools/data_handler/remove_data
# Remove data key from nearest custom block. Macro function.
# Usage: function ra:tools/data_handler/remove_data {key:"range"}
# Run as player, at position near block

$data remove entity @e[tag=ra.custom_block,distance=..3,limit=1,sort=nearest] data.properties.$(key)
$tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Removed ","color":"gray"},{"text":"$(key)","color":"red"}]
