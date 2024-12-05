import os
from PIL import Image
import cv2

# 設定框架大小
frame_width = 1600
frame_height = 900

# 創建輸出目錄
# output_dir = 'output'
# input_bin = 'output.bin'
output_dir = 'vga_video'
input_bin = 'vga_video.bin'
os.makedirs(output_dir, exist_ok=True)

# 讀取輸出文件
with open(input_bin, 'rb') as file:
    data = file.read()

# 計算總幀數
num_frames = len(data) // (frame_width * frame_height * 3)

# 設定視頻參數
video_path = os.path.join(output_dir, 'output_video.mp4')
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
fps = 60  # 設定每秒幀數
video = cv2.VideoWriter(video_path, fourcc, fps, (frame_width, frame_height))

for frame in range(num_frames):
    # 初始化圖像
    print(f'Processing frame {frame + 1}/{num_frames}')
    image = Image.new('RGB', (frame_width, frame_height))
    pixels = image.load()
    
    # 將每一行轉換為像素
    for i in range(frame_width * frame_height):
        index = (frame * frame_width * frame_height + i) * 3
        r = data[index]
        g = data[index + 1]
        b = data[index + 2]
        x = i % frame_width
        y = i // frame_width
        pixels[x, y] = (r, g, b)
    
    # 保存圖像
    image_path = os.path.join(output_dir, f'frame_{frame}.png')
    image.save(image_path)
    
    # 將圖像添加到視頻
    frame_image = cv2.imread(image_path)
    video.write(frame_image)

# 釋放視頻對象
video.release()
