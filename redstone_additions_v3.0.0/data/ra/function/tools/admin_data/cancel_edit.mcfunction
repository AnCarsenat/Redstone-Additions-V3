# /ra:tools/admin_data/cancel_edit
# Cancel edit mode. As player.

tag @s remove ra.editing_data
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
data remove entity @s data.editing_block

tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Edit cancelled.","color":"gray"}]
