# /ra:tools/data_handler/set_data_string
# Set string data on nearest custom block. Macro function.
# Usage: function ra:tools/data_handler/set_data_string {key:"message",value:"Hello World!"}
# Run as player, at position near block

$data modify entity @e[tag=ra.custom_block,distance=..3,limit=1,sort=nearest] data.properties.$(key) set value "$(value)"
$tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Set ","color":"gray"},{"text":"$(key)","color":"yellow"},{"text":" = ","color":"gray"},{"text":"\"$(value)\"","color":"green"}]
