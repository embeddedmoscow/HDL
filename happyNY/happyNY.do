transcript on
vlib work

vlog -sv +incdir+./ ./happyNY.sv
vlog -sv +incdir+./ ./tb.sv

vsim -t 1ns -voptargs="+acc" tb

add wave /tb/clk
add wave /tb/rst
add wave -radix ASCII /tb/symbol
radix noshowbase
configure wave -timelineunits us
run -all
wave zoom full
