tellraw @a [{"text":"\"","bold":true,"color":"dark_red"},{"text":"RedstoneAdditions","bold":true,"color":"red"},{"text":"\"","bold":true,"color":"dark_red"}," ",{"text":"[","color":"dark_red"},{"text":"LOADED","color":"red"},{"text":"]","color":"dark_red"},"\n",{"text":"by ","color":"dark_red"},{"text":"Ancar ","color":"red"},"\n",{"text":"[","color":"dark_red"},{"text":"GetItems","color":"red","click_event":{"action":"suggest_command","command":"/function redstone_additions:items/give_all"},"hover_event":{"action":"show_text","value":"Click to give yourself the items"}},{"text":"]","color":"dark_red"}]

function placeblocks:load

scoreboard objectives add redstone_additions.delay dummy
scoreboard objectives add redstone_additions.command_feedback dummy
scoreboard objectives add redstone_additions.temp dummy

data modify storage redstone_additions:settings.blocks BlockBreaker set value 1
data modify storage redstone_additions:settings.blocks BlockPlacer set value 1
data modify storage redstone_additions:settings.blocks LavaGenerator set value 1
data modify storage redstone_additions:settings.blocks MineralGenerator set value 1
data modify storage redstone_additions:settings.blocks Conveyor set value 1
data modify storage redstone_additions:settings.blocks Breeder set value 1

function redstone_additions:blocks/initialize
function redstone_additions:crafting/craft_tick

