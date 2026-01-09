# /ra:tools/creative_data_handler/found_block
# Called when a custom block is found. As armor stand, at armor stand.

# Mark that we found a block (prevent multiple calls)
data modify storage ra:temp cdh_found set value 1b

# Tag this block so we can reference it
tag @s add ra.cdh_target

# Store block UUID for reference
data modify storage ra:cdh target set from entity @s UUID

# Get block name from tag - check each known block type
data modify storage ra:cdh block_type set value "Unknown Block"

# Interactive blocks
execute if entity @s[tag=ra.custom_block.message_block] run data modify storage ra:cdh block_type set value "Message Block"
execute if entity @s[tag=ra.custom_block.block_placer] run data modify storage ra:cdh block_type set value "Block Placer"
execute if entity @s[tag=ra.custom_block.block_breaker] run data modify storage ra:cdh block_type set value "Block Breaker"
execute if entity @s[tag=ra.custom_block.breeder] run data modify storage ra:cdh block_type set value "Breeder"
execute if entity @s[tag=ra.custom_block.pusher] run data modify storage ra:cdh block_type set value "Pusher"
execute if entity @s[tag=ra.custom_block.spitter] run data modify storage ra:cdh block_type set value "Spitter"
execute if entity @s[tag=ra.custom_block.item_pipe] run data modify storage ra:cdh block_type set value "Item Pipe"
execute if entity @s[tag=ra.custom_block.infinite_water_cauldron] run data modify storage ra:cdh block_type set value "Infinite Water Cauldron"
execute if entity @s[tag=ra.custom_block.infinite_lava_cauldron] run data modify storage ra:cdh block_type set value "Infinite Lava Cauldron"
execute if entity @s[tag=ra.custom_block.infinite_snow_cauldron] run data modify storage ra:cdh block_type set value "Infinite Snow Cauldron"

# Sensor blocks
execute if entity @s[tag=ra.custom_block.entity_detector] run data modify storage ra:cdh block_type set value "Entity Detector"
execute if entity @s[tag=ra.custom_block.tag_adder] run data modify storage ra:cdh block_type set value "Tag Adder"
execute if entity @s[tag=ra.custom_block.tag_remover] run data modify storage ra:cdh block_type set value "Tag Remover"

# Gate blocks
execute if entity @s[tag=ra.custom_block.clock] run data modify storage ra:cdh block_type set value "Clock"
execute if entity @s[tag=ra.custom_block.uni_gate] run data modify storage ra:cdh block_type set value "UNI Gate"
execute if entity @s[tag=ra.custom_block.delayer] run data modify storage ra:cdh block_type set value "Delayer"
execute if entity @s[tag=ra.custom_block.extender] run data modify storage ra:cdh block_type set value "Extender"
execute if entity @s[tag=ra.custom_block.beamer] run data modify storage ra:cdh block_type set value "Beamer"
execute if entity @s[tag=ra.custom_block.rand] run data modify storage ra:cdh block_type set value "Randomizer"
execute if entity @s[tag=ra.custom_block.shortener] run data modify storage ra:cdh block_type set value "Shortener"

# Wireless blocks
execute if entity @s[tag=ra.custom_block.emitter] run data modify storage ra:cdh block_type set value "Wireless Emitter"
execute if entity @s[tag=ra.custom_block.receiver] run data modify storage ra:cdh block_type set value "Wireless Receiver"

# Store properties and internal data
data modify storage ra:cdh properties set from entity @s data.properties
data modify storage ra:cdh internal_data set from entity @s data.data

# Show the info to the nearest player who used the tool (only once)
execute unless data storage ra:temp cdh_menu_shown as @p[distance=..10] run function ra:tools/creative_data_handler/show_menu
data modify storage ra:temp cdh_menu_shown set value 1b
