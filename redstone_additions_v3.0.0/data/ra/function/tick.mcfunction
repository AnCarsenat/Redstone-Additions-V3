# /data/ra/function/tick.mcfunction
# Main tick loop

# Placement system - detect bats for custom block placement
function ra:placement/detect_bats

# Call all registered custom block tickers (includes break detection)
function #ra:tick_custom_blocks

# Run interactive blocks tick
function ra_interactive:tick

schedule function ra:tick 1t