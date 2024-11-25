rm tb_rotate_image.vcd rotate_image.out rotate_result.txt
iverilog -g2005-sv -o rotate_image.out tb_rotate_image.sv ../verilog/carGenerator.sv ../verilog/rotateImageCoor.sv ../verilog/rotateXY_pipelined.sv ../verilog/car_lut.sv ../verilog/atan_lut.sv 
vvp -n rotate_image.out
python3 decode.py
# gtkwave tb_rotate_image.vcd