# /ra:tools/data_handler/prompt_key_str
# Prompt for key name for string value. As player.

scoreboard players set @s ra.edit_step 1
scoreboard players set @s ra.edit_type 0

tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Type: ","color":"gray"},{"text":"String","color":"green"}]
tellraw @s [{"text":"Click a property to set:","color":"gray"}]
tellraw @s [{"text":" [message]","color":"yellow","clickEvent":{"action":"run_command","value":"/function ra:tools/data_handler/set_str {key:\"message\"}"}},{"text":" "},{"text":"[tag]","color":"yellow","clickEvent":{"action":"run_command","value":"/function ra:tools/data_handler/set_str {key:\"tag\"}"}},{"text":" "},{"text":"[entity_type]","color":"yellow","clickEvent":{"action":"run_command","value":"/function ra:tools/data_handler/set_str {key:\"entity_type\"}"}}]
tellraw @s [{"text":"Or type: ","color":"dark_gray"},{"text":"/function ra:tools/data_handler/set_str {key:\"name\",value:\"text\"}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/data_handler/set_str {key:\"\",value:\"\"}"}}]
