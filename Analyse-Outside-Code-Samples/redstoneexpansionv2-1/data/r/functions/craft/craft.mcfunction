
execute at @e[tag=createREXC] run setblock ~ ~ ~ dispenser[facing=down]{CustomName:"{\"text\":\"REDEXP-CRAFTER\",\"color\":\"red\",\"bold\":\"true\",\"italic\":\"false\"}"} replace
tag @e[tag=createREXC] remove createREXC
execute as @e[tag=REXC] at @s unless block ~ ~ ~ dispenser run function r:other/eldestroy

scoreboard players set @e[tag=REXC] craftID -1


#gates
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:redstone",Count:1b},{Slot:4b,id:"minecraft:repeater",Count:1b},{Slot:5b,id:"minecraft:redstone",Count:1b},{Slot:6b,id:"minecraft:cobblestone_slab",Count:1b},{Slot:7b,id:"minecraft:cobblestone_slab",Count:1b},{Slot:8b,id:"minecraft:cobblestone_slab",Count:1b}]} run scoreboard players set @s craftID 1
#manipulators
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:repeater",Count:1b},{Slot:4b,id:"minecraft:stone",Count:1b},{Slot:5b,id:"minecraft:redstone",Count:1b},{Slot:6b,id:"minecraft:stone",Count:1b},{Slot:7b,id:"minecraft:stone",Count:1b},{Slot:8b,id:"minecraft:stone",Count:1b}]} run scoreboard players set @s craftID 2
#impulse
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone",Count:1b},{Slot:3b,id:"minecraft:lime_wool",Count:1b},{Slot:4b,id:"minecraft:stone_button",Count:1b},{Slot:5b,id:"minecraft:redstone_block",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b}]} run scoreboard players set @s craftID 3
#flipflop
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:quartz_slab",Count:1b},{Slot:4b,id:"minecraft:quartz_block",Count:1b},{Slot:5b,id:"minecraft:redstone_block",Count:1b},{Slot:7b,id:"minecraft:redstone_torch",Count:1b}]} run scoreboard players set @s craftID 4
#random
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:bookshelf",Count:1b},{Slot:4b,id:"minecraft:piston",Count:1b},{Slot:5b,id:"minecraft:stone",Count:1b},{Slot:7b,id:"minecraft:repeater",Count:1b}]} run scoreboard players set @s craftID 5
#detector
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:2b,id:"minecraft:observer",Count:1b},{Slot:3b,id:"minecraft:redstone",Count:1b},{Slot:4b,id:"minecraft:redstone",Count:1b},{Slot:5b,id:"minecraft:redstone_torch",Count:1b},{Slot:8b,id:"minecraft:observer",Count:1b}]} run scoreboard players set @s craftID 6
#sender
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:0b,id:"minecraft:redstone",Count:1b},{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:2b,id:"minecraft:repeater",Count:1b},{Slot:4b,id:"minecraft:dispenser",Count:1b},{Slot:6b,id:"minecraft:repeater",Count:1b},{Slot:7b,id:"minecraft:redstone_torch",Count:1b},{Slot:8b,id:"minecraft:redstone",Count:1b}]} run scoreboard players set @s craftID 7
#beamer
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone",Count:1b},{Slot:2b,id:"minecraft:sticky_piston",Count:1b},{Slot:3b,id:"minecraft:stone",Count:1b},{Slot:4b,id:"minecraft:redstone_torch",Count:1b},{Slot:5b,id:"minecraft:sticky_piston",Count:1b},{Slot:7b,id:"minecraft:redstone",Count:1b},{Slot:8b,id:"minecraft:sticky_piston",Count:1b}]} run scoreboard players set @s craftID 8
#lever
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:0b,id:"minecraft:redstone",Count:1b},{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:2b,id:"minecraft:redstone",Count:1b},{Slot:3b,id:"minecraft:lever",Count:1b},{Slot:4b,id:"minecraft:repeater",Count:1b},{Slot:5b,id:"minecraft:lever",Count:1b},{Slot:6b,id:"minecraft:redstone_block",Count:1b},{Slot:8b,id:"minecraft:redstone_block",Count:1b}]} run scoreboard players set @s craftID 9
#hopper
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:ender_eye",Count:1b},{Slot:3b,id:"minecraft:ender_pearl",Count:1b},{Slot:4b,id:"minecraft:hopper",Count:1b},{Slot:5b,id:"minecraft:ender_pearl",Count:1b},{Slot:7b,id:"minecraft:redstone_torch",Count:1b}]} run scoreboard players set @s craftID 10
#furnance
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:0b,id:"minecraft:iron_block",Count:1b},{Slot:1b,id:"minecraft:iron_block",Count:1b},{Slot:2b,id:"minecraft:iron_block",Count:1b},{Slot:3b,id:"minecraft:furnace",Count:1b},{Slot:4b,id:"minecraft:furnace",Count:1b},{Slot:5b,id:"minecraft:furnace",Count:1b},{Slot:6b,id:"minecraft:blaze_powder",Count:1b},{Slot:7b,id:"minecraft:redstone_block",Count:1b},{Slot:8b,id:"minecraft:blaze_powder",Count:1b}]} run scoreboard players set @s craftID 11
#message
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:1b,id:"minecraft:redstone_torch",Count:1b},{Slot:3b,id:"minecraft:book",Count:1b},{Slot:4b,id:"minecraft:enchanting_table",Count:1b},{Slot:5b,id:"minecraft:book",Count:1b},{Slot:7b,id:"minecraft:redstone_torch",Count:1b}]} run scoreboard players set @s craftID 12
#config
execute as @e[tag=REXC] at @s if block ~ ~ ~ minecraft:dispenser{Items:[{Slot:0b,id:"minecraft:bone_meal",Count:1b},{Slot:1b,id:"minecraft:bone_meal",Count:1b},{Slot:2b,id:"minecraft:bone_meal",Count:1b},{Slot:3b,id:"minecraft:bone_meal",Count:1b},{Slot:4b,id:"minecraft:carrot_on_a_stick",Count:1b},{Slot:5b,id:"minecraft:bone_meal",Count:1b},{Slot:6b,id:"minecraft:bone_meal",Count:1b},{Slot:7b,id:"minecraft:bone_meal",Count:1b},{Slot:8b,id:"minecraft:bone_meal",Count:1b}]} run scoreboard players set @s craftID 13


execute at @e[scores={craftID=1..}] run function r:craft/craftreal