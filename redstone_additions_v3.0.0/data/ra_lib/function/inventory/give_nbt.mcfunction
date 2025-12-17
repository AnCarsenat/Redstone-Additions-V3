# /ra_lib:inventory/give_nbt
# Append item with components. At container. Input: storage ra:inventory item {id,count,components}
# Output: Returns 1 on success, 0 if full.

function ra_lib:inventory/find_slot
execute if score #slot ra.inv.slot matches -1 run return 0

execute store result storage ra:inventory item.Slot byte 1 run scoreboard players get #slot ra.inv.slot
data modify block ~ ~ ~ Items append from storage ra:inventory item
return 1

return 1
