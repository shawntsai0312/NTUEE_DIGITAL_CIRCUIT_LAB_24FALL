# Load an example image and process it, then save the result
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

# Parameters
INPUT_WIDTH = 7
DATA_WIDTH = 16
ITERATIONS = 16
SCALE_FACTOR = 2**(DATA_WIDTH - INPUT_WIDTH)

# Pre-computed arctangent values in radians, scaled by 2^20
atan_table = [
    0xC90FD,  # atan(2^-0) * 2^20
    0x76B19,  # atan(2^-1) * 2^20
    0x3EB6E,  # atan(2^-2) * 2^20
    0x1FD5B,  # atan(2^-3) * 2^20
    0x0FFAA,  # atan(2^-4) * 2^20
    0x07FF5,  # atan(2^-5) * 2^20
    0x03FFE,  # atan(2^-6) * 2^20
    0x01FFF,  # atan(2^-7) * 2^20
    0x00FFF,  # atan(2^-8) * 2^20
    0x007FF,  # atan(2^-9) * 2^20
    0x003FF,  # atan(2^-10) * 2^20
    0x001FF,  # atan(2^-11) * 2^20
    0x000FF,  # atan(2^-12) * 2^20
    0x0007F,  # atan(2^-13) * 2^20
    0x0003F,  # atan(2^-14) * 2^20
    0x0001F   # atan(2^-15) * 2^20
]

# CORDIC gain approximation function
def cordic_gain(input_value):
    return (input_value >> 1) + (input_value >> 4) + (input_value >> 5) + \
           (input_value >> 7) + (input_value >> 8) + (input_value >> 10) + \
           (input_value >> 11) + (input_value >> 12) + (input_value >> 14)

# Function to sign-extend a 7-bit signed number to 16 bits
def sign_extend_and_scale(value, original_width=INPUT_WIDTH, target_width=DATA_WIDTH, scale_factor=SCALE_FACTOR):
    # Sign extend the 7-bit value to 16 bits
    sign_bit = 1 << (original_width - 1)
    if value & sign_bit:
        # If the number is negative, extend with 1s
        extended_value = value | (~((1 << original_width) - 1) & ((1 << target_width) - 1))
    else:
        # If the number is positive, extend with 0s
        extended_value = value & ((1 << target_width) - 1)
    
    # Scale the extended value by 2^9
    scaled_value = extended_value * scale_factor
    return scaled_value

# Function to scale back a 16-bit signed number to a 7-bit signed number with rounding
def scale_back_and_truncate(value, scale_factor=SCALE_FACTOR, original_width=INPUT_WIDTH):
    # Scale down by dividing and rounding
    scaled_value = round(value / scale_factor)
    
    # Truncate the value to fit into 7 bits
    max_val = (1 << (original_width - 1)) - 1  # Maximum positive value for 7 bits (63)
    min_val = -(1 << (original_width - 1))     # Minimum negative value for 7 bits (-64)
    
    # Clamp the result to the 7-bit range
    if scaled_value > max_val:
        scaled_value = max_val
    elif scaled_value < min_val:
        scaled_value = min_val
    
    return scaled_value

def rotate(x, y, angle_error, counter_start, iterations=ITERATIONS):
    # print(iterations, counter_start)
    for counter in range(counter_start, counter_start + iterations):
        if angle_error < 0:
            # Perform positive rotation
            x_new = x + (y >> counter)
            y_new = y - (x >> counter)
            angle_error += atan_table[counter]
        else:
            # Perform negative rotation
            x_new = x - (y >> counter)
            y_new = y + (x >> counter)
            angle_error -= atan_table[counter]
        
        # Update x and y for the next iteration
        x, y = x_new, y_new
        # print(f'counter={counter}, x={x}, y={y}')
    return x, y, angle_error


# Updated rotate function to handle sign-extended inputs
def rotate_non_pipelined(i_x, i_y, i_angle):
    # Initial gain adjustment after sign extension
    x = cordic_gain(sign_extend_and_scale(i_x))
    y = cordic_gain(sign_extend_and_scale(i_y))
    # print(x,y)
    angle_error = i_angle

    x, y, angle_error = rotate(x, y, angle_error, 0, ITERATIONS)
    # print(f'x={x}, y={y}, angle_error={angle_error}')
    x = scale_back_and_truncate(x)
    y = scale_back_and_truncate(y)
    return x, y

def rotate_pipelined_4(i_x, i_y, i_angle):
    # Initial gain adjustment after sign extension
    x = cordic_gain(sign_extend_and_scale(i_x))
    y = cordic_gain(sign_extend_and_scale(i_y))
    # print(x,y)
    angle_error = i_angle
    for i in range(4):
        x, y, angle_error = rotate(x, y, angle_error, i*4, ITERATIONS // 4)
    # print(f'x={x}, y={y}, angle_error={angle_error}')
    x = scale_back_and_truncate(x)
    y = scale_back_and_truncate(y)
    return x, y

i_x = 0b010_0000 # 32
# i_y = 0b010_0000 # 32
i_y = 0b000_0000 # 0

# i_angle = 0b0000010000110000010101;        # 3.75 degrees in radians
# i_angle = 0b0000100001100000101010;        # 7.5 degrees in radians
# i_angle = 0b0001000011000001010100;        # 15 degrees in radians
# i_angle = 0b0010000110000010101001;        # 30 degrees in radians
# i_angle = 0b1101111001111101010111;        # -30 degrees in radians
# i_angle = 0b0011001001000011111110;        # 45 degrees in radians
# i_angle = 0b0010000110000010101001;        # 30 degrees in radians
# i_angle = 0b0100001100000101010010;        # 60 degrees in radians
i_angle = 0b0110010010000111111011;        # 90 degrees in radians

# Non-pipelined
print('non-pipelined')
x, y = rotate_non_pipelined(i_x, i_y, i_angle)
print(f'x={x}, y={y}')

print('')

# pipelined_4
print('pipelined_4')
x, y = rotate_pipelined_4(i_x, i_y, i_angle)
print(f'x={x}, y={y}')