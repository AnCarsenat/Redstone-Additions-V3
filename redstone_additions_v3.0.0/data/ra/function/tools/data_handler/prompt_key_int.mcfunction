# /ra:tools/data_handler/prompt_key_int
# Prompt for key name for integer value. As player.

scoreboard players set @s ra.edit_step 1
scoreboard players set @s ra.edit_type 0

tellraw @s [{"text":"[Data Handler] ","color":"gold"},{"text":"Type: ","color":"gray"},{"text":"Integer","color":"aqua"}]
tellraw @s [{"text":"Click a property to set:","color":"gray"}]
tellraw @s [{"text":" [range]","color":"yellow","clickEvent":{"action":"run_command","value":"/function ra:tools/data_handler/set_int {key:\"range\"}"}},{"text":" "},{"text":"[output_power]","color":"yellow","clickEvent":{"action":"run_command","value":"/function ra:tools/data_handler/set_int {key:\"output_power\"}"}}]
tellraw @s [{"text":"Or type: ","color":"dark_gray"},{"text":"/function ra:tools/data_handler/set_int {key:\"name\",value:N}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/data_handler/set_int {key:\"\",value:}"}}]
