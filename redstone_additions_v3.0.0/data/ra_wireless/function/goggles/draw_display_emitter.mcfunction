# /ra_wireless:goggles/draw_display_emitter
# Context: as emitter armor stand, at block position

data modify storage ra:temp billboard set value {name:"Wireless Emitter"}
function ra:tools/goggles/billboard/handle_billboard with storage ra:temp billboard
