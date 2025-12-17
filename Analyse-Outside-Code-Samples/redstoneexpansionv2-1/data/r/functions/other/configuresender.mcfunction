
tellraw @s ["",{"text":"Right-click","color":"gold"},{"text":" this carrot on a stick to ","color":"gray"},{"text":"set the coordinates","color":"gold"}]
clear @a carrot_on_a_stick{senderSetter:1b}
give @s minecraft:carrot_on_a_stick{senderSetter:1b,display:{Name:"{\"text\":\"COORDINATE SETTER\",\"color\":\"aqua\",\"bold\":\"true\",\"italic\":\"false\"}",Lore:["Right-click to set the coordinates","the redstone signal will be sent.","Warning: There can only be one player","setting one sender at a time!"]},HideFlags:1,Enchantments:[{id:"minecraft:fortune",lvl:1}]} 1

execute if entity @e[tag=withcoordinSET] run tellraw @s ["",{"text":"The last ","color":"gray"},{"text":"coordinate","color":"gold"},{"text":"-","color":"gray"},{"text":"setting process ","color":"gold"},{"text":"has been ","color":"gray"},{"text":"canceled","color":"gold"},{"text":".","color":"gray"}]
tag @e[tag=withcoordinSET] remove withcoordinSET
tag @e[tag=SENDERN,limit=1,sort=nearest,distance=..10] add withcoordinSET