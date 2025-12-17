# /data/ra/function/load.mcfunction
# Redstone Additions V3.1.0 - Core Load

# Initialize library systems
function ra_lib:init

# Run tick
function ra:tick

# Initialize sub-modules
function ra_interactive:load

scoreboard objectives add ra.cooldown dummy

# Welcome message
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Redstone Additions v3.1.0 loaded!","color":"green"}]
tellraw @a [{"text":"Use ","color":"gray"},{"text":"/function ra:give_all_items","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function ra:give_all_items"}},{"text":" to get items","color":"gray"}]