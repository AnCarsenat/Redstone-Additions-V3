# /ra_gates:tick
# Tick all logic gates

# Check redstone signals for all gates first
function ra_gates:check_signals

# Process each gate type
function ra_gates:blocks/and_gate/tick
function ra_gates:blocks/or_gate/tick
function ra_gates:blocks/not_gate/tick
function ra_gates:blocks/xor_gate/tick
function ra_gates:blocks/nand_gate/tick
function ra_gates:blocks/nor_gate/tick
function ra_gates:blocks/xnor_gate/tick
function ra_gates:blocks/clock/tick
