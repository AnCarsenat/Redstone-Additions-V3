# /data/ra_lib/function/inventory/clear_slot.mcfunction
# Remove an item from a specific slot in a container
# Context: at the block position
# Input via storage ra:inventory clear.slot (0-26)
#
# Example usage:
#   data modify storage ra:inventory clear.slot set value 0
#   execute at <pos> run function ra_lib:inventory/clear_slot

# Get slot to clear
execute store result storage ra:inventory temp.slot byte 1 run data get storage ra:inventory clear.slot

# Remove the item at that slot
function ra_lib:inventory/remove_slot with storage ra:inventory temp
