# /ra_lib:inventory/find_slot
# Find first empty slot in container. At container.
# Output: #slot ra.inv.slot (0-26, or -1 if full)

scoreboard players set #slot ra.inv.slot -1

execute unless data block ~ ~ ~ Items[{Slot:0b}] run scoreboard players set #slot ra.inv.slot 0
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:1b}] run scoreboard players set #slot ra.inv.slot 1
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:2b}] run scoreboard players set #slot ra.inv.slot 2
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:3b}] run scoreboard players set #slot ra.inv.slot 3
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:4b}] run scoreboard players set #slot ra.inv.slot 4
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:5b}] run scoreboard players set #slot ra.inv.slot 5
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:6b}] run scoreboard players set #slot ra.inv.slot 6
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:7b}] run scoreboard players set #slot ra.inv.slot 7
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:8b}] run scoreboard players set #slot ra.inv.slot 8
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:9b}] run scoreboard players set #slot ra.inv.slot 9
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:10b}] run scoreboard players set #slot ra.inv.slot 10
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:11b}] run scoreboard players set #slot ra.inv.slot 11
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:12b}] run scoreboard players set #slot ra.inv.slot 12
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:13b}] run scoreboard players set #slot ra.inv.slot 13
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:14b}] run scoreboard players set #slot ra.inv.slot 14
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:15b}] run scoreboard players set #slot ra.inv.slot 15
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:16b}] run scoreboard players set #slot ra.inv.slot 16
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:17b}] run scoreboard players set #slot ra.inv.slot 17
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:18b}] run scoreboard players set #slot ra.inv.slot 18
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:19b}] run scoreboard players set #slot ra.inv.slot 19
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:20b}] run scoreboard players set #slot ra.inv.slot 20
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:21b}] run scoreboard players set #slot ra.inv.slot 21
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:22b}] run scoreboard players set #slot ra.inv.slot 22
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:23b}] run scoreboard players set #slot ra.inv.slot 23
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:24b}] run scoreboard players set #slot ra.inv.slot 24
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:25b}] run scoreboard players set #slot ra.inv.slot 25
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:26b}] run scoreboard players set #slot ra.inv.slot 26
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:15b}] run scoreboard players set #slot ra.inv.slot 15
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:16b}] run scoreboard players set #slot ra.inv.slot 16
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:17b}] run scoreboard players set #slot ra.inv.slot 17
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:18b}] run scoreboard players set #slot ra.inv.slot 18
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:19b}] run scoreboard players set #slot ra.inv.slot 19
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:20b}] run scoreboard players set #slot ra.inv.slot 20
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:21b}] run scoreboard players set #slot ra.inv.slot 21
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:22b}] run scoreboard players set #slot ra.inv.slot 22
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:23b}] run scoreboard players set #slot ra.inv.slot 23
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:24b}] run scoreboard players set #slot ra.inv.slot 24
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:25b}] run scoreboard players set #slot ra.inv.slot 25
execute if score #slot ra.inv.slot matches -1 unless data block ~ ~ ~ Items[{Slot:26b}] run scoreboard players set #slot ra.inv.slot 26
