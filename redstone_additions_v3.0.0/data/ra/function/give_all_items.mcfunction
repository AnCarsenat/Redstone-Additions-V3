# /data/ra/function/give_all_items.mcfunction
# Give all custom block items and tools

function ra_interactive:items/give_all
function ra_sensors:items/give_all
function ra_gates:items/give_all
function ra_wireless:items/give_all
function ra:tools/creative_data_handler/give
function ra:tools/wrench/give
give @s minecraft:iron_block[minecraft:item_name="Output 1"]
give @s minecraft:gold_block[minecraft:item_name="Output 2"]
give @s minecraft:emerald_block[minecraft:item_name="Output 3"]


tellraw @s [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Given all custom blocks and tools!","color":"green"}]