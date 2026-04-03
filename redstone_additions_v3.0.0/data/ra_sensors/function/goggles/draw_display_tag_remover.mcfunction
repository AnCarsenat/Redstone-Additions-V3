# /ra_sensors:goggles/draw_display_tag_remover
# Context: as tag_remover armor stand, at block position
data modify storage ra:temp billboard set value {name:"Tag Remover"}
function ra:tools/goggles/billboard/handle_billboard with storage ra:temp billboard
