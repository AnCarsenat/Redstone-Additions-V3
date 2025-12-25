# /ra:tools/admin_data/list_add_int
# Add an integer value to a list in data. Macro function.
# Usage: /function ra:tools/admin_data/list_add_int {key:"values",value:42}

$data modify entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.data.$(key) append value $(value)
$tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Added ","color":"gray"},{"text":"$(value)","color":"aqua"},{"text":" to data.","color":"gray"},{"text":"$(key)","color":"yellow"}]

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.5 1.5
