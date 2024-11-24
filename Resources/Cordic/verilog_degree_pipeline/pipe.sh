iverilog -g2005-sv -o pipe.out tb_pipe.sv rotateXY_pipelined.sv atan_lut.sv
vvp -n pipe.out
# gtkwave tb_rotate.vcd