#!/bin/tcsh

set start_time = `date +%s`
vcs ../../../src/pkg/sramPkg.sv \
    ../../../src/pkg/gamePkg.sv \
    ../../../src/pkg/trackPkg.sv \
    tbRemote.sv \
    ../../../src/gameControl/gameControl.sv \
    ../../../src/gameControl/carCollision.sv \
    ../../../src/gameControl/trackCollision.sv \
    ../../../src/gameControl/basicTrackCollision.sv \
    ../../../src/gameControl/qBlock.sv \
    ../../../src/math/random.sv \
    ../../../src/math/sqrt.sv \
    ../../../src/math/rotateXY.sv \
    ../../../src/math/atanLUT.sv \
    -full64 -R -debug_access+all -sverilog -Xrerolloff +access+rw |& tee compile_log.txt
set end_time = `date +%s`
@ total_time = $end_time - $start_time
echo "\e[32mTotal time: $total_time seconds\e[0m"