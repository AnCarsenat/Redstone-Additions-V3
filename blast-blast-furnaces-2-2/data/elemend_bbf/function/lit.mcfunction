# check if the multiblock-structure is correct:
tag @s remove bbf_valid
# the rotation is handled in "elemend_bbf:input/rotate". this then applies the correct tag:

tag @s[y_rotation=0,predicate=elemend_bbf:structure_north] add elemend_bbf_valid
tag @s[y_rotation=90,predicate=elemend_bbf:structure_east] add elemend_bbf_valid
tag @s[y_rotation=180,predicate=elemend_bbf:structure_south] add elemend_bbf_valid
tag @s[y_rotation=-90,predicate=elemend_bbf:structure_west] add elemend_bbf_valid

# update the display if needed 
execute unless block ~ ~1 ~ minecraft:air positioned ~ ~1 ~ run kill @n[type=item_display,distance=..0.5,tag=elemend_bbf_display]
execute if block ~ ~1 ~ minecraft:air run function elemend_bbf:particles

#reads the recipe and starts an independant loop which then runs as long as needed.
execute if entity @s[tag=elemend_bbf_valid,tag=!elemend_bbf_scheduled,tag=!elemend_bbf_next] run function elemend_bbf:input/recipe