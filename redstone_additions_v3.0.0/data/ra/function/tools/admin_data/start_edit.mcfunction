# /ra:tools/admin_data/start_edit
# Start edit mode for block runtime data. As player.

# Store the target block
data modify storage ra:temp editing_player set from entity @s UUID
tag @s add ra.editing_data

# Store which block we're editing
data modify entity @s data.editing_block set from storage ra:temp target_block

# Reset edit state
scoreboard players set @s ra.edit_step 0

tellraw @s [{"text":"═══ ","color":"dark_gray"},{"text":"Admin Edit Mode","color":"dark_purple","bold":true},{"text":" ═══","color":"dark_gray"}]
tellraw @s [{"text":"Current data: ","color":"light_purple"},{"nbt":"data.data","entity":"@e[tag=ra.custom_block,limit=1,sort=nearest]","color":"white"}]
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Select value type to set:","color":"gray"}]
tellraw @s [{"text":" [int]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger ra.edit_type set 1"},"hoverEvent":{"action":"show_text","contents":"Set an integer value"}},{"text":" "},{"text":"[str]","color":"green","clickEvent":{"action":"run_command","value":"/trigger ra.edit_type set 2"},"hoverEvent":{"action":"show_text","contents":"Set a string value"}},{"text":" "},{"text":"[bool]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger ra.edit_type set 3"},"hoverEvent":{"action":"show_text","contents":"Set true/false"}},{"text":" "},{"text":"[list]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ra.edit_type set 4"},"hoverEvent":{"action":"show_text","contents":"Manage a list"}},{"text":" "},{"text":"[cancel]","color":"red","clickEvent":{"action":"run_command","value":"/trigger ra.edit_type set -1"},"hoverEvent":{"action":"show_text","contents":"Cancel editing"}}]
