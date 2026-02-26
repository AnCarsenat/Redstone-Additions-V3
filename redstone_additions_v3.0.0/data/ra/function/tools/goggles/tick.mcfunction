# /ra:tools/goggles/tick
# Detect if any player is holding or wearing goggles, then scan
# Called every tick from ra:tick

# Check if any player is wearing goggles (helmet slot) or holding them
execute as @a at @s if items entity @s armor.head *[custom_data~{ra:{goggles:1b}}] run tag @s add ra.goggles_active
execute as @a at @s if items entity @s weapon.mainhand *[custom_data~{ra:{goggles:1b}}] run tag @s add ra.goggles_active
execute as @a at @s if items entity @s weapon.offhand *[custom_data~{ra:{goggles:1b}}] run tag @s add ra.goggles_active

# Run scan for players with goggles (throttled to every 40 ticks = 2 sec)
scoreboard players add #goggles_timer ra.temp 1
execute unless score #goggles_timer ra.temp matches 40.. run return 0
scoreboard players set #goggles_timer ra.temp 0

# Remove old billboards
kill @e[tag=ra.billboard]

# Scan for each player with goggles
execute as @a[tag=ra.goggles_active] at @s run function ra:tools/goggles/scan_blocks
execute as @a[tag=ra.goggles_active] at @s run function ra:tools/goggles/scan_multiblocks

# Remove goggles tag (re-applied next tick if still wearing/holding)
tag @a remove ra.goggles_active
