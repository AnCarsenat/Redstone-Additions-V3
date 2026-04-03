# /ra_gates:goggles/draw_display_clock
# Context: as clock armor stand, at block position

data modify storage ra:temp billboard set value {name:"Clock"}
function ra:tools/goggles/billboard/handle_billboard with storage ra:temp billboard
