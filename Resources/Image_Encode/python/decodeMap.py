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
        # Calculate how many pixels there are
        num_pixels = width * height

        for idx in range(num_pixels):
            # Read one byte (8 bits per color index)
            byte = file.read(1)
            if not byte:
                break

            palette_index = int.from_bytes(byte, byteorder='big')  # Convert byte to integer
            x = idx % width
            y = idx // width

            if palette_index == 0:
                pixels[x, y] = (0, 0, 0, 0)  # Transparent
            else:
                rgb = COLOR_LUT.get(palette_index, (0, 0, 0))
                if x == 3 and y == 30:
                    print(palette_index)
                    print(rgb)
                pixels[x, y] = (*rgb, 255)  # Opaque

    image.save(output_image_path)
    print(f"Image saved to {output_image_path}")

if __name__ == "__main__":
    bin_path = "../verilog/mapLUT.bin"
    sv_path = "../verilog/mapPalette.sv"
    width, height = 1600, 800

    output_path = "map_decode_output.png"
    decode_image(width, height, bin_path, sv_path, output_path)
