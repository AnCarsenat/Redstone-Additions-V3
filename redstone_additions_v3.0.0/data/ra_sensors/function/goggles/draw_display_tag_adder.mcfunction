# /ra_sensors:goggles/draw_display_tag_adder
# Context: as tag_adder armor stand, at block position
data modify storage ra:temp billboard set value {name:"Tag Adder"}
function ra:tools/goggles/billboard/handle_billboard with storage ra:temp billboard
