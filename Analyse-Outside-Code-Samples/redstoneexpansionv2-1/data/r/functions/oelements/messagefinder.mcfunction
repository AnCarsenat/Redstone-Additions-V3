
execute at @s[scores={send_distance=5}] run tag @a[distance=..5] add message_select_pre
execute at @s[scores={send_distance=8}] run tag @a[distance=..8] add message_select_pre
execute at @s[scores={send_distance=10}] run tag @a[distance=..10] add message_select_pre
execute at @s[scores={send_distance=15}] run tag @a[distance=..15] add message_select_pre
execute at @s[scores={send_distance=20}] run tag @a[distance=..20] add message_select_pre
execute at @s[scores={send_distance=30}] run tag @a[distance=..40] add message_select_pre
execute at @s[scores={send_distance=50}] run tag @a[distance=..50] add message_select_pre
execute at @s[scores={send_distance=100}] run tag @a[distance=..100] add message_select_pre
execute at @s[scores={send_distance=1000}] run tag @a[distance=..1000] add message_select_pre

execute at @s[tag=message_closest] run tag @a[limit=1,sort=nearest,tag=message_select_pre] add message_select
execute at @s[tag=!message_closest] run tag @a[tag=message_select_pre] add message_select

execute at @s run tellraw @a[tag=message_select] {"selector":"@e[tag=MESSAGECOW,limit=1,sort=nearest,distance=..1]"}

tag @a[tag=message_select] remove message_select
tag @a[tag=message_select_pre] remove message_select_pre