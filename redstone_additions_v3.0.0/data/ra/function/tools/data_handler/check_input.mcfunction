# /ra:tools/data_handler/check_input
# Check for player input during edit mode. As player with ra.editing_block tag.

# Check if type was selected
execute if score @s ra.edit_type matches -1 run function ra:tools/data_handler/cancel_edit
execute if score @s ra.edit_type matches 1 if score @s ra.edit_step matches 0 run function ra:tools/data_handler/prompt_key_int
execute if score @s ra.edit_type matches 2 if score @s ra.edit_step matches 0 run function ra:tools/data_handler/prompt_key_str
execute if score @s ra.edit_type matches 3 if score @s ra.edit_step matches 0 run function ra:tools/data_handler/prompt_key_bool
