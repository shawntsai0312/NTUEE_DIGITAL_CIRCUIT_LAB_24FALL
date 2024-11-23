# iverilog -g2005-sv -o sim.out tb_mac.sv rotate.sv atan_lut.sv 2>&1 | tee compile_log.txt
# vvp -n sim.out 2>&1 | tee run_log.txt
iverilog -g2005-sv -o sim.out tb_mac.sv rotate.sv atan_lut.sv
vvp -n sim.out
# gtkwave tb_rotate.vcd