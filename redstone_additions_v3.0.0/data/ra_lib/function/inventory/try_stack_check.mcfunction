# /ra_lib:inventory/try_stack_check {slot:N}
# Check if slot N can be stacked with input. At container.
# Input: $(slot), #input_count ra.temp, ra.stack_check item entity

$execute unless data block ~ ~ ~ Items[{Slot:$(slot)b}] run return 0

# Get existing item count and check if stackable (< 64)
$execute store result score #slot_count ra.temp run data get block ~ ~ ~ Items[{Slot:$(slot)b}].count
execute if score #slot_count ra.temp matches 64.. run return 0

# Compare item types using item entity merge trick
# Copy slot item to temp storage
$data modify storage ra:inventory slot_item set from block ~ ~ ~ Items[{Slot:$(slot)b}]

# Spawn comparison item
summon item ~ ~100 ~ {Item:{id:"minecraft:stone",count:1},Tags:["ra.slot_compare"],PickupDelay:32767s,Age:5999s,NoGravity:1b}
data modify entity @e[type=item,tag=ra.slot_compare,limit=1] Item set from storage ra:inventory slot_item
data modify entity @e[type=item,tag=ra.slot_compare,limit=1] Item.count set value 1

# Check if items can stack by attempting merge (same item = they stack)
# Compare IDs first
data modify storage ra:inventory check_a set from entity @e[type=item,tag=ra.stack_check,limit=1] Item.id
execute store success score #same_id ra.temp run data modify storage ra:inventory check_a set from entity @e[type=item,tag=ra.slot_compare,limit=1] Item.id

kill @e[type=item,tag=ra.slot_compare]

# If IDs differ, can't stack
execute if score #same_id ra.temp matches 1 run return 0

# Items match! Calculate how much we can add
# Available space = 64 - current count
scoreboard players set #max_stack ra.temp 64
scoreboard players operation #space ra.temp = #max_stack ra.temp
scoreboard players operation #space ra.temp -= #slot_count ra.temp

# Amount to add = min(input_count, space)
scoreboard players operation #to_add ra.temp = #input_count ra.temp
execute if score #to_add ra.temp > #space ra.temp run scoreboard players operation #to_add ra.temp = #space ra.temp

# New count = slot_count + to_add
scoreboard players operation #new_count ra.temp = #slot_count ra.temp
scoreboard players operation #new_count ra.temp += #to_add ra.temp

# Update the slot
$execute store result block ~ ~ ~ Items[{Slot:$(slot)b}].count byte 1 run scoreboard players get #new_count ra.temp

# Reduce input count
scoreboard players operation #input_count ra.temp -= #to_add ra.temp
execute if score #input_count ra.temp matches ..0 run scoreboard players set #slot ra.inv.slot $(slot)
