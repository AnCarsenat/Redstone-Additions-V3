# /ra_gates:tick
# Tick all logic gates

# Check redstone signals for all gates first
function ra_gates:check_signals

# Process UNI gate (universal logic gate - replaces individual gates)
function ra_gates:blocks/uni_gate/tick

# Process timing/utility blocks
function ra_gates:blocks/clock/tick
function ra_gates:blocks/delayer/tick
function ra_gates:blocks/extender/tick
function ra_gates:blocks/beamer/tick
function ra_gates:blocks/rand/tick
function ra_gates:blocks/shortener/tick
