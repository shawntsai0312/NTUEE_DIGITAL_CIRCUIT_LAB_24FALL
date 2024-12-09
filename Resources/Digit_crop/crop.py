import os
from PIL import Image

input_dir = 'input/'
output_dir = 'output/'

CROP_TOP = 6
CROP_BOTTOM = 6
CROP_LEFT = 12
CROP_RIGHT = 12

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

for filename in os.listdir(input_dir):
    if filename.endswith('.png'):  # 假設圖片格式為 .png
        img_path = os.path.join(input_dir, filename)
        img = Image.open(img_path)
        
        # 裁剪圖片，上下各裁掉 8 個 pixel，左右各裁掉 14 個 pixel
        cropped_img = img.crop((CROP_LEFT, CROP_TOP, 50 - CROP_RIGHT, 50 - CROP_BOTTOM))
        
        output_path = os.path.join(output_dir, filename)
        cropped_img.save(output_path)

# 合併十張圖片
combined_width = 50 - CROP_LEFT - CROP_RIGHT
combined_height = 10 * (50 - CROP_TOP - CROP_BOTTOM)
combined_img = Image.new('RGB', (combined_width, combined_height))

# 確保圖片按照 bar_0, bar_1, ... 的順序排列
sorted_filenames = sorted([f for f in os.listdir(output_dir) if f.endswith('.png') and f.startswith('bar_')], key=lambda x: int(x.split('_')[1].split('.')[0]))

for i, filename in enumerate(sorted_filenames[:10]):  # 只合併前十張圖片
    img_path = os.path.join(output_dir, filename)
    img = Image.open(img_path)
    combined_img.paste(img, (0, i * (50 - CROP_TOP - CROP_BOTTOM)))

combined_img.save(os.path.join(output_dir, 'bar_digit.png'))
