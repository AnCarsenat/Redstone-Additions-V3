# /ra:tools/admin_data/check_input
# Check for player input during edit mode. As player with ra.editing_data tag.

# Check if type was selected
execute if score @s ra.edit_type matches -1 run function ra:tools/admin_data/cancel_edit
execute if score @s ra.edit_type matches 1 if score @s ra.edit_step matches 0 run function ra:tools/admin_data/prompt_key_int
execute if score @s ra.edit_type matches 2 if score @s ra.edit_step matches 0 run function ra:tools/admin_data/prompt_key_str
execute if score @s ra.edit_type matches 3 if score @s ra.edit_step matches 0 run function ra:tools/admin_data/prompt_key_bool
execute if score @s ra.edit_type matches 4 if score @s ra.edit_step matches 0 run function ra:tools/admin_data/prompt_key_list
