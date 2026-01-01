# /data/ra/function/load.mcfunction
# Redstone Additions V3.1.0 - Core Load

# ========================== SCOREBOARDS ==========================
# Initialize scoreboards
# Data handler scoreboards
scoreboard objectives add ra.edit_type trigger
scoreboard objectives add ra.edit_step dummy
scoreboard players enable @a ra.edit_type

# Core scoreboards
scoreboard objectives add ra.cooldown dummy

# ========================== SUB-LOAD ==========================
# Initialize library systems
function ra_lib:init

# Initialize sub-modules
function ra_interactive:load
function ra_sensors:load
function ra_gates:load

# ========================== TICKLOOP ==========================
# Run tick
function ra:tick

# ========================== WELCOME MESSAGE ==========================
# Load message
tellraw @a [{"text":"[RA_Lib] ","color":"gold"},{"text":"v3.1.0 loaded","color":"green"}]

# Welcome message
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Redstone Additions v3.1.0 loaded!","color":"green"}]
tellraw @a [{"text":"Use ","color":"gray"},{"text":"/function ra:give_all_items","color":"yellow","hover_event":{action:"show_text",value:"Give all items"},"click_event":{"action":"suggest_command","command":"/function ra:give_all_items"}},{"text":" to get items","color":"gray"}]
