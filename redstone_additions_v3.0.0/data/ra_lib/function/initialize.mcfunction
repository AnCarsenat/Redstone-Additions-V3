# /data/ra_lib/function/import.mcfunction`
# Initialize all library modules

function ra_lib:orientation/initialize
function ra_lib:placement/initialize
function ra_lib:removal/initialize

# Initialize generic scoreboards
scoreboard objectives add ra.temp dummy

tellraw @a [{"text":"[RA] ","color":"gold"},{"text":"Library systems initialized","color":"gray"}]
