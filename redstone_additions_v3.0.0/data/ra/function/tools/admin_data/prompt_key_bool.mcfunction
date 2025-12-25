# /ra:tools/admin_data/prompt_key_bool
# Prompt for boolean key. As player.

scoreboard players set @s ra.edit_step 1

tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Type: ","color":"gray"},{"text":"Boolean","color":"light_purple"}]
tellraw @s [{"text":"Enter command to set data value:","color":"gray"}]
tellraw @s [{"text":"  /function ra:tools/admin_data/set_bool {key:\"name\",value:true}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/set_bool {key:\"\",value:true}"}}]

tag @s remove ra.editing_data
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
