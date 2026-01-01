# /ra_gates:load
# Initialize gates module

# Scoreboards for signal detection
scoreboard objectives add ra.act_red dummy
scoreboard objectives add ra.inac_red dummy

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Logic Gates loaded!","color":"aqua"}]
