
execute if entity @e[tag=GATESSET] run function r:gates/gates
execute if entity @e[tag=SHORTSET] run function r:oelements/short/shortset
execute if entity @e[tag=AND] run function r:gates/and
execute if entity @e[tag=OR] run function r:gates/or
execute if entity @e[tag=NOT] run function r:gates/not
execute if entity @e[tag=NAND] run function r:gates/nand
execute if entity @e[tag=NOR] run function r:gates/nor
execute if entity @e[tag=XOR] run function r:gates/xor
execute if entity @e[tag=XNOR] run function r:gates/xnor
execute if entity @e[tag=impgen] run function r:oelements/impgen
execute if entity @e[tag=FLIPFLOP] run function r:oelements/flipflop
execute if entity @e[tag=EXTENDER] run function r:oelements/extender
execute if entity @e[tag=SHORTENER] run function r:oelements/shortener
execute if entity @e[tag=DELAYER] run function r:oelements/delayer
execute if entity @e[tag=RAND] run function r:oelements/rand
execute if entity @e[tag=DETECTOR] run function r:oelements/detector
execute if entity @e[tag=SENDER] run function r:oelements/sender
execute if entity @e[tag=withcoordin] run function r:oelements/sender2
execute if entity @e[tag=BEAMER] run function r:oelements/beamer
execute if entity @e[tag=LEVER] run function r:oelements/lever
execute if entity @e[tag=LEVREC] run function r:oelements/levrec
execute if entity @e[tag=HOPPER] run function r:oelements/hopper
execute if entity @e[tag=FURNANCE] run function r:oelements/furnance
execute if entity @e[tag=MESSAGE] run function r:oelements/message

execute if entity @e[tag=REXC] run function r:craft/craft


function r:other/setresult