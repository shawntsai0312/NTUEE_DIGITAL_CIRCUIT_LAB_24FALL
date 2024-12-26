import numpy as np
from PIL import Image
import random

WIDTH, HEIGHT = 1600, 800
PADDING = 30
BAR_WIDTH = 100
CAR_WIDTH = 60
TRACK_CAR_RATIO = 4
TRACK_WIDTH = CAR_WIDTH * TRACK_CAR_RATIO / 2
INNER_RADIUS = 100
TRACK_BORDER = 5

X_MAX = WIDTH //2
X_MIN = -X_MAX
Y_MAX = HEIGHT // 2
Y_MIN = -Y_MAX

BORDER_COLOR = [1, 1, 1]
BACKGROUND_COLOR = [255, 255, 255]#白色
# test_color = [200,200,200]
TRACK_ORDINARY_COLOR = [81, 81, 81]
TRACK_SAND_COLOR = [210, 180, 140]
TRACK_ROCK_COLOR = [100, 100, 100]
BLUE_COLOR = [173, 216, 230]
# TRACK_NEW_COLOR = [150, 200, 250] 
TRACK_RANDOM_COLOR_RATIO = 10
TRACK_NUM_OF_RANDOM_COLORS = 3

class CircleRegion:
    def __init__(self, x_min, x_max, y_min, y_max, x0, y0, r_inner_min, r_inner_max, r_outer_min, r_outer_max, border_color=BORDER_COLOR, track_color=TRACK_ORDINARY_COLOR):
        self.x_min = x_min#邊界座標
        self.x_max = x_max
        self.y_min = y_min
        self.y_max = y_max
        self.x0 = x0#圓心座標
        self.y0 = y0
        self.r_inner_min = r_inner_min#邊界寬度
        self.r_inner_max = r_inner_max
        self.r_outer_min = r_outer_min#邊界寬度
        self.r_outer_max = r_outer_max
        self.border_color = border_color#
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
class StandardFormRegion:
    def __init__(self, 
                 x_left, 
                 x_right, 
                 y_bottom, 
                 y_top, 
                 a, 
                 b, 
                 c_1, 
                 c_2,
                 c_3,
                 c_4,
                 border_color=BORDER_COLOR, 
                 track_color=TRACK_ORDINARY_COLOR):
        """
        使用標準形式 ax + by = c 定義邊界的區域。

        :param x_left: 區域的最左邊 x 邊界
        :param x_right: 區域的最右邊 x 邊界
        :param y_bottom: 區域的最低 y 邊界
        :param y_top: 區域的最高 y 邊界
        :param bottom_a, bottom_b, bottom_c: 下邊界的直線參數 ax + by = c
        :param top_a, top_b, top_c: 上邊界的直線參數 ax + by = c
        :param border_color: 邊界顏色
        :param track_color: 軌道顏色
        """
        self.x_left = x_left
        self.x_right = x_right
        self.y_bottom = y_bottom
        self.y_top = y_top
        
        self.a = a
        self.b = b
        self.c_1 = c_1
        self.c_2 = c_2
        self.c_3 = c_3
        self.c_4 = c_4
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
def render_standard_form(img, standardFormRegion):
    height, width, _ = img.shape
    for y in range(height):
        for x in range(width):
            # 將像素座標轉換為坐標系中的點
            coord_x, coord_y = pixel_to_coord(x, y)
            
            if standardFormRegion.x_left <= coord_x <= standardFormRegion.x_right and \
               standardFormRegion.y_bottom <= coord_y <= standardFormRegion.y_top:
                 # 計算點與每條邊界的關係
                # 左邊界的外側與內側
                left_outer = standardFormRegion.a * coord_x + standardFormRegion.b * coord_y - standardFormRegion.c_1
                left_inner = standardFormRegion.a * coord_x + standardFormRegion.b * coord_y - standardFormRegion.c_2

                # 右邊界的內側與外側
                right_inner = standardFormRegion.a * coord_x + standardFormRegion.b * coord_y - standardFormRegion.c_3
                right_outer = standardFormRegion.a * coord_x + standardFormRegion.b * coord_y - standardFormRegion.c_4

                # 渲染不同區域
                if (left_outer >= 0 and left_inner <= 0) or (right_inner >= 0 and right_outer <= 0):
                    # 在邊界區域
                    img[y, x] = standardFormRegion.border_color
                elif left_inner > 0 and right_inner < 0:
                    # 在內部的 track 區域
                    img[y, x] = render_track_color(standardFormRegion.track_color)
                    
                    
                    
def render_image(circleRegions, standardFormRegions):
    width, height = WIDTH, HEIGHT
    img = np.zeros((height, width, 3), dtype=np.uint8)
    
    for region in circleRegions:
        render_circle(img, region)
    
    # for region in rectangleXRegions:
    #     render_rectangleX(img, region)

    # for region in regtangleYRegions:
    #     render_rectangleY(img, region)
        
    for region in standardFormRegions:
        render_standard_form(img, region)
        
    for y in range(height):
        for x in range(width):
            if np.array_equal(img[y, x], [0, 0, 0]):
                # 沒有被繪製的像素點，設定為白色
                img[y, x] = BLUE_COLOR  # 藍色
    
    return Image.fromarray(img)
import time
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
R3 = INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER
R4 = INNER_RADIUS+TRACK_WIDTH+TRACK_BORDER-TRACK_BORDER
#-------------------------------------SHAWN-----------------------
#-------------------------------------HOWARD--------------------
X_LEFT1 = X_MIN+PADDING
X_RIGHT1 = X_MIN+PADDING+TRACK_WIDTH+TRACK_BORDER
Y_TOP1 = YT1
Y_BOTTOM1 = Y_MIN+BAR_WIDTH+PADDING+TRACK_WIDTH


# 測試函數
circleRegions = [
    CircleRegion( x_min=X_MIN, #左上
            x_max=XL1+TRACK_WIDTH+TRACK_BORDER+INNER_RADIUS,
            y_min=YT1, 
            y_max=Y_MAX,
            x0=XL1, 
            y0=YT1, 
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4
    ),
    CircleRegion( x_min=X_MIN,#左下
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
    CircleRegion( x_min=X_MIN+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER, #中下
            x_max=XL1+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER+INNER_RADIUS+TRACK_WIDTH,
            y_min=YB5+150, 
            y_max=YB1+150,
            x0=XL1+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER, 
            y0=YB1+150, 
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4,
            track_color=TRACK_SAND_COLOR,
    ),
    CircleRegion( x_min=X_LEFT1+2*TRACK_WIDTH+4*INNER_RADIUS-2*TRACK_BORDER,#中上
            x_max=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER,#X_LEFT1+2*TRACK_WIDTH+4*INNER_RADIUS-2*TRACK_BORDER+R4+TRACK_BORDER,
            y_min=YT1,
            y_max=Y_MAX,
            x0=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER,
            y0=YT1,
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4,
            track_color=TRACK_SAND_COLOR,
    ),
    CircleRegion( x_min=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,#右上
            x_max=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+R4+TRACK_BORDER,
            y_min=YT1,
            y_max=Y_MAX,
            x0=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,
            y0=(YT1+INNER_RADIUS)-INNER_RADIUS,
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4,
            track_color=TRACK_ROCK_COLOR
    ),
    CircleRegion( x_min=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,#右下
            x_max=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+R4+TRACK_BORDER,
            y_min=YB5,
            y_max=YB1,
            x0=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,
            y0=YB1,
            r_inner_min=R1, 
            r_inner_max=R2, 
            r_outer_min=R3, 
            r_outer_max=R4,
            track_color=TRACK_ROCK_COLOR,
    )
]

print('X_LEFT1:',X_LEFT1)
print('X_RIGHT1:',X_RIGHT1)
print('Y_TOP1:',Y_TOP1)
print('Y_BOTTOM1:',Y_BOTTOM1)
standardFormRegions = [
    StandardFormRegion(#左直線
        x_left=X_LEFT1,
        x_right=X_RIGHT1,
        y_bottom=Y_BOTTOM1,
        y_top=Y_TOP1,
        a=1,
        b=0,
        c_1=X_LEFT1,
        c_2=X_LEFT1+TRACK_BORDER,
        c_3=X_RIGHT1-TRACK_BORDER,
        c_4=X_RIGHT1,
        border_color=BORDER_COLOR,
        track_color=TRACK_ORDINARY_COLOR
    ),
    StandardFormRegion(#左二直線
        x_left=X_LEFT1+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        x_right=X_RIGHT1+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        y_bottom=Y_BOTTOM1+150,
        y_top=Y_TOP1,
        a=1,
        b=0,
        c_1=X_LEFT1+TRACK_WIDTH+2*INNER_RADIUS-TRACK_BORDER,
        c_2=X_LEFT1+TRACK_BORDER+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        c_3=X_RIGHT1-TRACK_BORDER+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        c_4=X_RIGHT1+2*INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        border_color=BORDER_COLOR,
        track_color=TRACK_ORDINARY_COLOR
    ),
    StandardFormRegion(#左三直線
        x_left=X_LEFT1+4*INNER_RADIUS+2*TRACK_WIDTH-2*TRACK_BORDER,
        x_right=X_RIGHT1+4*INNER_RADIUS+2*TRACK_WIDTH-2*TRACK_BORDER,
        y_bottom=Y_BOTTOM1+150,
        y_top=Y_TOP1,
        a=1,
        b=0,
        c_1=X_LEFT1+2*TRACK_WIDTH+4*INNER_RADIUS-2*TRACK_BORDER,
        c_2=X_LEFT1+2*TRACK_WIDTH+4*INNER_RADIUS-TRACK_BORDER,
        c_3=X_LEFT1+2*TRACK_WIDTH+4*INNER_RADIUS-2*TRACK_BORDER+TRACK_WIDTH,
        c_4=X_RIGHT1+4*INNER_RADIUS+2*TRACK_WIDTH-TRACK_BORDER,
        border_color=BORDER_COLOR,
        track_color=TRACK_SAND_COLOR
    ),
    StandardFormRegion(#上橫線
        x_left=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER,
        x_right=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,
        y_bottom=YT1,
        y_top=Y_MAX,
        a=0,
        b=1,
        c_1=(YT1+INNER_RADIUS)-TRACK_BORDER, 
        c_2=YT1+INNER_RADIUS,
        c_3=YT1+R4-TRACK_BORDER,
        c_4=YT1+R4,
        border_color=BORDER_COLOR,
        track_color=TRACK_ORDINARY_COLOR
    ),
    StandardFormRegion(#下橫線
        x_left=XL1+24,
        x_right=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450,
        y_bottom=YB1-INNER_RADIUS-TRACK_WIDTH-2*TRACK_BORDER,
        y_top=YB1-INNER_RADIUS+TRACK_BORDER,
        a=0,
        b=1,
        c_1=YB1-INNER_RADIUS-TRACK_WIDTH, 
        c_2=YB1-INNER_RADIUS-TRACK_WIDTH+TRACK_BORDER, 
        c_3=YB1-INNER_RADIUS,
        c_4=YB1-INNER_RADIUS+TRACK_BORDER,
        border_color=BORDER_COLOR,
        track_color=TRACK_ORDINARY_COLOR
    ),
    StandardFormRegion(#下橫線起跑線（白）
        x_left=XL1,
        x_right=XL1+24,
        y_bottom=YB1-INNER_RADIUS-TRACK_WIDTH-2*TRACK_BORDER,
        y_top=YB1-INNER_RADIUS+TRACK_BORDER,
        a=0,
        b=1,
        c_1=YB1-INNER_RADIUS-TRACK_WIDTH, 
        c_2=YB1-INNER_RADIUS-TRACK_WIDTH+TRACK_BORDER, 
        c_3=YB1-INNER_RADIUS,
        c_4=YB1-INNER_RADIUS+TRACK_BORDER,
        border_color=BORDER_COLOR,
        track_color=TRACK_SAND_COLOR,
    ),
    StandardFormRegion(#右直線
        x_left=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS-2*TRACK_BORDER,
        x_right=XL1+2*R4+2*INNER_RADIUS+450+INNER_RADIUS+TRACK_WIDTH+2*TRACK_BORDER,
        y_bottom=YB1,
        y_top=YT1,
        a=1,
        b=0,
        c_1=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS-TRACK_BORDER,
        c_2=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS,
        c_3=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        c_4=XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS+TRACK_WIDTH,
        border_color=BORDER_COLOR,
        track_color=TRACK_ROCK_COLOR
    )
]
# starttime = time.time()
# image = render_image(circleRegions,standardFormRegions)
# endtime = time.time()
# print('Time:',endtime-starttime)
# image.show()
# image.save(f'track_{TRACK_NUM_OF_RANDOM_COLORS}.png')
# print (R1)
# print (R2)
# print (R3)  
# print (R4)

print(XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS-TRACK_BORDER,
        XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS,
        XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS+TRACK_WIDTH-TRACK_BORDER,
        XL1+2*R4+2*INNER_RADIUS-2*TRACK_BORDER+450+INNER_RADIUS+TRACK_WIDTH,)
           