
clear @a carrot_on_a_stick{senderSetter:1b}
execute store result score @e[tag=withcoordinSET,limit=1] sender_x run data get entity @s Pos[0] 1
execute store result score @e[tag=withcoordinSET,limit=1] sender_y run data get entity @s Pos[1] 1
execute store result score @e[tag=withcoordinSET,limit=1] sender_z run data get entity @s Pos[2] 1
tellraw @s ["",{"text":"Succesfully ","color":"gold"},{"text":"set the ","color":"gray"},{"text":"coordinates ","color":"gold"},{"text":"to: ","color":"gray"},{"score":{"name":"@e[tag=withcoordinSET,limit=1]","objective":"sender_x"},"color":"gold"},{"text":" ","color":"gold"},{"score":{"name":"@e[tag=withcoordinSET,limit=1]","objective":"sender_y"},"color":"gold"},{"text":" ","color":"gold"},{"score":{"name":"@e[tag=withcoordinSET,limit=1]","objective":"sender_z"},"color":"gold"}]
tag @e[tag=withcoordinSET] add withcoordin
tag @e[tag=withcoordinSET] remove SENDER
tag @e[tag=withcoordinSET] remove send_south
tag @e[tag=withcoordinSET] remove send_north
tag @e[tag=withcoordinSET] remove send_west
tag @e[tag=withcoordinSET] remove send_east
tag @e[tag=withcoordinSET] remove withcoordinSET