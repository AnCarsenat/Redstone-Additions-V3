data remove entity @s data{}
data modify entity @s data set from block ^ ^ ^-1 {}

function elemend_bbf:input/whatitem
execute unless score @s elemend_bbf_item matches 1.. run function elemend_bbf:expire
execute if score @s elemend_bbf_item matches 1.. run function elemend_bbf:input/schedule