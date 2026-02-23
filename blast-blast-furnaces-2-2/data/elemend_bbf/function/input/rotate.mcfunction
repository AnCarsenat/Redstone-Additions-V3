scoreboard players add @s elemend_bbf_calc 1
execute unless block ^ ^ ^-1 #elemend_bbf:furnace run rotate @s ~90 ~

# if the furnace is on, give marker "lit"-tag here as to not wait til next iteration.
execute if block ^ ^ ^-1 #elemend_bbf:furnace[lit=true] run tag @s add elemend_bbf_lit

# this rotation runs recursively, 3 times at most. the "at" updates the pos. context.
execute at @s[scores={elemend_bbf_calc=..2}] unless block ^ ^ ^-1 #elemend_bbf:furnace run function elemend_bbf:input/rotate