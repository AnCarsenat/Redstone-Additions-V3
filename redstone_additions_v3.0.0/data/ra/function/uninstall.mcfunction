# /data/ra/function/uninstall.mcfunction
# Uninstall Redstone Additions — Confirmation Prompt
# Shows a clickable confirmation dialog before performing the actual uninstall

tellraw @a [{text:"\n"},{text:"[",color:"dark_gray"},{text:"RA",color:"gold",bold:true},{text:"] ",color:"dark_gray"},{text:"Are you sure you want to uninstall Redstone Additions?",color:"red",bold:true}]
tellraw @a [{text:"  "},{text:"[CONFIRM]",color:"dark_red",bold:true,clickEvent:{action:"run_command",value:"/function ra:uninstall/confirm"},hoverEvent:{action:"show_text",contents:{text:"Click to uninstall — this cannot be undone!",color:"red"}}},{text:"  "},{text:"[CANCEL]",color:"green",bold:true,clickEvent:{action:"run_command",value:"/function ra:uninstall/cancel"},hoverEvent:{action:"show_text",contents:{text:"Cancel uninstallation",color:"green"}}}]