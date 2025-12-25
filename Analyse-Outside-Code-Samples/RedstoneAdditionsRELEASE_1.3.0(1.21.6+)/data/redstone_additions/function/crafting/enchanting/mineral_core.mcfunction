particle dust{color:[0.55,0.55,0.55],scale:2} ~ ~1 ~ 0 0 0 0.1 10
playsound block.enchantment_table.use ambient @a ~ ~ ~ 1 0.65
summon item ~ ~ ~ {Item:{id:"minecraft:command_block",Count:1b,components:{"minecraft:item_model":"minecraft:smooth_stone","minecraft:item_name":'[{"color":"gray","text":"mineral core"}]',"minecraft:custom_data":{"mineral_core":true},"minecraft:enchantment_glint_override":true,"minecraft:max_stack_size":1}}}
kill @s
