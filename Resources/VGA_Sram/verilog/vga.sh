rm vga.out tb_vga.vcd
iverilog -g2005-sv -o vga.out tb_vga.sv vga.sv
vvp -n vga.out
gtkwave tb_vga.vcd