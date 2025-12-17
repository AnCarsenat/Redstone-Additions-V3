
execute at @e[tag=createHOPPER] run setblock ~ ~ ~ hopper
execute at @e[tag=createHOPPER] unless block ~1 ~ ~ air run setblock ~ ~ ~ hopper[facing=east]
execute at @e[tag=createHOPPER] unless block ~-1 ~ ~ air run setblock ~ ~ ~ hopper[facing=west]
execute at @e[tag=createHOPPER] unless block ~ ~ ~-1 air run setblock ~ ~ ~ hopper[facing=north]
execute at @e[tag=createHOPPER] unless block ~ ~ ~1 air run setblock ~ ~ ~ hopper[facing=south]
execute at @e[tag=createHOPPER] run particle dragon_breath ~ ~0.5 ~ 0.5 0.5 0.5 0.001 40
scoreboard players set @e[tag=createHOPPER] detect_radius 5
tag @e[tag=createHOPPER] remove createHOPPER
execute as @e[tag=HOPPER] at @s unless block ~ ~ ~ hopper run function r:other/eldestroy


execute at @e[tag=HOPPER,scores={detect_radius=3}] if entity @e[type=item,distance=1..3] at @e[type=item,distance=1..3] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=4}] if entity @e[type=item,distance=1..4] at @e[type=item,distance=1..4] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=5}] if entity @e[type=item,distance=1..5] at @e[type=item,distance=1..5] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=6}] if entity @e[type=item,distance=1..6] at @e[type=item,distance=1..6] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=7}] if entity @e[type=item,distance=1..7] at @e[type=item,distance=1..7] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=8}] if entity @e[type=item,distance=1..8] at @e[type=item,distance=1..8] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=10}] if entity @e[type=item,distance=1..10] at @e[type=item,distance=1..10] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10
execute at @e[tag=HOPPER,scores={detect_radius=15}] if entity @e[type=item,distance=1..15] at @e[type=item,distance=1..15] run particle dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 10

execute at @e[tag=HOPPER,scores={detect_radius=3}] if entity @e[type=item,distance=1..3] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..3] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=4}] if entity @e[type=item,distance=1..4] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..4] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=5}] if entity @e[type=item,distance=1..5] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..5] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=6}] if entity @e[type=item,distance=1..6] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..6] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=7}] if entity @e[type=item,distance=1..7] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..7] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=8}] if entity @e[type=item,distance=1..8] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..8] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=10}] if entity @e[type=item,distance=1..10] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..10] ~ ~ ~
execute at @e[tag=HOPPER,scores={detect_radius=15}] if entity @e[type=item,distance=1..15] positioned ~ ~0.8 ~ run teleport @e[type=item,distance=1..15] ~ ~ ~
