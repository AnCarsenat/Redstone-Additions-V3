# /ra:tools/admin_data/list_add_str
# Add a string value to a list in data. Macro function.
# Usage: /function ra:tools/admin_data/list_add_str {key:"targets",value:"player_name"}

$data modify entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.data.$(key) append value "$(value)"
$tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Added ","color":"gray"},{"text":"\"$(value)\"","color":"green"},{"text":" to data.","color":"gray"},{"text":"$(key)","color":"yellow"}]

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.5 1.5
