# Uninstall Redstone Additions

# Remove all custom blocks
kill @e[tag=ra.custom_block]

# Remove scoreboards
scoreboard objectives remove ra.player_yaw
scoreboard objectives remove ra.player_pitch
scoreboard objectives remove ra.block_facing
scoreboard objectives remove ra.axis
scoreboard objectives remove ra.dir_type

# Confirmation
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Redstone Additions uninstalled!","color":"red"}]