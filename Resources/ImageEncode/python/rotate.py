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

# Updated rotate function to handle sign-extended inputs
def rotate_cordic(i_x, i_y, i_angle):
    # Initial gain adjustment after sign extension
    x = cordic_gain(sign_extend_and_scale(i_x))
    y = cordic_gain(sign_extend_and_scale(i_y))
    # print(x,y)
    angle_error = i_angle
    
    for counter in range(ITERATIONS):
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
    x = scale_back_and_truncate(x)
    y = scale_back_and_truncate(y)
    return x, y

# Function to rotate the image without multipliers/dividers
def rotate_image(image, angle_degrees):
    angle_rad = np.radians(angle_degrees)
    cos_theta = np.cos(angle_rad)
    sin_theta = np.sin(angle_rad)

    # Image size remains the same as the original
    height, width = image.shape
    rotated_image = np.zeros_like(image)

    # Center point
    center_x, center_y = width // 2, height // 2

    for y in range(height):
        for x in range(width):
            # Compute original point relative to the center
            rel_x = x - center_x
            rel_y = y - center_y

            # Calculate new position using rotation matrix
            # orig_x = int(rel_x * cos_theta - rel_y * sin_theta) + center_x
            # orig_y = int(rel_x * sin_theta + rel_y * cos_theta) + center_y
            x_new, y_new = rotate_cordic(rel_x, rel_y, int(angle_rad * (2 ** 20)))
            orig_x = x_new + center_x
            orig_y = y_new + center_y
            # if(y==0):
            #     print(f'x={x}, y={y}, orig_x={orig_x}, orig_y={orig_y}')
            #     print(f'rel_x={rel_x}, rel_y={rel_y}, x_new={x_new}, y_new={y_new}\n')

            # Ensure the new position is within image boundaries
            if 0 <= orig_x < width and 0 <= orig_y < height:
                rotated_image[y, x] = image[orig_y, orig_x]

    return rotated_image

# Read an image (gray scale)
image_path = 'car_resized.png'  # Example path
image = Image.open(image_path).convert('L')
image_array = np.array(image)

# Rotate the image by 45 degrees
# input from -90 to 90
angle = 10
rotated_img = rotate_image(image_array, angle)

# Save the processed image
output_path = 'rotated_image.png'
rotated_image_pil = Image.fromarray(rotated_img)
rotated_image_pil.save(output_path)
