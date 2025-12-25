# /ra_gates:load
# Initialize gates module

# Scoreboards for signal detection
scoreboard objectives add ra.act_red dummy
scoreboard objectives add ra.inac_red dummy

tellraw @a [{"text":"[RA] ","color":"gold"},{"text":"Logic Gates module loaded","color":"gray"}]
