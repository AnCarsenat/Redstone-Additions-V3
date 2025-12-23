# /ra_interactive:blocks/message/on_powered
# Send message when powered. As armor stand, at position.

# Get message and range from armor stand properties
execute store result score #range ra.temp run data get entity @s data.properties.range
execute if score #range ra.temp matches ..0 run scoreboard players set #range ra.temp 16

# Send message to players in range
function ra_interactive:blocks/message/send_message
