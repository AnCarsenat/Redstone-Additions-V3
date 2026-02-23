# check if the hopper got destroyed:
execute unless block ~ ~ ~ minecraft:hopper run function elemend_bbf:delete/items

# for running the furnace: look for a lit furnace:
tag @s remove elemend_bbf_lit
execute if block ^ ^ ^-1 #elemend_bbf:furnace[lit=true] run tag @s add elemend_bbf_lit

# if the furnace isn't lit check if the marker has the wrong rotation, or if furnace is off 
execute if entity @s[tag=!elemend_bbf_lit] run function elemend_bbf:unlit

# if lit schedule recipes
execute if entity @s[tag=elemend_bbf_lit] run function elemend_bbf:lit