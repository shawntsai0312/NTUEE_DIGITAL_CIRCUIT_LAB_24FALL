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
                index = int(match.group(1))  # Convert index to integer
                hex_color = match.group(2)
                rgb = tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
                color_lut[index] = rgb
    return color_lut

def decode_image(width, height, bin_filepath, sv_filepath, output_image_path):
    image = Image.new('RGBA', (width, height))
    pixels = image.load()

    COLOR_LUT = load_color_lut(sv_filepath)
    print(COLOR_LUT)

    # Open the binary file for reading
    with open(bin_filepath, 'rb') as file:
        idx = 0
        while True:
            byte = file.read(1)
            if not byte:
                break
    
            combined_data = int.from_bytes(byte, byteorder='big')  # Convert byte to integer
            palette_index2 = (combined_data >> 4) & 0x0F  # Extract high 4 bits
            palette_index1 = combined_data & 0x0F  # Extract low 4 bits
    
            x1 = idx % width
            y1 = idx // width
            rgb1 = COLOR_LUT.get(palette_index1, (0, 0, 0))
            pixels[x1, y1] = (*rgb1, 255)  # Opaque
    
            idx += 1
            x2 = idx % width
            y2 = idx // width
            if x2 < width:  # Ensure we don't go out of bounds
                rgb2 = COLOR_LUT.get(palette_index2, (0, 0, 0))
                pixels[x2, y2] = (*rgb2, 255)  # Opaque
    
            idx += 1

    image.save(output_image_path)
    print(f"Image saved to {output_image_path}")

if __name__ == "__main__":
    bin_path = "../sim/sram/mapLUT.bin"
    sv_path = "../src/frameDecoder/palette/mapPalette.sv"
    width, height = 1600, 800

    output_path = "../doc/map_decode_output.png"
    decode_image(width, height, bin_path, sv_path, output_path)
