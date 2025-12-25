particle minecraft:lava ~ ~1 ~ 0.5 0.5 0.5 0.1 10
playsound block.enchantment_table.use ambient @a ~ ~ ~ 1 0.65
summon item ~ ~ ~ {Item:{id:"minecraft:command_block",Count:1b,components:{"minecraft:item_model":"minecraft:lava_bucket","minecraft:item_name":'[{"color":"red","text":"lava core"}]',"minecraft:custom_data":{"lava_core":true},"minecraft:enchantment_glint_override":true,"minecraft:max_stack_size":1}}}
kill @s
