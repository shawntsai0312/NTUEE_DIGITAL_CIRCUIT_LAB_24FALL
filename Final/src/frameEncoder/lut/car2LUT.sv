module car2_lut(output reg [3:0] pixel_data [0:59][0:59]);
    initial begin
        pixel_data[0][0] = 0; // x=0, y=0, transparent
        pixel_data[0][1] = 0; // x=1, y=0, transparent
        pixel_data[0][2] = 0; // x=2, y=0, transparent
        pixel_data[0][3] = 0; // x=3, y=0, transparent
        pixel_data[0][4] = 0; // x=4, y=0, transparent
        pixel_data[0][5] = 0; // x=5, y=0, transparent
        pixel_data[0][6] = 0; // x=6, y=0, transparent
        pixel_data[0][7] = 0; // x=7, y=0, transparent
        pixel_data[0][8] = 0; // x=8, y=0, transparent
        pixel_data[0][9] = 0; // x=9, y=0, transparent
        pixel_data[0][10] = 0; // x=10, y=0, transparent
        pixel_data[0][11] = 0; // x=11, y=0, transparent
        pixel_data[0][12] = 0; // x=12, y=0, transparent
        pixel_data[0][13] = 0; // x=13, y=0, transparent
        pixel_data[0][14] = 0; // x=14, y=0, transparent
        pixel_data[0][15] = 0; // x=15, y=0, transparent
        pixel_data[0][16] = 0; // x=16, y=0, transparent
        pixel_data[0][17] = 0; // x=17, y=0, transparent
        pixel_data[0][18] = 0; // x=18, y=0, transparent
        pixel_data[0][19] = 0; // x=19, y=0, transparent
        pixel_data[0][20] = 0; // x=20, y=0, transparent
        pixel_data[0][21] = 0; // x=21, y=0, transparent
        pixel_data[0][22] = 0; // x=22, y=0, transparent
        pixel_data[0][23] = 0; // x=23, y=0, transparent
        pixel_data[0][24] = 0; // x=24, y=0, transparent
        pixel_data[0][25] = 0; // x=25, y=0, transparent
        pixel_data[0][26] = 0; // x=26, y=0, transparent
        pixel_data[0][27] = 0; // x=27, y=0, transparent
        pixel_data[0][28] = 0; // x=28, y=0, transparent
        pixel_data[0][29] = 0; // x=29, y=0, transparent
        pixel_data[0][30] = 0; // x=30, y=0, transparent
        pixel_data[0][31] = 0; // x=31, y=0, transparent
        pixel_data[0][32] = 0; // x=32, y=0, transparent
        pixel_data[0][33] = 0; // x=33, y=0, transparent
        pixel_data[0][34] = 0; // x=34, y=0, transparent
        pixel_data[0][35] = 0; // x=35, y=0, transparent
        pixel_data[0][36] = 0; // x=36, y=0, transparent
        pixel_data[0][37] = 0; // x=37, y=0, transparent
        pixel_data[0][38] = 0; // x=38, y=0, transparent
        pixel_data[0][39] = 0; // x=39, y=0, transparent
        pixel_data[0][40] = 0; // x=40, y=0, transparent
        pixel_data[0][41] = 0; // x=41, y=0, transparent
        pixel_data[0][42] = 0; // x=42, y=0, transparent
        pixel_data[0][43] = 0; // x=43, y=0, transparent
        pixel_data[0][44] = 0; // x=44, y=0, transparent
        pixel_data[0][45] = 0; // x=45, y=0, transparent
        pixel_data[0][46] = 0; // x=46, y=0, transparent
        pixel_data[0][47] = 0; // x=47, y=0, transparent
        pixel_data[0][48] = 0; // x=48, y=0, transparent
        pixel_data[0][49] = 0; // x=49, y=0, transparent
        pixel_data[0][50] = 0; // x=50, y=0, transparent
        pixel_data[0][51] = 0; // x=51, y=0, transparent
        pixel_data[0][52] = 0; // x=52, y=0, transparent
        pixel_data[0][53] = 0; // x=53, y=0, transparent
        pixel_data[0][54] = 0; // x=54, y=0, transparent
        pixel_data[0][55] = 0; // x=55, y=0, transparent
        pixel_data[0][56] = 0; // x=56, y=0, transparent
        pixel_data[0][57] = 0; // x=57, y=0, transparent
        pixel_data[0][58] = 0; // x=58, y=0, transparent
        pixel_data[0][59] = 0; // x=59, y=0, transparent
        pixel_data[1][0] = 0; // x=0, y=1, transparent
        pixel_data[1][1] = 0; // x=1, y=1, transparent
        pixel_data[1][2] = 0; // x=2, y=1, transparent
        pixel_data[1][3] = 0; // x=3, y=1, transparent
        pixel_data[1][4] = 0; // x=4, y=1, transparent
        pixel_data[1][5] = 0; // x=5, y=1, transparent
        pixel_data[1][6] = 0; // x=6, y=1, transparent
        pixel_data[1][7] = 0; // x=7, y=1, transparent
        pixel_data[1][8] = 0; // x=8, y=1, transparent
        pixel_data[1][9] = 0; // x=9, y=1, transparent
        pixel_data[1][10] = 0; // x=10, y=1, transparent
        pixel_data[1][11] = 0; // x=11, y=1, transparent
        pixel_data[1][12] = 0; // x=12, y=1, transparent
        pixel_data[1][13] = 0; // x=13, y=1, transparent
        pixel_data[1][14] = 0; // x=14, y=1, transparent
        pixel_data[1][15] = 0; // x=15, y=1, transparent
        pixel_data[1][16] = 0; // x=16, y=1, transparent
        pixel_data[1][17] = 0; // x=17, y=1, transparent
        pixel_data[1][18] = 0; // x=18, y=1, transparent
        pixel_data[1][19] = 0; // x=19, y=1, transparent
        pixel_data[1][20] = 0; // x=20, y=1, transparent
        pixel_data[1][21] = 0; // x=21, y=1, transparent
        pixel_data[1][22] = 0; // x=22, y=1, transparent
        pixel_data[1][23] = 0; // x=23, y=1, transparent
        pixel_data[1][24] = 0; // x=24, y=1, transparent
        pixel_data[1][25] = 0; // x=25, y=1, transparent
        pixel_data[1][26] = 0; // x=26, y=1, transparent
        pixel_data[1][27] = 0; // x=27, y=1, transparent
        pixel_data[1][28] = 0; // x=28, y=1, transparent
        pixel_data[1][29] = 0; // x=29, y=1, transparent
        pixel_data[1][30] = 0; // x=30, y=1, transparent
        pixel_data[1][31] = 0; // x=31, y=1, transparent
        pixel_data[1][32] = 0; // x=32, y=1, transparent
        pixel_data[1][33] = 0; // x=33, y=1, transparent
        pixel_data[1][34] = 0; // x=34, y=1, transparent
        pixel_data[1][35] = 0; // x=35, y=1, transparent
        pixel_data[1][36] = 0; // x=36, y=1, transparent
        pixel_data[1][37] = 0; // x=37, y=1, transparent
        pixel_data[1][38] = 0; // x=38, y=1, transparent
        pixel_data[1][39] = 0; // x=39, y=1, transparent
        pixel_data[1][40] = 0; // x=40, y=1, transparent
        pixel_data[1][41] = 0; // x=41, y=1, transparent
        pixel_data[1][42] = 0; // x=42, y=1, transparent
        pixel_data[1][43] = 0; // x=43, y=1, transparent
        pixel_data[1][44] = 0; // x=44, y=1, transparent
        pixel_data[1][45] = 0; // x=45, y=1, transparent
        pixel_data[1][46] = 0; // x=46, y=1, transparent
        pixel_data[1][47] = 0; // x=47, y=1, transparent
        pixel_data[1][48] = 0; // x=48, y=1, transparent
        pixel_data[1][49] = 0; // x=49, y=1, transparent
        pixel_data[1][50] = 0; // x=50, y=1, transparent
        pixel_data[1][51] = 0; // x=51, y=1, transparent
        pixel_data[1][52] = 0; // x=52, y=1, transparent
        pixel_data[1][53] = 0; // x=53, y=1, transparent
        pixel_data[1][54] = 0; // x=54, y=1, transparent
        pixel_data[1][55] = 0; // x=55, y=1, transparent
        pixel_data[1][56] = 0; // x=56, y=1, transparent
        pixel_data[1][57] = 0; // x=57, y=1, transparent
        pixel_data[1][58] = 0; // x=58, y=1, transparent
        pixel_data[1][59] = 0; // x=59, y=1, transparent
        pixel_data[2][0] = 0; // x=0, y=2, transparent
        pixel_data[2][1] = 0; // x=1, y=2, transparent
        pixel_data[2][2] = 0; // x=2, y=2, transparent
        pixel_data[2][3] = 0; // x=3, y=2, transparent
        pixel_data[2][4] = 0; // x=4, y=2, transparent
        pixel_data[2][5] = 0; // x=5, y=2, transparent
        pixel_data[2][6] = 0; // x=6, y=2, transparent
        pixel_data[2][7] = 0; // x=7, y=2, transparent
        pixel_data[2][8] = 0; // x=8, y=2, transparent
        pixel_data[2][9] = 0; // x=9, y=2, transparent
        pixel_data[2][10] = 0; // x=10, y=2, transparent
        pixel_data[2][11] = 0; // x=11, y=2, transparent
        pixel_data[2][12] = 0; // x=12, y=2, transparent
        pixel_data[2][13] = 0; // x=13, y=2, transparent
        pixel_data[2][14] = 0; // x=14, y=2, transparent
        pixel_data[2][15] = 0; // x=15, y=2, transparent
        pixel_data[2][16] = 0; // x=16, y=2, transparent
        pixel_data[2][17] = 0; // x=17, y=2, transparent
        pixel_data[2][18] = 0; // x=18, y=2, transparent
        pixel_data[2][19] = 0; // x=19, y=2, transparent
        pixel_data[2][20] = 0; // x=20, y=2, transparent
        pixel_data[2][21] = 0; // x=21, y=2, transparent
        pixel_data[2][22] = 0; // x=22, y=2, transparent
        pixel_data[2][23] = 0; // x=23, y=2, transparent
        pixel_data[2][24] = 0; // x=24, y=2, transparent
        pixel_data[2][25] = 0; // x=25, y=2, transparent
        pixel_data[2][26] = 0; // x=26, y=2, transparent
        pixel_data[2][27] = 0; // x=27, y=2, transparent
        pixel_data[2][28] = 0; // x=28, y=2, transparent
        pixel_data[2][29] = 0; // x=29, y=2, transparent
        pixel_data[2][30] = 0; // x=30, y=2, transparent
        pixel_data[2][31] = 0; // x=31, y=2, transparent
        pixel_data[2][32] = 0; // x=32, y=2, transparent
        pixel_data[2][33] = 0; // x=33, y=2, transparent
        pixel_data[2][34] = 0; // x=34, y=2, transparent
        pixel_data[2][35] = 0; // x=35, y=2, transparent
        pixel_data[2][36] = 0; // x=36, y=2, transparent
        pixel_data[2][37] = 0; // x=37, y=2, transparent
        pixel_data[2][38] = 0; // x=38, y=2, transparent
        pixel_data[2][39] = 0; // x=39, y=2, transparent
        pixel_data[2][40] = 0; // x=40, y=2, transparent
        pixel_data[2][41] = 0; // x=41, y=2, transparent
        pixel_data[2][42] = 0; // x=42, y=2, transparent
        pixel_data[2][43] = 0; // x=43, y=2, transparent
        pixel_data[2][44] = 0; // x=44, y=2, transparent
        pixel_data[2][45] = 0; // x=45, y=2, transparent
        pixel_data[2][46] = 0; // x=46, y=2, transparent
        pixel_data[2][47] = 0; // x=47, y=2, transparent
        pixel_data[2][48] = 0; // x=48, y=2, transparent
        pixel_data[2][49] = 0; // x=49, y=2, transparent
        pixel_data[2][50] = 0; // x=50, y=2, transparent
        pixel_data[2][51] = 0; // x=51, y=2, transparent
        pixel_data[2][52] = 0; // x=52, y=2, transparent
        pixel_data[2][53] = 0; // x=53, y=2, transparent
        pixel_data[2][54] = 0; // x=54, y=2, transparent
        pixel_data[2][55] = 0; // x=55, y=2, transparent
        pixel_data[2][56] = 0; // x=56, y=2, transparent
        pixel_data[2][57] = 0; // x=57, y=2, transparent
        pixel_data[2][58] = 0; // x=58, y=2, transparent
        pixel_data[2][59] = 0; // x=59, y=2, transparent
        pixel_data[3][0] = 0; // x=0, y=3, transparent
        pixel_data[3][1] = 0; // x=1, y=3, transparent
        pixel_data[3][2] = 0; // x=2, y=3, transparent
        pixel_data[3][3] = 0; // x=3, y=3, transparent
        pixel_data[3][4] = 0; // x=4, y=3, transparent
        pixel_data[3][5] = 0; // x=5, y=3, transparent
        pixel_data[3][6] = 0; // x=6, y=3, transparent
        pixel_data[3][7] = 0; // x=7, y=3, transparent
        pixel_data[3][8] = 0; // x=8, y=3, transparent
        pixel_data[3][9] = 0; // x=9, y=3, transparent
        pixel_data[3][10] = 0; // x=10, y=3, transparent
        pixel_data[3][11] = 0; // x=11, y=3, transparent
        pixel_data[3][12] = 0; // x=12, y=3, transparent
        pixel_data[3][13] = 0; // x=13, y=3, transparent
        pixel_data[3][14] = 0; // x=14, y=3, transparent
        pixel_data[3][15] = 0; // x=15, y=3, transparent
        pixel_data[3][16] = 0; // x=16, y=3, transparent
        pixel_data[3][17] = 0; // x=17, y=3, transparent
        pixel_data[3][18] = 0; // x=18, y=3, transparent
        pixel_data[3][19] = 0; // x=19, y=3, transparent
        pixel_data[3][20] = 0; // x=20, y=3, transparent
        pixel_data[3][21] = 0; // x=21, y=3, transparent
        pixel_data[3][22] = 0; // x=22, y=3, transparent
        pixel_data[3][23] = 0; // x=23, y=3, transparent
        pixel_data[3][24] = 0; // x=24, y=3, transparent
        pixel_data[3][25] = 0; // x=25, y=3, transparent
        pixel_data[3][26] = 0; // x=26, y=3, transparent
        pixel_data[3][27] = 0; // x=27, y=3, transparent
        pixel_data[3][28] = 0; // x=28, y=3, transparent
        pixel_data[3][29] = 0; // x=29, y=3, transparent
        pixel_data[3][30] = 0; // x=30, y=3, transparent
        pixel_data[3][31] = 0; // x=31, y=3, transparent
        pixel_data[3][32] = 0; // x=32, y=3, transparent
        pixel_data[3][33] = 0; // x=33, y=3, transparent
        pixel_data[3][34] = 0; // x=34, y=3, transparent
        pixel_data[3][35] = 0; // x=35, y=3, transparent
        pixel_data[3][36] = 0; // x=36, y=3, transparent
        pixel_data[3][37] = 0; // x=37, y=3, transparent
        pixel_data[3][38] = 0; // x=38, y=3, transparent
        pixel_data[3][39] = 0; // x=39, y=3, transparent
        pixel_data[3][40] = 0; // x=40, y=3, transparent
        pixel_data[3][41] = 0; // x=41, y=3, transparent
        pixel_data[3][42] = 0; // x=42, y=3, transparent
        pixel_data[3][43] = 0; // x=43, y=3, transparent
        pixel_data[3][44] = 0; // x=44, y=3, transparent
        pixel_data[3][45] = 0; // x=45, y=3, transparent
        pixel_data[3][46] = 0; // x=46, y=3, transparent
        pixel_data[3][47] = 0; // x=47, y=3, transparent
        pixel_data[3][48] = 0; // x=48, y=3, transparent
        pixel_data[3][49] = 0; // x=49, y=3, transparent
        pixel_data[3][50] = 0; // x=50, y=3, transparent
        pixel_data[3][51] = 0; // x=51, y=3, transparent
        pixel_data[3][52] = 0; // x=52, y=3, transparent
        pixel_data[3][53] = 0; // x=53, y=3, transparent
        pixel_data[3][54] = 0; // x=54, y=3, transparent
        pixel_data[3][55] = 0; // x=55, y=3, transparent
        pixel_data[3][56] = 0; // x=56, y=3, transparent
        pixel_data[3][57] = 0; // x=57, y=3, transparent
        pixel_data[3][58] = 0; // x=58, y=3, transparent
        pixel_data[3][59] = 0; // x=59, y=3, transparent
        pixel_data[4][0] = 0; // x=0, y=4, transparent
        pixel_data[4][1] = 0; // x=1, y=4, transparent
        pixel_data[4][2] = 0; // x=2, y=4, transparent
        pixel_data[4][3] = 0; // x=3, y=4, transparent
        pixel_data[4][4] = 0; // x=4, y=4, transparent
        pixel_data[4][5] = 0; // x=5, y=4, transparent
        pixel_data[4][6] = 0; // x=6, y=4, transparent
        pixel_data[4][7] = 0; // x=7, y=4, transparent
        pixel_data[4][8] = 0; // x=8, y=4, transparent
        pixel_data[4][9] = 0; // x=9, y=4, transparent
        pixel_data[4][10] = 0; // x=10, y=4, transparent
        pixel_data[4][11] = 0; // x=11, y=4, transparent
        pixel_data[4][12] = 0; // x=12, y=4, transparent
        pixel_data[4][13] = 0; // x=13, y=4, transparent
        pixel_data[4][14] = 0; // x=14, y=4, transparent
        pixel_data[4][15] = 0; // x=15, y=4, transparent
        pixel_data[4][16] = 0; // x=16, y=4, transparent
        pixel_data[4][17] = 0; // x=17, y=4, transparent
        pixel_data[4][18] = 0; // x=18, y=4, transparent
        pixel_data[4][19] = 0; // x=19, y=4, transparent
        pixel_data[4][20] = 0; // x=20, y=4, transparent
        pixel_data[4][21] = 0; // x=21, y=4, transparent
        pixel_data[4][22] = 0; // x=22, y=4, transparent
        pixel_data[4][23] = 0; // x=23, y=4, transparent
        pixel_data[4][24] = 0; // x=24, y=4, transparent
        pixel_data[4][25] = 0; // x=25, y=4, transparent
        pixel_data[4][26] = 0; // x=26, y=4, transparent
        pixel_data[4][27] = 0; // x=27, y=4, transparent
        pixel_data[4][28] = 0; // x=28, y=4, transparent
        pixel_data[4][29] = 0; // x=29, y=4, transparent
        pixel_data[4][30] = 0; // x=30, y=4, transparent
        pixel_data[4][31] = 0; // x=31, y=4, transparent
        pixel_data[4][32] = 0; // x=32, y=4, transparent
        pixel_data[4][33] = 0; // x=33, y=4, transparent
        pixel_data[4][34] = 0; // x=34, y=4, transparent
        pixel_data[4][35] = 0; // x=35, y=4, transparent
        pixel_data[4][36] = 0; // x=36, y=4, transparent
        pixel_data[4][37] = 0; // x=37, y=4, transparent
        pixel_data[4][38] = 0; // x=38, y=4, transparent
        pixel_data[4][39] = 0; // x=39, y=4, transparent
        pixel_data[4][40] = 0; // x=40, y=4, transparent
        pixel_data[4][41] = 0; // x=41, y=4, transparent
        pixel_data[4][42] = 0; // x=42, y=4, transparent
        pixel_data[4][43] = 0; // x=43, y=4, transparent
        pixel_data[4][44] = 0; // x=44, y=4, transparent
        pixel_data[4][45] = 0; // x=45, y=4, transparent
        pixel_data[4][46] = 0; // x=46, y=4, transparent
        pixel_data[4][47] = 0; // x=47, y=4, transparent
        pixel_data[4][48] = 0; // x=48, y=4, transparent
        pixel_data[4][49] = 0; // x=49, y=4, transparent
        pixel_data[4][50] = 0; // x=50, y=4, transparent
        pixel_data[4][51] = 0; // x=51, y=4, transparent
        pixel_data[4][52] = 0; // x=52, y=4, transparent
        pixel_data[4][53] = 0; // x=53, y=4, transparent
        pixel_data[4][54] = 0; // x=54, y=4, transparent
        pixel_data[4][55] = 0; // x=55, y=4, transparent
        pixel_data[4][56] = 0; // x=56, y=4, transparent
        pixel_data[4][57] = 0; // x=57, y=4, transparent
        pixel_data[4][58] = 0; // x=58, y=4, transparent
        pixel_data[4][59] = 0; // x=59, y=4, transparent
        pixel_data[5][0] = 0; // x=0, y=5, transparent
        pixel_data[5][1] = 0; // x=1, y=5, transparent
        pixel_data[5][2] = 0; // x=2, y=5, transparent
        pixel_data[5][3] = 0; // x=3, y=5, transparent
        pixel_data[5][4] = 0; // x=4, y=5, transparent
        pixel_data[5][5] = 0; // x=5, y=5, transparent
        pixel_data[5][6] = 0; // x=6, y=5, transparent
        pixel_data[5][7] = 0; // x=7, y=5, transparent
        pixel_data[5][8] = 0; // x=8, y=5, transparent
        pixel_data[5][9] = 0; // x=9, y=5, transparent
        pixel_data[5][10] = 0; // x=10, y=5, transparent
        pixel_data[5][11] = 0; // x=11, y=5, transparent
        pixel_data[5][12] = 0; // x=12, y=5, transparent
        pixel_data[5][13] = 0; // x=13, y=5, transparent
        pixel_data[5][14] = 0; // x=14, y=5, transparent
        pixel_data[5][15] = 0; // x=15, y=5, transparent
        pixel_data[5][16] = 0; // x=16, y=5, transparent
        pixel_data[5][17] = 0; // x=17, y=5, transparent
        pixel_data[5][18] = 0; // x=18, y=5, transparent
        pixel_data[5][19] = 0; // x=19, y=5, transparent
        pixel_data[5][20] = 0; // x=20, y=5, transparent
        pixel_data[5][21] = 0; // x=21, y=5, transparent
        pixel_data[5][22] = 0; // x=22, y=5, transparent
        pixel_data[5][23] = 0; // x=23, y=5, transparent
        pixel_data[5][24] = 0; // x=24, y=5, transparent
        pixel_data[5][25] = 0; // x=25, y=5, transparent
        pixel_data[5][26] = 0; // x=26, y=5, transparent
        pixel_data[5][27] = 0; // x=27, y=5, transparent
        pixel_data[5][28] = 0; // x=28, y=5, transparent
        pixel_data[5][29] = 0; // x=29, y=5, transparent
        pixel_data[5][30] = 0; // x=30, y=5, transparent
        pixel_data[5][31] = 0; // x=31, y=5, transparent
        pixel_data[5][32] = 0; // x=32, y=5, transparent
        pixel_data[5][33] = 0; // x=33, y=5, transparent
        pixel_data[5][34] = 0; // x=34, y=5, transparent
        pixel_data[5][35] = 0; // x=35, y=5, transparent
        pixel_data[5][36] = 0; // x=36, y=5, transparent
        pixel_data[5][37] = 0; // x=37, y=5, transparent
        pixel_data[5][38] = 0; // x=38, y=5, transparent
        pixel_data[5][39] = 0; // x=39, y=5, transparent
        pixel_data[5][40] = 0; // x=40, y=5, transparent
        pixel_data[5][41] = 0; // x=41, y=5, transparent
        pixel_data[5][42] = 0; // x=42, y=5, transparent
        pixel_data[5][43] = 0; // x=43, y=5, transparent
        pixel_data[5][44] = 0; // x=44, y=5, transparent
        pixel_data[5][45] = 0; // x=45, y=5, transparent
        pixel_data[5][46] = 0; // x=46, y=5, transparent
        pixel_data[5][47] = 0; // x=47, y=5, transparent
        pixel_data[5][48] = 0; // x=48, y=5, transparent
        pixel_data[5][49] = 0; // x=49, y=5, transparent
        pixel_data[5][50] = 0; // x=50, y=5, transparent
        pixel_data[5][51] = 0; // x=51, y=5, transparent
        pixel_data[5][52] = 0; // x=52, y=5, transparent
        pixel_data[5][53] = 0; // x=53, y=5, transparent
        pixel_data[5][54] = 0; // x=54, y=5, transparent
        pixel_data[5][55] = 0; // x=55, y=5, transparent
        pixel_data[5][56] = 0; // x=56, y=5, transparent
        pixel_data[5][57] = 0; // x=57, y=5, transparent
        pixel_data[5][58] = 0; // x=58, y=5, transparent
        pixel_data[5][59] = 0; // x=59, y=5, transparent
        pixel_data[6][0] = 0; // x=0, y=6, transparent
        pixel_data[6][1] = 0; // x=1, y=6, transparent
        pixel_data[6][2] = 0; // x=2, y=6, transparent
        pixel_data[6][3] = 0; // x=3, y=6, transparent
        pixel_data[6][4] = 0; // x=4, y=6, transparent
        pixel_data[6][5] = 0; // x=5, y=6, transparent
        pixel_data[6][6] = 0; // x=6, y=6, transparent
        pixel_data[6][7] = 0; // x=7, y=6, transparent
        pixel_data[6][8] = 0; // x=8, y=6, transparent
        pixel_data[6][9] = 0; // x=9, y=6, transparent
        pixel_data[6][10] = 0; // x=10, y=6, transparent
        pixel_data[6][11] = 0; // x=11, y=6, transparent
        pixel_data[6][12] = 0; // x=12, y=6, transparent
        pixel_data[6][13] = 0; // x=13, y=6, transparent
        pixel_data[6][14] = 0; // x=14, y=6, transparent
        pixel_data[6][15] = 0; // x=15, y=6, transparent
        pixel_data[6][16] = 0; // x=16, y=6, transparent
        pixel_data[6][17] = 0; // x=17, y=6, transparent
        pixel_data[6][18] = 0; // x=18, y=6, transparent
        pixel_data[6][19] = 0; // x=19, y=6, transparent
        pixel_data[6][20] = 0; // x=20, y=6, transparent
        pixel_data[6][21] = 0; // x=21, y=6, transparent
        pixel_data[6][22] = 0; // x=22, y=6, transparent
        pixel_data[6][23] = 0; // x=23, y=6, transparent
        pixel_data[6][24] = 0; // x=24, y=6, transparent
        pixel_data[6][25] = 0; // x=25, y=6, transparent
        pixel_data[6][26] = 0; // x=26, y=6, transparent
        pixel_data[6][27] = 0; // x=27, y=6, transparent
        pixel_data[6][28] = 0; // x=28, y=6, transparent
        pixel_data[6][29] = 0; // x=29, y=6, transparent
        pixel_data[6][30] = 0; // x=30, y=6, transparent
        pixel_data[6][31] = 0; // x=31, y=6, transparent
        pixel_data[6][32] = 0; // x=32, y=6, transparent
        pixel_data[6][33] = 0; // x=33, y=6, transparent
        pixel_data[6][34] = 0; // x=34, y=6, transparent
        pixel_data[6][35] = 0; // x=35, y=6, transparent
        pixel_data[6][36] = 0; // x=36, y=6, transparent
        pixel_data[6][37] = 0; // x=37, y=6, transparent
        pixel_data[6][38] = 0; // x=38, y=6, transparent
        pixel_data[6][39] = 0; // x=39, y=6, transparent
        pixel_data[6][40] = 0; // x=40, y=6, transparent
        pixel_data[6][41] = 0; // x=41, y=6, transparent
        pixel_data[6][42] = 0; // x=42, y=6, transparent
        pixel_data[6][43] = 0; // x=43, y=6, transparent
        pixel_data[6][44] = 0; // x=44, y=6, transparent
        pixel_data[6][45] = 0; // x=45, y=6, transparent
        pixel_data[6][46] = 0; // x=46, y=6, transparent
        pixel_data[6][47] = 0; // x=47, y=6, transparent
        pixel_data[6][48] = 0; // x=48, y=6, transparent
        pixel_data[6][49] = 0; // x=49, y=6, transparent
        pixel_data[6][50] = 0; // x=50, y=6, transparent
        pixel_data[6][51] = 0; // x=51, y=6, transparent
        pixel_data[6][52] = 0; // x=52, y=6, transparent
        pixel_data[6][53] = 0; // x=53, y=6, transparent
        pixel_data[6][54] = 0; // x=54, y=6, transparent
        pixel_data[6][55] = 0; // x=55, y=6, transparent
        pixel_data[6][56] = 0; // x=56, y=6, transparent
        pixel_data[6][57] = 0; // x=57, y=6, transparent
        pixel_data[6][58] = 0; // x=58, y=6, transparent
        pixel_data[6][59] = 0; // x=59, y=6, transparent
        pixel_data[7][0] = 0; // x=0, y=7, transparent
        pixel_data[7][1] = 0; // x=1, y=7, transparent
        pixel_data[7][2] = 0; // x=2, y=7, transparent
        pixel_data[7][3] = 0; // x=3, y=7, transparent
        pixel_data[7][4] = 0; // x=4, y=7, transparent
        pixel_data[7][5] = 0; // x=5, y=7, transparent
        pixel_data[7][6] = 0; // x=6, y=7, transparent
        pixel_data[7][7] = 0; // x=7, y=7, transparent
        pixel_data[7][8] = 0; // x=8, y=7, transparent
        pixel_data[7][9] = 0; // x=9, y=7, transparent
        pixel_data[7][10] = 0; // x=10, y=7, transparent
        pixel_data[7][11] = 0; // x=11, y=7, transparent
        pixel_data[7][12] = 0; // x=12, y=7, transparent
        pixel_data[7][13] = 0; // x=13, y=7, transparent
        pixel_data[7][14] = 0; // x=14, y=7, transparent
        pixel_data[7][15] = 0; // x=15, y=7, transparent
        pixel_data[7][16] = 0; // x=16, y=7, transparent
        pixel_data[7][17] = 0; // x=17, y=7, transparent
        pixel_data[7][18] = 0; // x=18, y=7, transparent
        pixel_data[7][19] = 0; // x=19, y=7, transparent
        pixel_data[7][20] = 0; // x=20, y=7, transparent
        pixel_data[7][21] = 0; // x=21, y=7, transparent
        pixel_data[7][22] = 0; // x=22, y=7, transparent
        pixel_data[7][23] = 0; // x=23, y=7, transparent
        pixel_data[7][24] = 0; // x=24, y=7, transparent
        pixel_data[7][25] = 0; // x=25, y=7, transparent
        pixel_data[7][26] = 0; // x=26, y=7, transparent
        pixel_data[7][27] = 0; // x=27, y=7, transparent
        pixel_data[7][28] = 0; // x=28, y=7, transparent
        pixel_data[7][29] = 0; // x=29, y=7, transparent
        pixel_data[7][30] = 0; // x=30, y=7, transparent
        pixel_data[7][31] = 0; // x=31, y=7, transparent
        pixel_data[7][32] = 0; // x=32, y=7, transparent
        pixel_data[7][33] = 0; // x=33, y=7, transparent
        pixel_data[7][34] = 0; // x=34, y=7, transparent
        pixel_data[7][35] = 0; // x=35, y=7, transparent
        pixel_data[7][36] = 0; // x=36, y=7, transparent
        pixel_data[7][37] = 0; // x=37, y=7, transparent
        pixel_data[7][38] = 0; // x=38, y=7, transparent
        pixel_data[7][39] = 0; // x=39, y=7, transparent
        pixel_data[7][40] = 0; // x=40, y=7, transparent
        pixel_data[7][41] = 0; // x=41, y=7, transparent
        pixel_data[7][42] = 0; // x=42, y=7, transparent
        pixel_data[7][43] = 0; // x=43, y=7, transparent
        pixel_data[7][44] = 0; // x=44, y=7, transparent
        pixel_data[7][45] = 0; // x=45, y=7, transparent
        pixel_data[7][46] = 0; // x=46, y=7, transparent
        pixel_data[7][47] = 0; // x=47, y=7, transparent
        pixel_data[7][48] = 0; // x=48, y=7, transparent
        pixel_data[7][49] = 0; // x=49, y=7, transparent
        pixel_data[7][50] = 0; // x=50, y=7, transparent
        pixel_data[7][51] = 0; // x=51, y=7, transparent
        pixel_data[7][52] = 0; // x=52, y=7, transparent
        pixel_data[7][53] = 0; // x=53, y=7, transparent
        pixel_data[7][54] = 0; // x=54, y=7, transparent
        pixel_data[7][55] = 0; // x=55, y=7, transparent
        pixel_data[7][56] = 0; // x=56, y=7, transparent
        pixel_data[7][57] = 0; // x=57, y=7, transparent
        pixel_data[7][58] = 0; // x=58, y=7, transparent
        pixel_data[7][59] = 0; // x=59, y=7, transparent
        pixel_data[8][0] = 0; // x=0, y=8, transparent
        pixel_data[8][1] = 0; // x=1, y=8, transparent
        pixel_data[8][2] = 0; // x=2, y=8, transparent
        pixel_data[8][3] = 0; // x=3, y=8, transparent
        pixel_data[8][4] = 0; // x=4, y=8, transparent
        pixel_data[8][5] = 0; // x=5, y=8, transparent
        pixel_data[8][6] = 0; // x=6, y=8, transparent
        pixel_data[8][7] = 0; // x=7, y=8, transparent
        pixel_data[8][8] = 0; // x=8, y=8, transparent
        pixel_data[8][9] = 0; // x=9, y=8, transparent
        pixel_data[8][10] = 0; // x=10, y=8, transparent
        pixel_data[8][11] = 0; // x=11, y=8, transparent
        pixel_data[8][12] = 0; // x=12, y=8, transparent
        pixel_data[8][13] = 0; // x=13, y=8, transparent
        pixel_data[8][14] = 0; // x=14, y=8, transparent
        pixel_data[8][15] = 0; // x=15, y=8, transparent
        pixel_data[8][16] = 0; // x=16, y=8, transparent
        pixel_data[8][17] = 0; // x=17, y=8, transparent
        pixel_data[8][18] = 0; // x=18, y=8, transparent
        pixel_data[8][19] = 0; // x=19, y=8, transparent
        pixel_data[8][20] = 0; // x=20, y=8, transparent
        pixel_data[8][21] = 0; // x=21, y=8, transparent
        pixel_data[8][22] = 0; // x=22, y=8, transparent
        pixel_data[8][23] = 0; // x=23, y=8, transparent
        pixel_data[8][24] = 0; // x=24, y=8, transparent
        pixel_data[8][25] = 0; // x=25, y=8, transparent
        pixel_data[8][26] = 0; // x=26, y=8, transparent
        pixel_data[8][27] = 0; // x=27, y=8, transparent
        pixel_data[8][28] = 0; // x=28, y=8, transparent
        pixel_data[8][29] = 0; // x=29, y=8, transparent
        pixel_data[8][30] = 0; // x=30, y=8, transparent
        pixel_data[8][31] = 0; // x=31, y=8, transparent
        pixel_data[8][32] = 0; // x=32, y=8, transparent
        pixel_data[8][33] = 0; // x=33, y=8, transparent
        pixel_data[8][34] = 0; // x=34, y=8, transparent
        pixel_data[8][35] = 0; // x=35, y=8, transparent
        pixel_data[8][36] = 0; // x=36, y=8, transparent
        pixel_data[8][37] = 0; // x=37, y=8, transparent
        pixel_data[8][38] = 0; // x=38, y=8, transparent
        pixel_data[8][39] = 0; // x=39, y=8, transparent
        pixel_data[8][40] = 0; // x=40, y=8, transparent
        pixel_data[8][41] = 0; // x=41, y=8, transparent
        pixel_data[8][42] = 0; // x=42, y=8, transparent
        pixel_data[8][43] = 0; // x=43, y=8, transparent
        pixel_data[8][44] = 0; // x=44, y=8, transparent
        pixel_data[8][45] = 0; // x=45, y=8, transparent
        pixel_data[8][46] = 0; // x=46, y=8, transparent
        pixel_data[8][47] = 0; // x=47, y=8, transparent
        pixel_data[8][48] = 0; // x=48, y=8, transparent
        pixel_data[8][49] = 0; // x=49, y=8, transparent
        pixel_data[8][50] = 0; // x=50, y=8, transparent
        pixel_data[8][51] = 0; // x=51, y=8, transparent
        pixel_data[8][52] = 0; // x=52, y=8, transparent
        pixel_data[8][53] = 0; // x=53, y=8, transparent
        pixel_data[8][54] = 0; // x=54, y=8, transparent
        pixel_data[8][55] = 0; // x=55, y=8, transparent
        pixel_data[8][56] = 0; // x=56, y=8, transparent
        pixel_data[8][57] = 0; // x=57, y=8, transparent
        pixel_data[8][58] = 0; // x=58, y=8, transparent
        pixel_data[8][59] = 0; // x=59, y=8, transparent
        pixel_data[9][0] = 0; // x=0, y=9, transparent
        pixel_data[9][1] = 0; // x=1, y=9, transparent
        pixel_data[9][2] = 0; // x=2, y=9, transparent
        pixel_data[9][3] = 0; // x=3, y=9, transparent
        pixel_data[9][4] = 0; // x=4, y=9, transparent
        pixel_data[9][5] = 0; // x=5, y=9, transparent
        pixel_data[9][6] = 0; // x=6, y=9, transparent
        pixel_data[9][7] = 0; // x=7, y=9, transparent
        pixel_data[9][8] = 0; // x=8, y=9, transparent
        pixel_data[9][9] = 0; // x=9, y=9, transparent
        pixel_data[9][10] = 0; // x=10, y=9, transparent
        pixel_data[9][11] = 0; // x=11, y=9, transparent
        pixel_data[9][12] = 0; // x=12, y=9, transparent
        pixel_data[9][13] = 0; // x=13, y=9, transparent
        pixel_data[9][14] = 0; // x=14, y=9, transparent
        pixel_data[9][15] = 0; // x=15, y=9, transparent
        pixel_data[9][16] = 0; // x=16, y=9, transparent
        pixel_data[9][17] = 0; // x=17, y=9, transparent
        pixel_data[9][18] = 0; // x=18, y=9, transparent
        pixel_data[9][19] = 0; // x=19, y=9, transparent
        pixel_data[9][20] = 0; // x=20, y=9, transparent
        pixel_data[9][21] = 0; // x=21, y=9, transparent
        pixel_data[9][22] = 0; // x=22, y=9, transparent
        pixel_data[9][23] = 0; // x=23, y=9, transparent
        pixel_data[9][24] = 0; // x=24, y=9, transparent
        pixel_data[9][25] = 0; // x=25, y=9, transparent
        pixel_data[9][26] = 0; // x=26, y=9, transparent
        pixel_data[9][27] = 0; // x=27, y=9, transparent
        pixel_data[9][28] = 0; // x=28, y=9, transparent
        pixel_data[9][29] = 0; // x=29, y=9, transparent
        pixel_data[9][30] = 0; // x=30, y=9, transparent
        pixel_data[9][31] = 0; // x=31, y=9, transparent
        pixel_data[9][32] = 0; // x=32, y=9, transparent
        pixel_data[9][33] = 0; // x=33, y=9, transparent
        pixel_data[9][34] = 0; // x=34, y=9, transparent
        pixel_data[9][35] = 0; // x=35, y=9, transparent
        pixel_data[9][36] = 0; // x=36, y=9, transparent
        pixel_data[9][37] = 0; // x=37, y=9, transparent
        pixel_data[9][38] = 0; // x=38, y=9, transparent
        pixel_data[9][39] = 0; // x=39, y=9, transparent
        pixel_data[9][40] = 0; // x=40, y=9, transparent
        pixel_data[9][41] = 0; // x=41, y=9, transparent
        pixel_data[9][42] = 0; // x=42, y=9, transparent
        pixel_data[9][43] = 0; // x=43, y=9, transparent
        pixel_data[9][44] = 0; // x=44, y=9, transparent
        pixel_data[9][45] = 0; // x=45, y=9, transparent
        pixel_data[9][46] = 0; // x=46, y=9, transparent
        pixel_data[9][47] = 0; // x=47, y=9, transparent
        pixel_data[9][48] = 0; // x=48, y=9, transparent
        pixel_data[9][49] = 0; // x=49, y=9, transparent
        pixel_data[9][50] = 0; // x=50, y=9, transparent
        pixel_data[9][51] = 0; // x=51, y=9, transparent
        pixel_data[9][52] = 0; // x=52, y=9, transparent
        pixel_data[9][53] = 0; // x=53, y=9, transparent
        pixel_data[9][54] = 0; // x=54, y=9, transparent
        pixel_data[9][55] = 0; // x=55, y=9, transparent
        pixel_data[9][56] = 0; // x=56, y=9, transparent
        pixel_data[9][57] = 0; // x=57, y=9, transparent
        pixel_data[9][58] = 0; // x=58, y=9, transparent
        pixel_data[9][59] = 0; // x=59, y=9, transparent
        pixel_data[10][0] = 0; // x=0, y=10, transparent
        pixel_data[10][1] = 0; // x=1, y=10, transparent
        pixel_data[10][2] = 0; // x=2, y=10, transparent
        pixel_data[10][3] = 0; // x=3, y=10, transparent
        pixel_data[10][4] = 0; // x=4, y=10, transparent
        pixel_data[10][5] = 0; // x=5, y=10, transparent
        pixel_data[10][6] = 0; // x=6, y=10, transparent
        pixel_data[10][7] = 0; // x=7, y=10, transparent
        pixel_data[10][8] = 0; // x=8, y=10, transparent
        pixel_data[10][9] = 0; // x=9, y=10, transparent
        pixel_data[10][10] = 0; // x=10, y=10, transparent
        pixel_data[10][11] = 0; // x=11, y=10, transparent
        pixel_data[10][12] = 0; // x=12, y=10, transparent
        pixel_data[10][13] = 0; // x=13, y=10, transparent
        pixel_data[10][14] = 0; // x=14, y=10, transparent
        pixel_data[10][15] = 0; // x=15, y=10, transparent
        pixel_data[10][16] = 0; // x=16, y=10, transparent
        pixel_data[10][17] = 0; // x=17, y=10, transparent
        pixel_data[10][18] = 0; // x=18, y=10, transparent
        pixel_data[10][19] = 0; // x=19, y=10, transparent
        pixel_data[10][20] = 0; // x=20, y=10, transparent
        pixel_data[10][21] = 0; // x=21, y=10, transparent
        pixel_data[10][22] = 0; // x=22, y=10, transparent
        pixel_data[10][23] = 0; // x=23, y=10, transparent
        pixel_data[10][24] = 0; // x=24, y=10, transparent
        pixel_data[10][25] = 0; // x=25, y=10, transparent
        pixel_data[10][26] = 0; // x=26, y=10, transparent
        pixel_data[10][27] = 0; // x=27, y=10, transparent
        pixel_data[10][28] = 0; // x=28, y=10, transparent
        pixel_data[10][29] = 0; // x=29, y=10, transparent
        pixel_data[10][30] = 0; // x=30, y=10, transparent
        pixel_data[10][31] = 0; // x=31, y=10, transparent
        pixel_data[10][32] = 0; // x=32, y=10, transparent
        pixel_data[10][33] = 0; // x=33, y=10, transparent
        pixel_data[10][34] = 0; // x=34, y=10, transparent
        pixel_data[10][35] = 0; // x=35, y=10, transparent
        pixel_data[10][36] = 0; // x=36, y=10, transparent
        pixel_data[10][37] = 0; // x=37, y=10, transparent
        pixel_data[10][38] = 0; // x=38, y=10, transparent
        pixel_data[10][39] = 0; // x=39, y=10, transparent
        pixel_data[10][40] = 0; // x=40, y=10, transparent
        pixel_data[10][41] = 0; // x=41, y=10, transparent
        pixel_data[10][42] = 0; // x=42, y=10, transparent
        pixel_data[10][43] = 0; // x=43, y=10, transparent
        pixel_data[10][44] = 0; // x=44, y=10, transparent
        pixel_data[10][45] = 0; // x=45, y=10, transparent
        pixel_data[10][46] = 0; // x=46, y=10, transparent
        pixel_data[10][47] = 0; // x=47, y=10, transparent
        pixel_data[10][48] = 0; // x=48, y=10, transparent
        pixel_data[10][49] = 0; // x=49, y=10, transparent
        pixel_data[10][50] = 0; // x=50, y=10, transparent
        pixel_data[10][51] = 0; // x=51, y=10, transparent
        pixel_data[10][52] = 0; // x=52, y=10, transparent
        pixel_data[10][53] = 0; // x=53, y=10, transparent
        pixel_data[10][54] = 0; // x=54, y=10, transparent
        pixel_data[10][55] = 0; // x=55, y=10, transparent
        pixel_data[10][56] = 0; // x=56, y=10, transparent
        pixel_data[10][57] = 0; // x=57, y=10, transparent
        pixel_data[10][58] = 0; // x=58, y=10, transparent
        pixel_data[10][59] = 0; // x=59, y=10, transparent
        pixel_data[11][0] = 0; // x=0, y=11, transparent
        pixel_data[11][1] = 0; // x=1, y=11, transparent
        pixel_data[11][2] = 0; // x=2, y=11, transparent
        pixel_data[11][3] = 0; // x=3, y=11, transparent
        pixel_data[11][4] = 0; // x=4, y=11, transparent
        pixel_data[11][5] = 0; // x=5, y=11, transparent
        pixel_data[11][6] = 0; // x=6, y=11, transparent
        pixel_data[11][7] = 0; // x=7, y=11, transparent
        pixel_data[11][8] = 0; // x=8, y=11, transparent
        pixel_data[11][9] = 0; // x=9, y=11, transparent
        pixel_data[11][10] = 0; // x=10, y=11, transparent
        pixel_data[11][11] = 0; // x=11, y=11, transparent
        pixel_data[11][12] = 0; // x=12, y=11, transparent
        pixel_data[11][13] = 0; // x=13, y=11, transparent
        pixel_data[11][14] = 0; // x=14, y=11, transparent
        pixel_data[11][15] = 0; // x=15, y=11, transparent
        pixel_data[11][16] = 0; // x=16, y=11, transparent
        pixel_data[11][17] = 0; // x=17, y=11, transparent
        pixel_data[11][18] = 0; // x=18, y=11, transparent
        pixel_data[11][19] = 0; // x=19, y=11, transparent
        pixel_data[11][20] = 0; // x=20, y=11, transparent
        pixel_data[11][21] = 0; // x=21, y=11, transparent
        pixel_data[11][22] = 0; // x=22, y=11, transparent
        pixel_data[11][23] = 0; // x=23, y=11, transparent
        pixel_data[11][24] = 0; // x=24, y=11, transparent
        pixel_data[11][25] = 0; // x=25, y=11, transparent
        pixel_data[11][26] = 0; // x=26, y=11, transparent
        pixel_data[11][27] = 0; // x=27, y=11, transparent
        pixel_data[11][28] = 0; // x=28, y=11, transparent
        pixel_data[11][29] = 0; // x=29, y=11, transparent
        pixel_data[11][30] = 0; // x=30, y=11, transparent
        pixel_data[11][31] = 0; // x=31, y=11, transparent
        pixel_data[11][32] = 0; // x=32, y=11, transparent
        pixel_data[11][33] = 0; // x=33, y=11, transparent
        pixel_data[11][34] = 0; // x=34, y=11, transparent
        pixel_data[11][35] = 0; // x=35, y=11, transparent
        pixel_data[11][36] = 0; // x=36, y=11, transparent
        pixel_data[11][37] = 0; // x=37, y=11, transparent
        pixel_data[11][38] = 0; // x=38, y=11, transparent
        pixel_data[11][39] = 0; // x=39, y=11, transparent
        pixel_data[11][40] = 0; // x=40, y=11, transparent
        pixel_data[11][41] = 0; // x=41, y=11, transparent
        pixel_data[11][42] = 0; // x=42, y=11, transparent
        pixel_data[11][43] = 0; // x=43, y=11, transparent
        pixel_data[11][44] = 0; // x=44, y=11, transparent
        pixel_data[11][45] = 0; // x=45, y=11, transparent
        pixel_data[11][46] = 0; // x=46, y=11, transparent
        pixel_data[11][47] = 0; // x=47, y=11, transparent
        pixel_data[11][48] = 0; // x=48, y=11, transparent
        pixel_data[11][49] = 0; // x=49, y=11, transparent
        pixel_data[11][50] = 0; // x=50, y=11, transparent
        pixel_data[11][51] = 0; // x=51, y=11, transparent
        pixel_data[11][52] = 0; // x=52, y=11, transparent
        pixel_data[11][53] = 0; // x=53, y=11, transparent
        pixel_data[11][54] = 0; // x=54, y=11, transparent
        pixel_data[11][55] = 0; // x=55, y=11, transparent
        pixel_data[11][56] = 0; // x=56, y=11, transparent
        pixel_data[11][57] = 0; // x=57, y=11, transparent
        pixel_data[11][58] = 0; // x=58, y=11, transparent
        pixel_data[11][59] = 0; // x=59, y=11, transparent
        pixel_data[12][0] = 0; // x=0, y=12, transparent
        pixel_data[12][1] = 0; // x=1, y=12, transparent
        pixel_data[12][2] = 0; // x=2, y=12, transparent
        pixel_data[12][3] = 0; // x=3, y=12, transparent
        pixel_data[12][4] = 0; // x=4, y=12, transparent
        pixel_data[12][5] = 0; // x=5, y=12, transparent
        pixel_data[12][6] = 0; // x=6, y=12, transparent
        pixel_data[12][7] = 0; // x=7, y=12, transparent
        pixel_data[12][8] = 0; // x=8, y=12, transparent
        pixel_data[12][9] = 0; // x=9, y=12, transparent
        pixel_data[12][10] = 0; // x=10, y=12, transparent
        pixel_data[12][11] = 0; // x=11, y=12, transparent
        pixel_data[12][12] = 0; // x=12, y=12, transparent
        pixel_data[12][13] = 0; // x=13, y=12, transparent
        pixel_data[12][14] = 0; // x=14, y=12, transparent
        pixel_data[12][15] = 0; // x=15, y=12, transparent
        pixel_data[12][16] = 0; // x=16, y=12, transparent
        pixel_data[12][17] = 0; // x=17, y=12, transparent
        pixel_data[12][18] = 0; // x=18, y=12, transparent
        pixel_data[12][19] = 0; // x=19, y=12, transparent
        pixel_data[12][20] = 0; // x=20, y=12, transparent
        pixel_data[12][21] = 0; // x=21, y=12, transparent
        pixel_data[12][22] = 0; // x=22, y=12, transparent
        pixel_data[12][23] = 0; // x=23, y=12, transparent
        pixel_data[12][24] = 0; // x=24, y=12, transparent
        pixel_data[12][25] = 0; // x=25, y=12, transparent
        pixel_data[12][26] = 0; // x=26, y=12, transparent
        pixel_data[12][27] = 0; // x=27, y=12, transparent
        pixel_data[12][28] = 0; // x=28, y=12, transparent
        pixel_data[12][29] = 0; // x=29, y=12, transparent
        pixel_data[12][30] = 0; // x=30, y=12, transparent
        pixel_data[12][31] = 0; // x=31, y=12, transparent
        pixel_data[12][32] = 0; // x=32, y=12, transparent
        pixel_data[12][33] = 0; // x=33, y=12, transparent
        pixel_data[12][34] = 0; // x=34, y=12, transparent
        pixel_data[12][35] = 0; // x=35, y=12, transparent
        pixel_data[12][36] = 0; // x=36, y=12, transparent
        pixel_data[12][37] = 0; // x=37, y=12, transparent
        pixel_data[12][38] = 0; // x=38, y=12, transparent
        pixel_data[12][39] = 0; // x=39, y=12, transparent
        pixel_data[12][40] = 0; // x=40, y=12, transparent
        pixel_data[12][41] = 0; // x=41, y=12, transparent
        pixel_data[12][42] = 0; // x=42, y=12, transparent
        pixel_data[12][43] = 0; // x=43, y=12, transparent
        pixel_data[12][44] = 0; // x=44, y=12, transparent
        pixel_data[12][45] = 0; // x=45, y=12, transparent
        pixel_data[12][46] = 0; // x=46, y=12, transparent
        pixel_data[12][47] = 0; // x=47, y=12, transparent
        pixel_data[12][48] = 0; // x=48, y=12, transparent
        pixel_data[12][49] = 0; // x=49, y=12, transparent
        pixel_data[12][50] = 0; // x=50, y=12, transparent
        pixel_data[12][51] = 0; // x=51, y=12, transparent
        pixel_data[12][52] = 0; // x=52, y=12, transparent
        pixel_data[12][53] = 0; // x=53, y=12, transparent
        pixel_data[12][54] = 0; // x=54, y=12, transparent
        pixel_data[12][55] = 0; // x=55, y=12, transparent
        pixel_data[12][56] = 0; // x=56, y=12, transparent
        pixel_data[12][57] = 0; // x=57, y=12, transparent
        pixel_data[12][58] = 0; // x=58, y=12, transparent
        pixel_data[12][59] = 0; // x=59, y=12, transparent
        pixel_data[13][0] = 0; // x=0, y=13, transparent
        pixel_data[13][1] = 0; // x=1, y=13, transparent
        pixel_data[13][2] = 0; // x=2, y=13, transparent
        pixel_data[13][3] = 0; // x=3, y=13, transparent
        pixel_data[13][4] = 0; // x=4, y=13, transparent
        pixel_data[13][5] = 0; // x=5, y=13, transparent
        pixel_data[13][6] = 0; // x=6, y=13, transparent
        pixel_data[13][7] = 0; // x=7, y=13, transparent
        pixel_data[13][8] = 0; // x=8, y=13, transparent
        pixel_data[13][9] = 0; // x=9, y=13, transparent
        pixel_data[13][10] = 0; // x=10, y=13, transparent
        pixel_data[13][11] = 0; // x=11, y=13, transparent
        pixel_data[13][12] = 0; // x=12, y=13, transparent
        pixel_data[13][13] = 0; // x=13, y=13, transparent
        pixel_data[13][14] = 0; // x=14, y=13, transparent
        pixel_data[13][15] = 0; // x=15, y=13, transparent
        pixel_data[13][16] = 0; // x=16, y=13, transparent
        pixel_data[13][17] = 0; // x=17, y=13, transparent
        pixel_data[13][18] = 0; // x=18, y=13, transparent
        pixel_data[13][19] = 0; // x=19, y=13, transparent
        pixel_data[13][20] = 0; // x=20, y=13, transparent
        pixel_data[13][21] = 0; // x=21, y=13, transparent
        pixel_data[13][22] = 0; // x=22, y=13, transparent
        pixel_data[13][23] = 0; // x=23, y=13, transparent
        pixel_data[13][24] = 0; // x=24, y=13, transparent
        pixel_data[13][25] = 0; // x=25, y=13, transparent
        pixel_data[13][26] = 0; // x=26, y=13, transparent
        pixel_data[13][27] = 0; // x=27, y=13, transparent
        pixel_data[13][28] = 0; // x=28, y=13, transparent
        pixel_data[13][29] = 0; // x=29, y=13, transparent
        pixel_data[13][30] = 0; // x=30, y=13, transparent
        pixel_data[13][31] = 0; // x=31, y=13, transparent
        pixel_data[13][32] = 0; // x=32, y=13, transparent
        pixel_data[13][33] = 0; // x=33, y=13, transparent
        pixel_data[13][34] = 0; // x=34, y=13, transparent
        pixel_data[13][35] = 0; // x=35, y=13, transparent
        pixel_data[13][36] = 0; // x=36, y=13, transparent
        pixel_data[13][37] = 0; // x=37, y=13, transparent
        pixel_data[13][38] = 0; // x=38, y=13, transparent
        pixel_data[13][39] = 0; // x=39, y=13, transparent
        pixel_data[13][40] = 0; // x=40, y=13, transparent
        pixel_data[13][41] = 0; // x=41, y=13, transparent
        pixel_data[13][42] = 0; // x=42, y=13, transparent
        pixel_data[13][43] = 0; // x=43, y=13, transparent
        pixel_data[13][44] = 0; // x=44, y=13, transparent
        pixel_data[13][45] = 0; // x=45, y=13, transparent
        pixel_data[13][46] = 0; // x=46, y=13, transparent
        pixel_data[13][47] = 0; // x=47, y=13, transparent
        pixel_data[13][48] = 0; // x=48, y=13, transparent
        pixel_data[13][49] = 0; // x=49, y=13, transparent
        pixel_data[13][50] = 0; // x=50, y=13, transparent
        pixel_data[13][51] = 0; // x=51, y=13, transparent
        pixel_data[13][52] = 0; // x=52, y=13, transparent
        pixel_data[13][53] = 0; // x=53, y=13, transparent
        pixel_data[13][54] = 0; // x=54, y=13, transparent
        pixel_data[13][55] = 0; // x=55, y=13, transparent
        pixel_data[13][56] = 0; // x=56, y=13, transparent
        pixel_data[13][57] = 0; // x=57, y=13, transparent
        pixel_data[13][58] = 0; // x=58, y=13, transparent
        pixel_data[13][59] = 0; // x=59, y=13, transparent
        pixel_data[14][0] = 0; // x=0, y=14, transparent
        pixel_data[14][1] = 0; // x=1, y=14, transparent
        pixel_data[14][2] = 0; // x=2, y=14, transparent
        pixel_data[14][3] = 0; // x=3, y=14, transparent
        pixel_data[14][4] = 0; // x=4, y=14, transparent
        pixel_data[14][5] = 0; // x=5, y=14, transparent
        pixel_data[14][6] = 0; // x=6, y=14, transparent
        pixel_data[14][7] = 0; // x=7, y=14, transparent
        pixel_data[14][8] = 0; // x=8, y=14, transparent
        pixel_data[14][9] = 0; // x=9, y=14, transparent
        pixel_data[14][10] = 0; // x=10, y=14, transparent
        pixel_data[14][11] = 0; // x=11, y=14, transparent
        pixel_data[14][12] = 0; // x=12, y=14, transparent
        pixel_data[14][13] = 0; // x=13, y=14, transparent
        pixel_data[14][14] = 0; // x=14, y=14, transparent
        pixel_data[14][15] = 0; // x=15, y=14, transparent
        pixel_data[14][16] = 0; // x=16, y=14, transparent
        pixel_data[14][17] = 0; // x=17, y=14, transparent
        pixel_data[14][18] = 0; // x=18, y=14, transparent
        pixel_data[14][19] = 0; // x=19, y=14, transparent
        pixel_data[14][20] = 0; // x=20, y=14, transparent
        pixel_data[14][21] = 0; // x=21, y=14, transparent
        pixel_data[14][22] = 0; // x=22, y=14, transparent
        pixel_data[14][23] = 0; // x=23, y=14, transparent
        pixel_data[14][24] = 6; // x=24, y=14, (101, 101, 102)
        pixel_data[14][25] = 0; // x=25, y=14, transparent
        pixel_data[14][26] = 0; // x=26, y=14, transparent
        pixel_data[14][27] = 0; // x=27, y=14, transparent
        pixel_data[14][28] = 0; // x=28, y=14, transparent
        pixel_data[14][29] = 0; // x=29, y=14, transparent
        pixel_data[14][30] = 0; // x=30, y=14, transparent
        pixel_data[14][31] = 0; // x=31, y=14, transparent
        pixel_data[14][32] = 0; // x=32, y=14, transparent
        pixel_data[14][33] = 0; // x=33, y=14, transparent
        pixel_data[14][34] = 0; // x=34, y=14, transparent
        pixel_data[14][35] = 0; // x=35, y=14, transparent
        pixel_data[14][36] = 0; // x=36, y=14, transparent
        pixel_data[14][37] = 0; // x=37, y=14, transparent
        pixel_data[14][38] = 0; // x=38, y=14, transparent
        pixel_data[14][39] = 0; // x=39, y=14, transparent
        pixel_data[14][40] = 0; // x=40, y=14, transparent
        pixel_data[14][41] = 0; // x=41, y=14, transparent
        pixel_data[14][42] = 0; // x=42, y=14, transparent
        pixel_data[14][43] = 0; // x=43, y=14, transparent
        pixel_data[14][44] = 0; // x=44, y=14, transparent
        pixel_data[14][45] = 0; // x=45, y=14, transparent
        pixel_data[14][46] = 0; // x=46, y=14, transparent
        pixel_data[14][47] = 0; // x=47, y=14, transparent
        pixel_data[14][48] = 0; // x=48, y=14, transparent
        pixel_data[14][49] = 0; // x=49, y=14, transparent
        pixel_data[14][50] = 0; // x=50, y=14, transparent
        pixel_data[14][51] = 0; // x=51, y=14, transparent
        pixel_data[14][52] = 0; // x=52, y=14, transparent
        pixel_data[14][53] = 0; // x=53, y=14, transparent
        pixel_data[14][54] = 0; // x=54, y=14, transparent
        pixel_data[14][55] = 0; // x=55, y=14, transparent
        pixel_data[14][56] = 0; // x=56, y=14, transparent
        pixel_data[14][57] = 0; // x=57, y=14, transparent
        pixel_data[14][58] = 0; // x=58, y=14, transparent
        pixel_data[14][59] = 0; // x=59, y=14, transparent
        pixel_data[15][0] = 0; // x=0, y=15, transparent
        pixel_data[15][1] = 0; // x=1, y=15, transparent
        pixel_data[15][2] = 0; // x=2, y=15, transparent
        pixel_data[15][3] = 0; // x=3, y=15, transparent
        pixel_data[15][4] = 0; // x=4, y=15, transparent
        pixel_data[15][5] = 0; // x=5, y=15, transparent
        pixel_data[15][6] = 0; // x=6, y=15, transparent
        pixel_data[15][7] = 0; // x=7, y=15, transparent
        pixel_data[15][8] = 0; // x=8, y=15, transparent
        pixel_data[15][9] = 0; // x=9, y=15, transparent
        pixel_data[15][10] = 0; // x=10, y=15, transparent
        pixel_data[15][11] = 0; // x=11, y=15, transparent
        pixel_data[15][12] = 0; // x=12, y=15, transparent
        pixel_data[15][13] = 0; // x=13, y=15, transparent
        pixel_data[15][14] = 0; // x=14, y=15, transparent
        pixel_data[15][15] = 0; // x=15, y=15, transparent
        pixel_data[15][16] = 0; // x=16, y=15, transparent
        pixel_data[15][17] = 0; // x=17, y=15, transparent
        pixel_data[15][18] = 0; // x=18, y=15, transparent
        pixel_data[15][19] = 0; // x=19, y=15, transparent
        pixel_data[15][20] = 0; // x=20, y=15, transparent
        pixel_data[15][21] = 0; // x=21, y=15, transparent
        pixel_data[15][22] = 0; // x=22, y=15, transparent
        pixel_data[15][23] = 2; // x=23, y=15, (53, 53, 55)
        pixel_data[15][24] = 6; // x=24, y=15, (101, 101, 102)
        pixel_data[15][25] = 0; // x=25, y=15, transparent
        pixel_data[15][26] = 0; // x=26, y=15, transparent
        pixel_data[15][27] = 0; // x=27, y=15, transparent
        pixel_data[15][28] = 0; // x=28, y=15, transparent
        pixel_data[15][29] = 0; // x=29, y=15, transparent
        pixel_data[15][30] = 0; // x=30, y=15, transparent
        pixel_data[15][31] = 0; // x=31, y=15, transparent
        pixel_data[15][32] = 0; // x=32, y=15, transparent
        pixel_data[15][33] = 0; // x=33, y=15, transparent
        pixel_data[15][34] = 0; // x=34, y=15, transparent
        pixel_data[15][35] = 0; // x=35, y=15, transparent
        pixel_data[15][36] = 0; // x=36, y=15, transparent
        pixel_data[15][37] = 0; // x=37, y=15, transparent
        pixel_data[15][38] = 0; // x=38, y=15, transparent
        pixel_data[15][39] = 0; // x=39, y=15, transparent
        pixel_data[15][40] = 0; // x=40, y=15, transparent
        pixel_data[15][41] = 0; // x=41, y=15, transparent
        pixel_data[15][42] = 0; // x=42, y=15, transparent
        pixel_data[15][43] = 0; // x=43, y=15, transparent
        pixel_data[15][44] = 0; // x=44, y=15, transparent
        pixel_data[15][45] = 0; // x=45, y=15, transparent
        pixel_data[15][46] = 0; // x=46, y=15, transparent
        pixel_data[15][47] = 0; // x=47, y=15, transparent
        pixel_data[15][48] = 0; // x=48, y=15, transparent
        pixel_data[15][49] = 0; // x=49, y=15, transparent
        pixel_data[15][50] = 0; // x=50, y=15, transparent
        pixel_data[15][51] = 0; // x=51, y=15, transparent
        pixel_data[15][52] = 0; // x=52, y=15, transparent
        pixel_data[15][53] = 0; // x=53, y=15, transparent
        pixel_data[15][54] = 0; // x=54, y=15, transparent
        pixel_data[15][55] = 0; // x=55, y=15, transparent
        pixel_data[15][56] = 0; // x=56, y=15, transparent
        pixel_data[15][57] = 0; // x=57, y=15, transparent
        pixel_data[15][58] = 0; // x=58, y=15, transparent
        pixel_data[15][59] = 0; // x=59, y=15, transparent
        pixel_data[16][0] = 0; // x=0, y=16, transparent
        pixel_data[16][1] = 0; // x=1, y=16, transparent
        pixel_data[16][2] = 0; // x=2, y=16, transparent
        pixel_data[16][3] = 0; // x=3, y=16, transparent
        pixel_data[16][4] = 0; // x=4, y=16, transparent
        pixel_data[16][5] = 0; // x=5, y=16, transparent
        pixel_data[16][6] = 0; // x=6, y=16, transparent
        pixel_data[16][7] = 0; // x=7, y=16, transparent
        pixel_data[16][8] = 0; // x=8, y=16, transparent
        pixel_data[16][9] = 0; // x=9, y=16, transparent
        pixel_data[16][10] = 0; // x=10, y=16, transparent
        pixel_data[16][11] = 10; // x=11, y=16, (44, 44, 45)
        pixel_data[16][12] = 10; // x=12, y=16, (44, 44, 45)
        pixel_data[16][13] = 10; // x=13, y=16, (44, 44, 45)
        pixel_data[16][14] = 10; // x=14, y=16, (44, 44, 45)
        pixel_data[16][15] = 10; // x=15, y=16, (44, 44, 45)
        pixel_data[16][16] = 10; // x=16, y=16, (44, 44, 45)
        pixel_data[16][17] = 10; // x=17, y=16, (44, 44, 45)
        pixel_data[16][18] = 10; // x=18, y=16, (44, 44, 45)
        pixel_data[16][19] = 10; // x=19, y=16, (44, 44, 45)
        pixel_data[16][20] = 10; // x=20, y=16, (44, 44, 45)
        pixel_data[16][21] = 10; // x=21, y=16, (44, 44, 45)
        pixel_data[16][22] = 2; // x=22, y=16, (53, 53, 55)
        pixel_data[16][23] = 9; // x=23, y=16, (79, 79, 81)
        pixel_data[16][24] = 14; // x=24, y=16, (116, 116, 117)
        pixel_data[16][25] = 10; // x=25, y=16, (44, 44, 45)
        pixel_data[16][26] = 2; // x=26, y=16, (53, 53, 55)
        pixel_data[16][27] = 2; // x=27, y=16, (53, 53, 55)
        pixel_data[16][28] = 4; // x=28, y=16, (67, 67, 68)
        pixel_data[16][29] = 2; // x=29, y=16, (53, 53, 55)
        pixel_data[16][30] = 4; // x=30, y=16, (67, 67, 68)
        pixel_data[16][31] = 4; // x=31, y=16, (67, 67, 68)
        pixel_data[16][32] = 4; // x=32, y=16, (67, 67, 68)
        pixel_data[16][33] = 4; // x=33, y=16, (67, 67, 68)
        pixel_data[16][34] = 7; // x=34, y=16, (137, 136, 136)
        pixel_data[16][35] = 0; // x=35, y=16, transparent
        pixel_data[16][36] = 0; // x=36, y=16, transparent
        pixel_data[16][37] = 0; // x=37, y=16, transparent
        pixel_data[16][38] = 0; // x=38, y=16, transparent
        pixel_data[16][39] = 0; // x=39, y=16, transparent
        pixel_data[16][40] = 0; // x=40, y=16, transparent
        pixel_data[16][41] = 0; // x=41, y=16, transparent
        pixel_data[16][42] = 0; // x=42, y=16, transparent
        pixel_data[16][43] = 0; // x=43, y=16, transparent
        pixel_data[16][44] = 0; // x=44, y=16, transparent
        pixel_data[16][45] = 0; // x=45, y=16, transparent
        pixel_data[16][46] = 0; // x=46, y=16, transparent
        pixel_data[16][47] = 0; // x=47, y=16, transparent
        pixel_data[16][48] = 0; // x=48, y=16, transparent
        pixel_data[16][49] = 0; // x=49, y=16, transparent
        pixel_data[16][50] = 0; // x=50, y=16, transparent
        pixel_data[16][51] = 0; // x=51, y=16, transparent
        pixel_data[16][52] = 0; // x=52, y=16, transparent
        pixel_data[16][53] = 0; // x=53, y=16, transparent
        pixel_data[16][54] = 0; // x=54, y=16, transparent
        pixel_data[16][55] = 0; // x=55, y=16, transparent
        pixel_data[16][56] = 0; // x=56, y=16, transparent
        pixel_data[16][57] = 0; // x=57, y=16, transparent
        pixel_data[16][58] = 0; // x=58, y=16, transparent
        pixel_data[16][59] = 0; // x=59, y=16, transparent
        pixel_data[17][0] = 0; // x=0, y=17, transparent
        pixel_data[17][1] = 0; // x=1, y=17, transparent
        pixel_data[17][2] = 0; // x=2, y=17, transparent
        pixel_data[17][3] = 0; // x=3, y=17, transparent
        pixel_data[17][4] = 0; // x=4, y=17, transparent
        pixel_data[17][5] = 0; // x=5, y=17, transparent
        pixel_data[17][6] = 2; // x=6, y=17, (53, 53, 55)
        pixel_data[17][7] = 9; // x=7, y=17, (79, 79, 81)
        pixel_data[17][8] = 11; // x=8, y=17, (89, 89, 91)
        pixel_data[17][9] = 11; // x=9, y=17, (89, 89, 91)
        pixel_data[17][10] = 11; // x=10, y=17, (89, 89, 91)
        pixel_data[17][11] = 9; // x=11, y=17, (79, 79, 81)
        pixel_data[17][12] = 9; // x=12, y=17, (79, 79, 81)
        pixel_data[17][13] = 9; // x=13, y=17, (79, 79, 81)
        pixel_data[17][14] = 9; // x=14, y=17, (79, 79, 81)
        pixel_data[17][15] = 9; // x=15, y=17, (79, 79, 81)
        pixel_data[17][16] = 9; // x=16, y=17, (79, 79, 81)
        pixel_data[17][17] = 9; // x=17, y=17, (79, 79, 81)
        pixel_data[17][18] = 9; // x=18, y=17, (79, 79, 81)
        pixel_data[17][19] = 9; // x=19, y=17, (79, 79, 81)
        pixel_data[17][20] = 9; // x=20, y=17, (79, 79, 81)
        pixel_data[17][21] = 11; // x=21, y=17, (89, 89, 91)
        pixel_data[17][22] = 7; // x=22, y=17, (137, 136, 136)
        pixel_data[17][23] = 1; // x=23, y=17, (169, 168, 168)
        pixel_data[17][24] = 3; // x=24, y=17, (196, 196, 196)
        pixel_data[17][25] = 3; // x=25, y=17, (196, 196, 196)
        pixel_data[17][26] = 12; // x=26, y=17, (208, 207, 206)
        pixel_data[17][27] = 12; // x=27, y=17, (208, 207, 206)
        pixel_data[17][28] = 12; // x=28, y=17, (208, 207, 206)
        pixel_data[17][29] = 12; // x=29, y=17, (208, 207, 206)
        pixel_data[17][30] = 12; // x=30, y=17, (208, 207, 206)
        pixel_data[17][31] = 12; // x=31, y=17, (208, 207, 206)
        pixel_data[17][32] = 12; // x=32, y=17, (208, 207, 206)
        pixel_data[17][33] = 12; // x=33, y=17, (208, 207, 206)
        pixel_data[17][34] = 8; // x=34, y=17, (223, 221, 220)
        pixel_data[17][35] = 13; // x=35, y=17, (232, 231, 231)
        pixel_data[17][36] = 12; // x=36, y=17, (208, 207, 206)
        pixel_data[17][37] = 12; // x=37, y=17, (208, 207, 206)
        pixel_data[17][38] = 8; // x=38, y=17, (223, 221, 220)
        pixel_data[17][39] = 8; // x=39, y=17, (223, 221, 220)
        pixel_data[17][40] = 5; // x=40, y=17, (246, 246, 246)
        pixel_data[17][41] = 13; // x=41, y=17, (232, 231, 231)
        pixel_data[17][42] = 12; // x=42, y=17, (208, 207, 206)
        pixel_data[17][43] = 12; // x=43, y=17, (208, 207, 206)
        pixel_data[17][44] = 12; // x=44, y=17, (208, 207, 206)
        pixel_data[17][45] = 3; // x=45, y=17, (196, 196, 196)
        pixel_data[17][46] = 14; // x=46, y=17, (116, 116, 117)
        pixel_data[17][47] = 9; // x=47, y=17, (79, 79, 81)
        pixel_data[17][48] = 9; // x=48, y=17, (79, 79, 81)
        pixel_data[17][49] = 9; // x=49, y=17, (79, 79, 81)
        pixel_data[17][50] = 4; // x=50, y=17, (67, 67, 68)
        pixel_data[17][51] = 4; // x=51, y=17, (67, 67, 68)
        pixel_data[17][52] = 10; // x=52, y=17, (44, 44, 45)
        pixel_data[17][53] = 0; // x=53, y=17, transparent
        pixel_data[17][54] = 0; // x=54, y=17, transparent
        pixel_data[17][55] = 0; // x=55, y=17, transparent
        pixel_data[17][56] = 0; // x=56, y=17, transparent
        pixel_data[17][57] = 0; // x=57, y=17, transparent
        pixel_data[17][58] = 0; // x=58, y=17, transparent
        pixel_data[17][59] = 0; // x=59, y=17, transparent
        pixel_data[18][0] = 0; // x=0, y=18, transparent
        pixel_data[18][1] = 0; // x=1, y=18, transparent
        pixel_data[18][2] = 0; // x=2, y=18, transparent
        pixel_data[18][3] = 0; // x=3, y=18, transparent
        pixel_data[18][4] = 0; // x=4, y=18, transparent
        pixel_data[18][5] = 9; // x=5, y=18, (79, 79, 81)
        pixel_data[18][6] = 11; // x=6, y=18, (89, 89, 91)
        pixel_data[18][7] = 11; // x=7, y=18, (89, 89, 91)
        pixel_data[18][8] = 4; // x=8, y=18, (67, 67, 68)
        pixel_data[18][9] = 2; // x=9, y=18, (53, 53, 55)
        pixel_data[18][10] = 2; // x=10, y=18, (53, 53, 55)
        pixel_data[18][11] = 2; // x=11, y=18, (53, 53, 55)
        pixel_data[18][12] = 2; // x=12, y=18, (53, 53, 55)
        pixel_data[18][13] = 2; // x=13, y=18, (53, 53, 55)
        pixel_data[18][14] = 2; // x=14, y=18, (53, 53, 55)
        pixel_data[18][15] = 2; // x=15, y=18, (53, 53, 55)
        pixel_data[18][16] = 2; // x=16, y=18, (53, 53, 55)
        pixel_data[18][17] = 2; // x=17, y=18, (53, 53, 55)
        pixel_data[18][18] = 2; // x=18, y=18, (53, 53, 55)
        pixel_data[18][19] = 4; // x=19, y=18, (67, 67, 68)
        pixel_data[18][20] = 1; // x=20, y=18, (169, 168, 168)
        pixel_data[18][21] = 15; // x=21, y=18, (185, 181, 177)
        pixel_data[18][22] = 1; // x=22, y=18, (169, 168, 168)
        pixel_data[18][23] = 7; // x=23, y=18, (137, 136, 136)
        pixel_data[18][24] = 7; // x=24, y=18, (137, 136, 136)
        pixel_data[18][25] = 7; // x=25, y=18, (137, 136, 136)
        pixel_data[18][26] = 7; // x=26, y=18, (137, 136, 136)
        pixel_data[18][27] = 7; // x=27, y=18, (137, 136, 136)
        pixel_data[18][28] = 1; // x=28, y=18, (169, 168, 168)
        pixel_data[18][29] = 1; // x=29, y=18, (169, 168, 168)
        pixel_data[18][30] = 15; // x=30, y=18, (185, 181, 177)
        pixel_data[18][31] = 15; // x=31, y=18, (185, 181, 177)
        pixel_data[18][32] = 15; // x=32, y=18, (185, 181, 177)
        pixel_data[18][33] = 15; // x=33, y=18, (185, 181, 177)
        pixel_data[18][34] = 12; // x=34, y=18, (208, 207, 206)
        pixel_data[18][35] = 13; // x=35, y=18, (232, 231, 231)
        pixel_data[18][36] = 1; // x=36, y=18, (169, 168, 168)
        pixel_data[18][37] = 1; // x=37, y=18, (169, 168, 168)
        pixel_data[18][38] = 3; // x=38, y=18, (196, 196, 196)
        pixel_data[18][39] = 12; // x=39, y=18, (208, 207, 206)
        pixel_data[18][40] = 5; // x=40, y=18, (246, 246, 246)
        pixel_data[18][41] = 3; // x=41, y=18, (196, 196, 196)
        pixel_data[18][42] = 15; // x=42, y=18, (185, 181, 177)
        pixel_data[18][43] = 15; // x=43, y=18, (185, 181, 177)
        pixel_data[18][44] = 15; // x=44, y=18, (185, 181, 177)
        pixel_data[18][45] = 7; // x=45, y=18, (137, 136, 136)
        pixel_data[18][46] = 11; // x=46, y=18, (89, 89, 91)
        pixel_data[18][47] = 11; // x=47, y=18, (89, 89, 91)
        pixel_data[18][48] = 11; // x=48, y=18, (89, 89, 91)
        pixel_data[18][49] = 11; // x=49, y=18, (89, 89, 91)
        pixel_data[18][50] = 11; // x=50, y=18, (89, 89, 91)
        pixel_data[18][51] = 11; // x=51, y=18, (89, 89, 91)
        pixel_data[18][52] = 11; // x=52, y=18, (89, 89, 91)
        pixel_data[18][53] = 11; // x=53, y=18, (89, 89, 91)
        pixel_data[18][54] = 4; // x=54, y=18, (67, 67, 68)
        pixel_data[18][55] = 0; // x=55, y=18, transparent
        pixel_data[18][56] = 0; // x=56, y=18, transparent
        pixel_data[18][57] = 0; // x=57, y=18, transparent
        pixel_data[18][58] = 0; // x=58, y=18, transparent
        pixel_data[18][59] = 0; // x=59, y=18, transparent
        pixel_data[19][0] = 0; // x=0, y=19, transparent
        pixel_data[19][1] = 0; // x=1, y=19, transparent
        pixel_data[19][2] = 0; // x=2, y=19, transparent
        pixel_data[19][3] = 0; // x=3, y=19, transparent
        pixel_data[19][4] = 9; // x=4, y=19, (79, 79, 81)
        pixel_data[19][5] = 11; // x=5, y=19, (89, 89, 91)
        pixel_data[19][6] = 9; // x=6, y=19, (79, 79, 81)
        pixel_data[19][7] = 2; // x=7, y=19, (53, 53, 55)
        pixel_data[19][8] = 2; // x=8, y=19, (53, 53, 55)
        pixel_data[19][9] = 2; // x=9, y=19, (53, 53, 55)
        pixel_data[19][10] = 2; // x=10, y=19, (53, 53, 55)
        pixel_data[19][11] = 2; // x=11, y=19, (53, 53, 55)
        pixel_data[19][12] = 2; // x=12, y=19, (53, 53, 55)
        pixel_data[19][13] = 2; // x=13, y=19, (53, 53, 55)
        pixel_data[19][14] = 2; // x=14, y=19, (53, 53, 55)
        pixel_data[19][15] = 2; // x=15, y=19, (53, 53, 55)
        pixel_data[19][16] = 2; // x=16, y=19, (53, 53, 55)
        pixel_data[19][17] = 2; // x=17, y=19, (53, 53, 55)
        pixel_data[19][18] = 10; // x=18, y=19, (44, 44, 45)
        pixel_data[19][19] = 7; // x=19, y=19, (137, 136, 136)
        pixel_data[19][20] = 13; // x=20, y=19, (232, 231, 231)
        pixel_data[19][21] = 3; // x=21, y=19, (196, 196, 196)
        pixel_data[19][22] = 1; // x=22, y=19, (169, 168, 168)
        pixel_data[19][23] = 1; // x=23, y=19, (169, 168, 168)
        pixel_data[19][24] = 1; // x=24, y=19, (169, 168, 168)
        pixel_data[19][25] = 1; // x=25, y=19, (169, 168, 168)
        pixel_data[19][26] = 1; // x=26, y=19, (169, 168, 168)
        pixel_data[19][27] = 1; // x=27, y=19, (169, 168, 168)
        pixel_data[19][28] = 7; // x=28, y=19, (137, 136, 136)
        pixel_data[19][29] = 7; // x=29, y=19, (137, 136, 136)
        pixel_data[19][30] = 1; // x=30, y=19, (169, 168, 168)
        pixel_data[19][31] = 1; // x=31, y=19, (169, 168, 168)
        pixel_data[19][32] = 1; // x=32, y=19, (169, 168, 168)
        pixel_data[19][33] = 1; // x=33, y=19, (169, 168, 168)
        pixel_data[19][34] = 1; // x=34, y=19, (169, 168, 168)
        pixel_data[19][35] = 15; // x=35, y=19, (185, 181, 177)
        pixel_data[19][36] = 1; // x=36, y=19, (169, 168, 168)
        pixel_data[19][37] = 1; // x=37, y=19, (169, 168, 168)
        pixel_data[19][38] = 1; // x=38, y=19, (169, 168, 168)
        pixel_data[19][39] = 15; // x=39, y=19, (185, 181, 177)
        pixel_data[19][40] = 15; // x=40, y=19, (185, 181, 177)
        pixel_data[19][41] = 1; // x=41, y=19, (169, 168, 168)
        pixel_data[19][42] = 1; // x=42, y=19, (169, 168, 168)
        pixel_data[19][43] = 1; // x=43, y=19, (169, 168, 168)
        pixel_data[19][44] = 1; // x=44, y=19, (169, 168, 168)
        pixel_data[19][45] = 7; // x=45, y=19, (137, 136, 136)
        pixel_data[19][46] = 14; // x=46, y=19, (116, 116, 117)
        pixel_data[19][47] = 11; // x=47, y=19, (89, 89, 91)
        pixel_data[19][48] = 4; // x=48, y=19, (67, 67, 68)
        pixel_data[19][49] = 2; // x=49, y=19, (53, 53, 55)
        pixel_data[19][50] = 10; // x=50, y=19, (44, 44, 45)
        pixel_data[19][51] = 2; // x=51, y=19, (53, 53, 55)
        pixel_data[19][52] = 2; // x=52, y=19, (53, 53, 55)
        pixel_data[19][53] = 4; // x=53, y=19, (67, 67, 68)
        pixel_data[19][54] = 6; // x=54, y=19, (101, 101, 102)
        pixel_data[19][55] = 11; // x=55, y=19, (89, 89, 91)
        pixel_data[19][56] = 0; // x=56, y=19, transparent
        pixel_data[19][57] = 0; // x=57, y=19, transparent
        pixel_data[19][58] = 0; // x=58, y=19, transparent
        pixel_data[19][59] = 0; // x=59, y=19, transparent
        pixel_data[20][0] = 0; // x=0, y=20, transparent
        pixel_data[20][1] = 0; // x=1, y=20, transparent
        pixel_data[20][2] = 0; // x=2, y=20, transparent
        pixel_data[20][3] = 10; // x=3, y=20, (44, 44, 45)
        pixel_data[20][4] = 11; // x=4, y=20, (89, 89, 91)
        pixel_data[20][5] = 11; // x=5, y=20, (89, 89, 91)
        pixel_data[20][6] = 4; // x=6, y=20, (67, 67, 68)
        pixel_data[20][7] = 2; // x=7, y=20, (53, 53, 55)
        pixel_data[20][8] = 2; // x=8, y=20, (53, 53, 55)
        pixel_data[20][9] = 2; // x=9, y=20, (53, 53, 55)
        pixel_data[20][10] = 2; // x=10, y=20, (53, 53, 55)
        pixel_data[20][11] = 2; // x=11, y=20, (53, 53, 55)
        pixel_data[20][12] = 2; // x=12, y=20, (53, 53, 55)
        pixel_data[20][13] = 2; // x=13, y=20, (53, 53, 55)
        pixel_data[20][14] = 2; // x=14, y=20, (53, 53, 55)
        pixel_data[20][15] = 2; // x=15, y=20, (53, 53, 55)
        pixel_data[20][16] = 2; // x=16, y=20, (53, 53, 55)
        pixel_data[20][17] = 10; // x=17, y=20, (44, 44, 45)
        pixel_data[20][18] = 9; // x=18, y=20, (79, 79, 81)
        pixel_data[20][19] = 8; // x=19, y=20, (223, 221, 220)
        pixel_data[20][20] = 12; // x=20, y=20, (208, 207, 206)
        pixel_data[20][21] = 1; // x=21, y=20, (169, 168, 168)
        pixel_data[20][22] = 1; // x=22, y=20, (169, 168, 168)
        pixel_data[20][23] = 1; // x=23, y=20, (169, 168, 168)
        pixel_data[20][24] = 1; // x=24, y=20, (169, 168, 168)
        pixel_data[20][25] = 1; // x=25, y=20, (169, 168, 168)
        pixel_data[20][26] = 1; // x=26, y=20, (169, 168, 168)
        pixel_data[20][27] = 1; // x=27, y=20, (169, 168, 168)
        pixel_data[20][28] = 3; // x=28, y=20, (196, 196, 196)
        pixel_data[20][29] = 5; // x=29, y=20, (246, 246, 246)
        pixel_data[20][30] = 5; // x=30, y=20, (246, 246, 246)
        pixel_data[20][31] = 5; // x=31, y=20, (246, 246, 246)
        pixel_data[20][32] = 5; // x=32, y=20, (246, 246, 246)
        pixel_data[20][33] = 5; // x=33, y=20, (246, 246, 246)
        pixel_data[20][34] = 5; // x=34, y=20, (246, 246, 246)
        pixel_data[20][35] = 5; // x=35, y=20, (246, 246, 246)
        pixel_data[20][36] = 5; // x=36, y=20, (246, 246, 246)
        pixel_data[20][37] = 5; // x=37, y=20, (246, 246, 246)
        pixel_data[20][38] = 5; // x=38, y=20, (246, 246, 246)
        pixel_data[20][39] = 5; // x=39, y=20, (246, 246, 246)
        pixel_data[20][40] = 5; // x=40, y=20, (246, 246, 246)
        pixel_data[20][41] = 5; // x=41, y=20, (246, 246, 246)
        pixel_data[20][42] = 5; // x=42, y=20, (246, 246, 246)
        pixel_data[20][43] = 5; // x=43, y=20, (246, 246, 246)
        pixel_data[20][44] = 5; // x=44, y=20, (246, 246, 246)
        pixel_data[20][45] = 5; // x=45, y=20, (246, 246, 246)
        pixel_data[20][46] = 5; // x=46, y=20, (246, 246, 246)
        pixel_data[20][47] = 13; // x=47, y=20, (232, 231, 231)
        pixel_data[20][48] = 8; // x=48, y=20, (223, 221, 220)
        pixel_data[20][49] = 3; // x=49, y=20, (196, 196, 196)
        pixel_data[20][50] = 1; // x=50, y=20, (169, 168, 168)
        pixel_data[20][51] = 7; // x=51, y=20, (137, 136, 136)
        pixel_data[20][52] = 14; // x=52, y=20, (116, 116, 117)
        pixel_data[20][53] = 6; // x=53, y=20, (101, 101, 102)
        pixel_data[20][54] = 14; // x=54, y=20, (116, 116, 117)
        pixel_data[20][55] = 6; // x=55, y=20, (101, 101, 102)
        pixel_data[20][56] = 0; // x=56, y=20, transparent
        pixel_data[20][57] = 0; // x=57, y=20, transparent
        pixel_data[20][58] = 0; // x=58, y=20, transparent
        pixel_data[20][59] = 0; // x=59, y=20, transparent
        pixel_data[21][0] = 0; // x=0, y=21, transparent
        pixel_data[21][1] = 0; // x=1, y=21, transparent
        pixel_data[21][2] = 0; // x=2, y=21, transparent
        pixel_data[21][3] = 4; // x=3, y=21, (67, 67, 68)
        pixel_data[21][4] = 11; // x=4, y=21, (89, 89, 91)
        pixel_data[21][5] = 11; // x=5, y=21, (89, 89, 91)
        pixel_data[21][6] = 9; // x=6, y=21, (79, 79, 81)
        pixel_data[21][7] = 9; // x=7, y=21, (79, 79, 81)
        pixel_data[21][8] = 9; // x=8, y=21, (79, 79, 81)
        pixel_data[21][9] = 9; // x=9, y=21, (79, 79, 81)
        pixel_data[21][10] = 9; // x=10, y=21, (79, 79, 81)
        pixel_data[21][11] = 9; // x=11, y=21, (79, 79, 81)
        pixel_data[21][12] = 9; // x=12, y=21, (79, 79, 81)
        pixel_data[21][13] = 9; // x=13, y=21, (79, 79, 81)
        pixel_data[21][14] = 9; // x=14, y=21, (79, 79, 81)
        pixel_data[21][15] = 9; // x=15, y=21, (79, 79, 81)
        pixel_data[21][16] = 9; // x=16, y=21, (79, 79, 81)
        pixel_data[21][17] = 9; // x=17, y=21, (79, 79, 81)
        pixel_data[21][18] = 1; // x=18, y=21, (169, 168, 168)
        pixel_data[21][19] = 13; // x=19, y=21, (232, 231, 231)
        pixel_data[21][20] = 15; // x=20, y=21, (185, 181, 177)
        pixel_data[21][21] = 1; // x=21, y=21, (169, 168, 168)
        pixel_data[21][22] = 1; // x=22, y=21, (169, 168, 168)
        pixel_data[21][23] = 1; // x=23, y=21, (169, 168, 168)
        pixel_data[21][24] = 1; // x=24, y=21, (169, 168, 168)
        pixel_data[21][25] = 1; // x=25, y=21, (169, 168, 168)
        pixel_data[21][26] = 1; // x=26, y=21, (169, 168, 168)
        pixel_data[21][27] = 1; // x=27, y=21, (169, 168, 168)
        pixel_data[21][28] = 8; // x=28, y=21, (223, 221, 220)
        pixel_data[21][29] = 3; // x=29, y=21, (196, 196, 196)
        pixel_data[21][30] = 3; // x=30, y=21, (196, 196, 196)
        pixel_data[21][31] = 3; // x=31, y=21, (196, 196, 196)
        pixel_data[21][32] = 3; // x=32, y=21, (196, 196, 196)
        pixel_data[21][33] = 3; // x=33, y=21, (196, 196, 196)
        pixel_data[21][34] = 3; // x=34, y=21, (196, 196, 196)
        pixel_data[21][35] = 3; // x=35, y=21, (196, 196, 196)
        pixel_data[21][36] = 12; // x=36, y=21, (208, 207, 206)
        pixel_data[21][37] = 13; // x=37, y=21, (232, 231, 231)
        pixel_data[21][38] = 3; // x=38, y=21, (196, 196, 196)
        pixel_data[21][39] = 3; // x=39, y=21, (196, 196, 196)
        pixel_data[21][40] = 3; // x=40, y=21, (196, 196, 196)
        pixel_data[21][41] = 3; // x=41, y=21, (196, 196, 196)
        pixel_data[21][42] = 3; // x=42, y=21, (196, 196, 196)
        pixel_data[21][43] = 3; // x=43, y=21, (196, 196, 196)
        pixel_data[21][44] = 3; // x=44, y=21, (196, 196, 196)
        pixel_data[21][45] = 3; // x=45, y=21, (196, 196, 196)
        pixel_data[21][46] = 12; // x=46, y=21, (208, 207, 206)
        pixel_data[21][47] = 12; // x=47, y=21, (208, 207, 206)
        pixel_data[21][48] = 8; // x=48, y=21, (223, 221, 220)
        pixel_data[21][49] = 8; // x=49, y=21, (223, 221, 220)
        pixel_data[21][50] = 13; // x=50, y=21, (232, 231, 231)
        pixel_data[21][51] = 5; // x=51, y=21, (246, 246, 246)
        pixel_data[21][52] = 5; // x=52, y=21, (246, 246, 246)
        pixel_data[21][53] = 6; // x=53, y=21, (101, 101, 102)
        pixel_data[21][54] = 2; // x=54, y=21, (53, 53, 55)
        pixel_data[21][55] = 11; // x=55, y=21, (89, 89, 91)
        pixel_data[21][56] = 4; // x=56, y=21, (67, 67, 68)
        pixel_data[21][57] = 0; // x=57, y=21, transparent
        pixel_data[21][58] = 0; // x=58, y=21, transparent
        pixel_data[21][59] = 0; // x=59, y=21, transparent
        pixel_data[22][0] = 0; // x=0, y=22, transparent
        pixel_data[22][1] = 0; // x=1, y=22, transparent
        pixel_data[22][2] = 0; // x=2, y=22, transparent
        pixel_data[22][3] = 11; // x=3, y=22, (89, 89, 91)
        pixel_data[22][4] = 11; // x=4, y=22, (89, 89, 91)
        pixel_data[22][5] = 9; // x=5, y=22, (79, 79, 81)
        pixel_data[22][6] = 2; // x=6, y=22, (53, 53, 55)
        pixel_data[22][7] = 2; // x=7, y=22, (53, 53, 55)
        pixel_data[22][8] = 2; // x=8, y=22, (53, 53, 55)
        pixel_data[22][9] = 2; // x=9, y=22, (53, 53, 55)
        pixel_data[22][10] = 2; // x=10, y=22, (53, 53, 55)
        pixel_data[22][11] = 2; // x=11, y=22, (53, 53, 55)
        pixel_data[22][12] = 2; // x=12, y=22, (53, 53, 55)
        pixel_data[22][13] = 2; // x=13, y=22, (53, 53, 55)
        pixel_data[22][14] = 2; // x=14, y=22, (53, 53, 55)
        pixel_data[22][15] = 2; // x=15, y=22, (53, 53, 55)
        pixel_data[22][16] = 2; // x=16, y=22, (53, 53, 55)
        pixel_data[22][17] = 9; // x=17, y=22, (79, 79, 81)
        pixel_data[22][18] = 8; // x=18, y=22, (223, 221, 220)
        pixel_data[22][19] = 8; // x=19, y=22, (223, 221, 220)
        pixel_data[22][20] = 1; // x=20, y=22, (169, 168, 168)
        pixel_data[22][21] = 1; // x=21, y=22, (169, 168, 168)
        pixel_data[22][22] = 1; // x=22, y=22, (169, 168, 168)
        pixel_data[22][23] = 1; // x=23, y=22, (169, 168, 168)
        pixel_data[22][24] = 1; // x=24, y=22, (169, 168, 168)
        pixel_data[22][25] = 1; // x=25, y=22, (169, 168, 168)
        pixel_data[22][26] = 1; // x=26, y=22, (169, 168, 168)
        pixel_data[22][27] = 15; // x=27, y=22, (185, 181, 177)
        pixel_data[22][28] = 8; // x=28, y=22, (223, 221, 220)
        pixel_data[22][29] = 3; // x=29, y=22, (196, 196, 196)
        pixel_data[22][30] = 3; // x=30, y=22, (196, 196, 196)
        pixel_data[22][31] = 3; // x=31, y=22, (196, 196, 196)
        pixel_data[22][32] = 3; // x=32, y=22, (196, 196, 196)
        pixel_data[22][33] = 3; // x=33, y=22, (196, 196, 196)
        pixel_data[22][34] = 3; // x=34, y=22, (196, 196, 196)
        pixel_data[22][35] = 3; // x=35, y=22, (196, 196, 196)
        pixel_data[22][36] = 12; // x=36, y=22, (208, 207, 206)
        pixel_data[22][37] = 13; // x=37, y=22, (232, 231, 231)
        pixel_data[22][38] = 3; // x=38, y=22, (196, 196, 196)
        pixel_data[22][39] = 3; // x=39, y=22, (196, 196, 196)
        pixel_data[22][40] = 3; // x=40, y=22, (196, 196, 196)
        pixel_data[22][41] = 3; // x=41, y=22, (196, 196, 196)
        pixel_data[22][42] = 3; // x=42, y=22, (196, 196, 196)
        pixel_data[22][43] = 3; // x=43, y=22, (196, 196, 196)
        pixel_data[22][44] = 3; // x=44, y=22, (196, 196, 196)
        pixel_data[22][45] = 3; // x=45, y=22, (196, 196, 196)
        pixel_data[22][46] = 3; // x=46, y=22, (196, 196, 196)
        pixel_data[22][47] = 3; // x=47, y=22, (196, 196, 196)
        pixel_data[22][48] = 3; // x=48, y=22, (196, 196, 196)
        pixel_data[22][49] = 3; // x=49, y=22, (196, 196, 196)
        pixel_data[22][50] = 3; // x=50, y=22, (196, 196, 196)
        pixel_data[22][51] = 3; // x=51, y=22, (196, 196, 196)
        pixel_data[22][52] = 12; // x=52, y=22, (208, 207, 206)
        pixel_data[22][53] = 11; // x=53, y=22, (89, 89, 91)
        pixel_data[22][54] = 10; // x=54, y=22, (44, 44, 45)
        pixel_data[22][55] = 9; // x=55, y=22, (79, 79, 81)
        pixel_data[22][56] = 11; // x=56, y=22, (89, 89, 91)
        pixel_data[22][57] = 0; // x=57, y=22, transparent
        pixel_data[22][58] = 0; // x=58, y=22, transparent
        pixel_data[22][59] = 0; // x=59, y=22, transparent
        pixel_data[23][0] = 0; // x=0, y=23, transparent
        pixel_data[23][1] = 0; // x=1, y=23, transparent
        pixel_data[23][2] = 10; // x=2, y=23, (44, 44, 45)
        pixel_data[23][3] = 11; // x=3, y=23, (89, 89, 91)
        pixel_data[23][4] = 11; // x=4, y=23, (89, 89, 91)
        pixel_data[23][5] = 4; // x=5, y=23, (67, 67, 68)
        pixel_data[23][6] = 2; // x=6, y=23, (53, 53, 55)
        pixel_data[23][7] = 2; // x=7, y=23, (53, 53, 55)
        pixel_data[23][8] = 2; // x=8, y=23, (53, 53, 55)
        pixel_data[23][9] = 2; // x=9, y=23, (53, 53, 55)
        pixel_data[23][10] = 2; // x=10, y=23, (53, 53, 55)
        pixel_data[23][11] = 2; // x=11, y=23, (53, 53, 55)
        pixel_data[23][12] = 2; // x=12, y=23, (53, 53, 55)
        pixel_data[23][13] = 2; // x=13, y=23, (53, 53, 55)
        pixel_data[23][14] = 2; // x=14, y=23, (53, 53, 55)
        pixel_data[23][15] = 2; // x=15, y=23, (53, 53, 55)
        pixel_data[23][16] = 10; // x=16, y=23, (44, 44, 45)
        pixel_data[23][17] = 7; // x=17, y=23, (137, 136, 136)
        pixel_data[23][18] = 13; // x=18, y=23, (232, 231, 231)
        pixel_data[23][19] = 12; // x=19, y=23, (208, 207, 206)
        pixel_data[23][20] = 1; // x=20, y=23, (169, 168, 168)
        pixel_data[23][21] = 1; // x=21, y=23, (169, 168, 168)
        pixel_data[23][22] = 1; // x=22, y=23, (169, 168, 168)
        pixel_data[23][23] = 1; // x=23, y=23, (169, 168, 168)
        pixel_data[23][24] = 1; // x=24, y=23, (169, 168, 168)
        pixel_data[23][25] = 1; // x=25, y=23, (169, 168, 168)
        pixel_data[23][26] = 1; // x=26, y=23, (169, 168, 168)
        pixel_data[23][27] = 3; // x=27, y=23, (196, 196, 196)
        pixel_data[23][28] = 12; // x=28, y=23, (208, 207, 206)
        pixel_data[23][29] = 3; // x=29, y=23, (196, 196, 196)
        pixel_data[23][30] = 3; // x=30, y=23, (196, 196, 196)
        pixel_data[23][31] = 3; // x=31, y=23, (196, 196, 196)
        pixel_data[23][32] = 3; // x=32, y=23, (196, 196, 196)
        pixel_data[23][33] = 3; // x=33, y=23, (196, 196, 196)
        pixel_data[23][34] = 3; // x=34, y=23, (196, 196, 196)
        pixel_data[23][35] = 3; // x=35, y=23, (196, 196, 196)
        pixel_data[23][36] = 12; // x=36, y=23, (208, 207, 206)
        pixel_data[23][37] = 13; // x=37, y=23, (232, 231, 231)
        pixel_data[23][38] = 3; // x=38, y=23, (196, 196, 196)
        pixel_data[23][39] = 3; // x=39, y=23, (196, 196, 196)
        pixel_data[23][40] = 3; // x=40, y=23, (196, 196, 196)
        pixel_data[23][41] = 3; // x=41, y=23, (196, 196, 196)
        pixel_data[23][42] = 3; // x=42, y=23, (196, 196, 196)
        pixel_data[23][43] = 3; // x=43, y=23, (196, 196, 196)
        pixel_data[23][44] = 3; // x=44, y=23, (196, 196, 196)
        pixel_data[23][45] = 3; // x=45, y=23, (196, 196, 196)
        pixel_data[23][46] = 3; // x=46, y=23, (196, 196, 196)
        pixel_data[23][47] = 3; // x=47, y=23, (196, 196, 196)
        pixel_data[23][48] = 3; // x=48, y=23, (196, 196, 196)
        pixel_data[23][49] = 3; // x=49, y=23, (196, 196, 196)
        pixel_data[23][50] = 3; // x=50, y=23, (196, 196, 196)
        pixel_data[23][51] = 3; // x=51, y=23, (196, 196, 196)
        pixel_data[23][52] = 12; // x=52, y=23, (208, 207, 206)
        pixel_data[23][53] = 11; // x=53, y=23, (89, 89, 91)
        pixel_data[23][54] = 10; // x=54, y=23, (44, 44, 45)
        pixel_data[23][55] = 4; // x=55, y=23, (67, 67, 68)
        pixel_data[23][56] = 11; // x=56, y=23, (89, 89, 91)
        pixel_data[23][57] = 0; // x=57, y=23, transparent
        pixel_data[23][58] = 0; // x=58, y=23, transparent
        pixel_data[23][59] = 0; // x=59, y=23, transparent
        pixel_data[24][0] = 0; // x=0, y=24, transparent
        pixel_data[24][1] = 0; // x=1, y=24, transparent
        pixel_data[24][2] = 2; // x=2, y=24, (53, 53, 55)
        pixel_data[24][3] = 11; // x=3, y=24, (89, 89, 91)
        pixel_data[24][4] = 11; // x=4, y=24, (89, 89, 91)
        pixel_data[24][5] = 4; // x=5, y=24, (67, 67, 68)
        pixel_data[24][6] = 2; // x=6, y=24, (53, 53, 55)
        pixel_data[24][7] = 2; // x=7, y=24, (53, 53, 55)
        pixel_data[24][8] = 2; // x=8, y=24, (53, 53, 55)
        pixel_data[24][9] = 2; // x=9, y=24, (53, 53, 55)
        pixel_data[24][10] = 2; // x=10, y=24, (53, 53, 55)
        pixel_data[24][11] = 2; // x=11, y=24, (53, 53, 55)
        pixel_data[24][12] = 2; // x=12, y=24, (53, 53, 55)
        pixel_data[24][13] = 2; // x=13, y=24, (53, 53, 55)
        pixel_data[24][14] = 2; // x=14, y=24, (53, 53, 55)
        pixel_data[24][15] = 2; // x=15, y=24, (53, 53, 55)
        pixel_data[24][16] = 2; // x=16, y=24, (53, 53, 55)
        pixel_data[24][17] = 15; // x=17, y=24, (185, 181, 177)
        pixel_data[24][18] = 13; // x=18, y=24, (232, 231, 231)
        pixel_data[24][19] = 3; // x=19, y=24, (196, 196, 196)
        pixel_data[24][20] = 1; // x=20, y=24, (169, 168, 168)
        pixel_data[24][21] = 1; // x=21, y=24, (169, 168, 168)
        pixel_data[24][22] = 1; // x=22, y=24, (169, 168, 168)
        pixel_data[24][23] = 1; // x=23, y=24, (169, 168, 168)
        pixel_data[24][24] = 1; // x=24, y=24, (169, 168, 168)
        pixel_data[24][25] = 1; // x=25, y=24, (169, 168, 168)
        pixel_data[24][26] = 1; // x=26, y=24, (169, 168, 168)
        pixel_data[24][27] = 12; // x=27, y=24, (208, 207, 206)
        pixel_data[24][28] = 3; // x=28, y=24, (196, 196, 196)
        pixel_data[24][29] = 3; // x=29, y=24, (196, 196, 196)
        pixel_data[24][30] = 3; // x=30, y=24, (196, 196, 196)
        pixel_data[24][31] = 3; // x=31, y=24, (196, 196, 196)
        pixel_data[24][32] = 3; // x=32, y=24, (196, 196, 196)
        pixel_data[24][33] = 3; // x=33, y=24, (196, 196, 196)
        pixel_data[24][34] = 3; // x=34, y=24, (196, 196, 196)
        pixel_data[24][35] = 3; // x=35, y=24, (196, 196, 196)
        pixel_data[24][36] = 12; // x=36, y=24, (208, 207, 206)
        pixel_data[24][37] = 13; // x=37, y=24, (232, 231, 231)
        pixel_data[24][38] = 3; // x=38, y=24, (196, 196, 196)
        pixel_data[24][39] = 3; // x=39, y=24, (196, 196, 196)
        pixel_data[24][40] = 3; // x=40, y=24, (196, 196, 196)
        pixel_data[24][41] = 3; // x=41, y=24, (196, 196, 196)
        pixel_data[24][42] = 3; // x=42, y=24, (196, 196, 196)
        pixel_data[24][43] = 3; // x=43, y=24, (196, 196, 196)
        pixel_data[24][44] = 3; // x=44, y=24, (196, 196, 196)
        pixel_data[24][45] = 3; // x=45, y=24, (196, 196, 196)
        pixel_data[24][46] = 3; // x=46, y=24, (196, 196, 196)
        pixel_data[24][47] = 3; // x=47, y=24, (196, 196, 196)
        pixel_data[24][48] = 3; // x=48, y=24, (196, 196, 196)
        pixel_data[24][49] = 3; // x=49, y=24, (196, 196, 196)
        pixel_data[24][50] = 3; // x=50, y=24, (196, 196, 196)
        pixel_data[24][51] = 3; // x=51, y=24, (196, 196, 196)
        pixel_data[24][52] = 12; // x=52, y=24, (208, 207, 206)
        pixel_data[24][53] = 11; // x=53, y=24, (89, 89, 91)
        pixel_data[24][54] = 10; // x=54, y=24, (44, 44, 45)
        pixel_data[24][55] = 4; // x=55, y=24, (67, 67, 68)
        pixel_data[24][56] = 11; // x=56, y=24, (89, 89, 91)
        pixel_data[24][57] = 4; // x=57, y=24, (67, 67, 68)
        pixel_data[24][58] = 0; // x=58, y=24, transparent
        pixel_data[24][59] = 0; // x=59, y=24, transparent
        pixel_data[25][0] = 0; // x=0, y=25, transparent
        pixel_data[25][1] = 0; // x=1, y=25, transparent
        pixel_data[25][2] = 4; // x=2, y=25, (67, 67, 68)
        pixel_data[25][3] = 11; // x=3, y=25, (89, 89, 91)
        pixel_data[25][4] = 11; // x=4, y=25, (89, 89, 91)
        pixel_data[25][5] = 4; // x=5, y=25, (67, 67, 68)
        pixel_data[25][6] = 2; // x=6, y=25, (53, 53, 55)
        pixel_data[25][7] = 2; // x=7, y=25, (53, 53, 55)
        pixel_data[25][8] = 2; // x=8, y=25, (53, 53, 55)
        pixel_data[25][9] = 2; // x=9, y=25, (53, 53, 55)
        pixel_data[25][10] = 2; // x=10, y=25, (53, 53, 55)
        pixel_data[25][11] = 2; // x=11, y=25, (53, 53, 55)
        pixel_data[25][12] = 2; // x=12, y=25, (53, 53, 55)
        pixel_data[25][13] = 2; // x=13, y=25, (53, 53, 55)
        pixel_data[25][14] = 2; // x=14, y=25, (53, 53, 55)
        pixel_data[25][15] = 2; // x=15, y=25, (53, 53, 55)
        pixel_data[25][16] = 9; // x=16, y=25, (79, 79, 81)
        pixel_data[25][17] = 12; // x=17, y=25, (208, 207, 206)
        pixel_data[25][18] = 13; // x=18, y=25, (232, 231, 231)
        pixel_data[25][19] = 15; // x=19, y=25, (185, 181, 177)
        pixel_data[25][20] = 1; // x=20, y=25, (169, 168, 168)
        pixel_data[25][21] = 1; // x=21, y=25, (169, 168, 168)
        pixel_data[25][22] = 1; // x=22, y=25, (169, 168, 168)
        pixel_data[25][23] = 1; // x=23, y=25, (169, 168, 168)
        pixel_data[25][24] = 1; // x=24, y=25, (169, 168, 168)
        pixel_data[25][25] = 1; // x=25, y=25, (169, 168, 168)
        pixel_data[25][26] = 1; // x=26, y=25, (169, 168, 168)
        pixel_data[25][27] = 12; // x=27, y=25, (208, 207, 206)
        pixel_data[25][28] = 3; // x=28, y=25, (196, 196, 196)
        pixel_data[25][29] = 3; // x=29, y=25, (196, 196, 196)
        pixel_data[25][30] = 3; // x=30, y=25, (196, 196, 196)
        pixel_data[25][31] = 3; // x=31, y=25, (196, 196, 196)
        pixel_data[25][32] = 3; // x=32, y=25, (196, 196, 196)
        pixel_data[25][33] = 3; // x=33, y=25, (196, 196, 196)
        pixel_data[25][34] = 3; // x=34, y=25, (196, 196, 196)
        pixel_data[25][35] = 3; // x=35, y=25, (196, 196, 196)
        pixel_data[25][36] = 12; // x=36, y=25, (208, 207, 206)
        pixel_data[25][37] = 13; // x=37, y=25, (232, 231, 231)
        pixel_data[25][38] = 3; // x=38, y=25, (196, 196, 196)
        pixel_data[25][39] = 3; // x=39, y=25, (196, 196, 196)
        pixel_data[25][40] = 3; // x=40, y=25, (196, 196, 196)
        pixel_data[25][41] = 3; // x=41, y=25, (196, 196, 196)
        pixel_data[25][42] = 3; // x=42, y=25, (196, 196, 196)
        pixel_data[25][43] = 3; // x=43, y=25, (196, 196, 196)
        pixel_data[25][44] = 3; // x=44, y=25, (196, 196, 196)
        pixel_data[25][45] = 3; // x=45, y=25, (196, 196, 196)
        pixel_data[25][46] = 3; // x=46, y=25, (196, 196, 196)
        pixel_data[25][47] = 3; // x=47, y=25, (196, 196, 196)
        pixel_data[25][48] = 3; // x=48, y=25, (196, 196, 196)
        pixel_data[25][49] = 3; // x=49, y=25, (196, 196, 196)
        pixel_data[25][50] = 3; // x=50, y=25, (196, 196, 196)
        pixel_data[25][51] = 3; // x=51, y=25, (196, 196, 196)
        pixel_data[25][52] = 12; // x=52, y=25, (208, 207, 206)
        pixel_data[25][53] = 11; // x=53, y=25, (89, 89, 91)
        pixel_data[25][54] = 2; // x=54, y=25, (53, 53, 55)
        pixel_data[25][55] = 2; // x=55, y=25, (53, 53, 55)
        pixel_data[25][56] = 11; // x=56, y=25, (89, 89, 91)
        pixel_data[25][57] = 9; // x=57, y=25, (79, 79, 81)
        pixel_data[25][58] = 0; // x=58, y=25, transparent
        pixel_data[25][59] = 0; // x=59, y=25, transparent
        pixel_data[26][0] = 0; // x=0, y=26, transparent
        pixel_data[26][1] = 0; // x=1, y=26, transparent
        pixel_data[26][2] = 9; // x=2, y=26, (79, 79, 81)
        pixel_data[26][3] = 11; // x=3, y=26, (89, 89, 91)
        pixel_data[26][4] = 11; // x=4, y=26, (89, 89, 91)
        pixel_data[26][5] = 2; // x=5, y=26, (53, 53, 55)
        pixel_data[26][6] = 2; // x=6, y=26, (53, 53, 55)
        pixel_data[26][7] = 2; // x=7, y=26, (53, 53, 55)
        pixel_data[26][8] = 2; // x=8, y=26, (53, 53, 55)
        pixel_data[26][9] = 2; // x=9, y=26, (53, 53, 55)
        pixel_data[26][10] = 2; // x=10, y=26, (53, 53, 55)
        pixel_data[26][11] = 2; // x=11, y=26, (53, 53, 55)
        pixel_data[26][12] = 2; // x=12, y=26, (53, 53, 55)
        pixel_data[26][13] = 2; // x=13, y=26, (53, 53, 55)
        pixel_data[26][14] = 2; // x=14, y=26, (53, 53, 55)
        pixel_data[26][15] = 10; // x=15, y=26, (44, 44, 45)
        pixel_data[26][16] = 6; // x=16, y=26, (101, 101, 102)
        pixel_data[26][17] = 8; // x=17, y=26, (223, 221, 220)
        pixel_data[26][18] = 13; // x=18, y=26, (232, 231, 231)
        pixel_data[26][19] = 1; // x=19, y=26, (169, 168, 168)
        pixel_data[26][20] = 1; // x=20, y=26, (169, 168, 168)
        pixel_data[26][21] = 1; // x=21, y=26, (169, 168, 168)
        pixel_data[26][22] = 1; // x=22, y=26, (169, 168, 168)
        pixel_data[26][23] = 1; // x=23, y=26, (169, 168, 168)
        pixel_data[26][24] = 1; // x=24, y=26, (169, 168, 168)
        pixel_data[26][25] = 1; // x=25, y=26, (169, 168, 168)
        pixel_data[26][26] = 1; // x=26, y=26, (169, 168, 168)
        pixel_data[26][27] = 12; // x=27, y=26, (208, 207, 206)
        pixel_data[26][28] = 3; // x=28, y=26, (196, 196, 196)
        pixel_data[26][29] = 3; // x=29, y=26, (196, 196, 196)
        pixel_data[26][30] = 3; // x=30, y=26, (196, 196, 196)
        pixel_data[26][31] = 3; // x=31, y=26, (196, 196, 196)
        pixel_data[26][32] = 3; // x=32, y=26, (196, 196, 196)
        pixel_data[26][33] = 3; // x=33, y=26, (196, 196, 196)
        pixel_data[26][34] = 3; // x=34, y=26, (196, 196, 196)
        pixel_data[26][35] = 3; // x=35, y=26, (196, 196, 196)
        pixel_data[26][36] = 12; // x=36, y=26, (208, 207, 206)
        pixel_data[26][37] = 13; // x=37, y=26, (232, 231, 231)
        pixel_data[26][38] = 3; // x=38, y=26, (196, 196, 196)
        pixel_data[26][39] = 3; // x=39, y=26, (196, 196, 196)
        pixel_data[26][40] = 3; // x=40, y=26, (196, 196, 196)
        pixel_data[26][41] = 3; // x=41, y=26, (196, 196, 196)
        pixel_data[26][42] = 3; // x=42, y=26, (196, 196, 196)
        pixel_data[26][43] = 3; // x=43, y=26, (196, 196, 196)
        pixel_data[26][44] = 3; // x=44, y=26, (196, 196, 196)
        pixel_data[26][45] = 3; // x=45, y=26, (196, 196, 196)
        pixel_data[26][46] = 3; // x=46, y=26, (196, 196, 196)
        pixel_data[26][47] = 3; // x=47, y=26, (196, 196, 196)
        pixel_data[26][48] = 3; // x=48, y=26, (196, 196, 196)
        pixel_data[26][49] = 3; // x=49, y=26, (196, 196, 196)
        pixel_data[26][50] = 3; // x=50, y=26, (196, 196, 196)
        pixel_data[26][51] = 3; // x=51, y=26, (196, 196, 196)
        pixel_data[26][52] = 12; // x=52, y=26, (208, 207, 206)
        pixel_data[26][53] = 11; // x=53, y=26, (89, 89, 91)
        pixel_data[26][54] = 2; // x=54, y=26, (53, 53, 55)
        pixel_data[26][55] = 2; // x=55, y=26, (53, 53, 55)
        pixel_data[26][56] = 9; // x=56, y=26, (79, 79, 81)
        pixel_data[26][57] = 14; // x=57, y=26, (116, 116, 117)
        pixel_data[26][58] = 0; // x=58, y=26, transparent
        pixel_data[26][59] = 0; // x=59, y=26, transparent
        pixel_data[27][0] = 0; // x=0, y=27, transparent
        pixel_data[27][1] = 0; // x=1, y=27, transparent
        pixel_data[27][2] = 9; // x=2, y=27, (79, 79, 81)
        pixel_data[27][3] = 11; // x=3, y=27, (89, 89, 91)
        pixel_data[27][4] = 11; // x=4, y=27, (89, 89, 91)
        pixel_data[27][5] = 2; // x=5, y=27, (53, 53, 55)
        pixel_data[27][6] = 2; // x=6, y=27, (53, 53, 55)
        pixel_data[27][7] = 2; // x=7, y=27, (53, 53, 55)
        pixel_data[27][8] = 2; // x=8, y=27, (53, 53, 55)
        pixel_data[27][9] = 2; // x=9, y=27, (53, 53, 55)
        pixel_data[27][10] = 2; // x=10, y=27, (53, 53, 55)
        pixel_data[27][11] = 2; // x=11, y=27, (53, 53, 55)
        pixel_data[27][12] = 2; // x=12, y=27, (53, 53, 55)
        pixel_data[27][13] = 2; // x=13, y=27, (53, 53, 55)
        pixel_data[27][14] = 2; // x=14, y=27, (53, 53, 55)
        pixel_data[27][15] = 10; // x=15, y=27, (44, 44, 45)
        pixel_data[27][16] = 7; // x=16, y=27, (137, 136, 136)
        pixel_data[27][17] = 5; // x=17, y=27, (246, 246, 246)
        pixel_data[27][18] = 13; // x=18, y=27, (232, 231, 231)
        pixel_data[27][19] = 1; // x=19, y=27, (169, 168, 168)
        pixel_data[27][20] = 1; // x=20, y=27, (169, 168, 168)
        pixel_data[27][21] = 1; // x=21, y=27, (169, 168, 168)
        pixel_data[27][22] = 1; // x=22, y=27, (169, 168, 168)
        pixel_data[27][23] = 1; // x=23, y=27, (169, 168, 168)
        pixel_data[27][24] = 1; // x=24, y=27, (169, 168, 168)
        pixel_data[27][25] = 1; // x=25, y=27, (169, 168, 168)
        pixel_data[27][26] = 1; // x=26, y=27, (169, 168, 168)
        pixel_data[27][27] = 12; // x=27, y=27, (208, 207, 206)
        pixel_data[27][28] = 3; // x=28, y=27, (196, 196, 196)
        pixel_data[27][29] = 3; // x=29, y=27, (196, 196, 196)
        pixel_data[27][30] = 3; // x=30, y=27, (196, 196, 196)
        pixel_data[27][31] = 3; // x=31, y=27, (196, 196, 196)
        pixel_data[27][32] = 3; // x=32, y=27, (196, 196, 196)
        pixel_data[27][33] = 3; // x=33, y=27, (196, 196, 196)
        pixel_data[27][34] = 3; // x=34, y=27, (196, 196, 196)
        pixel_data[27][35] = 3; // x=35, y=27, (196, 196, 196)
        pixel_data[27][36] = 12; // x=36, y=27, (208, 207, 206)
        pixel_data[27][37] = 13; // x=37, y=27, (232, 231, 231)
        pixel_data[27][38] = 3; // x=38, y=27, (196, 196, 196)
        pixel_data[27][39] = 3; // x=39, y=27, (196, 196, 196)
        pixel_data[27][40] = 3; // x=40, y=27, (196, 196, 196)
        pixel_data[27][41] = 3; // x=41, y=27, (196, 196, 196)
        pixel_data[27][42] = 3; // x=42, y=27, (196, 196, 196)
        pixel_data[27][43] = 3; // x=43, y=27, (196, 196, 196)
        pixel_data[27][44] = 3; // x=44, y=27, (196, 196, 196)
        pixel_data[27][45] = 3; // x=45, y=27, (196, 196, 196)
        pixel_data[27][46] = 3; // x=46, y=27, (196, 196, 196)
        pixel_data[27][47] = 3; // x=47, y=27, (196, 196, 196)
        pixel_data[27][48] = 3; // x=48, y=27, (196, 196, 196)
        pixel_data[27][49] = 3; // x=49, y=27, (196, 196, 196)
        pixel_data[27][50] = 3; // x=50, y=27, (196, 196, 196)
        pixel_data[27][51] = 3; // x=51, y=27, (196, 196, 196)
        pixel_data[27][52] = 12; // x=52, y=27, (208, 207, 206)
        pixel_data[27][53] = 11; // x=53, y=27, (89, 89, 91)
        pixel_data[27][54] = 10; // x=54, y=27, (44, 44, 45)
        pixel_data[27][55] = 2; // x=55, y=27, (53, 53, 55)
        pixel_data[27][56] = 9; // x=56, y=27, (79, 79, 81)
        pixel_data[27][57] = 7; // x=57, y=27, (137, 136, 136)
        pixel_data[27][58] = 0; // x=58, y=27, transparent
        pixel_data[27][59] = 0; // x=59, y=27, transparent
        pixel_data[28][0] = 0; // x=0, y=28, transparent
        pixel_data[28][1] = 0; // x=1, y=28, transparent
        pixel_data[28][2] = 9; // x=2, y=28, (79, 79, 81)
        pixel_data[28][3] = 11; // x=3, y=28, (89, 89, 91)
        pixel_data[28][4] = 9; // x=4, y=28, (79, 79, 81)
        pixel_data[28][5] = 2; // x=5, y=28, (53, 53, 55)
        pixel_data[28][6] = 2; // x=6, y=28, (53, 53, 55)
        pixel_data[28][7] = 2; // x=7, y=28, (53, 53, 55)
        pixel_data[28][8] = 2; // x=8, y=28, (53, 53, 55)
        pixel_data[28][9] = 2; // x=9, y=28, (53, 53, 55)
        pixel_data[28][10] = 2; // x=10, y=28, (53, 53, 55)
        pixel_data[28][11] = 2; // x=11, y=28, (53, 53, 55)
        pixel_data[28][12] = 2; // x=12, y=28, (53, 53, 55)
        pixel_data[28][13] = 2; // x=13, y=28, (53, 53, 55)
        pixel_data[28][14] = 2; // x=14, y=28, (53, 53, 55)
        pixel_data[28][15] = 10; // x=15, y=28, (44, 44, 45)
        pixel_data[28][16] = 7; // x=16, y=28, (137, 136, 136)
        pixel_data[28][17] = 5; // x=17, y=28, (246, 246, 246)
        pixel_data[28][18] = 8; // x=18, y=28, (223, 221, 220)
        pixel_data[28][19] = 1; // x=19, y=28, (169, 168, 168)
        pixel_data[28][20] = 1; // x=20, y=28, (169, 168, 168)
        pixel_data[28][21] = 1; // x=21, y=28, (169, 168, 168)
        pixel_data[28][22] = 1; // x=22, y=28, (169, 168, 168)
        pixel_data[28][23] = 1; // x=23, y=28, (169, 168, 168)
        pixel_data[28][24] = 1; // x=24, y=28, (169, 168, 168)
        pixel_data[28][25] = 1; // x=25, y=28, (169, 168, 168)
        pixel_data[28][26] = 1; // x=26, y=28, (169, 168, 168)
        pixel_data[28][27] = 12; // x=27, y=28, (208, 207, 206)
        pixel_data[28][28] = 3; // x=28, y=28, (196, 196, 196)
        pixel_data[28][29] = 3; // x=29, y=28, (196, 196, 196)
        pixel_data[28][30] = 3; // x=30, y=28, (196, 196, 196)
        pixel_data[28][31] = 3; // x=31, y=28, (196, 196, 196)
        pixel_data[28][32] = 3; // x=32, y=28, (196, 196, 196)
        pixel_data[28][33] = 3; // x=33, y=28, (196, 196, 196)
        pixel_data[28][34] = 3; // x=34, y=28, (196, 196, 196)
        pixel_data[28][35] = 3; // x=35, y=28, (196, 196, 196)
        pixel_data[28][36] = 12; // x=36, y=28, (208, 207, 206)
        pixel_data[28][37] = 13; // x=37, y=28, (232, 231, 231)
        pixel_data[28][38] = 3; // x=38, y=28, (196, 196, 196)
        pixel_data[28][39] = 3; // x=39, y=28, (196, 196, 196)
        pixel_data[28][40] = 3; // x=40, y=28, (196, 196, 196)
        pixel_data[28][41] = 3; // x=41, y=28, (196, 196, 196)
        pixel_data[28][42] = 3; // x=42, y=28, (196, 196, 196)
        pixel_data[28][43] = 3; // x=43, y=28, (196, 196, 196)
        pixel_data[28][44] = 3; // x=44, y=28, (196, 196, 196)
        pixel_data[28][45] = 3; // x=45, y=28, (196, 196, 196)
        pixel_data[28][46] = 3; // x=46, y=28, (196, 196, 196)
        pixel_data[28][47] = 3; // x=47, y=28, (196, 196, 196)
        pixel_data[28][48] = 3; // x=48, y=28, (196, 196, 196)
        pixel_data[28][49] = 3; // x=49, y=28, (196, 196, 196)
        pixel_data[28][50] = 3; // x=50, y=28, (196, 196, 196)
        pixel_data[28][51] = 3; // x=51, y=28, (196, 196, 196)
        pixel_data[28][52] = 12; // x=52, y=28, (208, 207, 206)
        pixel_data[28][53] = 11; // x=53, y=28, (89, 89, 91)
        pixel_data[28][54] = 2; // x=54, y=28, (53, 53, 55)
        pixel_data[28][55] = 4; // x=55, y=28, (67, 67, 68)
        pixel_data[28][56] = 9; // x=56, y=28, (79, 79, 81)
        pixel_data[28][57] = 7; // x=57, y=28, (137, 136, 136)
        pixel_data[28][58] = 0; // x=58, y=28, transparent
        pixel_data[28][59] = 0; // x=59, y=28, transparent
        pixel_data[29][0] = 0; // x=0, y=29, transparent
        pixel_data[29][1] = 0; // x=1, y=29, transparent
        pixel_data[29][2] = 11; // x=2, y=29, (89, 89, 91)
        pixel_data[29][3] = 11; // x=3, y=29, (89, 89, 91)
        pixel_data[29][4] = 9; // x=4, y=29, (79, 79, 81)
        pixel_data[29][5] = 2; // x=5, y=29, (53, 53, 55)
        pixel_data[29][6] = 2; // x=6, y=29, (53, 53, 55)
        pixel_data[29][7] = 2; // x=7, y=29, (53, 53, 55)
        pixel_data[29][8] = 2; // x=8, y=29, (53, 53, 55)
        pixel_data[29][9] = 2; // x=9, y=29, (53, 53, 55)
        pixel_data[29][10] = 2; // x=10, y=29, (53, 53, 55)
        pixel_data[29][11] = 2; // x=11, y=29, (53, 53, 55)
        pixel_data[29][12] = 2; // x=12, y=29, (53, 53, 55)
        pixel_data[29][13] = 2; // x=13, y=29, (53, 53, 55)
        pixel_data[29][14] = 2; // x=14, y=29, (53, 53, 55)
        pixel_data[29][15] = 10; // x=15, y=29, (44, 44, 45)
        pixel_data[29][16] = 7; // x=16, y=29, (137, 136, 136)
        pixel_data[29][17] = 5; // x=17, y=29, (246, 246, 246)
        pixel_data[29][18] = 8; // x=18, y=29, (223, 221, 220)
        pixel_data[29][19] = 1; // x=19, y=29, (169, 168, 168)
        pixel_data[29][20] = 1; // x=20, y=29, (169, 168, 168)
        pixel_data[29][21] = 1; // x=21, y=29, (169, 168, 168)
        pixel_data[29][22] = 1; // x=22, y=29, (169, 168, 168)
        pixel_data[29][23] = 1; // x=23, y=29, (169, 168, 168)
        pixel_data[29][24] = 1; // x=24, y=29, (169, 168, 168)
        pixel_data[29][25] = 1; // x=25, y=29, (169, 168, 168)
        pixel_data[29][26] = 1; // x=26, y=29, (169, 168, 168)
        pixel_data[29][27] = 12; // x=27, y=29, (208, 207, 206)
        pixel_data[29][28] = 3; // x=28, y=29, (196, 196, 196)
        pixel_data[29][29] = 3; // x=29, y=29, (196, 196, 196)
        pixel_data[29][30] = 3; // x=30, y=29, (196, 196, 196)
        pixel_data[29][31] = 3; // x=31, y=29, (196, 196, 196)
        pixel_data[29][32] = 3; // x=32, y=29, (196, 196, 196)
        pixel_data[29][33] = 3; // x=33, y=29, (196, 196, 196)
        pixel_data[29][34] = 3; // x=34, y=29, (196, 196, 196)
        pixel_data[29][35] = 3; // x=35, y=29, (196, 196, 196)
        pixel_data[29][36] = 12; // x=36, y=29, (208, 207, 206)
        pixel_data[29][37] = 13; // x=37, y=29, (232, 231, 231)
        pixel_data[29][38] = 3; // x=38, y=29, (196, 196, 196)
        pixel_data[29][39] = 3; // x=39, y=29, (196, 196, 196)
        pixel_data[29][40] = 3; // x=40, y=29, (196, 196, 196)
        pixel_data[29][41] = 3; // x=41, y=29, (196, 196, 196)
        pixel_data[29][42] = 3; // x=42, y=29, (196, 196, 196)
        pixel_data[29][43] = 3; // x=43, y=29, (196, 196, 196)
        pixel_data[29][44] = 3; // x=44, y=29, (196, 196, 196)
        pixel_data[29][45] = 3; // x=45, y=29, (196, 196, 196)
        pixel_data[29][46] = 3; // x=46, y=29, (196, 196, 196)
        pixel_data[29][47] = 3; // x=47, y=29, (196, 196, 196)
        pixel_data[29][48] = 3; // x=48, y=29, (196, 196, 196)
        pixel_data[29][49] = 3; // x=49, y=29, (196, 196, 196)
        pixel_data[29][50] = 3; // x=50, y=29, (196, 196, 196)
        pixel_data[29][51] = 3; // x=51, y=29, (196, 196, 196)
        pixel_data[29][52] = 12; // x=52, y=29, (208, 207, 206)
        pixel_data[29][53] = 11; // x=53, y=29, (89, 89, 91)
        pixel_data[29][54] = 2; // x=54, y=29, (53, 53, 55)
        pixel_data[29][55] = 4; // x=55, y=29, (67, 67, 68)
        pixel_data[29][56] = 9; // x=56, y=29, (79, 79, 81)
        pixel_data[29][57] = 7; // x=57, y=29, (137, 136, 136)
        pixel_data[29][58] = 0; // x=58, y=29, transparent
        pixel_data[29][59] = 0; // x=59, y=29, transparent
        pixel_data[30][0] = 0; // x=0, y=30, transparent
        pixel_data[30][1] = 0; // x=1, y=30, transparent
        pixel_data[30][2] = 9; // x=2, y=30, (79, 79, 81)
        pixel_data[30][3] = 11; // x=3, y=30, (89, 89, 91)
        pixel_data[30][4] = 11; // x=4, y=30, (89, 89, 91)
        pixel_data[30][5] = 2; // x=5, y=30, (53, 53, 55)
        pixel_data[30][6] = 2; // x=6, y=30, (53, 53, 55)
        pixel_data[30][7] = 2; // x=7, y=30, (53, 53, 55)
        pixel_data[30][8] = 2; // x=8, y=30, (53, 53, 55)
        pixel_data[30][9] = 2; // x=9, y=30, (53, 53, 55)
        pixel_data[30][10] = 2; // x=10, y=30, (53, 53, 55)
        pixel_data[30][11] = 2; // x=11, y=30, (53, 53, 55)
        pixel_data[30][12] = 2; // x=12, y=30, (53, 53, 55)
        pixel_data[30][13] = 2; // x=13, y=30, (53, 53, 55)
        pixel_data[30][14] = 2; // x=14, y=30, (53, 53, 55)
        pixel_data[30][15] = 10; // x=15, y=30, (44, 44, 45)
        pixel_data[30][16] = 7; // x=16, y=30, (137, 136, 136)
        pixel_data[30][17] = 5; // x=17, y=30, (246, 246, 246)
        pixel_data[30][18] = 8; // x=18, y=30, (223, 221, 220)
        pixel_data[30][19] = 1; // x=19, y=30, (169, 168, 168)
        pixel_data[30][20] = 1; // x=20, y=30, (169, 168, 168)
        pixel_data[30][21] = 1; // x=21, y=30, (169, 168, 168)
        pixel_data[30][22] = 1; // x=22, y=30, (169, 168, 168)
        pixel_data[30][23] = 1; // x=23, y=30, (169, 168, 168)
        pixel_data[30][24] = 1; // x=24, y=30, (169, 168, 168)
        pixel_data[30][25] = 1; // x=25, y=30, (169, 168, 168)
        pixel_data[30][26] = 1; // x=26, y=30, (169, 168, 168)
        pixel_data[30][27] = 12; // x=27, y=30, (208, 207, 206)
        pixel_data[30][28] = 3; // x=28, y=30, (196, 196, 196)
        pixel_data[30][29] = 3; // x=29, y=30, (196, 196, 196)
        pixel_data[30][30] = 3; // x=30, y=30, (196, 196, 196)
        pixel_data[30][31] = 3; // x=31, y=30, (196, 196, 196)
        pixel_data[30][32] = 3; // x=32, y=30, (196, 196, 196)
        pixel_data[30][33] = 3; // x=33, y=30, (196, 196, 196)
        pixel_data[30][34] = 3; // x=34, y=30, (196, 196, 196)
        pixel_data[30][35] = 3; // x=35, y=30, (196, 196, 196)
        pixel_data[30][36] = 12; // x=36, y=30, (208, 207, 206)
        pixel_data[30][37] = 13; // x=37, y=30, (232, 231, 231)
        pixel_data[30][38] = 3; // x=38, y=30, (196, 196, 196)
        pixel_data[30][39] = 3; // x=39, y=30, (196, 196, 196)
        pixel_data[30][40] = 3; // x=40, y=30, (196, 196, 196)
        pixel_data[30][41] = 3; // x=41, y=30, (196, 196, 196)
        pixel_data[30][42] = 3; // x=42, y=30, (196, 196, 196)
        pixel_data[30][43] = 3; // x=43, y=30, (196, 196, 196)
        pixel_data[30][44] = 3; // x=44, y=30, (196, 196, 196)
        pixel_data[30][45] = 3; // x=45, y=30, (196, 196, 196)
        pixel_data[30][46] = 3; // x=46, y=30, (196, 196, 196)
        pixel_data[30][47] = 3; // x=47, y=30, (196, 196, 196)
        pixel_data[30][48] = 3; // x=48, y=30, (196, 196, 196)
        pixel_data[30][49] = 3; // x=49, y=30, (196, 196, 196)
        pixel_data[30][50] = 3; // x=50, y=30, (196, 196, 196)
        pixel_data[30][51] = 3; // x=51, y=30, (196, 196, 196)
        pixel_data[30][52] = 12; // x=52, y=30, (208, 207, 206)
        pixel_data[30][53] = 11; // x=53, y=30, (89, 89, 91)
        pixel_data[30][54] = 10; // x=54, y=30, (44, 44, 45)
        pixel_data[30][55] = 2; // x=55, y=30, (53, 53, 55)
        pixel_data[30][56] = 9; // x=56, y=30, (79, 79, 81)
        pixel_data[30][57] = 7; // x=57, y=30, (137, 136, 136)
        pixel_data[30][58] = 0; // x=58, y=30, transparent
        pixel_data[30][59] = 0; // x=59, y=30, transparent
        pixel_data[31][0] = 0; // x=0, y=31, transparent
        pixel_data[31][1] = 0; // x=1, y=31, transparent
        pixel_data[31][2] = 9; // x=2, y=31, (79, 79, 81)
        pixel_data[31][3] = 11; // x=3, y=31, (89, 89, 91)
        pixel_data[31][4] = 11; // x=4, y=31, (89, 89, 91)
        pixel_data[31][5] = 2; // x=5, y=31, (53, 53, 55)
        pixel_data[31][6] = 2; // x=6, y=31, (53, 53, 55)
        pixel_data[31][7] = 2; // x=7, y=31, (53, 53, 55)
        pixel_data[31][8] = 2; // x=8, y=31, (53, 53, 55)
        pixel_data[31][9] = 2; // x=9, y=31, (53, 53, 55)
        pixel_data[31][10] = 2; // x=10, y=31, (53, 53, 55)
        pixel_data[31][11] = 2; // x=11, y=31, (53, 53, 55)
        pixel_data[31][12] = 2; // x=12, y=31, (53, 53, 55)
        pixel_data[31][13] = 2; // x=13, y=31, (53, 53, 55)
        pixel_data[31][14] = 2; // x=14, y=31, (53, 53, 55)
        pixel_data[31][15] = 10; // x=15, y=31, (44, 44, 45)
        pixel_data[31][16] = 14; // x=16, y=31, (116, 116, 117)
        pixel_data[31][17] = 13; // x=17, y=31, (232, 231, 231)
        pixel_data[31][18] = 13; // x=18, y=31, (232, 231, 231)
        pixel_data[31][19] = 1; // x=19, y=31, (169, 168, 168)
        pixel_data[31][20] = 1; // x=20, y=31, (169, 168, 168)
        pixel_data[31][21] = 1; // x=21, y=31, (169, 168, 168)
        pixel_data[31][22] = 1; // x=22, y=31, (169, 168, 168)
        pixel_data[31][23] = 1; // x=23, y=31, (169, 168, 168)
        pixel_data[31][24] = 1; // x=24, y=31, (169, 168, 168)
        pixel_data[31][25] = 1; // x=25, y=31, (169, 168, 168)
        pixel_data[31][26] = 1; // x=26, y=31, (169, 168, 168)
        pixel_data[31][27] = 12; // x=27, y=31, (208, 207, 206)
        pixel_data[31][28] = 3; // x=28, y=31, (196, 196, 196)
        pixel_data[31][29] = 3; // x=29, y=31, (196, 196, 196)
        pixel_data[31][30] = 3; // x=30, y=31, (196, 196, 196)
        pixel_data[31][31] = 3; // x=31, y=31, (196, 196, 196)
        pixel_data[31][32] = 3; // x=32, y=31, (196, 196, 196)
        pixel_data[31][33] = 3; // x=33, y=31, (196, 196, 196)
        pixel_data[31][34] = 3; // x=34, y=31, (196, 196, 196)
        pixel_data[31][35] = 3; // x=35, y=31, (196, 196, 196)
        pixel_data[31][36] = 12; // x=36, y=31, (208, 207, 206)
        pixel_data[31][37] = 13; // x=37, y=31, (232, 231, 231)
        pixel_data[31][38] = 3; // x=38, y=31, (196, 196, 196)
        pixel_data[31][39] = 3; // x=39, y=31, (196, 196, 196)
        pixel_data[31][40] = 3; // x=40, y=31, (196, 196, 196)
        pixel_data[31][41] = 3; // x=41, y=31, (196, 196, 196)
        pixel_data[31][42] = 3; // x=42, y=31, (196, 196, 196)
        pixel_data[31][43] = 3; // x=43, y=31, (196, 196, 196)
        pixel_data[31][44] = 3; // x=44, y=31, (196, 196, 196)
        pixel_data[31][45] = 3; // x=45, y=31, (196, 196, 196)
        pixel_data[31][46] = 3; // x=46, y=31, (196, 196, 196)
        pixel_data[31][47] = 3; // x=47, y=31, (196, 196, 196)
        pixel_data[31][48] = 3; // x=48, y=31, (196, 196, 196)
        pixel_data[31][49] = 3; // x=49, y=31, (196, 196, 196)
        pixel_data[31][50] = 3; // x=50, y=31, (196, 196, 196)
        pixel_data[31][51] = 3; // x=51, y=31, (196, 196, 196)
        pixel_data[31][52] = 12; // x=52, y=31, (208, 207, 206)
        pixel_data[31][53] = 11; // x=53, y=31, (89, 89, 91)
        pixel_data[31][54] = 10; // x=54, y=31, (44, 44, 45)
        pixel_data[31][55] = 2; // x=55, y=31, (53, 53, 55)
        pixel_data[31][56] = 9; // x=56, y=31, (79, 79, 81)
        pixel_data[31][57] = 7; // x=57, y=31, (137, 136, 136)
        pixel_data[31][58] = 0; // x=58, y=31, transparent
        pixel_data[31][59] = 0; // x=59, y=31, transparent
        pixel_data[32][0] = 0; // x=0, y=32, transparent
        pixel_data[32][1] = 0; // x=1, y=32, transparent
        pixel_data[32][2] = 4; // x=2, y=32, (67, 67, 68)
        pixel_data[32][3] = 11; // x=3, y=32, (89, 89, 91)
        pixel_data[32][4] = 11; // x=4, y=32, (89, 89, 91)
        pixel_data[32][5] = 2; // x=5, y=32, (53, 53, 55)
        pixel_data[32][6] = 2; // x=6, y=32, (53, 53, 55)
        pixel_data[32][7] = 2; // x=7, y=32, (53, 53, 55)
        pixel_data[32][8] = 2; // x=8, y=32, (53, 53, 55)
        pixel_data[32][9] = 2; // x=9, y=32, (53, 53, 55)
        pixel_data[32][10] = 2; // x=10, y=32, (53, 53, 55)
        pixel_data[32][11] = 2; // x=11, y=32, (53, 53, 55)
        pixel_data[32][12] = 2; // x=12, y=32, (53, 53, 55)
        pixel_data[32][13] = 2; // x=13, y=32, (53, 53, 55)
        pixel_data[32][14] = 2; // x=14, y=32, (53, 53, 55)
        pixel_data[32][15] = 2; // x=15, y=32, (53, 53, 55)
        pixel_data[32][16] = 9; // x=16, y=32, (79, 79, 81)
        pixel_data[32][17] = 12; // x=17, y=32, (208, 207, 206)
        pixel_data[32][18] = 13; // x=18, y=32, (232, 231, 231)
        pixel_data[32][19] = 15; // x=19, y=32, (185, 181, 177)
        pixel_data[32][20] = 1; // x=20, y=32, (169, 168, 168)
        pixel_data[32][21] = 1; // x=21, y=32, (169, 168, 168)
        pixel_data[32][22] = 1; // x=22, y=32, (169, 168, 168)
        pixel_data[32][23] = 1; // x=23, y=32, (169, 168, 168)
        pixel_data[32][24] = 1; // x=24, y=32, (169, 168, 168)
        pixel_data[32][25] = 1; // x=25, y=32, (169, 168, 168)
        pixel_data[32][26] = 1; // x=26, y=32, (169, 168, 168)
        pixel_data[32][27] = 12; // x=27, y=32, (208, 207, 206)
        pixel_data[32][28] = 3; // x=28, y=32, (196, 196, 196)
        pixel_data[32][29] = 3; // x=29, y=32, (196, 196, 196)
        pixel_data[32][30] = 3; // x=30, y=32, (196, 196, 196)
        pixel_data[32][31] = 3; // x=31, y=32, (196, 196, 196)
        pixel_data[32][32] = 3; // x=32, y=32, (196, 196, 196)
        pixel_data[32][33] = 3; // x=33, y=32, (196, 196, 196)
        pixel_data[32][34] = 3; // x=34, y=32, (196, 196, 196)
        pixel_data[32][35] = 3; // x=35, y=32, (196, 196, 196)
        pixel_data[32][36] = 12; // x=36, y=32, (208, 207, 206)
        pixel_data[32][37] = 13; // x=37, y=32, (232, 231, 231)
        pixel_data[32][38] = 3; // x=38, y=32, (196, 196, 196)
        pixel_data[32][39] = 3; // x=39, y=32, (196, 196, 196)
        pixel_data[32][40] = 3; // x=40, y=32, (196, 196, 196)
        pixel_data[32][41] = 3; // x=41, y=32, (196, 196, 196)
        pixel_data[32][42] = 3; // x=42, y=32, (196, 196, 196)
        pixel_data[32][43] = 3; // x=43, y=32, (196, 196, 196)
        pixel_data[32][44] = 3; // x=44, y=32, (196, 196, 196)
        pixel_data[32][45] = 3; // x=45, y=32, (196, 196, 196)
        pixel_data[32][46] = 3; // x=46, y=32, (196, 196, 196)
        pixel_data[32][47] = 3; // x=47, y=32, (196, 196, 196)
        pixel_data[32][48] = 3; // x=48, y=32, (196, 196, 196)
        pixel_data[32][49] = 3; // x=49, y=32, (196, 196, 196)
        pixel_data[32][50] = 3; // x=50, y=32, (196, 196, 196)
        pixel_data[32][51] = 3; // x=51, y=32, (196, 196, 196)
        pixel_data[32][52] = 12; // x=52, y=32, (208, 207, 206)
        pixel_data[32][53] = 11; // x=53, y=32, (89, 89, 91)
        pixel_data[32][54] = 10; // x=54, y=32, (44, 44, 45)
        pixel_data[32][55] = 2; // x=55, y=32, (53, 53, 55)
        pixel_data[32][56] = 9; // x=56, y=32, (79, 79, 81)
        pixel_data[32][57] = 11; // x=57, y=32, (89, 89, 91)
        pixel_data[32][58] = 0; // x=58, y=32, transparent
        pixel_data[32][59] = 0; // x=59, y=32, transparent
        pixel_data[33][0] = 0; // x=0, y=33, transparent
        pixel_data[33][1] = 0; // x=1, y=33, transparent
        pixel_data[33][2] = 2; // x=2, y=33, (53, 53, 55)
        pixel_data[33][3] = 11; // x=3, y=33, (89, 89, 91)
        pixel_data[33][4] = 11; // x=4, y=33, (89, 89, 91)
        pixel_data[33][5] = 4; // x=5, y=33, (67, 67, 68)
        pixel_data[33][6] = 2; // x=6, y=33, (53, 53, 55)
        pixel_data[33][7] = 2; // x=7, y=33, (53, 53, 55)
        pixel_data[33][8] = 2; // x=8, y=33, (53, 53, 55)
        pixel_data[33][9] = 2; // x=9, y=33, (53, 53, 55)
        pixel_data[33][10] = 2; // x=10, y=33, (53, 53, 55)
        pixel_data[33][11] = 2; // x=11, y=33, (53, 53, 55)
        pixel_data[33][12] = 2; // x=12, y=33, (53, 53, 55)
        pixel_data[33][13] = 2; // x=13, y=33, (53, 53, 55)
        pixel_data[33][14] = 2; // x=14, y=33, (53, 53, 55)
        pixel_data[33][15] = 2; // x=15, y=33, (53, 53, 55)
        pixel_data[33][16] = 2; // x=16, y=33, (53, 53, 55)
        pixel_data[33][17] = 3; // x=17, y=33, (196, 196, 196)
        pixel_data[33][18] = 13; // x=18, y=33, (232, 231, 231)
        pixel_data[33][19] = 15; // x=19, y=33, (185, 181, 177)
        pixel_data[33][20] = 1; // x=20, y=33, (169, 168, 168)
        pixel_data[33][21] = 1; // x=21, y=33, (169, 168, 168)
        pixel_data[33][22] = 1; // x=22, y=33, (169, 168, 168)
        pixel_data[33][23] = 1; // x=23, y=33, (169, 168, 168)
        pixel_data[33][24] = 1; // x=24, y=33, (169, 168, 168)
        pixel_data[33][25] = 1; // x=25, y=33, (169, 168, 168)
        pixel_data[33][26] = 1; // x=26, y=33, (169, 168, 168)
        pixel_data[33][27] = 12; // x=27, y=33, (208, 207, 206)
        pixel_data[33][28] = 3; // x=28, y=33, (196, 196, 196)
        pixel_data[33][29] = 3; // x=29, y=33, (196, 196, 196)
        pixel_data[33][30] = 3; // x=30, y=33, (196, 196, 196)
        pixel_data[33][31] = 3; // x=31, y=33, (196, 196, 196)
        pixel_data[33][32] = 3; // x=32, y=33, (196, 196, 196)
        pixel_data[33][33] = 3; // x=33, y=33, (196, 196, 196)
        pixel_data[33][34] = 3; // x=34, y=33, (196, 196, 196)
        pixel_data[33][35] = 3; // x=35, y=33, (196, 196, 196)
        pixel_data[33][36] = 12; // x=36, y=33, (208, 207, 206)
        pixel_data[33][37] = 13; // x=37, y=33, (232, 231, 231)
        pixel_data[33][38] = 3; // x=38, y=33, (196, 196, 196)
        pixel_data[33][39] = 3; // x=39, y=33, (196, 196, 196)
        pixel_data[33][40] = 3; // x=40, y=33, (196, 196, 196)
        pixel_data[33][41] = 3; // x=41, y=33, (196, 196, 196)
        pixel_data[33][42] = 3; // x=42, y=33, (196, 196, 196)
        pixel_data[33][43] = 3; // x=43, y=33, (196, 196, 196)
        pixel_data[33][44] = 3; // x=44, y=33, (196, 196, 196)
        pixel_data[33][45] = 3; // x=45, y=33, (196, 196, 196)
        pixel_data[33][46] = 3; // x=46, y=33, (196, 196, 196)
        pixel_data[33][47] = 3; // x=47, y=33, (196, 196, 196)
        pixel_data[33][48] = 3; // x=48, y=33, (196, 196, 196)
        pixel_data[33][49] = 3; // x=49, y=33, (196, 196, 196)
        pixel_data[33][50] = 3; // x=50, y=33, (196, 196, 196)
        pixel_data[33][51] = 3; // x=51, y=33, (196, 196, 196)
        pixel_data[33][52] = 12; // x=52, y=33, (208, 207, 206)
        pixel_data[33][53] = 11; // x=53, y=33, (89, 89, 91)
        pixel_data[33][54] = 10; // x=54, y=33, (44, 44, 45)
        pixel_data[33][55] = 2; // x=55, y=33, (53, 53, 55)
        pixel_data[33][56] = 11; // x=56, y=33, (89, 89, 91)
        pixel_data[33][57] = 9; // x=57, y=33, (79, 79, 81)
        pixel_data[33][58] = 0; // x=58, y=33, transparent
        pixel_data[33][59] = 0; // x=59, y=33, transparent
        pixel_data[34][0] = 0; // x=0, y=34, transparent
        pixel_data[34][1] = 0; // x=1, y=34, transparent
        pixel_data[34][2] = 10; // x=2, y=34, (44, 44, 45)
        pixel_data[34][3] = 11; // x=3, y=34, (89, 89, 91)
        pixel_data[34][4] = 11; // x=4, y=34, (89, 89, 91)
        pixel_data[34][5] = 4; // x=5, y=34, (67, 67, 68)
        pixel_data[34][6] = 2; // x=6, y=34, (53, 53, 55)
        pixel_data[34][7] = 2; // x=7, y=34, (53, 53, 55)
        pixel_data[34][8] = 2; // x=8, y=34, (53, 53, 55)
        pixel_data[34][9] = 2; // x=9, y=34, (53, 53, 55)
        pixel_data[34][10] = 2; // x=10, y=34, (53, 53, 55)
        pixel_data[34][11] = 2; // x=11, y=34, (53, 53, 55)
        pixel_data[34][12] = 2; // x=12, y=34, (53, 53, 55)
        pixel_data[34][13] = 2; // x=13, y=34, (53, 53, 55)
        pixel_data[34][14] = 2; // x=14, y=34, (53, 53, 55)
        pixel_data[34][15] = 2; // x=15, y=34, (53, 53, 55)
        pixel_data[34][16] = 10; // x=16, y=34, (44, 44, 45)
        pixel_data[34][17] = 7; // x=17, y=34, (137, 136, 136)
        pixel_data[34][18] = 13; // x=18, y=34, (232, 231, 231)
        pixel_data[34][19] = 12; // x=19, y=34, (208, 207, 206)
        pixel_data[34][20] = 1; // x=20, y=34, (169, 168, 168)
        pixel_data[34][21] = 1; // x=21, y=34, (169, 168, 168)
        pixel_data[34][22] = 1; // x=22, y=34, (169, 168, 168)
        pixel_data[34][23] = 1; // x=23, y=34, (169, 168, 168)
        pixel_data[34][24] = 1; // x=24, y=34, (169, 168, 168)
        pixel_data[34][25] = 1; // x=25, y=34, (169, 168, 168)
        pixel_data[34][26] = 1; // x=26, y=34, (169, 168, 168)
        pixel_data[34][27] = 12; // x=27, y=34, (208, 207, 206)
        pixel_data[34][28] = 12; // x=28, y=34, (208, 207, 206)
        pixel_data[34][29] = 3; // x=29, y=34, (196, 196, 196)
        pixel_data[34][30] = 3; // x=30, y=34, (196, 196, 196)
        pixel_data[34][31] = 3; // x=31, y=34, (196, 196, 196)
        pixel_data[34][32] = 3; // x=32, y=34, (196, 196, 196)
        pixel_data[34][33] = 3; // x=33, y=34, (196, 196, 196)
        pixel_data[34][34] = 3; // x=34, y=34, (196, 196, 196)
        pixel_data[34][35] = 3; // x=35, y=34, (196, 196, 196)
        pixel_data[34][36] = 12; // x=36, y=34, (208, 207, 206)
        pixel_data[34][37] = 13; // x=37, y=34, (232, 231, 231)
        pixel_data[34][38] = 3; // x=38, y=34, (196, 196, 196)
        pixel_data[34][39] = 3; // x=39, y=34, (196, 196, 196)
        pixel_data[34][40] = 3; // x=40, y=34, (196, 196, 196)
        pixel_data[34][41] = 3; // x=41, y=34, (196, 196, 196)
        pixel_data[34][42] = 3; // x=42, y=34, (196, 196, 196)
        pixel_data[34][43] = 3; // x=43, y=34, (196, 196, 196)
        pixel_data[34][44] = 3; // x=44, y=34, (196, 196, 196)
        pixel_data[34][45] = 3; // x=45, y=34, (196, 196, 196)
        pixel_data[34][46] = 3; // x=46, y=34, (196, 196, 196)
        pixel_data[34][47] = 3; // x=47, y=34, (196, 196, 196)
        pixel_data[34][48] = 3; // x=48, y=34, (196, 196, 196)
        pixel_data[34][49] = 3; // x=49, y=34, (196, 196, 196)
        pixel_data[34][50] = 3; // x=50, y=34, (196, 196, 196)
        pixel_data[34][51] = 3; // x=51, y=34, (196, 196, 196)
        pixel_data[34][52] = 12; // x=52, y=34, (208, 207, 206)
        pixel_data[34][53] = 11; // x=53, y=34, (89, 89, 91)
        pixel_data[34][54] = 10; // x=54, y=34, (44, 44, 45)
        pixel_data[34][55] = 4; // x=55, y=34, (67, 67, 68)
        pixel_data[34][56] = 11; // x=56, y=34, (89, 89, 91)
        pixel_data[34][57] = 2; // x=57, y=34, (53, 53, 55)
        pixel_data[34][58] = 0; // x=58, y=34, transparent
        pixel_data[34][59] = 0; // x=59, y=34, transparent
        pixel_data[35][0] = 0; // x=0, y=35, transparent
        pixel_data[35][1] = 0; // x=1, y=35, transparent
        pixel_data[35][2] = 0; // x=2, y=35, transparent
        pixel_data[35][3] = 11; // x=3, y=35, (89, 89, 91)
        pixel_data[35][4] = 11; // x=4, y=35, (89, 89, 91)
        pixel_data[35][5] = 9; // x=5, y=35, (79, 79, 81)
        pixel_data[35][6] = 2; // x=6, y=35, (53, 53, 55)
        pixel_data[35][7] = 2; // x=7, y=35, (53, 53, 55)
        pixel_data[35][8] = 2; // x=8, y=35, (53, 53, 55)
        pixel_data[35][9] = 2; // x=9, y=35, (53, 53, 55)
        pixel_data[35][10] = 2; // x=10, y=35, (53, 53, 55)
        pixel_data[35][11] = 2; // x=11, y=35, (53, 53, 55)
        pixel_data[35][12] = 2; // x=12, y=35, (53, 53, 55)
        pixel_data[35][13] = 2; // x=13, y=35, (53, 53, 55)
        pixel_data[35][14] = 2; // x=14, y=35, (53, 53, 55)
        pixel_data[35][15] = 2; // x=15, y=35, (53, 53, 55)
        pixel_data[35][16] = 10; // x=16, y=35, (44, 44, 45)
        pixel_data[35][17] = 11; // x=17, y=35, (89, 89, 91)
        pixel_data[35][18] = 8; // x=18, y=35, (223, 221, 220)
        pixel_data[35][19] = 8; // x=19, y=35, (223, 221, 220)
        pixel_data[35][20] = 1; // x=20, y=35, (169, 168, 168)
        pixel_data[35][21] = 1; // x=21, y=35, (169, 168, 168)
        pixel_data[35][22] = 1; // x=22, y=35, (169, 168, 168)
        pixel_data[35][23] = 1; // x=23, y=35, (169, 168, 168)
        pixel_data[35][24] = 1; // x=24, y=35, (169, 168, 168)
        pixel_data[35][25] = 1; // x=25, y=35, (169, 168, 168)
        pixel_data[35][26] = 1; // x=26, y=35, (169, 168, 168)
        pixel_data[35][27] = 15; // x=27, y=35, (185, 181, 177)
        pixel_data[35][28] = 8; // x=28, y=35, (223, 221, 220)
        pixel_data[35][29] = 3; // x=29, y=35, (196, 196, 196)
        pixel_data[35][30] = 3; // x=30, y=35, (196, 196, 196)
        pixel_data[35][31] = 3; // x=31, y=35, (196, 196, 196)
        pixel_data[35][32] = 3; // x=32, y=35, (196, 196, 196)
        pixel_data[35][33] = 3; // x=33, y=35, (196, 196, 196)
        pixel_data[35][34] = 3; // x=34, y=35, (196, 196, 196)
        pixel_data[35][35] = 3; // x=35, y=35, (196, 196, 196)
        pixel_data[35][36] = 12; // x=36, y=35, (208, 207, 206)
        pixel_data[35][37] = 13; // x=37, y=35, (232, 231, 231)
        pixel_data[35][38] = 3; // x=38, y=35, (196, 196, 196)
        pixel_data[35][39] = 3; // x=39, y=35, (196, 196, 196)
        pixel_data[35][40] = 3; // x=40, y=35, (196, 196, 196)
        pixel_data[35][41] = 3; // x=41, y=35, (196, 196, 196)
        pixel_data[35][42] = 3; // x=42, y=35, (196, 196, 196)
        pixel_data[35][43] = 3; // x=43, y=35, (196, 196, 196)
        pixel_data[35][44] = 3; // x=44, y=35, (196, 196, 196)
        pixel_data[35][45] = 3; // x=45, y=35, (196, 196, 196)
        pixel_data[35][46] = 3; // x=46, y=35, (196, 196, 196)
        pixel_data[35][47] = 3; // x=47, y=35, (196, 196, 196)
        pixel_data[35][48] = 3; // x=48, y=35, (196, 196, 196)
        pixel_data[35][49] = 3; // x=49, y=35, (196, 196, 196)
        pixel_data[35][50] = 3; // x=50, y=35, (196, 196, 196)
        pixel_data[35][51] = 3; // x=51, y=35, (196, 196, 196)
        pixel_data[35][52] = 3; // x=52, y=35, (196, 196, 196)
        pixel_data[35][53] = 11; // x=53, y=35, (89, 89, 91)
        pixel_data[35][54] = 10; // x=54, y=35, (44, 44, 45)
        pixel_data[35][55] = 4; // x=55, y=35, (67, 67, 68)
        pixel_data[35][56] = 11; // x=56, y=35, (89, 89, 91)
        pixel_data[35][57] = 0; // x=57, y=35, transparent
        pixel_data[35][58] = 0; // x=58, y=35, transparent
        pixel_data[35][59] = 0; // x=59, y=35, transparent
        pixel_data[36][0] = 0; // x=0, y=36, transparent
        pixel_data[36][1] = 0; // x=1, y=36, transparent
        pixel_data[36][2] = 0; // x=2, y=36, transparent
        pixel_data[36][3] = 9; // x=3, y=36, (79, 79, 81)
        pixel_data[36][4] = 11; // x=4, y=36, (89, 89, 91)
        pixel_data[36][5] = 11; // x=5, y=36, (89, 89, 91)
        pixel_data[36][6] = 9; // x=6, y=36, (79, 79, 81)
        pixel_data[36][7] = 9; // x=7, y=36, (79, 79, 81)
        pixel_data[36][8] = 9; // x=8, y=36, (79, 79, 81)
        pixel_data[36][9] = 9; // x=9, y=36, (79, 79, 81)
        pixel_data[36][10] = 9; // x=10, y=36, (79, 79, 81)
        pixel_data[36][11] = 9; // x=11, y=36, (79, 79, 81)
        pixel_data[36][12] = 9; // x=12, y=36, (79, 79, 81)
        pixel_data[36][13] = 9; // x=13, y=36, (79, 79, 81)
        pixel_data[36][14] = 9; // x=14, y=36, (79, 79, 81)
        pixel_data[36][15] = 9; // x=15, y=36, (79, 79, 81)
        pixel_data[36][16] = 9; // x=16, y=36, (79, 79, 81)
        pixel_data[36][17] = 9; // x=17, y=36, (79, 79, 81)
        pixel_data[36][18] = 15; // x=18, y=36, (185, 181, 177)
        pixel_data[36][19] = 13; // x=19, y=36, (232, 231, 231)
        pixel_data[36][20] = 15; // x=20, y=36, (185, 181, 177)
        pixel_data[36][21] = 1; // x=21, y=36, (169, 168, 168)
        pixel_data[36][22] = 1; // x=22, y=36, (169, 168, 168)
        pixel_data[36][23] = 1; // x=23, y=36, (169, 168, 168)
        pixel_data[36][24] = 1; // x=24, y=36, (169, 168, 168)
        pixel_data[36][25] = 1; // x=25, y=36, (169, 168, 168)
        pixel_data[36][26] = 1; // x=26, y=36, (169, 168, 168)
        pixel_data[36][27] = 1; // x=27, y=36, (169, 168, 168)
        pixel_data[36][28] = 8; // x=28, y=36, (223, 221, 220)
        pixel_data[36][29] = 3; // x=29, y=36, (196, 196, 196)
        pixel_data[36][30] = 3; // x=30, y=36, (196, 196, 196)
        pixel_data[36][31] = 3; // x=31, y=36, (196, 196, 196)
        pixel_data[36][32] = 3; // x=32, y=36, (196, 196, 196)
        pixel_data[36][33] = 3; // x=33, y=36, (196, 196, 196)
        pixel_data[36][34] = 3; // x=34, y=36, (196, 196, 196)
        pixel_data[36][35] = 3; // x=35, y=36, (196, 196, 196)
        pixel_data[36][36] = 12; // x=36, y=36, (208, 207, 206)
        pixel_data[36][37] = 13; // x=37, y=36, (232, 231, 231)
        pixel_data[36][38] = 3; // x=38, y=36, (196, 196, 196)
        pixel_data[36][39] = 3; // x=39, y=36, (196, 196, 196)
        pixel_data[36][40] = 3; // x=40, y=36, (196, 196, 196)
        pixel_data[36][41] = 3; // x=41, y=36, (196, 196, 196)
        pixel_data[36][42] = 3; // x=42, y=36, (196, 196, 196)
        pixel_data[36][43] = 3; // x=43, y=36, (196, 196, 196)
        pixel_data[36][44] = 3; // x=44, y=36, (196, 196, 196)
        pixel_data[36][45] = 3; // x=45, y=36, (196, 196, 196)
        pixel_data[36][46] = 3; // x=46, y=36, (196, 196, 196)
        pixel_data[36][47] = 3; // x=47, y=36, (196, 196, 196)
        pixel_data[36][48] = 3; // x=48, y=36, (196, 196, 196)
        pixel_data[36][49] = 12; // x=49, y=36, (208, 207, 206)
        pixel_data[36][50] = 12; // x=50, y=36, (208, 207, 206)
        pixel_data[36][51] = 8; // x=51, y=36, (223, 221, 220)
        pixel_data[36][52] = 13; // x=52, y=36, (232, 231, 231)
        pixel_data[36][53] = 6; // x=53, y=36, (101, 101, 102)
        pixel_data[36][54] = 10; // x=54, y=36, (44, 44, 45)
        pixel_data[36][55] = 9; // x=55, y=36, (79, 79, 81)
        pixel_data[36][56] = 11; // x=56, y=36, (89, 89, 91)
        pixel_data[36][57] = 0; // x=57, y=36, transparent
        pixel_data[36][58] = 0; // x=58, y=36, transparent
        pixel_data[36][59] = 0; // x=59, y=36, transparent
        pixel_data[37][0] = 0; // x=0, y=37, transparent
        pixel_data[37][1] = 0; // x=1, y=37, transparent
        pixel_data[37][2] = 0; // x=2, y=37, transparent
        pixel_data[37][3] = 2; // x=3, y=37, (53, 53, 55)
        pixel_data[37][4] = 11; // x=4, y=37, (89, 89, 91)
        pixel_data[37][5] = 11; // x=5, y=37, (89, 89, 91)
        pixel_data[37][6] = 2; // x=6, y=37, (53, 53, 55)
        pixel_data[37][7] = 2; // x=7, y=37, (53, 53, 55)
        pixel_data[37][8] = 2; // x=8, y=37, (53, 53, 55)
        pixel_data[37][9] = 2; // x=9, y=37, (53, 53, 55)
        pixel_data[37][10] = 2; // x=10, y=37, (53, 53, 55)
        pixel_data[37][11] = 2; // x=11, y=37, (53, 53, 55)
        pixel_data[37][12] = 2; // x=12, y=37, (53, 53, 55)
        pixel_data[37][13] = 2; // x=13, y=37, (53, 53, 55)
        pixel_data[37][14] = 2; // x=14, y=37, (53, 53, 55)
        pixel_data[37][15] = 2; // x=15, y=37, (53, 53, 55)
        pixel_data[37][16] = 2; // x=16, y=37, (53, 53, 55)
        pixel_data[37][17] = 10; // x=17, y=37, (44, 44, 45)
        pixel_data[37][18] = 6; // x=18, y=37, (101, 101, 102)
        pixel_data[37][19] = 13; // x=19, y=37, (232, 231, 231)
        pixel_data[37][20] = 12; // x=20, y=37, (208, 207, 206)
        pixel_data[37][21] = 1; // x=21, y=37, (169, 168, 168)
        pixel_data[37][22] = 1; // x=22, y=37, (169, 168, 168)
        pixel_data[37][23] = 1; // x=23, y=37, (169, 168, 168)
        pixel_data[37][24] = 1; // x=24, y=37, (169, 168, 168)
        pixel_data[37][25] = 1; // x=25, y=37, (169, 168, 168)
        pixel_data[37][26] = 1; // x=26, y=37, (169, 168, 168)
        pixel_data[37][27] = 1; // x=27, y=37, (169, 168, 168)
        pixel_data[37][28] = 12; // x=28, y=37, (208, 207, 206)
        pixel_data[37][29] = 13; // x=29, y=37, (232, 231, 231)
        pixel_data[37][30] = 13; // x=30, y=37, (232, 231, 231)
        pixel_data[37][31] = 13; // x=31, y=37, (232, 231, 231)
        pixel_data[37][32] = 13; // x=32, y=37, (232, 231, 231)
        pixel_data[37][33] = 13; // x=33, y=37, (232, 231, 231)
        pixel_data[37][34] = 13; // x=34, y=37, (232, 231, 231)
        pixel_data[37][35] = 13; // x=35, y=37, (232, 231, 231)
        pixel_data[37][36] = 13; // x=36, y=37, (232, 231, 231)
        pixel_data[37][37] = 5; // x=37, y=37, (246, 246, 246)
        pixel_data[37][38] = 13; // x=38, y=37, (232, 231, 231)
        pixel_data[37][39] = 13; // x=39, y=37, (232, 231, 231)
        pixel_data[37][40] = 13; // x=40, y=37, (232, 231, 231)
        pixel_data[37][41] = 13; // x=41, y=37, (232, 231, 231)
        pixel_data[37][42] = 13; // x=42, y=37, (232, 231, 231)
        pixel_data[37][43] = 13; // x=43, y=37, (232, 231, 231)
        pixel_data[37][44] = 13; // x=44, y=37, (232, 231, 231)
        pixel_data[37][45] = 13; // x=45, y=37, (232, 231, 231)
        pixel_data[37][46] = 5; // x=46, y=37, (246, 246, 246)
        pixel_data[37][47] = 5; // x=47, y=37, (246, 246, 246)
        pixel_data[37][48] = 5; // x=48, y=37, (246, 246, 246)
        pixel_data[37][49] = 5; // x=49, y=37, (246, 246, 246)
        pixel_data[37][50] = 13; // x=50, y=37, (232, 231, 231)
        pixel_data[37][51] = 12; // x=51, y=37, (208, 207, 206)
        pixel_data[37][52] = 15; // x=52, y=37, (185, 181, 177)
        pixel_data[37][53] = 6; // x=53, y=37, (101, 101, 102)
        pixel_data[37][54] = 11; // x=54, y=37, (89, 89, 91)
        pixel_data[37][55] = 6; // x=55, y=37, (101, 101, 102)
        pixel_data[37][56] = 4; // x=56, y=37, (67, 67, 68)
        pixel_data[37][57] = 0; // x=57, y=37, transparent
        pixel_data[37][58] = 0; // x=58, y=37, transparent
        pixel_data[37][59] = 0; // x=59, y=37, transparent
        pixel_data[38][0] = 0; // x=0, y=38, transparent
        pixel_data[38][1] = 0; // x=1, y=38, transparent
        pixel_data[38][2] = 0; // x=2, y=38, transparent
        pixel_data[38][3] = 0; // x=3, y=38, transparent
        pixel_data[38][4] = 11; // x=4, y=38, (89, 89, 91)
        pixel_data[38][5] = 11; // x=5, y=38, (89, 89, 91)
        pixel_data[38][6] = 9; // x=6, y=38, (79, 79, 81)
        pixel_data[38][7] = 2; // x=7, y=38, (53, 53, 55)
        pixel_data[38][8] = 2; // x=8, y=38, (53, 53, 55)
        pixel_data[38][9] = 2; // x=9, y=38, (53, 53, 55)
        pixel_data[38][10] = 2; // x=10, y=38, (53, 53, 55)
        pixel_data[38][11] = 2; // x=11, y=38, (53, 53, 55)
        pixel_data[38][12] = 2; // x=12, y=38, (53, 53, 55)
        pixel_data[38][13] = 2; // x=13, y=38, (53, 53, 55)
        pixel_data[38][14] = 2; // x=14, y=38, (53, 53, 55)
        pixel_data[38][15] = 2; // x=15, y=38, (53, 53, 55)
        pixel_data[38][16] = 2; // x=16, y=38, (53, 53, 55)
        pixel_data[38][17] = 2; // x=17, y=38, (53, 53, 55)
        pixel_data[38][18] = 2; // x=18, y=38, (53, 53, 55)
        pixel_data[38][19] = 1; // x=19, y=38, (169, 168, 168)
        pixel_data[38][20] = 13; // x=20, y=38, (232, 231, 231)
        pixel_data[38][21] = 15; // x=21, y=38, (185, 181, 177)
        pixel_data[38][22] = 1; // x=22, y=38, (169, 168, 168)
        pixel_data[38][23] = 1; // x=23, y=38, (169, 168, 168)
        pixel_data[38][24] = 1; // x=24, y=38, (169, 168, 168)
        pixel_data[38][25] = 1; // x=25, y=38, (169, 168, 168)
        pixel_data[38][26] = 1; // x=26, y=38, (169, 168, 168)
        pixel_data[38][27] = 1; // x=27, y=38, (169, 168, 168)
        pixel_data[38][28] = 1; // x=28, y=38, (169, 168, 168)
        pixel_data[38][29] = 3; // x=29, y=38, (196, 196, 196)
        pixel_data[38][30] = 12; // x=30, y=38, (208, 207, 206)
        pixel_data[38][31] = 12; // x=31, y=38, (208, 207, 206)
        pixel_data[38][32] = 12; // x=32, y=38, (208, 207, 206)
        pixel_data[38][33] = 12; // x=33, y=38, (208, 207, 206)
        pixel_data[38][34] = 12; // x=34, y=38, (208, 207, 206)
        pixel_data[38][35] = 12; // x=35, y=38, (208, 207, 206)
        pixel_data[38][36] = 12; // x=36, y=38, (208, 207, 206)
        pixel_data[38][37] = 12; // x=37, y=38, (208, 207, 206)
        pixel_data[38][38] = 8; // x=38, y=38, (223, 221, 220)
        pixel_data[38][39] = 8; // x=39, y=38, (223, 221, 220)
        pixel_data[38][40] = 8; // x=40, y=38, (223, 221, 220)
        pixel_data[38][41] = 8; // x=41, y=38, (223, 221, 220)
        pixel_data[38][42] = 12; // x=42, y=38, (208, 207, 206)
        pixel_data[38][43] = 12; // x=43, y=38, (208, 207, 206)
        pixel_data[38][44] = 12; // x=44, y=38, (208, 207, 206)
        pixel_data[38][45] = 15; // x=45, y=38, (185, 181, 177)
        pixel_data[38][46] = 1; // x=46, y=38, (169, 168, 168)
        pixel_data[38][47] = 7; // x=47, y=38, (137, 136, 136)
        pixel_data[38][48] = 6; // x=48, y=38, (101, 101, 102)
        pixel_data[38][49] = 9; // x=49, y=38, (79, 79, 81)
        pixel_data[38][50] = 4; // x=50, y=38, (67, 67, 68)
        pixel_data[38][51] = 2; // x=51, y=38, (53, 53, 55)
        pixel_data[38][52] = 10; // x=52, y=38, (44, 44, 45)
        pixel_data[38][53] = 2; // x=53, y=38, (53, 53, 55)
        pixel_data[38][54] = 11; // x=54, y=38, (89, 89, 91)
        pixel_data[38][55] = 14; // x=55, y=38, (116, 116, 117)
        pixel_data[38][56] = 0; // x=56, y=38, transparent
        pixel_data[38][57] = 0; // x=57, y=38, transparent
        pixel_data[38][58] = 0; // x=58, y=38, transparent
        pixel_data[38][59] = 0; // x=59, y=38, transparent
        pixel_data[39][0] = 0; // x=0, y=39, transparent
        pixel_data[39][1] = 0; // x=1, y=39, transparent
        pixel_data[39][2] = 0; // x=2, y=39, transparent
        pixel_data[39][3] = 0; // x=3, y=39, transparent
        pixel_data[39][4] = 0; // x=4, y=39, transparent
        pixel_data[39][5] = 11; // x=5, y=39, (89, 89, 91)
        pixel_data[39][6] = 11; // x=6, y=39, (89, 89, 91)
        pixel_data[39][7] = 9; // x=7, y=39, (79, 79, 81)
        pixel_data[39][8] = 4; // x=8, y=39, (67, 67, 68)
        pixel_data[39][9] = 2; // x=9, y=39, (53, 53, 55)
        pixel_data[39][10] = 2; // x=10, y=39, (53, 53, 55)
        pixel_data[39][11] = 2; // x=11, y=39, (53, 53, 55)
        pixel_data[39][12] = 2; // x=12, y=39, (53, 53, 55)
        pixel_data[39][13] = 2; // x=13, y=39, (53, 53, 55)
        pixel_data[39][14] = 2; // x=14, y=39, (53, 53, 55)
        pixel_data[39][15] = 2; // x=15, y=39, (53, 53, 55)
        pixel_data[39][16] = 2; // x=16, y=39, (53, 53, 55)
        pixel_data[39][17] = 2; // x=17, y=39, (53, 53, 55)
        pixel_data[39][18] = 10; // x=18, y=39, (44, 44, 45)
        pixel_data[39][19] = 9; // x=19, y=39, (79, 79, 81)
        pixel_data[39][20] = 12; // x=20, y=39, (208, 207, 206)
        pixel_data[39][21] = 12; // x=21, y=39, (208, 207, 206)
        pixel_data[39][22] = 1; // x=22, y=39, (169, 168, 168)
        pixel_data[39][23] = 1; // x=23, y=39, (169, 168, 168)
        pixel_data[39][24] = 7; // x=24, y=39, (137, 136, 136)
        pixel_data[39][25] = 7; // x=25, y=39, (137, 136, 136)
        pixel_data[39][26] = 7; // x=26, y=39, (137, 136, 136)
        pixel_data[39][27] = 7; // x=27, y=39, (137, 136, 136)
        pixel_data[39][28] = 7; // x=28, y=39, (137, 136, 136)
        pixel_data[39][29] = 1; // x=29, y=39, (169, 168, 168)
        pixel_data[39][30] = 1; // x=30, y=39, (169, 168, 168)
        pixel_data[39][31] = 15; // x=31, y=39, (185, 181, 177)
        pixel_data[39][32] = 15; // x=32, y=39, (185, 181, 177)
        pixel_data[39][33] = 15; // x=33, y=39, (185, 181, 177)
        pixel_data[39][34] = 3; // x=34, y=39, (196, 196, 196)
        pixel_data[39][35] = 12; // x=35, y=39, (208, 207, 206)
        pixel_data[39][36] = 1; // x=36, y=39, (169, 168, 168)
        pixel_data[39][37] = 1; // x=37, y=39, (169, 168, 168)
        pixel_data[39][38] = 3; // x=38, y=39, (196, 196, 196)
        pixel_data[39][39] = 12; // x=39, y=39, (208, 207, 206)
        pixel_data[39][40] = 8; // x=40, y=39, (223, 221, 220)
        pixel_data[39][41] = 15; // x=41, y=39, (185, 181, 177)
        pixel_data[39][42] = 15; // x=42, y=39, (185, 181, 177)
        pixel_data[39][43] = 15; // x=43, y=39, (185, 181, 177)
        pixel_data[39][44] = 15; // x=44, y=39, (185, 181, 177)
        pixel_data[39][45] = 6; // x=45, y=39, (101, 101, 102)
        pixel_data[39][46] = 9; // x=46, y=39, (79, 79, 81)
        pixel_data[39][47] = 9; // x=47, y=39, (79, 79, 81)
        pixel_data[39][48] = 9; // x=48, y=39, (79, 79, 81)
        pixel_data[39][49] = 4; // x=49, y=39, (67, 67, 68)
        pixel_data[39][50] = 4; // x=50, y=39, (67, 67, 68)
        pixel_data[39][51] = 4; // x=51, y=39, (67, 67, 68)
        pixel_data[39][52] = 9; // x=52, y=39, (79, 79, 81)
        pixel_data[39][53] = 11; // x=53, y=39, (89, 89, 91)
        pixel_data[39][54] = 11; // x=54, y=39, (89, 89, 91)
        pixel_data[39][55] = 2; // x=55, y=39, (53, 53, 55)
        pixel_data[39][56] = 0; // x=56, y=39, transparent
        pixel_data[39][57] = 0; // x=57, y=39, transparent
        pixel_data[39][58] = 0; // x=58, y=39, transparent
        pixel_data[39][59] = 0; // x=59, y=39, transparent
        pixel_data[40][0] = 0; // x=0, y=40, transparent
        pixel_data[40][1] = 0; // x=1, y=40, transparent
        pixel_data[40][2] = 0; // x=2, y=40, transparent
        pixel_data[40][3] = 0; // x=3, y=40, transparent
        pixel_data[40][4] = 0; // x=4, y=40, transparent
        pixel_data[40][5] = 0; // x=5, y=40, transparent
        pixel_data[40][6] = 9; // x=6, y=40, (79, 79, 81)
        pixel_data[40][7] = 11; // x=7, y=40, (89, 89, 91)
        pixel_data[40][8] = 11; // x=8, y=40, (89, 89, 91)
        pixel_data[40][9] = 9; // x=9, y=40, (79, 79, 81)
        pixel_data[40][10] = 9; // x=10, y=40, (79, 79, 81)
        pixel_data[40][11] = 4; // x=11, y=40, (67, 67, 68)
        pixel_data[40][12] = 4; // x=12, y=40, (67, 67, 68)
        pixel_data[40][13] = 4; // x=13, y=40, (67, 67, 68)
        pixel_data[40][14] = 4; // x=14, y=40, (67, 67, 68)
        pixel_data[40][15] = 4; // x=15, y=40, (67, 67, 68)
        pixel_data[40][16] = 4; // x=16, y=40, (67, 67, 68)
        pixel_data[40][17] = 4; // x=17, y=40, (67, 67, 68)
        pixel_data[40][18] = 4; // x=18, y=40, (67, 67, 68)
        pixel_data[40][19] = 4; // x=19, y=40, (67, 67, 68)
        pixel_data[40][20] = 6; // x=20, y=40, (101, 101, 102)
        pixel_data[40][21] = 6; // x=21, y=40, (101, 101, 102)
        pixel_data[40][22] = 7; // x=22, y=40, (137, 136, 136)
        pixel_data[40][23] = 1; // x=23, y=40, (169, 168, 168)
        pixel_data[40][24] = 15; // x=24, y=40, (185, 181, 177)
        pixel_data[40][25] = 3; // x=25, y=40, (196, 196, 196)
        pixel_data[40][26] = 12; // x=26, y=40, (208, 207, 206)
        pixel_data[40][27] = 8; // x=27, y=40, (223, 221, 220)
        pixel_data[40][28] = 13; // x=28, y=40, (232, 231, 231)
        pixel_data[40][29] = 13; // x=29, y=40, (232, 231, 231)
        pixel_data[40][30] = 13; // x=30, y=40, (232, 231, 231)
        pixel_data[40][31] = 8; // x=31, y=40, (223, 221, 220)
        pixel_data[40][32] = 8; // x=32, y=40, (223, 221, 220)
        pixel_data[40][33] = 8; // x=33, y=40, (223, 221, 220)
        pixel_data[40][34] = 13; // x=34, y=40, (232, 231, 231)
        pixel_data[40][35] = 5; // x=35, y=40, (246, 246, 246)
        pixel_data[40][36] = 12; // x=36, y=40, (208, 207, 206)
        pixel_data[40][37] = 12; // x=37, y=40, (208, 207, 206)
        pixel_data[40][38] = 13; // x=38, y=40, (232, 231, 231)
        pixel_data[40][39] = 8; // x=39, y=40, (223, 221, 220)
        pixel_data[40][40] = 5; // x=40, y=40, (246, 246, 246)
        pixel_data[40][41] = 5; // x=41, y=40, (246, 246, 246)
        pixel_data[40][42] = 8; // x=42, y=40, (223, 221, 220)
        pixel_data[40][43] = 13; // x=43, y=40, (232, 231, 231)
        pixel_data[40][44] = 13; // x=44, y=40, (232, 231, 231)
        pixel_data[40][45] = 8; // x=45, y=40, (223, 221, 220)
        pixel_data[40][46] = 14; // x=46, y=40, (116, 116, 117)
        pixel_data[40][47] = 11; // x=47, y=40, (89, 89, 91)
        pixel_data[40][48] = 11; // x=48, y=40, (89, 89, 91)
        pixel_data[40][49] = 11; // x=49, y=40, (89, 89, 91)
        pixel_data[40][50] = 11; // x=50, y=40, (89, 89, 91)
        pixel_data[40][51] = 11; // x=51, y=40, (89, 89, 91)
        pixel_data[40][52] = 9; // x=52, y=40, (79, 79, 81)
        pixel_data[40][53] = 4; // x=53, y=40, (67, 67, 68)
        pixel_data[40][54] = 10; // x=54, y=40, (44, 44, 45)
        pixel_data[40][55] = 0; // x=55, y=40, transparent
        pixel_data[40][56] = 0; // x=56, y=40, transparent
        pixel_data[40][57] = 0; // x=57, y=40, transparent
        pixel_data[40][58] = 0; // x=58, y=40, transparent
        pixel_data[40][59] = 0; // x=59, y=40, transparent
        pixel_data[41][0] = 0; // x=0, y=41, transparent
        pixel_data[41][1] = 0; // x=1, y=41, transparent
        pixel_data[41][2] = 0; // x=2, y=41, transparent
        pixel_data[41][3] = 0; // x=3, y=41, transparent
        pixel_data[41][4] = 0; // x=4, y=41, transparent
        pixel_data[41][5] = 0; // x=5, y=41, transparent
        pixel_data[41][6] = 0; // x=6, y=41, transparent
        pixel_data[41][7] = 0; // x=7, y=41, transparent
        pixel_data[41][8] = 10; // x=8, y=41, (44, 44, 45)
        pixel_data[41][9] = 2; // x=9, y=41, (53, 53, 55)
        pixel_data[41][10] = 2; // x=10, y=41, (53, 53, 55)
        pixel_data[41][11] = 4; // x=11, y=41, (67, 67, 68)
        pixel_data[41][12] = 4; // x=12, y=41, (67, 67, 68)
        pixel_data[41][13] = 4; // x=13, y=41, (67, 67, 68)
        pixel_data[41][14] = 4; // x=14, y=41, (67, 67, 68)
        pixel_data[41][15] = 4; // x=15, y=41, (67, 67, 68)
        pixel_data[41][16] = 4; // x=16, y=41, (67, 67, 68)
        pixel_data[41][17] = 4; // x=17, y=41, (67, 67, 68)
        pixel_data[41][18] = 4; // x=18, y=41, (67, 67, 68)
        pixel_data[41][19] = 4; // x=19, y=41, (67, 67, 68)
        pixel_data[41][20] = 4; // x=20, y=41, (67, 67, 68)
        pixel_data[41][21] = 4; // x=21, y=41, (67, 67, 68)
        pixel_data[41][22] = 9; // x=22, y=41, (79, 79, 81)
        pixel_data[41][23] = 14; // x=23, y=41, (116, 116, 117)
        pixel_data[41][24] = 7; // x=24, y=41, (137, 136, 136)
        pixel_data[41][25] = 6; // x=25, y=41, (101, 101, 102)
        pixel_data[41][26] = 14; // x=26, y=41, (116, 116, 117)
        pixel_data[41][27] = 14; // x=27, y=41, (116, 116, 117)
        pixel_data[41][28] = 14; // x=28, y=41, (116, 116, 117)
        pixel_data[41][29] = 14; // x=29, y=41, (116, 116, 117)
        pixel_data[41][30] = 14; // x=30, y=41, (116, 116, 117)
        pixel_data[41][31] = 7; // x=31, y=41, (137, 136, 136)
        pixel_data[41][32] = 7; // x=32, y=41, (137, 136, 136)
        pixel_data[41][33] = 7; // x=33, y=41, (137, 136, 136)
        pixel_data[41][34] = 15; // x=34, y=41, (185, 181, 177)
        pixel_data[41][35] = 1; // x=35, y=41, (169, 168, 168)
        pixel_data[41][36] = 7; // x=36, y=41, (137, 136, 136)
        pixel_data[41][37] = 7; // x=37, y=41, (137, 136, 136)
        pixel_data[41][38] = 1; // x=38, y=41, (169, 168, 168)
        pixel_data[41][39] = 15; // x=39, y=41, (185, 181, 177)
        pixel_data[41][40] = 7; // x=40, y=41, (137, 136, 136)
        pixel_data[41][41] = 7; // x=41, y=41, (137, 136, 136)
        pixel_data[41][42] = 14; // x=42, y=41, (116, 116, 117)
        pixel_data[41][43] = 14; // x=43, y=41, (116, 116, 117)
        pixel_data[41][44] = 6; // x=44, y=41, (101, 101, 102)
        pixel_data[41][45] = 11; // x=45, y=41, (89, 89, 91)
        pixel_data[41][46] = 4; // x=46, y=41, (67, 67, 68)
        pixel_data[41][47] = 2; // x=47, y=41, (53, 53, 55)
        pixel_data[41][48] = 10; // x=48, y=41, (44, 44, 45)
        pixel_data[41][49] = 10; // x=49, y=41, (44, 44, 45)
        pixel_data[41][50] = 10; // x=50, y=41, (44, 44, 45)
        pixel_data[41][51] = 0; // x=51, y=41, transparent
        pixel_data[41][52] = 0; // x=52, y=41, transparent
        pixel_data[41][53] = 0; // x=53, y=41, transparent
        pixel_data[41][54] = 0; // x=54, y=41, transparent
        pixel_data[41][55] = 0; // x=55, y=41, transparent
        pixel_data[41][56] = 0; // x=56, y=41, transparent
        pixel_data[41][57] = 0; // x=57, y=41, transparent
        pixel_data[41][58] = 0; // x=58, y=41, transparent
        pixel_data[41][59] = 0; // x=59, y=41, transparent
        pixel_data[42][0] = 0; // x=0, y=42, transparent
        pixel_data[42][1] = 0; // x=1, y=42, transparent
        pixel_data[42][2] = 0; // x=2, y=42, transparent
        pixel_data[42][3] = 0; // x=3, y=42, transparent
        pixel_data[42][4] = 0; // x=4, y=42, transparent
        pixel_data[42][5] = 0; // x=5, y=42, transparent
        pixel_data[42][6] = 0; // x=6, y=42, transparent
        pixel_data[42][7] = 0; // x=7, y=42, transparent
        pixel_data[42][8] = 0; // x=8, y=42, transparent
        pixel_data[42][9] = 0; // x=9, y=42, transparent
        pixel_data[42][10] = 0; // x=10, y=42, transparent
        pixel_data[42][11] = 0; // x=11, y=42, transparent
        pixel_data[42][12] = 0; // x=12, y=42, transparent
        pixel_data[42][13] = 0; // x=13, y=42, transparent
        pixel_data[42][14] = 0; // x=14, y=42, transparent
        pixel_data[42][15] = 0; // x=15, y=42, transparent
        pixel_data[42][16] = 0; // x=16, y=42, transparent
        pixel_data[42][17] = 0; // x=17, y=42, transparent
        pixel_data[42][18] = 0; // x=18, y=42, transparent
        pixel_data[42][19] = 0; // x=19, y=42, transparent
        pixel_data[42][20] = 0; // x=20, y=42, transparent
        pixel_data[42][21] = 0; // x=21, y=42, transparent
        pixel_data[42][22] = 10; // x=22, y=42, (44, 44, 45)
        pixel_data[42][23] = 4; // x=23, y=42, (67, 67, 68)
        pixel_data[42][24] = 11; // x=24, y=42, (89, 89, 91)
        pixel_data[42][25] = 0; // x=25, y=42, transparent
        pixel_data[42][26] = 0; // x=26, y=42, transparent
        pixel_data[42][27] = 0; // x=27, y=42, transparent
        pixel_data[42][28] = 0; // x=28, y=42, transparent
        pixel_data[42][29] = 0; // x=29, y=42, transparent
        pixel_data[42][30] = 0; // x=30, y=42, transparent
        pixel_data[42][31] = 0; // x=31, y=42, transparent
        pixel_data[42][32] = 0; // x=32, y=42, transparent
        pixel_data[42][33] = 0; // x=33, y=42, transparent
        pixel_data[42][34] = 0; // x=34, y=42, transparent
        pixel_data[42][35] = 0; // x=35, y=42, transparent
        pixel_data[42][36] = 0; // x=36, y=42, transparent
        pixel_data[42][37] = 0; // x=37, y=42, transparent
        pixel_data[42][38] = 0; // x=38, y=42, transparent
        pixel_data[42][39] = 0; // x=39, y=42, transparent
        pixel_data[42][40] = 0; // x=40, y=42, transparent
        pixel_data[42][41] = 0; // x=41, y=42, transparent
        pixel_data[42][42] = 0; // x=42, y=42, transparent
        pixel_data[42][43] = 0; // x=43, y=42, transparent
        pixel_data[42][44] = 0; // x=44, y=42, transparent
        pixel_data[42][45] = 0; // x=45, y=42, transparent
        pixel_data[42][46] = 0; // x=46, y=42, transparent
        pixel_data[42][47] = 0; // x=47, y=42, transparent
        pixel_data[42][48] = 0; // x=48, y=42, transparent
        pixel_data[42][49] = 0; // x=49, y=42, transparent
        pixel_data[42][50] = 0; // x=50, y=42, transparent
        pixel_data[42][51] = 0; // x=51, y=42, transparent
        pixel_data[42][52] = 0; // x=52, y=42, transparent
        pixel_data[42][53] = 0; // x=53, y=42, transparent
        pixel_data[42][54] = 0; // x=54, y=42, transparent
        pixel_data[42][55] = 0; // x=55, y=42, transparent
        pixel_data[42][56] = 0; // x=56, y=42, transparent
        pixel_data[42][57] = 0; // x=57, y=42, transparent
        pixel_data[42][58] = 0; // x=58, y=42, transparent
        pixel_data[42][59] = 0; // x=59, y=42, transparent
        pixel_data[43][0] = 0; // x=0, y=43, transparent
        pixel_data[43][1] = 0; // x=1, y=43, transparent
        pixel_data[43][2] = 0; // x=2, y=43, transparent
        pixel_data[43][3] = 0; // x=3, y=43, transparent
        pixel_data[43][4] = 0; // x=4, y=43, transparent
        pixel_data[43][5] = 0; // x=5, y=43, transparent
        pixel_data[43][6] = 0; // x=6, y=43, transparent
        pixel_data[43][7] = 0; // x=7, y=43, transparent
        pixel_data[43][8] = 0; // x=8, y=43, transparent
        pixel_data[43][9] = 0; // x=9, y=43, transparent
        pixel_data[43][10] = 0; // x=10, y=43, transparent
        pixel_data[43][11] = 0; // x=11, y=43, transparent
        pixel_data[43][12] = 0; // x=12, y=43, transparent
        pixel_data[43][13] = 0; // x=13, y=43, transparent
        pixel_data[43][14] = 0; // x=14, y=43, transparent
        pixel_data[43][15] = 0; // x=15, y=43, transparent
        pixel_data[43][16] = 0; // x=16, y=43, transparent
        pixel_data[43][17] = 0; // x=17, y=43, transparent
        pixel_data[43][18] = 0; // x=18, y=43, transparent
        pixel_data[43][19] = 0; // x=19, y=43, transparent
        pixel_data[43][20] = 0; // x=20, y=43, transparent
        pixel_data[43][21] = 0; // x=21, y=43, transparent
        pixel_data[43][22] = 0; // x=22, y=43, transparent
        pixel_data[43][23] = 2; // x=23, y=43, (53, 53, 55)
        pixel_data[43][24] = 6; // x=24, y=43, (101, 101, 102)
        pixel_data[43][25] = 0; // x=25, y=43, transparent
        pixel_data[43][26] = 0; // x=26, y=43, transparent
        pixel_data[43][27] = 0; // x=27, y=43, transparent
        pixel_data[43][28] = 0; // x=28, y=43, transparent
        pixel_data[43][29] = 0; // x=29, y=43, transparent
        pixel_data[43][30] = 0; // x=30, y=43, transparent
        pixel_data[43][31] = 0; // x=31, y=43, transparent
        pixel_data[43][32] = 0; // x=32, y=43, transparent
        pixel_data[43][33] = 0; // x=33, y=43, transparent
        pixel_data[43][34] = 0; // x=34, y=43, transparent
        pixel_data[43][35] = 0; // x=35, y=43, transparent
        pixel_data[43][36] = 0; // x=36, y=43, transparent
        pixel_data[43][37] = 0; // x=37, y=43, transparent
        pixel_data[43][38] = 0; // x=38, y=43, transparent
        pixel_data[43][39] = 0; // x=39, y=43, transparent
        pixel_data[43][40] = 0; // x=40, y=43, transparent
        pixel_data[43][41] = 0; // x=41, y=43, transparent
        pixel_data[43][42] = 0; // x=42, y=43, transparent
        pixel_data[43][43] = 0; // x=43, y=43, transparent
        pixel_data[43][44] = 0; // x=44, y=43, transparent
        pixel_data[43][45] = 0; // x=45, y=43, transparent
        pixel_data[43][46] = 0; // x=46, y=43, transparent
        pixel_data[43][47] = 0; // x=47, y=43, transparent
        pixel_data[43][48] = 0; // x=48, y=43, transparent
        pixel_data[43][49] = 0; // x=49, y=43, transparent
        pixel_data[43][50] = 0; // x=50, y=43, transparent
        pixel_data[43][51] = 0; // x=51, y=43, transparent
        pixel_data[43][52] = 0; // x=52, y=43, transparent
        pixel_data[43][53] = 0; // x=53, y=43, transparent
        pixel_data[43][54] = 0; // x=54, y=43, transparent
        pixel_data[43][55] = 0; // x=55, y=43, transparent
        pixel_data[43][56] = 0; // x=56, y=43, transparent
        pixel_data[43][57] = 0; // x=57, y=43, transparent
        pixel_data[43][58] = 0; // x=58, y=43, transparent
        pixel_data[43][59] = 0; // x=59, y=43, transparent
        pixel_data[44][0] = 0; // x=0, y=44, transparent
        pixel_data[44][1] = 0; // x=1, y=44, transparent
        pixel_data[44][2] = 0; // x=2, y=44, transparent
        pixel_data[44][3] = 0; // x=3, y=44, transparent
        pixel_data[44][4] = 0; // x=4, y=44, transparent
        pixel_data[44][5] = 0; // x=5, y=44, transparent
        pixel_data[44][6] = 0; // x=6, y=44, transparent
        pixel_data[44][7] = 0; // x=7, y=44, transparent
        pixel_data[44][8] = 0; // x=8, y=44, transparent
        pixel_data[44][9] = 0; // x=9, y=44, transparent
        pixel_data[44][10] = 0; // x=10, y=44, transparent
        pixel_data[44][11] = 0; // x=11, y=44, transparent
        pixel_data[44][12] = 0; // x=12, y=44, transparent
        pixel_data[44][13] = 0; // x=13, y=44, transparent
        pixel_data[44][14] = 0; // x=14, y=44, transparent
        pixel_data[44][15] = 0; // x=15, y=44, transparent
        pixel_data[44][16] = 0; // x=16, y=44, transparent
        pixel_data[44][17] = 0; // x=17, y=44, transparent
        pixel_data[44][18] = 0; // x=18, y=44, transparent
        pixel_data[44][19] = 0; // x=19, y=44, transparent
        pixel_data[44][20] = 0; // x=20, y=44, transparent
        pixel_data[44][21] = 0; // x=21, y=44, transparent
        pixel_data[44][22] = 0; // x=22, y=44, transparent
        pixel_data[44][23] = 0; // x=23, y=44, transparent
        pixel_data[44][24] = 0; // x=24, y=44, transparent
        pixel_data[44][25] = 0; // x=25, y=44, transparent
        pixel_data[44][26] = 0; // x=26, y=44, transparent
        pixel_data[44][27] = 0; // x=27, y=44, transparent
        pixel_data[44][28] = 0; // x=28, y=44, transparent
        pixel_data[44][29] = 0; // x=29, y=44, transparent
        pixel_data[44][30] = 0; // x=30, y=44, transparent
        pixel_data[44][31] = 0; // x=31, y=44, transparent
        pixel_data[44][32] = 0; // x=32, y=44, transparent
        pixel_data[44][33] = 0; // x=33, y=44, transparent
        pixel_data[44][34] = 0; // x=34, y=44, transparent
        pixel_data[44][35] = 0; // x=35, y=44, transparent
        pixel_data[44][36] = 0; // x=36, y=44, transparent
        pixel_data[44][37] = 0; // x=37, y=44, transparent
        pixel_data[44][38] = 0; // x=38, y=44, transparent
        pixel_data[44][39] = 0; // x=39, y=44, transparent
        pixel_data[44][40] = 0; // x=40, y=44, transparent
        pixel_data[44][41] = 0; // x=41, y=44, transparent
        pixel_data[44][42] = 0; // x=42, y=44, transparent
        pixel_data[44][43] = 0; // x=43, y=44, transparent
        pixel_data[44][44] = 0; // x=44, y=44, transparent
        pixel_data[44][45] = 0; // x=45, y=44, transparent
        pixel_data[44][46] = 0; // x=46, y=44, transparent
        pixel_data[44][47] = 0; // x=47, y=44, transparent
        pixel_data[44][48] = 0; // x=48, y=44, transparent
        pixel_data[44][49] = 0; // x=49, y=44, transparent
        pixel_data[44][50] = 0; // x=50, y=44, transparent
        pixel_data[44][51] = 0; // x=51, y=44, transparent
        pixel_data[44][52] = 0; // x=52, y=44, transparent
        pixel_data[44][53] = 0; // x=53, y=44, transparent
        pixel_data[44][54] = 0; // x=54, y=44, transparent
        pixel_data[44][55] = 0; // x=55, y=44, transparent
        pixel_data[44][56] = 0; // x=56, y=44, transparent
        pixel_data[44][57] = 0; // x=57, y=44, transparent
        pixel_data[44][58] = 0; // x=58, y=44, transparent
        pixel_data[44][59] = 0; // x=59, y=44, transparent
        pixel_data[45][0] = 0; // x=0, y=45, transparent
        pixel_data[45][1] = 0; // x=1, y=45, transparent
        pixel_data[45][2] = 0; // x=2, y=45, transparent
        pixel_data[45][3] = 0; // x=3, y=45, transparent
        pixel_data[45][4] = 0; // x=4, y=45, transparent
        pixel_data[45][5] = 0; // x=5, y=45, transparent
        pixel_data[45][6] = 0; // x=6, y=45, transparent
        pixel_data[45][7] = 0; // x=7, y=45, transparent
        pixel_data[45][8] = 0; // x=8, y=45, transparent
        pixel_data[45][9] = 0; // x=9, y=45, transparent
        pixel_data[45][10] = 0; // x=10, y=45, transparent
        pixel_data[45][11] = 0; // x=11, y=45, transparent
        pixel_data[45][12] = 0; // x=12, y=45, transparent
        pixel_data[45][13] = 0; // x=13, y=45, transparent
        pixel_data[45][14] = 0; // x=14, y=45, transparent
        pixel_data[45][15] = 0; // x=15, y=45, transparent
        pixel_data[45][16] = 0; // x=16, y=45, transparent
        pixel_data[45][17] = 0; // x=17, y=45, transparent
        pixel_data[45][18] = 0; // x=18, y=45, transparent
        pixel_data[45][19] = 0; // x=19, y=45, transparent
        pixel_data[45][20] = 0; // x=20, y=45, transparent
        pixel_data[45][21] = 0; // x=21, y=45, transparent
        pixel_data[45][22] = 0; // x=22, y=45, transparent
        pixel_data[45][23] = 0; // x=23, y=45, transparent
        pixel_data[45][24] = 0; // x=24, y=45, transparent
        pixel_data[45][25] = 0; // x=25, y=45, transparent
        pixel_data[45][26] = 0; // x=26, y=45, transparent
        pixel_data[45][27] = 0; // x=27, y=45, transparent
        pixel_data[45][28] = 0; // x=28, y=45, transparent
        pixel_data[45][29] = 0; // x=29, y=45, transparent
        pixel_data[45][30] = 0; // x=30, y=45, transparent
        pixel_data[45][31] = 0; // x=31, y=45, transparent
        pixel_data[45][32] = 0; // x=32, y=45, transparent
        pixel_data[45][33] = 0; // x=33, y=45, transparent
        pixel_data[45][34] = 0; // x=34, y=45, transparent
        pixel_data[45][35] = 0; // x=35, y=45, transparent
        pixel_data[45][36] = 0; // x=36, y=45, transparent
        pixel_data[45][37] = 0; // x=37, y=45, transparent
        pixel_data[45][38] = 0; // x=38, y=45, transparent
        pixel_data[45][39] = 0; // x=39, y=45, transparent
        pixel_data[45][40] = 0; // x=40, y=45, transparent
        pixel_data[45][41] = 0; // x=41, y=45, transparent
        pixel_data[45][42] = 0; // x=42, y=45, transparent
        pixel_data[45][43] = 0; // x=43, y=45, transparent
        pixel_data[45][44] = 0; // x=44, y=45, transparent
        pixel_data[45][45] = 0; // x=45, y=45, transparent
        pixel_data[45][46] = 0; // x=46, y=45, transparent
        pixel_data[45][47] = 0; // x=47, y=45, transparent
        pixel_data[45][48] = 0; // x=48, y=45, transparent
        pixel_data[45][49] = 0; // x=49, y=45, transparent
        pixel_data[45][50] = 0; // x=50, y=45, transparent
        pixel_data[45][51] = 0; // x=51, y=45, transparent
        pixel_data[45][52] = 0; // x=52, y=45, transparent
        pixel_data[45][53] = 0; // x=53, y=45, transparent
        pixel_data[45][54] = 0; // x=54, y=45, transparent
        pixel_data[45][55] = 0; // x=55, y=45, transparent
        pixel_data[45][56] = 0; // x=56, y=45, transparent
        pixel_data[45][57] = 0; // x=57, y=45, transparent
        pixel_data[45][58] = 0; // x=58, y=45, transparent
        pixel_data[45][59] = 0; // x=59, y=45, transparent
        pixel_data[46][0] = 0; // x=0, y=46, transparent
        pixel_data[46][1] = 0; // x=1, y=46, transparent
        pixel_data[46][2] = 0; // x=2, y=46, transparent
        pixel_data[46][3] = 0; // x=3, y=46, transparent
        pixel_data[46][4] = 0; // x=4, y=46, transparent
        pixel_data[46][5] = 0; // x=5, y=46, transparent
        pixel_data[46][6] = 0; // x=6, y=46, transparent
        pixel_data[46][7] = 0; // x=7, y=46, transparent
        pixel_data[46][8] = 0; // x=8, y=46, transparent
        pixel_data[46][9] = 0; // x=9, y=46, transparent
        pixel_data[46][10] = 0; // x=10, y=46, transparent
        pixel_data[46][11] = 0; // x=11, y=46, transparent
        pixel_data[46][12] = 0; // x=12, y=46, transparent
        pixel_data[46][13] = 0; // x=13, y=46, transparent
        pixel_data[46][14] = 0; // x=14, y=46, transparent
        pixel_data[46][15] = 0; // x=15, y=46, transparent
        pixel_data[46][16] = 0; // x=16, y=46, transparent
        pixel_data[46][17] = 0; // x=17, y=46, transparent
        pixel_data[46][18] = 0; // x=18, y=46, transparent
        pixel_data[46][19] = 0; // x=19, y=46, transparent
        pixel_data[46][20] = 0; // x=20, y=46, transparent
        pixel_data[46][21] = 0; // x=21, y=46, transparent
        pixel_data[46][22] = 0; // x=22, y=46, transparent
        pixel_data[46][23] = 0; // x=23, y=46, transparent
        pixel_data[46][24] = 0; // x=24, y=46, transparent
        pixel_data[46][25] = 0; // x=25, y=46, transparent
        pixel_data[46][26] = 0; // x=26, y=46, transparent
        pixel_data[46][27] = 0; // x=27, y=46, transparent
        pixel_data[46][28] = 0; // x=28, y=46, transparent
        pixel_data[46][29] = 0; // x=29, y=46, transparent
        pixel_data[46][30] = 0; // x=30, y=46, transparent
        pixel_data[46][31] = 0; // x=31, y=46, transparent
        pixel_data[46][32] = 0; // x=32, y=46, transparent
        pixel_data[46][33] = 0; // x=33, y=46, transparent
        pixel_data[46][34] = 0; // x=34, y=46, transparent
        pixel_data[46][35] = 0; // x=35, y=46, transparent
        pixel_data[46][36] = 0; // x=36, y=46, transparent
        pixel_data[46][37] = 0; // x=37, y=46, transparent
        pixel_data[46][38] = 0; // x=38, y=46, transparent
        pixel_data[46][39] = 0; // x=39, y=46, transparent
        pixel_data[46][40] = 0; // x=40, y=46, transparent
        pixel_data[46][41] = 0; // x=41, y=46, transparent
        pixel_data[46][42] = 0; // x=42, y=46, transparent
        pixel_data[46][43] = 0; // x=43, y=46, transparent
        pixel_data[46][44] = 0; // x=44, y=46, transparent
        pixel_data[46][45] = 0; // x=45, y=46, transparent
        pixel_data[46][46] = 0; // x=46, y=46, transparent
        pixel_data[46][47] = 0; // x=47, y=46, transparent
        pixel_data[46][48] = 0; // x=48, y=46, transparent
        pixel_data[46][49] = 0; // x=49, y=46, transparent
        pixel_data[46][50] = 0; // x=50, y=46, transparent
        pixel_data[46][51] = 0; // x=51, y=46, transparent
        pixel_data[46][52] = 0; // x=52, y=46, transparent
        pixel_data[46][53] = 0; // x=53, y=46, transparent
        pixel_data[46][54] = 0; // x=54, y=46, transparent
        pixel_data[46][55] = 0; // x=55, y=46, transparent
        pixel_data[46][56] = 0; // x=56, y=46, transparent
        pixel_data[46][57] = 0; // x=57, y=46, transparent
        pixel_data[46][58] = 0; // x=58, y=46, transparent
        pixel_data[46][59] = 0; // x=59, y=46, transparent
        pixel_data[47][0] = 0; // x=0, y=47, transparent
        pixel_data[47][1] = 0; // x=1, y=47, transparent
        pixel_data[47][2] = 0; // x=2, y=47, transparent
        pixel_data[47][3] = 0; // x=3, y=47, transparent
        pixel_data[47][4] = 0; // x=4, y=47, transparent
        pixel_data[47][5] = 0; // x=5, y=47, transparent
        pixel_data[47][6] = 0; // x=6, y=47, transparent
        pixel_data[47][7] = 0; // x=7, y=47, transparent
        pixel_data[47][8] = 0; // x=8, y=47, transparent
        pixel_data[47][9] = 0; // x=9, y=47, transparent
        pixel_data[47][10] = 0; // x=10, y=47, transparent
        pixel_data[47][11] = 0; // x=11, y=47, transparent
        pixel_data[47][12] = 0; // x=12, y=47, transparent
        pixel_data[47][13] = 0; // x=13, y=47, transparent
        pixel_data[47][14] = 0; // x=14, y=47, transparent
        pixel_data[47][15] = 0; // x=15, y=47, transparent
        pixel_data[47][16] = 0; // x=16, y=47, transparent
        pixel_data[47][17] = 0; // x=17, y=47, transparent
        pixel_data[47][18] = 0; // x=18, y=47, transparent
        pixel_data[47][19] = 0; // x=19, y=47, transparent
        pixel_data[47][20] = 0; // x=20, y=47, transparent
        pixel_data[47][21] = 0; // x=21, y=47, transparent
        pixel_data[47][22] = 0; // x=22, y=47, transparent
        pixel_data[47][23] = 0; // x=23, y=47, transparent
        pixel_data[47][24] = 0; // x=24, y=47, transparent
        pixel_data[47][25] = 0; // x=25, y=47, transparent
        pixel_data[47][26] = 0; // x=26, y=47, transparent
        pixel_data[47][27] = 0; // x=27, y=47, transparent
        pixel_data[47][28] = 0; // x=28, y=47, transparent
        pixel_data[47][29] = 0; // x=29, y=47, transparent
        pixel_data[47][30] = 0; // x=30, y=47, transparent
        pixel_data[47][31] = 0; // x=31, y=47, transparent
        pixel_data[47][32] = 0; // x=32, y=47, transparent
        pixel_data[47][33] = 0; // x=33, y=47, transparent
        pixel_data[47][34] = 0; // x=34, y=47, transparent
        pixel_data[47][35] = 0; // x=35, y=47, transparent
        pixel_data[47][36] = 0; // x=36, y=47, transparent
        pixel_data[47][37] = 0; // x=37, y=47, transparent
        pixel_data[47][38] = 0; // x=38, y=47, transparent
        pixel_data[47][39] = 0; // x=39, y=47, transparent
        pixel_data[47][40] = 0; // x=40, y=47, transparent
        pixel_data[47][41] = 0; // x=41, y=47, transparent
        pixel_data[47][42] = 0; // x=42, y=47, transparent
        pixel_data[47][43] = 0; // x=43, y=47, transparent
        pixel_data[47][44] = 0; // x=44, y=47, transparent
        pixel_data[47][45] = 0; // x=45, y=47, transparent
        pixel_data[47][46] = 0; // x=46, y=47, transparent
        pixel_data[47][47] = 0; // x=47, y=47, transparent
        pixel_data[47][48] = 0; // x=48, y=47, transparent
        pixel_data[47][49] = 0; // x=49, y=47, transparent
        pixel_data[47][50] = 0; // x=50, y=47, transparent
        pixel_data[47][51] = 0; // x=51, y=47, transparent
        pixel_data[47][52] = 0; // x=52, y=47, transparent
        pixel_data[47][53] = 0; // x=53, y=47, transparent
        pixel_data[47][54] = 0; // x=54, y=47, transparent
        pixel_data[47][55] = 0; // x=55, y=47, transparent
        pixel_data[47][56] = 0; // x=56, y=47, transparent
        pixel_data[47][57] = 0; // x=57, y=47, transparent
        pixel_data[47][58] = 0; // x=58, y=47, transparent
        pixel_data[47][59] = 0; // x=59, y=47, transparent
        pixel_data[48][0] = 0; // x=0, y=48, transparent
        pixel_data[48][1] = 0; // x=1, y=48, transparent
        pixel_data[48][2] = 0; // x=2, y=48, transparent
        pixel_data[48][3] = 0; // x=3, y=48, transparent
        pixel_data[48][4] = 0; // x=4, y=48, transparent
        pixel_data[48][5] = 0; // x=5, y=48, transparent
        pixel_data[48][6] = 0; // x=6, y=48, transparent
        pixel_data[48][7] = 0; // x=7, y=48, transparent
        pixel_data[48][8] = 0; // x=8, y=48, transparent
        pixel_data[48][9] = 0; // x=9, y=48, transparent
        pixel_data[48][10] = 0; // x=10, y=48, transparent
        pixel_data[48][11] = 0; // x=11, y=48, transparent
        pixel_data[48][12] = 0; // x=12, y=48, transparent
        pixel_data[48][13] = 0; // x=13, y=48, transparent
        pixel_data[48][14] = 0; // x=14, y=48, transparent
        pixel_data[48][15] = 0; // x=15, y=48, transparent
        pixel_data[48][16] = 0; // x=16, y=48, transparent
        pixel_data[48][17] = 0; // x=17, y=48, transparent
        pixel_data[48][18] = 0; // x=18, y=48, transparent
        pixel_data[48][19] = 0; // x=19, y=48, transparent
        pixel_data[48][20] = 0; // x=20, y=48, transparent
        pixel_data[48][21] = 0; // x=21, y=48, transparent
        pixel_data[48][22] = 0; // x=22, y=48, transparent
        pixel_data[48][23] = 0; // x=23, y=48, transparent
        pixel_data[48][24] = 0; // x=24, y=48, transparent
        pixel_data[48][25] = 0; // x=25, y=48, transparent
        pixel_data[48][26] = 0; // x=26, y=48, transparent
        pixel_data[48][27] = 0; // x=27, y=48, transparent
        pixel_data[48][28] = 0; // x=28, y=48, transparent
        pixel_data[48][29] = 0; // x=29, y=48, transparent
        pixel_data[48][30] = 0; // x=30, y=48, transparent
        pixel_data[48][31] = 0; // x=31, y=48, transparent
        pixel_data[48][32] = 0; // x=32, y=48, transparent
        pixel_data[48][33] = 0; // x=33, y=48, transparent
        pixel_data[48][34] = 0; // x=34, y=48, transparent
        pixel_data[48][35] = 0; // x=35, y=48, transparent
        pixel_data[48][36] = 0; // x=36, y=48, transparent
        pixel_data[48][37] = 0; // x=37, y=48, transparent
        pixel_data[48][38] = 0; // x=38, y=48, transparent
        pixel_data[48][39] = 0; // x=39, y=48, transparent
        pixel_data[48][40] = 0; // x=40, y=48, transparent
        pixel_data[48][41] = 0; // x=41, y=48, transparent
        pixel_data[48][42] = 0; // x=42, y=48, transparent
        pixel_data[48][43] = 0; // x=43, y=48, transparent
        pixel_data[48][44] = 0; // x=44, y=48, transparent
        pixel_data[48][45] = 0; // x=45, y=48, transparent
        pixel_data[48][46] = 0; // x=46, y=48, transparent
        pixel_data[48][47] = 0; // x=47, y=48, transparent
        pixel_data[48][48] = 0; // x=48, y=48, transparent
        pixel_data[48][49] = 0; // x=49, y=48, transparent
        pixel_data[48][50] = 0; // x=50, y=48, transparent
        pixel_data[48][51] = 0; // x=51, y=48, transparent
        pixel_data[48][52] = 0; // x=52, y=48, transparent
        pixel_data[48][53] = 0; // x=53, y=48, transparent
        pixel_data[48][54] = 0; // x=54, y=48, transparent
        pixel_data[48][55] = 0; // x=55, y=48, transparent
        pixel_data[48][56] = 0; // x=56, y=48, transparent
        pixel_data[48][57] = 0; // x=57, y=48, transparent
        pixel_data[48][58] = 0; // x=58, y=48, transparent
        pixel_data[48][59] = 0; // x=59, y=48, transparent
        pixel_data[49][0] = 0; // x=0, y=49, transparent
        pixel_data[49][1] = 0; // x=1, y=49, transparent
        pixel_data[49][2] = 0; // x=2, y=49, transparent
        pixel_data[49][3] = 0; // x=3, y=49, transparent
        pixel_data[49][4] = 0; // x=4, y=49, transparent
        pixel_data[49][5] = 0; // x=5, y=49, transparent
        pixel_data[49][6] = 0; // x=6, y=49, transparent
        pixel_data[49][7] = 0; // x=7, y=49, transparent
        pixel_data[49][8] = 0; // x=8, y=49, transparent
        pixel_data[49][9] = 0; // x=9, y=49, transparent
        pixel_data[49][10] = 0; // x=10, y=49, transparent
        pixel_data[49][11] = 0; // x=11, y=49, transparent
        pixel_data[49][12] = 0; // x=12, y=49, transparent
        pixel_data[49][13] = 0; // x=13, y=49, transparent
        pixel_data[49][14] = 0; // x=14, y=49, transparent
        pixel_data[49][15] = 0; // x=15, y=49, transparent
        pixel_data[49][16] = 0; // x=16, y=49, transparent
        pixel_data[49][17] = 0; // x=17, y=49, transparent
        pixel_data[49][18] = 0; // x=18, y=49, transparent
        pixel_data[49][19] = 0; // x=19, y=49, transparent
        pixel_data[49][20] = 0; // x=20, y=49, transparent
        pixel_data[49][21] = 0; // x=21, y=49, transparent
        pixel_data[49][22] = 0; // x=22, y=49, transparent
        pixel_data[49][23] = 0; // x=23, y=49, transparent
        pixel_data[49][24] = 0; // x=24, y=49, transparent
        pixel_data[49][25] = 0; // x=25, y=49, transparent
        pixel_data[49][26] = 0; // x=26, y=49, transparent
        pixel_data[49][27] = 0; // x=27, y=49, transparent
        pixel_data[49][28] = 0; // x=28, y=49, transparent
        pixel_data[49][29] = 0; // x=29, y=49, transparent
        pixel_data[49][30] = 0; // x=30, y=49, transparent
        pixel_data[49][31] = 0; // x=31, y=49, transparent
        pixel_data[49][32] = 0; // x=32, y=49, transparent
        pixel_data[49][33] = 0; // x=33, y=49, transparent
        pixel_data[49][34] = 0; // x=34, y=49, transparent
        pixel_data[49][35] = 0; // x=35, y=49, transparent
        pixel_data[49][36] = 0; // x=36, y=49, transparent
        pixel_data[49][37] = 0; // x=37, y=49, transparent
        pixel_data[49][38] = 0; // x=38, y=49, transparent
        pixel_data[49][39] = 0; // x=39, y=49, transparent
        pixel_data[49][40] = 0; // x=40, y=49, transparent
        pixel_data[49][41] = 0; // x=41, y=49, transparent
        pixel_data[49][42] = 0; // x=42, y=49, transparent
        pixel_data[49][43] = 0; // x=43, y=49, transparent
        pixel_data[49][44] = 0; // x=44, y=49, transparent
        pixel_data[49][45] = 0; // x=45, y=49, transparent
        pixel_data[49][46] = 0; // x=46, y=49, transparent
        pixel_data[49][47] = 0; // x=47, y=49, transparent
        pixel_data[49][48] = 0; // x=48, y=49, transparent
        pixel_data[49][49] = 0; // x=49, y=49, transparent
        pixel_data[49][50] = 0; // x=50, y=49, transparent
        pixel_data[49][51] = 0; // x=51, y=49, transparent
        pixel_data[49][52] = 0; // x=52, y=49, transparent
        pixel_data[49][53] = 0; // x=53, y=49, transparent
        pixel_data[49][54] = 0; // x=54, y=49, transparent
        pixel_data[49][55] = 0; // x=55, y=49, transparent
        pixel_data[49][56] = 0; // x=56, y=49, transparent
        pixel_data[49][57] = 0; // x=57, y=49, transparent
        pixel_data[49][58] = 0; // x=58, y=49, transparent
        pixel_data[49][59] = 0; // x=59, y=49, transparent
        pixel_data[50][0] = 0; // x=0, y=50, transparent
        pixel_data[50][1] = 0; // x=1, y=50, transparent
        pixel_data[50][2] = 0; // x=2, y=50, transparent
        pixel_data[50][3] = 0; // x=3, y=50, transparent
        pixel_data[50][4] = 0; // x=4, y=50, transparent
        pixel_data[50][5] = 0; // x=5, y=50, transparent
        pixel_data[50][6] = 0; // x=6, y=50, transparent
        pixel_data[50][7] = 0; // x=7, y=50, transparent
        pixel_data[50][8] = 0; // x=8, y=50, transparent
        pixel_data[50][9] = 0; // x=9, y=50, transparent
        pixel_data[50][10] = 0; // x=10, y=50, transparent
        pixel_data[50][11] = 0; // x=11, y=50, transparent
        pixel_data[50][12] = 0; // x=12, y=50, transparent
        pixel_data[50][13] = 0; // x=13, y=50, transparent
        pixel_data[50][14] = 0; // x=14, y=50, transparent
        pixel_data[50][15] = 0; // x=15, y=50, transparent
        pixel_data[50][16] = 0; // x=16, y=50, transparent
        pixel_data[50][17] = 0; // x=17, y=50, transparent
        pixel_data[50][18] = 0; // x=18, y=50, transparent
        pixel_data[50][19] = 0; // x=19, y=50, transparent
        pixel_data[50][20] = 0; // x=20, y=50, transparent
        pixel_data[50][21] = 0; // x=21, y=50, transparent
        pixel_data[50][22] = 0; // x=22, y=50, transparent
        pixel_data[50][23] = 0; // x=23, y=50, transparent
        pixel_data[50][24] = 0; // x=24, y=50, transparent
        pixel_data[50][25] = 0; // x=25, y=50, transparent
        pixel_data[50][26] = 0; // x=26, y=50, transparent
        pixel_data[50][27] = 0; // x=27, y=50, transparent
        pixel_data[50][28] = 0; // x=28, y=50, transparent
        pixel_data[50][29] = 0; // x=29, y=50, transparent
        pixel_data[50][30] = 0; // x=30, y=50, transparent
        pixel_data[50][31] = 0; // x=31, y=50, transparent
        pixel_data[50][32] = 0; // x=32, y=50, transparent
        pixel_data[50][33] = 0; // x=33, y=50, transparent
        pixel_data[50][34] = 0; // x=34, y=50, transparent
        pixel_data[50][35] = 0; // x=35, y=50, transparent
        pixel_data[50][36] = 0; // x=36, y=50, transparent
        pixel_data[50][37] = 0; // x=37, y=50, transparent
        pixel_data[50][38] = 0; // x=38, y=50, transparent
        pixel_data[50][39] = 0; // x=39, y=50, transparent
        pixel_data[50][40] = 0; // x=40, y=50, transparent
        pixel_data[50][41] = 0; // x=41, y=50, transparent
        pixel_data[50][42] = 0; // x=42, y=50, transparent
        pixel_data[50][43] = 0; // x=43, y=50, transparent
        pixel_data[50][44] = 0; // x=44, y=50, transparent
        pixel_data[50][45] = 0; // x=45, y=50, transparent
        pixel_data[50][46] = 0; // x=46, y=50, transparent
        pixel_data[50][47] = 0; // x=47, y=50, transparent
        pixel_data[50][48] = 0; // x=48, y=50, transparent
        pixel_data[50][49] = 0; // x=49, y=50, transparent
        pixel_data[50][50] = 0; // x=50, y=50, transparent
        pixel_data[50][51] = 0; // x=51, y=50, transparent
        pixel_data[50][52] = 0; // x=52, y=50, transparent
        pixel_data[50][53] = 0; // x=53, y=50, transparent
        pixel_data[50][54] = 0; // x=54, y=50, transparent
        pixel_data[50][55] = 0; // x=55, y=50, transparent
        pixel_data[50][56] = 0; // x=56, y=50, transparent
        pixel_data[50][57] = 0; // x=57, y=50, transparent
        pixel_data[50][58] = 0; // x=58, y=50, transparent
        pixel_data[50][59] = 0; // x=59, y=50, transparent
        pixel_data[51][0] = 0; // x=0, y=51, transparent
        pixel_data[51][1] = 0; // x=1, y=51, transparent
        pixel_data[51][2] = 0; // x=2, y=51, transparent
        pixel_data[51][3] = 0; // x=3, y=51, transparent
        pixel_data[51][4] = 0; // x=4, y=51, transparent
        pixel_data[51][5] = 0; // x=5, y=51, transparent
        pixel_data[51][6] = 0; // x=6, y=51, transparent
        pixel_data[51][7] = 0; // x=7, y=51, transparent
        pixel_data[51][8] = 0; // x=8, y=51, transparent
        pixel_data[51][9] = 0; // x=9, y=51, transparent
        pixel_data[51][10] = 0; // x=10, y=51, transparent
        pixel_data[51][11] = 0; // x=11, y=51, transparent
        pixel_data[51][12] = 0; // x=12, y=51, transparent
        pixel_data[51][13] = 0; // x=13, y=51, transparent
        pixel_data[51][14] = 0; // x=14, y=51, transparent
        pixel_data[51][15] = 0; // x=15, y=51, transparent
        pixel_data[51][16] = 0; // x=16, y=51, transparent
        pixel_data[51][17] = 0; // x=17, y=51, transparent
        pixel_data[51][18] = 0; // x=18, y=51, transparent
        pixel_data[51][19] = 0; // x=19, y=51, transparent
        pixel_data[51][20] = 0; // x=20, y=51, transparent
        pixel_data[51][21] = 0; // x=21, y=51, transparent
        pixel_data[51][22] = 0; // x=22, y=51, transparent
        pixel_data[51][23] = 0; // x=23, y=51, transparent
        pixel_data[51][24] = 0; // x=24, y=51, transparent
        pixel_data[51][25] = 0; // x=25, y=51, transparent
        pixel_data[51][26] = 0; // x=26, y=51, transparent
        pixel_data[51][27] = 0; // x=27, y=51, transparent
        pixel_data[51][28] = 0; // x=28, y=51, transparent
        pixel_data[51][29] = 0; // x=29, y=51, transparent
        pixel_data[51][30] = 0; // x=30, y=51, transparent
        pixel_data[51][31] = 0; // x=31, y=51, transparent
        pixel_data[51][32] = 0; // x=32, y=51, transparent
        pixel_data[51][33] = 0; // x=33, y=51, transparent
        pixel_data[51][34] = 0; // x=34, y=51, transparent
        pixel_data[51][35] = 0; // x=35, y=51, transparent
        pixel_data[51][36] = 0; // x=36, y=51, transparent
        pixel_data[51][37] = 0; // x=37, y=51, transparent
        pixel_data[51][38] = 0; // x=38, y=51, transparent
        pixel_data[51][39] = 0; // x=39, y=51, transparent
        pixel_data[51][40] = 0; // x=40, y=51, transparent
        pixel_data[51][41] = 0; // x=41, y=51, transparent
        pixel_data[51][42] = 0; // x=42, y=51, transparent
        pixel_data[51][43] = 0; // x=43, y=51, transparent
        pixel_data[51][44] = 0; // x=44, y=51, transparent
        pixel_data[51][45] = 0; // x=45, y=51, transparent
        pixel_data[51][46] = 0; // x=46, y=51, transparent
        pixel_data[51][47] = 0; // x=47, y=51, transparent
        pixel_data[51][48] = 0; // x=48, y=51, transparent
        pixel_data[51][49] = 0; // x=49, y=51, transparent
        pixel_data[51][50] = 0; // x=50, y=51, transparent
        pixel_data[51][51] = 0; // x=51, y=51, transparent
        pixel_data[51][52] = 0; // x=52, y=51, transparent
        pixel_data[51][53] = 0; // x=53, y=51, transparent
        pixel_data[51][54] = 0; // x=54, y=51, transparent
        pixel_data[51][55] = 0; // x=55, y=51, transparent
        pixel_data[51][56] = 0; // x=56, y=51, transparent
        pixel_data[51][57] = 0; // x=57, y=51, transparent
        pixel_data[51][58] = 0; // x=58, y=51, transparent
        pixel_data[51][59] = 0; // x=59, y=51, transparent
        pixel_data[52][0] = 0; // x=0, y=52, transparent
        pixel_data[52][1] = 0; // x=1, y=52, transparent
        pixel_data[52][2] = 0; // x=2, y=52, transparent
        pixel_data[52][3] = 0; // x=3, y=52, transparent
        pixel_data[52][4] = 0; // x=4, y=52, transparent
        pixel_data[52][5] = 0; // x=5, y=52, transparent
        pixel_data[52][6] = 0; // x=6, y=52, transparent
        pixel_data[52][7] = 0; // x=7, y=52, transparent
        pixel_data[52][8] = 0; // x=8, y=52, transparent
        pixel_data[52][9] = 0; // x=9, y=52, transparent
        pixel_data[52][10] = 0; // x=10, y=52, transparent
        pixel_data[52][11] = 0; // x=11, y=52, transparent
        pixel_data[52][12] = 0; // x=12, y=52, transparent
        pixel_data[52][13] = 0; // x=13, y=52, transparent
        pixel_data[52][14] = 0; // x=14, y=52, transparent
        pixel_data[52][15] = 0; // x=15, y=52, transparent
        pixel_data[52][16] = 0; // x=16, y=52, transparent
        pixel_data[52][17] = 0; // x=17, y=52, transparent
        pixel_data[52][18] = 0; // x=18, y=52, transparent
        pixel_data[52][19] = 0; // x=19, y=52, transparent
        pixel_data[52][20] = 0; // x=20, y=52, transparent
        pixel_data[52][21] = 0; // x=21, y=52, transparent
        pixel_data[52][22] = 0; // x=22, y=52, transparent
        pixel_data[52][23] = 0; // x=23, y=52, transparent
        pixel_data[52][24] = 0; // x=24, y=52, transparent
        pixel_data[52][25] = 0; // x=25, y=52, transparent
        pixel_data[52][26] = 0; // x=26, y=52, transparent
        pixel_data[52][27] = 0; // x=27, y=52, transparent
        pixel_data[52][28] = 0; // x=28, y=52, transparent
        pixel_data[52][29] = 0; // x=29, y=52, transparent
        pixel_data[52][30] = 0; // x=30, y=52, transparent
        pixel_data[52][31] = 0; // x=31, y=52, transparent
        pixel_data[52][32] = 0; // x=32, y=52, transparent
        pixel_data[52][33] = 0; // x=33, y=52, transparent
        pixel_data[52][34] = 0; // x=34, y=52, transparent
        pixel_data[52][35] = 0; // x=35, y=52, transparent
        pixel_data[52][36] = 0; // x=36, y=52, transparent
        pixel_data[52][37] = 0; // x=37, y=52, transparent
        pixel_data[52][38] = 0; // x=38, y=52, transparent
        pixel_data[52][39] = 0; // x=39, y=52, transparent
        pixel_data[52][40] = 0; // x=40, y=52, transparent
        pixel_data[52][41] = 0; // x=41, y=52, transparent
        pixel_data[52][42] = 0; // x=42, y=52, transparent
        pixel_data[52][43] = 0; // x=43, y=52, transparent
        pixel_data[52][44] = 0; // x=44, y=52, transparent
        pixel_data[52][45] = 0; // x=45, y=52, transparent
        pixel_data[52][46] = 0; // x=46, y=52, transparent
        pixel_data[52][47] = 0; // x=47, y=52, transparent
        pixel_data[52][48] = 0; // x=48, y=52, transparent
        pixel_data[52][49] = 0; // x=49, y=52, transparent
        pixel_data[52][50] = 0; // x=50, y=52, transparent
        pixel_data[52][51] = 0; // x=51, y=52, transparent
        pixel_data[52][52] = 0; // x=52, y=52, transparent
        pixel_data[52][53] = 0; // x=53, y=52, transparent
        pixel_data[52][54] = 0; // x=54, y=52, transparent
        pixel_data[52][55] = 0; // x=55, y=52, transparent
        pixel_data[52][56] = 0; // x=56, y=52, transparent
        pixel_data[52][57] = 0; // x=57, y=52, transparent
        pixel_data[52][58] = 0; // x=58, y=52, transparent
        pixel_data[52][59] = 0; // x=59, y=52, transparent
        pixel_data[53][0] = 0; // x=0, y=53, transparent
        pixel_data[53][1] = 0; // x=1, y=53, transparent
        pixel_data[53][2] = 0; // x=2, y=53, transparent
        pixel_data[53][3] = 0; // x=3, y=53, transparent
        pixel_data[53][4] = 0; // x=4, y=53, transparent
        pixel_data[53][5] = 0; // x=5, y=53, transparent
        pixel_data[53][6] = 0; // x=6, y=53, transparent
        pixel_data[53][7] = 0; // x=7, y=53, transparent
        pixel_data[53][8] = 0; // x=8, y=53, transparent
        pixel_data[53][9] = 0; // x=9, y=53, transparent
        pixel_data[53][10] = 0; // x=10, y=53, transparent
        pixel_data[53][11] = 0; // x=11, y=53, transparent
        pixel_data[53][12] = 0; // x=12, y=53, transparent
        pixel_data[53][13] = 0; // x=13, y=53, transparent
        pixel_data[53][14] = 0; // x=14, y=53, transparent
        pixel_data[53][15] = 0; // x=15, y=53, transparent
        pixel_data[53][16] = 0; // x=16, y=53, transparent
        pixel_data[53][17] = 0; // x=17, y=53, transparent
        pixel_data[53][18] = 0; // x=18, y=53, transparent
        pixel_data[53][19] = 0; // x=19, y=53, transparent
        pixel_data[53][20] = 0; // x=20, y=53, transparent
        pixel_data[53][21] = 0; // x=21, y=53, transparent
        pixel_data[53][22] = 0; // x=22, y=53, transparent
        pixel_data[53][23] = 0; // x=23, y=53, transparent
        pixel_data[53][24] = 0; // x=24, y=53, transparent
        pixel_data[53][25] = 0; // x=25, y=53, transparent
        pixel_data[53][26] = 0; // x=26, y=53, transparent
        pixel_data[53][27] = 0; // x=27, y=53, transparent
        pixel_data[53][28] = 0; // x=28, y=53, transparent
        pixel_data[53][29] = 0; // x=29, y=53, transparent
        pixel_data[53][30] = 0; // x=30, y=53, transparent
        pixel_data[53][31] = 0; // x=31, y=53, transparent
        pixel_data[53][32] = 0; // x=32, y=53, transparent
        pixel_data[53][33] = 0; // x=33, y=53, transparent
        pixel_data[53][34] = 0; // x=34, y=53, transparent
        pixel_data[53][35] = 0; // x=35, y=53, transparent
        pixel_data[53][36] = 0; // x=36, y=53, transparent
        pixel_data[53][37] = 0; // x=37, y=53, transparent
        pixel_data[53][38] = 0; // x=38, y=53, transparent
        pixel_data[53][39] = 0; // x=39, y=53, transparent
        pixel_data[53][40] = 0; // x=40, y=53, transparent
        pixel_data[53][41] = 0; // x=41, y=53, transparent
        pixel_data[53][42] = 0; // x=42, y=53, transparent
        pixel_data[53][43] = 0; // x=43, y=53, transparent
        pixel_data[53][44] = 0; // x=44, y=53, transparent
        pixel_data[53][45] = 0; // x=45, y=53, transparent
        pixel_data[53][46] = 0; // x=46, y=53, transparent
        pixel_data[53][47] = 0; // x=47, y=53, transparent
        pixel_data[53][48] = 0; // x=48, y=53, transparent
        pixel_data[53][49] = 0; // x=49, y=53, transparent
        pixel_data[53][50] = 0; // x=50, y=53, transparent
        pixel_data[53][51] = 0; // x=51, y=53, transparent
        pixel_data[53][52] = 0; // x=52, y=53, transparent
        pixel_data[53][53] = 0; // x=53, y=53, transparent
        pixel_data[53][54] = 0; // x=54, y=53, transparent
        pixel_data[53][55] = 0; // x=55, y=53, transparent
        pixel_data[53][56] = 0; // x=56, y=53, transparent
        pixel_data[53][57] = 0; // x=57, y=53, transparent
        pixel_data[53][58] = 0; // x=58, y=53, transparent
        pixel_data[53][59] = 0; // x=59, y=53, transparent
        pixel_data[54][0] = 0; // x=0, y=54, transparent
        pixel_data[54][1] = 0; // x=1, y=54, transparent
        pixel_data[54][2] = 0; // x=2, y=54, transparent
        pixel_data[54][3] = 0; // x=3, y=54, transparent
        pixel_data[54][4] = 0; // x=4, y=54, transparent
        pixel_data[54][5] = 0; // x=5, y=54, transparent
        pixel_data[54][6] = 0; // x=6, y=54, transparent
        pixel_data[54][7] = 0; // x=7, y=54, transparent
        pixel_data[54][8] = 0; // x=8, y=54, transparent
        pixel_data[54][9] = 0; // x=9, y=54, transparent
        pixel_data[54][10] = 0; // x=10, y=54, transparent
        pixel_data[54][11] = 0; // x=11, y=54, transparent
        pixel_data[54][12] = 0; // x=12, y=54, transparent
        pixel_data[54][13] = 0; // x=13, y=54, transparent
        pixel_data[54][14] = 0; // x=14, y=54, transparent
        pixel_data[54][15] = 0; // x=15, y=54, transparent
        pixel_data[54][16] = 0; // x=16, y=54, transparent
        pixel_data[54][17] = 0; // x=17, y=54, transparent
        pixel_data[54][18] = 0; // x=18, y=54, transparent
        pixel_data[54][19] = 0; // x=19, y=54, transparent
        pixel_data[54][20] = 0; // x=20, y=54, transparent
        pixel_data[54][21] = 0; // x=21, y=54, transparent
        pixel_data[54][22] = 0; // x=22, y=54, transparent
        pixel_data[54][23] = 0; // x=23, y=54, transparent
        pixel_data[54][24] = 0; // x=24, y=54, transparent
        pixel_data[54][25] = 0; // x=25, y=54, transparent
        pixel_data[54][26] = 0; // x=26, y=54, transparent
        pixel_data[54][27] = 0; // x=27, y=54, transparent
        pixel_data[54][28] = 0; // x=28, y=54, transparent
        pixel_data[54][29] = 0; // x=29, y=54, transparent
        pixel_data[54][30] = 0; // x=30, y=54, transparent
        pixel_data[54][31] = 0; // x=31, y=54, transparent
        pixel_data[54][32] = 0; // x=32, y=54, transparent
        pixel_data[54][33] = 0; // x=33, y=54, transparent
        pixel_data[54][34] = 0; // x=34, y=54, transparent
        pixel_data[54][35] = 0; // x=35, y=54, transparent
        pixel_data[54][36] = 0; // x=36, y=54, transparent
        pixel_data[54][37] = 0; // x=37, y=54, transparent
        pixel_data[54][38] = 0; // x=38, y=54, transparent
        pixel_data[54][39] = 0; // x=39, y=54, transparent
        pixel_data[54][40] = 0; // x=40, y=54, transparent
        pixel_data[54][41] = 0; // x=41, y=54, transparent
        pixel_data[54][42] = 0; // x=42, y=54, transparent
        pixel_data[54][43] = 0; // x=43, y=54, transparent
        pixel_data[54][44] = 0; // x=44, y=54, transparent
        pixel_data[54][45] = 0; // x=45, y=54, transparent
        pixel_data[54][46] = 0; // x=46, y=54, transparent
        pixel_data[54][47] = 0; // x=47, y=54, transparent
        pixel_data[54][48] = 0; // x=48, y=54, transparent
        pixel_data[54][49] = 0; // x=49, y=54, transparent
        pixel_data[54][50] = 0; // x=50, y=54, transparent
        pixel_data[54][51] = 0; // x=51, y=54, transparent
        pixel_data[54][52] = 0; // x=52, y=54, transparent
        pixel_data[54][53] = 0; // x=53, y=54, transparent
        pixel_data[54][54] = 0; // x=54, y=54, transparent
        pixel_data[54][55] = 0; // x=55, y=54, transparent
        pixel_data[54][56] = 0; // x=56, y=54, transparent
        pixel_data[54][57] = 0; // x=57, y=54, transparent
        pixel_data[54][58] = 0; // x=58, y=54, transparent
        pixel_data[54][59] = 0; // x=59, y=54, transparent
        pixel_data[55][0] = 0; // x=0, y=55, transparent
        pixel_data[55][1] = 0; // x=1, y=55, transparent
        pixel_data[55][2] = 0; // x=2, y=55, transparent
        pixel_data[55][3] = 0; // x=3, y=55, transparent
        pixel_data[55][4] = 0; // x=4, y=55, transparent
        pixel_data[55][5] = 0; // x=5, y=55, transparent
        pixel_data[55][6] = 0; // x=6, y=55, transparent
        pixel_data[55][7] = 0; // x=7, y=55, transparent
        pixel_data[55][8] = 0; // x=8, y=55, transparent
        pixel_data[55][9] = 0; // x=9, y=55, transparent
        pixel_data[55][10] = 0; // x=10, y=55, transparent
        pixel_data[55][11] = 0; // x=11, y=55, transparent
        pixel_data[55][12] = 0; // x=12, y=55, transparent
        pixel_data[55][13] = 0; // x=13, y=55, transparent
        pixel_data[55][14] = 0; // x=14, y=55, transparent
        pixel_data[55][15] = 0; // x=15, y=55, transparent
        pixel_data[55][16] = 0; // x=16, y=55, transparent
        pixel_data[55][17] = 0; // x=17, y=55, transparent
        pixel_data[55][18] = 0; // x=18, y=55, transparent
        pixel_data[55][19] = 0; // x=19, y=55, transparent
        pixel_data[55][20] = 0; // x=20, y=55, transparent
        pixel_data[55][21] = 0; // x=21, y=55, transparent
        pixel_data[55][22] = 0; // x=22, y=55, transparent
        pixel_data[55][23] = 0; // x=23, y=55, transparent
        pixel_data[55][24] = 0; // x=24, y=55, transparent
        pixel_data[55][25] = 0; // x=25, y=55, transparent
        pixel_data[55][26] = 0; // x=26, y=55, transparent
        pixel_data[55][27] = 0; // x=27, y=55, transparent
        pixel_data[55][28] = 0; // x=28, y=55, transparent
        pixel_data[55][29] = 0; // x=29, y=55, transparent
        pixel_data[55][30] = 0; // x=30, y=55, transparent
        pixel_data[55][31] = 0; // x=31, y=55, transparent
        pixel_data[55][32] = 0; // x=32, y=55, transparent
        pixel_data[55][33] = 0; // x=33, y=55, transparent
        pixel_data[55][34] = 0; // x=34, y=55, transparent
        pixel_data[55][35] = 0; // x=35, y=55, transparent
        pixel_data[55][36] = 0; // x=36, y=55, transparent
        pixel_data[55][37] = 0; // x=37, y=55, transparent
        pixel_data[55][38] = 0; // x=38, y=55, transparent
        pixel_data[55][39] = 0; // x=39, y=55, transparent
        pixel_data[55][40] = 0; // x=40, y=55, transparent
        pixel_data[55][41] = 0; // x=41, y=55, transparent
        pixel_data[55][42] = 0; // x=42, y=55, transparent
        pixel_data[55][43] = 0; // x=43, y=55, transparent
        pixel_data[55][44] = 0; // x=44, y=55, transparent
        pixel_data[55][45] = 0; // x=45, y=55, transparent
        pixel_data[55][46] = 0; // x=46, y=55, transparent
        pixel_data[55][47] = 0; // x=47, y=55, transparent
        pixel_data[55][48] = 0; // x=48, y=55, transparent
        pixel_data[55][49] = 0; // x=49, y=55, transparent
        pixel_data[55][50] = 0; // x=50, y=55, transparent
        pixel_data[55][51] = 0; // x=51, y=55, transparent
        pixel_data[55][52] = 0; // x=52, y=55, transparent
        pixel_data[55][53] = 0; // x=53, y=55, transparent
        pixel_data[55][54] = 0; // x=54, y=55, transparent
        pixel_data[55][55] = 0; // x=55, y=55, transparent
        pixel_data[55][56] = 0; // x=56, y=55, transparent
        pixel_data[55][57] = 0; // x=57, y=55, transparent
        pixel_data[55][58] = 0; // x=58, y=55, transparent
        pixel_data[55][59] = 0; // x=59, y=55, transparent
        pixel_data[56][0] = 0; // x=0, y=56, transparent
        pixel_data[56][1] = 0; // x=1, y=56, transparent
        pixel_data[56][2] = 0; // x=2, y=56, transparent
        pixel_data[56][3] = 0; // x=3, y=56, transparent
        pixel_data[56][4] = 0; // x=4, y=56, transparent
        pixel_data[56][5] = 0; // x=5, y=56, transparent
        pixel_data[56][6] = 0; // x=6, y=56, transparent
        pixel_data[56][7] = 0; // x=7, y=56, transparent
        pixel_data[56][8] = 0; // x=8, y=56, transparent
        pixel_data[56][9] = 0; // x=9, y=56, transparent
        pixel_data[56][10] = 0; // x=10, y=56, transparent
        pixel_data[56][11] = 0; // x=11, y=56, transparent
        pixel_data[56][12] = 0; // x=12, y=56, transparent
        pixel_data[56][13] = 0; // x=13, y=56, transparent
        pixel_data[56][14] = 0; // x=14, y=56, transparent
        pixel_data[56][15] = 0; // x=15, y=56, transparent
        pixel_data[56][16] = 0; // x=16, y=56, transparent
        pixel_data[56][17] = 0; // x=17, y=56, transparent
        pixel_data[56][18] = 0; // x=18, y=56, transparent
        pixel_data[56][19] = 0; // x=19, y=56, transparent
        pixel_data[56][20] = 0; // x=20, y=56, transparent
        pixel_data[56][21] = 0; // x=21, y=56, transparent
        pixel_data[56][22] = 0; // x=22, y=56, transparent
        pixel_data[56][23] = 0; // x=23, y=56, transparent
        pixel_data[56][24] = 0; // x=24, y=56, transparent
        pixel_data[56][25] = 0; // x=25, y=56, transparent
        pixel_data[56][26] = 0; // x=26, y=56, transparent
        pixel_data[56][27] = 0; // x=27, y=56, transparent
        pixel_data[56][28] = 0; // x=28, y=56, transparent
        pixel_data[56][29] = 0; // x=29, y=56, transparent
        pixel_data[56][30] = 0; // x=30, y=56, transparent
        pixel_data[56][31] = 0; // x=31, y=56, transparent
        pixel_data[56][32] = 0; // x=32, y=56, transparent
        pixel_data[56][33] = 0; // x=33, y=56, transparent
        pixel_data[56][34] = 0; // x=34, y=56, transparent
        pixel_data[56][35] = 0; // x=35, y=56, transparent
        pixel_data[56][36] = 0; // x=36, y=56, transparent
        pixel_data[56][37] = 0; // x=37, y=56, transparent
        pixel_data[56][38] = 0; // x=38, y=56, transparent
        pixel_data[56][39] = 0; // x=39, y=56, transparent
        pixel_data[56][40] = 0; // x=40, y=56, transparent
        pixel_data[56][41] = 0; // x=41, y=56, transparent
        pixel_data[56][42] = 0; // x=42, y=56, transparent
        pixel_data[56][43] = 0; // x=43, y=56, transparent
        pixel_data[56][44] = 0; // x=44, y=56, transparent
        pixel_data[56][45] = 0; // x=45, y=56, transparent
        pixel_data[56][46] = 0; // x=46, y=56, transparent
        pixel_data[56][47] = 0; // x=47, y=56, transparent
        pixel_data[56][48] = 0; // x=48, y=56, transparent
        pixel_data[56][49] = 0; // x=49, y=56, transparent
        pixel_data[56][50] = 0; // x=50, y=56, transparent
        pixel_data[56][51] = 0; // x=51, y=56, transparent
        pixel_data[56][52] = 0; // x=52, y=56, transparent
        pixel_data[56][53] = 0; // x=53, y=56, transparent
        pixel_data[56][54] = 0; // x=54, y=56, transparent
        pixel_data[56][55] = 0; // x=55, y=56, transparent
        pixel_data[56][56] = 0; // x=56, y=56, transparent
        pixel_data[56][57] = 0; // x=57, y=56, transparent
        pixel_data[56][58] = 0; // x=58, y=56, transparent
        pixel_data[56][59] = 0; // x=59, y=56, transparent
        pixel_data[57][0] = 0; // x=0, y=57, transparent
        pixel_data[57][1] = 0; // x=1, y=57, transparent
        pixel_data[57][2] = 0; // x=2, y=57, transparent
        pixel_data[57][3] = 0; // x=3, y=57, transparent
        pixel_data[57][4] = 0; // x=4, y=57, transparent
        pixel_data[57][5] = 0; // x=5, y=57, transparent
        pixel_data[57][6] = 0; // x=6, y=57, transparent
        pixel_data[57][7] = 0; // x=7, y=57, transparent
        pixel_data[57][8] = 0; // x=8, y=57, transparent
        pixel_data[57][9] = 0; // x=9, y=57, transparent
        pixel_data[57][10] = 0; // x=10, y=57, transparent
        pixel_data[57][11] = 0; // x=11, y=57, transparent
        pixel_data[57][12] = 0; // x=12, y=57, transparent
        pixel_data[57][13] = 0; // x=13, y=57, transparent
        pixel_data[57][14] = 0; // x=14, y=57, transparent
        pixel_data[57][15] = 0; // x=15, y=57, transparent
        pixel_data[57][16] = 0; // x=16, y=57, transparent
        pixel_data[57][17] = 0; // x=17, y=57, transparent
        pixel_data[57][18] = 0; // x=18, y=57, transparent
        pixel_data[57][19] = 0; // x=19, y=57, transparent
        pixel_data[57][20] = 0; // x=20, y=57, transparent
        pixel_data[57][21] = 0; // x=21, y=57, transparent
        pixel_data[57][22] = 0; // x=22, y=57, transparent
        pixel_data[57][23] = 0; // x=23, y=57, transparent
        pixel_data[57][24] = 0; // x=24, y=57, transparent
        pixel_data[57][25] = 0; // x=25, y=57, transparent
        pixel_data[57][26] = 0; // x=26, y=57, transparent
        pixel_data[57][27] = 0; // x=27, y=57, transparent
        pixel_data[57][28] = 0; // x=28, y=57, transparent
        pixel_data[57][29] = 0; // x=29, y=57, transparent
        pixel_data[57][30] = 0; // x=30, y=57, transparent
        pixel_data[57][31] = 0; // x=31, y=57, transparent
        pixel_data[57][32] = 0; // x=32, y=57, transparent
        pixel_data[57][33] = 0; // x=33, y=57, transparent
        pixel_data[57][34] = 0; // x=34, y=57, transparent
        pixel_data[57][35] = 0; // x=35, y=57, transparent
        pixel_data[57][36] = 0; // x=36, y=57, transparent
        pixel_data[57][37] = 0; // x=37, y=57, transparent
        pixel_data[57][38] = 0; // x=38, y=57, transparent
        pixel_data[57][39] = 0; // x=39, y=57, transparent
        pixel_data[57][40] = 0; // x=40, y=57, transparent
        pixel_data[57][41] = 0; // x=41, y=57, transparent
        pixel_data[57][42] = 0; // x=42, y=57, transparent
        pixel_data[57][43] = 0; // x=43, y=57, transparent
        pixel_data[57][44] = 0; // x=44, y=57, transparent
        pixel_data[57][45] = 0; // x=45, y=57, transparent
        pixel_data[57][46] = 0; // x=46, y=57, transparent
        pixel_data[57][47] = 0; // x=47, y=57, transparent
        pixel_data[57][48] = 0; // x=48, y=57, transparent
        pixel_data[57][49] = 0; // x=49, y=57, transparent
        pixel_data[57][50] = 0; // x=50, y=57, transparent
        pixel_data[57][51] = 0; // x=51, y=57, transparent
        pixel_data[57][52] = 0; // x=52, y=57, transparent
        pixel_data[57][53] = 0; // x=53, y=57, transparent
        pixel_data[57][54] = 0; // x=54, y=57, transparent
        pixel_data[57][55] = 0; // x=55, y=57, transparent
        pixel_data[57][56] = 0; // x=56, y=57, transparent
        pixel_data[57][57] = 0; // x=57, y=57, transparent
        pixel_data[57][58] = 0; // x=58, y=57, transparent
        pixel_data[57][59] = 0; // x=59, y=57, transparent
        pixel_data[58][0] = 0; // x=0, y=58, transparent
        pixel_data[58][1] = 0; // x=1, y=58, transparent
        pixel_data[58][2] = 0; // x=2, y=58, transparent
        pixel_data[58][3] = 0; // x=3, y=58, transparent
        pixel_data[58][4] = 0; // x=4, y=58, transparent
        pixel_data[58][5] = 0; // x=5, y=58, transparent
        pixel_data[58][6] = 0; // x=6, y=58, transparent
        pixel_data[58][7] = 0; // x=7, y=58, transparent
        pixel_data[58][8] = 0; // x=8, y=58, transparent
        pixel_data[58][9] = 0; // x=9, y=58, transparent
        pixel_data[58][10] = 0; // x=10, y=58, transparent
        pixel_data[58][11] = 0; // x=11, y=58, transparent
        pixel_data[58][12] = 0; // x=12, y=58, transparent
        pixel_data[58][13] = 0; // x=13, y=58, transparent
        pixel_data[58][14] = 0; // x=14, y=58, transparent
        pixel_data[58][15] = 0; // x=15, y=58, transparent
        pixel_data[58][16] = 0; // x=16, y=58, transparent
        pixel_data[58][17] = 0; // x=17, y=58, transparent
        pixel_data[58][18] = 0; // x=18, y=58, transparent
        pixel_data[58][19] = 0; // x=19, y=58, transparent
        pixel_data[58][20] = 0; // x=20, y=58, transparent
        pixel_data[58][21] = 0; // x=21, y=58, transparent
        pixel_data[58][22] = 0; // x=22, y=58, transparent
        pixel_data[58][23] = 0; // x=23, y=58, transparent
        pixel_data[58][24] = 0; // x=24, y=58, transparent
        pixel_data[58][25] = 0; // x=25, y=58, transparent
        pixel_data[58][26] = 0; // x=26, y=58, transparent
        pixel_data[58][27] = 0; // x=27, y=58, transparent
        pixel_data[58][28] = 0; // x=28, y=58, transparent
        pixel_data[58][29] = 0; // x=29, y=58, transparent
        pixel_data[58][30] = 0; // x=30, y=58, transparent
        pixel_data[58][31] = 0; // x=31, y=58, transparent
        pixel_data[58][32] = 0; // x=32, y=58, transparent
        pixel_data[58][33] = 0; // x=33, y=58, transparent
        pixel_data[58][34] = 0; // x=34, y=58, transparent
        pixel_data[58][35] = 0; // x=35, y=58, transparent
        pixel_data[58][36] = 0; // x=36, y=58, transparent
        pixel_data[58][37] = 0; // x=37, y=58, transparent
        pixel_data[58][38] = 0; // x=38, y=58, transparent
        pixel_data[58][39] = 0; // x=39, y=58, transparent
        pixel_data[58][40] = 0; // x=40, y=58, transparent
        pixel_data[58][41] = 0; // x=41, y=58, transparent
        pixel_data[58][42] = 0; // x=42, y=58, transparent
        pixel_data[58][43] = 0; // x=43, y=58, transparent
        pixel_data[58][44] = 0; // x=44, y=58, transparent
        pixel_data[58][45] = 0; // x=45, y=58, transparent
        pixel_data[58][46] = 0; // x=46, y=58, transparent
        pixel_data[58][47] = 0; // x=47, y=58, transparent
        pixel_data[58][48] = 0; // x=48, y=58, transparent
        pixel_data[58][49] = 0; // x=49, y=58, transparent
        pixel_data[58][50] = 0; // x=50, y=58, transparent
        pixel_data[58][51] = 0; // x=51, y=58, transparent
        pixel_data[58][52] = 0; // x=52, y=58, transparent
        pixel_data[58][53] = 0; // x=53, y=58, transparent
        pixel_data[58][54] = 0; // x=54, y=58, transparent
        pixel_data[58][55] = 0; // x=55, y=58, transparent
        pixel_data[58][56] = 0; // x=56, y=58, transparent
        pixel_data[58][57] = 0; // x=57, y=58, transparent
        pixel_data[58][58] = 0; // x=58, y=58, transparent
        pixel_data[58][59] = 0; // x=59, y=58, transparent
        pixel_data[59][0] = 0; // x=0, y=59, transparent
        pixel_data[59][1] = 0; // x=1, y=59, transparent
        pixel_data[59][2] = 0; // x=2, y=59, transparent
        pixel_data[59][3] = 0; // x=3, y=59, transparent
        pixel_data[59][4] = 0; // x=4, y=59, transparent
        pixel_data[59][5] = 0; // x=5, y=59, transparent
        pixel_data[59][6] = 0; // x=6, y=59, transparent
        pixel_data[59][7] = 0; // x=7, y=59, transparent
        pixel_data[59][8] = 0; // x=8, y=59, transparent
        pixel_data[59][9] = 0; // x=9, y=59, transparent
        pixel_data[59][10] = 0; // x=10, y=59, transparent
        pixel_data[59][11] = 0; // x=11, y=59, transparent
        pixel_data[59][12] = 0; // x=12, y=59, transparent
        pixel_data[59][13] = 0; // x=13, y=59, transparent
        pixel_data[59][14] = 0; // x=14, y=59, transparent
        pixel_data[59][15] = 0; // x=15, y=59, transparent
        pixel_data[59][16] = 0; // x=16, y=59, transparent
        pixel_data[59][17] = 0; // x=17, y=59, transparent
        pixel_data[59][18] = 0; // x=18, y=59, transparent
        pixel_data[59][19] = 0; // x=19, y=59, transparent
        pixel_data[59][20] = 0; // x=20, y=59, transparent
        pixel_data[59][21] = 0; // x=21, y=59, transparent
        pixel_data[59][22] = 0; // x=22, y=59, transparent
        pixel_data[59][23] = 0; // x=23, y=59, transparent
        pixel_data[59][24] = 0; // x=24, y=59, transparent
        pixel_data[59][25] = 0; // x=25, y=59, transparent
        pixel_data[59][26] = 0; // x=26, y=59, transparent
        pixel_data[59][27] = 0; // x=27, y=59, transparent
        pixel_data[59][28] = 0; // x=28, y=59, transparent
        pixel_data[59][29] = 0; // x=29, y=59, transparent
        pixel_data[59][30] = 0; // x=30, y=59, transparent
        pixel_data[59][31] = 0; // x=31, y=59, transparent
        pixel_data[59][32] = 0; // x=32, y=59, transparent
        pixel_data[59][33] = 0; // x=33, y=59, transparent
        pixel_data[59][34] = 0; // x=34, y=59, transparent
        pixel_data[59][35] = 0; // x=35, y=59, transparent
        pixel_data[59][36] = 0; // x=36, y=59, transparent
        pixel_data[59][37] = 0; // x=37, y=59, transparent
        pixel_data[59][38] = 0; // x=38, y=59, transparent
        pixel_data[59][39] = 0; // x=39, y=59, transparent
        pixel_data[59][40] = 0; // x=40, y=59, transparent
        pixel_data[59][41] = 0; // x=41, y=59, transparent
        pixel_data[59][42] = 0; // x=42, y=59, transparent
        pixel_data[59][43] = 0; // x=43, y=59, transparent
        pixel_data[59][44] = 0; // x=44, y=59, transparent
        pixel_data[59][45] = 0; // x=45, y=59, transparent
        pixel_data[59][46] = 0; // x=46, y=59, transparent
        pixel_data[59][47] = 0; // x=47, y=59, transparent
        pixel_data[59][48] = 0; // x=48, y=59, transparent
        pixel_data[59][49] = 0; // x=49, y=59, transparent
        pixel_data[59][50] = 0; // x=50, y=59, transparent
        pixel_data[59][51] = 0; // x=51, y=59, transparent
        pixel_data[59][52] = 0; // x=52, y=59, transparent
        pixel_data[59][53] = 0; // x=53, y=59, transparent
        pixel_data[59][54] = 0; // x=54, y=59, transparent
        pixel_data[59][55] = 0; // x=55, y=59, transparent
        pixel_data[59][56] = 0; // x=56, y=59, transparent
        pixel_data[59][57] = 0; // x=57, y=59, transparent
        pixel_data[59][58] = 0; // x=58, y=59, transparent
        pixel_data[59][59] = 0; // x=59, y=59, transparent
    end
endmodule
