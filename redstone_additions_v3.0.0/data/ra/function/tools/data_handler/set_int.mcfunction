# /ra:tools/data_handler/set_int
# Set integer property on nearest custom block. Macro function.
# Usage: /function ra:tools/data_handler/set_int {key:"range",value:10}

# End edit mode
tag @s remove ra.editing_block
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step

$data modify entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.properties.$(key) set value $(value)
$tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Set ","color":"gray"},{"text":"$(key)","color":"yellow"},{"text":" = ","color":"gray"},{"text":"$(value)","color":"aqua"}]

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.5 2
