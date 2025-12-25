# /ra:tools/admin_data/list_remove
# Remove an element from a list by index. Macro function.
# Usage: /function ra:tools/admin_data/list_remove {key:"targets",index:0}

$data remove entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.data.$(key)[$(index)]
$tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Removed index ","color":"gray"},{"text":"$(index)","color":"red"},{"text":" from data.","color":"gray"},{"text":"$(key)","color":"yellow"}]

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.5 1
