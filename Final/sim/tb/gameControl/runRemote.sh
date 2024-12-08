#!/bin/tcsh

set start_time = `date +%s`
vcs tbRemote.sv \
    ../../../src/pkg/gamePkg.sv \
    ../../../src/pkg/sramPkg.sv \
    ../../../src/gameControl/gameControl.sv \
    ../../../src/rotate/rotateXY.sv \
    ../../../src/rotate/atanLUT.sv \
    -full64 -R -debug_access+all -sverilog -Xrerolloff +access+rw |& tee compile_log.txt
set end_time = `date +%s`
@ total_time = $end_time - $start_time
echo "\e[32mTotal time: $total_time seconds\e[0m"