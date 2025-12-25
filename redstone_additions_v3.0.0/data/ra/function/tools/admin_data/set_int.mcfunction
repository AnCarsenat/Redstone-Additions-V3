# /ra:tools/admin_data/set_int
# Set integer data value on nearest custom block. Macro function.
# Usage: /function ra:tools/admin_data/set_int {key:"count",value:10}

$data modify entity @e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest] data.data.$(key) set value $(value)
$tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Set data.","color":"gray"},{"text":"$(key)","color":"yellow"},{"text":" = ","color":"gray"},{"text":"$(value)","color":"aqua"}]

playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.5 2
