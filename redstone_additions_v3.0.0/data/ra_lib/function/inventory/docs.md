
**Remove specific amount and get count:**
```mcfucntion
data modify storage ra:inventory clear set value {id:"minecraft:diamond", count:32}
execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear
# #removed now contains how many items were actually removed
```

Remove ALL matching items:
```mcfunction
data modify storage ra:inventory clear set value {id:"minecraft:cobblestone"}
execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear
```

Just check how many exist (remove 0):
```mcfunction
data modify storage ra:inventory clear set value {id:"minecraft:cobblestone"}
execute store result score #removed ra.temp positioned <x> <y> <z> run function ra_lib:inventory/clear
```
