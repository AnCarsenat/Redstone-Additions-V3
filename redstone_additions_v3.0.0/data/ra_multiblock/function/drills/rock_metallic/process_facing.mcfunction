# /ra_multiblock:drill/process_facing
# Called: function ... with storage ra:multiblock drill_dir.{direction}
# Context: as multiblock marker, at base position
# Emits particles and adds ROCK item to output barrel

# === Drill effect: emit particles ===
particle block minecraft:stone ~ ~1 ~ 0.5 0.2 0.5 0.1 20 force
playsound minecraft:block.stone.break block @a[distance=..8] ~ ~ ~ 0.7 1

# === Output: add ROCK item to output barrel ===
data modify storage ra:temp bf.result set value {id:"minecraft:command_block",Count:1b,components:{minecraft:item_name:{value:'{"text":"Rock"}'},minecraft:item_model:{value:'dead_brain_coral_block'},minecraft:rarity:{value:'common'}}}
execute positioned $(input) run function ra_lib:inventory/insert with storage ra:temp bf.result

return 1
