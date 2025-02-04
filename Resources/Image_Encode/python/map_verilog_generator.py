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
    color_map = {tuple(palette[i]): i + 1 for i in range(num_colors)}
    sorted_color_map = dict(sorted(color_map.items(), key=lambda item: item[1]))

    # 儲存壓縮完顏色的圖片
    # input_img.save(compressed_img_output_path)
    # print("Compression completed.")

    with open(colors_output_path, 'w') as verilog_file:
        verilog_file.write(f"module {input_name}_palette(output reg [23:0] color_map [0:{num_colors}]);\n")
        verilog_file.write("    initial begin\n")
        for i, (rgb, index) in enumerate(sorted_color_map.items(), start=1):
            r, g, b = rgb
            verilog_file.write(f"        color_map[{index-1}] = 24'h{r:02x}{g:02x}{b:02x};\n")
        verilog_file.write("    end\n")
        verilog_file.write("endmodule\n")
    
    # Save each pixel's encoded number to a Verilog file
    # with open(encode_output_path, 'w') as encode_file:
    #     encode_file.write(f"module {input_name}_lut(output reg [{bits_per_pixel-1}:0] pixel_data [0:{height-1}][0:{width-1}]);\n")
    #     encode_file.write("    initial begin\n")
    #     for y in range(height):
    #         for x in range(width):
    #             pixel = input_img.getpixel((x, y))
    #             printData = sorted_color_map[tuple(palette[pixel])]-1
    #             encode_file.write(f"        pixel_data[{y}][{x}] = {printData}; // x={x}, y={y}, {tuple(palette[pixel])}\n")
    #             # print(f"{printData:0{bits_per_pixel}b}")
    #     encode_file.write("    end\n")
    #     encode_file.write("endmodule\n")
    
    # Save each pixel's encoded number to a binary file
    bin_output_path = encode_output_path.replace('.sv', '.bin')
    with open(bin_output_path, 'wb') as bin_file:
        for y in range(height):
            for x in range(width):
                pixel = input_img.getpixel((x, y))
                printData = sorted_color_map[tuple(palette[pixel])]
                bin_file.write(printData.to_bytes(1, byteorder='big'))

bits_per_pixel = 4
input_name = 'map'
input_file = 'track_10.png'
colors_output = '../verilog/'+input_name+'Palette.sv'
encode_output = '../verilog/'+input_name+'LUT.sv'
input_img = Image.open(input_file)
compressed_img_output = input_file.replace('.png', '_compressed.png')
output_verilog(bits_per_pixel, input_name, input_img, colors_output, encode_output, compressed_img_output)