# /data/ra/function/tick.mcfunction`
# Main tick loop

# Placement system - detect bats
function ra_lib:placement/detect_bats

# Removal system - detect broken blocks
function ra_lib:removal/detect_break

# Call all registered custom block tickers
function #ra:tick_blocks