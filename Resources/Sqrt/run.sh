iverilog -g2005-sv -o sim.out tb.sv sqrt.sv
vvp -n sim.out
# gtkwave tb_rotate.vcd