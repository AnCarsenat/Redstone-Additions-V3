execute store result score #elemend_bbf_global elemend_bbf_timing run time query gametime
execute as @e[type=marker,tag=elemend_bbf_valid,tag=elemend_bbf_next] if score @s elemend_bbf_timing = #elemend_bbf_global elemend_bbf_timing at @s run function elemend_bbf:input/recipe

function elemend_bbf:particles