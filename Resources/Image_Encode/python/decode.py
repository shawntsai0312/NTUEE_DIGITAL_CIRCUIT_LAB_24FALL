import os
from PIL import Image
import re

def load_color_lut(sv_filepath):
    color_lut = {}
    pattern = re.compile(r"color_map\[(\d+)\]\s*=\s*24'h([0-9a-fA-F]{6});")
    with open(sv_filepath, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                index = int(match.group(1))  # 將索引轉換為整數
                hex_color = match.group(2)
                rgb = tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
                color_lut[index] = rgb
    return color_lut

def decode_image(width, height, txt_filepath, sv_filepath, output_image_path):
    image = Image.new('RGBA', (width, height))
    pixels = image.load()

    COLOR_LUT = load_color_lut(sv_filepath)
    print(COLOR_LUT)

    with open(txt_filepath, 'r') as file:
        lines = file.readlines()

    for idx, line in enumerate(lines):
        x = idx % width
        y = idx // width
        value = line.strip().zfill(4)
        
        if value == '0000':
            pixels[x, y] = (0, 0, 0, 0)  # 透明
        else:
            decimal_value = int(value, 2)
            rgb = COLOR_LUT.get(decimal_value, (0, 0, 0))
            if(x==3 and y==30):
                print(decimal_value)
                print(rgb)
            pixels[x, y] = (*rgb, 255)  # 不透明

    image.save(output_image_path)
    # print(f"圖片已儲存至 {output_image_path}")

if __name__ == "__main__":
    txt_path = "result.txt"
    sv_path = "../verilog/carPalette.sv"
    width, height = 60, 60

    # txt_path = "map_result.txt"
    # sv_path = "../verilog/mapPalette.sv"
    # width, height = 1600, 800

    output_path = "output.png"
    decode_image(width, height, txt_path, sv_path, output_path)
