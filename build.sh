bsc -verilog -g bpulse bpulse.bsv
yosys -p 'synth_ice40 -top bpulse -json bpulse.json' bpulse.v
nextpnr-ice40 --hx1k --package cm36 --json bpulse.json --pcf bpulse.pcf --asc bpulse.asc --pcf-allow-unconstrained
icepack bpulse.asc bpulse.bin
