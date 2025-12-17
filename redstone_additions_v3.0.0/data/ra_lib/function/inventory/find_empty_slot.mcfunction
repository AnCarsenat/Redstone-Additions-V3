# /data/ra_lib/function/inventory/find_empty_slot.mcfunction
# Find the first empty slot in the container at current position
# Output: #slot ra.inv.slot (0-53, or -1 if full)

scoreboard players set #slot ra.inv.slot 0

# Check slots 0-26 (enough for single chest, barrel, shulker, etc.)
execute if data block ~ ~ ~ Items[{Slot:0b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 0 run return 1
execute if data block ~ ~ ~ Items[{Slot:1b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 1 run return 1
execute if data block ~ ~ ~ Items[{Slot:2b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 2 run return 1
execute if data block ~ ~ ~ Items[{Slot:3b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 3 run return 1
execute if data block ~ ~ ~ Items[{Slot:4b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 4 run return 1
execute if data block ~ ~ ~ Items[{Slot:5b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 5 run return 1
execute if data block ~ ~ ~ Items[{Slot:6b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 6 run return 1
execute if data block ~ ~ ~ Items[{Slot:7b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 7 run return 1
execute if data block ~ ~ ~ Items[{Slot:8b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 8 run return 1
execute if data block ~ ~ ~ Items[{Slot:9b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 9 run return 1
execute if data block ~ ~ ~ Items[{Slot:10b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 10 run return 1
execute if data block ~ ~ ~ Items[{Slot:11b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 11 run return 1
execute if data block ~ ~ ~ Items[{Slot:12b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 12 run return 1
execute if data block ~ ~ ~ Items[{Slot:13b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 13 run return 1
execute if data block ~ ~ ~ Items[{Slot:14b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 14 run return 1
execute if data block ~ ~ ~ Items[{Slot:15b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 15 run return 1
execute if data block ~ ~ ~ Items[{Slot:16b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 16 run return 1
execute if data block ~ ~ ~ Items[{Slot:17b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 17 run return 1
execute if data block ~ ~ ~ Items[{Slot:18b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 18 run return 1
execute if data block ~ ~ ~ Items[{Slot:19b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 19 run return 1
execute if data block ~ ~ ~ Items[{Slot:20b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 20 run return 1
execute if data block ~ ~ ~ Items[{Slot:21b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 21 run return 1
execute if data block ~ ~ ~ Items[{Slot:22b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 22 run return 1
execute if data block ~ ~ ~ Items[{Slot:23b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 23 run return 1
execute if data block ~ ~ ~ Items[{Slot:24b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 24 run return 1
execute if data block ~ ~ ~ Items[{Slot:25b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 25 run return 1
execute if data block ~ ~ ~ Items[{Slot:26b}] run scoreboard players add #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches 26 run return 1

# Container is full
scoreboard players set #slot ra.inv.slot -1
