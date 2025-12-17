# /data/ra_lib/function/inventory/clear_loop.mcfunction
# Loop through slots to find and remove matching items

scoreboard players set #current_slot ra.inv.slot 0

# Process slots 0-26
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 0 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 1
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 1 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 2
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 2 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 3
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 3 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 4
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 4 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 5
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 5 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 6
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 6 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 7
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 7 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 8
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 8 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 9
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 9 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 10
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 10 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 11
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 11 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 12
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 12 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 13
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 13 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 14
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 14 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 15
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 15 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 16
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 16 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 17
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 17 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 18
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 18 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 19
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 19 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 20
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 20 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 21
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 21 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 22
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 22 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 23
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 23 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 24
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 24 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 25
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 25 run function ra_lib:inventory/clear_check_slot
scoreboard players set #current_slot ra.inv.slot 26
execute if score #to_remove ra.inv.count matches 1.. if score #current_slot ra.inv.slot matches 26 run function ra_lib:inventory/clear_check_slot
