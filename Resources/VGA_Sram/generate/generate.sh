#!/bin/zsh
rm sim.out output.bin tb_vga.vcd
rm -r output/
start_time=$(date +%s)

# Compile
compile_start=$(date +%s)
iverilog -g2005-sv -o sim.out tb_video.sv ../verilog/vga.sv
compile_end=$(date +%s)
compile_time=$((compile_end - compile_start))
echo -e "\e[32mCompiling done in $compile_time seconds\e[0m"

# Simulate
simulate_start=$(date +%s)
vvp -n sim.out
simulate_end=$(date +%s)
simulate_time=$((simulate_end - simulate_start))
echo -e "\e[32mSimulation done in $simulate_time seconds\e[0m"


# Generate video
video_start=$(date +%s)
python3 generate_video.py
video_end=$(date +%s)
video_time=$((video_end - video_start))
echo -e "\e[32mVideo generation done in $video_time seconds\e[0m"

end_time=$(date +%s)
total_time=$((end_time - start_time))

echo -e "\e[32mTotal time: $total_time seconds\e[0m"
echo -e "\e[32mCompiling done in $compile_time seconds\e[0m"
echo -e "\e[32mSimulation done in $simulate_time seconds\e[0m"
echo -e "\e[32mVideo generation done in $video_time seconds\e[0m"
