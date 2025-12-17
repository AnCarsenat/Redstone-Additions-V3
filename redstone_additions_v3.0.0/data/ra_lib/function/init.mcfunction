# /ra_lib:init
# Initialize all ra_lib modules. Called on datapack load.

function ra_lib:orientation/init
function ra_lib:placement/init
function ra_lib:removal/init
function ra_lib:inventory/init
function ra_lib:redstone/init

tellraw @a [{"text":"[RA_Lib] ","color":"gold"},{"text":"v3.1.0 loaded","color":"green"}]
