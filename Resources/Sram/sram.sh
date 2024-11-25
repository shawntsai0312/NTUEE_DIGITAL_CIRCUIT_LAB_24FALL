iverilog -g2005-sv -o sram.out tb_sram.sv sram.sv
vvp -n sram.out
# gtkwave tb_sram.vcd