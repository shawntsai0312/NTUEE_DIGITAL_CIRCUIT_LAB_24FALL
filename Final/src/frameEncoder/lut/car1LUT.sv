// module car1_lut(output reg [3:0] pixel_data [0:39][0:39]);
//     initial begin
//         pixel_data[0][0] = 0; // x=0, y=0, transparent
//         pixel_data[0][1] = 0; // x=1, y=0, transparent
//         pixel_data[0][2] = 0; // x=2, y=0, transparent
//         pixel_data[0][3] = 0; // x=3, y=0, transparent
//         pixel_data[0][4] = 0; // x=4, y=0, transparent
//         pixel_data[0][5] = 0; // x=5, y=0, transparent
//         pixel_data[0][6] = 0; // x=6, y=0, transparent
//         pixel_data[0][7] = 0; // x=7, y=0, transparent
//         pixel_data[0][8] = 0; // x=8, y=0, transparent
//         pixel_data[0][9] = 0; // x=9, y=0, transparent
//         pixel_data[0][10] = 0; // x=10, y=0, transparent
//         pixel_data[0][11] = 0; // x=11, y=0, transparent
//         pixel_data[0][12] = 0; // x=12, y=0, transparent
//         pixel_data[0][13] = 0; // x=13, y=0, transparent
//         pixel_data[0][14] = 0; // x=14, y=0, transparent
//         pixel_data[0][15] = 0; // x=15, y=0, transparent
//         pixel_data[0][16] = 0; // x=16, y=0, transparent
//         pixel_data[0][17] = 0; // x=17, y=0, transparent
//         pixel_data[0][18] = 0; // x=18, y=0, transparent
//         pixel_data[0][19] = 0; // x=19, y=0, transparent
//         pixel_data[0][20] = 0; // x=20, y=0, transparent
//         pixel_data[0][21] = 0; // x=21, y=0, transparent
//         pixel_data[0][22] = 0; // x=22, y=0, transparent
//         pixel_data[0][23] = 0; // x=23, y=0, transparent
//         pixel_data[0][24] = 0; // x=24, y=0, transparent
//         pixel_data[0][25] = 0; // x=25, y=0, transparent
//         pixel_data[0][26] = 0; // x=26, y=0, transparent
//         pixel_data[0][27] = 0; // x=27, y=0, transparent
//         pixel_data[0][28] = 0; // x=28, y=0, transparent
//         pixel_data[0][29] = 0; // x=29, y=0, transparent
//         pixel_data[0][30] = 0; // x=30, y=0, transparent
//         pixel_data[0][31] = 0; // x=31, y=0, transparent
//         pixel_data[0][32] = 0; // x=32, y=0, transparent
//         pixel_data[0][33] = 0; // x=33, y=0, transparent
//         pixel_data[0][34] = 0; // x=34, y=0, transparent
//         pixel_data[0][35] = 0; // x=35, y=0, transparent
//         pixel_data[0][36] = 0; // x=36, y=0, transparent
//         pixel_data[0][37] = 0; // x=37, y=0, transparent
//         pixel_data[0][38] = 0; // x=38, y=0, transparent
//         pixel_data[0][39] = 0; // x=39, y=0, transparent
//         pixel_data[1][0] = 0; // x=0, y=1, transparent
//         pixel_data[1][1] = 0; // x=1, y=1, transparent
//         pixel_data[1][2] = 0; // x=2, y=1, transparent
//         pixel_data[1][3] = 0; // x=3, y=1, transparent
//         pixel_data[1][4] = 0; // x=4, y=1, transparent
//         pixel_data[1][5] = 0; // x=5, y=1, transparent
//         pixel_data[1][6] = 0; // x=6, y=1, transparent
//         pixel_data[1][7] = 0; // x=7, y=1, transparent
//         pixel_data[1][8] = 0; // x=8, y=1, transparent
//         pixel_data[1][9] = 0; // x=9, y=1, transparent
//         pixel_data[1][10] = 0; // x=10, y=1, transparent
//         pixel_data[1][11] = 0; // x=11, y=1, transparent
//         pixel_data[1][12] = 0; // x=12, y=1, transparent
//         pixel_data[1][13] = 0; // x=13, y=1, transparent
//         pixel_data[1][14] = 0; // x=14, y=1, transparent
//         pixel_data[1][15] = 0; // x=15, y=1, transparent
//         pixel_data[1][16] = 0; // x=16, y=1, transparent
//         pixel_data[1][17] = 0; // x=17, y=1, transparent
//         pixel_data[1][18] = 0; // x=18, y=1, transparent
//         pixel_data[1][19] = 0; // x=19, y=1, transparent
//         pixel_data[1][20] = 0; // x=20, y=1, transparent
//         pixel_data[1][21] = 0; // x=21, y=1, transparent
//         pixel_data[1][22] = 0; // x=22, y=1, transparent
//         pixel_data[1][23] = 0; // x=23, y=1, transparent
//         pixel_data[1][24] = 0; // x=24, y=1, transparent
//         pixel_data[1][25] = 0; // x=25, y=1, transparent
//         pixel_data[1][26] = 0; // x=26, y=1, transparent
//         pixel_data[1][27] = 0; // x=27, y=1, transparent
//         pixel_data[1][28] = 0; // x=28, y=1, transparent
//         pixel_data[1][29] = 0; // x=29, y=1, transparent
//         pixel_data[1][30] = 0; // x=30, y=1, transparent
//         pixel_data[1][31] = 0; // x=31, y=1, transparent
//         pixel_data[1][32] = 0; // x=32, y=1, transparent
//         pixel_data[1][33] = 0; // x=33, y=1, transparent
//         pixel_data[1][34] = 0; // x=34, y=1, transparent
//         pixel_data[1][35] = 0; // x=35, y=1, transparent
//         pixel_data[1][36] = 0; // x=36, y=1, transparent
//         pixel_data[1][37] = 0; // x=37, y=1, transparent
//         pixel_data[1][38] = 0; // x=38, y=1, transparent
//         pixel_data[1][39] = 0; // x=39, y=1, transparent
//         pixel_data[2][0] = 0; // x=0, y=2, transparent
//         pixel_data[2][1] = 0; // x=1, y=2, transparent
//         pixel_data[2][2] = 0; // x=2, y=2, transparent
//         pixel_data[2][3] = 0; // x=3, y=2, transparent
//         pixel_data[2][4] = 0; // x=4, y=2, transparent
//         pixel_data[2][5] = 0; // x=5, y=2, transparent
//         pixel_data[2][6] = 0; // x=6, y=2, transparent
//         pixel_data[2][7] = 0; // x=7, y=2, transparent
//         pixel_data[2][8] = 0; // x=8, y=2, transparent
//         pixel_data[2][9] = 0; // x=9, y=2, transparent
//         pixel_data[2][10] = 0; // x=10, y=2, transparent
//         pixel_data[2][11] = 0; // x=11, y=2, transparent
//         pixel_data[2][12] = 0; // x=12, y=2, transparent
//         pixel_data[2][13] = 0; // x=13, y=2, transparent
//         pixel_data[2][14] = 0; // x=14, y=2, transparent
//         pixel_data[2][15] = 0; // x=15, y=2, transparent
//         pixel_data[2][16] = 0; // x=16, y=2, transparent
//         pixel_data[2][17] = 0; // x=17, y=2, transparent
//         pixel_data[2][18] = 0; // x=18, y=2, transparent
//         pixel_data[2][19] = 0; // x=19, y=2, transparent
//         pixel_data[2][20] = 0; // x=20, y=2, transparent
//         pixel_data[2][21] = 0; // x=21, y=2, transparent
//         pixel_data[2][22] = 0; // x=22, y=2, transparent
//         pixel_data[2][23] = 0; // x=23, y=2, transparent
//         pixel_data[2][24] = 0; // x=24, y=2, transparent
//         pixel_data[2][25] = 0; // x=25, y=2, transparent
//         pixel_data[2][26] = 0; // x=26, y=2, transparent
//         pixel_data[2][27] = 0; // x=27, y=2, transparent
//         pixel_data[2][28] = 0; // x=28, y=2, transparent
//         pixel_data[2][29] = 0; // x=29, y=2, transparent
//         pixel_data[2][30] = 0; // x=30, y=2, transparent
//         pixel_data[2][31] = 0; // x=31, y=2, transparent
//         pixel_data[2][32] = 0; // x=32, y=2, transparent
//         pixel_data[2][33] = 0; // x=33, y=2, transparent
//         pixel_data[2][34] = 0; // x=34, y=2, transparent
//         pixel_data[2][35] = 0; // x=35, y=2, transparent
//         pixel_data[2][36] = 0; // x=36, y=2, transparent
//         pixel_data[2][37] = 0; // x=37, y=2, transparent
//         pixel_data[2][38] = 0; // x=38, y=2, transparent
//         pixel_data[2][39] = 0; // x=39, y=2, transparent
//         pixel_data[3][0] = 0; // x=0, y=3, transparent
//         pixel_data[3][1] = 0; // x=1, y=3, transparent
//         pixel_data[3][2] = 0; // x=2, y=3, transparent
//         pixel_data[3][3] = 0; // x=3, y=3, transparent
//         pixel_data[3][4] = 0; // x=4, y=3, transparent
//         pixel_data[3][5] = 0; // x=5, y=3, transparent
//         pixel_data[3][6] = 0; // x=6, y=3, transparent
//         pixel_data[3][7] = 0; // x=7, y=3, transparent
//         pixel_data[3][8] = 0; // x=8, y=3, transparent
//         pixel_data[3][9] = 0; // x=9, y=3, transparent
//         pixel_data[3][10] = 0; // x=10, y=3, transparent
//         pixel_data[3][11] = 0; // x=11, y=3, transparent
//         pixel_data[3][12] = 0; // x=12, y=3, transparent
//         pixel_data[3][13] = 0; // x=13, y=3, transparent
//         pixel_data[3][14] = 0; // x=14, y=3, transparent
//         pixel_data[3][15] = 0; // x=15, y=3, transparent
//         pixel_data[3][16] = 0; // x=16, y=3, transparent
//         pixel_data[3][17] = 0; // x=17, y=3, transparent
//         pixel_data[3][18] = 0; // x=18, y=3, transparent
//         pixel_data[3][19] = 0; // x=19, y=3, transparent
//         pixel_data[3][20] = 0; // x=20, y=3, transparent
//         pixel_data[3][21] = 0; // x=21, y=3, transparent
//         pixel_data[3][22] = 0; // x=22, y=3, transparent
//         pixel_data[3][23] = 0; // x=23, y=3, transparent
//         pixel_data[3][24] = 0; // x=24, y=3, transparent
//         pixel_data[3][25] = 0; // x=25, y=3, transparent
//         pixel_data[3][26] = 0; // x=26, y=3, transparent
//         pixel_data[3][27] = 0; // x=27, y=3, transparent
//         pixel_data[3][28] = 0; // x=28, y=3, transparent
//         pixel_data[3][29] = 0; // x=29, y=3, transparent
//         pixel_data[3][30] = 0; // x=30, y=3, transparent
//         pixel_data[3][31] = 0; // x=31, y=3, transparent
//         pixel_data[3][32] = 0; // x=32, y=3, transparent
//         pixel_data[3][33] = 0; // x=33, y=3, transparent
//         pixel_data[3][34] = 0; // x=34, y=3, transparent
//         pixel_data[3][35] = 0; // x=35, y=3, transparent
//         pixel_data[3][36] = 0; // x=36, y=3, transparent
//         pixel_data[3][37] = 0; // x=37, y=3, transparent
//         pixel_data[3][38] = 0; // x=38, y=3, transparent
//         pixel_data[3][39] = 0; // x=39, y=3, transparent
//         pixel_data[4][0] = 0; // x=0, y=4, transparent
//         pixel_data[4][1] = 0; // x=1, y=4, transparent
//         pixel_data[4][2] = 0; // x=2, y=4, transparent
//         pixel_data[4][3] = 0; // x=3, y=4, transparent
//         pixel_data[4][4] = 0; // x=4, y=4, transparent
//         pixel_data[4][5] = 0; // x=5, y=4, transparent
//         pixel_data[4][6] = 0; // x=6, y=4, transparent
//         pixel_data[4][7] = 0; // x=7, y=4, transparent
//         pixel_data[4][8] = 0; // x=8, y=4, transparent
//         pixel_data[4][9] = 0; // x=9, y=4, transparent
//         pixel_data[4][10] = 0; // x=10, y=4, transparent
//         pixel_data[4][11] = 0; // x=11, y=4, transparent
//         pixel_data[4][12] = 0; // x=12, y=4, transparent
//         pixel_data[4][13] = 0; // x=13, y=4, transparent
//         pixel_data[4][14] = 0; // x=14, y=4, transparent
//         pixel_data[4][15] = 0; // x=15, y=4, transparent
//         pixel_data[4][16] = 0; // x=16, y=4, transparent
//         pixel_data[4][17] = 0; // x=17, y=4, transparent
//         pixel_data[4][18] = 0; // x=18, y=4, transparent
//         pixel_data[4][19] = 0; // x=19, y=4, transparent
//         pixel_data[4][20] = 0; // x=20, y=4, transparent
//         pixel_data[4][21] = 0; // x=21, y=4, transparent
//         pixel_data[4][22] = 0; // x=22, y=4, transparent
//         pixel_data[4][23] = 0; // x=23, y=4, transparent
//         pixel_data[4][24] = 0; // x=24, y=4, transparent
//         pixel_data[4][25] = 0; // x=25, y=4, transparent
//         pixel_data[4][26] = 0; // x=26, y=4, transparent
//         pixel_data[4][27] = 0; // x=27, y=4, transparent
//         pixel_data[4][28] = 0; // x=28, y=4, transparent
//         pixel_data[4][29] = 0; // x=29, y=4, transparent
//         pixel_data[4][30] = 0; // x=30, y=4, transparent
//         pixel_data[4][31] = 0; // x=31, y=4, transparent
//         pixel_data[4][32] = 0; // x=32, y=4, transparent
//         pixel_data[4][33] = 0; // x=33, y=4, transparent
//         pixel_data[4][34] = 0; // x=34, y=4, transparent
//         pixel_data[4][35] = 0; // x=35, y=4, transparent
//         pixel_data[4][36] = 0; // x=36, y=4, transparent
//         pixel_data[4][37] = 0; // x=37, y=4, transparent
//         pixel_data[4][38] = 0; // x=38, y=4, transparent
//         pixel_data[4][39] = 0; // x=39, y=4, transparent
//         pixel_data[5][0] = 0; // x=0, y=5, transparent
//         pixel_data[5][1] = 0; // x=1, y=5, transparent
//         pixel_data[5][2] = 0; // x=2, y=5, transparent
//         pixel_data[5][3] = 0; // x=3, y=5, transparent
//         pixel_data[5][4] = 0; // x=4, y=5, transparent
//         pixel_data[5][5] = 0; // x=5, y=5, transparent
//         pixel_data[5][6] = 0; // x=6, y=5, transparent
//         pixel_data[5][7] = 0; // x=7, y=5, transparent
//         pixel_data[5][8] = 0; // x=8, y=5, transparent
//         pixel_data[5][9] = 0; // x=9, y=5, transparent
//         pixel_data[5][10] = 0; // x=10, y=5, transparent
//         pixel_data[5][11] = 0; // x=11, y=5, transparent
//         pixel_data[5][12] = 0; // x=12, y=5, transparent
//         pixel_data[5][13] = 0; // x=13, y=5, transparent
//         pixel_data[5][14] = 0; // x=14, y=5, transparent
//         pixel_data[5][15] = 0; // x=15, y=5, transparent
//         pixel_data[5][16] = 0; // x=16, y=5, transparent
//         pixel_data[5][17] = 0; // x=17, y=5, transparent
//         pixel_data[5][18] = 0; // x=18, y=5, transparent
//         pixel_data[5][19] = 0; // x=19, y=5, transparent
//         pixel_data[5][20] = 0; // x=20, y=5, transparent
//         pixel_data[5][21] = 0; // x=21, y=5, transparent
//         pixel_data[5][22] = 0; // x=22, y=5, transparent
//         pixel_data[5][23] = 0; // x=23, y=5, transparent
//         pixel_data[5][24] = 0; // x=24, y=5, transparent
//         pixel_data[5][25] = 0; // x=25, y=5, transparent
//         pixel_data[5][26] = 0; // x=26, y=5, transparent
//         pixel_data[5][27] = 0; // x=27, y=5, transparent
//         pixel_data[5][28] = 0; // x=28, y=5, transparent
//         pixel_data[5][29] = 0; // x=29, y=5, transparent
//         pixel_data[5][30] = 0; // x=30, y=5, transparent
//         pixel_data[5][31] = 0; // x=31, y=5, transparent
//         pixel_data[5][32] = 0; // x=32, y=5, transparent
//         pixel_data[5][33] = 0; // x=33, y=5, transparent
//         pixel_data[5][34] = 0; // x=34, y=5, transparent
//         pixel_data[5][35] = 0; // x=35, y=5, transparent
//         pixel_data[5][36] = 0; // x=36, y=5, transparent
//         pixel_data[5][37] = 0; // x=37, y=5, transparent
//         pixel_data[5][38] = 0; // x=38, y=5, transparent
//         pixel_data[5][39] = 0; // x=39, y=5, transparent
//         pixel_data[6][0] = 0; // x=0, y=6, transparent
//         pixel_data[6][1] = 0; // x=1, y=6, transparent
//         pixel_data[6][2] = 0; // x=2, y=6, transparent
//         pixel_data[6][3] = 0; // x=3, y=6, transparent
//         pixel_data[6][4] = 0; // x=4, y=6, transparent
//         pixel_data[6][5] = 0; // x=5, y=6, transparent
//         pixel_data[6][6] = 0; // x=6, y=6, transparent
//         pixel_data[6][7] = 0; // x=7, y=6, transparent
//         pixel_data[6][8] = 0; // x=8, y=6, transparent
//         pixel_data[6][9] = 0; // x=9, y=6, transparent
//         pixel_data[6][10] = 0; // x=10, y=6, transparent
//         pixel_data[6][11] = 0; // x=11, y=6, transparent
//         pixel_data[6][12] = 0; // x=12, y=6, transparent
//         pixel_data[6][13] = 0; // x=13, y=6, transparent
//         pixel_data[6][14] = 0; // x=14, y=6, transparent
//         pixel_data[6][15] = 0; // x=15, y=6, transparent
//         pixel_data[6][16] = 0; // x=16, y=6, transparent
//         pixel_data[6][17] = 0; // x=17, y=6, transparent
//         pixel_data[6][18] = 0; // x=18, y=6, transparent
//         pixel_data[6][19] = 0; // x=19, y=6, transparent
//         pixel_data[6][20] = 0; // x=20, y=6, transparent
//         pixel_data[6][21] = 0; // x=21, y=6, transparent
//         pixel_data[6][22] = 0; // x=22, y=6, transparent
//         pixel_data[6][23] = 0; // x=23, y=6, transparent
//         pixel_data[6][24] = 0; // x=24, y=6, transparent
//         pixel_data[6][25] = 0; // x=25, y=6, transparent
//         pixel_data[6][26] = 0; // x=26, y=6, transparent
//         pixel_data[6][27] = 0; // x=27, y=6, transparent
//         pixel_data[6][28] = 0; // x=28, y=6, transparent
//         pixel_data[6][29] = 0; // x=29, y=6, transparent
//         pixel_data[6][30] = 0; // x=30, y=6, transparent
//         pixel_data[6][31] = 0; // x=31, y=6, transparent
//         pixel_data[6][32] = 0; // x=32, y=6, transparent
//         pixel_data[6][33] = 0; // x=33, y=6, transparent
//         pixel_data[6][34] = 0; // x=34, y=6, transparent
//         pixel_data[6][35] = 0; // x=35, y=6, transparent
//         pixel_data[6][36] = 0; // x=36, y=6, transparent
//         pixel_data[6][37] = 0; // x=37, y=6, transparent
//         pixel_data[6][38] = 0; // x=38, y=6, transparent
//         pixel_data[6][39] = 0; // x=39, y=6, transparent
//         pixel_data[7][0] = 0; // x=0, y=7, transparent
//         pixel_data[7][1] = 0; // x=1, y=7, transparent
//         pixel_data[7][2] = 0; // x=2, y=7, transparent
//         pixel_data[7][3] = 0; // x=3, y=7, transparent
//         pixel_data[7][4] = 0; // x=4, y=7, transparent
//         pixel_data[7][5] = 0; // x=5, y=7, transparent
//         pixel_data[7][6] = 0; // x=6, y=7, transparent
//         pixel_data[7][7] = 0; // x=7, y=7, transparent
//         pixel_data[7][8] = 0; // x=8, y=7, transparent
//         pixel_data[7][9] = 0; // x=9, y=7, transparent
//         pixel_data[7][10] = 0; // x=10, y=7, transparent
//         pixel_data[7][11] = 0; // x=11, y=7, transparent
//         pixel_data[7][12] = 0; // x=12, y=7, transparent
//         pixel_data[7][13] = 0; // x=13, y=7, transparent
//         pixel_data[7][14] = 0; // x=14, y=7, transparent
//         pixel_data[7][15] = 0; // x=15, y=7, transparent
//         pixel_data[7][16] = 0; // x=16, y=7, transparent
//         pixel_data[7][17] = 0; // x=17, y=7, transparent
//         pixel_data[7][18] = 0; // x=18, y=7, transparent
//         pixel_data[7][19] = 0; // x=19, y=7, transparent
//         pixel_data[7][20] = 0; // x=20, y=7, transparent
//         pixel_data[7][21] = 0; // x=21, y=7, transparent
//         pixel_data[7][22] = 0; // x=22, y=7, transparent
//         pixel_data[7][23] = 0; // x=23, y=7, transparent
//         pixel_data[7][24] = 0; // x=24, y=7, transparent
//         pixel_data[7][25] = 0; // x=25, y=7, transparent
//         pixel_data[7][26] = 0; // x=26, y=7, transparent
//         pixel_data[7][27] = 0; // x=27, y=7, transparent
//         pixel_data[7][28] = 0; // x=28, y=7, transparent
//         pixel_data[7][29] = 0; // x=29, y=7, transparent
//         pixel_data[7][30] = 0; // x=30, y=7, transparent
//         pixel_data[7][31] = 0; // x=31, y=7, transparent
//         pixel_data[7][32] = 0; // x=32, y=7, transparent
//         pixel_data[7][33] = 0; // x=33, y=7, transparent
//         pixel_data[7][34] = 0; // x=34, y=7, transparent
//         pixel_data[7][35] = 0; // x=35, y=7, transparent
//         pixel_data[7][36] = 0; // x=36, y=7, transparent
//         pixel_data[7][37] = 0; // x=37, y=7, transparent
//         pixel_data[7][38] = 0; // x=38, y=7, transparent
//         pixel_data[7][39] = 0; // x=39, y=7, transparent
//         pixel_data[8][0] = 0; // x=0, y=8, transparent
//         pixel_data[8][1] = 0; // x=1, y=8, transparent
//         pixel_data[8][2] = 0; // x=2, y=8, transparent
//         pixel_data[8][3] = 0; // x=3, y=8, transparent
//         pixel_data[8][4] = 0; // x=4, y=8, transparent
//         pixel_data[8][5] = 0; // x=5, y=8, transparent
//         pixel_data[8][6] = 0; // x=6, y=8, transparent
//         pixel_data[8][7] = 0; // x=7, y=8, transparent
//         pixel_data[8][8] = 0; // x=8, y=8, transparent
//         pixel_data[8][9] = 0; // x=9, y=8, transparent
//         pixel_data[8][10] = 0; // x=10, y=8, transparent
//         pixel_data[8][11] = 0; // x=11, y=8, transparent
//         pixel_data[8][12] = 0; // x=12, y=8, transparent
//         pixel_data[8][13] = 0; // x=13, y=8, transparent
//         pixel_data[8][14] = 0; // x=14, y=8, transparent
//         pixel_data[8][15] = 0; // x=15, y=8, transparent
//         pixel_data[8][16] = 0; // x=16, y=8, transparent
//         pixel_data[8][17] = 0; // x=17, y=8, transparent
//         pixel_data[8][18] = 0; // x=18, y=8, transparent
//         pixel_data[8][19] = 0; // x=19, y=8, transparent
//         pixel_data[8][20] = 0; // x=20, y=8, transparent
//         pixel_data[8][21] = 0; // x=21, y=8, transparent
//         pixel_data[8][22] = 0; // x=22, y=8, transparent
//         pixel_data[8][23] = 0; // x=23, y=8, transparent
//         pixel_data[8][24] = 0; // x=24, y=8, transparent
//         pixel_data[8][25] = 0; // x=25, y=8, transparent
//         pixel_data[8][26] = 0; // x=26, y=8, transparent
//         pixel_data[8][27] = 0; // x=27, y=8, transparent
//         pixel_data[8][28] = 0; // x=28, y=8, transparent
//         pixel_data[8][29] = 0; // x=29, y=8, transparent
//         pixel_data[8][30] = 0; // x=30, y=8, transparent
//         pixel_data[8][31] = 0; // x=31, y=8, transparent
//         pixel_data[8][32] = 0; // x=32, y=8, transparent
//         pixel_data[8][33] = 0; // x=33, y=8, transparent
//         pixel_data[8][34] = 0; // x=34, y=8, transparent
//         pixel_data[8][35] = 0; // x=35, y=8, transparent
//         pixel_data[8][36] = 0; // x=36, y=8, transparent
//         pixel_data[8][37] = 0; // x=37, y=8, transparent
//         pixel_data[8][38] = 0; // x=38, y=8, transparent
//         pixel_data[8][39] = 0; // x=39, y=8, transparent
//         pixel_data[9][0] = 0; // x=0, y=9, transparent
//         pixel_data[9][1] = 0; // x=1, y=9, transparent
//         pixel_data[9][2] = 0; // x=2, y=9, transparent
//         pixel_data[9][3] = 0; // x=3, y=9, transparent
//         pixel_data[9][4] = 0; // x=4, y=9, transparent
//         pixel_data[9][5] = 0; // x=5, y=9, transparent
//         pixel_data[9][6] = 0; // x=6, y=9, transparent
//         pixel_data[9][7] = 0; // x=7, y=9, transparent
//         pixel_data[9][8] = 0; // x=8, y=9, transparent
//         pixel_data[9][9] = 0; // x=9, y=9, transparent
//         pixel_data[9][10] = 0; // x=10, y=9, transparent
//         pixel_data[9][11] = 0; // x=11, y=9, transparent
//         pixel_data[9][12] = 0; // x=12, y=9, transparent
//         pixel_data[9][13] = 0; // x=13, y=9, transparent
//         pixel_data[9][14] = 0; // x=14, y=9, transparent
//         pixel_data[9][15] = 0; // x=15, y=9, transparent
//         pixel_data[9][16] = 0; // x=16, y=9, transparent
//         pixel_data[9][17] = 0; // x=17, y=9, transparent
//         pixel_data[9][18] = 0; // x=18, y=9, transparent
//         pixel_data[9][19] = 0; // x=19, y=9, transparent
//         pixel_data[9][20] = 0; // x=20, y=9, transparent
//         pixel_data[9][21] = 0; // x=21, y=9, transparent
//         pixel_data[9][22] = 0; // x=22, y=9, transparent
//         pixel_data[9][23] = 0; // x=23, y=9, transparent
//         pixel_data[9][24] = 0; // x=24, y=9, transparent
//         pixel_data[9][25] = 0; // x=25, y=9, transparent
//         pixel_data[9][26] = 0; // x=26, y=9, transparent
//         pixel_data[9][27] = 0; // x=27, y=9, transparent
//         pixel_data[9][28] = 0; // x=28, y=9, transparent
//         pixel_data[9][29] = 0; // x=29, y=9, transparent
//         pixel_data[9][30] = 0; // x=30, y=9, transparent
//         pixel_data[9][31] = 0; // x=31, y=9, transparent
//         pixel_data[9][32] = 0; // x=32, y=9, transparent
//         pixel_data[9][33] = 0; // x=33, y=9, transparent
//         pixel_data[9][34] = 0; // x=34, y=9, transparent
//         pixel_data[9][35] = 0; // x=35, y=9, transparent
//         pixel_data[9][36] = 0; // x=36, y=9, transparent
//         pixel_data[9][37] = 0; // x=37, y=9, transparent
//         pixel_data[9][38] = 0; // x=38, y=9, transparent
//         pixel_data[9][39] = 0; // x=39, y=9, transparent
//         pixel_data[10][0] = 0; // x=0, y=10, transparent
//         pixel_data[10][1] = 0; // x=1, y=10, transparent
//         pixel_data[10][2] = 0; // x=2, y=10, transparent
//         pixel_data[10][3] = 0; // x=3, y=10, transparent
//         pixel_data[10][4] = 0; // x=4, y=10, transparent
//         pixel_data[10][5] = 0; // x=5, y=10, transparent
//         pixel_data[10][6] = 0; // x=6, y=10, transparent
//         pixel_data[10][7] = 0; // x=7, y=10, transparent
//         pixel_data[10][8] = 0; // x=8, y=10, transparent
//         pixel_data[10][9] = 0; // x=9, y=10, transparent
//         pixel_data[10][10] = 0; // x=10, y=10, transparent
//         pixel_data[10][11] = 0; // x=11, y=10, transparent
//         pixel_data[10][12] = 0; // x=12, y=10, transparent
//         pixel_data[10][13] = 0; // x=13, y=10, transparent
//         pixel_data[10][14] = 0; // x=14, y=10, transparent
//         pixel_data[10][15] = 0; // x=15, y=10, transparent
//         pixel_data[10][16] = 0; // x=16, y=10, transparent
//         pixel_data[10][17] = 0; // x=17, y=10, transparent
//         pixel_data[10][18] = 0; // x=18, y=10, transparent
//         pixel_data[10][19] = 0; // x=19, y=10, transparent
//         pixel_data[10][20] = 0; // x=20, y=10, transparent
//         pixel_data[10][21] = 0; // x=21, y=10, transparent
//         pixel_data[10][22] = 0; // x=22, y=10, transparent
//         pixel_data[10][23] = 0; // x=23, y=10, transparent
//         pixel_data[10][24] = 0; // x=24, y=10, transparent
//         pixel_data[10][25] = 0; // x=25, y=10, transparent
//         pixel_data[10][26] = 0; // x=26, y=10, transparent
//         pixel_data[10][27] = 0; // x=27, y=10, transparent
//         pixel_data[10][28] = 0; // x=28, y=10, transparent
//         pixel_data[10][29] = 0; // x=29, y=10, transparent
//         pixel_data[10][30] = 0; // x=30, y=10, transparent
//         pixel_data[10][31] = 0; // x=31, y=10, transparent
//         pixel_data[10][32] = 0; // x=32, y=10, transparent
//         pixel_data[10][33] = 0; // x=33, y=10, transparent
//         pixel_data[10][34] = 0; // x=34, y=10, transparent
//         pixel_data[10][35] = 0; // x=35, y=10, transparent
//         pixel_data[10][36] = 0; // x=36, y=10, transparent
//         pixel_data[10][37] = 0; // x=37, y=10, transparent
//         pixel_data[10][38] = 0; // x=38, y=10, transparent
//         pixel_data[10][39] = 0; // x=39, y=10, transparent
//         pixel_data[11][0] = 0; // x=0, y=11, transparent
//         pixel_data[11][1] = 0; // x=1, y=11, transparent
//         pixel_data[11][2] = 0; // x=2, y=11, transparent
//         pixel_data[11][3] = 0; // x=3, y=11, transparent
//         pixel_data[11][4] = 0; // x=4, y=11, transparent
//         pixel_data[11][5] = 2; // x=5, y=11, (186, 186, 184)
//         pixel_data[11][6] = 2; // x=6, y=11, (186, 186, 184)
//         pixel_data[11][7] = 2; // x=7, y=11, (186, 186, 184)
//         pixel_data[11][8] = 2; // x=8, y=11, (186, 186, 184)
//         pixel_data[11][9] = 2; // x=9, y=11, (186, 186, 184)
//         pixel_data[11][10] = 2; // x=10, y=11, (186, 186, 184)
//         pixel_data[11][11] = 2; // x=11, y=11, (186, 186, 184)
//         pixel_data[11][12] = 2; // x=12, y=11, (186, 186, 184)
//         pixel_data[11][13] = 2; // x=13, y=11, (186, 186, 184)
//         pixel_data[11][14] = 6; // x=14, y=11, (163, 163, 161)
//         pixel_data[11][15] = 15; // x=15, y=11, (112, 113, 113)
//         pixel_data[11][16] = 11; // x=16, y=11, (97, 98, 99)
//         pixel_data[11][17] = 11; // x=17, y=11, (97, 98, 99)
//         pixel_data[11][18] = 9; // x=18, y=11, (85, 86, 86)
//         pixel_data[11][19] = 9; // x=19, y=11, (85, 86, 86)
//         pixel_data[11][20] = 9; // x=20, y=11, (85, 86, 86)
//         pixel_data[11][21] = 9; // x=21, y=11, (85, 86, 86)
//         pixel_data[11][22] = 1; // x=22, y=11, (72, 75, 77)
//         pixel_data[11][23] = 3; // x=23, y=11, (49, 49, 49)
//         pixel_data[11][24] = 9; // x=24, y=11, (85, 86, 86)
//         pixel_data[11][25] = 8; // x=25, y=11, (58, 58, 59)
//         pixel_data[11][26] = 8; // x=26, y=11, (58, 58, 59)
//         pixel_data[11][27] = 1; // x=27, y=11, (72, 75, 77)
//         pixel_data[11][28] = 9; // x=28, y=11, (85, 86, 86)
//         pixel_data[11][29] = 11; // x=29, y=11, (97, 98, 99)
//         pixel_data[11][30] = 4; // x=30, y=11, (127, 127, 126)
//         pixel_data[11][31] = 2; // x=31, y=11, (186, 186, 184)
//         pixel_data[11][32] = 2; // x=32, y=11, (186, 186, 184)
//         pixel_data[11][33] = 10; // x=33, y=11, (201, 201, 199)
//         pixel_data[11][34] = 5; // x=34, y=11, (210, 210, 208)
//         pixel_data[11][35] = 5; // x=35, y=11, (210, 210, 208)
//         pixel_data[11][36] = 0; // x=36, y=11, transparent
//         pixel_data[11][37] = 0; // x=37, y=11, transparent
//         pixel_data[11][38] = 0; // x=38, y=11, transparent
//         pixel_data[11][39] = 0; // x=39, y=11, transparent
//         pixel_data[12][0] = 0; // x=0, y=12, transparent
//         pixel_data[12][1] = 0; // x=1, y=12, transparent
//         pixel_data[12][2] = 0; // x=2, y=12, transparent
//         pixel_data[12][3] = 12; // x=3, y=12, (176, 176, 174)
//         pixel_data[12][4] = 6; // x=4, y=12, (163, 163, 161)
//         pixel_data[12][5] = 2; // x=5, y=12, (186, 186, 184)
//         pixel_data[12][6] = 10; // x=6, y=12, (201, 201, 199)
//         pixel_data[12][7] = 10; // x=7, y=12, (201, 201, 199)
//         pixel_data[12][8] = 10; // x=8, y=12, (201, 201, 199)
//         pixel_data[12][9] = 10; // x=9, y=12, (201, 201, 199)
//         pixel_data[12][10] = 10; // x=10, y=12, (201, 201, 199)
//         pixel_data[12][11] = 10; // x=11, y=12, (201, 201, 199)
//         pixel_data[12][12] = 10; // x=12, y=12, (201, 201, 199)
//         pixel_data[12][13] = 11; // x=13, y=12, (97, 98, 99)
//         pixel_data[12][14] = 1; // x=14, y=12, (72, 75, 77)
//         pixel_data[12][15] = 9; // x=15, y=12, (85, 86, 86)
//         pixel_data[12][16] = 11; // x=16, y=12, (97, 98, 99)
//         pixel_data[12][17] = 11; // x=17, y=12, (97, 98, 99)
//         pixel_data[12][18] = 11; // x=18, y=12, (97, 98, 99)
//         pixel_data[12][19] = 11; // x=19, y=12, (97, 98, 99)
//         pixel_data[12][20] = 1; // x=20, y=12, (72, 75, 77)
//         pixel_data[12][21] = 1; // x=21, y=12, (72, 75, 77)
//         pixel_data[12][22] = 1; // x=22, y=12, (72, 75, 77)
//         pixel_data[12][23] = 3; // x=23, y=12, (49, 49, 49)
//         pixel_data[12][24] = 9; // x=24, y=12, (85, 86, 86)
//         pixel_data[12][25] = 1; // x=25, y=12, (72, 75, 77)
//         pixel_data[12][26] = 3; // x=26, y=12, (49, 49, 49)
//         pixel_data[12][27] = 8; // x=27, y=12, (58, 58, 59)
//         pixel_data[12][28] = 1; // x=28, y=12, (72, 75, 77)
//         pixel_data[12][29] = 1; // x=29, y=12, (72, 75, 77)
//         pixel_data[12][30] = 4; // x=30, y=12, (127, 127, 126)
//         pixel_data[12][31] = 12; // x=31, y=12, (176, 176, 174)
//         pixel_data[12][32] = 2; // x=32, y=12, (186, 186, 184)
//         pixel_data[12][33] = 2; // x=33, y=12, (186, 186, 184)
//         pixel_data[12][34] = 12; // x=34, y=12, (176, 176, 174)
//         pixel_data[12][35] = 12; // x=35, y=12, (176, 176, 174)
//         pixel_data[12][36] = 2; // x=36, y=12, (186, 186, 184)
//         pixel_data[12][37] = 0; // x=37, y=12, transparent
//         pixel_data[12][38] = 0; // x=38, y=12, transparent
//         pixel_data[12][39] = 0; // x=39, y=12, transparent
//         pixel_data[13][0] = 0; // x=0, y=13, transparent
//         pixel_data[13][1] = 0; // x=1, y=13, transparent
//         pixel_data[13][2] = 0; // x=2, y=13, transparent
//         pixel_data[13][3] = 6; // x=3, y=13, (163, 163, 161)
//         pixel_data[13][4] = 2; // x=4, y=13, (186, 186, 184)
//         pixel_data[13][5] = 10; // x=5, y=13, (201, 201, 199)
//         pixel_data[13][6] = 10; // x=6, y=13, (201, 201, 199)
//         pixel_data[13][7] = 10; // x=7, y=13, (201, 201, 199)
//         pixel_data[13][8] = 10; // x=8, y=13, (201, 201, 199)
//         pixel_data[13][9] = 10; // x=9, y=13, (201, 201, 199)
//         pixel_data[13][10] = 10; // x=10, y=13, (201, 201, 199)
//         pixel_data[13][11] = 5; // x=11, y=13, (210, 210, 208)
//         pixel_data[13][12] = 14; // x=12, y=13, (147, 148, 148)
//         pixel_data[13][13] = 13; // x=13, y=13, (29, 29, 29)
//         pixel_data[13][14] = 1; // x=14, y=13, (72, 75, 77)
//         pixel_data[13][15] = 9; // x=15, y=13, (85, 86, 86)
//         pixel_data[13][16] = 9; // x=16, y=13, (85, 86, 86)
//         pixel_data[13][17] = 9; // x=17, y=13, (85, 86, 86)
//         pixel_data[13][18] = 9; // x=18, y=13, (85, 86, 86)
//         pixel_data[13][19] = 3; // x=19, y=13, (49, 49, 49)
//         pixel_data[13][20] = 7; // x=20, y=13, (37, 37, 37)
//         pixel_data[13][21] = 13; // x=21, y=13, (29, 29, 29)
//         pixel_data[13][22] = 7; // x=22, y=13, (37, 37, 37)
//         pixel_data[13][23] = 7; // x=23, y=13, (37, 37, 37)
//         pixel_data[13][24] = 13; // x=24, y=13, (29, 29, 29)
//         pixel_data[13][25] = 13; // x=25, y=13, (29, 29, 29)
//         pixel_data[13][26] = 7; // x=26, y=13, (37, 37, 37)
//         pixel_data[13][27] = 7; // x=27, y=13, (37, 37, 37)
//         pixel_data[13][28] = 7; // x=28, y=13, (37, 37, 37)
//         pixel_data[13][29] = 7; // x=29, y=13, (37, 37, 37)
//         pixel_data[13][30] = 3; // x=30, y=13, (49, 49, 49)
//         pixel_data[13][31] = 8; // x=31, y=13, (58, 58, 59)
//         pixel_data[13][32] = 11; // x=32, y=13, (97, 98, 99)
//         pixel_data[13][33] = 4; // x=33, y=13, (127, 127, 126)
//         pixel_data[13][34] = 14; // x=34, y=13, (147, 148, 148)
//         pixel_data[13][35] = 6; // x=35, y=13, (163, 163, 161)
//         pixel_data[13][36] = 14; // x=36, y=13, (147, 148, 148)
//         pixel_data[13][37] = 10; // x=37, y=13, (201, 201, 199)
//         pixel_data[13][38] = 0; // x=38, y=13, transparent
//         pixel_data[13][39] = 0; // x=39, y=13, transparent
//         pixel_data[14][0] = 0; // x=0, y=14, transparent
//         pixel_data[14][1] = 0; // x=1, y=14, transparent
//         pixel_data[14][2] = 0; // x=2, y=14, transparent
//         pixel_data[14][3] = 6; // x=3, y=14, (163, 163, 161)
//         pixel_data[14][4] = 2; // x=4, y=14, (186, 186, 184)
//         pixel_data[14][5] = 2; // x=5, y=14, (186, 186, 184)
//         pixel_data[14][6] = 2; // x=6, y=14, (186, 186, 184)
//         pixel_data[14][7] = 2; // x=7, y=14, (186, 186, 184)
//         pixel_data[14][8] = 2; // x=8, y=14, (186, 186, 184)
//         pixel_data[14][9] = 2; // x=9, y=14, (186, 186, 184)
//         pixel_data[14][10] = 2; // x=10, y=14, (186, 186, 184)
//         pixel_data[14][11] = 12; // x=11, y=14, (176, 176, 174)
//         pixel_data[14][12] = 8; // x=12, y=14, (58, 58, 59)
//         pixel_data[14][13] = 3; // x=13, y=14, (49, 49, 49)
//         pixel_data[14][14] = 9; // x=14, y=14, (85, 86, 86)
//         pixel_data[14][15] = 9; // x=15, y=14, (85, 86, 86)
//         pixel_data[14][16] = 9; // x=16, y=14, (85, 86, 86)
//         pixel_data[14][17] = 9; // x=17, y=14, (85, 86, 86)
//         pixel_data[14][18] = 8; // x=18, y=14, (58, 58, 59)
//         pixel_data[14][19] = 7; // x=19, y=14, (37, 37, 37)
//         pixel_data[14][20] = 8; // x=20, y=14, (58, 58, 59)
//         pixel_data[14][21] = 8; // x=21, y=14, (58, 58, 59)
//         pixel_data[14][22] = 8; // x=22, y=14, (58, 58, 59)
//         pixel_data[14][23] = 8; // x=23, y=14, (58, 58, 59)
//         pixel_data[14][24] = 13; // x=24, y=14, (29, 29, 29)
//         pixel_data[14][25] = 7; // x=25, y=14, (37, 37, 37)
//         pixel_data[14][26] = 3; // x=26, y=14, (49, 49, 49)
//         pixel_data[14][27] = 3; // x=27, y=14, (49, 49, 49)
//         pixel_data[14][28] = 3; // x=28, y=14, (49, 49, 49)
//         pixel_data[14][29] = 3; // x=29, y=14, (49, 49, 49)
//         pixel_data[14][30] = 3; // x=30, y=14, (49, 49, 49)
//         pixel_data[14][31] = 3; // x=31, y=14, (49, 49, 49)
//         pixel_data[14][32] = 7; // x=32, y=14, (37, 37, 37)
//         pixel_data[14][33] = 13; // x=33, y=14, (29, 29, 29)
//         pixel_data[14][34] = 13; // x=34, y=14, (29, 29, 29)
//         pixel_data[14][35] = 15; // x=35, y=14, (112, 113, 113)
//         pixel_data[14][36] = 2; // x=36, y=14, (186, 186, 184)
//         pixel_data[14][37] = 12; // x=37, y=14, (176, 176, 174)
//         pixel_data[14][38] = 0; // x=38, y=14, transparent
//         pixel_data[14][39] = 0; // x=39, y=14, transparent
//         pixel_data[15][0] = 0; // x=0, y=15, transparent
//         pixel_data[15][1] = 0; // x=1, y=15, transparent
//         pixel_data[15][2] = 6; // x=2, y=15, (163, 163, 161)
//         pixel_data[15][3] = 12; // x=3, y=15, (176, 176, 174)
//         pixel_data[15][4] = 10; // x=4, y=15, (201, 201, 199)
//         pixel_data[15][5] = 10; // x=5, y=15, (201, 201, 199)
//         pixel_data[15][6] = 10; // x=6, y=15, (201, 201, 199)
//         pixel_data[15][7] = 10; // x=7, y=15, (201, 201, 199)
//         pixel_data[15][8] = 10; // x=8, y=15, (201, 201, 199)
//         pixel_data[15][9] = 10; // x=9, y=15, (201, 201, 199)
//         pixel_data[15][10] = 5; // x=10, y=15, (210, 210, 208)
//         pixel_data[15][11] = 6; // x=11, y=15, (163, 163, 161)
//         pixel_data[15][12] = 13; // x=12, y=15, (29, 29, 29)
//         pixel_data[15][13] = 1; // x=13, y=15, (72, 75, 77)
//         pixel_data[15][14] = 9; // x=14, y=15, (85, 86, 86)
//         pixel_data[15][15] = 9; // x=15, y=15, (85, 86, 86)
//         pixel_data[15][16] = 9; // x=16, y=15, (85, 86, 86)
//         pixel_data[15][17] = 9; // x=17, y=15, (85, 86, 86)
//         pixel_data[15][18] = 3; // x=18, y=15, (49, 49, 49)
//         pixel_data[15][19] = 8; // x=19, y=15, (58, 58, 59)
//         pixel_data[15][20] = 8; // x=20, y=15, (58, 58, 59)
//         pixel_data[15][21] = 8; // x=21, y=15, (58, 58, 59)
//         pixel_data[15][22] = 8; // x=22, y=15, (58, 58, 59)
//         pixel_data[15][23] = 8; // x=23, y=15, (58, 58, 59)
//         pixel_data[15][24] = 7; // x=24, y=15, (37, 37, 37)
//         pixel_data[15][25] = 3; // x=25, y=15, (49, 49, 49)
//         pixel_data[15][26] = 8; // x=26, y=15, (58, 58, 59)
//         pixel_data[15][27] = 8; // x=27, y=15, (58, 58, 59)
//         pixel_data[15][28] = 8; // x=28, y=15, (58, 58, 59)
//         pixel_data[15][29] = 8; // x=29, y=15, (58, 58, 59)
//         pixel_data[15][30] = 8; // x=30, y=15, (58, 58, 59)
//         pixel_data[15][31] = 8; // x=31, y=15, (58, 58, 59)
//         pixel_data[15][32] = 8; // x=32, y=15, (58, 58, 59)
//         pixel_data[15][33] = 8; // x=33, y=15, (58, 58, 59)
//         pixel_data[15][34] = 3; // x=34, y=15, (49, 49, 49)
//         pixel_data[15][35] = 4; // x=35, y=15, (127, 127, 126)
//         pixel_data[15][36] = 10; // x=36, y=15, (201, 201, 199)
//         pixel_data[15][37] = 6; // x=37, y=15, (163, 163, 161)
//         pixel_data[15][38] = 0; // x=38, y=15, transparent
//         pixel_data[15][39] = 0; // x=39, y=15, transparent
//         pixel_data[16][0] = 0; // x=0, y=16, transparent
//         pixel_data[16][1] = 0; // x=1, y=16, transparent
//         pixel_data[16][2] = 6; // x=2, y=16, (163, 163, 161)
//         pixel_data[16][3] = 2; // x=3, y=16, (186, 186, 184)
//         pixel_data[16][4] = 10; // x=4, y=16, (201, 201, 199)
//         pixel_data[16][5] = 10; // x=5, y=16, (201, 201, 199)
//         pixel_data[16][6] = 10; // x=6, y=16, (201, 201, 199)
//         pixel_data[16][7] = 10; // x=7, y=16, (201, 201, 199)
//         pixel_data[16][8] = 10; // x=8, y=16, (201, 201, 199)
//         pixel_data[16][9] = 10; // x=9, y=16, (201, 201, 199)
//         pixel_data[16][10] = 5; // x=10, y=16, (210, 210, 208)
//         pixel_data[16][11] = 11; // x=11, y=16, (97, 98, 99)
//         pixel_data[16][12] = 13; // x=12, y=16, (29, 29, 29)
//         pixel_data[16][13] = 9; // x=13, y=16, (85, 86, 86)
//         pixel_data[16][14] = 9; // x=14, y=16, (85, 86, 86)
//         pixel_data[16][15] = 9; // x=15, y=16, (85, 86, 86)
//         pixel_data[16][16] = 9; // x=16, y=16, (85, 86, 86)
//         pixel_data[16][17] = 9; // x=17, y=16, (85, 86, 86)
//         pixel_data[16][18] = 3; // x=18, y=16, (49, 49, 49)
//         pixel_data[16][19] = 8; // x=19, y=16, (58, 58, 59)
//         pixel_data[16][20] = 8; // x=20, y=16, (58, 58, 59)
//         pixel_data[16][21] = 8; // x=21, y=16, (58, 58, 59)
//         pixel_data[16][22] = 8; // x=22, y=16, (58, 58, 59)
//         pixel_data[16][23] = 8; // x=23, y=16, (58, 58, 59)
//         pixel_data[16][24] = 7; // x=24, y=16, (37, 37, 37)
//         pixel_data[16][25] = 3; // x=25, y=16, (49, 49, 49)
//         pixel_data[16][26] = 8; // x=26, y=16, (58, 58, 59)
//         pixel_data[16][27] = 8; // x=27, y=16, (58, 58, 59)
//         pixel_data[16][28] = 8; // x=28, y=16, (58, 58, 59)
//         pixel_data[16][29] = 8; // x=29, y=16, (58, 58, 59)
//         pixel_data[16][30] = 8; // x=30, y=16, (58, 58, 59)
//         pixel_data[16][31] = 8; // x=31, y=16, (58, 58, 59)
//         pixel_data[16][32] = 8; // x=32, y=16, (58, 58, 59)
//         pixel_data[16][33] = 8; // x=33, y=16, (58, 58, 59)
//         pixel_data[16][34] = 3; // x=34, y=16, (49, 49, 49)
//         pixel_data[16][35] = 4; // x=35, y=16, (127, 127, 126)
//         pixel_data[16][36] = 5; // x=36, y=16, (210, 210, 208)
//         pixel_data[16][37] = 12; // x=37, y=16, (176, 176, 174)
//         pixel_data[16][38] = 5; // x=38, y=16, (210, 210, 208)
//         pixel_data[16][39] = 0; // x=39, y=16, transparent
//         pixel_data[17][0] = 0; // x=0, y=17, transparent
//         pixel_data[17][1] = 0; // x=1, y=17, transparent
//         pixel_data[17][2] = 6; // x=2, y=17, (163, 163, 161)
//         pixel_data[17][3] = 2; // x=3, y=17, (186, 186, 184)
//         pixel_data[17][4] = 10; // x=4, y=17, (201, 201, 199)
//         pixel_data[17][5] = 10; // x=5, y=17, (201, 201, 199)
//         pixel_data[17][6] = 10; // x=6, y=17, (201, 201, 199)
//         pixel_data[17][7] = 10; // x=7, y=17, (201, 201, 199)
//         pixel_data[17][8] = 10; // x=8, y=17, (201, 201, 199)
//         pixel_data[17][9] = 10; // x=9, y=17, (201, 201, 199)
//         pixel_data[17][10] = 10; // x=10, y=17, (201, 201, 199)
//         pixel_data[17][11] = 1; // x=11, y=17, (72, 75, 77)
//         pixel_data[17][12] = 7; // x=12, y=17, (37, 37, 37)
//         pixel_data[17][13] = 9; // x=13, y=17, (85, 86, 86)
//         pixel_data[17][14] = 9; // x=14, y=17, (85, 86, 86)
//         pixel_data[17][15] = 9; // x=15, y=17, (85, 86, 86)
//         pixel_data[17][16] = 9; // x=16, y=17, (85, 86, 86)
//         pixel_data[17][17] = 9; // x=17, y=17, (85, 86, 86)
//         pixel_data[17][18] = 3; // x=18, y=17, (49, 49, 49)
//         pixel_data[17][19] = 8; // x=19, y=17, (58, 58, 59)
//         pixel_data[17][20] = 8; // x=20, y=17, (58, 58, 59)
//         pixel_data[17][21] = 8; // x=21, y=17, (58, 58, 59)
//         pixel_data[17][22] = 8; // x=22, y=17, (58, 58, 59)
//         pixel_data[17][23] = 8; // x=23, y=17, (58, 58, 59)
//         pixel_data[17][24] = 7; // x=24, y=17, (37, 37, 37)
//         pixel_data[17][25] = 3; // x=25, y=17, (49, 49, 49)
//         pixel_data[17][26] = 8; // x=26, y=17, (58, 58, 59)
//         pixel_data[17][27] = 8; // x=27, y=17, (58, 58, 59)
//         pixel_data[17][28] = 8; // x=28, y=17, (58, 58, 59)
//         pixel_data[17][29] = 8; // x=29, y=17, (58, 58, 59)
//         pixel_data[17][30] = 8; // x=30, y=17, (58, 58, 59)
//         pixel_data[17][31] = 8; // x=31, y=17, (58, 58, 59)
//         pixel_data[17][32] = 8; // x=32, y=17, (58, 58, 59)
//         pixel_data[17][33] = 8; // x=33, y=17, (58, 58, 59)
//         pixel_data[17][34] = 3; // x=34, y=17, (49, 49, 49)
//         pixel_data[17][35] = 4; // x=35, y=17, (127, 127, 126)
//         pixel_data[17][36] = 5; // x=36, y=17, (210, 210, 208)
//         pixel_data[17][37] = 12; // x=37, y=17, (176, 176, 174)
//         pixel_data[17][38] = 12; // x=38, y=17, (176, 176, 174)
//         pixel_data[17][39] = 0; // x=39, y=17, transparent
//         pixel_data[18][0] = 0; // x=0, y=18, transparent
//         pixel_data[18][1] = 0; // x=1, y=18, transparent
//         pixel_data[18][2] = 6; // x=2, y=18, (163, 163, 161)
//         pixel_data[18][3] = 2; // x=3, y=18, (186, 186, 184)
//         pixel_data[18][4] = 10; // x=4, y=18, (201, 201, 199)
//         pixel_data[18][5] = 10; // x=5, y=18, (201, 201, 199)
//         pixel_data[18][6] = 10; // x=6, y=18, (201, 201, 199)
//         pixel_data[18][7] = 10; // x=7, y=18, (201, 201, 199)
//         pixel_data[18][8] = 10; // x=8, y=18, (201, 201, 199)
//         pixel_data[18][9] = 10; // x=9, y=18, (201, 201, 199)
//         pixel_data[18][10] = 2; // x=10, y=18, (186, 186, 184)
//         pixel_data[18][11] = 13; // x=11, y=18, (29, 29, 29)
//         pixel_data[18][12] = 3; // x=12, y=18, (49, 49, 49)
//         pixel_data[18][13] = 9; // x=13, y=18, (85, 86, 86)
//         pixel_data[18][14] = 9; // x=14, y=18, (85, 86, 86)
//         pixel_data[18][15] = 9; // x=15, y=18, (85, 86, 86)
//         pixel_data[18][16] = 9; // x=16, y=18, (85, 86, 86)
//         pixel_data[18][17] = 9; // x=17, y=18, (85, 86, 86)
//         pixel_data[18][18] = 3; // x=18, y=18, (49, 49, 49)
//         pixel_data[18][19] = 8; // x=19, y=18, (58, 58, 59)
//         pixel_data[18][20] = 8; // x=20, y=18, (58, 58, 59)
//         pixel_data[18][21] = 8; // x=21, y=18, (58, 58, 59)
//         pixel_data[18][22] = 8; // x=22, y=18, (58, 58, 59)
//         pixel_data[18][23] = 8; // x=23, y=18, (58, 58, 59)
//         pixel_data[18][24] = 7; // x=24, y=18, (37, 37, 37)
//         pixel_data[18][25] = 3; // x=25, y=18, (49, 49, 49)
//         pixel_data[18][26] = 8; // x=26, y=18, (58, 58, 59)
//         pixel_data[18][27] = 8; // x=27, y=18, (58, 58, 59)
//         pixel_data[18][28] = 8; // x=28, y=18, (58, 58, 59)
//         pixel_data[18][29] = 8; // x=29, y=18, (58, 58, 59)
//         pixel_data[18][30] = 8; // x=30, y=18, (58, 58, 59)
//         pixel_data[18][31] = 8; // x=31, y=18, (58, 58, 59)
//         pixel_data[18][32] = 8; // x=32, y=18, (58, 58, 59)
//         pixel_data[18][33] = 8; // x=33, y=18, (58, 58, 59)
//         pixel_data[18][34] = 3; // x=34, y=18, (49, 49, 49)
//         pixel_data[18][35] = 4; // x=35, y=18, (127, 127, 126)
//         pixel_data[18][36] = 5; // x=36, y=18, (210, 210, 208)
//         pixel_data[18][37] = 12; // x=37, y=18, (176, 176, 174)
//         pixel_data[18][38] = 14; // x=38, y=18, (147, 148, 148)
//         pixel_data[18][39] = 0; // x=39, y=18, transparent
//         pixel_data[19][0] = 0; // x=0, y=19, transparent
//         pixel_data[19][1] = 0; // x=1, y=19, transparent
//         pixel_data[19][2] = 6; // x=2, y=19, (163, 163, 161)
//         pixel_data[19][3] = 2; // x=3, y=19, (186, 186, 184)
//         pixel_data[19][4] = 10; // x=4, y=19, (201, 201, 199)
//         pixel_data[19][5] = 10; // x=5, y=19, (201, 201, 199)
//         pixel_data[19][6] = 10; // x=6, y=19, (201, 201, 199)
//         pixel_data[19][7] = 10; // x=7, y=19, (201, 201, 199)
//         pixel_data[19][8] = 10; // x=8, y=19, (201, 201, 199)
//         pixel_data[19][9] = 10; // x=9, y=19, (201, 201, 199)
//         pixel_data[19][10] = 2; // x=10, y=19, (186, 186, 184)
//         pixel_data[19][11] = 13; // x=11, y=19, (29, 29, 29)
//         pixel_data[19][12] = 3; // x=12, y=19, (49, 49, 49)
//         pixel_data[19][13] = 9; // x=13, y=19, (85, 86, 86)
//         pixel_data[19][14] = 9; // x=14, y=19, (85, 86, 86)
//         pixel_data[19][15] = 9; // x=15, y=19, (85, 86, 86)
//         pixel_data[19][16] = 9; // x=16, y=19, (85, 86, 86)
//         pixel_data[19][17] = 1; // x=17, y=19, (72, 75, 77)
//         pixel_data[19][18] = 3; // x=18, y=19, (49, 49, 49)
//         pixel_data[19][19] = 8; // x=19, y=19, (58, 58, 59)
//         pixel_data[19][20] = 8; // x=20, y=19, (58, 58, 59)
//         pixel_data[19][21] = 8; // x=21, y=19, (58, 58, 59)
//         pixel_data[19][22] = 8; // x=22, y=19, (58, 58, 59)
//         pixel_data[19][23] = 8; // x=23, y=19, (58, 58, 59)
//         pixel_data[19][24] = 7; // x=24, y=19, (37, 37, 37)
//         pixel_data[19][25] = 3; // x=25, y=19, (49, 49, 49)
//         pixel_data[19][26] = 8; // x=26, y=19, (58, 58, 59)
//         pixel_data[19][27] = 8; // x=27, y=19, (58, 58, 59)
//         pixel_data[19][28] = 8; // x=28, y=19, (58, 58, 59)
//         pixel_data[19][29] = 8; // x=29, y=19, (58, 58, 59)
//         pixel_data[19][30] = 8; // x=30, y=19, (58, 58, 59)
//         pixel_data[19][31] = 8; // x=31, y=19, (58, 58, 59)
//         pixel_data[19][32] = 8; // x=32, y=19, (58, 58, 59)
//         pixel_data[19][33] = 8; // x=33, y=19, (58, 58, 59)
//         pixel_data[19][34] = 3; // x=34, y=19, (49, 49, 49)
//         pixel_data[19][35] = 4; // x=35, y=19, (127, 127, 126)
//         pixel_data[19][36] = 10; // x=36, y=19, (201, 201, 199)
//         pixel_data[19][37] = 12; // x=37, y=19, (176, 176, 174)
//         pixel_data[19][38] = 14; // x=38, y=19, (147, 148, 148)
//         pixel_data[19][39] = 0; // x=39, y=19, transparent
//         pixel_data[20][0] = 0; // x=0, y=20, transparent
//         pixel_data[20][1] = 0; // x=1, y=20, transparent
//         pixel_data[20][2] = 6; // x=2, y=20, (163, 163, 161)
//         pixel_data[20][3] = 2; // x=3, y=20, (186, 186, 184)
//         pixel_data[20][4] = 10; // x=4, y=20, (201, 201, 199)
//         pixel_data[20][5] = 10; // x=5, y=20, (201, 201, 199)
//         pixel_data[20][6] = 10; // x=6, y=20, (201, 201, 199)
//         pixel_data[20][7] = 10; // x=7, y=20, (201, 201, 199)
//         pixel_data[20][8] = 10; // x=8, y=20, (201, 201, 199)
//         pixel_data[20][9] = 10; // x=9, y=20, (201, 201, 199)
//         pixel_data[20][10] = 2; // x=10, y=20, (186, 186, 184)
//         pixel_data[20][11] = 13; // x=11, y=20, (29, 29, 29)
//         pixel_data[20][12] = 3; // x=12, y=20, (49, 49, 49)
//         pixel_data[20][13] = 9; // x=13, y=20, (85, 86, 86)
//         pixel_data[20][14] = 9; // x=14, y=20, (85, 86, 86)
//         pixel_data[20][15] = 9; // x=15, y=20, (85, 86, 86)
//         pixel_data[20][16] = 9; // x=16, y=20, (85, 86, 86)
//         pixel_data[20][17] = 1; // x=17, y=20, (72, 75, 77)
//         pixel_data[20][18] = 3; // x=18, y=20, (49, 49, 49)
//         pixel_data[20][19] = 8; // x=19, y=20, (58, 58, 59)
//         pixel_data[20][20] = 8; // x=20, y=20, (58, 58, 59)
//         pixel_data[20][21] = 8; // x=21, y=20, (58, 58, 59)
//         pixel_data[20][22] = 8; // x=22, y=20, (58, 58, 59)
//         pixel_data[20][23] = 8; // x=23, y=20, (58, 58, 59)
//         pixel_data[20][24] = 7; // x=24, y=20, (37, 37, 37)
//         pixel_data[20][25] = 3; // x=25, y=20, (49, 49, 49)
//         pixel_data[20][26] = 8; // x=26, y=20, (58, 58, 59)
//         pixel_data[20][27] = 8; // x=27, y=20, (58, 58, 59)
//         pixel_data[20][28] = 8; // x=28, y=20, (58, 58, 59)
//         pixel_data[20][29] = 8; // x=29, y=20, (58, 58, 59)
//         pixel_data[20][30] = 8; // x=30, y=20, (58, 58, 59)
//         pixel_data[20][31] = 8; // x=31, y=20, (58, 58, 59)
//         pixel_data[20][32] = 8; // x=32, y=20, (58, 58, 59)
//         pixel_data[20][33] = 8; // x=33, y=20, (58, 58, 59)
//         pixel_data[20][34] = 3; // x=34, y=20, (49, 49, 49)
//         pixel_data[20][35] = 4; // x=35, y=20, (127, 127, 126)
//         pixel_data[20][36] = 5; // x=36, y=20, (210, 210, 208)
//         pixel_data[20][37] = 2; // x=37, y=20, (186, 186, 184)
//         pixel_data[20][38] = 14; // x=38, y=20, (147, 148, 148)
//         pixel_data[20][39] = 0; // x=39, y=20, transparent
//         pixel_data[21][0] = 0; // x=0, y=21, transparent
//         pixel_data[21][1] = 0; // x=1, y=21, transparent
//         pixel_data[21][2] = 6; // x=2, y=21, (163, 163, 161)
//         pixel_data[21][3] = 2; // x=3, y=21, (186, 186, 184)
//         pixel_data[21][4] = 10; // x=4, y=21, (201, 201, 199)
//         pixel_data[21][5] = 10; // x=5, y=21, (201, 201, 199)
//         pixel_data[21][6] = 10; // x=6, y=21, (201, 201, 199)
//         pixel_data[21][7] = 10; // x=7, y=21, (201, 201, 199)
//         pixel_data[21][8] = 10; // x=8, y=21, (201, 201, 199)
//         pixel_data[21][9] = 10; // x=9, y=21, (201, 201, 199)
//         pixel_data[21][10] = 10; // x=10, y=21, (201, 201, 199)
//         pixel_data[21][11] = 1; // x=11, y=21, (72, 75, 77)
//         pixel_data[21][12] = 7; // x=12, y=21, (37, 37, 37)
//         pixel_data[21][13] = 9; // x=13, y=21, (85, 86, 86)
//         pixel_data[21][14] = 9; // x=14, y=21, (85, 86, 86)
//         pixel_data[21][15] = 9; // x=15, y=21, (85, 86, 86)
//         pixel_data[21][16] = 9; // x=16, y=21, (85, 86, 86)
//         pixel_data[21][17] = 9; // x=17, y=21, (85, 86, 86)
//         pixel_data[21][18] = 3; // x=18, y=21, (49, 49, 49)
//         pixel_data[21][19] = 8; // x=19, y=21, (58, 58, 59)
//         pixel_data[21][20] = 8; // x=20, y=21, (58, 58, 59)
//         pixel_data[21][21] = 8; // x=21, y=21, (58, 58, 59)
//         pixel_data[21][22] = 8; // x=22, y=21, (58, 58, 59)
//         pixel_data[21][23] = 8; // x=23, y=21, (58, 58, 59)
//         pixel_data[21][24] = 7; // x=24, y=21, (37, 37, 37)
//         pixel_data[21][25] = 3; // x=25, y=21, (49, 49, 49)
//         pixel_data[21][26] = 8; // x=26, y=21, (58, 58, 59)
//         pixel_data[21][27] = 8; // x=27, y=21, (58, 58, 59)
//         pixel_data[21][28] = 8; // x=28, y=21, (58, 58, 59)
//         pixel_data[21][29] = 8; // x=29, y=21, (58, 58, 59)
//         pixel_data[21][30] = 8; // x=30, y=21, (58, 58, 59)
//         pixel_data[21][31] = 8; // x=31, y=21, (58, 58, 59)
//         pixel_data[21][32] = 8; // x=32, y=21, (58, 58, 59)
//         pixel_data[21][33] = 8; // x=33, y=21, (58, 58, 59)
//         pixel_data[21][34] = 3; // x=34, y=21, (49, 49, 49)
//         pixel_data[21][35] = 4; // x=35, y=21, (127, 127, 126)
//         pixel_data[21][36] = 5; // x=36, y=21, (210, 210, 208)
//         pixel_data[21][37] = 12; // x=37, y=21, (176, 176, 174)
//         pixel_data[21][38] = 12; // x=38, y=21, (176, 176, 174)
//         pixel_data[21][39] = 0; // x=39, y=21, transparent
//         pixel_data[22][0] = 0; // x=0, y=22, transparent
//         pixel_data[22][1] = 0; // x=1, y=22, transparent
//         pixel_data[22][2] = 6; // x=2, y=22, (163, 163, 161)
//         pixel_data[22][3] = 2; // x=3, y=22, (186, 186, 184)
//         pixel_data[22][4] = 10; // x=4, y=22, (201, 201, 199)
//         pixel_data[22][5] = 10; // x=5, y=22, (201, 201, 199)
//         pixel_data[22][6] = 10; // x=6, y=22, (201, 201, 199)
//         pixel_data[22][7] = 10; // x=7, y=22, (201, 201, 199)
//         pixel_data[22][8] = 10; // x=8, y=22, (201, 201, 199)
//         pixel_data[22][9] = 10; // x=9, y=22, (201, 201, 199)
//         pixel_data[22][10] = 5; // x=10, y=22, (210, 210, 208)
//         pixel_data[22][11] = 15; // x=11, y=22, (112, 113, 113)
//         pixel_data[22][12] = 13; // x=12, y=22, (29, 29, 29)
//         pixel_data[22][13] = 9; // x=13, y=22, (85, 86, 86)
//         pixel_data[22][14] = 9; // x=14, y=22, (85, 86, 86)
//         pixel_data[22][15] = 9; // x=15, y=22, (85, 86, 86)
//         pixel_data[22][16] = 9; // x=16, y=22, (85, 86, 86)
//         pixel_data[22][17] = 9; // x=17, y=22, (85, 86, 86)
//         pixel_data[22][18] = 3; // x=18, y=22, (49, 49, 49)
//         pixel_data[22][19] = 8; // x=19, y=22, (58, 58, 59)
//         pixel_data[22][20] = 8; // x=20, y=22, (58, 58, 59)
//         pixel_data[22][21] = 8; // x=21, y=22, (58, 58, 59)
//         pixel_data[22][22] = 8; // x=22, y=22, (58, 58, 59)
//         pixel_data[22][23] = 8; // x=23, y=22, (58, 58, 59)
//         pixel_data[22][24] = 7; // x=24, y=22, (37, 37, 37)
//         pixel_data[22][25] = 3; // x=25, y=22, (49, 49, 49)
//         pixel_data[22][26] = 8; // x=26, y=22, (58, 58, 59)
//         pixel_data[22][27] = 8; // x=27, y=22, (58, 58, 59)
//         pixel_data[22][28] = 8; // x=28, y=22, (58, 58, 59)
//         pixel_data[22][29] = 8; // x=29, y=22, (58, 58, 59)
//         pixel_data[22][30] = 8; // x=30, y=22, (58, 58, 59)
//         pixel_data[22][31] = 8; // x=31, y=22, (58, 58, 59)
//         pixel_data[22][32] = 8; // x=32, y=22, (58, 58, 59)
//         pixel_data[22][33] = 8; // x=33, y=22, (58, 58, 59)
//         pixel_data[22][34] = 3; // x=34, y=22, (49, 49, 49)
//         pixel_data[22][35] = 4; // x=35, y=22, (127, 127, 126)
//         pixel_data[22][36] = 5; // x=36, y=22, (210, 210, 208)
//         pixel_data[22][37] = 12; // x=37, y=22, (176, 176, 174)
//         pixel_data[22][38] = 10; // x=38, y=22, (201, 201, 199)
//         pixel_data[22][39] = 0; // x=39, y=22, transparent
//         pixel_data[23][0] = 0; // x=0, y=23, transparent
//         pixel_data[23][1] = 0; // x=1, y=23, transparent
//         pixel_data[23][2] = 6; // x=2, y=23, (163, 163, 161)
//         pixel_data[23][3] = 12; // x=3, y=23, (176, 176, 174)
//         pixel_data[23][4] = 10; // x=4, y=23, (201, 201, 199)
//         pixel_data[23][5] = 10; // x=5, y=23, (201, 201, 199)
//         pixel_data[23][6] = 10; // x=6, y=23, (201, 201, 199)
//         pixel_data[23][7] = 10; // x=7, y=23, (201, 201, 199)
//         pixel_data[23][8] = 10; // x=8, y=23, (201, 201, 199)
//         pixel_data[23][9] = 10; // x=9, y=23, (201, 201, 199)
//         pixel_data[23][10] = 10; // x=10, y=23, (201, 201, 199)
//         pixel_data[23][11] = 6; // x=11, y=23, (163, 163, 161)
//         pixel_data[23][12] = 13; // x=12, y=23, (29, 29, 29)
//         pixel_data[23][13] = 1; // x=13, y=23, (72, 75, 77)
//         pixel_data[23][14] = 9; // x=14, y=23, (85, 86, 86)
//         pixel_data[23][15] = 9; // x=15, y=23, (85, 86, 86)
//         pixel_data[23][16] = 9; // x=16, y=23, (85, 86, 86)
//         pixel_data[23][17] = 9; // x=17, y=23, (85, 86, 86)
//         pixel_data[23][18] = 3; // x=18, y=23, (49, 49, 49)
//         pixel_data[23][19] = 8; // x=19, y=23, (58, 58, 59)
//         pixel_data[23][20] = 8; // x=20, y=23, (58, 58, 59)
//         pixel_data[23][21] = 8; // x=21, y=23, (58, 58, 59)
//         pixel_data[23][22] = 8; // x=22, y=23, (58, 58, 59)
//         pixel_data[23][23] = 8; // x=23, y=23, (58, 58, 59)
//         pixel_data[23][24] = 7; // x=24, y=23, (37, 37, 37)
//         pixel_data[23][25] = 3; // x=25, y=23, (49, 49, 49)
//         pixel_data[23][26] = 8; // x=26, y=23, (58, 58, 59)
//         pixel_data[23][27] = 8; // x=27, y=23, (58, 58, 59)
//         pixel_data[23][28] = 8; // x=28, y=23, (58, 58, 59)
//         pixel_data[23][29] = 8; // x=29, y=23, (58, 58, 59)
//         pixel_data[23][30] = 8; // x=30, y=23, (58, 58, 59)
//         pixel_data[23][31] = 8; // x=31, y=23, (58, 58, 59)
//         pixel_data[23][32] = 8; // x=32, y=23, (58, 58, 59)
//         pixel_data[23][33] = 8; // x=33, y=23, (58, 58, 59)
//         pixel_data[23][34] = 3; // x=34, y=23, (49, 49, 49)
//         pixel_data[23][35] = 4; // x=35, y=23, (127, 127, 126)
//         pixel_data[23][36] = 5; // x=36, y=23, (210, 210, 208)
//         pixel_data[23][37] = 6; // x=37, y=23, (163, 163, 161)
//         pixel_data[23][38] = 0; // x=38, y=23, transparent
//         pixel_data[23][39] = 0; // x=39, y=23, transparent
//         pixel_data[24][0] = 0; // x=0, y=24, transparent
//         pixel_data[24][1] = 0; // x=1, y=24, transparent
//         pixel_data[24][2] = 0; // x=2, y=24, transparent
//         pixel_data[24][3] = 6; // x=3, y=24, (163, 163, 161)
//         pixel_data[24][4] = 2; // x=4, y=24, (186, 186, 184)
//         pixel_data[24][5] = 2; // x=5, y=24, (186, 186, 184)
//         pixel_data[24][6] = 2; // x=6, y=24, (186, 186, 184)
//         pixel_data[24][7] = 2; // x=7, y=24, (186, 186, 184)
//         pixel_data[24][8] = 2; // x=8, y=24, (186, 186, 184)
//         pixel_data[24][9] = 2; // x=9, y=24, (186, 186, 184)
//         pixel_data[24][10] = 2; // x=10, y=24, (186, 186, 184)
//         pixel_data[24][11] = 2; // x=11, y=24, (186, 186, 184)
//         pixel_data[24][12] = 1; // x=12, y=24, (72, 75, 77)
//         pixel_data[24][13] = 3; // x=13, y=24, (49, 49, 49)
//         pixel_data[24][14] = 9; // x=14, y=24, (85, 86, 86)
//         pixel_data[24][15] = 9; // x=15, y=24, (85, 86, 86)
//         pixel_data[24][16] = 9; // x=16, y=24, (85, 86, 86)
//         pixel_data[24][17] = 9; // x=17, y=24, (85, 86, 86)
//         pixel_data[24][18] = 1; // x=18, y=24, (72, 75, 77)
//         pixel_data[24][19] = 7; // x=19, y=24, (37, 37, 37)
//         pixel_data[24][20] = 3; // x=20, y=24, (49, 49, 49)
//         pixel_data[24][21] = 3; // x=21, y=24, (49, 49, 49)
//         pixel_data[24][22] = 3; // x=22, y=24, (49, 49, 49)
//         pixel_data[24][23] = 3; // x=23, y=24, (49, 49, 49)
//         pixel_data[24][24] = 13; // x=24, y=24, (29, 29, 29)
//         pixel_data[24][25] = 7; // x=25, y=24, (37, 37, 37)
//         pixel_data[24][26] = 3; // x=26, y=24, (49, 49, 49)
//         pixel_data[24][27] = 3; // x=27, y=24, (49, 49, 49)
//         pixel_data[24][28] = 3; // x=28, y=24, (49, 49, 49)
//         pixel_data[24][29] = 3; // x=29, y=24, (49, 49, 49)
//         pixel_data[24][30] = 3; // x=30, y=24, (49, 49, 49)
//         pixel_data[24][31] = 7; // x=31, y=24, (37, 37, 37)
//         pixel_data[24][32] = 13; // x=32, y=24, (29, 29, 29)
//         pixel_data[24][33] = 13; // x=33, y=24, (29, 29, 29)
//         pixel_data[24][34] = 13; // x=34, y=24, (29, 29, 29)
//         pixel_data[24][35] = 15; // x=35, y=24, (112, 113, 113)
//         pixel_data[24][36] = 2; // x=36, y=24, (186, 186, 184)
//         pixel_data[24][37] = 12; // x=37, y=24, (176, 176, 174)
//         pixel_data[24][38] = 0; // x=38, y=24, transparent
//         pixel_data[24][39] = 0; // x=39, y=24, transparent
//         pixel_data[25][0] = 0; // x=0, y=25, transparent
//         pixel_data[25][1] = 0; // x=1, y=25, transparent
//         pixel_data[25][2] = 0; // x=2, y=25, transparent
//         pixel_data[25][3] = 6; // x=3, y=25, (163, 163, 161)
//         pixel_data[25][4] = 2; // x=4, y=25, (186, 186, 184)
//         pixel_data[25][5] = 10; // x=5, y=25, (201, 201, 199)
//         pixel_data[25][6] = 10; // x=6, y=25, (201, 201, 199)
//         pixel_data[25][7] = 10; // x=7, y=25, (201, 201, 199)
//         pixel_data[25][8] = 10; // x=8, y=25, (201, 201, 199)
//         pixel_data[25][9] = 10; // x=9, y=25, (201, 201, 199)
//         pixel_data[25][10] = 10; // x=10, y=25, (201, 201, 199)
//         pixel_data[25][11] = 5; // x=11, y=25, (210, 210, 208)
//         pixel_data[25][12] = 6; // x=12, y=25, (163, 163, 161)
//         pixel_data[25][13] = 7; // x=13, y=25, (37, 37, 37)
//         pixel_data[25][14] = 1; // x=14, y=25, (72, 75, 77)
//         pixel_data[25][15] = 9; // x=15, y=25, (85, 86, 86)
//         pixel_data[25][16] = 9; // x=16, y=25, (85, 86, 86)
//         pixel_data[25][17] = 9; // x=17, y=25, (85, 86, 86)
//         pixel_data[25][18] = 9; // x=18, y=25, (85, 86, 86)
//         pixel_data[25][19] = 8; // x=19, y=25, (58, 58, 59)
//         pixel_data[25][20] = 7; // x=20, y=25, (37, 37, 37)
//         pixel_data[25][21] = 7; // x=21, y=25, (37, 37, 37)
//         pixel_data[25][22] = 7; // x=22, y=25, (37, 37, 37)
//         pixel_data[25][23] = 7; // x=23, y=25, (37, 37, 37)
//         pixel_data[25][24] = 7; // x=24, y=25, (37, 37, 37)
//         pixel_data[25][25] = 13; // x=25, y=25, (29, 29, 29)
//         pixel_data[25][26] = 13; // x=26, y=25, (29, 29, 29)
//         pixel_data[25][27] = 13; // x=27, y=25, (29, 29, 29)
//         pixel_data[25][28] = 7; // x=28, y=25, (37, 37, 37)
//         pixel_data[25][29] = 7; // x=29, y=25, (37, 37, 37)
//         pixel_data[25][30] = 8; // x=30, y=25, (58, 58, 59)
//         pixel_data[25][31] = 1; // x=31, y=25, (72, 75, 77)
//         pixel_data[25][32] = 15; // x=32, y=25, (112, 113, 113)
//         pixel_data[25][33] = 4; // x=33, y=25, (127, 127, 126)
//         pixel_data[25][34] = 6; // x=34, y=25, (163, 163, 161)
//         pixel_data[25][35] = 12; // x=35, y=25, (176, 176, 174)
//         pixel_data[25][36] = 14; // x=36, y=25, (147, 148, 148)
//         pixel_data[25][37] = 2; // x=37, y=25, (186, 186, 184)
//         pixel_data[25][38] = 0; // x=38, y=25, transparent
//         pixel_data[25][39] = 0; // x=39, y=25, transparent
//         pixel_data[26][0] = 0; // x=0, y=26, transparent
//         pixel_data[26][1] = 0; // x=1, y=26, transparent
//         pixel_data[26][2] = 0; // x=2, y=26, transparent
//         pixel_data[26][3] = 0; // x=3, y=26, transparent
//         pixel_data[26][4] = 6; // x=4, y=26, (163, 163, 161)
//         pixel_data[26][5] = 12; // x=5, y=26, (176, 176, 174)
//         pixel_data[26][6] = 2; // x=6, y=26, (186, 186, 184)
//         pixel_data[26][7] = 10; // x=7, y=26, (201, 201, 199)
//         pixel_data[26][8] = 10; // x=8, y=26, (201, 201, 199)
//         pixel_data[26][9] = 10; // x=9, y=26, (201, 201, 199)
//         pixel_data[26][10] = 10; // x=10, y=26, (201, 201, 199)
//         pixel_data[26][11] = 10; // x=11, y=26, (201, 201, 199)
//         pixel_data[26][12] = 10; // x=12, y=26, (201, 201, 199)
//         pixel_data[26][13] = 15; // x=13, y=26, (112, 113, 113)
//         pixel_data[26][14] = 9; // x=14, y=26, (85, 86, 86)
//         pixel_data[26][15] = 9; // x=15, y=26, (85, 86, 86)
//         pixel_data[26][16] = 11; // x=16, y=26, (97, 98, 99)
//         pixel_data[26][17] = 11; // x=17, y=26, (97, 98, 99)
//         pixel_data[26][18] = 9; // x=18, y=26, (85, 86, 86)
//         pixel_data[26][19] = 1; // x=19, y=26, (72, 75, 77)
//         pixel_data[26][20] = 8; // x=20, y=26, (58, 58, 59)
//         pixel_data[26][21] = 8; // x=21, y=26, (58, 58, 59)
//         pixel_data[26][22] = 8; // x=22, y=26, (58, 58, 59)
//         pixel_data[26][23] = 7; // x=23, y=26, (37, 37, 37)
//         pixel_data[26][24] = 1; // x=24, y=26, (72, 75, 77)
//         pixel_data[26][25] = 3; // x=25, y=26, (49, 49, 49)
//         pixel_data[26][26] = 13; // x=26, y=26, (29, 29, 29)
//         pixel_data[26][27] = 7; // x=27, y=26, (37, 37, 37)
//         pixel_data[26][28] = 3; // x=28, y=26, (49, 49, 49)
//         pixel_data[26][29] = 3; // x=29, y=26, (49, 49, 49)
//         pixel_data[26][30] = 15; // x=30, y=26, (112, 113, 113)
//         pixel_data[26][31] = 12; // x=31, y=26, (176, 176, 174)
//         pixel_data[26][32] = 12; // x=32, y=26, (176, 176, 174)
//         pixel_data[26][33] = 2; // x=33, y=26, (186, 186, 184)
//         pixel_data[26][34] = 12; // x=34, y=26, (176, 176, 174)
//         pixel_data[26][35] = 12; // x=35, y=26, (176, 176, 174)
//         pixel_data[26][36] = 2; // x=36, y=26, (186, 186, 184)
//         pixel_data[26][37] = 0; // x=37, y=26, transparent
//         pixel_data[26][38] = 0; // x=38, y=26, transparent
//         pixel_data[26][39] = 0; // x=39, y=26, transparent
//         pixel_data[27][0] = 0; // x=0, y=27, transparent
//         pixel_data[27][1] = 0; // x=1, y=27, transparent
//         pixel_data[27][2] = 0; // x=2, y=27, transparent
//         pixel_data[27][3] = 0; // x=3, y=27, transparent
//         pixel_data[27][4] = 0; // x=4, y=27, transparent
//         pixel_data[27][5] = 0; // x=5, y=27, transparent
//         pixel_data[27][6] = 2; // x=6, y=27, (186, 186, 184)
//         pixel_data[27][7] = 2; // x=7, y=27, (186, 186, 184)
//         pixel_data[27][8] = 2; // x=8, y=27, (186, 186, 184)
//         pixel_data[27][9] = 2; // x=9, y=27, (186, 186, 184)
//         pixel_data[27][10] = 2; // x=10, y=27, (186, 186, 184)
//         pixel_data[27][11] = 2; // x=11, y=27, (186, 186, 184)
//         pixel_data[27][12] = 2; // x=12, y=27, (186, 186, 184)
//         pixel_data[27][13] = 2; // x=13, y=27, (186, 186, 184)
//         pixel_data[27][14] = 12; // x=14, y=27, (176, 176, 174)
//         pixel_data[27][15] = 4; // x=15, y=27, (127, 127, 126)
//         pixel_data[27][16] = 15; // x=16, y=27, (112, 113, 113)
//         pixel_data[27][17] = 15; // x=17, y=27, (112, 113, 113)
//         pixel_data[27][18] = 11; // x=18, y=27, (97, 98, 99)
//         pixel_data[27][19] = 11; // x=19, y=27, (97, 98, 99)
//         pixel_data[27][20] = 11; // x=20, y=27, (97, 98, 99)
//         pixel_data[27][21] = 11; // x=21, y=27, (97, 98, 99)
//         pixel_data[27][22] = 1; // x=22, y=27, (72, 75, 77)
//         pixel_data[27][23] = 8; // x=23, y=27, (58, 58, 59)
//         pixel_data[27][24] = 11; // x=24, y=27, (97, 98, 99)
//         pixel_data[27][25] = 1; // x=25, y=27, (72, 75, 77)
//         pixel_data[27][26] = 1; // x=26, y=27, (72, 75, 77)
//         pixel_data[27][27] = 9; // x=27, y=27, (85, 86, 86)
//         pixel_data[27][28] = 11; // x=28, y=27, (97, 98, 99)
//         pixel_data[27][29] = 15; // x=29, y=27, (112, 113, 113)
//         pixel_data[27][30] = 4; // x=30, y=27, (127, 127, 126)
//         pixel_data[27][31] = 2; // x=31, y=27, (186, 186, 184)
//         pixel_data[27][32] = 10; // x=32, y=27, (201, 201, 199)
//         pixel_data[27][33] = 10; // x=33, y=27, (201, 201, 199)
//         pixel_data[27][34] = 5; // x=34, y=27, (210, 210, 208)
//         pixel_data[27][35] = 0; // x=35, y=27, transparent
//         pixel_data[27][36] = 0; // x=36, y=27, transparent
//         pixel_data[27][37] = 0; // x=37, y=27, transparent
//         pixel_data[27][38] = 0; // x=38, y=27, transparent
//         pixel_data[27][39] = 0; // x=39, y=27, transparent
//         pixel_data[28][0] = 0; // x=0, y=28, transparent
//         pixel_data[28][1] = 0; // x=1, y=28, transparent
//         pixel_data[28][2] = 0; // x=2, y=28, transparent
//         pixel_data[28][3] = 0; // x=3, y=28, transparent
//         pixel_data[28][4] = 0; // x=4, y=28, transparent
//         pixel_data[28][5] = 0; // x=5, y=28, transparent
//         pixel_data[28][6] = 0; // x=6, y=28, transparent
//         pixel_data[28][7] = 0; // x=7, y=28, transparent
//         pixel_data[28][8] = 0; // x=8, y=28, transparent
//         pixel_data[28][9] = 0; // x=9, y=28, transparent
//         pixel_data[28][10] = 0; // x=10, y=28, transparent
//         pixel_data[28][11] = 0; // x=11, y=28, transparent
//         pixel_data[28][12] = 0; // x=12, y=28, transparent
//         pixel_data[28][13] = 0; // x=13, y=28, transparent
//         pixel_data[28][14] = 0; // x=14, y=28, transparent
//         pixel_data[28][15] = 0; // x=15, y=28, transparent
//         pixel_data[28][16] = 0; // x=16, y=28, transparent
//         pixel_data[28][17] = 0; // x=17, y=28, transparent
//         pixel_data[28][18] = 0; // x=18, y=28, transparent
//         pixel_data[28][19] = 0; // x=19, y=28, transparent
//         pixel_data[28][20] = 0; // x=20, y=28, transparent
//         pixel_data[28][21] = 0; // x=21, y=28, transparent
//         pixel_data[28][22] = 0; // x=22, y=28, transparent
//         pixel_data[28][23] = 0; // x=23, y=28, transparent
//         pixel_data[28][24] = 0; // x=24, y=28, transparent
//         pixel_data[28][25] = 0; // x=25, y=28, transparent
//         pixel_data[28][26] = 0; // x=26, y=28, transparent
//         pixel_data[28][27] = 0; // x=27, y=28, transparent
//         pixel_data[28][28] = 0; // x=28, y=28, transparent
//         pixel_data[28][29] = 0; // x=29, y=28, transparent
//         pixel_data[28][30] = 0; // x=30, y=28, transparent
//         pixel_data[28][31] = 0; // x=31, y=28, transparent
//         pixel_data[28][32] = 0; // x=32, y=28, transparent
//         pixel_data[28][33] = 0; // x=33, y=28, transparent
//         pixel_data[28][34] = 0; // x=34, y=28, transparent
//         pixel_data[28][35] = 0; // x=35, y=28, transparent
//         pixel_data[28][36] = 0; // x=36, y=28, transparent
//         pixel_data[28][37] = 0; // x=37, y=28, transparent
//         pixel_data[28][38] = 0; // x=38, y=28, transparent
//         pixel_data[28][39] = 0; // x=39, y=28, transparent
//         pixel_data[29][0] = 0; // x=0, y=29, transparent
//         pixel_data[29][1] = 0; // x=1, y=29, transparent
//         pixel_data[29][2] = 0; // x=2, y=29, transparent
//         pixel_data[29][3] = 0; // x=3, y=29, transparent
//         pixel_data[29][4] = 0; // x=4, y=29, transparent
//         pixel_data[29][5] = 0; // x=5, y=29, transparent
//         pixel_data[29][6] = 0; // x=6, y=29, transparent
//         pixel_data[29][7] = 0; // x=7, y=29, transparent
//         pixel_data[29][8] = 0; // x=8, y=29, transparent
//         pixel_data[29][9] = 0; // x=9, y=29, transparent
//         pixel_data[29][10] = 0; // x=10, y=29, transparent
//         pixel_data[29][11] = 0; // x=11, y=29, transparent
//         pixel_data[29][12] = 0; // x=12, y=29, transparent
//         pixel_data[29][13] = 0; // x=13, y=29, transparent
//         pixel_data[29][14] = 0; // x=14, y=29, transparent
//         pixel_data[29][15] = 0; // x=15, y=29, transparent
//         pixel_data[29][16] = 0; // x=16, y=29, transparent
//         pixel_data[29][17] = 0; // x=17, y=29, transparent
//         pixel_data[29][18] = 0; // x=18, y=29, transparent
//         pixel_data[29][19] = 0; // x=19, y=29, transparent
//         pixel_data[29][20] = 0; // x=20, y=29, transparent
//         pixel_data[29][21] = 0; // x=21, y=29, transparent
//         pixel_data[29][22] = 0; // x=22, y=29, transparent
//         pixel_data[29][23] = 0; // x=23, y=29, transparent
//         pixel_data[29][24] = 0; // x=24, y=29, transparent
//         pixel_data[29][25] = 0; // x=25, y=29, transparent
//         pixel_data[29][26] = 0; // x=26, y=29, transparent
//         pixel_data[29][27] = 0; // x=27, y=29, transparent
//         pixel_data[29][28] = 0; // x=28, y=29, transparent
//         pixel_data[29][29] = 0; // x=29, y=29, transparent
//         pixel_data[29][30] = 0; // x=30, y=29, transparent
//         pixel_data[29][31] = 0; // x=31, y=29, transparent
//         pixel_data[29][32] = 0; // x=32, y=29, transparent
//         pixel_data[29][33] = 0; // x=33, y=29, transparent
//         pixel_data[29][34] = 0; // x=34, y=29, transparent
//         pixel_data[29][35] = 0; // x=35, y=29, transparent
//         pixel_data[29][36] = 0; // x=36, y=29, transparent
//         pixel_data[29][37] = 0; // x=37, y=29, transparent
//         pixel_data[29][38] = 0; // x=38, y=29, transparent
//         pixel_data[29][39] = 0; // x=39, y=29, transparent
//         pixel_data[30][0] = 0; // x=0, y=30, transparent
//         pixel_data[30][1] = 0; // x=1, y=30, transparent
//         pixel_data[30][2] = 0; // x=2, y=30, transparent
//         pixel_data[30][3] = 0; // x=3, y=30, transparent
//         pixel_data[30][4] = 0; // x=4, y=30, transparent
//         pixel_data[30][5] = 0; // x=5, y=30, transparent
//         pixel_data[30][6] = 0; // x=6, y=30, transparent
//         pixel_data[30][7] = 0; // x=7, y=30, transparent
//         pixel_data[30][8] = 0; // x=8, y=30, transparent
//         pixel_data[30][9] = 0; // x=9, y=30, transparent
//         pixel_data[30][10] = 0; // x=10, y=30, transparent
//         pixel_data[30][11] = 0; // x=11, y=30, transparent
//         pixel_data[30][12] = 0; // x=12, y=30, transparent
//         pixel_data[30][13] = 0; // x=13, y=30, transparent
//         pixel_data[30][14] = 0; // x=14, y=30, transparent
//         pixel_data[30][15] = 0; // x=15, y=30, transparent
//         pixel_data[30][16] = 0; // x=16, y=30, transparent
//         pixel_data[30][17] = 0; // x=17, y=30, transparent
//         pixel_data[30][18] = 0; // x=18, y=30, transparent
//         pixel_data[30][19] = 0; // x=19, y=30, transparent
//         pixel_data[30][20] = 0; // x=20, y=30, transparent
//         pixel_data[30][21] = 0; // x=21, y=30, transparent
//         pixel_data[30][22] = 0; // x=22, y=30, transparent
//         pixel_data[30][23] = 0; // x=23, y=30, transparent
//         pixel_data[30][24] = 0; // x=24, y=30, transparent
//         pixel_data[30][25] = 0; // x=25, y=30, transparent
//         pixel_data[30][26] = 0; // x=26, y=30, transparent
//         pixel_data[30][27] = 0; // x=27, y=30, transparent
//         pixel_data[30][28] = 0; // x=28, y=30, transparent
//         pixel_data[30][29] = 0; // x=29, y=30, transparent
//         pixel_data[30][30] = 0; // x=30, y=30, transparent
//         pixel_data[30][31] = 0; // x=31, y=30, transparent
//         pixel_data[30][32] = 0; // x=32, y=30, transparent
//         pixel_data[30][33] = 0; // x=33, y=30, transparent
//         pixel_data[30][34] = 0; // x=34, y=30, transparent
//         pixel_data[30][35] = 0; // x=35, y=30, transparent
//         pixel_data[30][36] = 0; // x=36, y=30, transparent
//         pixel_data[30][37] = 0; // x=37, y=30, transparent
//         pixel_data[30][38] = 0; // x=38, y=30, transparent
//         pixel_data[30][39] = 0; // x=39, y=30, transparent
//         pixel_data[31][0] = 0; // x=0, y=31, transparent
//         pixel_data[31][1] = 0; // x=1, y=31, transparent
//         pixel_data[31][2] = 0; // x=2, y=31, transparent
//         pixel_data[31][3] = 0; // x=3, y=31, transparent
//         pixel_data[31][4] = 0; // x=4, y=31, transparent
//         pixel_data[31][5] = 0; // x=5, y=31, transparent
//         pixel_data[31][6] = 0; // x=6, y=31, transparent
//         pixel_data[31][7] = 0; // x=7, y=31, transparent
//         pixel_data[31][8] = 0; // x=8, y=31, transparent
//         pixel_data[31][9] = 0; // x=9, y=31, transparent
//         pixel_data[31][10] = 0; // x=10, y=31, transparent
//         pixel_data[31][11] = 0; // x=11, y=31, transparent
//         pixel_data[31][12] = 0; // x=12, y=31, transparent
//         pixel_data[31][13] = 0; // x=13, y=31, transparent
//         pixel_data[31][14] = 0; // x=14, y=31, transparent
//         pixel_data[31][15] = 0; // x=15, y=31, transparent
//         pixel_data[31][16] = 0; // x=16, y=31, transparent
//         pixel_data[31][17] = 0; // x=17, y=31, transparent
//         pixel_data[31][18] = 0; // x=18, y=31, transparent
//         pixel_data[31][19] = 0; // x=19, y=31, transparent
//         pixel_data[31][20] = 0; // x=20, y=31, transparent
//         pixel_data[31][21] = 0; // x=21, y=31, transparent
//         pixel_data[31][22] = 0; // x=22, y=31, transparent
//         pixel_data[31][23] = 0; // x=23, y=31, transparent
//         pixel_data[31][24] = 0; // x=24, y=31, transparent
//         pixel_data[31][25] = 0; // x=25, y=31, transparent
//         pixel_data[31][26] = 0; // x=26, y=31, transparent
//         pixel_data[31][27] = 0; // x=27, y=31, transparent
//         pixel_data[31][28] = 0; // x=28, y=31, transparent
//         pixel_data[31][29] = 0; // x=29, y=31, transparent
//         pixel_data[31][30] = 0; // x=30, y=31, transparent
//         pixel_data[31][31] = 0; // x=31, y=31, transparent
//         pixel_data[31][32] = 0; // x=32, y=31, transparent
//         pixel_data[31][33] = 0; // x=33, y=31, transparent
//         pixel_data[31][34] = 0; // x=34, y=31, transparent
//         pixel_data[31][35] = 0; // x=35, y=31, transparent
//         pixel_data[31][36] = 0; // x=36, y=31, transparent
//         pixel_data[31][37] = 0; // x=37, y=31, transparent
//         pixel_data[31][38] = 0; // x=38, y=31, transparent
//         pixel_data[31][39] = 0; // x=39, y=31, transparent
//         pixel_data[32][0] = 0; // x=0, y=32, transparent
//         pixel_data[32][1] = 0; // x=1, y=32, transparent
//         pixel_data[32][2] = 0; // x=2, y=32, transparent
//         pixel_data[32][3] = 0; // x=3, y=32, transparent
//         pixel_data[32][4] = 0; // x=4, y=32, transparent
//         pixel_data[32][5] = 0; // x=5, y=32, transparent
//         pixel_data[32][6] = 0; // x=6, y=32, transparent
//         pixel_data[32][7] = 0; // x=7, y=32, transparent
//         pixel_data[32][8] = 0; // x=8, y=32, transparent
//         pixel_data[32][9] = 0; // x=9, y=32, transparent
//         pixel_data[32][10] = 0; // x=10, y=32, transparent
//         pixel_data[32][11] = 0; // x=11, y=32, transparent
//         pixel_data[32][12] = 0; // x=12, y=32, transparent
//         pixel_data[32][13] = 0; // x=13, y=32, transparent
//         pixel_data[32][14] = 0; // x=14, y=32, transparent
//         pixel_data[32][15] = 0; // x=15, y=32, transparent
//         pixel_data[32][16] = 0; // x=16, y=32, transparent
//         pixel_data[32][17] = 0; // x=17, y=32, transparent
//         pixel_data[32][18] = 0; // x=18, y=32, transparent
//         pixel_data[32][19] = 0; // x=19, y=32, transparent
//         pixel_data[32][20] = 0; // x=20, y=32, transparent
//         pixel_data[32][21] = 0; // x=21, y=32, transparent
//         pixel_data[32][22] = 0; // x=22, y=32, transparent
//         pixel_data[32][23] = 0; // x=23, y=32, transparent
//         pixel_data[32][24] = 0; // x=24, y=32, transparent
//         pixel_data[32][25] = 0; // x=25, y=32, transparent
//         pixel_data[32][26] = 0; // x=26, y=32, transparent
//         pixel_data[32][27] = 0; // x=27, y=32, transparent
//         pixel_data[32][28] = 0; // x=28, y=32, transparent
//         pixel_data[32][29] = 0; // x=29, y=32, transparent
//         pixel_data[32][30] = 0; // x=30, y=32, transparent
//         pixel_data[32][31] = 0; // x=31, y=32, transparent
//         pixel_data[32][32] = 0; // x=32, y=32, transparent
//         pixel_data[32][33] = 0; // x=33, y=32, transparent
//         pixel_data[32][34] = 0; // x=34, y=32, transparent
//         pixel_data[32][35] = 0; // x=35, y=32, transparent
//         pixel_data[32][36] = 0; // x=36, y=32, transparent
//         pixel_data[32][37] = 0; // x=37, y=32, transparent
//         pixel_data[32][38] = 0; // x=38, y=32, transparent
//         pixel_data[32][39] = 0; // x=39, y=32, transparent
//         pixel_data[33][0] = 0; // x=0, y=33, transparent
//         pixel_data[33][1] = 0; // x=1, y=33, transparent
//         pixel_data[33][2] = 0; // x=2, y=33, transparent
//         pixel_data[33][3] = 0; // x=3, y=33, transparent
//         pixel_data[33][4] = 0; // x=4, y=33, transparent
//         pixel_data[33][5] = 0; // x=5, y=33, transparent
//         pixel_data[33][6] = 0; // x=6, y=33, transparent
//         pixel_data[33][7] = 0; // x=7, y=33, transparent
//         pixel_data[33][8] = 0; // x=8, y=33, transparent
//         pixel_data[33][9] = 0; // x=9, y=33, transparent
//         pixel_data[33][10] = 0; // x=10, y=33, transparent
//         pixel_data[33][11] = 0; // x=11, y=33, transparent
//         pixel_data[33][12] = 0; // x=12, y=33, transparent
//         pixel_data[33][13] = 0; // x=13, y=33, transparent
//         pixel_data[33][14] = 0; // x=14, y=33, transparent
//         pixel_data[33][15] = 0; // x=15, y=33, transparent
//         pixel_data[33][16] = 0; // x=16, y=33, transparent
//         pixel_data[33][17] = 0; // x=17, y=33, transparent
//         pixel_data[33][18] = 0; // x=18, y=33, transparent
//         pixel_data[33][19] = 0; // x=19, y=33, transparent
//         pixel_data[33][20] = 0; // x=20, y=33, transparent
//         pixel_data[33][21] = 0; // x=21, y=33, transparent
//         pixel_data[33][22] = 0; // x=22, y=33, transparent
//         pixel_data[33][23] = 0; // x=23, y=33, transparent
//         pixel_data[33][24] = 0; // x=24, y=33, transparent
//         pixel_data[33][25] = 0; // x=25, y=33, transparent
//         pixel_data[33][26] = 0; // x=26, y=33, transparent
//         pixel_data[33][27] = 0; // x=27, y=33, transparent
//         pixel_data[33][28] = 0; // x=28, y=33, transparent
//         pixel_data[33][29] = 0; // x=29, y=33, transparent
//         pixel_data[33][30] = 0; // x=30, y=33, transparent
//         pixel_data[33][31] = 0; // x=31, y=33, transparent
//         pixel_data[33][32] = 0; // x=32, y=33, transparent
//         pixel_data[33][33] = 0; // x=33, y=33, transparent
//         pixel_data[33][34] = 0; // x=34, y=33, transparent
//         pixel_data[33][35] = 0; // x=35, y=33, transparent
//         pixel_data[33][36] = 0; // x=36, y=33, transparent
//         pixel_data[33][37] = 0; // x=37, y=33, transparent
//         pixel_data[33][38] = 0; // x=38, y=33, transparent
//         pixel_data[33][39] = 0; // x=39, y=33, transparent
//         pixel_data[34][0] = 0; // x=0, y=34, transparent
//         pixel_data[34][1] = 0; // x=1, y=34, transparent
//         pixel_data[34][2] = 0; // x=2, y=34, transparent
//         pixel_data[34][3] = 0; // x=3, y=34, transparent
//         pixel_data[34][4] = 0; // x=4, y=34, transparent
//         pixel_data[34][5] = 0; // x=5, y=34, transparent
//         pixel_data[34][6] = 0; // x=6, y=34, transparent
//         pixel_data[34][7] = 0; // x=7, y=34, transparent
//         pixel_data[34][8] = 0; // x=8, y=34, transparent
//         pixel_data[34][9] = 0; // x=9, y=34, transparent
//         pixel_data[34][10] = 0; // x=10, y=34, transparent
//         pixel_data[34][11] = 0; // x=11, y=34, transparent
//         pixel_data[34][12] = 0; // x=12, y=34, transparent
//         pixel_data[34][13] = 0; // x=13, y=34, transparent
//         pixel_data[34][14] = 0; // x=14, y=34, transparent
//         pixel_data[34][15] = 0; // x=15, y=34, transparent
//         pixel_data[34][16] = 0; // x=16, y=34, transparent
//         pixel_data[34][17] = 0; // x=17, y=34, transparent
//         pixel_data[34][18] = 0; // x=18, y=34, transparent
//         pixel_data[34][19] = 0; // x=19, y=34, transparent
//         pixel_data[34][20] = 0; // x=20, y=34, transparent
//         pixel_data[34][21] = 0; // x=21, y=34, transparent
//         pixel_data[34][22] = 0; // x=22, y=34, transparent
//         pixel_data[34][23] = 0; // x=23, y=34, transparent
//         pixel_data[34][24] = 0; // x=24, y=34, transparent
//         pixel_data[34][25] = 0; // x=25, y=34, transparent
//         pixel_data[34][26] = 0; // x=26, y=34, transparent
//         pixel_data[34][27] = 0; // x=27, y=34, transparent
//         pixel_data[34][28] = 0; // x=28, y=34, transparent
//         pixel_data[34][29] = 0; // x=29, y=34, transparent
//         pixel_data[34][30] = 0; // x=30, y=34, transparent
//         pixel_data[34][31] = 0; // x=31, y=34, transparent
//         pixel_data[34][32] = 0; // x=32, y=34, transparent
//         pixel_data[34][33] = 0; // x=33, y=34, transparent
//         pixel_data[34][34] = 0; // x=34, y=34, transparent
//         pixel_data[34][35] = 0; // x=35, y=34, transparent
//         pixel_data[34][36] = 0; // x=36, y=34, transparent
//         pixel_data[34][37] = 0; // x=37, y=34, transparent
//         pixel_data[34][38] = 0; // x=38, y=34, transparent
//         pixel_data[34][39] = 0; // x=39, y=34, transparent
//         pixel_data[35][0] = 0; // x=0, y=35, transparent
//         pixel_data[35][1] = 0; // x=1, y=35, transparent
//         pixel_data[35][2] = 0; // x=2, y=35, transparent
//         pixel_data[35][3] = 0; // x=3, y=35, transparent
//         pixel_data[35][4] = 0; // x=4, y=35, transparent
//         pixel_data[35][5] = 0; // x=5, y=35, transparent
//         pixel_data[35][6] = 0; // x=6, y=35, transparent
//         pixel_data[35][7] = 0; // x=7, y=35, transparent
//         pixel_data[35][8] = 0; // x=8, y=35, transparent
//         pixel_data[35][9] = 0; // x=9, y=35, transparent
//         pixel_data[35][10] = 0; // x=10, y=35, transparent
//         pixel_data[35][11] = 0; // x=11, y=35, transparent
//         pixel_data[35][12] = 0; // x=12, y=35, transparent
//         pixel_data[35][13] = 0; // x=13, y=35, transparent
//         pixel_data[35][14] = 0; // x=14, y=35, transparent
//         pixel_data[35][15] = 0; // x=15, y=35, transparent
//         pixel_data[35][16] = 0; // x=16, y=35, transparent
//         pixel_data[35][17] = 0; // x=17, y=35, transparent
//         pixel_data[35][18] = 0; // x=18, y=35, transparent
//         pixel_data[35][19] = 0; // x=19, y=35, transparent
//         pixel_data[35][20] = 0; // x=20, y=35, transparent
//         pixel_data[35][21] = 0; // x=21, y=35, transparent
//         pixel_data[35][22] = 0; // x=22, y=35, transparent
//         pixel_data[35][23] = 0; // x=23, y=35, transparent
//         pixel_data[35][24] = 0; // x=24, y=35, transparent
//         pixel_data[35][25] = 0; // x=25, y=35, transparent
//         pixel_data[35][26] = 0; // x=26, y=35, transparent
//         pixel_data[35][27] = 0; // x=27, y=35, transparent
//         pixel_data[35][28] = 0; // x=28, y=35, transparent
//         pixel_data[35][29] = 0; // x=29, y=35, transparent
//         pixel_data[35][30] = 0; // x=30, y=35, transparent
//         pixel_data[35][31] = 0; // x=31, y=35, transparent
//         pixel_data[35][32] = 0; // x=32, y=35, transparent
//         pixel_data[35][33] = 0; // x=33, y=35, transparent
//         pixel_data[35][34] = 0; // x=34, y=35, transparent
//         pixel_data[35][35] = 0; // x=35, y=35, transparent
//         pixel_data[35][36] = 0; // x=36, y=35, transparent
//         pixel_data[35][37] = 0; // x=37, y=35, transparent
//         pixel_data[35][38] = 0; // x=38, y=35, transparent
//         pixel_data[35][39] = 0; // x=39, y=35, transparent
//         pixel_data[36][0] = 0; // x=0, y=36, transparent
//         pixel_data[36][1] = 0; // x=1, y=36, transparent
//         pixel_data[36][2] = 0; // x=2, y=36, transparent
//         pixel_data[36][3] = 0; // x=3, y=36, transparent
//         pixel_data[36][4] = 0; // x=4, y=36, transparent
//         pixel_data[36][5] = 0; // x=5, y=36, transparent
//         pixel_data[36][6] = 0; // x=6, y=36, transparent
//         pixel_data[36][7] = 0; // x=7, y=36, transparent
//         pixel_data[36][8] = 0; // x=8, y=36, transparent
//         pixel_data[36][9] = 0; // x=9, y=36, transparent
//         pixel_data[36][10] = 0; // x=10, y=36, transparent
//         pixel_data[36][11] = 0; // x=11, y=36, transparent
//         pixel_data[36][12] = 0; // x=12, y=36, transparent
//         pixel_data[36][13] = 0; // x=13, y=36, transparent
//         pixel_data[36][14] = 0; // x=14, y=36, transparent
//         pixel_data[36][15] = 0; // x=15, y=36, transparent
//         pixel_data[36][16] = 0; // x=16, y=36, transparent
//         pixel_data[36][17] = 0; // x=17, y=36, transparent
//         pixel_data[36][18] = 0; // x=18, y=36, transparent
//         pixel_data[36][19] = 0; // x=19, y=36, transparent
//         pixel_data[36][20] = 0; // x=20, y=36, transparent
//         pixel_data[36][21] = 0; // x=21, y=36, transparent
//         pixel_data[36][22] = 0; // x=22, y=36, transparent
//         pixel_data[36][23] = 0; // x=23, y=36, transparent
//         pixel_data[36][24] = 0; // x=24, y=36, transparent
//         pixel_data[36][25] = 0; // x=25, y=36, transparent
//         pixel_data[36][26] = 0; // x=26, y=36, transparent
//         pixel_data[36][27] = 0; // x=27, y=36, transparent
//         pixel_data[36][28] = 0; // x=28, y=36, transparent
//         pixel_data[36][29] = 0; // x=29, y=36, transparent
//         pixel_data[36][30] = 0; // x=30, y=36, transparent
//         pixel_data[36][31] = 0; // x=31, y=36, transparent
//         pixel_data[36][32] = 0; // x=32, y=36, transparent
//         pixel_data[36][33] = 0; // x=33, y=36, transparent
//         pixel_data[36][34] = 0; // x=34, y=36, transparent
//         pixel_data[36][35] = 0; // x=35, y=36, transparent
//         pixel_data[36][36] = 0; // x=36, y=36, transparent
//         pixel_data[36][37] = 0; // x=37, y=36, transparent
//         pixel_data[36][38] = 0; // x=38, y=36, transparent
//         pixel_data[36][39] = 0; // x=39, y=36, transparent
//         pixel_data[37][0] = 0; // x=0, y=37, transparent
//         pixel_data[37][1] = 0; // x=1, y=37, transparent
//         pixel_data[37][2] = 0; // x=2, y=37, transparent
//         pixel_data[37][3] = 0; // x=3, y=37, transparent
//         pixel_data[37][4] = 0; // x=4, y=37, transparent
//         pixel_data[37][5] = 0; // x=5, y=37, transparent
//         pixel_data[37][6] = 0; // x=6, y=37, transparent
//         pixel_data[37][7] = 0; // x=7, y=37, transparent
//         pixel_data[37][8] = 0; // x=8, y=37, transparent
//         pixel_data[37][9] = 0; // x=9, y=37, transparent
//         pixel_data[37][10] = 0; // x=10, y=37, transparent
//         pixel_data[37][11] = 0; // x=11, y=37, transparent
//         pixel_data[37][12] = 0; // x=12, y=37, transparent
//         pixel_data[37][13] = 0; // x=13, y=37, transparent
//         pixel_data[37][14] = 0; // x=14, y=37, transparent
//         pixel_data[37][15] = 0; // x=15, y=37, transparent
//         pixel_data[37][16] = 0; // x=16, y=37, transparent
//         pixel_data[37][17] = 0; // x=17, y=37, transparent
//         pixel_data[37][18] = 0; // x=18, y=37, transparent
//         pixel_data[37][19] = 0; // x=19, y=37, transparent
//         pixel_data[37][20] = 0; // x=20, y=37, transparent
//         pixel_data[37][21] = 0; // x=21, y=37, transparent
//         pixel_data[37][22] = 0; // x=22, y=37, transparent
//         pixel_data[37][23] = 0; // x=23, y=37, transparent
//         pixel_data[37][24] = 0; // x=24, y=37, transparent
//         pixel_data[37][25] = 0; // x=25, y=37, transparent
//         pixel_data[37][26] = 0; // x=26, y=37, transparent
//         pixel_data[37][27] = 0; // x=27, y=37, transparent
//         pixel_data[37][28] = 0; // x=28, y=37, transparent
//         pixel_data[37][29] = 0; // x=29, y=37, transparent
//         pixel_data[37][30] = 0; // x=30, y=37, transparent
//         pixel_data[37][31] = 0; // x=31, y=37, transparent
//         pixel_data[37][32] = 0; // x=32, y=37, transparent
//         pixel_data[37][33] = 0; // x=33, y=37, transparent
//         pixel_data[37][34] = 0; // x=34, y=37, transparent
//         pixel_data[37][35] = 0; // x=35, y=37, transparent
//         pixel_data[37][36] = 0; // x=36, y=37, transparent
//         pixel_data[37][37] = 0; // x=37, y=37, transparent
//         pixel_data[37][38] = 0; // x=38, y=37, transparent
//         pixel_data[37][39] = 0; // x=39, y=37, transparent
//         pixel_data[38][0] = 0; // x=0, y=38, transparent
//         pixel_data[38][1] = 0; // x=1, y=38, transparent
//         pixel_data[38][2] = 0; // x=2, y=38, transparent
//         pixel_data[38][3] = 0; // x=3, y=38, transparent
//         pixel_data[38][4] = 0; // x=4, y=38, transparent
//         pixel_data[38][5] = 0; // x=5, y=38, transparent
//         pixel_data[38][6] = 0; // x=6, y=38, transparent
//         pixel_data[38][7] = 0; // x=7, y=38, transparent
//         pixel_data[38][8] = 0; // x=8, y=38, transparent
//         pixel_data[38][9] = 0; // x=9, y=38, transparent
//         pixel_data[38][10] = 0; // x=10, y=38, transparent
//         pixel_data[38][11] = 0; // x=11, y=38, transparent
//         pixel_data[38][12] = 0; // x=12, y=38, transparent
//         pixel_data[38][13] = 0; // x=13, y=38, transparent
//         pixel_data[38][14] = 0; // x=14, y=38, transparent
//         pixel_data[38][15] = 0; // x=15, y=38, transparent
//         pixel_data[38][16] = 0; // x=16, y=38, transparent
//         pixel_data[38][17] = 0; // x=17, y=38, transparent
//         pixel_data[38][18] = 0; // x=18, y=38, transparent
//         pixel_data[38][19] = 0; // x=19, y=38, transparent
//         pixel_data[38][20] = 0; // x=20, y=38, transparent
//         pixel_data[38][21] = 0; // x=21, y=38, transparent
//         pixel_data[38][22] = 0; // x=22, y=38, transparent
//         pixel_data[38][23] = 0; // x=23, y=38, transparent
//         pixel_data[38][24] = 0; // x=24, y=38, transparent
//         pixel_data[38][25] = 0; // x=25, y=38, transparent
//         pixel_data[38][26] = 0; // x=26, y=38, transparent
//         pixel_data[38][27] = 0; // x=27, y=38, transparent
//         pixel_data[38][28] = 0; // x=28, y=38, transparent
//         pixel_data[38][29] = 0; // x=29, y=38, transparent
//         pixel_data[38][30] = 0; // x=30, y=38, transparent
//         pixel_data[38][31] = 0; // x=31, y=38, transparent
//         pixel_data[38][32] = 0; // x=32, y=38, transparent
//         pixel_data[38][33] = 0; // x=33, y=38, transparent
//         pixel_data[38][34] = 0; // x=34, y=38, transparent
//         pixel_data[38][35] = 0; // x=35, y=38, transparent
//         pixel_data[38][36] = 0; // x=36, y=38, transparent
//         pixel_data[38][37] = 0; // x=37, y=38, transparent
//         pixel_data[38][38] = 0; // x=38, y=38, transparent
//         pixel_data[38][39] = 0; // x=39, y=38, transparent
//         pixel_data[39][0] = 0; // x=0, y=39, transparent
//         pixel_data[39][1] = 0; // x=1, y=39, transparent
//         pixel_data[39][2] = 0; // x=2, y=39, transparent
//         pixel_data[39][3] = 0; // x=3, y=39, transparent
//         pixel_data[39][4] = 0; // x=4, y=39, transparent
//         pixel_data[39][5] = 0; // x=5, y=39, transparent
//         pixel_data[39][6] = 0; // x=6, y=39, transparent
//         pixel_data[39][7] = 0; // x=7, y=39, transparent
//         pixel_data[39][8] = 0; // x=8, y=39, transparent
//         pixel_data[39][9] = 0; // x=9, y=39, transparent
//         pixel_data[39][10] = 0; // x=10, y=39, transparent
//         pixel_data[39][11] = 0; // x=11, y=39, transparent
//         pixel_data[39][12] = 0; // x=12, y=39, transparent
//         pixel_data[39][13] = 0; // x=13, y=39, transparent
//         pixel_data[39][14] = 0; // x=14, y=39, transparent
//         pixel_data[39][15] = 0; // x=15, y=39, transparent
//         pixel_data[39][16] = 0; // x=16, y=39, transparent
//         pixel_data[39][17] = 0; // x=17, y=39, transparent
//         pixel_data[39][18] = 0; // x=18, y=39, transparent
//         pixel_data[39][19] = 0; // x=19, y=39, transparent
//         pixel_data[39][20] = 0; // x=20, y=39, transparent
//         pixel_data[39][21] = 0; // x=21, y=39, transparent
//         pixel_data[39][22] = 0; // x=22, y=39, transparent
//         pixel_data[39][23] = 0; // x=23, y=39, transparent
//         pixel_data[39][24] = 0; // x=24, y=39, transparent
//         pixel_data[39][25] = 0; // x=25, y=39, transparent
//         pixel_data[39][26] = 0; // x=26, y=39, transparent
//         pixel_data[39][27] = 0; // x=27, y=39, transparent
//         pixel_data[39][28] = 0; // x=28, y=39, transparent
//         pixel_data[39][29] = 0; // x=29, y=39, transparent
//         pixel_data[39][30] = 0; // x=30, y=39, transparent
//         pixel_data[39][31] = 0; // x=31, y=39, transparent
//         pixel_data[39][32] = 0; // x=32, y=39, transparent
//         pixel_data[39][33] = 0; // x=33, y=39, transparent
//         pixel_data[39][34] = 0; // x=34, y=39, transparent
//         pixel_data[39][35] = 0; // x=35, y=39, transparent
//         pixel_data[39][36] = 0; // x=36, y=39, transparent
//         pixel_data[39][37] = 0; // x=37, y=39, transparent
//         pixel_data[39][38] = 0; // x=38, y=39, transparent
//         pixel_data[39][39] = 0; // x=39, y=39, transparent
//     end
// endmodule

// gray
module car1_lut(output reg [3:0] pixel_data [0:39][0:39]);
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
        pixel_data[1][16] = 6; // x=16, y=1, (65, 132, 98)
        pixel_data[1][17] = 5; // x=17, y=1, (23, 112, 58)
        pixel_data[1][18] = 14; // x=18, y=1, (11, 103, 50)
        pixel_data[1][19] = 5; // x=19, y=1, (23, 112, 58)
        pixel_data[1][20] = 14; // x=20, y=1, (11, 103, 50)
        pixel_data[1][21] = 5; // x=21, y=1, (23, 112, 58)
        pixel_data[1][22] = 6; // x=22, y=1, (65, 132, 98)
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
        pixel_data[2][14] = 4; // x=14, y=2, (139, 178, 157)
        pixel_data[2][15] = 14; // x=15, y=2, (11, 103, 50)
        pixel_data[2][16] = 1; // x=16, y=2, (2, 93, 41)
        pixel_data[2][17] = 1; // x=17, y=2, (2, 93, 41)
        pixel_data[2][18] = 1; // x=18, y=2, (2, 93, 41)
        pixel_data[2][19] = 1; // x=19, y=2, (2, 93, 41)
        pixel_data[2][20] = 1; // x=20, y=2, (2, 93, 41)
        pixel_data[2][21] = 1; // x=21, y=2, (2, 93, 41)
        pixel_data[2][22] = 1; // x=22, y=2, (2, 93, 41)
        pixel_data[2][23] = 1; // x=23, y=2, (2, 93, 41)
        pixel_data[2][24] = 4; // x=24, y=2, (139, 178, 157)
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
        pixel_data[3][13] = 4; // x=13, y=3, (139, 178, 157)
        pixel_data[3][14] = 5; // x=14, y=3, (23, 112, 58)
        pixel_data[3][15] = 1; // x=15, y=3, (2, 93, 41)
        pixel_data[3][16] = 1; // x=16, y=3, (2, 93, 41)
        pixel_data[3][17] = 1; // x=17, y=3, (2, 93, 41)
        pixel_data[3][18] = 1; // x=18, y=3, (2, 93, 41)
        pixel_data[3][19] = 1; // x=19, y=3, (2, 93, 41)
        pixel_data[3][20] = 1; // x=20, y=3, (2, 93, 41)
        pixel_data[3][21] = 1; // x=21, y=3, (2, 93, 41)
        pixel_data[3][22] = 1; // x=22, y=3, (2, 93, 41)
        pixel_data[3][23] = 1; // x=23, y=3, (2, 93, 41)
        pixel_data[3][24] = 5; // x=24, y=3, (23, 112, 58)
        pixel_data[3][25] = 4; // x=25, y=3, (139, 178, 157)
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
        pixel_data[4][12] = 11; // x=12, y=4, (97, 155, 126)
        pixel_data[4][13] = 5; // x=13, y=4, (23, 112, 58)
        pixel_data[4][14] = 14; // x=14, y=4, (11, 103, 50)
        pixel_data[4][15] = 1; // x=15, y=4, (2, 93, 41)
        pixel_data[4][16] = 1; // x=16, y=4, (2, 93, 41)
        pixel_data[4][17] = 14; // x=17, y=4, (11, 103, 50)
        pixel_data[4][18] = 1; // x=18, y=4, (2, 93, 41)
        pixel_data[4][19] = 1; // x=19, y=4, (2, 93, 41)
        pixel_data[4][20] = 1; // x=20, y=4, (2, 93, 41)
        pixel_data[4][21] = 14; // x=21, y=4, (11, 103, 50)
        pixel_data[4][22] = 1; // x=22, y=4, (2, 93, 41)
        pixel_data[4][23] = 1; // x=23, y=4, (2, 93, 41)
        pixel_data[4][24] = 14; // x=24, y=4, (11, 103, 50)
        pixel_data[4][25] = 5; // x=25, y=4, (23, 112, 58)
        pixel_data[4][26] = 11; // x=26, y=4, (97, 155, 126)
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
        pixel_data[5][11] = 4; // x=11, y=5, (139, 178, 157)
        pixel_data[5][12] = 1; // x=12, y=5, (2, 93, 41)
        pixel_data[5][13] = 5; // x=13, y=5, (23, 112, 58)
        pixel_data[5][14] = 14; // x=14, y=5, (11, 103, 50)
        pixel_data[5][15] = 1; // x=15, y=5, (2, 93, 41)
        pixel_data[5][16] = 1; // x=16, y=5, (2, 93, 41)
        pixel_data[5][17] = 14; // x=17, y=5, (11, 103, 50)
        pixel_data[5][18] = 1; // x=18, y=5, (2, 93, 41)
        pixel_data[5][19] = 1; // x=19, y=5, (2, 93, 41)
        pixel_data[5][20] = 1; // x=20, y=5, (2, 93, 41)
        pixel_data[5][21] = 14; // x=21, y=5, (11, 103, 50)
        pixel_data[5][22] = 1; // x=22, y=5, (2, 93, 41)
        pixel_data[5][23] = 1; // x=23, y=5, (2, 93, 41)
        pixel_data[5][24] = 14; // x=24, y=5, (11, 103, 50)
        pixel_data[5][25] = 5; // x=25, y=5, (23, 112, 58)
        pixel_data[5][26] = 14; // x=26, y=5, (11, 103, 50)
        pixel_data[5][27] = 4; // x=27, y=5, (139, 178, 157)
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
        pixel_data[6][11] = 6; // x=11, y=6, (65, 132, 98)
        pixel_data[6][12] = 10; // x=12, y=6, (4, 107, 55)
        pixel_data[6][13] = 5; // x=13, y=6, (23, 112, 58)
        pixel_data[6][14] = 14; // x=14, y=6, (11, 103, 50)
        pixel_data[6][15] = 1; // x=15, y=6, (2, 93, 41)
        pixel_data[6][16] = 1; // x=16, y=6, (2, 93, 41)
        pixel_data[6][17] = 14; // x=17, y=6, (11, 103, 50)
        pixel_data[6][18] = 1; // x=18, y=6, (2, 93, 41)
        pixel_data[6][19] = 1; // x=19, y=6, (2, 93, 41)
        pixel_data[6][20] = 1; // x=20, y=6, (2, 93, 41)
        pixel_data[6][21] = 14; // x=21, y=6, (11, 103, 50)
        pixel_data[6][22] = 1; // x=22, y=6, (2, 93, 41)
        pixel_data[6][23] = 1; // x=23, y=6, (2, 93, 41)
        pixel_data[6][24] = 14; // x=24, y=6, (11, 103, 50)
        pixel_data[6][25] = 5; // x=25, y=6, (23, 112, 58)
        pixel_data[6][26] = 10; // x=26, y=6, (4, 107, 55)
        pixel_data[6][27] = 6; // x=27, y=6, (65, 132, 98)
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
        pixel_data[7][11] = 13; // x=11, y=7, (37, 122, 77)
        pixel_data[7][12] = 10; // x=12, y=7, (4, 107, 55)
        pixel_data[7][13] = 5; // x=13, y=7, (23, 112, 58)
        pixel_data[7][14] = 14; // x=14, y=7, (11, 103, 50)
        pixel_data[7][15] = 1; // x=15, y=7, (2, 93, 41)
        pixel_data[7][16] = 1; // x=16, y=7, (2, 93, 41)
        pixel_data[7][17] = 14; // x=17, y=7, (11, 103, 50)
        pixel_data[7][18] = 1; // x=18, y=7, (2, 93, 41)
        pixel_data[7][19] = 1; // x=19, y=7, (2, 93, 41)
        pixel_data[7][20] = 1; // x=20, y=7, (2, 93, 41)
        pixel_data[7][21] = 14; // x=21, y=7, (11, 103, 50)
        pixel_data[7][22] = 1; // x=22, y=7, (2, 93, 41)
        pixel_data[7][23] = 1; // x=23, y=7, (2, 93, 41)
        pixel_data[7][24] = 14; // x=24, y=7, (11, 103, 50)
        pixel_data[7][25] = 5; // x=25, y=7, (23, 112, 58)
        pixel_data[7][26] = 10; // x=26, y=7, (4, 107, 55)
        pixel_data[7][27] = 5; // x=27, y=7, (23, 112, 58)
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
        pixel_data[8][11] = 13; // x=11, y=8, (37, 122, 77)
        pixel_data[8][12] = 10; // x=12, y=8, (4, 107, 55)
        pixel_data[8][13] = 5; // x=13, y=8, (23, 112, 58)
        pixel_data[8][14] = 1; // x=14, y=8, (2, 93, 41)
        pixel_data[8][15] = 1; // x=15, y=8, (2, 93, 41)
        pixel_data[8][16] = 1; // x=16, y=8, (2, 93, 41)
        pixel_data[8][17] = 14; // x=17, y=8, (11, 103, 50)
        pixel_data[8][18] = 1; // x=18, y=8, (2, 93, 41)
        pixel_data[8][19] = 1; // x=19, y=8, (2, 93, 41)
        pixel_data[8][20] = 1; // x=20, y=8, (2, 93, 41)
        pixel_data[8][21] = 14; // x=21, y=8, (11, 103, 50)
        pixel_data[8][22] = 1; // x=22, y=8, (2, 93, 41)
        pixel_data[8][23] = 1; // x=23, y=8, (2, 93, 41)
        pixel_data[8][24] = 1; // x=24, y=8, (2, 93, 41)
        pixel_data[8][25] = 5; // x=25, y=8, (23, 112, 58)
        pixel_data[8][26] = 10; // x=26, y=8, (4, 107, 55)
        pixel_data[8][27] = 5; // x=27, y=8, (23, 112, 58)
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
        pixel_data[9][11] = 13; // x=11, y=9, (37, 122, 77)
        pixel_data[9][12] = 10; // x=12, y=9, (4, 107, 55)
        pixel_data[9][13] = 5; // x=13, y=9, (23, 112, 58)
        pixel_data[9][14] = 1; // x=14, y=9, (2, 93, 41)
        pixel_data[9][15] = 1; // x=15, y=9, (2, 93, 41)
        pixel_data[9][16] = 1; // x=16, y=9, (2, 93, 41)
        pixel_data[9][17] = 14; // x=17, y=9, (11, 103, 50)
        pixel_data[9][18] = 1; // x=18, y=9, (2, 93, 41)
        pixel_data[9][19] = 1; // x=19, y=9, (2, 93, 41)
        pixel_data[9][20] = 1; // x=20, y=9, (2, 93, 41)
        pixel_data[9][21] = 14; // x=21, y=9, (11, 103, 50)
        pixel_data[9][22] = 1; // x=22, y=9, (2, 93, 41)
        pixel_data[9][23] = 1; // x=23, y=9, (2, 93, 41)
        pixel_data[9][24] = 1; // x=24, y=9, (2, 93, 41)
        pixel_data[9][25] = 5; // x=25, y=9, (23, 112, 58)
        pixel_data[9][26] = 10; // x=26, y=9, (4, 107, 55)
        pixel_data[9][27] = 5; // x=27, y=9, (23, 112, 58)
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
        pixel_data[10][11] = 6; // x=11, y=10, (65, 132, 98)
        pixel_data[10][12] = 10; // x=12, y=10, (4, 107, 55)
        pixel_data[10][13] = 5; // x=13, y=10, (23, 112, 58)
        pixel_data[10][14] = 1; // x=14, y=10, (2, 93, 41)
        pixel_data[10][15] = 1; // x=15, y=10, (2, 93, 41)
        pixel_data[10][16] = 14; // x=16, y=10, (11, 103, 50)
        pixel_data[10][17] = 14; // x=17, y=10, (11, 103, 50)
        pixel_data[10][18] = 1; // x=18, y=10, (2, 93, 41)
        pixel_data[10][19] = 1; // x=19, y=10, (2, 93, 41)
        pixel_data[10][20] = 1; // x=20, y=10, (2, 93, 41)
        pixel_data[10][21] = 14; // x=21, y=10, (11, 103, 50)
        pixel_data[10][22] = 1; // x=22, y=10, (2, 93, 41)
        pixel_data[10][23] = 1; // x=23, y=10, (2, 93, 41)
        pixel_data[10][24] = 1; // x=24, y=10, (2, 93, 41)
        pixel_data[10][25] = 5; // x=25, y=10, (23, 112, 58)
        pixel_data[10][26] = 10; // x=26, y=10, (4, 107, 55)
        pixel_data[10][27] = 6; // x=27, y=10, (65, 132, 98)
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
        pixel_data[11][11] = 11; // x=11, y=11, (97, 155, 126)
        pixel_data[11][12] = 14; // x=12, y=11, (11, 103, 50)
        pixel_data[11][13] = 5; // x=13, y=11, (23, 112, 58)
        pixel_data[11][14] = 1; // x=14, y=11, (2, 93, 41)
        pixel_data[11][15] = 9; // x=15, y=11, (25, 87, 51)
        pixel_data[11][16] = 5; // x=16, y=11, (23, 112, 58)
        pixel_data[11][17] = 1; // x=17, y=11, (2, 93, 41)
        pixel_data[11][18] = 1; // x=18, y=11, (2, 93, 41)
        pixel_data[11][19] = 1; // x=19, y=11, (2, 93, 41)
        pixel_data[11][20] = 1; // x=20, y=11, (2, 93, 41)
        pixel_data[11][21] = 1; // x=21, y=11, (2, 93, 41)
        pixel_data[11][22] = 9; // x=22, y=11, (25, 87, 51)
        pixel_data[11][23] = 12; // x=23, y=11, (14, 69, 40)
        pixel_data[11][24] = 1; // x=24, y=11, (2, 93, 41)
        pixel_data[11][25] = 5; // x=25, y=11, (23, 112, 58)
        pixel_data[11][26] = 14; // x=26, y=11, (11, 103, 50)
        pixel_data[11][27] = 11; // x=27, y=11, (97, 155, 126)
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
        pixel_data[12][11] = 11; // x=11, y=12, (97, 155, 126)
        pixel_data[12][12] = 14; // x=12, y=12, (11, 103, 50)
        pixel_data[12][13] = 5; // x=13, y=12, (23, 112, 58)
        pixel_data[12][14] = 15; // x=14, y=12, (36, 65, 49)
        pixel_data[12][15] = 2; // x=15, y=12, (39, 40, 39)
        pixel_data[12][16] = 5; // x=16, y=12, (23, 112, 58)
        pixel_data[12][17] = 1; // x=17, y=12, (2, 93, 41)
        pixel_data[12][18] = 1; // x=18, y=12, (2, 93, 41)
        pixel_data[12][19] = 1; // x=19, y=12, (2, 93, 41)
        pixel_data[12][20] = 1; // x=20, y=12, (2, 93, 41)
        pixel_data[12][21] = 1; // x=21, y=12, (2, 93, 41)
        pixel_data[12][22] = 9; // x=22, y=12, (25, 87, 51)
        pixel_data[12][23] = 7; // x=23, y=12, (24, 52, 36)
        pixel_data[12][24] = 7; // x=24, y=12, (24, 52, 36)
        pixel_data[12][25] = 5; // x=25, y=12, (23, 112, 58)
        pixel_data[12][26] = 14; // x=26, y=12, (11, 103, 50)
        pixel_data[12][27] = 11; // x=27, y=12, (97, 155, 126)
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
        pixel_data[13][11] = 11; // x=11, y=13, (97, 155, 126)
        pixel_data[13][12] = 14; // x=12, y=13, (11, 103, 50)
        pixel_data[13][13] = 13; // x=13, y=13, (37, 122, 77)
        pixel_data[13][14] = 5; // x=14, y=13, (23, 112, 58)
        pixel_data[13][15] = 13; // x=15, y=13, (37, 122, 77)
        pixel_data[13][16] = 14; // x=16, y=13, (11, 103, 50)
        pixel_data[13][17] = 12; // x=17, y=13, (14, 69, 40)
        pixel_data[13][18] = 12; // x=18, y=13, (14, 69, 40)
        pixel_data[13][19] = 12; // x=19, y=13, (14, 69, 40)
        pixel_data[13][20] = 12; // x=20, y=13, (14, 69, 40)
        pixel_data[13][21] = 12; // x=21, y=13, (14, 69, 40)
        pixel_data[13][22] = 1; // x=22, y=13, (2, 93, 41)
        pixel_data[13][23] = 5; // x=23, y=13, (23, 112, 58)
        pixel_data[13][24] = 5; // x=24, y=13, (23, 112, 58)
        pixel_data[13][25] = 5; // x=25, y=13, (23, 112, 58)
        pixel_data[13][26] = 14; // x=26, y=13, (11, 103, 50)
        pixel_data[13][27] = 11; // x=27, y=13, (97, 155, 126)
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
        pixel_data[14][11] = 11; // x=11, y=14, (97, 155, 126)
        pixel_data[14][12] = 14; // x=12, y=14, (11, 103, 50)
        pixel_data[14][13] = 5; // x=13, y=14, (23, 112, 58)
        pixel_data[14][14] = 12; // x=14, y=14, (14, 69, 40)
        pixel_data[14][15] = 7; // x=15, y=14, (24, 52, 36)
        pixel_data[14][16] = 3; // x=16, y=14, (60, 62, 60)
        pixel_data[14][17] = 3; // x=17, y=14, (60, 62, 60)
        pixel_data[14][18] = 3; // x=18, y=14, (60, 62, 60)
        pixel_data[14][19] = 8; // x=19, y=14, (75, 76, 75)
        pixel_data[14][20] = 3; // x=20, y=14, (60, 62, 60)
        pixel_data[14][21] = 3; // x=21, y=14, (60, 62, 60)
        pixel_data[14][22] = 2; // x=22, y=14, (39, 40, 39)
        pixel_data[14][23] = 7; // x=23, y=14, (24, 52, 36)
        pixel_data[14][24] = 12; // x=24, y=14, (14, 69, 40)
        pixel_data[14][25] = 5; // x=25, y=14, (23, 112, 58)
        pixel_data[14][26] = 14; // x=26, y=14, (11, 103, 50)
        pixel_data[14][27] = 11; // x=27, y=14, (97, 155, 126)
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
        pixel_data[15][11] = 11; // x=11, y=15, (97, 155, 126)
        pixel_data[15][12] = 14; // x=12, y=15, (11, 103, 50)
        pixel_data[15][13] = 7; // x=13, y=15, (24, 52, 36)
        pixel_data[15][14] = 3; // x=14, y=15, (60, 62, 60)
        pixel_data[15][15] = 8; // x=15, y=15, (75, 76, 75)
        pixel_data[15][16] = 8; // x=16, y=15, (75, 76, 75)
        pixel_data[15][17] = 8; // x=17, y=15, (75, 76, 75)
        pixel_data[15][18] = 8; // x=18, y=15, (75, 76, 75)
        pixel_data[15][19] = 8; // x=19, y=15, (75, 76, 75)
        pixel_data[15][20] = 8; // x=20, y=15, (75, 76, 75)
        pixel_data[15][21] = 8; // x=21, y=15, (75, 76, 75)
        pixel_data[15][22] = 8; // x=22, y=15, (75, 76, 75)
        pixel_data[15][23] = 8; // x=23, y=15, (75, 76, 75)
        pixel_data[15][24] = 3; // x=24, y=15, (60, 62, 60)
        pixel_data[15][25] = 7; // x=25, y=15, (24, 52, 36)
        pixel_data[15][26] = 5; // x=26, y=15, (23, 112, 58)
        pixel_data[15][27] = 11; // x=27, y=15, (97, 155, 126)
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
        pixel_data[16][11] = 11; // x=11, y=16, (97, 155, 126)
        pixel_data[16][12] = 9; // x=12, y=16, (25, 87, 51)
        pixel_data[16][13] = 8; // x=13, y=16, (75, 76, 75)
        pixel_data[16][14] = 8; // x=14, y=16, (75, 76, 75)
        pixel_data[16][15] = 8; // x=15, y=16, (75, 76, 75)
        pixel_data[16][16] = 8; // x=16, y=16, (75, 76, 75)
        pixel_data[16][17] = 8; // x=17, y=16, (75, 76, 75)
        pixel_data[16][18] = 8; // x=18, y=16, (75, 76, 75)
        pixel_data[16][19] = 8; // x=19, y=16, (75, 76, 75)
        pixel_data[16][20] = 8; // x=20, y=16, (75, 76, 75)
        pixel_data[16][21] = 8; // x=21, y=16, (75, 76, 75)
        pixel_data[16][22] = 8; // x=22, y=16, (75, 76, 75)
        pixel_data[16][23] = 8; // x=23, y=16, (75, 76, 75)
        pixel_data[16][24] = 8; // x=24, y=16, (75, 76, 75)
        pixel_data[16][25] = 8; // x=25, y=16, (75, 76, 75)
        pixel_data[16][26] = 9; // x=26, y=16, (25, 87, 51)
        pixel_data[16][27] = 11; // x=27, y=16, (97, 155, 126)
        pixel_data[16][28] = 0; // x=28, y=16, transparent
        pixel_data[16][29] = 0; // x=29, y=16, transparent
        pixel_data[16][30] = 0; // x=30, y=16, transparent
        pixel_data[16][31] = 0; // x=31, y=16, transparent
        pixel_data[16][32] = 0; // x=32, y=16, transparent
        pixel_data[16][33] = 0; // x=33, y=16, transparent
        pixel_data[16][34] = 0; // x=34, y=16, transparent
        pixel_data[16][35] = 0; // x=35, y=16, transparent
        pixel_data[16][36] = 0; // x=36, y=16, transparent
        pixel_data[16][37] = 0; // x=37, y=16, transparent
        pixel_data[16][38] = 0; // x=38, y=16, transparent
        pixel_data[16][39] = 0; // x=39, y=16, transparent
        pixel_data[17][0] = 0; // x=0, y=17, transparent
        pixel_data[17][1] = 0; // x=1, y=17, transparent
        pixel_data[17][2] = 0; // x=2, y=17, transparent
        pixel_data[17][3] = 0; // x=3, y=17, transparent
        pixel_data[17][4] = 0; // x=4, y=17, transparent
        pixel_data[17][5] = 0; // x=5, y=17, transparent
        pixel_data[17][6] = 0; // x=6, y=17, transparent
        pixel_data[17][7] = 0; // x=7, y=17, transparent
        pixel_data[17][8] = 0; // x=8, y=17, transparent
        pixel_data[17][9] = 0; // x=9, y=17, transparent
        pixel_data[17][10] = 0; // x=10, y=17, transparent
        pixel_data[17][11] = 6; // x=11, y=17, (65, 132, 98)
        pixel_data[17][12] = 9; // x=12, y=17, (25, 87, 51)
        pixel_data[17][13] = 8; // x=13, y=17, (75, 76, 75)
        pixel_data[17][14] = 8; // x=14, y=17, (75, 76, 75)
        pixel_data[17][15] = 8; // x=15, y=17, (75, 76, 75)
        pixel_data[17][16] = 8; // x=16, y=17, (75, 76, 75)
        pixel_data[17][17] = 8; // x=17, y=17, (75, 76, 75)
        pixel_data[17][18] = 8; // x=18, y=17, (75, 76, 75)
        pixel_data[17][19] = 8; // x=19, y=17, (75, 76, 75)
        pixel_data[17][20] = 8; // x=20, y=17, (75, 76, 75)
        pixel_data[17][21] = 8; // x=21, y=17, (75, 76, 75)
        pixel_data[17][22] = 8; // x=22, y=17, (75, 76, 75)
        pixel_data[17][23] = 8; // x=23, y=17, (75, 76, 75)
        pixel_data[17][24] = 8; // x=24, y=17, (75, 76, 75)
        pixel_data[17][25] = 8; // x=25, y=17, (75, 76, 75)
        pixel_data[17][26] = 15; // x=26, y=17, (36, 65, 49)
        pixel_data[17][27] = 6; // x=27, y=17, (65, 132, 98)
        pixel_data[17][28] = 0; // x=28, y=17, transparent
        pixel_data[17][29] = 0; // x=29, y=17, transparent
        pixel_data[17][30] = 0; // x=30, y=17, transparent
        pixel_data[17][31] = 0; // x=31, y=17, transparent
        pixel_data[17][32] = 0; // x=32, y=17, transparent
        pixel_data[17][33] = 0; // x=33, y=17, transparent
        pixel_data[17][34] = 0; // x=34, y=17, transparent
        pixel_data[17][35] = 0; // x=35, y=17, transparent
        pixel_data[17][36] = 0; // x=36, y=17, transparent
        pixel_data[17][37] = 0; // x=37, y=17, transparent
        pixel_data[17][38] = 0; // x=38, y=17, transparent
        pixel_data[17][39] = 0; // x=39, y=17, transparent
        pixel_data[18][0] = 0; // x=0, y=18, transparent
        pixel_data[18][1] = 0; // x=1, y=18, transparent
        pixel_data[18][2] = 0; // x=2, y=18, transparent
        pixel_data[18][3] = 0; // x=3, y=18, transparent
        pixel_data[18][4] = 0; // x=4, y=18, transparent
        pixel_data[18][5] = 0; // x=5, y=18, transparent
        pixel_data[18][6] = 0; // x=6, y=18, transparent
        pixel_data[18][7] = 0; // x=7, y=18, transparent
        pixel_data[18][8] = 0; // x=8, y=18, transparent
        pixel_data[18][9] = 0; // x=9, y=18, transparent
        pixel_data[18][10] = 0; // x=10, y=18, transparent
        pixel_data[18][11] = 6; // x=11, y=18, (65, 132, 98)
        pixel_data[18][12] = 12; // x=12, y=18, (14, 69, 40)
        pixel_data[18][13] = 3; // x=13, y=18, (60, 62, 60)
        pixel_data[18][14] = 8; // x=14, y=18, (75, 76, 75)
        pixel_data[18][15] = 8; // x=15, y=18, (75, 76, 75)
        pixel_data[18][16] = 8; // x=16, y=18, (75, 76, 75)
        pixel_data[18][17] = 8; // x=17, y=18, (75, 76, 75)
        pixel_data[18][18] = 8; // x=18, y=18, (75, 76, 75)
        pixel_data[18][19] = 8; // x=19, y=18, (75, 76, 75)
        pixel_data[18][20] = 8; // x=20, y=18, (75, 76, 75)
        pixel_data[18][21] = 8; // x=21, y=18, (75, 76, 75)
        pixel_data[18][22] = 8; // x=22, y=18, (75, 76, 75)
        pixel_data[18][23] = 8; // x=23, y=18, (75, 76, 75)
        pixel_data[18][24] = 8; // x=24, y=18, (75, 76, 75)
        pixel_data[18][25] = 8; // x=25, y=18, (75, 76, 75)
        pixel_data[18][26] = 15; // x=26, y=18, (36, 65, 49)
        pixel_data[18][27] = 6; // x=27, y=18, (65, 132, 98)
        pixel_data[18][28] = 0; // x=28, y=18, transparent
        pixel_data[18][29] = 0; // x=29, y=18, transparent
        pixel_data[18][30] = 0; // x=30, y=18, transparent
        pixel_data[18][31] = 0; // x=31, y=18, transparent
        pixel_data[18][32] = 0; // x=32, y=18, transparent
        pixel_data[18][33] = 0; // x=33, y=18, transparent
        pixel_data[18][34] = 0; // x=34, y=18, transparent
        pixel_data[18][35] = 0; // x=35, y=18, transparent
        pixel_data[18][36] = 0; // x=36, y=18, transparent
        pixel_data[18][37] = 0; // x=37, y=18, transparent
        pixel_data[18][38] = 0; // x=38, y=18, transparent
        pixel_data[18][39] = 0; // x=39, y=18, transparent
        pixel_data[19][0] = 0; // x=0, y=19, transparent
        pixel_data[19][1] = 0; // x=1, y=19, transparent
        pixel_data[19][2] = 0; // x=2, y=19, transparent
        pixel_data[19][3] = 0; // x=3, y=19, transparent
        pixel_data[19][4] = 0; // x=4, y=19, transparent
        pixel_data[19][5] = 0; // x=5, y=19, transparent
        pixel_data[19][6] = 0; // x=6, y=19, transparent
        pixel_data[19][7] = 0; // x=7, y=19, transparent
        pixel_data[19][8] = 0; // x=8, y=19, transparent
        pixel_data[19][9] = 0; // x=9, y=19, transparent
        pixel_data[19][10] = 0; // x=10, y=19, transparent
        pixel_data[19][11] = 15; // x=11, y=19, (36, 65, 49)
        pixel_data[19][12] = 15; // x=12, y=19, (36, 65, 49)
        pixel_data[19][13] = 15; // x=13, y=19, (36, 65, 49)
        pixel_data[19][14] = 8; // x=14, y=19, (75, 76, 75)
        pixel_data[19][15] = 3; // x=15, y=19, (60, 62, 60)
        pixel_data[19][16] = 3; // x=16, y=19, (60, 62, 60)
        pixel_data[19][17] = 3; // x=17, y=19, (60, 62, 60)
        pixel_data[19][18] = 2; // x=18, y=19, (39, 40, 39)
        pixel_data[19][19] = 2; // x=19, y=19, (39, 40, 39)
        pixel_data[19][20] = 2; // x=20, y=19, (39, 40, 39)
        pixel_data[19][21] = 2; // x=21, y=19, (39, 40, 39)
        pixel_data[19][22] = 3; // x=22, y=19, (60, 62, 60)
        pixel_data[19][23] = 3; // x=23, y=19, (60, 62, 60)
        pixel_data[19][24] = 3; // x=24, y=19, (60, 62, 60)
        pixel_data[19][25] = 3; // x=25, y=19, (60, 62, 60)
        pixel_data[19][26] = 15; // x=26, y=19, (36, 65, 49)
        pixel_data[19][27] = 15; // x=27, y=19, (36, 65, 49)
        pixel_data[19][28] = 0; // x=28, y=19, transparent
        pixel_data[19][29] = 0; // x=29, y=19, transparent
        pixel_data[19][30] = 0; // x=30, y=19, transparent
        pixel_data[19][31] = 0; // x=31, y=19, transparent
        pixel_data[19][32] = 0; // x=32, y=19, transparent
        pixel_data[19][33] = 0; // x=33, y=19, transparent
        pixel_data[19][34] = 0; // x=34, y=19, transparent
        pixel_data[19][35] = 0; // x=35, y=19, transparent
        pixel_data[19][36] = 0; // x=36, y=19, transparent
        pixel_data[19][37] = 0; // x=37, y=19, transparent
        pixel_data[19][38] = 0; // x=38, y=19, transparent
        pixel_data[19][39] = 0; // x=39, y=19, transparent
        pixel_data[20][0] = 0; // x=0, y=20, transparent
        pixel_data[20][1] = 0; // x=1, y=20, transparent
        pixel_data[20][2] = 0; // x=2, y=20, transparent
        pixel_data[20][3] = 0; // x=3, y=20, transparent
        pixel_data[20][4] = 0; // x=4, y=20, transparent
        pixel_data[20][5] = 0; // x=5, y=20, transparent
        pixel_data[20][6] = 0; // x=6, y=20, transparent
        pixel_data[20][7] = 0; // x=7, y=20, transparent
        pixel_data[20][8] = 0; // x=8, y=20, transparent
        pixel_data[20][9] = 0; // x=9, y=20, transparent
        pixel_data[20][10] = 0; // x=10, y=20, transparent
        pixel_data[20][11] = 13; // x=11, y=20, (37, 122, 77)
        pixel_data[20][12] = 15; // x=12, y=20, (36, 65, 49)
        pixel_data[20][13] = 12; // x=13, y=20, (14, 69, 40)
        pixel_data[20][14] = 15; // x=14, y=20, (36, 65, 49)
        pixel_data[20][15] = 2; // x=15, y=20, (39, 40, 39)
        pixel_data[20][16] = 2; // x=16, y=20, (39, 40, 39)
        pixel_data[20][17] = 2; // x=17, y=20, (39, 40, 39)
        pixel_data[20][18] = 2; // x=18, y=20, (39, 40, 39)
        pixel_data[20][19] = 2; // x=19, y=20, (39, 40, 39)
        pixel_data[20][20] = 2; // x=20, y=20, (39, 40, 39)
        pixel_data[20][21] = 2; // x=21, y=20, (39, 40, 39)
        pixel_data[20][22] = 2; // x=22, y=20, (39, 40, 39)
        pixel_data[20][23] = 2; // x=23, y=20, (39, 40, 39)
        pixel_data[20][24] = 7; // x=24, y=20, (24, 52, 36)
        pixel_data[20][25] = 12; // x=25, y=20, (14, 69, 40)
        pixel_data[20][26] = 15; // x=26, y=20, (36, 65, 49)
        pixel_data[20][27] = 5; // x=27, y=20, (23, 112, 58)
        pixel_data[20][28] = 0; // x=28, y=20, transparent
        pixel_data[20][29] = 0; // x=29, y=20, transparent
        pixel_data[20][30] = 0; // x=30, y=20, transparent
        pixel_data[20][31] = 0; // x=31, y=20, transparent
        pixel_data[20][32] = 0; // x=32, y=20, transparent
        pixel_data[20][33] = 0; // x=33, y=20, transparent
        pixel_data[20][34] = 0; // x=34, y=20, transparent
        pixel_data[20][35] = 0; // x=35, y=20, transparent
        pixel_data[20][36] = 0; // x=36, y=20, transparent
        pixel_data[20][37] = 0; // x=37, y=20, transparent
        pixel_data[20][38] = 0; // x=38, y=20, transparent
        pixel_data[20][39] = 0; // x=39, y=20, transparent
        pixel_data[21][0] = 0; // x=0, y=21, transparent
        pixel_data[21][1] = 0; // x=1, y=21, transparent
        pixel_data[21][2] = 0; // x=2, y=21, transparent
        pixel_data[21][3] = 0; // x=3, y=21, transparent
        pixel_data[21][4] = 0; // x=4, y=21, transparent
        pixel_data[21][5] = 0; // x=5, y=21, transparent
        pixel_data[21][6] = 0; // x=6, y=21, transparent
        pixel_data[21][7] = 0; // x=7, y=21, transparent
        pixel_data[21][8] = 0; // x=8, y=21, transparent
        pixel_data[21][9] = 0; // x=9, y=21, transparent
        pixel_data[21][10] = 0; // x=10, y=21, transparent
        pixel_data[21][11] = 13; // x=11, y=21, (37, 122, 77)
        pixel_data[21][12] = 15; // x=12, y=21, (36, 65, 49)
        pixel_data[21][13] = 15; // x=13, y=21, (36, 65, 49)
        pixel_data[21][14] = 12; // x=14, y=21, (14, 69, 40)
        pixel_data[21][15] = 2; // x=15, y=21, (39, 40, 39)
        pixel_data[21][16] = 2; // x=16, y=21, (39, 40, 39)
        pixel_data[21][17] = 2; // x=17, y=21, (39, 40, 39)
        pixel_data[21][18] = 2; // x=18, y=21, (39, 40, 39)
        pixel_data[21][19] = 2; // x=19, y=21, (39, 40, 39)
        pixel_data[21][20] = 2; // x=20, y=21, (39, 40, 39)
        pixel_data[21][21] = 2; // x=21, y=21, (39, 40, 39)
        pixel_data[21][22] = 2; // x=22, y=21, (39, 40, 39)
        pixel_data[21][23] = 2; // x=23, y=21, (39, 40, 39)
        pixel_data[21][24] = 12; // x=24, y=21, (14, 69, 40)
        pixel_data[21][25] = 15; // x=25, y=21, (36, 65, 49)
        pixel_data[21][26] = 15; // x=26, y=21, (36, 65, 49)
        pixel_data[21][27] = 5; // x=27, y=21, (23, 112, 58)
        pixel_data[21][28] = 0; // x=28, y=21, transparent
        pixel_data[21][29] = 0; // x=29, y=21, transparent
        pixel_data[21][30] = 0; // x=30, y=21, transparent
        pixel_data[21][31] = 0; // x=31, y=21, transparent
        pixel_data[21][32] = 0; // x=32, y=21, transparent
        pixel_data[21][33] = 0; // x=33, y=21, transparent
        pixel_data[21][34] = 0; // x=34, y=21, transparent
        pixel_data[21][35] = 0; // x=35, y=21, transparent
        pixel_data[21][36] = 0; // x=36, y=21, transparent
        pixel_data[21][37] = 0; // x=37, y=21, transparent
        pixel_data[21][38] = 0; // x=38, y=21, transparent
        pixel_data[21][39] = 0; // x=39, y=21, transparent
        pixel_data[22][0] = 0; // x=0, y=22, transparent
        pixel_data[22][1] = 0; // x=1, y=22, transparent
        pixel_data[22][2] = 0; // x=2, y=22, transparent
        pixel_data[22][3] = 0; // x=3, y=22, transparent
        pixel_data[22][4] = 0; // x=4, y=22, transparent
        pixel_data[22][5] = 0; // x=5, y=22, transparent
        pixel_data[22][6] = 0; // x=6, y=22, transparent
        pixel_data[22][7] = 0; // x=7, y=22, transparent
        pixel_data[22][8] = 0; // x=8, y=22, transparent
        pixel_data[22][9] = 0; // x=9, y=22, transparent
        pixel_data[22][10] = 0; // x=10, y=22, transparent
        pixel_data[22][11] = 13; // x=11, y=22, (37, 122, 77)
        pixel_data[22][12] = 15; // x=12, y=22, (36, 65, 49)
        pixel_data[22][13] = 15; // x=13, y=22, (36, 65, 49)
        pixel_data[22][14] = 1; // x=14, y=22, (2, 93, 41)
        pixel_data[22][15] = 2; // x=15, y=22, (39, 40, 39)
        pixel_data[22][16] = 2; // x=16, y=22, (39, 40, 39)
        pixel_data[22][17] = 2; // x=17, y=22, (39, 40, 39)
        pixel_data[22][18] = 2; // x=18, y=22, (39, 40, 39)
        pixel_data[22][19] = 2; // x=19, y=22, (39, 40, 39)
        pixel_data[22][20] = 2; // x=20, y=22, (39, 40, 39)
        pixel_data[22][21] = 2; // x=21, y=22, (39, 40, 39)
        pixel_data[22][22] = 2; // x=22, y=22, (39, 40, 39)
        pixel_data[22][23] = 2; // x=23, y=22, (39, 40, 39)
        pixel_data[22][24] = 12; // x=24, y=22, (14, 69, 40)
        pixel_data[22][25] = 15; // x=25, y=22, (36, 65, 49)
        pixel_data[22][26] = 15; // x=26, y=22, (36, 65, 49)
        pixel_data[22][27] = 5; // x=27, y=22, (23, 112, 58)
        pixel_data[22][28] = 0; // x=28, y=22, transparent
        pixel_data[22][29] = 0; // x=29, y=22, transparent
        pixel_data[22][30] = 0; // x=30, y=22, transparent
        pixel_data[22][31] = 0; // x=31, y=22, transparent
        pixel_data[22][32] = 0; // x=32, y=22, transparent
        pixel_data[22][33] = 0; // x=33, y=22, transparent
        pixel_data[22][34] = 0; // x=34, y=22, transparent
        pixel_data[22][35] = 0; // x=35, y=22, transparent
        pixel_data[22][36] = 0; // x=36, y=22, transparent
        pixel_data[22][37] = 0; // x=37, y=22, transparent
        pixel_data[22][38] = 0; // x=38, y=22, transparent
        pixel_data[22][39] = 0; // x=39, y=22, transparent
        pixel_data[23][0] = 0; // x=0, y=23, transparent
        pixel_data[23][1] = 0; // x=1, y=23, transparent
        pixel_data[23][2] = 0; // x=2, y=23, transparent
        pixel_data[23][3] = 0; // x=3, y=23, transparent
        pixel_data[23][4] = 0; // x=4, y=23, transparent
        pixel_data[23][5] = 0; // x=5, y=23, transparent
        pixel_data[23][6] = 0; // x=6, y=23, transparent
        pixel_data[23][7] = 0; // x=7, y=23, transparent
        pixel_data[23][8] = 0; // x=8, y=23, transparent
        pixel_data[23][9] = 0; // x=9, y=23, transparent
        pixel_data[23][10] = 0; // x=10, y=23, transparent
        pixel_data[23][11] = 13; // x=11, y=23, (37, 122, 77)
        pixel_data[23][12] = 15; // x=12, y=23, (36, 65, 49)
        pixel_data[23][13] = 15; // x=13, y=23, (36, 65, 49)
        pixel_data[23][14] = 1; // x=14, y=23, (2, 93, 41)
        pixel_data[23][15] = 2; // x=15, y=23, (39, 40, 39)
        pixel_data[23][16] = 2; // x=16, y=23, (39, 40, 39)
        pixel_data[23][17] = 2; // x=17, y=23, (39, 40, 39)
        pixel_data[23][18] = 2; // x=18, y=23, (39, 40, 39)
        pixel_data[23][19] = 2; // x=19, y=23, (39, 40, 39)
        pixel_data[23][20] = 2; // x=20, y=23, (39, 40, 39)
        pixel_data[23][21] = 2; // x=21, y=23, (39, 40, 39)
        pixel_data[23][22] = 2; // x=22, y=23, (39, 40, 39)
        pixel_data[23][23] = 2; // x=23, y=23, (39, 40, 39)
        pixel_data[23][24] = 12; // x=24, y=23, (14, 69, 40)
        pixel_data[23][25] = 15; // x=25, y=23, (36, 65, 49)
        pixel_data[23][26] = 15; // x=26, y=23, (36, 65, 49)
        pixel_data[23][27] = 14; // x=27, y=23, (11, 103, 50)
        pixel_data[23][28] = 0; // x=28, y=23, transparent
        pixel_data[23][29] = 0; // x=29, y=23, transparent
        pixel_data[23][30] = 0; // x=30, y=23, transparent
        pixel_data[23][31] = 0; // x=31, y=23, transparent
        pixel_data[23][32] = 0; // x=32, y=23, transparent
        pixel_data[23][33] = 0; // x=33, y=23, transparent
        pixel_data[23][34] = 0; // x=34, y=23, transparent
        pixel_data[23][35] = 0; // x=35, y=23, transparent
        pixel_data[23][36] = 0; // x=36, y=23, transparent
        pixel_data[23][37] = 0; // x=37, y=23, transparent
        pixel_data[23][38] = 0; // x=38, y=23, transparent
        pixel_data[23][39] = 0; // x=39, y=23, transparent
        pixel_data[24][0] = 0; // x=0, y=24, transparent
        pixel_data[24][1] = 0; // x=1, y=24, transparent
        pixel_data[24][2] = 0; // x=2, y=24, transparent
        pixel_data[24][3] = 0; // x=3, y=24, transparent
        pixel_data[24][4] = 0; // x=4, y=24, transparent
        pixel_data[24][5] = 0; // x=5, y=24, transparent
        pixel_data[24][6] = 0; // x=6, y=24, transparent
        pixel_data[24][7] = 0; // x=7, y=24, transparent
        pixel_data[24][8] = 0; // x=8, y=24, transparent
        pixel_data[24][9] = 0; // x=9, y=24, transparent
        pixel_data[24][10] = 0; // x=10, y=24, transparent
        pixel_data[24][11] = 13; // x=11, y=24, (37, 122, 77)
        pixel_data[24][12] = 15; // x=12, y=24, (36, 65, 49)
        pixel_data[24][13] = 15; // x=13, y=24, (36, 65, 49)
        pixel_data[24][14] = 1; // x=14, y=24, (2, 93, 41)
        pixel_data[24][15] = 2; // x=15, y=24, (39, 40, 39)
        pixel_data[24][16] = 2; // x=16, y=24, (39, 40, 39)
        pixel_data[24][17] = 2; // x=17, y=24, (39, 40, 39)
        pixel_data[24][18] = 2; // x=18, y=24, (39, 40, 39)
        pixel_data[24][19] = 2; // x=19, y=24, (39, 40, 39)
        pixel_data[24][20] = 2; // x=20, y=24, (39, 40, 39)
        pixel_data[24][21] = 2; // x=21, y=24, (39, 40, 39)
        pixel_data[24][22] = 2; // x=22, y=24, (39, 40, 39)
        pixel_data[24][23] = 2; // x=23, y=24, (39, 40, 39)
        pixel_data[24][24] = 12; // x=24, y=24, (14, 69, 40)
        pixel_data[24][25] = 15; // x=25, y=24, (36, 65, 49)
        pixel_data[24][26] = 15; // x=26, y=24, (36, 65, 49)
        pixel_data[24][27] = 14; // x=27, y=24, (11, 103, 50)
        pixel_data[24][28] = 0; // x=28, y=24, transparent
        pixel_data[24][29] = 0; // x=29, y=24, transparent
        pixel_data[24][30] = 0; // x=30, y=24, transparent
        pixel_data[24][31] = 0; // x=31, y=24, transparent
        pixel_data[24][32] = 0; // x=32, y=24, transparent
        pixel_data[24][33] = 0; // x=33, y=24, transparent
        pixel_data[24][34] = 0; // x=34, y=24, transparent
        pixel_data[24][35] = 0; // x=35, y=24, transparent
        pixel_data[24][36] = 0; // x=36, y=24, transparent
        pixel_data[24][37] = 0; // x=37, y=24, transparent
        pixel_data[24][38] = 0; // x=38, y=24, transparent
        pixel_data[24][39] = 0; // x=39, y=24, transparent
        pixel_data[25][0] = 0; // x=0, y=25, transparent
        pixel_data[25][1] = 0; // x=1, y=25, transparent
        pixel_data[25][2] = 0; // x=2, y=25, transparent
        pixel_data[25][3] = 0; // x=3, y=25, transparent
        pixel_data[25][4] = 0; // x=4, y=25, transparent
        pixel_data[25][5] = 0; // x=5, y=25, transparent
        pixel_data[25][6] = 0; // x=6, y=25, transparent
        pixel_data[25][7] = 0; // x=7, y=25, transparent
        pixel_data[25][8] = 0; // x=8, y=25, transparent
        pixel_data[25][9] = 0; // x=9, y=25, transparent
        pixel_data[25][10] = 0; // x=10, y=25, transparent
        pixel_data[25][11] = 13; // x=11, y=25, (37, 122, 77)
        pixel_data[25][12] = 15; // x=12, y=25, (36, 65, 49)
        pixel_data[25][13] = 15; // x=13, y=25, (36, 65, 49)
        pixel_data[25][14] = 1; // x=14, y=25, (2, 93, 41)
        pixel_data[25][15] = 2; // x=15, y=25, (39, 40, 39)
        pixel_data[25][16] = 2; // x=16, y=25, (39, 40, 39)
        pixel_data[25][17] = 2; // x=17, y=25, (39, 40, 39)
        pixel_data[25][18] = 2; // x=18, y=25, (39, 40, 39)
        pixel_data[25][19] = 2; // x=19, y=25, (39, 40, 39)
        pixel_data[25][20] = 2; // x=20, y=25, (39, 40, 39)
        pixel_data[25][21] = 2; // x=21, y=25, (39, 40, 39)
        pixel_data[25][22] = 2; // x=22, y=25, (39, 40, 39)
        pixel_data[25][23] = 2; // x=23, y=25, (39, 40, 39)
        pixel_data[25][24] = 12; // x=24, y=25, (14, 69, 40)
        pixel_data[25][25] = 15; // x=25, y=25, (36, 65, 49)
        pixel_data[25][26] = 15; // x=26, y=25, (36, 65, 49)
        pixel_data[25][27] = 14; // x=27, y=25, (11, 103, 50)
        pixel_data[25][28] = 0; // x=28, y=25, transparent
        pixel_data[25][29] = 0; // x=29, y=25, transparent
        pixel_data[25][30] = 0; // x=30, y=25, transparent
        pixel_data[25][31] = 0; // x=31, y=25, transparent
        pixel_data[25][32] = 0; // x=32, y=25, transparent
        pixel_data[25][33] = 0; // x=33, y=25, transparent
        pixel_data[25][34] = 0; // x=34, y=25, transparent
        pixel_data[25][35] = 0; // x=35, y=25, transparent
        pixel_data[25][36] = 0; // x=36, y=25, transparent
        pixel_data[25][37] = 0; // x=37, y=25, transparent
        pixel_data[25][38] = 0; // x=38, y=25, transparent
        pixel_data[25][39] = 0; // x=39, y=25, transparent
        pixel_data[26][0] = 0; // x=0, y=26, transparent
        pixel_data[26][1] = 0; // x=1, y=26, transparent
        pixel_data[26][2] = 0; // x=2, y=26, transparent
        pixel_data[26][3] = 0; // x=3, y=26, transparent
        pixel_data[26][4] = 0; // x=4, y=26, transparent
        pixel_data[26][5] = 0; // x=5, y=26, transparent
        pixel_data[26][6] = 0; // x=6, y=26, transparent
        pixel_data[26][7] = 0; // x=7, y=26, transparent
        pixel_data[26][8] = 0; // x=8, y=26, transparent
        pixel_data[26][9] = 0; // x=9, y=26, transparent
        pixel_data[26][10] = 0; // x=10, y=26, transparent
        pixel_data[26][11] = 5; // x=11, y=26, (23, 112, 58)
        pixel_data[26][12] = 7; // x=12, y=26, (24, 52, 36)
        pixel_data[26][13] = 7; // x=13, y=26, (24, 52, 36)
        pixel_data[26][14] = 1; // x=14, y=26, (2, 93, 41)
        pixel_data[26][15] = 2; // x=15, y=26, (39, 40, 39)
        pixel_data[26][16] = 2; // x=16, y=26, (39, 40, 39)
        pixel_data[26][17] = 2; // x=17, y=26, (39, 40, 39)
        pixel_data[26][18] = 2; // x=18, y=26, (39, 40, 39)
        pixel_data[26][19] = 2; // x=19, y=26, (39, 40, 39)
        pixel_data[26][20] = 2; // x=20, y=26, (39, 40, 39)
        pixel_data[26][21] = 2; // x=21, y=26, (39, 40, 39)
        pixel_data[26][22] = 2; // x=22, y=26, (39, 40, 39)
        pixel_data[26][23] = 2; // x=23, y=26, (39, 40, 39)
        pixel_data[26][24] = 12; // x=24, y=26, (14, 69, 40)
        pixel_data[26][25] = 15; // x=25, y=26, (36, 65, 49)
        pixel_data[26][26] = 7; // x=26, y=26, (24, 52, 36)
        pixel_data[26][27] = 5; // x=27, y=26, (23, 112, 58)
        pixel_data[26][28] = 0; // x=28, y=26, transparent
        pixel_data[26][29] = 0; // x=29, y=26, transparent
        pixel_data[26][30] = 0; // x=30, y=26, transparent
        pixel_data[26][31] = 0; // x=31, y=26, transparent
        pixel_data[26][32] = 0; // x=32, y=26, transparent
        pixel_data[26][33] = 0; // x=33, y=26, transparent
        pixel_data[26][34] = 0; // x=34, y=26, transparent
        pixel_data[26][35] = 0; // x=35, y=26, transparent
        pixel_data[26][36] = 0; // x=36, y=26, transparent
        pixel_data[26][37] = 0; // x=37, y=26, transparent
        pixel_data[26][38] = 0; // x=38, y=26, transparent
        pixel_data[26][39] = 0; // x=39, y=26, transparent
        pixel_data[27][0] = 0; // x=0, y=27, transparent
        pixel_data[27][1] = 0; // x=1, y=27, transparent
        pixel_data[27][2] = 0; // x=2, y=27, transparent
        pixel_data[27][3] = 0; // x=3, y=27, transparent
        pixel_data[27][4] = 0; // x=4, y=27, transparent
        pixel_data[27][5] = 0; // x=5, y=27, transparent
        pixel_data[27][6] = 0; // x=6, y=27, transparent
        pixel_data[27][7] = 0; // x=7, y=27, transparent
        pixel_data[27][8] = 0; // x=8, y=27, transparent
        pixel_data[27][9] = 0; // x=9, y=27, transparent
        pixel_data[27][10] = 0; // x=10, y=27, transparent
        pixel_data[27][11] = 10; // x=11, y=27, (4, 107, 55)
        pixel_data[27][12] = 12; // x=12, y=27, (14, 69, 40)
        pixel_data[27][13] = 7; // x=13, y=27, (24, 52, 36)
        pixel_data[27][14] = 1; // x=14, y=27, (2, 93, 41)
        pixel_data[27][15] = 2; // x=15, y=27, (39, 40, 39)
        pixel_data[27][16] = 2; // x=16, y=27, (39, 40, 39)
        pixel_data[27][17] = 2; // x=17, y=27, (39, 40, 39)
        pixel_data[27][18] = 2; // x=18, y=27, (39, 40, 39)
        pixel_data[27][19] = 2; // x=19, y=27, (39, 40, 39)
        pixel_data[27][20] = 2; // x=20, y=27, (39, 40, 39)
        pixel_data[27][21] = 2; // x=21, y=27, (39, 40, 39)
        pixel_data[27][22] = 2; // x=22, y=27, (39, 40, 39)
        pixel_data[27][23] = 2; // x=23, y=27, (39, 40, 39)
        pixel_data[27][24] = 12; // x=24, y=27, (14, 69, 40)
        pixel_data[27][25] = 12; // x=25, y=27, (14, 69, 40)
        pixel_data[27][26] = 7; // x=26, y=27, (24, 52, 36)
        pixel_data[27][27] = 14; // x=27, y=27, (11, 103, 50)
        pixel_data[27][28] = 0; // x=28, y=27, transparent
        pixel_data[27][29] = 0; // x=29, y=27, transparent
        pixel_data[27][30] = 0; // x=30, y=27, transparent
        pixel_data[27][31] = 0; // x=31, y=27, transparent
        pixel_data[27][32] = 0; // x=32, y=27, transparent
        pixel_data[27][33] = 0; // x=33, y=27, transparent
        pixel_data[27][34] = 0; // x=34, y=27, transparent
        pixel_data[27][35] = 0; // x=35, y=27, transparent
        pixel_data[27][36] = 0; // x=36, y=27, transparent
        pixel_data[27][37] = 0; // x=37, y=27, transparent
        pixel_data[27][38] = 0; // x=38, y=27, transparent
        pixel_data[27][39] = 0; // x=39, y=27, transparent
        pixel_data[28][0] = 0; // x=0, y=28, transparent
        pixel_data[28][1] = 0; // x=1, y=28, transparent
        pixel_data[28][2] = 0; // x=2, y=28, transparent
        pixel_data[28][3] = 0; // x=3, y=28, transparent
        pixel_data[28][4] = 0; // x=4, y=28, transparent
        pixel_data[28][5] = 0; // x=5, y=28, transparent
        pixel_data[28][6] = 0; // x=6, y=28, transparent
        pixel_data[28][7] = 0; // x=7, y=28, transparent
        pixel_data[28][8] = 0; // x=8, y=28, transparent
        pixel_data[28][9] = 0; // x=9, y=28, transparent
        pixel_data[28][10] = 0; // x=10, y=28, transparent
        pixel_data[28][11] = 10; // x=11, y=28, (4, 107, 55)
        pixel_data[28][12] = 12; // x=12, y=28, (14, 69, 40)
        pixel_data[28][13] = 12; // x=13, y=28, (14, 69, 40)
        pixel_data[28][14] = 1; // x=14, y=28, (2, 93, 41)
        pixel_data[28][15] = 3; // x=15, y=28, (60, 62, 60)
        pixel_data[28][16] = 3; // x=16, y=28, (60, 62, 60)
        pixel_data[28][17] = 3; // x=17, y=28, (60, 62, 60)
        pixel_data[28][18] = 3; // x=18, y=28, (60, 62, 60)
        pixel_data[28][19] = 3; // x=19, y=28, (60, 62, 60)
        pixel_data[28][20] = 3; // x=20, y=28, (60, 62, 60)
        pixel_data[28][21] = 3; // x=21, y=28, (60, 62, 60)
        pixel_data[28][22] = 3; // x=22, y=28, (60, 62, 60)
        pixel_data[28][23] = 8; // x=23, y=28, (75, 76, 75)
        pixel_data[28][24] = 9; // x=24, y=28, (25, 87, 51)
        pixel_data[28][25] = 12; // x=25, y=28, (14, 69, 40)
        pixel_data[28][26] = 12; // x=26, y=28, (14, 69, 40)
        pixel_data[28][27] = 10; // x=27, y=28, (4, 107, 55)
        pixel_data[28][28] = 0; // x=28, y=28, transparent
        pixel_data[28][29] = 0; // x=29, y=28, transparent
        pixel_data[28][30] = 0; // x=30, y=28, transparent
        pixel_data[28][31] = 0; // x=31, y=28, transparent
        pixel_data[28][32] = 0; // x=32, y=28, transparent
        pixel_data[28][33] = 0; // x=33, y=28, transparent
        pixel_data[28][34] = 0; // x=34, y=28, transparent
        pixel_data[28][35] = 0; // x=35, y=28, transparent
        pixel_data[28][36] = 0; // x=36, y=28, transparent
        pixel_data[28][37] = 0; // x=37, y=28, transparent
        pixel_data[28][38] = 0; // x=38, y=28, transparent
        pixel_data[28][39] = 0; // x=39, y=28, transparent
        pixel_data[29][0] = 0; // x=0, y=29, transparent
        pixel_data[29][1] = 0; // x=1, y=29, transparent
        pixel_data[29][2] = 0; // x=2, y=29, transparent
        pixel_data[29][3] = 0; // x=3, y=29, transparent
        pixel_data[29][4] = 0; // x=4, y=29, transparent
        pixel_data[29][5] = 0; // x=5, y=29, transparent
        pixel_data[29][6] = 0; // x=6, y=29, transparent
        pixel_data[29][7] = 0; // x=7, y=29, transparent
        pixel_data[29][8] = 0; // x=8, y=29, transparent
        pixel_data[29][9] = 0; // x=9, y=29, transparent
        pixel_data[29][10] = 0; // x=10, y=29, transparent
        pixel_data[29][11] = 10; // x=11, y=29, (4, 107, 55)
        pixel_data[29][12] = 1; // x=12, y=29, (2, 93, 41)
        pixel_data[29][13] = 12; // x=13, y=29, (14, 69, 40)
        pixel_data[29][14] = 1; // x=14, y=29, (2, 93, 41)
        pixel_data[29][15] = 3; // x=15, y=29, (60, 62, 60)
        pixel_data[29][16] = 3; // x=16, y=29, (60, 62, 60)
        pixel_data[29][17] = 3; // x=17, y=29, (60, 62, 60)
        pixel_data[29][18] = 3; // x=18, y=29, (60, 62, 60)
        pixel_data[29][19] = 3; // x=19, y=29, (60, 62, 60)
        pixel_data[29][20] = 3; // x=20, y=29, (60, 62, 60)
        pixel_data[29][21] = 8; // x=21, y=29, (75, 76, 75)
        pixel_data[29][22] = 8; // x=22, y=29, (75, 76, 75)
        pixel_data[29][23] = 8; // x=23, y=29, (75, 76, 75)
        pixel_data[29][24] = 9; // x=24, y=29, (25, 87, 51)
        pixel_data[29][25] = 12; // x=25, y=29, (14, 69, 40)
        pixel_data[29][26] = 9; // x=26, y=29, (25, 87, 51)
        pixel_data[29][27] = 10; // x=27, y=29, (4, 107, 55)
        pixel_data[29][28] = 0; // x=28, y=29, transparent
        pixel_data[29][29] = 0; // x=29, y=29, transparent
        pixel_data[29][30] = 0; // x=30, y=29, transparent
        pixel_data[29][31] = 0; // x=31, y=29, transparent
        pixel_data[29][32] = 0; // x=32, y=29, transparent
        pixel_data[29][33] = 0; // x=33, y=29, transparent
        pixel_data[29][34] = 0; // x=34, y=29, transparent
        pixel_data[29][35] = 0; // x=35, y=29, transparent
        pixel_data[29][36] = 0; // x=36, y=29, transparent
        pixel_data[29][37] = 0; // x=37, y=29, transparent
        pixel_data[29][38] = 0; // x=38, y=29, transparent
        pixel_data[29][39] = 0; // x=39, y=29, transparent
        pixel_data[30][0] = 0; // x=0, y=30, transparent
        pixel_data[30][1] = 0; // x=1, y=30, transparent
        pixel_data[30][2] = 0; // x=2, y=30, transparent
        pixel_data[30][3] = 0; // x=3, y=30, transparent
        pixel_data[30][4] = 0; // x=4, y=30, transparent
        pixel_data[30][5] = 0; // x=5, y=30, transparent
        pixel_data[30][6] = 0; // x=6, y=30, transparent
        pixel_data[30][7] = 0; // x=7, y=30, transparent
        pixel_data[30][8] = 0; // x=8, y=30, transparent
        pixel_data[30][9] = 0; // x=9, y=30, transparent
        pixel_data[30][10] = 0; // x=10, y=30, transparent
        pixel_data[30][11] = 10; // x=11, y=30, (4, 107, 55)
        pixel_data[30][12] = 10; // x=12, y=30, (4, 107, 55)
        pixel_data[30][13] = 12; // x=13, y=30, (14, 69, 40)
        pixel_data[30][14] = 1; // x=14, y=30, (2, 93, 41)
        pixel_data[30][15] = 3; // x=15, y=30, (60, 62, 60)
        pixel_data[30][16] = 3; // x=16, y=30, (60, 62, 60)
        pixel_data[30][17] = 3; // x=17, y=30, (60, 62, 60)
        pixel_data[30][18] = 3; // x=18, y=30, (60, 62, 60)
        pixel_data[30][19] = 3; // x=19, y=30, (60, 62, 60)
        pixel_data[30][20] = 3; // x=20, y=30, (60, 62, 60)
        pixel_data[30][21] = 8; // x=21, y=30, (75, 76, 75)
        pixel_data[30][22] = 8; // x=22, y=30, (75, 76, 75)
        pixel_data[30][23] = 8; // x=23, y=30, (75, 76, 75)
        pixel_data[30][24] = 9; // x=24, y=30, (25, 87, 51)
        pixel_data[30][25] = 12; // x=25, y=30, (14, 69, 40)
        pixel_data[30][26] = 5; // x=26, y=30, (23, 112, 58)
        pixel_data[30][27] = 10; // x=27, y=30, (4, 107, 55)
        pixel_data[30][28] = 0; // x=28, y=30, transparent
        pixel_data[30][29] = 0; // x=29, y=30, transparent
        pixel_data[30][30] = 0; // x=30, y=30, transparent
        pixel_data[30][31] = 0; // x=31, y=30, transparent
        pixel_data[30][32] = 0; // x=32, y=30, transparent
        pixel_data[30][33] = 0; // x=33, y=30, transparent
        pixel_data[30][34] = 0; // x=34, y=30, transparent
        pixel_data[30][35] = 0; // x=35, y=30, transparent
        pixel_data[30][36] = 0; // x=36, y=30, transparent
        pixel_data[30][37] = 0; // x=37, y=30, transparent
        pixel_data[30][38] = 0; // x=38, y=30, transparent
        pixel_data[30][39] = 0; // x=39, y=30, transparent
        pixel_data[31][0] = 0; // x=0, y=31, transparent
        pixel_data[31][1] = 0; // x=1, y=31, transparent
        pixel_data[31][2] = 0; // x=2, y=31, transparent
        pixel_data[31][3] = 0; // x=3, y=31, transparent
        pixel_data[31][4] = 0; // x=4, y=31, transparent
        pixel_data[31][5] = 0; // x=5, y=31, transparent
        pixel_data[31][6] = 0; // x=6, y=31, transparent
        pixel_data[31][7] = 0; // x=7, y=31, transparent
        pixel_data[31][8] = 0; // x=8, y=31, transparent
        pixel_data[31][9] = 0; // x=9, y=31, transparent
        pixel_data[31][10] = 0; // x=10, y=31, transparent
        pixel_data[31][11] = 10; // x=11, y=31, (4, 107, 55)
        pixel_data[31][12] = 10; // x=12, y=31, (4, 107, 55)
        pixel_data[31][13] = 5; // x=13, y=31, (23, 112, 58)
        pixel_data[31][14] = 1; // x=14, y=31, (2, 93, 41)
        pixel_data[31][15] = 3; // x=15, y=31, (60, 62, 60)
        pixel_data[31][16] = 3; // x=16, y=31, (60, 62, 60)
        pixel_data[31][17] = 3; // x=17, y=31, (60, 62, 60)
        pixel_data[31][18] = 3; // x=18, y=31, (60, 62, 60)
        pixel_data[31][19] = 3; // x=19, y=31, (60, 62, 60)
        pixel_data[31][20] = 3; // x=20, y=31, (60, 62, 60)
        pixel_data[31][21] = 8; // x=21, y=31, (75, 76, 75)
        pixel_data[31][22] = 8; // x=22, y=31, (75, 76, 75)
        pixel_data[31][23] = 8; // x=23, y=31, (75, 76, 75)
        pixel_data[31][24] = 9; // x=24, y=31, (25, 87, 51)
        pixel_data[31][25] = 14; // x=25, y=31, (11, 103, 50)
        pixel_data[31][26] = 5; // x=26, y=31, (23, 112, 58)
        pixel_data[31][27] = 10; // x=27, y=31, (4, 107, 55)
        pixel_data[31][28] = 0; // x=28, y=31, transparent
        pixel_data[31][29] = 0; // x=29, y=31, transparent
        pixel_data[31][30] = 0; // x=30, y=31, transparent
        pixel_data[31][31] = 0; // x=31, y=31, transparent
        pixel_data[31][32] = 0; // x=32, y=31, transparent
        pixel_data[31][33] = 0; // x=33, y=31, transparent
        pixel_data[31][34] = 0; // x=34, y=31, transparent
        pixel_data[31][35] = 0; // x=35, y=31, transparent
        pixel_data[31][36] = 0; // x=36, y=31, transparent
        pixel_data[31][37] = 0; // x=37, y=31, transparent
        pixel_data[31][38] = 0; // x=38, y=31, transparent
        pixel_data[31][39] = 0; // x=39, y=31, transparent
        pixel_data[32][0] = 0; // x=0, y=32, transparent
        pixel_data[32][1] = 0; // x=1, y=32, transparent
        pixel_data[32][2] = 0; // x=2, y=32, transparent
        pixel_data[32][3] = 0; // x=3, y=32, transparent
        pixel_data[32][4] = 0; // x=4, y=32, transparent
        pixel_data[32][5] = 0; // x=5, y=32, transparent
        pixel_data[32][6] = 0; // x=6, y=32, transparent
        pixel_data[32][7] = 0; // x=7, y=32, transparent
        pixel_data[32][8] = 0; // x=8, y=32, transparent
        pixel_data[32][9] = 0; // x=9, y=32, transparent
        pixel_data[32][10] = 0; // x=10, y=32, transparent
        pixel_data[32][11] = 10; // x=11, y=32, (4, 107, 55)
        pixel_data[32][12] = 10; // x=12, y=32, (4, 107, 55)
        pixel_data[32][13] = 5; // x=13, y=32, (23, 112, 58)
        pixel_data[32][14] = 1; // x=14, y=32, (2, 93, 41)
        pixel_data[32][15] = 3; // x=15, y=32, (60, 62, 60)
        pixel_data[32][16] = 3; // x=16, y=32, (60, 62, 60)
        pixel_data[32][17] = 3; // x=17, y=32, (60, 62, 60)
        pixel_data[32][18] = 3; // x=18, y=32, (60, 62, 60)
        pixel_data[32][19] = 3; // x=19, y=32, (60, 62, 60)
        pixel_data[32][20] = 3; // x=20, y=32, (60, 62, 60)
        pixel_data[32][21] = 8; // x=21, y=32, (75, 76, 75)
        pixel_data[32][22] = 8; // x=22, y=32, (75, 76, 75)
        pixel_data[32][23] = 8; // x=23, y=32, (75, 76, 75)
        pixel_data[32][24] = 9; // x=24, y=32, (25, 87, 51)
        pixel_data[32][25] = 5; // x=25, y=32, (23, 112, 58)
        pixel_data[32][26] = 10; // x=26, y=32, (4, 107, 55)
        pixel_data[32][27] = 10; // x=27, y=32, (4, 107, 55)
        pixel_data[32][28] = 0; // x=28, y=32, transparent
        pixel_data[32][29] = 0; // x=29, y=32, transparent
        pixel_data[32][30] = 0; // x=30, y=32, transparent
        pixel_data[32][31] = 0; // x=31, y=32, transparent
        pixel_data[32][32] = 0; // x=32, y=32, transparent
        pixel_data[32][33] = 0; // x=33, y=32, transparent
        pixel_data[32][34] = 0; // x=34, y=32, transparent
        pixel_data[32][35] = 0; // x=35, y=32, transparent
        pixel_data[32][36] = 0; // x=36, y=32, transparent
        pixel_data[32][37] = 0; // x=37, y=32, transparent
        pixel_data[32][38] = 0; // x=38, y=32, transparent
        pixel_data[32][39] = 0; // x=39, y=32, transparent
        pixel_data[33][0] = 0; // x=0, y=33, transparent
        pixel_data[33][1] = 0; // x=1, y=33, transparent
        pixel_data[33][2] = 0; // x=2, y=33, transparent
        pixel_data[33][3] = 0; // x=3, y=33, transparent
        pixel_data[33][4] = 0; // x=4, y=33, transparent
        pixel_data[33][5] = 0; // x=5, y=33, transparent
        pixel_data[33][6] = 0; // x=6, y=33, transparent
        pixel_data[33][7] = 0; // x=7, y=33, transparent
        pixel_data[33][8] = 0; // x=8, y=33, transparent
        pixel_data[33][9] = 0; // x=9, y=33, transparent
        pixel_data[33][10] = 0; // x=10, y=33, transparent
        pixel_data[33][11] = 14; // x=11, y=33, (11, 103, 50)
        pixel_data[33][12] = 10; // x=12, y=33, (4, 107, 55)
        pixel_data[33][13] = 5; // x=13, y=33, (23, 112, 58)
        pixel_data[33][14] = 1; // x=14, y=33, (2, 93, 41)
        pixel_data[33][15] = 15; // x=15, y=33, (36, 65, 49)
        pixel_data[33][16] = 3; // x=16, y=33, (60, 62, 60)
        pixel_data[33][17] = 3; // x=17, y=33, (60, 62, 60)
        pixel_data[33][18] = 3; // x=18, y=33, (60, 62, 60)
        pixel_data[33][19] = 3; // x=19, y=33, (60, 62, 60)
        pixel_data[33][20] = 3; // x=20, y=33, (60, 62, 60)
        pixel_data[33][21] = 8; // x=21, y=33, (75, 76, 75)
        pixel_data[33][22] = 8; // x=22, y=33, (75, 76, 75)
        pixel_data[33][23] = 8; // x=23, y=33, (75, 76, 75)
        pixel_data[33][24] = 9; // x=24, y=33, (25, 87, 51)
        pixel_data[33][25] = 5; // x=25, y=33, (23, 112, 58)
        pixel_data[33][26] = 10; // x=26, y=33, (4, 107, 55)
        pixel_data[33][27] = 14; // x=27, y=33, (11, 103, 50)
        pixel_data[33][28] = 0; // x=28, y=33, transparent
        pixel_data[33][29] = 0; // x=29, y=33, transparent
        pixel_data[33][30] = 0; // x=30, y=33, transparent
        pixel_data[33][31] = 0; // x=31, y=33, transparent
        pixel_data[33][32] = 0; // x=32, y=33, transparent
        pixel_data[33][33] = 0; // x=33, y=33, transparent
        pixel_data[33][34] = 0; // x=34, y=33, transparent
        pixel_data[33][35] = 0; // x=35, y=33, transparent
        pixel_data[33][36] = 0; // x=36, y=33, transparent
        pixel_data[33][37] = 0; // x=37, y=33, transparent
        pixel_data[33][38] = 0; // x=38, y=33, transparent
        pixel_data[33][39] = 0; // x=39, y=33, transparent
        pixel_data[34][0] = 0; // x=0, y=34, transparent
        pixel_data[34][1] = 0; // x=1, y=34, transparent
        pixel_data[34][2] = 0; // x=2, y=34, transparent
        pixel_data[34][3] = 0; // x=3, y=34, transparent
        pixel_data[34][4] = 0; // x=4, y=34, transparent
        pixel_data[34][5] = 0; // x=5, y=34, transparent
        pixel_data[34][6] = 0; // x=6, y=34, transparent
        pixel_data[34][7] = 0; // x=7, y=34, transparent
        pixel_data[34][8] = 0; // x=8, y=34, transparent
        pixel_data[34][9] = 0; // x=9, y=34, transparent
        pixel_data[34][10] = 0; // x=10, y=34, transparent
        pixel_data[34][11] = 13; // x=11, y=34, (37, 122, 77)
        pixel_data[34][12] = 10; // x=12, y=34, (4, 107, 55)
        pixel_data[34][13] = 5; // x=13, y=34, (23, 112, 58)
        pixel_data[34][14] = 1; // x=14, y=34, (2, 93, 41)
        pixel_data[34][15] = 9; // x=15, y=34, (25, 87, 51)
        pixel_data[34][16] = 15; // x=16, y=34, (36, 65, 49)
        pixel_data[34][17] = 3; // x=17, y=34, (60, 62, 60)
        pixel_data[34][18] = 3; // x=18, y=34, (60, 62, 60)
        pixel_data[34][19] = 3; // x=19, y=34, (60, 62, 60)
        pixel_data[34][20] = 8; // x=20, y=34, (75, 76, 75)
        pixel_data[34][21] = 8; // x=21, y=34, (75, 76, 75)
        pixel_data[34][22] = 3; // x=22, y=34, (60, 62, 60)
        pixel_data[34][23] = 9; // x=23, y=34, (25, 87, 51)
        pixel_data[34][24] = 14; // x=24, y=34, (11, 103, 50)
        pixel_data[34][25] = 14; // x=25, y=34, (11, 103, 50)
        pixel_data[34][26] = 10; // x=26, y=34, (4, 107, 55)
        pixel_data[34][27] = 5; // x=27, y=34, (23, 112, 58)
        pixel_data[34][28] = 0; // x=28, y=34, transparent
        pixel_data[34][29] = 0; // x=29, y=34, transparent
        pixel_data[34][30] = 0; // x=30, y=34, transparent
        pixel_data[34][31] = 0; // x=31, y=34, transparent
        pixel_data[34][32] = 0; // x=32, y=34, transparent
        pixel_data[34][33] = 0; // x=33, y=34, transparent
        pixel_data[34][34] = 0; // x=34, y=34, transparent
        pixel_data[34][35] = 0; // x=35, y=34, transparent
        pixel_data[34][36] = 0; // x=36, y=34, transparent
        pixel_data[34][37] = 0; // x=37, y=34, transparent
        pixel_data[34][38] = 0; // x=38, y=34, transparent
        pixel_data[34][39] = 0; // x=39, y=34, transparent
        pixel_data[35][0] = 0; // x=0, y=35, transparent
        pixel_data[35][1] = 0; // x=1, y=35, transparent
        pixel_data[35][2] = 0; // x=2, y=35, transparent
        pixel_data[35][3] = 0; // x=3, y=35, transparent
        pixel_data[35][4] = 0; // x=4, y=35, transparent
        pixel_data[35][5] = 0; // x=5, y=35, transparent
        pixel_data[35][6] = 0; // x=6, y=35, transparent
        pixel_data[35][7] = 0; // x=7, y=35, transparent
        pixel_data[35][8] = 0; // x=8, y=35, transparent
        pixel_data[35][9] = 0; // x=9, y=35, transparent
        pixel_data[35][10] = 0; // x=10, y=35, transparent
        pixel_data[35][11] = 0; // x=11, y=35, transparent
        pixel_data[35][12] = 9; // x=12, y=35, (25, 87, 51)
        pixel_data[35][13] = 14; // x=13, y=35, (11, 103, 50)
        pixel_data[35][14] = 1; // x=14, y=35, (2, 93, 41)
        pixel_data[35][15] = 5; // x=15, y=35, (23, 112, 58)
        pixel_data[35][16] = 5; // x=16, y=35, (23, 112, 58)
        pixel_data[35][17] = 5; // x=17, y=35, (23, 112, 58)
        pixel_data[35][18] = 5; // x=18, y=35, (23, 112, 58)
        pixel_data[35][19] = 5; // x=19, y=35, (23, 112, 58)
        pixel_data[35][20] = 5; // x=20, y=35, (23, 112, 58)
        pixel_data[35][21] = 5; // x=21, y=35, (23, 112, 58)
        pixel_data[35][22] = 5; // x=22, y=35, (23, 112, 58)
        pixel_data[35][23] = 5; // x=23, y=35, (23, 112, 58)
        pixel_data[35][24] = 14; // x=24, y=35, (11, 103, 50)
        pixel_data[35][25] = 14; // x=25, y=35, (11, 103, 50)
        pixel_data[35][26] = 9; // x=26, y=35, (25, 87, 51)
        pixel_data[35][27] = 0; // x=27, y=35, transparent
        pixel_data[35][28] = 0; // x=28, y=35, transparent
        pixel_data[35][29] = 0; // x=29, y=35, transparent
        pixel_data[35][30] = 0; // x=30, y=35, transparent
        pixel_data[35][31] = 0; // x=31, y=35, transparent
        pixel_data[35][32] = 0; // x=32, y=35, transparent
        pixel_data[35][33] = 0; // x=33, y=35, transparent
        pixel_data[35][34] = 0; // x=34, y=35, transparent
        pixel_data[35][35] = 0; // x=35, y=35, transparent
        pixel_data[35][36] = 0; // x=36, y=35, transparent
        pixel_data[35][37] = 0; // x=37, y=35, transparent
        pixel_data[35][38] = 0; // x=38, y=35, transparent
        pixel_data[35][39] = 0; // x=39, y=35, transparent
        pixel_data[36][0] = 0; // x=0, y=36, transparent
        pixel_data[36][1] = 0; // x=1, y=36, transparent
        pixel_data[36][2] = 0; // x=2, y=36, transparent
        pixel_data[36][3] = 0; // x=3, y=36, transparent
        pixel_data[36][4] = 0; // x=4, y=36, transparent
        pixel_data[36][5] = 0; // x=5, y=36, transparent
        pixel_data[36][6] = 0; // x=6, y=36, transparent
        pixel_data[36][7] = 0; // x=7, y=36, transparent
        pixel_data[36][8] = 0; // x=8, y=36, transparent
        pixel_data[36][9] = 0; // x=9, y=36, transparent
        pixel_data[36][10] = 0; // x=10, y=36, transparent
        pixel_data[36][11] = 0; // x=11, y=36, transparent
        pixel_data[36][12] = 0; // x=12, y=36, transparent
        pixel_data[36][13] = 7; // x=13, y=36, (24, 52, 36)
        pixel_data[36][14] = 12; // x=14, y=36, (14, 69, 40)
        pixel_data[36][15] = 1; // x=15, y=36, (2, 93, 41)
        pixel_data[36][16] = 14; // x=16, y=36, (11, 103, 50)
        pixel_data[36][17] = 14; // x=17, y=36, (11, 103, 50)
        pixel_data[36][18] = 5; // x=18, y=36, (23, 112, 58)
        pixel_data[36][19] = 5; // x=19, y=36, (23, 112, 58)
        pixel_data[36][20] = 5; // x=20, y=36, (23, 112, 58)
        pixel_data[36][21] = 5; // x=21, y=36, (23, 112, 58)
        pixel_data[36][22] = 14; // x=22, y=36, (11, 103, 50)
        pixel_data[36][23] = 9; // x=23, y=36, (25, 87, 51)
        pixel_data[36][24] = 12; // x=24, y=36, (14, 69, 40)
        pixel_data[36][25] = 7; // x=25, y=36, (24, 52, 36)
        pixel_data[36][26] = 3; // x=26, y=36, (60, 62, 60)
        pixel_data[36][27] = 0; // x=27, y=36, transparent
        pixel_data[36][28] = 0; // x=28, y=36, transparent
        pixel_data[36][29] = 0; // x=29, y=36, transparent
        pixel_data[36][30] = 0; // x=30, y=36, transparent
        pixel_data[36][31] = 0; // x=31, y=36, transparent
        pixel_data[36][32] = 0; // x=32, y=36, transparent
        pixel_data[36][33] = 0; // x=33, y=36, transparent
        pixel_data[36][34] = 0; // x=34, y=36, transparent
        pixel_data[36][35] = 0; // x=35, y=36, transparent
        pixel_data[36][36] = 0; // x=36, y=36, transparent
        pixel_data[36][37] = 0; // x=37, y=36, transparent
        pixel_data[36][38] = 0; // x=38, y=36, transparent
        pixel_data[36][39] = 0; // x=39, y=36, transparent
        pixel_data[37][0] = 0; // x=0, y=37, transparent
        pixel_data[37][1] = 0; // x=1, y=37, transparent
        pixel_data[37][2] = 0; // x=2, y=37, transparent
        pixel_data[37][3] = 0; // x=3, y=37, transparent
        pixel_data[37][4] = 0; // x=4, y=37, transparent
        pixel_data[37][5] = 0; // x=5, y=37, transparent
        pixel_data[37][6] = 0; // x=6, y=37, transparent
        pixel_data[37][7] = 0; // x=7, y=37, transparent
        pixel_data[37][8] = 0; // x=8, y=37, transparent
        pixel_data[37][9] = 0; // x=9, y=37, transparent
        pixel_data[37][10] = 0; // x=10, y=37, transparent
        pixel_data[37][11] = 0; // x=11, y=37, transparent
        pixel_data[37][12] = 0; // x=12, y=37, transparent
        pixel_data[37][13] = 0; // x=13, y=37, transparent
        pixel_data[37][14] = 2; // x=14, y=37, (39, 40, 39)
        pixel_data[37][15] = 2; // x=15, y=37, (39, 40, 39)
        pixel_data[37][16] = 7; // x=16, y=37, (24, 52, 36)
        pixel_data[37][17] = 7; // x=17, y=37, (24, 52, 36)
        pixel_data[37][18] = 7; // x=18, y=37, (24, 52, 36)
        pixel_data[37][19] = 7; // x=19, y=37, (24, 52, 36)
        pixel_data[37][20] = 7; // x=20, y=37, (24, 52, 36)
        pixel_data[37][21] = 7; // x=21, y=37, (24, 52, 36)
        pixel_data[37][22] = 7; // x=22, y=37, (24, 52, 36)
        pixel_data[37][23] = 2; // x=23, y=37, (39, 40, 39)
        pixel_data[37][24] = 2; // x=24, y=37, (39, 40, 39)
        pixel_data[37][25] = 2; // x=25, y=37, (39, 40, 39)
        pixel_data[37][26] = 0; // x=26, y=37, transparent
        pixel_data[37][27] = 0; // x=27, y=37, transparent
        pixel_data[37][28] = 0; // x=28, y=37, transparent
        pixel_data[37][29] = 0; // x=29, y=37, transparent
        pixel_data[37][30] = 0; // x=30, y=37, transparent
        pixel_data[37][31] = 0; // x=31, y=37, transparent
        pixel_data[37][32] = 0; // x=32, y=37, transparent
        pixel_data[37][33] = 0; // x=33, y=37, transparent
        pixel_data[37][34] = 0; // x=34, y=37, transparent
        pixel_data[37][35] = 0; // x=35, y=37, transparent
        pixel_data[37][36] = 0; // x=36, y=37, transparent
        pixel_data[37][37] = 0; // x=37, y=37, transparent
        pixel_data[37][38] = 0; // x=38, y=37, transparent
        pixel_data[37][39] = 0; // x=39, y=37, transparent
        pixel_data[38][0] = 0; // x=0, y=38, transparent
        pixel_data[38][1] = 0; // x=1, y=38, transparent
        pixel_data[38][2] = 0; // x=2, y=38, transparent
        pixel_data[38][3] = 0; // x=3, y=38, transparent
        pixel_data[38][4] = 0; // x=4, y=38, transparent
        pixel_data[38][5] = 0; // x=5, y=38, transparent
        pixel_data[38][6] = 0; // x=6, y=38, transparent
        pixel_data[38][7] = 0; // x=7, y=38, transparent
        pixel_data[38][8] = 0; // x=8, y=38, transparent
        pixel_data[38][9] = 0; // x=9, y=38, transparent
        pixel_data[38][10] = 0; // x=10, y=38, transparent
        pixel_data[38][11] = 0; // x=11, y=38, transparent
        pixel_data[38][12] = 0; // x=12, y=38, transparent
        pixel_data[38][13] = 0; // x=13, y=38, transparent
        pixel_data[38][14] = 0; // x=14, y=38, transparent
        pixel_data[38][15] = 0; // x=15, y=38, transparent
        pixel_data[38][16] = 0; // x=16, y=38, transparent
        pixel_data[38][17] = 0; // x=17, y=38, transparent
        pixel_data[38][18] = 0; // x=18, y=38, transparent
        pixel_data[38][19] = 0; // x=19, y=38, transparent
        pixel_data[38][20] = 0; // x=20, y=38, transparent
        pixel_data[38][21] = 0; // x=21, y=38, transparent
        pixel_data[38][22] = 0; // x=22, y=38, transparent
        pixel_data[38][23] = 0; // x=23, y=38, transparent
        pixel_data[38][24] = 0; // x=24, y=38, transparent
        pixel_data[38][25] = 0; // x=25, y=38, transparent
        pixel_data[38][26] = 0; // x=26, y=38, transparent
        pixel_data[38][27] = 0; // x=27, y=38, transparent
        pixel_data[38][28] = 0; // x=28, y=38, transparent
        pixel_data[38][29] = 0; // x=29, y=38, transparent
        pixel_data[38][30] = 0; // x=30, y=38, transparent
        pixel_data[38][31] = 0; // x=31, y=38, transparent
        pixel_data[38][32] = 0; // x=32, y=38, transparent
        pixel_data[38][33] = 0; // x=33, y=38, transparent
        pixel_data[38][34] = 0; // x=34, y=38, transparent
        pixel_data[38][35] = 0; // x=35, y=38, transparent
        pixel_data[38][36] = 0; // x=36, y=38, transparent
        pixel_data[38][37] = 0; // x=37, y=38, transparent
        pixel_data[38][38] = 0; // x=38, y=38, transparent
        pixel_data[38][39] = 0; // x=39, y=38, transparent
        pixel_data[39][0] = 0; // x=0, y=39, transparent
        pixel_data[39][1] = 0; // x=1, y=39, transparent
        pixel_data[39][2] = 0; // x=2, y=39, transparent
        pixel_data[39][3] = 0; // x=3, y=39, transparent
        pixel_data[39][4] = 0; // x=4, y=39, transparent
        pixel_data[39][5] = 0; // x=5, y=39, transparent
        pixel_data[39][6] = 0; // x=6, y=39, transparent
        pixel_data[39][7] = 0; // x=7, y=39, transparent
        pixel_data[39][8] = 0; // x=8, y=39, transparent
        pixel_data[39][9] = 0; // x=9, y=39, transparent
        pixel_data[39][10] = 0; // x=10, y=39, transparent
        pixel_data[39][11] = 0; // x=11, y=39, transparent
        pixel_data[39][12] = 0; // x=12, y=39, transparent
        pixel_data[39][13] = 0; // x=13, y=39, transparent
        pixel_data[39][14] = 0; // x=14, y=39, transparent
        pixel_data[39][15] = 0; // x=15, y=39, transparent
        pixel_data[39][16] = 0; // x=16, y=39, transparent
        pixel_data[39][17] = 0; // x=17, y=39, transparent
        pixel_data[39][18] = 0; // x=18, y=39, transparent
        pixel_data[39][19] = 0; // x=19, y=39, transparent
        pixel_data[39][20] = 0; // x=20, y=39, transparent
        pixel_data[39][21] = 0; // x=21, y=39, transparent
        pixel_data[39][22] = 0; // x=22, y=39, transparent
        pixel_data[39][23] = 0; // x=23, y=39, transparent
        pixel_data[39][24] = 0; // x=24, y=39, transparent
        pixel_data[39][25] = 0; // x=25, y=39, transparent
        pixel_data[39][26] = 0; // x=26, y=39, transparent
        pixel_data[39][27] = 0; // x=27, y=39, transparent
        pixel_data[39][28] = 0; // x=28, y=39, transparent
        pixel_data[39][29] = 0; // x=29, y=39, transparent
        pixel_data[39][30] = 0; // x=30, y=39, transparent
        pixel_data[39][31] = 0; // x=31, y=39, transparent
        pixel_data[39][32] = 0; // x=32, y=39, transparent
        pixel_data[39][33] = 0; // x=33, y=39, transparent
        pixel_data[39][34] = 0; // x=34, y=39, transparent
        pixel_data[39][35] = 0; // x=35, y=39, transparent
        pixel_data[39][36] = 0; // x=36, y=39, transparent
        pixel_data[39][37] = 0; // x=37, y=39, transparent
        pixel_data[39][38] = 0; // x=38, y=39, transparent
        pixel_data[39][39] = 0; // x=39, y=39, transparent
    end
endmodule
