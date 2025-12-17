
execute at @e[tag=createFURNANCE] run setblock ~ ~ ~ furnace{CustomName:"{\"text\":\"REDSTONE FURNACE\",\"color\":\"aqua\",\"bold\":\"true\",\"italic\":\"false\"}"} replace
tag @e[tag=createFURNANCE] remove createFURNANCE

execute as @e[tag=FURNANCE] at @s unless block ~ ~ ~ furnace run kill @e[type=item,limit=1,sort=nearest,distance=..1,nbt={Item:{id:"minecraft:furnace",Count:1b}}]

execute as @e[tag=FURNANCE] at @s unless block ~ ~ ~ furnace run summon item ~ ~ ~ {Item:{id:"minecraft:armor_stand",Count:1b,tag:{redstone:1b,display:{Name:"{\"text\":\"REDSTONE FURNANCE\",\"color\":\"aqua\",\"bold\":\"true\",\"italic\":\"false\"}",Lore:["Activates, if it receives a","redstone signal.","It is craftable, look it up here:","https://imgur.com/y2ZMPyz","Smelts slower than a normal one."]},HideFlags:1,Enchantments:[{id:"minecraft:fortune",lvl:1}],EntityTag:{CustomNameVisible:0b,CustomName:"{\"text\":\"REDSTONE FURNANCE\",\"color\":\"aqua\",\"bold\":\"true\"}",NoGravity:1b,Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["FURNANCE","createFURNANCE","redexp","checkRed"]}}}}

execute as @e[tag=FURNANCE] at @s unless block ~ ~ ~ furnace run function r:other/eldestroy



scoreboard players add @e[tag=FURNANCE,scores={act_red=1..}] furnance_timer 1
execute at @e[tag=FURNANCE,scores={furnance_timer=35}] run data merge block ~ ~ ~ {BurnTime:30s}
scoreboard players set @e[tag=FURNANCE,scores={furnance_timer=35}] furnance_timer 0