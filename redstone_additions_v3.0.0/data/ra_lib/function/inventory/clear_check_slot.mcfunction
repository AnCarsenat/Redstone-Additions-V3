# /data/ra_lib/function/inventory/clear_check_slot.mcfunction
# Check if current slot contains matching item and process removal
# Uses: #current_slot ra.inv.slot, storage ra:inventory clear.id

# Store slot for macro
execute store result storage ra:inventory temp.slot byte 1 run scoreboard players get #current_slot ra.inv.slot

# Check and process this slot
function ra_lib:inventory/clear_process_slot with storage ra:inventory temp
