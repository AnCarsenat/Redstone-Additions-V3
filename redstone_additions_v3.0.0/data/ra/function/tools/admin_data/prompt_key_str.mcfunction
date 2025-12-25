# /ra:tools/admin_data/prompt_key_str
# Prompt for string key. As player.

scoreboard players set @s ra.edit_step 1

tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Type: ","color":"gray"},{"text":"String","color":"green"}]
tellraw @s [{"text":"Enter command to set data value:","color":"gray"}]
tellraw @s [{"text":"  /function ra:tools/admin_data/set_str {key:\"name\",value:\"text\"}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/set_str {key:\"\",value:\"\"}"}}]

tag @s remove ra.editing_data
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
