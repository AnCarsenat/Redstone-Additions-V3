# set the executing context to the position of the marker and check if it's running and if it's a valid structure:
execute as @e[type=marker,tag=elemend_bbf_marker] at @s run function elemend_bbf:lit_or_not

#creating a blast furnace output
advancement revoke @a[scores={elemend_bbf_create=1..}] only elemend_bbf:create

# reschedule this function to run every 2 seconds.
schedule function elemend_bbf:clock_2_sec 2s