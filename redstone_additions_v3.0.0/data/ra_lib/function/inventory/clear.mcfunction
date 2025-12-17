# /data/ra_lib/function/inventory/clear.mcfunction
# Clear a specific number of matching items from a container (like /clear for blocks)
# Context: at the block position
# Input via storage ra:inventory clear {...}
#   - id: The item ID to remove (e.g., "minecraft:diamond") [REQUIRED]
#   - count: Max number to remove (omit or -1 = all matching items)
#   - components: Optional - only clear items with matching components
#
# Returns: Number of items actually removed (for execute store)
#
# Example usage:
#   # Clear 32 diamonds:
#   data modify storage ra:inventory clear set value {id:"minecraft:diamond", count:32}
#   execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear
#
#   # Clear ALL diamonds:
#   data modify storage ra:inventory clear set value {id:"minecraft:diamond"}
#   execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear
#
#   # Clear only items with specific custom_data:
#   data modify storage ra:inventory clear set value {id:"minecraft:stick", components:{custom_data:{my_datapack:{special:1b}}}}
#   execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear

# Initialize removed counter
scoreboard players set #removed ra.inv.count 0

# Set remaining to remove (default to all if not specified)
execute unless data storage ra:inventory clear.count run data modify storage ra:inventory clear.count set value -1
execute store result score #to_remove ra.inv.count run data get storage ra:inventory clear.count

# If count is -1, set to max int for "remove all"
execute if score #to_remove ra.inv.count matches -1 run scoreboard players set #to_remove ra.inv.count 2147483647

# Process each slot (0-26 for single chest/barrel/etc)
function ra_lib:inventory/clear_loop

# Report result
execute if score #removed ra.inv.count matches 1.. run return run scoreboard players get #removed ra.inv.count

# Nothing removed
return 0
