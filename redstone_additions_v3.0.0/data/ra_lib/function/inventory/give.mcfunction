# /ra_lib:inventory/give {id:"...",count:N}
# Append item to container. At container position.
# Output: Returns 1 on success, 0 if full.

$execute store success score #success ra.temp run data modify block ~ ~ ~ Items append value {id:"$(id)",count:$(count)}
return run scoreboard players get #success ra.temp
