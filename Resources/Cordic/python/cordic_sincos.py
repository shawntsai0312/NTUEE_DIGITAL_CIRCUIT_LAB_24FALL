import math

def cordic(angle, iterations=16):
    # Define lookup table for arctangent values
    atan_table = [math.atan(2**-i) for i in range(iterations)]
    # print(atan_table)

    # Initial values for CORDIC gain compensation
    K = 1
    for i in range(iterations):
        K *= 1 / math.sqrt(1 + 2**(-2 * i))

    print(f"K: {K}")

    # Initial vector coordinates
    x = K
    y = 0
    z = angle
    print(f"initial z: {z}")

    # Perform CORDIC iterations
    for i in range(iterations):
        sigma = -1 if z < 0 else 1
        x_new = x - sigma * y * (2**-i)
        y_new = y + sigma * x * (2**-i)
        z -= sigma * atan_table[i]

        # Update x and y
        x, y = x_new, y_new
        print(f"Iteration {i}: x={x}, y={y}, z={z}, sigma={sigma}")

    return x, y  # Cosine of the angle, sine of the angle


# Test the function
angle_in_radians = math.radians(45)  # Example: 45 degrees
cosine, sine = cordic(angle_in_radians, iterations=32)
print(f"Cosine: {cosine}, Sine: {sine}")
