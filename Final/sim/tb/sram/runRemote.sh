vcs tbRemote.sv \
    ../../sram/sram.sv \
    -full64 -R -debug_access+all -sverilog -Xrerolloff +access+rw | tee compile_log.txt