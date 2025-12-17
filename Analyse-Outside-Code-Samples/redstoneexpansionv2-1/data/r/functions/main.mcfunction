
execute as @a[scores={leaveGame=1..}] run function r:other/join
execute as @a[tag=!firstTimeJoin] run function r:other/join

function r:other/checksignals
execute unless entity @e[tag=SETTINGS,tag=deactivated_all] run function r:doelements


execute if entity @e[tag=SETTINGS] run function r:oelements/settings
execute as @a[scores={cclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{redstone:1b}}}] run function r:other/configure
execute as @a[scores={cclick=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{senderSetter:1b}}}] run function r:oelements/sender/set
scoreboard players set @a[scores={cclick=1..}] cclick 0


execute unless entity @e[tag=name_off] as @a at @s at @e[tag=redexp,distance=..1.5,limit=1,sort=nearest] if entity @e[distance=..0.2,limit=1,sort=nearest,tag=GATE] run title @s actionbar ["",{"text":"- - - ","color":"gray"},{"selector":"@e[tag=GATE,limit=1,sort=nearest]","bold":true,"color":"aqua"},{"text":"-GATE","bold":true,"color":"aqua"},{"text":" - - -","color":"gray"}]
execute unless entity @e[tag=name_off] as @a at @s at @e[tag=redexp,distance=..1.5,limit=1,sort=nearest] if entity @e[distance=..0.2,limit=1,sort=nearest,tag=NGATE] run title @s actionbar ["",{"text":"- - - ","color":"gray"},{"selector":"@e[tag=NGATE,limit=1,sort=nearest]","bold":true,"color":"aqua"},{"text":"","bold":true,"color":"aqua"},{"text":" - - -","color":"gray"}]

execute if entity @a[nbt={SelectedItem:{id:"minecraft:structure_void"}},gamemode=survival] run function r:other/crafting

execute at @a at @e[tag=redexp,tag=!out_affect,distance=..3] run particle crit ~ ~ ~ 0.35 0.35 0.35 0.1 1 force @a[distance=..3]

execute at @e[nbt={Item:{id:"minecraft:redstone_block",Count:1b}}] if entity @e[nbt={Item:{id:"minecraft:dispenser",Count:1b}},distance=..1] run give @p minecraft:armor_stand{redstone:1b,display:{Name:"{\"text\":\"REDEXP-CRAFTER\",\"color\":\"red\",\"bold\":\"true\",\"italic\":\"false\"}",Lore:["You can find all of the recipes","here: "]},HideFlags:1,Enchantments:[{id:"minecraft:fortune",lvl:1}],EntityTag:{CustomNameVisible:0b,CustomName:"{\"text\":\"REDEXP-CRAFTER\",\"color\":\"red\",\"bold\":\"true\"}",NoGravity:1b,Invulnerable:1b,Small:1b,Marker:1b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["redexp","REXC","createREXC"]}} 1
execute at @e[nbt={Item:{id:"minecraft:redstone_block",Count:1b}}] if entity @e[nbt={Item:{id:"minecraft:dispenser",Count:1b}},distance=..1] run kill @e[type=item,distance=..1]
