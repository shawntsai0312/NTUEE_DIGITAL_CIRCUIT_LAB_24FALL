#!/bin/tcsh

set start_time = `date +%s`
vcs tbRemote.sv \
    ../../../src/pkg/gamePkg.sv \
    ../../../src/pkg/sramPkg.sv \
    ../../sram/sram.sv \
    ../../../src/main.sv \
    ../../../src/vga.sv \
    ../../../src/gameControl/gameControl.sv \
    ../../../src/frameEncoder/frameEncoder.sv \
    ../../../src/frameEncoder/sramEncoder.sv \
    ../../../src/frameEncoder/lut/car1LUT.sv \
    ../../../src/frameEncoder/lut/car2LUT.sv \
    ../../../src/rotate/atanLUT.sv \
    ../../../src/rotate/imageRotator.sv \
    ../../../src/rotate/rotateImageCoor.sv \
    ../../../src/rotate/rotateXY.sv \
    ../../../src/frameDecoder/frameDecoder.sv \
    ../../../src/frameDecoder/colorDecoder.sv \
    ../../../src/frameDecoder/pixelDecoder.sv \
    ../../../src/frameDecoder/sramAddrEncoder.sv \
    ../../../src/frameDecoder/sramDataDecoder.sv \
    ../../../src/frameDecoder/palette/car1Palette.sv \
    ../../../src/frameDecoder/palette/car2Palette.sv \
    ../../../src/frameDecoder/palette/mapPalette.sv \
    ../../../src/frameDecoder/palette/carCirclePalette.sv \
    -full64 -R -debug_access+all -sverilog -Xrerolloff +access+rw |& tee compile_log.txt
set end_time = `date +%s`
@ total_time = $end_time - $start_time
echo "\e[32mTotal time: $total_time seconds\e[0m"