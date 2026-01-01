# /data/ra/function/tick.mcfunction
# Main tick loop

# Placement system - detect bats for custom block placement
function ra:placement/detect_bats

# Run interactive blocks tick
function ra_interactive:tick

# Run sensor blocks tick
function ra_sensors:tick

# Run logic gates tick
function ra_gates:tick

# Reset carrot on a stick click counter (after all handlers have checked)
scoreboard players set @a[scores={ra.coas_click=1..}] ra.coas_click 0

schedule function ra:tick 1t