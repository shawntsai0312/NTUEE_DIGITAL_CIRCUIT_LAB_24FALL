import cv2
import numpy as np
from mapImage import render_image, circleRegions, rectangleXRegions, rectangleYRegions

# 設置視頻參數
width, height = 1600, 900
fps = 60
duration = 0.1  # 秒
total_frames = round(fps * duration)
filename = 'track_video.mp4'

# 創建視頻寫入器
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
video_writer = cv2.VideoWriter(filename, fourcc, fps, (width, height))

for frame_num in range(total_frames):
    # 生成圖像
    print(f'Generating frame {frame_num + 1}/{total_frames}...')
    image = render_image(circleRegions, rectangleXRegions, rectangleYRegions)
    frame = np.array(image)
    
    # 將圖像寫入視頻
    video_writer.write(cv2.cvtColor(frame, cv2.COLOR_RGB2BGR))

# 釋放視頻寫入器
video_writer.release()
print(f'Video saved as {filename}')
