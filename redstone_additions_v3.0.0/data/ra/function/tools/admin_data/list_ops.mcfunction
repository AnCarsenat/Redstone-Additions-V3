# /ra:tools/admin_data/list_ops
# Show list operations for a data key. Macro function.
# Usage: /function ra:tools/admin_data/list_ops {key:"targets"}

$tellraw @s [{"text":"──── ","color":"dark_gray"},{"text":"List Operations: ","color":"dark_purple"},{"text":"$(key)","color":"yellow"},{"text":" ────","color":"dark_gray"}]

# Show current list contents
$tellraw @s [{"text":"Current: ","color":"gray"},{"nbt":"data.data.$(key)","entity":"@e[tag=ra.custom_block,distance=..5,limit=1,sort=nearest]","color":"white"}]

# Add string
$tellraw @s [{"text":"[Add String]","color":"green","bold":true,"clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/list_add_str {key:\"$(key)\",value:\"\"}"},"hoverEvent":{"action":"show_text","contents":{"text":"Add a string to the list","color":"gray"}}}]

# Add integer
$tellraw @s [{"text":"[Add Integer]","color":"aqua","bold":true,"clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/list_add_int {key:\"$(key)\",value:0}"},"hoverEvent":{"action":"show_text","contents":{"text":"Add an integer to the list","color":"gray"}}}]

# Remove by index
$tellraw @s [{"text":"[Remove by Index]","color":"red","bold":true,"clickEvent":{"action":"suggest_command","value":"/function ra:tools/admin_data/list_remove {key:\"$(key)\",index:0}"},"hoverEvent":{"action":"show_text","contents":{"text":"Remove element at index","color":"gray"}}}]

# Clear list
$tellraw @s [{"text":"[Clear All]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/function ra:tools/admin_data/list_clear {key:\"$(key)\"}"},"hoverEvent":{"action":"show_text","contents":{"text":"Remove all elements from the list","color":"gray"}}}]

# Back
tellraw @s [{"text":"[Back]","color":"gray","clickEvent":{"action":"run_command","value":"/function ra:tools/admin_data/start_edit"},"hoverEvent":{"action":"show_text","contents":{"text":"Return to edit menu","color":"gray"}}}]
