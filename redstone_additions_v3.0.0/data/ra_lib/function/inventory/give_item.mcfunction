# /data/ra_lib/function/inventory/give_item.mcfunction
# Insert an item into a container block's inventory (like /give but for blocks)
# Context: at the block position
# Input via storage ra:inventory item {...}
#   - id: The item ID (e.g., "minecraft:diamond") [REQUIRED]
#   - count: Number of items (default 1, omit for 1)
#   - slot: Target slot (-1 = first available, 0-53 = specific slot)
#   - components: Optional item components as compound (custom_name, lore, enchantments, custom_data, etc.)
#
# Example usage:
#   # Simple item:
#   data modify storage ra:inventory item set value {id:"minecraft:diamond", count:64}
#   execute positioned <x> <y> <z> run function ra_lib:inventory/give_item
#
#   # Item with custom name:
#   data modify storage ra:inventory item set value {id:"minecraft:diamond_sword", components:{custom_name:'"Super Sword"'}}
#   execute positioned <x> <y> <z> run function ra_lib:inventory/give_item
#
#   # Item with custom NBT data:
#   data modify storage ra:inventory item set value {id:"minecraft:stick", components:{custom_data:{my_datapack:{special:1b}}}}
#   execute positioned <x> <y> <z> run function ra_lib:inventory/give_item

# Set defaults if not provided
execute unless data storage ra:inventory item.count run data modify storage ra:inventory item.count set value 1
execute unless data storage ra:inventory item.slot run data modify storage ra:inventory item.slot set value -1

# Get the slot value
execute store result score #slot ra.inv.slot run data get storage ra:inventory item.slot

# If slot is -1, find first empty slot, otherwise use specified slot
execute if score #slot ra.inv.slot matches -1 run function ra_lib:inventory/find_empty_slot

# Insert the item using macro
function ra_lib:inventory/insert_item with storage ra:inventory item
