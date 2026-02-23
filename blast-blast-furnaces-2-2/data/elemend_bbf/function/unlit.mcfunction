#rotates into correct position towards furnace. adds the "lit" tag if there is a lit furnace
execute unless block ^ ^ ^-1 #elemend_bbf:furnace run function elemend_bbf:input/rotate

# if the furnace really did turn off but still has a valid tag, set the entity into "standby"
execute if entity @s[tag=elemend_bbf_valid,tag=!elemend_bbf_lit] run function elemend_bbf:expire