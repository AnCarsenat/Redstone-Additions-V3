# /data/ra/function/uninstall/confirm.mcfunction
# Full cleanup — removes ALL Redstone Additions data from the world
# Called via clickable [CONFIRM] button from ra:uninstall

# === Kill all custom block entities ===
kill @e[tag=ra.custom_block]

# === Kill all multiblock markers ===
kill @e[tag=ra.multiblock]

# === Kill all goggle billboards and display entities ===
kill @e[tag=ra.billboard]
kill @e[tag=ra.display]

# === Remove ALL scoreboards ===
scoreboard objectives remove ra.edit_type
scoreboard objectives remove ra.edit_step
scoreboard objectives remove ra.cooldown
scoreboard objectives remove ra.temp
scoreboard objectives remove ra.facing
scoreboard objectives remove ra.yaw
scoreboard objectives remove ra.pitch
scoreboard objectives remove ra.power
scoreboard objectives remove ra.power.up
scoreboard objectives remove ra.power.down
scoreboard objectives remove ra.power.north
scoreboard objectives remove ra.power.south
scoreboard objectives remove ra.power.east
scoreboard objectives remove ra.power.west
scoreboard objectives remove ra.inv.slot
scoreboard objectives remove ra.inv.count
scoreboard objectives remove ra.act_red
scoreboard objectives remove ra.inac_red
scoreboard objectives remove ra.dir
scoreboard objectives remove ra.channel
scoreboard objectives remove ra.pulse_timer
scoreboard objectives remove ra.multiblock
scoreboard objectives remove ra.mb_timer
scoreboard objectives remove ra.mb_enabled
scoreboard objectives remove ra.craft_id
scoreboard objectives remove ra.heat

# === Clear data storage ===
data remove storage ra:multiblock {}
data remove storage ra:temp {}
data remove storage ra:block {}
data remove storage ra:cdh {}

# === Cancel scheduled ticks ===
schedule clear ra:tick

# === Remove player-held tags ===
tag @a remove ra.wrench_active
tag @a remove ra.cdh_active
tag @a remove ra.goggles_active
tag @a remove ra.wrench_clicked
tag @a remove ra.cdh_clicked
tag @a remove ra.remote_active
tag @a remove ra.remote_clicked
tag @a remove ra.debug

# === Final message ===
tellraw @a [{text:"\n"},{text:"[",color:"dark_gray"},{text:"RA",color:"gold",bold:true},{text:"] ",color:"dark_gray"},{text:"Redstone Additions has been uninstalled.",color:"red"}]
tellraw @a [{text:"  "},{text:"You may now disable the datapack with: ",color:"gray"},{text:"/datapack disable \"file/redstone_additions_v3.0.0\"",color:"yellow",clickEvent:{action:"suggest_command",value:"/datapack disable \"file/redstone_additions_v3.0.0\""},hoverEvent:{action:"show_text",contents:{text:"Click to run",color:"gray"}}}]
