iverilog -g2005-sv -o sim.out tb_mac.sv VGA.sv 2>&1 | tee compile_log.txt
vvp -n sim.out 2>&1 | tee run_log.txt
# gtkwave tb_vga.vcd