iverilog -g2005-sv -o sim.out tb_sim.sv rotateImage.sv rotateXY.sv atan_lut.sv sram.sv
vvp -n sim.out
# gtkwave tb_rotate_image.vcd