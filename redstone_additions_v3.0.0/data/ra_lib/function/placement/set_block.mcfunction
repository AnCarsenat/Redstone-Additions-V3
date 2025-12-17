# /ra_lib:placement/set_block
# Place block with facing from storage. At position. Uses storage ra:temp {block_id, facing_name}.

$setblock ~ ~ ~ $(block_id)[facing=$(facing_name)] replace
