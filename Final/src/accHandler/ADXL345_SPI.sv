module ADXL345_ONE_DIR (
    input i_clk,
    input i_rst_n,
    output o_CS,
    output o_SPC,
    output o_SDI,
    input i_SDO, 
    output [7:0] o_av
);
    // only read the y-axis
    
    reg CS, SPC, SDI;
    reg [1:0] state, state_nxt;
    reg [6:0] counter, counter_nxt;
    reg [7:0] arr, arr_nxt;
    reg [7:0] av, av_nxt;

    assign o_CS = CS;
    assign o_SPC = SPC;
    assign o_SDI = SDI;

    assign o_av = av;

    localparam [7:0] POWER_SETTINGS_REG_ADDR = {1'b0, 1'b0, 6'h2d}; // the first bit is write, the seconde bit is multibyte, the last 6 bits are the address (0x2D)
    localparam [7:0] POWER_SETTINGS_REG_VAL  = 8'b00001000; // 0x08, 4-wire SPI, full resolution, +/-2g, 10-bit mode

    localparam [7:0] RESOLUTION_SETTINGS_REG_ADDR = {1'b0, 1'b0, 6'h31}; // the first bit is write, the seconde bit is multibyte, the last 6 bits are the address (0x31)
    localparam [7:0] RESOLUTION_SETTINGS_REG_VAL  = 8'b00000100; // 0x00, 10-bit mode, left justified

    localparam [7:0] ACC_X_LSB_REG_ADDR = {1'b1, 1'b0, 6'h32}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x32)
    localparam [7:0] ACC_X_MSB_REG_ADDR = {1'b1, 1'b0, 6'h33}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x33)
    localparam [7:0] ACC_Y_LSB_REG_ADDR = {1'b1, 1'b0, 6'h34}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x34)
    localparam [7:0] ACC_Y_MSB_REG_ADDR = {1'b1, 1'b0, 6'h35}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x35)
    localparam [7:0] ACC_Z_LSB_REG_ADDR = {1'b1, 1'b0, 6'h36}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x36)
    localparam [7:0] ACC_Z_MSB_REG_ADDR = {1'b1, 1'b0, 6'h37}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x37)

    always_comb begin

        state_nxt = state;
        counter_nxt = counter + 1;
        CS = (counter <= 9);
        SPC = (counter <= 10) ? 1 : ~counter[0];
        SDI = 0;
        arr_nxt = arr;
        av_nxt = av;

        if (state == 0) begin  // measurement settings    
            case (counter)
                11 : SDI = POWER_SETTINGS_REG_ADDR[7];
                12 : SDI = POWER_SETTINGS_REG_ADDR[7];
                13 : SDI = POWER_SETTINGS_REG_ADDR[6];
                14 : SDI = POWER_SETTINGS_REG_ADDR[6];
                15 : SDI = POWER_SETTINGS_REG_ADDR[5];
                16 : SDI = POWER_SETTINGS_REG_ADDR[5];
                17 : SDI = POWER_SETTINGS_REG_ADDR[4];
                18 : SDI = POWER_SETTINGS_REG_ADDR[4];
                19 : SDI = POWER_SETTINGS_REG_ADDR[3];
                20 : SDI = POWER_SETTINGS_REG_ADDR[3];
                21 : SDI = POWER_SETTINGS_REG_ADDR[2];
                22 : SDI = POWER_SETTINGS_REG_ADDR[2];
                23 : SDI = POWER_SETTINGS_REG_ADDR[1];
                24 : SDI = POWER_SETTINGS_REG_ADDR[1];
                25 : SDI = POWER_SETTINGS_REG_ADDR[0];
                26 : SDI = POWER_SETTINGS_REG_ADDR[0];
                
                27 : SDI = POWER_SETTINGS_REG_VAL[7];
                28 : SDI = POWER_SETTINGS_REG_VAL[7];
                29 : SDI = POWER_SETTINGS_REG_VAL[6];
                30 : SDI = POWER_SETTINGS_REG_VAL[6];
                31 : SDI = POWER_SETTINGS_REG_VAL[5];
                32 : SDI = POWER_SETTINGS_REG_VAL[5];
                33 : SDI = POWER_SETTINGS_REG_VAL[4];
                34 : SDI = POWER_SETTINGS_REG_VAL[4];
                35 : SDI = POWER_SETTINGS_REG_VAL[3];
                36 : SDI = POWER_SETTINGS_REG_VAL[3];
                37 : SDI = POWER_SETTINGS_REG_VAL[2];
                38 : SDI = POWER_SETTINGS_REG_VAL[2];
                39 : SDI = POWER_SETTINGS_REG_VAL[1];
                40 : SDI = POWER_SETTINGS_REG_VAL[1];
                41 : SDI = POWER_SETTINGS_REG_VAL[0];
                42 : SDI = POWER_SETTINGS_REG_VAL[0];

                43 : begin SPC = 1; CS = 1; state_nxt = 1; counter_nxt = 0; end
            endcase
        end
        else if (state == 1) begin  // change to normal mode, executed once    
            case (counter)
                11 : SDI = RESOLUTION_SETTINGS_REG_ADDR[7];
                12 : SDI = RESOLUTION_SETTINGS_REG_ADDR[7];
                13 : SDI = RESOLUTION_SETTINGS_REG_ADDR[6];
                14 : SDI = RESOLUTION_SETTINGS_REG_ADDR[6];
                15 : SDI = RESOLUTION_SETTINGS_REG_ADDR[5];
                16 : SDI = RESOLUTION_SETTINGS_REG_ADDR[5];
                17 : SDI = RESOLUTION_SETTINGS_REG_ADDR[4];
                18 : SDI = RESOLUTION_SETTINGS_REG_ADDR[4];
                19 : SDI = RESOLUTION_SETTINGS_REG_ADDR[3];
                20 : SDI = RESOLUTION_SETTINGS_REG_ADDR[3];
                21 : SDI = RESOLUTION_SETTINGS_REG_ADDR[2];
                22 : SDI = RESOLUTION_SETTINGS_REG_ADDR[2];
                23 : SDI = RESOLUTION_SETTINGS_REG_ADDR[1];
                24 : SDI = RESOLUTION_SETTINGS_REG_ADDR[1];
                25 : SDI = RESOLUTION_SETTINGS_REG_ADDR[0];
                26 : SDI = RESOLUTION_SETTINGS_REG_ADDR[0];

                27 : SDI = RESOLUTION_SETTINGS_REG_VAL[7];
                28 : SDI = RESOLUTION_SETTINGS_REG_VAL[7];
                29 : SDI = RESOLUTION_SETTINGS_REG_VAL[6];
                30 : SDI = RESOLUTION_SETTINGS_REG_VAL[6];
                31 : SDI = RESOLUTION_SETTINGS_REG_VAL[5];
                32 : SDI = RESOLUTION_SETTINGS_REG_VAL[5];
                33 : SDI = RESOLUTION_SETTINGS_REG_VAL[4];
                34 : SDI = RESOLUTION_SETTINGS_REG_VAL[4];
                35 : SDI = RESOLUTION_SETTINGS_REG_VAL[3];
                36 : SDI = RESOLUTION_SETTINGS_REG_VAL[3];
                37 : SDI = RESOLUTION_SETTINGS_REG_VAL[2];
                38 : SDI = RESOLUTION_SETTINGS_REG_VAL[2];
                39 : SDI = RESOLUTION_SETTINGS_REG_VAL[1];
                40 : SDI = RESOLUTION_SETTINGS_REG_VAL[1];
                41 : SDI = RESOLUTION_SETTINGS_REG_VAL[0];
                42 : SDI = RESOLUTION_SETTINGS_REG_VAL[0];

                43 : begin SPC = 1; CS = 1; state_nxt = 2; counter_nxt = 0; end
            endcase
        end
        else begin// read OUT_DATAY1, infinite times
            case (counter)
                11 : SDI = ACC_Y_MSB_REG_ADDR[7];
                12 : SDI = ACC_Y_MSB_REG_ADDR[7];
                13 : SDI = ACC_Y_MSB_REG_ADDR[6];
                14 : SDI = ACC_Y_MSB_REG_ADDR[6];
                15 : SDI = ACC_Y_MSB_REG_ADDR[5];
                16 : SDI = ACC_Y_MSB_REG_ADDR[5];
                17 : SDI = ACC_Y_MSB_REG_ADDR[4];
                18 : SDI = ACC_Y_MSB_REG_ADDR[4];
                19 : SDI = ACC_Y_MSB_REG_ADDR[3];
                20 : SDI = ACC_Y_MSB_REG_ADDR[3];
                21 : SDI = ACC_Y_MSB_REG_ADDR[2];
                22 : SDI = ACC_Y_MSB_REG_ADDR[2];
                23 : SDI = ACC_Y_MSB_REG_ADDR[1];
                24 : SDI = ACC_Y_MSB_REG_ADDR[1];
                25 : SDI = ACC_Y_MSB_REG_ADDR[0];
                26 : SDI = ACC_Y_MSB_REG_ADDR[0];

                27 : arr_nxt[7] = i_SDO;
                29 : arr_nxt[6] = i_SDO;
                31 : arr_nxt[5] = i_SDO;
                33 : arr_nxt[4] = i_SDO;
                35 : arr_nxt[3] = i_SDO;
                37 : arr_nxt[2] = i_SDO;
                39 : arr_nxt[1] = i_SDO;
                41 : arr_nxt[0] = i_SDO;

                43 : begin SPC = 1; CS = 1; state_nxt = 2; counter_nxt = 0; av_nxt = arr; end
            endcase
        end
    end
        
    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            counter <= 0;
            arr <= 0;
            av <= 0;
            state <= 0;
        end
        else begin
            counter <= counter_nxt;
            arr <= arr_nxt;
            av <= av_nxt;
            state <= state_nxt;
        end
    end

endmodule

module ADXL345_TWO_DIR (
    input i_clk,
    input i_rst_n,
    output o_CS,
    output o_SPC,
    output o_SDI,
    input i_SDO, 
    output [7:0] o_av_x,
    output [7:0] o_av_y
);

    reg CS, SPC, SDI;
    reg [1:0] state, state_nxt;
    reg [6:0] counter, counter_nxt;
    reg [7:0] arr_x, arr_x_nxt;
    reg [7:0] arr_y, arr_y_nxt;
    reg [7:0] av_x, av_x_nxt;
    reg [7:0] av_y, av_y_nxt;

    assign o_CS = CS;
    assign o_SPC = SPC;
    assign o_SDI = SDI;

    assign o_av_x = av_x;
    assign o_av_y = av_y;

    localparam [7:0] POWER_SETTINGS_REG_ADDR = {1'b0, 1'b0, 6'h2d}; // the first bit is write, the seconde bit is multibyte, the last 6 bits are the address (0x2D)
    localparam [7:0] POWER_SETTINGS_REG_VAL  = 8'b00001000; // 0x08, 4-wire SPI, full resolution, +/-2g, 10-bit mode

    localparam [7:0] RESOLUTION_SETTINGS_REG_ADDR = {1'b0, 1'b0, 6'h31}; // the first bit is write, the seconde bit is multibyte, the last 6 bits are the address (0x31)
    localparam [7:0] RESOLUTION_SETTINGS_REG_VAL  = 8'b00000100; // 0x00, 10-bit mode, left justified

    localparam [7:0] ACC_X_LSB_REG_ADDR = {1'b1, 1'b0, 6'h32}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x32)
    localparam [7:0] ACC_X_MSB_REG_ADDR = {1'b1, 1'b0, 6'h33}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x33)
    localparam [7:0] ACC_Y_LSB_REG_ADDR = {1'b1, 1'b0, 6'h34}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x34)
    localparam [7:0] ACC_Y_MSB_REG_ADDR = {1'b1, 1'b0, 6'h35}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x35)
    localparam [7:0] ACC_Z_LSB_REG_ADDR = {1'b1, 1'b0, 6'h36}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x36)
    localparam [7:0] ACC_Z_MSB_REG_ADDR = {1'b1, 1'b0, 6'h37}; // the first bit is read, the seconde bit is multibyte, the last 6 bits are the address (0x37)

    always_comb begin

        state_nxt = state;
        counter_nxt = counter + 1;
        CS = (counter <= 9);
        SPC = (counter <= 10) ? 1 : ~counter[0];
        SDI = 0;
        arr_x_nxt = arr_x;
        arr_y_nxt = arr_y;
        av_x_nxt = av_x;
        av_y_nxt = av_y;

        if (state == 0) begin  // measurement settings    
            case (counter)

                11 : SDI = POWER_SETTINGS_REG_ADDR[7];
                12 : SDI = POWER_SETTINGS_REG_ADDR[7];
                13 : SDI = POWER_SETTINGS_REG_ADDR[6];
                14 : SDI = POWER_SETTINGS_REG_ADDR[6];
                15 : SDI = POWER_SETTINGS_REG_ADDR[5];
                16 : SDI = POWER_SETTINGS_REG_ADDR[5];
                17 : SDI = POWER_SETTINGS_REG_ADDR[4];
                18 : SDI = POWER_SETTINGS_REG_ADDR[4];
                19 : SDI = POWER_SETTINGS_REG_ADDR[3];
                20 : SDI = POWER_SETTINGS_REG_ADDR[3];
                21 : SDI = POWER_SETTINGS_REG_ADDR[2];
                22 : SDI = POWER_SETTINGS_REG_ADDR[2];
                23 : SDI = POWER_SETTINGS_REG_ADDR[1];
                24 : SDI = POWER_SETTINGS_REG_ADDR[1];
                25 : SDI = POWER_SETTINGS_REG_ADDR[0];
                26 : SDI = POWER_SETTINGS_REG_ADDR[0];
                
                27 : SDI = POWER_SETTINGS_REG_VAL[7];
                28 : SDI = POWER_SETTINGS_REG_VAL[7];
                29 : SDI = POWER_SETTINGS_REG_VAL[6];
                30 : SDI = POWER_SETTINGS_REG_VAL[6];
                31 : SDI = POWER_SETTINGS_REG_VAL[5];
                32 : SDI = POWER_SETTINGS_REG_VAL[5];
                33 : SDI = POWER_SETTINGS_REG_VAL[4];
                34 : SDI = POWER_SETTINGS_REG_VAL[4];
                35 : SDI = POWER_SETTINGS_REG_VAL[3];
                36 : SDI = POWER_SETTINGS_REG_VAL[3];
                37 : SDI = POWER_SETTINGS_REG_VAL[2];
                38 : SDI = POWER_SETTINGS_REG_VAL[2];
                39 : SDI = POWER_SETTINGS_REG_VAL[1];
                40 : SDI = POWER_SETTINGS_REG_VAL[1];
                41 : SDI = POWER_SETTINGS_REG_VAL[0];
                42 : SDI = POWER_SETTINGS_REG_VAL[0];

                43 : begin SPC = 1; CS = 1; state_nxt = 1; counter_nxt = 0; end
            endcase
        end
        else if (state == 1) begin  // change to normal mode, executed once    
            case (counter)
                11 : SDI = RESOLUTION_SETTINGS_REG_ADDR[7];
                12 : SDI = RESOLUTION_SETTINGS_REG_ADDR[7];
                13 : SDI = RESOLUTION_SETTINGS_REG_ADDR[6];
                14 : SDI = RESOLUTION_SETTINGS_REG_ADDR[6];
                15 : SDI = RESOLUTION_SETTINGS_REG_ADDR[5];
                16 : SDI = RESOLUTION_SETTINGS_REG_ADDR[5];
                17 : SDI = RESOLUTION_SETTINGS_REG_ADDR[4];
                18 : SDI = RESOLUTION_SETTINGS_REG_ADDR[4];
                19 : SDI = RESOLUTION_SETTINGS_REG_ADDR[3];
                20 : SDI = RESOLUTION_SETTINGS_REG_ADDR[3];
                21 : SDI = RESOLUTION_SETTINGS_REG_ADDR[2];
                22 : SDI = RESOLUTION_SETTINGS_REG_ADDR[2];
                23 : SDI = RESOLUTION_SETTINGS_REG_ADDR[1];
                24 : SDI = RESOLUTION_SETTINGS_REG_ADDR[1];
                25 : SDI = RESOLUTION_SETTINGS_REG_ADDR[0];
                26 : SDI = RESOLUTION_SETTINGS_REG_ADDR[0];

                27 : SDI = RESOLUTION_SETTINGS_REG_VAL[7];
                28 : SDI = RESOLUTION_SETTINGS_REG_VAL[7];
                29 : SDI = RESOLUTION_SETTINGS_REG_VAL[6];
                30 : SDI = RESOLUTION_SETTINGS_REG_VAL[6];
                31 : SDI = RESOLUTION_SETTINGS_REG_VAL[5];
                32 : SDI = RESOLUTION_SETTINGS_REG_VAL[5];
                33 : SDI = RESOLUTION_SETTINGS_REG_VAL[4];
                34 : SDI = RESOLUTION_SETTINGS_REG_VAL[4];
                35 : SDI = RESOLUTION_SETTINGS_REG_VAL[3];
                36 : SDI = RESOLUTION_SETTINGS_REG_VAL[3];
                37 : SDI = RESOLUTION_SETTINGS_REG_VAL[2];
                38 : SDI = RESOLUTION_SETTINGS_REG_VAL[2];
                39 : SDI = RESOLUTION_SETTINGS_REG_VAL[1];
                40 : SDI = RESOLUTION_SETTINGS_REG_VAL[1];
                41 : SDI = RESOLUTION_SETTINGS_REG_VAL[0];
                42 : SDI = RESOLUTION_SETTINGS_REG_VAL[0];

                43 : begin SPC = 1; CS = 1; state_nxt = 2; counter_nxt = 0; end
            endcase
        end
        else if (state == 2) begin// read OUT_DATAY1, infinite times
            case (counter)
                11 : SDI = ACC_X_MSB_REG_ADDR[7];
                12 : SDI = ACC_X_MSB_REG_ADDR[7];
                13 : SDI = ACC_X_MSB_REG_ADDR[6];
                14 : SDI = ACC_X_MSB_REG_ADDR[6];
                15 : SDI = ACC_X_MSB_REG_ADDR[5];
                16 : SDI = ACC_X_MSB_REG_ADDR[5];
                17 : SDI = ACC_X_MSB_REG_ADDR[4];
                18 : SDI = ACC_X_MSB_REG_ADDR[4];
                19 : SDI = ACC_X_MSB_REG_ADDR[3];
                20 : SDI = ACC_X_MSB_REG_ADDR[3];
                21 : SDI = ACC_X_MSB_REG_ADDR[2];
                22 : SDI = ACC_X_MSB_REG_ADDR[2];
                23 : SDI = ACC_X_MSB_REG_ADDR[1];
                24 : SDI = ACC_X_MSB_REG_ADDR[1];
                25 : SDI = ACC_X_MSB_REG_ADDR[0];
                26 : SDI = ACC_X_MSB_REG_ADDR[0];

                27 : arr_x_nxt[7] = i_SDO;
                29 : arr_x_nxt[6] = i_SDO;
                31 : arr_x_nxt[5] = i_SDO;
                33 : arr_x_nxt[4] = i_SDO;
                35 : arr_x_nxt[3] = i_SDO;
                37 : arr_x_nxt[2] = i_SDO;
                39 : arr_x_nxt[1] = i_SDO;
                41 : arr_x_nxt[0] = i_SDO;

                43 : begin SPC = 1; CS = 1; state_nxt = 3; counter_nxt = 0; av_x_nxt = arr_x; end
            endcase
        end
    else if (state == 3) begin// read OUT_DATAY1, infinite times
            case (counter)
                11 : SDI = ACC_Y_MSB_REG_ADDR[7];
                12 : SDI = ACC_Y_MSB_REG_ADDR[7];
                13 : SDI = ACC_Y_MSB_REG_ADDR[6];
                14 : SDI = ACC_Y_MSB_REG_ADDR[6];
                15 : SDI = ACC_Y_MSB_REG_ADDR[5];
                16 : SDI = ACC_Y_MSB_REG_ADDR[5];
                17 : SDI = ACC_Y_MSB_REG_ADDR[4];
                18 : SDI = ACC_Y_MSB_REG_ADDR[4];
                19 : SDI = ACC_Y_MSB_REG_ADDR[3];
                20 : SDI = ACC_Y_MSB_REG_ADDR[3];
                21 : SDI = ACC_Y_MSB_REG_ADDR[2];
                22 : SDI = ACC_Y_MSB_REG_ADDR[2];
                23 : SDI = ACC_Y_MSB_REG_ADDR[1];
                24 : SDI = ACC_Y_MSB_REG_ADDR[1];
                25 : SDI = ACC_Y_MSB_REG_ADDR[0];
                26 : SDI = ACC_Y_MSB_REG_ADDR[0];

                27 : arr_y_nxt[7] = i_SDO;
                29 : arr_y_nxt[6] = i_SDO;
                31 : arr_y_nxt[5] = i_SDO;
                33 : arr_y_nxt[4] = i_SDO;
                35 : arr_y_nxt[3] = i_SDO;
                37 : arr_y_nxt[2] = i_SDO;
                39 : arr_y_nxt[1] = i_SDO;
                41 : arr_y_nxt[0] = i_SDO;

                43 : begin SPC = 1; CS = 1; state_nxt = 2; counter_nxt = 0; av_y_nxt = arr_y; end
            endcase
        end
    end
        
    always_ff @(posedge i_clk or negedge i_rst_n) begin 
        if (!i_rst_n) begin
            counter <= 0;
            arr_x <= 0;
            arr_y <= 0;
            av_x <= 0;
            av_y <= 0;
            state <= 0;
        end
        else begin
            counter <= counter_nxt;
            arr_x <= arr_x_nxt;
            arr_y <= arr_y_nxt;
            av_x <= av_x_nxt;
            av_y <= av_y_nxt;
            state <= state_nxt;
        end
    end

endmodule