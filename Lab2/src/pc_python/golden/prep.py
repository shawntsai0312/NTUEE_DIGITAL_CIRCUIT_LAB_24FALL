def extract_hex_numbers(file_path):
    with open(file_path, 'r') as file:
        hex_data = file.readlines()

    blocks = []
    for line in hex_data:
        # Split each line by colon (':') to separate the address and the hex data
        parts = line.split(':')
        if len(parts) > 1:
            # Extract the hex data part and remove all spaces/tabs
            hex_part = parts[1].strip()
            clean_hex = hex_part.replace(" ", "").replace("\t", "")  # Remove spaces and tabs
            blocks.append(clean_hex)

    # Combine every 4 elements in blocks
    combined_blocks = []
    for i in range(0, len(blocks), 4):
        combined_block = "".join(blocks[i:i+4])
        combined_blocks.append(combined_block)

    # print(len(combined_blocks))  # Should print 7 if the original length was 28
    return combined_blocks

def calculate_mod_exp(x, n):
    # Calculate (x * 2^256) % N
    result = (x * pow(2, 256, n)) % n
    return result

# Example usage
n = 0xCA3586E7EA485F3B0A222A4C79F7DD12E85388ECCDEE4035940D774C029CF831  # Define N as hexadecimal

enc = extract_hex_numbers('enc1.txt')
enc_step_1 = []

def split_string(s):
    return '_'.join([s[max(i-4, 0):i] for i in range(len(s), 0, -4)][::-1])

print(len(enc))
for i in enc:
    print(f"Input: {split_string(i)}\n")
    # 將字串轉換為 256 位元的二進位數字
    binary_number = int(i, 16)
    result = calculate_mod_exp(binary_number, n)
    temp = binary_number
    for j in range(256):
        if(temp*2 > n):
            temp = temp*2 - n
        else:
            temp = temp*2
        temp_in_string = hex(temp).replace("0x", "")
        temp2_in_string = hex(temp*2).replace("0x", "")
        print(f"counter: {j}")
        print(f"temp: {split_string(temp_in_string)}")
        print(f"temp*2: {split_string(temp2_in_string)}")
        print('\n')
    
    result_in_string = hex(result).replace("0x", "")
    print(f"Result: {split_string(result_in_string)}")
    print('\n-----------------------------------------------\n')
