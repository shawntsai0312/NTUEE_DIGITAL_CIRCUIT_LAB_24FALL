import random

# 將十進位數字轉換回16位元有符號二進位數字
def int_to_binary(value):
    if value < 0:
        value += 2**16
    return format(value, '016b')

def constant_interpolation(lines, i):
    constant_lines = [lines[j // i] for j in range(i * len(lines))]
    return constant_lines

def linear_interpolation(lines, i):
    result = []
    
    for idx in range(len(lines) - 1):
        start = lines[idx]
        end = lines[idx + 1]
        step = (end - start) / i
        
        # 將起點加入結果
        result.append(start)
        
        # 插入內差點
        for j in range(1, i):
            result.append(round(start + step * j))
    
    # 最後一個終點加入結果
    result.append(lines[-1])
    
    return result


NUM_DATA = 100
RANGE_MIN = -2**15
RANGE_MAX = 2**15 - 1

lines = [random.randint(RANGE_MIN, RANGE_MAX) for _ in range(NUM_DATA)]

# test = [-4200, -3360, -2520, -1680, -840, 0, 840, 1680, 2520, 3360, 4200]
# test = [-8, -4, 0, 4, 8]

# constant_test = constant_interpolation(test, 2)
# linear_test = linear_interpolation(test,5)

# print(constant_test)
# print(linear_test)

# 開啟檔案以寫入模式
with open('golden/mem.txt', 'w') as file:
    file.writelines([int_to_binary(int(line)) + '\n' for line in lines])

with open('golden/normal.txt', 'w') as file:
    file.writelines([int_to_binary(int(line)) + '\n' for line in lines])

for i in range(2, 9):
    # 過濾出索引為 3 的倍數的行
    fast_lines = [line for index, line in enumerate(lines) if index % i == 1]
    
    # 生成 constant_lines
    constant_lines = constant_interpolation(lines, i)

    # 生成 linear_lines
    linear_lines = linear_interpolation(lines, i)

    # 將過濾後的行寫入 result.txt 檔案
    with open(f'golden/fast/fast_{i}.txt', 'w') as file:
        file.writelines([int_to_binary(int(line)) + '\n' for line in fast_lines])
    
    # 將 constant_lines 寫入另一個檔案
    with open(f'golden/constant/constant_{i}.txt', 'w') as file:
        file.writelines([int_to_binary(int(line)) + '\n' for line in constant_lines])

    # 將 linear_lines 寫入另一個檔案
    with open(f'golden/linear/linear_{i}.txt', 'w') as file:
        file.writelines([int_to_binary(int(line)) + '\n' for line in linear_lines])