# /data/ra/function/tick.mcfunction
# Main tick loop

# Placement system - detect bats for custom block placement
function ra:placement/detect_bats

# Call all registered custom block tickers (includes break detection)
function #ra:tick_custom_blocks

# Run interactive blocks tick
function ra_interactive:tick

# Run sensor blocks tick
function ra_sensors:tick

# Run data handler tick
function ra:tools/creative_data_handler/tick

# Reset carrot on a stick click counter (after all handlers have checked)
scoreboard players set @a[scores={ra.coas_click=1..}] ra.coas_click 0

schedule function ra:tick 1t