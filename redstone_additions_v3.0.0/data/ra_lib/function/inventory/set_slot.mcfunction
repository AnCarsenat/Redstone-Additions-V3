# /data/ra_lib/function/inventory/set_slot.mcfunction
# Set a specific slot using macro
# Macro param: slot (byte)

# Prepare the item data with correct slot
$data modify storage ra:inventory temp.item set value {Slot:$(slot)b}
data modify storage ra:inventory temp.item.id set from storage ra:inventory item.id
data modify storage ra:inventory temp.item.count set from storage ra:inventory item.count

# Copy components if they exist
execute if data storage ra:inventory item.components run data modify storage ra:inventory temp.item.components set from storage ra:inventory item.components

# Append to container's Items list
data modify block ~ ~ ~ Items append from storage ra:inventory temp.item
