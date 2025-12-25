# /ra:tools/admin_data/list_clear
# Clear all elements from a list. Macro function.
# Usage: /function ra:tools/admin_data/list_clear {key:"targets"}

$data modify entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.data.$(key) set value []
$tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Cleared all elements from data.","color":"gray"},{"text":"$(key)","color":"yellow"}]

playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.5 0.5
