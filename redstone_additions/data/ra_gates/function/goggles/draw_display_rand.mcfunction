# /ra_gates:goggles/draw_display_rand
# Context: as rand armor stand, at block position
data modify storage ra:temp billboard set value {name:"Randomizer"}
function ra:tools/goggles/billboard/handle_billboard with storage ra:temp billboard
