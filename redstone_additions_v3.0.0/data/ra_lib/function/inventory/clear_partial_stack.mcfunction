# /data/ra_lib/function/inventory/clear_partial_stack.mcfunction
# Remove only part of a stack from a slot
# Macro param: slot
# Uses: #to_remove ra.inv.count, #slot_count ra.inv.count

# Calculate new stack size
scoreboard players operation #slot_count ra.inv.count -= #to_remove ra.inv.count

# Add to removed count (we removed exactly what we needed)
scoreboard players operation #removed ra.inv.count += #to_remove ra.inv.count

# Update the item count in the slot
$execute store result block ~ ~ ~ Items[{Slot:$(slot)b}].count byte 1 run scoreboard players get #slot_count ra.inv.count

# We've removed everything we needed
scoreboard players set #to_remove ra.inv.count 0
