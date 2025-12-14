# /data/ra/function/load.mcfunction
# Redstone Additions V3.0.0 - Core Load

# Initialize library systems
function ra_lib:initialize

# Run tick function
function ra:tick

scoreboard objectives add ra.blocks.cooldown dummy

# Welcome message
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Redstone Additions v3.0.0 loaded!","color":"green"}]
tellraw @a [{"text":"Use ","color":"gray"},{"text":"/function ra:items/give_all","color":"yellow","click_event":{"action":"suggest_command","command":"/function ra:give_all_items"}},{"text":" to get items","color":"gray"}]