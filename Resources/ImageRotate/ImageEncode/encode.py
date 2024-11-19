from PIL import Image
import json

def resize_image(input_path, output_path, colors_output_path, encode_output_path):
    with Image.open(input_path) as img:
        resized_img = img.resize((40, 40))
        # Convert to 8 color image
        converted_img = resized_img.convert('P', palette=Image.ADAPTIVE, colors=8)
        converted_img.save(output_path)
        
        # Get the palette and save the colors to a Verilog file
        palette = converted_img.getpalette()
        with open(colors_output_path, 'w') as verilog_file:
            verilog_file.write("module color_palette(output reg [23:0] color_map [0:7]);\n")
            verilog_file.write("    initial begin\n")
            for i in range(8):
                r, g, b = palette[i*3:i*3+3]
                verilog_file.write(f"        color_map[{i}] = 24'h{r:02x}{g:02x}{b:02x};\n")
            verilog_file.write("    end\n")
            verilog_file.write("endmodule\n")
        
        # Save each pixel's encoded number to a Verilog file
        pixels = converted_img.getdata()
        width, height = converted_img.size
        with open(encode_output_path, 'w') as encode_file:
            encode_file.write("module image_data(output reg [2:0] pixel_data [0:1599]);\n")
            encode_file.write("    initial begin\n")
            for y in range(height):
                for x in range(width):
                    pixel = pixels[y * width + x]
                    encode_file.write(f"        pixel_data[{y * width + x}] = 3'b{pixel:03b}; // x={x}, y={y}\n")
            encode_file.write("    end\n")
            encode_file.write("endmodule\n")

def calculate_sram_space(width, height, bits_per_pixel):
    total_pixels = width * height
    total_bits = total_pixels * bits_per_pixel
    total_bytes = total_bits / 8
    return total_bytes

# Example usage:
input = 'car.png'
output = 'car_resized.png'
colors_output = '../verilog/color_palette.sv'
encode_output = '../verilog/car_lut.sv'
resize_image(input, output, colors_output, encode_output)

# Calculate SRAM space
width, height = 40, 40
bits_per_pixel = 3
sram_space = calculate_sram_space(width, height, bits_per_pixel)
print(f"SRAM space needed: {sram_space} bytes")
