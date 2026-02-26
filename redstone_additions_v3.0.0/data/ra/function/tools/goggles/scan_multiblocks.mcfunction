# /ra:tools/goggles/scan_multiblocks
# Find nearby multiblock markers and show I/O indicators
# Context: as player with goggles, at player position
# Each multiblock type owns its own draw_display function

# Delegate to multiblock module dispatcher
function ra_multiblock:goggles/draw_displays
