import math
import random

INPUT_BITS = 8

LOWER_BOUND = -2**(INPUT_BITS - 2)
UPPER_BOUND = 2**(INPUT_BITS - 2) - 1

x = random.randint(LOWER_BOUND, UPPER_BOUND)
y = random.randint(LOWER_BOUND, UPPER_BOUND)
angle = random.randint(-180, 180)

# Rotate the vector (x, y) by the angle in degrees
angle_rad = math.radians(angle)
x_new = x * math.cos(angle_rad) - y * math.sin(angle_rad)
y_new = x * math.sin(angle_rad) + y * math.cos(angle_rad)

print(f"Input vector: ({x}, {y})")
print(f"Angle: {angle} degrees")
print(f"Rotated vector: ({round(x_new)}, {round(y_new)})")