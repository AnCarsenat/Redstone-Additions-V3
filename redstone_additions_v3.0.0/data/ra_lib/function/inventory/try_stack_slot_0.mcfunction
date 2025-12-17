# /ra_lib:inventory/try_stack_slot_0
# Special case for slot 0 (can't use macro for dynamic slot in data path easily)

execute unless data block ~ ~ ~ Items[{Slot:0b}] run return 0

execute store result score #slot_count ra.temp run data get block ~ ~ ~ Items[{Slot:0b}].count
execute if score #slot_count ra.temp matches 64.. run return 0

data modify storage ra:inventory slot_item set from block ~ ~ ~ Items[{Slot:0b}]

summon item ~ ~100 ~ {Item:{id:"minecraft:stone",count:1},Tags:["ra.slot_compare"],PickupDelay:32767s,Age:5999s,NoGravity:1b}
data modify entity @e[type=item,tag=ra.slot_compare,limit=1] Item set from storage ra:inventory slot_item
data modify entity @e[type=item,tag=ra.slot_compare,limit=1] Item.count set value 1

data modify storage ra:inventory check_a set from entity @e[type=item,tag=ra.stack_check,limit=1] Item.id
execute store success score #same_id ra.temp run data modify storage ra:inventory check_a set from entity @e[type=item,tag=ra.slot_compare,limit=1] Item.id

kill @e[type=item,tag=ra.slot_compare]

execute if score #same_id ra.temp matches 1 run return 0

scoreboard players set #max_stack ra.temp 64
scoreboard players operation #space ra.temp = #max_stack ra.temp
scoreboard players operation #space ra.temp -= #slot_count ra.temp

scoreboard players operation #to_add ra.temp = #input_count ra.temp
execute if score #to_add ra.temp > #space ra.temp run scoreboard players operation #to_add ra.temp = #space ra.temp

scoreboard players operation #new_count ra.temp = #slot_count ra.temp
scoreboard players operation #new_count ra.temp += #to_add ra.temp

execute store result block ~ ~ ~ Items[{Slot:0b}].count byte 1 run scoreboard players get #new_count ra.temp

scoreboard players operation #input_count ra.temp -= #to_add ra.temp
execute if score #input_count ra.temp matches ..0 run scoreboard players set #slot ra.inv.slot 0
