import math
import random

# File names
testdata_file = "testdata.txt"
goldendata_file = "goldendata.txt"

# Rotation function (replace with the DUT's logic if available)
def rotate_coordinates(x, y, angle):
    radians = math.radians(angle)
    cos_theta = math.cos(radians)
    sin_theta = math.sin(radians)
    
    # Calculate rotated coordinates
    new_x = int(round(x * cos_theta - y * sin_theta))
    new_y = int(round(x * sin_theta + y * cos_theta))
    return new_x, new_y

# Generate data
num_samples = 1000  # Number of test cases to generate

# Open files for writing
with open(testdata_file, "w") as test_file, open(goldendata_file, "w") as golden_file:
    for _ in range(num_samples):
        # Randomly generate input values
        i_x = random.randint(-50, 50)
        i_y = random.randint(-50, 50)
        i_angle = random.randint(-180, 180)
        
        # Write test data
        test_file.write(f"{i_x} {i_y} {i_angle}\n")
        
        # Compute golden data
        o_x, o_y = rotate_coordinates(i_x, i_y, i_angle)
        golden_file.write(f"{o_x} {o_y}\n")

print(f"Generated {num_samples} test cases.")
print(f"Test data saved in {testdata_file}.")
print(f"Golden data saved in {goldendata_file}.")
