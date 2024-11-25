rm rotate_image_coor.out tb_rotate_image_coor.vcd
iverilog -g2005-sv -o rotate_image_coor.out tb_rotate_image_coor.sv ../verilog/rotateImageCoor.sv ../verilog/rotateXY_pipelined.sv ../verilog/atan_lut.sv
vvp -n rotate_image_coor.out
# gtkwave tb_rotate_image_coor.vcd