# /ra:tools/data_handler/prompt_key_bool
# Prompt for key name for boolean value. As player.

scoreboard players set @s ra.edit_step 1
scoreboard players set @s ra.edit_type 0

tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Type: ","color":"gray"},{"text":"Boolean","color":"light_purple"}]
tellraw @s [{"text":"Or type: ","color":"dark_gray"},{"text":"/function ra:tools/data_handler/set_bool {key:\"name\",value:true}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/data_handler/set_bool {key:\"\",value:true}"}}]
