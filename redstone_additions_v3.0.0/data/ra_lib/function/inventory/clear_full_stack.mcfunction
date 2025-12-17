# /data/ra_lib/function/inventory/clear_full_stack.mcfunction
# Remove the entire stack from a slot
# Macro param: slot
# Uses: #slot_count ra.inv.count

# Add to removed count
scoreboard players operation #removed ra.inv.count += #slot_count ra.inv.count

# Subtract from remaining to remove
scoreboard players operation #to_remove ra.inv.count -= #slot_count ra.inv.count

# Remove the item
$data remove block ~ ~ ~ Items[{Slot:$(slot)b}]
