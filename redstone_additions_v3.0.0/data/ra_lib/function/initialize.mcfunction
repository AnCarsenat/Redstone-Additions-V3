# /data/ra_lib/function/initialize.mcfunction
# Initialize all library modules

function ra_lib:orientation/initialize
function ra_lib:placement/initialize
function ra_lib:removal/initialize
function ra_lib:inventory/initialize

# Initialize generic scoreboards
scoreboard objectives add ra.temp dummy

tellraw @a [{"text":"[RA] ","color":"gold"},{"text":"Library systems initialized","color":"gray"}]
