import math

def rotate(x, y, angle, iterations=16):
    # Define lookup table for arctangent values
    atan_table = [math.atan(2**-i) for i in range(iterations)]
    
    # Initial angle in radians for the given input
    z = angle

    K = 1
    for i in range(iterations):
        K *= 1 / math.sqrt(1 + 2**(-2 * i))
    
    # Initial vector values
    x_new = x * K
    y_new = y * K
    
    # Perform CORDIC iterations
    for i in range(iterations):
        sigma = -1 if z < 0 else 1
        x_temp = x_new - sigma * y_new * (2**-i)
        y_new = y_new + sigma * x_new * (2**-i)
        x_new = x_temp
        z -= sigma * atan_table[i]
        print(f'Iteration {i}: x={x_new}, y={y_new}, z={z*(2**20)}')
    
    return x_new, y_new  # Rotated vector coordinates

# Test the function
x_input, y_input = 16384, 0  # Example vector (1, 0)
angle_in_radians = math.radians(30)  # Rotate by 45 degrees
x_rotated, y_rotated = rotate(x_input, y_input, angle_in_radians)

print(f"Rotated Vector: ({x_rotated}, {y_rotated})")
