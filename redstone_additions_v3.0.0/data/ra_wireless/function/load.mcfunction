# /ra_wireless:load
# Initialize wireless redstone module

# Scoreboard for channel storage
scoreboard objectives add ra.channel dummy

# Scoreboard for pulse timer (remote pulse duration)
scoreboard objectives add ra.pulse_timer dummy

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Wireless Redstone loaded!","color":"aqua"}]
