transcript file ""
if {[file exists sim]} {
	cd sim

	if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
	}
	cd ..
	rm -r sim
}

mkdir sim
cd sim

vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+../ {../happyNY.sv}
vlog -sv -work work +incdir+../ {../tb.sv}

vsim -t 1ns -L rtl_work -L work -voptargs="+acc" tb

add wave /tb/clk
add wave /tb/rst
add wave -radix ASCII /tb/symbol
radix noshowbase
configure wave -timelineunits us
run -all
wave zoom full
