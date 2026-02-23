summon minecraft:item ~ ~0.7 ~ {Item:{id:"minecraft:copper_nugget",count:1},Tags:["elemend_bbf_dumitem"]}
execute store result entity @e[type=item,tag=elemend_bbf_dumitem,sort=nearest,limit=1] Item.count int 1 run scoreboard players get #elemend_bbf_randval elemend_bbf_calc
tag @e[type=item,tag=elemend_bbf_dumitem,sort=nearest,limit=1] remove elemend_bbf_dumitem