def montgomery_algorithm(N, a, b):
    """
    Montgomery Algorithm to compute (a * b * 2^-256) % N
    Args:
        N : modulus
        a : operand 1
        b : operand 2
    Returns:
        result of Montgomery multiplication
    """
    m = 0
    for i in range(256):
        if (a >> i) & 1:
            m += b
        if m % 2 == 1:
            m += N
        m //= 2
    if m >= N:
        m -= N
    return m


def modulo_product(N, a, b, k):
    """
    Function to perform modular multiplication: (a * b) % N
    Args:
        N : modulus
        a : operand 1
        b : operand 2
        k : number of bits of a
    Returns:
        result of the modular product
    """
    t = b
    m = 0
    for i in range(k):
        if (a >> i) & 1:
            if m + t >= N:
                m = m + t - N
            else:
                m = m + t
        if t + t >= N:
            t = t + t - N
        else:
            t = t + t
    return m

def calculate_mod_exp(x, n):
    # Calculate (x * 2^256) % N
    result = (x * pow(2, 256, n)) % n
    return result

def rsa256_mont(N, y, d):
    """
    Debug version of RSA256Mont to trace intermediate values.
    """

    # m = 1
    m = 1
    print(f"Initial m: {m}")

    # t = (y * 2^256) % N
    # t = modulo_product(N, 2**256, y, 256)
    t = calculate_mod_exp(y, N)
    print(f"Initial t: {hex(t)}")

    # Iterate over the bits of the exponent d
    for i in range(256):
        print(f"\ncounter: {i}")
        print(f"n: {hex(N)}")
        if (d >> i) & 1:
            # m = (m * t * 2^-256) % N
            m = montgomery_algorithm(N, m, t)
        print(f"m: {hex(m)}")
        # t = (t * t * 2^-256) % N
        t = montgomery_algorithm(N, t, t)
        print(f"t: {hex(t)}")

    return m


# Example parameters to test the functions
N = 0xCA3586E7EA485F3B0A222A4C79F7DD12E85388ECCDEE4035940D774C029CF831  # Example modulus
# y = 0xc6b662ecb173c53cc7bb4212057f9c0ba283e000b98c9dcf5feaee7d6c933dfb
y= 0x9d29a982563bf87a5814dfc70059a3772cf98a11099f093a2e95d5a874836dd8
d = 0xB6ACE0B14720169839B15FD13326CF1A1829BEAFC37BB937BEC8802FBCF46BD9  # Example exponent
# Debug run with the same parameters
result = rsa256_mont(N, y, d)
print(f"n: {hex(N)}")
print(f"y: {hex(y)}")
print(f"d: {hex(d)}")
print(f"Result: {hex(result)}")

