package sram_pkg;

    // Display
    localparam int VGA_H = 1600;
    localparam int VGA_V = 900;
    localparam int VGA_FRAME_RATE = 60;

    // Encoded color 的位寬
    localparam int COLOR_WIDTH = 4;
    localparam int IMAGE_SIZE = 60;
    localparam int IMAGE_COOR_WIDTH = 6;
    localparam int ANG_WIDTH = 9;
    localparam int MAP_H = VGA_H;
    localparam int MAP_V = 800;
    localparam int MAP_H_WIDTH = 11;
    localparam int MAP_V_WIDTH = 10;

    // SRAM 總大小
    localparam int SRAM_ADDR_COUNT = 20;
    localparam int SRAM_TOTAL_ADDR = 2**SRAM_ADDR_COUNT; // 總共 1M 地址
    localparam int SRAM_DATA_WIDTH = 16;   // 每地址 16 bit

    // 每像素的位寬
    localparam int PIXEL_WIDTH_WIDTH = 4;

    // 每地址存的像素數量
    localparam int PIXELS_PER_ADDR = SRAM_DATA_WIDTH / PIXEL_WIDTH_WIDTH;

    // 地圖區域
    localparam int MAP_PIXEL_COUNT = MAP_H * MAP_V;
    localparam int MAP_ADDR_COUNT  = MAP_PIXEL_COUNT / PIXELS_PER_ADDR;
    localparam int MAP_ADDR_START  = 20'h00000;
    localparam int MAP_ADDR_END    = MAP_ADDR_START + MAP_ADDR_COUNT - 1;

    // Bar 區域
    localparam int BAR_PIXEL_COUNT = MAP_H * (VGA_V - MAP_V);
    localparam int BAR_ADDR_COUNT  = BAR_PIXEL_COUNT / PIXELS_PER_ADDR;
    localparam int BAR_ADDR_START  = MAP_ADDR_END + 1;
    localparam int BAR_ADDR_END    = BAR_ADDR_START + BAR_ADDR_COUNT - 1;

    // Car1 區域
    localparam int CAR1_PIXEL_COUNT = IMAGE_SIZE * IMAGE_SIZE;
    localparam int CAR1_ADDR_COUNT  = CAR1_PIXEL_COUNT / PIXELS_PER_ADDR;
    localparam int CAR1_ADDR_START  = BAR_ADDR_END + 1;
    localparam int CAR1_ADDR_END    = CAR1_ADDR_START + CAR1_ADDR_COUNT - 1;

    // Car2 區域
    localparam int CAR2_PIXEL_COUNT = IMAGE_SIZE * IMAGE_SIZE;
    localparam int CAR2_ADDR_COUNT  = CAR2_PIXEL_COUNT / PIXELS_PER_ADDR;
    localparam int CAR2_ADDR_START  = CAR1_ADDR_END + 1;
    localparam int CAR2_ADDR_END    = CAR2_ADDR_START + CAR2_ADDR_COUNT - 1;

    // 確保 SRAM 沒有溢出
    // initial begin
    //     if (CAR2_ADDR_END >= SRAM_TOTAL_ADDR) begin
    //         $fatal("SRAM 地址超出範圍！");
    //     end
    // end

endpackage
