# /ra:tools/admin_data/prompt_key_int
# Prompt for integer key. As player.

# Move to step 1 (waiting for value)
scoreboard players set @s ra.edit_step 1

tellraw @s [{"text":"[Admin Data] ","color":"dark_purple"},{"text":"Type: ","color":"gray"},{"text":"Integer","color":"aqua"}]
tellraw @s [{"text":"Enter command to set data value:","color":"gray"}]
tellraw @s [{"text":"  /function ra:tools/admin_data/set_int {key:\"name\",value:N}","color":"gray","clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/set_int {key:\"\",value:}"}}]

# End edit mode
tag @s remove ra.editing_data
scoreboard players reset @s ra.edit_type
scoreboard players reset @s ra.edit_step
