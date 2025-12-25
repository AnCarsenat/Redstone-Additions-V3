# /ra_gates:check_signals
# Check redstone signals for all gates (similar to reference pack)
# Sets ra.act_red (active/powered) and ra.inac_red (inactive/unpowered) scores

# Reset scores for all gate entities with checkRed tag
scoreboard players set @e[tag=ra.checkRed] ra.act_red 0
scoreboard players set @e[tag=ra.checkRed] ra.inac_red 0

# Check redstone_wire in all 6 directions
# East (+X)
execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ redstone_wire run tag @s add ra.hasred.east
execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ redstone_wire[power=0] run tag @s remove ra.hasred.east
execute as @e[tag=ra.hasred.east] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.east] remove ra.hasred.east

# West (-X)
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ redstone_wire run tag @s add ra.hasred.west
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ redstone_wire[power=0] run tag @s remove ra.hasred.west
execute as @e[tag=ra.hasred.west] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.west] remove ra.hasred.west

# South (+Z)
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 redstone_wire run tag @s add ra.hasred.south
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 redstone_wire[power=0] run tag @s remove ra.hasred.south
execute as @e[tag=ra.hasred.south] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.south] remove ra.hasred.south

# North (-Z)
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 redstone_wire run tag @s add ra.hasred.north
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 redstone_wire[power=0] run tag @s remove ra.hasred.north
execute as @e[tag=ra.hasred.north] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.north] remove ra.hasred.north

# Up (+Y)
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ redstone_wire run tag @s add ra.hasred.up
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ redstone_wire[power=0] run tag @s remove ra.hasred.up
execute as @e[tag=ra.hasred.up] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.up] remove ra.hasred.up

# Down (-Y)
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ redstone_wire run tag @s add ra.hasred.down
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ redstone_wire[power=0] run tag @s remove ra.hasred.down
execute as @e[tag=ra.hasred.down] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ redstone_wire[power=0] run scoreboard players add @s ra.inac_red 1
tag @e[tag=ra.hasred.down] remove ra.hasred.down

# Check redstone_torch (lit = active)
execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ redstone_torch[lit=true] run scoreboard players add @s ra.act_red 1

# Check levers
execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ lever[powered=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ lever[powered=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 lever[powered=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 lever[powered=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ lever[powered=true] run scoreboard players add @s ra.act_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ lever[powered=true] run scoreboard players add @s ra.act_red 1

execute as @e[tag=ra.checkRed] at @s if block ~1 ~ ~ lever[powered=false] run scoreboard players add @s ra.inac_red 1
execute as @e[tag=ra.checkRed] at @s if block ~-1 ~ ~ lever[powered=false] run scoreboard players add @s ra.inac_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~1 lever[powered=false] run scoreboard players add @s ra.inac_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~ ~-1 lever[powered=false] run scoreboard players add @s ra.inac_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~1 ~ lever[powered=false] run scoreboard players add @s ra.inac_red 1
execute as @e[tag=ra.checkRed] at @s if block ~ ~-1 ~ lever[powered=false] run scoreboard players add @s ra.inac_red 1
