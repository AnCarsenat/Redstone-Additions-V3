# /data/ra_interactive/function/load.mcfunction`
# RA Interactive - Default custom blocks

# Register custom blocks
function ra_interactive:blocks/block_breaker/register_block
function ra_interactive:blocks/breeder/register_block
function ra_interactive:blocks/block_placer/register_block
function ra_interactive:blocks/pusher/register_block
function ra_interactive:blocks/conveyor/register_block

# Tellraw to all players to indicate that interactive blocks have been loaded
tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Interactive blocks loaded!","color":"aqua"}]
