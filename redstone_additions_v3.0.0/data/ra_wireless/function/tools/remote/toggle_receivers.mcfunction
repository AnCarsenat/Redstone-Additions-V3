# /ra_wireless:tools/remote/toggle_receivers
# Pulse all receivers on the remote's channel

# Get channel from held item and store in fake player score
execute store result score #remote_channel ra.temp run data get entity @s SelectedItem.components."minecraft:custom_data".ra.channel

# Pulse all receivers on this channel
execute as @e[tag=ra.custom_block.receiver] run function ra_wireless:tools/remote/check_receiver_channel

# Feedback
tellraw @s [{"text":"[Remote] ","color":"red"},{"text":"Pulsed receivers on channel ","color":"gray"},{"score":{"name":"#remote_channel","objective":"ra.temp"},"color":"yellow"}]
playsound minecraft:block.lever.click block @s ~ ~ ~ 1 1
