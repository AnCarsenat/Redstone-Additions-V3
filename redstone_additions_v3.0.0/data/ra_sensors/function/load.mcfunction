# /ra_sensors:load
# RA Sensors - Entity detection and tag manipulation blocks

# Register sensor blocks
function ra_sensors:blocks/player_detector/register_block
function ra_sensors:blocks/entity_detector/register_block
function ra_sensors:blocks/tag_adder/register_block
function ra_sensors:blocks/tag_remover/register_block
function ra_sensors:blocks/tag_checker/register_block

tellraw @a [{"text":"[","color":"dark_gray"},{"text":"RA","color":"gold","bold":true},{"text":"] ","color":"dark_gray"},{"text":"Sensor blocks loaded!","color":"light_purple"}]
