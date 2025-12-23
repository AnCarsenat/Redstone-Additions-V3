# /ra_sensors:blocks/player_detector/detect
# Detect players in range. As armor stand, at position.

# Get range from properties (default 5)
execute store result score #range ra.temp run data get entity @s data.properties.range
execute if score #range ra.temp matches ..0 run scoreboard players set #range ra.temp 5

# Check if any player in range using score comparison
scoreboard players set #detected ra.temp 0
execute if score #range ra.temp matches 1 if entity @a[distance=..1] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 2 if entity @a[distance=..2] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 3 if entity @a[distance=..3] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 4 if entity @a[distance=..4] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 5 if entity @a[distance=..5] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 6 if entity @a[distance=..6] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 7 if entity @a[distance=..7] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 8 if entity @a[distance=..8] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 9 if entity @a[distance=..9] run scoreboard players set #detected ra.temp 1
execute if score #range ra.temp matches 10.. if entity @a[distance=..10] run scoreboard players set #detected ra.temp 1

# Only update block if state changed (prevents flashing)
execute if score #detected ra.temp matches 1 unless block ~ ~ ~ observer[powered=true] run setblock ~ ~ ~ observer[powered=true]
execute if score #detected ra.temp matches 0 unless block ~ ~ ~ observer[powered=false] run setblock ~ ~ ~ observer[powered=false]
