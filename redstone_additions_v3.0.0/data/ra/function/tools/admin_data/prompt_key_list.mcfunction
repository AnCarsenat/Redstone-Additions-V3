# /ra:tools/admin_data/prompt_key_list
# Prompt for list key. As player.

scoreboard players set @s ra.edit_step 1

tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Type: ","color":"gray"},{"text":"List","color":"gold"}]
tellraw @s [{"text":"Enter command to manage list:","color":"gray"}]
tellraw @s [{"text":"  /function ra:tools/admin_data/list_ops {key:\"name\"}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/list_ops {key:\"\"}"}}]

tag @s remove ra.editing_data
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
