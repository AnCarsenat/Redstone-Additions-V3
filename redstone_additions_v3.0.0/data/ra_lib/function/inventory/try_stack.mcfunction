# /ra_lib:inventory/try_stack
# Try to stack input item with existing items in container. At container.
# Input: storage ra:inventory item, #input_count ra.temp
# Output: #input_count ra.temp (remaining count after stacking)

# We need to iterate through container slots and try to merge
# Using item entity workaround to compare item types

# Spawn temp item with our input data
summon item ~ ~100 ~ {Item:{id:"minecraft:stone",count:1},Tags:["ra.stack_check"],PickupDelay:32767s,Age:5999s,NoGravity:1b}
data modify entity @e[type=item,tag=ra.stack_check,limit=1] Item set from storage ra:inventory item
data modify entity @e[type=item,tag=ra.stack_check,limit=1] Item.count set value 1

# Check each slot for matching item
scoreboard players set #check_slot ra.temp 0
function ra_lib:inventory/try_stack_loop

# Clean up
kill @e[type=item,tag=ra.stack_check]
