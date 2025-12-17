# /data/ra_lib/function/inventory/insert_item.mcfunction
# Actually insert the item into the container
# Macro params: id (item id), count (amount)
# Uses: #slot ra.inv.slot for target slot

# Don't insert if no valid slot found
execute if score #slot ra.inv.slot matches -1 run return 0

# Store slot as storage for the macro
execute store result storage ra:inventory temp.slot byte 1 run scoreboard players get #slot ra.inv.slot

# Insert item with slot from temp storage
function ra_lib:inventory/set_slot with storage ra:inventory temp
