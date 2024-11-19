import math


def decimal_to_fixed_point(value, fractional_bits=16):
    """
    Convert a decimal number into a fixed-point representation.

    Args:
        value (float): The decimal number to convert.
        fractional_bits (int): The number of bits for the fractional part.

    Returns:
        int: The fixed-point representation.
    """
    # Scale the value by 2^fractional_bits
    scaled_value = value * (1 << fractional_bits)

    # Round the scaled value to the nearest integer
    fixed_point_value = round(scaled_value)

    # Handle overflow for signed 32-bit integer representation
    max_val = (1 << 31) - 1
    min_val = -(1 << 31)
    if fixed_point_value > max_val or fixed_point_value < min_val:
        raise OverflowError(
            "Value exceeds the range of a signed 32-bit fixed-point number.")

    return int(fixed_point_value)


def fixed_point_to_decimal(fixed_point_value, fractional_bits=16):
    """
    Convert a fixed-point number back to a decimal representation.

    Args:
        fixed_point_value (int): The fixed-point number.
        fractional_bits (int): The number of bits for the fractional part.

    Returns:
        float: The decimal representation.
    """
    # Scale the fixed-point value back to decimal
    return fixed_point_value / (1 << fractional_bits)


# Example usage

# 1 degree in radians
# decimal_value = 0.00017453292519943295

# 30 degrees in radians
# decimal_value = 0.5235987755982988

decimal_value = 0.6072529350088813

fractional_bits = 20

# Convert to fixed-point
fixed_point_value = decimal_to_fixed_point(decimal_value, fractional_bits)
print(f"Fixed-point representation: {fixed_point_value}")

# Print fixed-point value in binary
binary_representation = format(fixed_point_value, '032b')
print(f"Fixed-point representation (binary): {binary_representation}")

# Convert back to decimal
converted_decimal = fixed_point_to_decimal(fixed_point_value, fractional_bits)
print(f"Converted back to decimal: {converted_decimal}")

# Calculate the error
error = abs(decimal_value - converted_decimal)
print(f"relative error = {error/decimal_value*100}%")
