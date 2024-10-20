import random

NUM_SAMPLES = 16

# 開啟檔案以寫入模式
with open('golden.txt', 'w') as file:
    # 迴圈生成 NUM_SAMPLES 個隨機的 20 位元二進位數字
    for _ in range(NUM_SAMPLES):
        # 生成隨機的 20 位元二進位數字
        random_number = random.getrandbits(16)
        binary_number = format(random_number, '016b')
        # 將二進位數字寫入檔案，每個數字佔一行
        file.write(binary_number + '\n')