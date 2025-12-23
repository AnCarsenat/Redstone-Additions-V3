# /ra:tools/data_handler/cancel_edit
# Cancel edit mode. As player.

tag @s remove ra.editing_block
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
data remove entity @s data.editing_block

tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Edit cancelled.","color":"gray"}]
