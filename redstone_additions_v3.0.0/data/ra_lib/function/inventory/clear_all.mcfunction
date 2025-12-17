# /data/ra_lib/function/inventory/clear_all.mcfunction
# Clear all items from a container
# Context: at the block position
#
# Example usage:
#   execute at <pos> run function ra_lib:inventory/clear_all

data modify block ~ ~ ~ Items set value []
