vcs tbRemote.sv \
    ../../../src/pkg/objectPkg.sv \
    ../../../src/pkg/sramPkg.sv \
    ../../../src/frameEncoder/frameEncoder.sv \
    ../../../src/frameEncoder/sramEncoder.sv \
    ../../../src/frameEncoder/lut/car1LUT.sv \
    ../../../src/frameEncoder/lut/car2LUT.sv \
    ../../../src/frameEncoder/rotate/atanLUT.sv \
    ../../../src/frameEncoder/rotate/imageRotator.sv \
    ../../../src/frameEncoder/rotate/rotateImageCoor.sv \
    ../../../src/frameEncoder/rotate/rotateXY_pipelined.sv \
    -full64 -R -debug_access+all -sverilog -Xrerolloff +access+rw | tee compile_log.txt