# /ra:tools/creative_data_handler/list_properties
# List all properties with clickable value and type fields. As player.

# Check each common property and display if it exists
# We need to check each property type and display accordingly

# Check for 'range' property (typically int)
execute if data storage ra:cdh properties.range run function ra:tools/creative_data_handler/props/show_range

# Check for 'message' property (typically str)
execute if data storage ra:cdh properties.message run function ra:tools/creative_data_handler/props/show_message

# Check for 'tag' property (typically str)
execute if data storage ra:cdh properties.tag run function ra:tools/creative_data_handler/props/show_tag

# Check for 'entity_selector' property (typically str)
execute if data storage ra:cdh properties.entity_selector run function ra:tools/creative_data_handler/props/show_entity_selector

# Check for 'inverted' property (typically bool)
execute if data storage ra:cdh properties.inverted run function ra:tools/creative_data_handler/props/show_inverted

# Check for 'delay' property (typically int)
execute if data storage ra:cdh properties.delay run function ra:tools/creative_data_handler/props/show_delay

# Check for 'power' property (typically int)
execute if data storage ra:cdh properties.power run function ra:tools/creative_data_handler/props/show_power

# Check for 'mode' property (typically str)
execute if data storage ra:cdh properties.mode run function ra:tools/creative_data_handler/props/show_mode

# Check for 'target' property (typically str)
execute if data storage ra:cdh properties.target run function ra:tools/creative_data_handler/props/show_target

# Check for 'enabled' property (typically bool)
execute if data storage ra:cdh properties.enabled run function ra:tools/creative_data_handler/props/show_enabled

# If no properties, show message
execute unless data storage ra:cdh properties run tellraw @s [{"text":"  (no properties)","color":"dark_gray","italic":true}]
