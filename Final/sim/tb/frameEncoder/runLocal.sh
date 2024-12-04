vcdFile="tb_frameEncoder.vcd"
outFile="frameEncoder.out"

rm -f $vcdFile $outFile
iverilog -g2005-sv -o $outFile tbLocal.sv \
    ../../../src/pkg/objectPkg.sv \
    ../../../src/pkg/sramPkg.sv \
    ../../../src/frameEncoder/frameEncoder.sv \
    ../../../src/frameEncoder/sramEncoder.sv \
    ../../../src/frameEncoder/lut/car1LUT.sv \
    ../../../src/frameEncoder/lut/car2LUT.sv \
    ../../../src/frameEncoder/rotate/atanLUT.sv \
    ../../../src/frameEncoder/rotate/imageRotator.sv \
    ../../../src/frameEncoder/rotate/rotateImageCoor.sv \
    ../../../src/frameEncoder/rotate/rotateXY_pipelined.sv
vvp -n $outFile
# gtkwave $vcdFile