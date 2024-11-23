from PIL import Image
from sklearn.cluster import KMeans
import numpy as np

def output_verilog(bits_per_pixel, input_img, colors_output_path, encode_output_path, compressed_img_output_path):
    num_colors = 2**bits_per_pixel - 1

    # 確保 input_img 是 RGBA 模式
    if input_img.mode != 'RGBA':
        input_img = input_img.convert('RGBA')
    
    # 取得圖片的寬度和高度
    width, height = input_img.size

    # 取得圖片的像素資料
    pixels = input_img.load()

    # 設置 alpha 通道為 0 或 255
    for i in range(input_img.width):
        for j in range(input_img.height):
            r, g, b, a = pixels[i, j]
            alpha = 255 if a > 127 else 0
            pixels[i, j] = (r, g, b, alpha)
    
    # 收集所有不透明的像素
    opaque_pixels = [pixels[x, y][:3] for x in range(width) for y in range(height) if pixels[x, y][3] != 0]
    
    # 使用 KMeans 壓縮顏色
    kmeans = KMeans(n_clusters=num_colors)
    kmeans.fit(opaque_pixels)
    compressed_colors = kmeans.cluster_centers_.astype(int)
    
# 建立顏色映射
    color_map = {tuple(color): idx + 1 for idx, color in enumerate(compressed_colors)}
    
    # 更新像素資料
    for x in range(width):
        for y in range(height):
            if pixels[x, y][3] != 0:
                closest_color_idx = kmeans.predict([pixels[x, y][:3]])[0]
                closest_color = tuple(compressed_colors[closest_color_idx])
                pixels[x, y] = (*closest_color, 255)
    
    print(color_map)

    # 儲存壓縮完顏色的圖片
    compressed_img = Image.new('RGBA', (width, height))
    compressed_pixels = compressed_img.load()
    for x in range(width):
        for y in range(height):
            compressed_pixels[x, y] = pixels[x, y]
    compressed_img.save(compressed_img_output_path)

    with open(colors_output_path, 'w') as verilog_file:
        verilog_file.write(f"module color_palette(output reg [23:0] color_map [0:{num_colors}]);\n")
        verilog_file.write("    initial begin\n")
        verilog_file.write(f"        // use pure black(0,0,0) as the transparent color\n")
        verilog_file.write(f"        color_map[0] = 24'h000000; // Transparent color\n")
        for i, (rgb, index) in enumerate(color_map.items(), start=1):
            r, g, b = rgb
            verilog_file.write(f"        color_map[{index}] = 24'h{r:02x}{g:02x}{b:02x};\n")
        verilog_file.write("    end\n")
        verilog_file.write("endmodule\n")
    
    # Save each pixel's encoded number to a Verilog file
    with open(encode_output_path, 'w') as encode_file:
        encode_file.write(f"module image_data(output reg [{bits_per_pixel-1}:0] pixel_data [0:{height-1}][0:{width-1}]);\n")
        encode_file.write("    initial begin\n")
        for y in range(height):
            for x in range(width):
                pixel = pixels[x, y]
                if pixel[3] == 0:  # Check if the pixel is transparent
                    encode_file.write(f"        pixel_data[{y}][{x}] = {bits_per_pixel}'b{'0' * bits_per_pixel}; // x={x}, y={y}\n")
                else:
                    encode_file.write(f"        pixel_data[{y}][{x}] = {bits_per_pixel}'b{color_map[pixel[:3]]:0{bits_per_pixel}b}; // x={x}, y={y}\n")
        encode_file.write("    end\n")
        encode_file.write("endmodule\n")

bits_per_pixel = 4
input_file = '去背的car_resized.png'
input_img = Image.open(input_file)
colors_output = '../verilog/color_palette.sv'
encode_output = '../verilog/car_lut.sv'
compressed_img_output = input_file.replace('.png', '_compressed.png')
output_verilog(bits_per_pixel, input_img, colors_output, encode_output, compressed_img_output)