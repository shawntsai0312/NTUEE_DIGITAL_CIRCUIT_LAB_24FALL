import numpy as np
from PIL import Image
import random

WIDTH, HEIGHT = 1600, 800
PADDING = 30
BAR_WIDTH = 100
CAR_WIDTH = 60
TRACK_CAR_RATIO = 4
TRACK_WIDTH = CAR_WIDTH * TRACK_CAR_RATIO
INNER_RADIUS = 100
TRACK_BORDER = 5

X_MAX = WIDTH //2
X_MIN = -X_MAX
Y_MAX = HEIGHT // 2
Y_MIN = -Y_MAX

BORDER_COLOR = [255, 0, 0]
BACKGROUND_COLOR = [255, 255, 255]
TRACK_ORDINARY_COLOR = [1, 1, 1]
TRACK_SAND_COLOR = [210, 180, 140]
TRACK_ROCK_COLOR = [100, 100, 100]
TRACK_RANDOM_COLOR_RATIO = 10
TRACK_NUM_OF_RANDOM_COLORS = 1

class CircleRegion:
    def __init__(self, x_min, x_max, y_min, y_max, x0, y0, r_inner_min, r_inner_max, r_outer_min, r_outer_max, border_color=BORDER_COLOR, track_color=TRACK_ORDINARY_COLOR):
        self.x_min = x_min
        self.x_max = x_max
        self.y_min = y_min
        self.y_max = y_max
        self.x0 = x0
        self.y0 = y0
        self.r_inner_min = r_inner_min
        self.r_inner_max = r_inner_max
        self.r_outer_min = r_outer_min
        self.r_outer_max = r_outer_max
        self.border_color = border_color
        self.track_color = track_color

class RectangleXRegion:
    def __init__(self, x_min, x_max, y_min, y_max, x_track_left_outer, x_track_left_inner, x_track_right_inner, x_track_right_outer, border_color=BORDER_COLOR, track_color=TRACK_ORDINARY_COLOR):
        self.x_min = x_min
        self.x_max = x_max
        self.y_min = y_min
        self.y_max = y_max
        self.x_track_left_outer = x_track_left_outer
        self.x_track_left_inner = x_track_left_inner
        self.x_track_right_inner = x_track_right_inner
        self.x_track_right_outer = x_track_right_outer
        self.border_color = border_color
        self.track_color = track_color

class RectangleYRegion:
    def __init__(self, x_min, x_max, y_min, y_max, y_track_bottom_outer, y_track_bottom_inner, y_track_top_inner, y_track_top_outer, border_color=BORDER_COLOR, track_color=TRACK_ORDINARY_COLOR):
        self.x_min = x_min
        self.x_max = x_max
        self.y_min = y_min
        self.y_max = y_max
        self.y_track_bottom_outer = y_track_bottom_outer
        self.y_track_bottom_inner = y_track_bottom_inner
        self.y_track_top_inner = y_track_top_inner
        self.y_track_top_outer = y_track_top_outer
        self.border_color = border_color
        self.track_color = track_color

def pixel_to_coord(x, y):
    # 這裡的-0.5是為了讓像素中心點對準坐標中心點
    coord_x = x + 0.5 - WIDTH // 2
    coord_y = HEIGHT // 2 - y - 0.5
    return coord_x, coord_y

def random_gray_color():
    return np.array([1, 1, 1])*random.randint(0, TRACK_NUM_OF_RANDOM_COLORS-1)*TRACK_RANDOM_COLOR_RATIO

def render_track_color(track_color):
    if track_color == TRACK_ORDINARY_COLOR:
        return track_color
    if track_color == TRACK_ROCK_COLOR:
        return np.clip(np.array(track_color) + random_gray_color(), 0, 255)
    if track_color == TRACK_SAND_COLOR:
        return np.clip(np.array(track_color) + random_gray_color(), 0, 255)

def render_circle(img, circleRegion):
    height, width, _ = img.shape
    
    for y in range(height):
        for x in range(width):
            # 將像素座標轉換為坐標系中的點
            coord_x, coord_y = pixel_to_coord(x, y)
            
            # 計算與點A的距離
            distance = np.sqrt((coord_x - circleRegion.x0) ** 2 + (coord_y - circleRegion.y0) ** 2)
            
            if circleRegion.x_min <= coord_x <= circleRegion.x_max and circleRegion.y_min <= coord_y <= circleRegion.y_max:
                if circleRegion.r_inner_min <= distance <= circleRegion.r_inner_max or circleRegion.r_outer_min <= distance <= circleRegion.r_outer_max:
                    img[y, x] = circleRegion.border_color  # 使用 circleRegion 的 border_color
                elif circleRegion.r_inner_max < distance < circleRegion.r_outer_min:
                    img[y, x] = render_track_color(circleRegion.track_color)  # 使用 circleRegion 的 track_color

def render_rectangleX(img, rectangleXRegion):
    height, width, _ = img.shape
    
    for y in range(height):
        for x in range(width):
            # 將像素座標轉換為坐標系中的點
            coord_x, coord_y = pixel_to_coord(x, y)
            
            if rectangleXRegion.x_min <= coord_x <= rectangleXRegion.x_max and rectangleXRegion.y_min <= coord_y <= rectangleXRegion.y_max:
                if rectangleXRegion.x_track_left_outer <= coord_x <= rectangleXRegion.x_track_left_inner or rectangleXRegion.x_track_right_inner <= coord_x <= rectangleXRegion.x_track_right_outer:
                    img[y, x] = rectangleXRegion.border_color  # 使用 rectangleXRegion 的 border_color
                elif rectangleXRegion.x_track_left_inner < coord_x < rectangleXRegion.x_track_right_inner:
                    img[y, x] = render_track_color(rectangleXRegion.track_color)  # 使用 rectangleXRegion 的 track_color

def render_rectangleY(img, rectangleYRegion):
    height, width, _ = img.shape
    
    for y in range(height):
        for x in range(width):
            # 將像素座標轉換為坐標系中的點
            coord_x, coord_y = pixel_to_coord(x, y)
            
            if rectangleYRegion.x_min <= coord_x <= rectangleYRegion.x_max and rectangleYRegion.y_min <= coord_y <= rectangleYRegion.y_max:
                if rectangleYRegion.y_track_bottom_outer <= coord_y <= rectangleYRegion.y_track_bottom_inner or rectangleYRegion.y_track_top_inner <= coord_y <= rectangleYRegion.y_track_top_outer:
                    img[y, x] = rectangleYRegion.border_color  # 使用 rectangleYRegion 的 border_color
                elif rectangleYRegion.y_track_bottom_inner < coord_y < rectangleYRegion.y_track_top_inner:
                    img[y, x] = render_track_color(rectangleYRegion.track_color)  # 使用 rectangleYRegion 的 track_color

def render_image(circleRegions, rectangleXRegions, regtangleYRegions):
    width, height = WIDTH, HEIGHT
    img = np.zeros((height, width, 3), dtype=np.uint8)
    
    for region in circleRegions:
        render_circle(img, region)
    
    for region in rectangleXRegions:
        render_rectangleX(img, region)

    for region in regtangleYRegions:
        render_rectangleY(img, region)
    
    for y in range(height):
        for x in range(width):
            if np.array_equal(img[y, x], [0, 0, 0]):
                # 沒有被繪製的像素點，設定為白色
                img[y, x] = BACKGROUND_COLOR  # 白色
    
    return Image.fromarray(img)

XL1 = X_MIN+PADDING+TRACK_WIDTH+INNER_RADIUS
XL2 = X_MIN+PADDING+TRACK_WIDTH+TRACK_BORDER
XL3 = X_MIN+PADDING+TRACK_WIDTH
XL4 = X_MIN+PADDING
XL5 = X_MIN+PADDING-TRACK_BORDER

XR1 = X_MAX-PADDING-TRACK_WIDTH-INNER_RADIUS
XR2 = X_MAX-PADDING-TRACK_WIDTH-TRACK_BORDER
XR3 = X_MAX-PADDING-TRACK_WIDTH
XR4 = X_MAX-PADDING
XR5 = X_MAX-PADDING+TRACK_BORDER

YT1 = Y_MAX-PADDING-TRACK_WIDTH-INNER_RADIUS
YT2 = Y_MAX-PADDING-TRACK_WIDTH-TRACK_BORDER
YT3 = Y_MAX-PADDING-TRACK_WIDTH
YT4 = Y_MAX-PADDING
YT5 = Y_MAX-PADDING+TRACK_BORDER

YB1 = Y_MIN+PADDING+TRACK_WIDTH+INNER_RADIUS
YB2 = Y_MIN+PADDING+TRACK_WIDTH+TRACK_BORDER
YB3 = Y_MIN+PADDING+TRACK_WIDTH
YB4 = Y_MIN+PADDING
YB5 = Y_MIN+PADDING-TRACK_BORDER

R1 = INNER_RADIUS-TRACK_BORDER
R2 = INNER_RADIUS
R3 = INNER_RADIUS+TRACK_WIDTH
R4 = INNER_RADIUS+TRACK_WIDTH+TRACK_BORDER

# 測試函數
circleRegions = [
    CircleRegion( x_min=X_MIN, 
            x_max=XL1,
            y_min=YT1, 
            y_max=Y_MAX,
            x0=XL1, 
            y0=YT1, 
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4
    ),
    CircleRegion( x_min=X_MIN, 
            x_max=XL1,
            y_min=YB5, 
            y_max=YB1,
            x0=XL1, 
            y0=YB1, 
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4
    ),
    CircleRegion( x_min=XR1, 
            x_max=X_MAX,
            y_min=YB5, 
            y_max=YB1,
            x0=XR1, 
            y0=YB1, 
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4
    ),
    CircleRegion( x_min=XR1,
            x_max=X_MAX,
            y_min=YT1,
            y_max=Y_MAX,
            x0=XR1,
            y0=YT1,
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4
    )
]

rectangleXRegions = [
    RectangleXRegion( x_min=X_MIN, 
            x_max=XL1,
            y_min=YB1,
            y_max=YT1,
            x_track_left_outer=XL5, 
            x_track_left_inner=XL4, 
            x_track_right_inner=XL3, 
            x_track_right_outer=XL2
    ),
    RectangleXRegion( x_min=XR1, 
            x_max=X_MAX,
            y_min=YB1,
            y_max=YT1,
            x_track_left_outer=XR2, 
            x_track_left_inner=XR3, 
            x_track_right_inner=XR4, 
            x_track_right_outer=XR5
    )
]

rectangleYRegions = [
    RectangleYRegion( x_min=XL1, 
            x_max=XR1,
            y_min=Y_MIN,
            y_max=YB1,
            y_track_bottom_outer=YB5, 
            y_track_bottom_inner=YB4, 
            y_track_top_inner=YB3, 
            y_track_top_outer=YB2,
            track_color=TRACK_SAND_COLOR
    ),
    RectangleYRegion( x_min=XL1, 
            x_max=XR1,
            y_min=YT1,
            y_max=Y_MAX,
            y_track_bottom_outer=YT2, 
            y_track_bottom_inner=YT3, 
            y_track_top_inner=YT4, 
            y_track_top_outer=YT5,
            track_color=TRACK_ROCK_COLOR
    )
]

image = render_image(circleRegions, rectangleXRegions, rectangleYRegions)
# image.show()
image.save(f'track_{TRACK_NUM_OF_RANDOM_COLORS}.png')