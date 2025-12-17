# /ra_lib:inventory/try_stack_loop
# Loop through slots trying to stack. At container.
# Input: #check_slot ra.temp (current slot), #input_count ra.temp, ra.stack_check item entity
# Modifies: #input_count ra.temp, #check_slot ra.temp

# Exit if no more items to stack or checked all slots
execute if score #input_count ra.temp matches ..0 run return 0
execute if score #check_slot ra.temp matches 27.. run return 0

# Check if slot has an item
execute store result score #has_item ra.temp run data get block ~ ~ ~ Items[{Slot:0b}]
execute if score #check_slot ra.temp matches 0 unless score #has_item ra.temp matches 1.. run scoreboard players add #check_slot ra.temp 1
execute if score #check_slot ra.temp matches 0 if score #has_item ra.temp matches 1.. run function ra_lib:inventory/try_stack_slot_0

execute if score #check_slot ra.temp matches 1 run function ra_lib:inventory/try_stack_check {slot:1}
execute if score #check_slot ra.temp matches 2 run function ra_lib:inventory/try_stack_check {slot:2}
execute if score #check_slot ra.temp matches 3 run function ra_lib:inventory/try_stack_check {slot:3}
execute if score #check_slot ra.temp matches 4 run function ra_lib:inventory/try_stack_check {slot:4}
execute if score #check_slot ra.temp matches 5 run function ra_lib:inventory/try_stack_check {slot:5}
execute if score #check_slot ra.temp matches 6 run function ra_lib:inventory/try_stack_check {slot:6}
execute if score #check_slot ra.temp matches 7 run function ra_lib:inventory/try_stack_check {slot:7}
execute if score #check_slot ra.temp matches 8 run function ra_lib:inventory/try_stack_check {slot:8}
execute if score #check_slot ra.temp matches 9 run function ra_lib:inventory/try_stack_check {slot:9}
execute if score #check_slot ra.temp matches 10 run function ra_lib:inventory/try_stack_check {slot:10}
execute if score #check_slot ra.temp matches 11 run function ra_lib:inventory/try_stack_check {slot:11}
execute if score #check_slot ra.temp matches 12 run function ra_lib:inventory/try_stack_check {slot:12}
execute if score #check_slot ra.temp matches 13 run function ra_lib:inventory/try_stack_check {slot:13}
execute if score #check_slot ra.temp matches 14 run function ra_lib:inventory/try_stack_check {slot:14}
execute if score #check_slot ra.temp matches 15 run function ra_lib:inventory/try_stack_check {slot:15}
execute if score #check_slot ra.temp matches 16 run function ra_lib:inventory/try_stack_check {slot:16}
execute if score #check_slot ra.temp matches 17 run function ra_lib:inventory/try_stack_check {slot:17}
execute if score #check_slot ra.temp matches 18 run function ra_lib:inventory/try_stack_check {slot:18}
execute if score #check_slot ra.temp matches 19 run function ra_lib:inventory/try_stack_check {slot:19}
execute if score #check_slot ra.temp matches 20 run function ra_lib:inventory/try_stack_check {slot:20}
execute if score #check_slot ra.temp matches 21 run function ra_lib:inventory/try_stack_check {slot:21}
execute if score #check_slot ra.temp matches 22 run function ra_lib:inventory/try_stack_check {slot:22}
execute if score #check_slot ra.temp matches 23 run function ra_lib:inventory/try_stack_check {slot:23}
execute if score #check_slot ra.temp matches 24 run function ra_lib:inventory/try_stack_check {slot:24}
execute if score #check_slot ra.temp matches 25 run function ra_lib:inventory/try_stack_check {slot:25}
execute if score #check_slot ra.temp matches 26 run function ra_lib:inventory/try_stack_check {slot:26}

# Continue loop
scoreboard players add #check_slot ra.temp 1
execute if score #input_count ra.temp matches 1.. if score #check_slot ra.temp matches ..26 run function ra_lib:inventory/try_stack_loop
