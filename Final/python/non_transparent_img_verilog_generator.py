from PIL import Image
import numpy as np

def output_verilog(bits_per_pixel, input_name, input_img, colors_output_path, encode_output_path, compressed_img_output_path):
    num_colors = 2**bits_per_pixel

    # 確保 input_img 是 RGB 模式
    if input_img.mode != 'RGB':
        input_img = input_img.convert('RGB')
    
    # 取得圖片的寬度和高度
    width, height = input_img.size

    # 使用調色板模式壓縮顏色
    input_img = input_img.convert('P', palette=Image.ADAPTIVE, colors=num_colors)
    palette = input_img.getpalette()
    palette = np.array(palette).reshape(-1, 3)[:num_colors]

    # 建立顏色映射並排序
    color_map = {tuple(palette[i]): i + 1 for i in range(min(num_colors, len(palette)))}
    sorted_color_map = dict(sorted(color_map.items(), key=lambda item: item[1]))

    # 儲存壓縮完顏色的圖片
    # input_img.save(compressed_img_output_path)
    # print("Compression completed.")

    with open(colors_output_path, 'w') as verilog_file:
        verilog_file.write(f"module {input_name}_palette(output reg [23:0] color_map [0:{num_colors-1}]);\n")
        verilog_file.write("    initial begin\n")
        for i, (rgb, index) in enumerate(sorted_color_map.items(), start=1):
            r, g, b = rgb
            verilog_file.write(f"        color_map[{index-1}] = 24'h{r:02x}{g:02x}{b:02x}; // ({r},{g},{b})\n")
        # 檢查並補上缺少的顏色
        for i in range(len(sorted_color_map), num_colors):
            verilog_file.write(f"        color_map[{i}] = 24'h000000; // prevent quartus compile error\n")
        verilog_file.write("    end\n")
        verilog_file.write("endmodule\n")
    
    # Save each pixel's encoded number to a binary file
    with open(encode_output_path, 'wb') as bin_file:
        for y in range(height):
            for x in range(0, width, 2):
                pixel1 = input_img.getpixel((x, y))
                pixel2 = input_img.getpixel((x+1, y)) if x+1 < width else 0
                printData1 = sorted_color_map[tuple(palette[pixel1])]-1
                printData2 = sorted_color_map[tuple(palette[pixel2])]-1
                combined_data = (printData2 << 4) | printData1
                bin_file.write(combined_data.to_bytes(1, byteorder='big'))

bits_per_pixel = 4

# # track map
# input_name = 'map'
# input_file = '../img/map/track_3.png'

# # bar
# input_name = 'bar'
# input_file = '../img/bar/bar.png'

# # bar digit
# input_name = 'barDigit'
# input_file = '../img/bar/bar_digit.png'

# # idle background
# input_name = 'idleBackground'
# input_file = '../img/idle/idle_bg.png'

# # start caption
# input_name = 'start'
# input_file = '../img/idle/start.png'

# # win caption
# input_name = 'win'
# input_file = '../img/idle/win.png'

# # lose caption
# input_name = 'lose'
# input_file = '../img/idle/lose.png'

# Q block
input_name = 'qblock'
input_file = '../img/qblock/qblock.png'

colors_output = '../src/frameDecoder/palette/'+input_name+'Palette.sv'
encode_output = '../sim/sram/'+input_name+'LUT.bin'
input_img = Image.open(input_file)
compressed_img_output = input_file.replace('.png', '_compressed.png')
output_verilog(bits_per_pixel, input_name, input_img, colors_output, encode_output, compressed_img_output)