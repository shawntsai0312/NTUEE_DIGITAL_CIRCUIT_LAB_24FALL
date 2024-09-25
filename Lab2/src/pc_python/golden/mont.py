import random

# 隨機生成 a 和 b
a = random.randint(0, 2**256 - 1)
b = random.randint(0, 2**256 - 1)
n = random.randint(1, 2**256 - 1)  # 確保 n 不為 0

# a = 6
# b = pow(2,255)
# n = 2

# a = 0x99aa7bc6870393427d8e178249928fe9a98ec45d54dfcd7bfdcd8de9b7bcee7c
# b = 0xfc4a83b9b222ed377613e58d47bea58fdaa22fae4249d95d9b330e38faa35bf1
# n = 0x95089b4fb8c6b6be2cd7d5db17682ab39a974ea5ffe8b77ee810b68917f431a6

def montgomery_algorithm(N, a, b):
    m = 0
    
    # Loop over the 256 bits of a
    for i in range(256):
        print(f"counter: {i}")
        print(f"o_result_w: {hex(m)}")
        # Check if the i-th bit of a is 1
        if (a >> i) & 1:
            m = m + b
        print(f"a_r: {hex(a>>i)}")
        
        print(f"temp1: {hex(m)}")
        
        # If m is odd, add N
        if m % 2 == 1:
            m = m + N

        print(f"temp2: {hex(m)}")

        # Right shift m (m = m // 2)
        m = m // 2
        
        print(f"o_result_r: {hex(m)}")
        print('\n')
    
    # Final adjustment if m >= N
    if m >= N:
        m = m - N
    
    return m

# 輸出結果
print(f"result: {hex(montgomery_algorithm(n, a, b))}")
print(f"a: {hex(a)}")
print(f"b: {hex(b)}")
print(f"n: {hex(n)}")