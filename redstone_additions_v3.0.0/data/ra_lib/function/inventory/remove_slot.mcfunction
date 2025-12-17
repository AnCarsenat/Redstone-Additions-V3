# /data/ra_lib/function/inventory/remove_slot.mcfunction
# Remove item at specific slot using macro
# Macro param: slot

$data remove block ~ ~ ~ Items[{Slot:$(slot)b}]
