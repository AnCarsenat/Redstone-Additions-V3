# remove all the tags
tag @s remove elemend_bbf_lit
tag @s remove elemend_bbf_next
tag @s remove elemend_bbf_valid
tag @s remove elemend_bbf_scheduled

#remove data
data remove entity @s data{}

# and all scores are reset too:
scoreboard players reset @s elemend_bbf_item
scoreboard players reset @s elemend_bbf_ctime
scoreboard players reset @s elemend_bbf_calc
scoreboard players reset @s elemend_bbf_timing

# remove the item display:
execute positioned ~ ~1 ~ run kill @e[type=item_display,distance=..0.5,tag=elemend_bbf_display,limit=1]