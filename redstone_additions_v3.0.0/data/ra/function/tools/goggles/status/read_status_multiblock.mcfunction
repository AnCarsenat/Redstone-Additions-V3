# /ra:tools/goggles/status/read_status_multiblock
# Display multiblock-specific status info (heat, enabled, etc.)
# Context: as multiblock marker entity, at base position

# Heat is scoreboard-backed for blast forge and updates live
data modify storage ra:temp status_score_line set value {y:1.7,label:"Heat: ",objective:"ra.heat",suffix:"/1000",value_color:"gold",fallback:"N/A"}
function ra:tools/goggles/billboard/show_score_line with storage ra:temp status_score_line

# Enabled remains NBT-backed from multiblock properties
data modify storage ra:temp status_line set value {y:1.45,label:"Enabled: ",path:"data.properties.enabled",suffix:"",value_color:"aqua",fallback:"N/A"}
function ra:tools/goggles/billboard/show_nbt_line with storage ra:temp status_line
