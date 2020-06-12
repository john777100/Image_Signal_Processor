/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Thu Jun  4 21:39:31 2020
/////////////////////////////////////////////////////////////


module demosaic ( clk, rst_n, valid, data_in, end_col, end_pic, RGB_valid, 
        RGB_data, color, col_last, pic_last );
  input [7:0] data_in;
  output [7:0] RGB_data;
  output [1:0] color;
  input clk, rst_n, valid, end_col, end_pic;
  output RGB_valid, col_last, pic_last;
  wire   \col1_r[0][7] , \col1_r[0][6] , \col1_r[0][5] , \col1_r[0][4] ,
         \col1_r[0][3] , \col1_r[0][2] , \col1_r[0][1] , \col1_r[0][0] ,
         \col1_r[1][7] , \col1_r[1][6] , \col1_r[1][5] , \col1_r[1][4] ,
         \col1_r[1][3] , \col1_r[1][2] , \col1_r[1][1] , \col1_r[1][0] ,
         \col1_r[2][7] , \col1_r[2][6] , \col1_r[2][5] , \col1_r[2][4] ,
         \col1_r[2][3] , \col1_r[2][2] , \col1_r[2][1] , \col1_r[2][0] ,
         \col1_r[3][7] , \col1_r[3][6] , \col1_r[3][5] , \col1_r[3][4] ,
         \col1_r[3][3] , \col1_r[3][2] , \col1_r[3][1] , \col1_r[3][0] ,
         \col1_r[4][7] , \col1_r[4][6] , \col1_r[4][5] , \col1_r[4][4] ,
         \col1_r[4][3] , \col1_r[4][2] , \col1_r[4][1] , \col1_r[4][0] ,
         \col1_r[5][7] , \col1_r[5][6] , \col1_r[5][5] , \col1_r[5][4] ,
         \col1_r[5][3] , \col1_r[5][2] , \col1_r[5][1] , \col1_r[5][0] ,
         \col1_r[6][7] , \col1_r[6][6] , \col1_r[6][5] , \col1_r[6][4] ,
         \col1_r[6][3] , \col1_r[6][2] , \col1_r[6][1] , \col1_r[6][0] ,
         \col1_r[7][7] , \col1_r[7][6] , \col1_r[7][5] , \col1_r[7][4] ,
         \col1_r[7][3] , \col1_r[7][2] , \col1_r[7][1] , \col1_r[7][0] ,
         \col2_r[0][7] , \col2_r[0][6] , \col2_r[0][5] , \col2_r[0][4] ,
         \col2_r[0][3] , \col2_r[0][2] , \col2_r[0][1] , \col2_r[0][0] ,
         \col2_r[1][7] , \col2_r[1][6] , \col2_r[1][5] , \col2_r[1][4] ,
         \col2_r[1][3] , \col2_r[1][2] , \col2_r[1][1] , \col2_r[1][0] ,
         \col2_r[2][7] , \col2_r[2][6] , \col2_r[2][5] , \col2_r[2][4] ,
         \col2_r[2][3] , \col2_r[2][2] , \col2_r[2][1] , \col2_r[2][0] ,
         \col2_r[3][7] , \col2_r[3][6] , \col2_r[3][5] , \col2_r[3][4] ,
         \col2_r[3][3] , \col2_r[3][2] , \col2_r[3][1] , \col2_r[3][0] ,
         \col2_r[4][7] , \col2_r[4][6] , \col2_r[4][5] , \col2_r[4][4] ,
         \col2_r[4][3] , \col2_r[4][2] , \col2_r[4][1] , \col2_r[4][0] ,
         \col2_r[5][7] , \col2_r[5][6] , \col2_r[5][5] , \col2_r[5][4] ,
         \col2_r[5][3] , \col2_r[5][2] , \col2_r[5][1] , \col2_r[5][0] ,
         \col2_r[6][7] , \col2_r[6][6] , \col2_r[6][5] , \col2_r[6][4] ,
         \col2_r[6][3] , \col2_r[6][2] , \col2_r[6][1] , \col2_r[6][0] ,
         \col2_r[7][7] , \col2_r[7][6] , \col2_r[7][5] , \col2_r[7][4] ,
         \col2_r[7][3] , \col2_r[7][2] , \col2_r[7][1] , \col2_r[7][0] ,
         \col3_r[0][7] , \col3_r[0][6] , \col3_r[0][5] , \col3_r[0][4] ,
         \col3_r[0][3] , \col3_r[0][2] , \col3_r[0][1] , \col3_r[0][0] ,
         \col3_r[1][7] , \col3_r[1][6] , \col3_r[1][5] , \col3_r[1][4] ,
         \col3_r[1][3] , \col3_r[1][2] , \col3_r[1][1] , \col3_r[1][0] ,
         \col3_r[2][7] , \col3_r[2][6] , \col3_r[2][5] , \col3_r[2][4] ,
         \col3_r[2][3] , \col3_r[2][2] , \col3_r[2][1] , \col3_r[2][0] ,
         \col3_r[3][7] , \col3_r[3][6] , \col3_r[3][5] , \col3_r[3][4] ,
         \col3_r[3][3] , \col3_r[3][2] , \col3_r[3][1] , \col3_r[3][0] ,
         \col3_r[4][7] , \col3_r[4][6] , \col3_r[4][5] , \col3_r[4][4] ,
         \col3_r[4][3] , \col3_r[4][2] , \col3_r[4][1] , \col3_r[4][0] ,
         \col3_r[5][7] , \col3_r[5][6] , \col3_r[5][5] , \col3_r[5][4] ,
         \col3_r[5][3] , \col3_r[5][2] , \col3_r[5][1] , \col3_r[5][0] ,
         \col3_r[6][7] , \col3_r[6][6] , \col3_r[6][5] , \col3_r[6][4] ,
         \col3_r[6][3] , \col3_r[6][2] , \col3_r[6][1] , \col3_r[6][0] ,
         col_last_buf_r, pic_last_buf_r, end_col_r, end_pic_r, valid_r,
         RGB_valid_w, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117,
         n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127,
         n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137,
         n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147,
         n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157,
         n1158, n1159, n1160, n1161, n1162, n1163, n1164, \intadd_9/CI ,
         \intadd_9/SUM[6] , \intadd_9/SUM[5] , \intadd_9/SUM[4] ,
         \intadd_9/SUM[3] , \intadd_9/SUM[2] , \intadd_9/SUM[1] ,
         \intadd_9/SUM[0] , \intadd_9/n7 , \intadd_9/n6 , \intadd_9/n5 ,
         \intadd_9/n4 , \intadd_9/n3 , \intadd_9/n2 , \intadd_9/n1 ,
         \intadd_10/CI , \intadd_10/SUM[6] , \intadd_10/SUM[5] ,
         \intadd_10/SUM[4] , \intadd_10/SUM[3] , \intadd_10/SUM[2] ,
         \intadd_10/SUM[1] , \intadd_10/SUM[0] , \intadd_10/n7 ,
         \intadd_10/n6 , \intadd_10/n5 , \intadd_10/n4 , \intadd_10/n3 ,
         \intadd_10/n2 , \intadd_10/n1 , \intadd_11/A[5] , \intadd_11/A[4] ,
         \intadd_11/A[3] , \intadd_11/A[2] , \intadd_11/A[1] ,
         \intadd_11/A[0] , \intadd_11/B[5] , \intadd_11/B[4] ,
         \intadd_11/B[3] , \intadd_11/B[2] , \intadd_11/B[1] ,
         \intadd_11/B[0] , \intadd_11/CI , \intadd_11/SUM[5] ,
         \intadd_11/SUM[4] , \intadd_11/SUM[3] , \intadd_11/SUM[2] ,
         \intadd_11/SUM[1] , \intadd_11/SUM[0] , \intadd_11/n6 ,
         \intadd_11/n5 , \intadd_11/n4 , \intadd_11/n3 , \intadd_11/n2 ,
         \intadd_11/n1 , \intadd_12/A[5] , \intadd_12/A[4] , \intadd_12/A[3] ,
         \intadd_12/A[2] , \intadd_12/A[1] , \intadd_12/A[0] ,
         \intadd_12/B[5] , \intadd_12/B[4] , \intadd_12/B[3] ,
         \intadd_12/B[2] , \intadd_12/B[1] , \intadd_12/B[0] , \intadd_12/CI ,
         \intadd_12/SUM[5] , \intadd_12/SUM[4] , \intadd_12/SUM[3] ,
         \intadd_12/SUM[2] , \intadd_12/SUM[1] , \intadd_12/SUM[0] ,
         \intadd_12/n6 , \intadd_12/n5 , \intadd_12/n4 , \intadd_12/n3 ,
         \intadd_12/n2 , \intadd_12/n1 , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n925,
         n935;
  wire   [2:0] counter_r;
  wire   [7:0] pixel9;
  wire   [2:0] logic_state_r;
  wire   [9:0] up_sum_r;
  wire   [9:0] down_sum_r;
  wire   [9:0] hor_sum_r;
  wire   [9:0] ver_sum_r;
  wire   [7:0] cen_r;
  wire   [7:0] G_data_r;
  wire   [7:0] B_data_r;
  wire   [3:0] state_r;
  wire   [3:0] state_w;

  QDFFRBN end_col_r_reg ( .D(end_col), .CK(clk), .RB(n851), .Q(end_col_r) );
  QDFFRBN end_pic_r_reg ( .D(end_pic), .CK(clk), .RB(n851), .Q(end_pic_r) );
  QDFFRBN \counter_r_reg[0]  ( .D(n1161), .CK(clk), .RB(n853), .Q(counter_r[0]) );
  QDFFRBN \state_r_reg[3]  ( .D(state_w[3]), .CK(clk), .RB(n853), .Q(
        state_r[3]) );
  QDFFRBN \counter_r_reg[1]  ( .D(n1159), .CK(clk), .RB(n853), .Q(counter_r[1]) );
  QDFFRBN \counter_r_reg[2]  ( .D(n1160), .CK(clk), .RB(n853), .Q(counter_r[2]) );
  QDFFRBN \state_r_reg[2]  ( .D(state_w[2]), .CK(clk), .RB(n852), .Q(
        state_r[2]) );
  QDFFRBN \state_r_reg[1]  ( .D(state_w[1]), .CK(clk), .RB(n852), .Q(
        state_r[1]) );
  QDFFRBN \logic_state_r_reg[2]  ( .D(n1164), .CK(clk), .RB(n848), .Q(
        logic_state_r[2]) );
  QDFFRBN \logic_state_r_reg[0]  ( .D(n1162), .CK(clk), .RB(n848), .Q(
        logic_state_r[0]) );
  QDFFRBN \logic_state_r_reg[1]  ( .D(n1163), .CK(clk), .RB(n859), .Q(
        logic_state_r[1]) );
  QDFFRBN col_last_buf_r_reg ( .D(n973), .CK(clk), .RB(n890), .Q(
        col_last_buf_r) );
  QDFFRBN col_last_r_reg ( .D(n972), .CK(clk), .RB(n890), .Q(col_last) );
  QDFFRBN pic_last_buf_r_reg ( .D(n924), .CK(clk), .RB(n890), .Q(
        pic_last_buf_r) );
  QDFFRBN pic_last_r_reg ( .D(n923), .CK(clk), .RB(n849), .Q(pic_last) );
  QDFFRBN \col3_r_reg[0][7]  ( .D(n1158), .CK(clk), .RB(n849), .Q(
        \col3_r[0][7] ) );
  QDFFRBN \col3_r_reg[0][6]  ( .D(n1157), .CK(clk), .RB(n849), .Q(
        \col3_r[0][6] ) );
  QDFFRBN \col3_r_reg[0][5]  ( .D(n1156), .CK(clk), .RB(n849), .Q(
        \col3_r[0][5] ) );
  QDFFRBN \col3_r_reg[0][4]  ( .D(n1155), .CK(clk), .RB(n848), .Q(
        \col3_r[0][4] ) );
  QDFFRBN \col3_r_reg[0][3]  ( .D(n1154), .CK(clk), .RB(n848), .Q(
        \col3_r[0][3] ) );
  QDFFRBN \col3_r_reg[0][2]  ( .D(n1153), .CK(clk), .RB(n850), .Q(
        \col3_r[0][2] ) );
  QDFFRBN \col3_r_reg[0][1]  ( .D(n1152), .CK(clk), .RB(n850), .Q(
        \col3_r[0][1] ) );
  QDFFRBN \col3_r_reg[0][0]  ( .D(n1151), .CK(clk), .RB(n850), .Q(
        \col3_r[0][0] ) );
  QDFFRBN \col3_r_reg[1][7]  ( .D(n1150), .CK(clk), .RB(n850), .Q(
        \col3_r[1][7] ) );
  QDFFRBN \col3_r_reg[1][6]  ( .D(n1149), .CK(clk), .RB(n849), .Q(
        \col3_r[1][6] ) );
  QDFFRBN \col3_r_reg[1][5]  ( .D(n1148), .CK(clk), .RB(n849), .Q(
        \col3_r[1][5] ) );
  QDFFRBN \col3_r_reg[1][4]  ( .D(n1147), .CK(clk), .RB(n857), .Q(
        \col3_r[1][4] ) );
  QDFFRBN \col3_r_reg[1][3]  ( .D(n1146), .CK(clk), .RB(n857), .Q(
        \col3_r[1][3] ) );
  QDFFRBN \col3_r_reg[1][2]  ( .D(n1145), .CK(clk), .RB(n857), .Q(
        \col3_r[1][2] ) );
  QDFFRBN \col3_r_reg[1][1]  ( .D(n1144), .CK(clk), .RB(n857), .Q(
        \col3_r[1][1] ) );
  QDFFRBN \col3_r_reg[1][0]  ( .D(n1143), .CK(clk), .RB(n856), .Q(
        \col3_r[1][0] ) );
  QDFFRBN \col3_r_reg[2][7]  ( .D(n1142), .CK(clk), .RB(n856), .Q(
        \col3_r[2][7] ) );
  QDFFRBN \col3_r_reg[2][6]  ( .D(n1141), .CK(clk), .RB(n858), .Q(
        \col3_r[2][6] ) );
  QDFFRBN \col3_r_reg[2][5]  ( .D(n1140), .CK(clk), .RB(n858), .Q(
        \col3_r[2][5] ) );
  QDFFRBN \col3_r_reg[2][4]  ( .D(n1139), .CK(clk), .RB(n858), .Q(
        \col3_r[2][4] ) );
  QDFFRBN \col3_r_reg[2][3]  ( .D(n1138), .CK(clk), .RB(n858), .Q(
        \col3_r[2][3] ) );
  QDFFRBN \col3_r_reg[2][2]  ( .D(n1137), .CK(clk), .RB(n857), .Q(
        \col3_r[2][2] ) );
  QDFFRBN \col3_r_reg[2][1]  ( .D(n1136), .CK(clk), .RB(n857), .Q(
        \col3_r[2][1] ) );
  QDFFRBN \col3_r_reg[2][0]  ( .D(n1135), .CK(clk), .RB(n859), .Q(
        \col3_r[2][0] ) );
  QDFFRBN \col3_r_reg[3][7]  ( .D(n1134), .CK(clk), .RB(n859), .Q(
        \col3_r[3][7] ) );
  QDFFRBN \col3_r_reg[3][6]  ( .D(n1133), .CK(clk), .RB(n859), .Q(
        \col3_r[3][6] ) );
  QDFFRBN \col3_r_reg[3][5]  ( .D(n1132), .CK(clk), .RB(n859), .Q(
        \col3_r[3][5] ) );
  QDFFRBN \col3_r_reg[3][4]  ( .D(n1131), .CK(clk), .RB(n858), .Q(
        \col3_r[3][4] ) );
  QDFFRBN \col3_r_reg[3][3]  ( .D(n1130), .CK(clk), .RB(n858), .Q(
        \col3_r[3][3] ) );
  QDFFRBN \col3_r_reg[3][2]  ( .D(n1129), .CK(clk), .RB(n854), .Q(
        \col3_r[3][2] ) );
  QDFFRBN \col3_r_reg[3][1]  ( .D(n1128), .CK(clk), .RB(n854), .Q(
        \col3_r[3][1] ) );
  QDFFRBN \col3_r_reg[3][0]  ( .D(n1127), .CK(clk), .RB(n854), .Q(
        \col3_r[3][0] ) );
  QDFFRBN \col3_r_reg[4][7]  ( .D(n1126), .CK(clk), .RB(n854), .Q(
        \col3_r[4][7] ) );
  QDFFRBN \col3_r_reg[4][6]  ( .D(n1125), .CK(clk), .RB(n853), .Q(
        \col3_r[4][6] ) );
  QDFFRBN \col3_r_reg[4][5]  ( .D(n1124), .CK(clk), .RB(n853), .Q(
        \col3_r[4][5] ) );
  QDFFRBN \col3_r_reg[4][4]  ( .D(n1123), .CK(clk), .RB(n855), .Q(
        \col3_r[4][4] ) );
  QDFFRBN \col3_r_reg[4][3]  ( .D(n1122), .CK(clk), .RB(n855), .Q(
        \col3_r[4][3] ) );
  QDFFRBN \col3_r_reg[4][2]  ( .D(n1121), .CK(clk), .RB(n855), .Q(
        \col3_r[4][2] ) );
  QDFFRBN \col3_r_reg[4][1]  ( .D(n1120), .CK(clk), .RB(n855), .Q(
        \col3_r[4][1] ) );
  QDFFRBN \col3_r_reg[4][0]  ( .D(n1119), .CK(clk), .RB(n854), .Q(
        \col3_r[4][0] ) );
  QDFFRBN \col3_r_reg[5][7]  ( .D(n1118), .CK(clk), .RB(n854), .Q(
        \col3_r[5][7] ) );
  QDFFRBN \col3_r_reg[5][6]  ( .D(n1117), .CK(clk), .RB(n856), .Q(
        \col3_r[5][6] ) );
  QDFFRBN \col3_r_reg[5][5]  ( .D(n1116), .CK(clk), .RB(n856), .Q(
        \col3_r[5][5] ) );
  QDFFRBN \col3_r_reg[5][4]  ( .D(n1115), .CK(clk), .RB(n856), .Q(
        \col3_r[5][4] ) );
  QDFFRBN \col3_r_reg[5][3]  ( .D(n1114), .CK(clk), .RB(n856), .Q(
        \col3_r[5][3] ) );
  QDFFRBN \col3_r_reg[5][2]  ( .D(n1113), .CK(clk), .RB(n855), .Q(
        \col3_r[5][2] ) );
  QDFFRBN \col3_r_reg[5][1]  ( .D(n1112), .CK(clk), .RB(n855), .Q(
        \col3_r[5][1] ) );
  QDFFRBN \col3_r_reg[5][0]  ( .D(n1111), .CK(clk), .RB(n863), .Q(
        \col3_r[5][0] ) );
  QDFFRBN \col3_r_reg[6][7]  ( .D(n1110), .CK(clk), .RB(n863), .Q(
        \col3_r[6][7] ) );
  QDFFRBN \col3_r_reg[6][6]  ( .D(n1109), .CK(clk), .RB(n863), .Q(
        \col3_r[6][6] ) );
  QDFFRBN \col3_r_reg[6][5]  ( .D(n1108), .CK(clk), .RB(n863), .Q(
        \col3_r[6][5] ) );
  QDFFRBN \col3_r_reg[6][4]  ( .D(n1107), .CK(clk), .RB(n862), .Q(
        \col3_r[6][4] ) );
  QDFFRBN \col3_r_reg[6][3]  ( .D(n1106), .CK(clk), .RB(n864), .Q(
        \col3_r[6][3] ) );
  QDFFRBN \col3_r_reg[6][2]  ( .D(n1105), .CK(clk), .RB(n864), .Q(
        \col3_r[6][2] ) );
  QDFFRBN \col3_r_reg[6][1]  ( .D(n1104), .CK(clk), .RB(n864), .Q(
        \col3_r[6][1] ) );
  QDFFRBN \col3_r_reg[6][0]  ( .D(n1103), .CK(clk), .RB(n864), .Q(
        \col3_r[6][0] ) );
  QDFFRBN \col2_r_reg[0][7]  ( .D(n1102), .CK(clk), .RB(n864), .Q(
        \col2_r[0][7] ) );
  QDFFRBN \col1_r_reg[0][7]  ( .D(n1101), .CK(clk), .RB(n863), .Q(
        \col1_r[0][7] ) );
  QDFFRBN \col2_r_reg[0][6]  ( .D(n1100), .CK(clk), .RB(n865), .Q(
        \col2_r[0][6] ) );
  QDFFRBN \col1_r_reg[0][6]  ( .D(n1099), .CK(clk), .RB(n865), .Q(
        \col1_r[0][6] ) );
  QDFFRBN \col2_r_reg[0][5]  ( .D(n1098), .CK(clk), .RB(n865), .Q(
        \col2_r[0][5] ) );
  QDFFRBN \col1_r_reg[0][5]  ( .D(n1097), .CK(clk), .RB(n865), .Q(
        \col1_r[0][5] ) );
  QDFFRBN \col2_r_reg[0][4]  ( .D(n1096), .CK(clk), .RB(n865), .Q(
        \col2_r[0][4] ) );
  QDFFRBN \col1_r_reg[0][4]  ( .D(n1095), .CK(clk), .RB(n864), .Q(
        \col1_r[0][4] ) );
  QDFFRBN \col2_r_reg[0][3]  ( .D(n1094), .CK(clk), .RB(n860), .Q(
        \col2_r[0][3] ) );
  QDFFRBN \col1_r_reg[0][3]  ( .D(n1093), .CK(clk), .RB(n860), .Q(
        \col1_r[0][3] ) );
  QDFFRBN \col2_r_reg[0][2]  ( .D(n1092), .CK(clk), .RB(n860), .Q(
        \col2_r[0][2] ) );
  QDFFRBN \col1_r_reg[0][2]  ( .D(n1091), .CK(clk), .RB(n860), .Q(
        \col1_r[0][2] ) );
  QDFFRBN \col2_r_reg[0][1]  ( .D(n1090), .CK(clk), .RB(n860), .Q(
        \col2_r[0][1] ) );
  QDFFRBN \col1_r_reg[0][1]  ( .D(n1089), .CK(clk), .RB(n859), .Q(
        \col1_r[0][1] ) );
  QDFFRBN \col2_r_reg[0][0]  ( .D(n1088), .CK(clk), .RB(n861), .Q(
        \col2_r[0][0] ) );
  QDFFRBN \col1_r_reg[0][0]  ( .D(n1087), .CK(clk), .RB(n861), .Q(
        \col1_r[0][0] ) );
  QDFFRBN \col2_r_reg[1][7]  ( .D(n1086), .CK(clk), .RB(n861), .Q(
        \col2_r[1][7] ) );
  QDFFRBN \col1_r_reg[1][7]  ( .D(n1085), .CK(clk), .RB(n861), .Q(
        \col1_r[1][7] ) );
  QDFFRBN \col2_r_reg[1][6]  ( .D(n1084), .CK(clk), .RB(n861), .Q(
        \col2_r[1][6] ) );
  QDFFRBN \col1_r_reg[1][6]  ( .D(n1083), .CK(clk), .RB(n860), .Q(
        \col1_r[1][6] ) );
  QDFFRBN \col2_r_reg[1][5]  ( .D(n1082), .CK(clk), .RB(n862), .Q(
        \col2_r[1][5] ) );
  QDFFRBN \col1_r_reg[1][5]  ( .D(n1081), .CK(clk), .RB(n862), .Q(
        \col1_r[1][5] ) );
  QDFFRBN \col2_r_reg[1][4]  ( .D(n1080), .CK(clk), .RB(n862), .Q(
        \col2_r[1][4] ) );
  QDFFRBN \col1_r_reg[1][4]  ( .D(n1079), .CK(clk), .RB(n862), .Q(
        \col1_r[1][4] ) );
  QDFFRBN \col2_r_reg[1][3]  ( .D(n1078), .CK(clk), .RB(n862), .Q(
        \col2_r[1][3] ) );
  QDFFRBN \col1_r_reg[1][3]  ( .D(n1077), .CK(clk), .RB(n861), .Q(
        \col1_r[1][3] ) );
  QDFFRBN \col2_r_reg[1][2]  ( .D(n1076), .CK(clk), .RB(n869), .Q(
        \col2_r[1][2] ) );
  QDFFRBN \col1_r_reg[1][2]  ( .D(n1075), .CK(clk), .RB(n869), .Q(
        \col1_r[1][2] ) );
  QDFFRBN \col2_r_reg[1][1]  ( .D(n1074), .CK(clk), .RB(n869), .Q(
        \col2_r[1][1] ) );
  QDFFRBN \col1_r_reg[1][1]  ( .D(n1073), .CK(clk), .RB(n868), .Q(
        \col1_r[1][1] ) );
  QDFFRBN \col2_r_reg[1][0]  ( .D(n1072), .CK(clk), .RB(n868), .Q(
        \col2_r[1][0] ) );
  QDFFRBN \col1_r_reg[1][0]  ( .D(n1071), .CK(clk), .RB(n868), .Q(
        \col1_r[1][0] ) );
  QDFFRBN \col2_r_reg[2][7]  ( .D(n1070), .CK(clk), .RB(n870), .Q(
        \col2_r[2][7] ) );
  QDFFRBN \col1_r_reg[2][7]  ( .D(n1069), .CK(clk), .RB(n870), .Q(
        \col1_r[2][7] ) );
  QDFFRBN \col2_r_reg[2][6]  ( .D(n1068), .CK(clk), .RB(n870), .Q(
        \col2_r[2][6] ) );
  QDFFRBN \col1_r_reg[2][6]  ( .D(n1067), .CK(clk), .RB(n869), .Q(
        \col1_r[2][6] ) );
  QDFFRBN \col2_r_reg[2][5]  ( .D(n1066), .CK(clk), .RB(n869), .Q(
        \col2_r[2][5] ) );
  QDFFRBN \col1_r_reg[2][5]  ( .D(n1065), .CK(clk), .RB(n869), .Q(
        \col1_r[2][5] ) );
  QDFFRBN \col2_r_reg[2][4]  ( .D(n1064), .CK(clk), .RB(n871), .Q(
        \col2_r[2][4] ) );
  QDFFRBN \col1_r_reg[2][4]  ( .D(n1063), .CK(clk), .RB(n871), .Q(
        \col1_r[2][4] ) );
  QDFFRBN \col2_r_reg[2][3]  ( .D(n1062), .CK(clk), .RB(n871), .Q(
        \col2_r[2][3] ) );
  QDFFRBN \col1_r_reg[2][3]  ( .D(n1061), .CK(clk), .RB(n870), .Q(
        \col1_r[2][3] ) );
  QDFFRBN \col2_r_reg[2][2]  ( .D(n1060), .CK(clk), .RB(n870), .Q(
        \col2_r[2][2] ) );
  QDFFRBN \col1_r_reg[2][2]  ( .D(n1059), .CK(clk), .RB(n870), .Q(
        \col1_r[2][2] ) );
  QDFFRBN \col2_r_reg[2][1]  ( .D(n1058), .CK(clk), .RB(n866), .Q(
        \col2_r[2][1] ) );
  QDFFRBN \col1_r_reg[2][1]  ( .D(n1057), .CK(clk), .RB(n866), .Q(
        \col1_r[2][1] ) );
  QDFFRBN \col2_r_reg[2][0]  ( .D(n1056), .CK(clk), .RB(n866), .Q(
        \col2_r[2][0] ) );
  QDFFRBN \col1_r_reg[2][0]  ( .D(n1055), .CK(clk), .RB(n866), .Q(
        \col1_r[2][0] ) );
  QDFFRBN \col2_r_reg[3][7]  ( .D(n1054), .CK(clk), .RB(n866), .Q(
        \col2_r[3][7] ) );
  QDFFRBN \col1_r_reg[3][7]  ( .D(n1053), .CK(clk), .RB(n865), .Q(
        \col1_r[3][7] ) );
  QDFFRBN \col2_r_reg[3][6]  ( .D(n1052), .CK(clk), .RB(n867), .Q(
        \col2_r[3][6] ) );
  QDFFRBN \col1_r_reg[3][6]  ( .D(n1051), .CK(clk), .RB(n867), .Q(
        \col1_r[3][6] ) );
  QDFFRBN \col2_r_reg[3][5]  ( .D(n1050), .CK(clk), .RB(n867), .Q(
        \col2_r[3][5] ) );
  QDFFRBN \col1_r_reg[3][5]  ( .D(n1049), .CK(clk), .RB(n867), .Q(
        \col1_r[3][5] ) );
  QDFFRBN \col2_r_reg[3][4]  ( .D(n1048), .CK(clk), .RB(n867), .Q(
        \col2_r[3][4] ) );
  QDFFRBN \col1_r_reg[3][4]  ( .D(n1047), .CK(clk), .RB(n866), .Q(
        \col1_r[3][4] ) );
  QDFFRBN \col2_r_reg[3][3]  ( .D(n1046), .CK(clk), .RB(n868), .Q(
        \col2_r[3][3] ) );
  QDFFRBN \col1_r_reg[3][3]  ( .D(n1045), .CK(clk), .RB(n868), .Q(
        \col1_r[3][3] ) );
  QDFFRBN \col2_r_reg[3][2]  ( .D(n1044), .CK(clk), .RB(n868), .Q(
        \col2_r[3][2] ) );
  QDFFRBN \col1_r_reg[3][2]  ( .D(n1043), .CK(clk), .RB(n867), .Q(
        \col1_r[3][2] ) );
  QDFFRBN \col2_r_reg[3][1]  ( .D(n1042), .CK(clk), .RB(n892), .Q(
        \col2_r[3][1] ) );
  QDFFRBN \col1_r_reg[3][1]  ( .D(n1041), .CK(clk), .RB(n873), .Q(
        \col1_r[3][1] ) );
  QDFFRBN \col2_r_reg[3][0]  ( .D(n1040), .CK(clk), .RB(n873), .Q(
        \col2_r[3][0] ) );
  QDFFRBN \col1_r_reg[3][0]  ( .D(n1039), .CK(clk), .RB(n873), .Q(
        \col1_r[3][0] ) );
  QDFFRBN \col2_r_reg[4][7]  ( .D(n1038), .CK(clk), .RB(n873), .Q(
        \col2_r[4][7] ) );
  QDFFRBN \col1_r_reg[4][7]  ( .D(n1037), .CK(clk), .RB(n874), .Q(
        \col1_r[4][7] ) );
  QDFFRBN \col2_r_reg[4][6]  ( .D(n1036), .CK(clk), .RB(n874), .Q(
        \col2_r[4][6] ) );
  QDFFRBN \col1_r_reg[4][6]  ( .D(n1035), .CK(clk), .RB(n874), .Q(
        \col1_r[4][6] ) );
  QDFFRBN \col2_r_reg[4][5]  ( .D(n1034), .CK(clk), .RB(n874), .Q(
        \col2_r[4][5] ) );
  QDFFRBN \col1_r_reg[4][5]  ( .D(n1033), .CK(clk), .RB(n874), .Q(
        \col1_r[4][5] ) );
  QDFFRBN \col2_r_reg[4][4]  ( .D(n1032), .CK(clk), .RB(n874), .Q(
        \col2_r[4][4] ) );
  QDFFRBN \col1_r_reg[4][4]  ( .D(n1031), .CK(clk), .RB(n872), .Q(
        \col1_r[4][4] ) );
  QDFFRBN \col2_r_reg[4][3]  ( .D(n1030), .CK(clk), .RB(n871), .Q(
        \col2_r[4][3] ) );
  QDFFRBN \col1_r_reg[4][3]  ( .D(n1029), .CK(clk), .RB(n871), .Q(
        \col1_r[4][3] ) );
  QDFFRBN \col2_r_reg[4][2]  ( .D(n1028), .CK(clk), .RB(n871), .Q(
        \col2_r[4][2] ) );
  QDFFRBN \col1_r_reg[4][2]  ( .D(n1027), .CK(clk), .RB(n880), .Q(
        \col1_r[4][2] ) );
  QDFFRBN \col2_r_reg[4][1]  ( .D(n1026), .CK(clk), .RB(n848), .Q(
        \col2_r[4][1] ) );
  QDFFRBN \col1_r_reg[4][1]  ( .D(n1025), .CK(clk), .RB(n935), .Q(
        \col1_r[4][1] ) );
  QDFFRBN \col2_r_reg[4][0]  ( .D(n1024), .CK(clk), .RB(n872), .Q(
        \col2_r[4][0] ) );
  QDFFRBN \col1_r_reg[4][0]  ( .D(n1023), .CK(clk), .RB(n872), .Q(
        \col1_r[4][0] ) );
  QDFFRBN \col2_r_reg[5][7]  ( .D(n1022), .CK(clk), .RB(n872), .Q(
        \col2_r[5][7] ) );
  QDFFRBN \col1_r_reg[5][7]  ( .D(n1021), .CK(clk), .RB(n872), .Q(
        \col1_r[5][7] ) );
  QDFFRBN \col2_r_reg[5][6]  ( .D(n1020), .CK(clk), .RB(n872), .Q(
        \col2_r[5][6] ) );
  QDFFRBN \col1_r_reg[5][6]  ( .D(n1019), .CK(clk), .RB(n873), .Q(
        \col1_r[5][6] ) );
  QDFFRBN \col2_r_reg[5][5]  ( .D(n1018), .CK(clk), .RB(n891), .Q(
        \col2_r[5][5] ) );
  QDFFRBN \col1_r_reg[5][5]  ( .D(n1017), .CK(clk), .RB(n925), .Q(
        \col1_r[5][5] ) );
  QDFFRBN \col2_r_reg[5][4]  ( .D(n1016), .CK(clk), .RB(n935), .Q(
        \col2_r[5][4] ) );
  QDFFRBN \col1_r_reg[5][4]  ( .D(n1015), .CK(clk), .RB(n891), .Q(
        \col1_r[5][4] ) );
  QDFFRBN \col2_r_reg[5][3]  ( .D(n1014), .CK(clk), .RB(n925), .Q(
        \col2_r[5][3] ) );
  QDFFRBN \col1_r_reg[5][3]  ( .D(n1013), .CK(clk), .RB(n158), .Q(
        \col1_r[5][3] ) );
  QDFFRBN \col2_r_reg[5][2]  ( .D(n1012), .CK(clk), .RB(n161), .Q(
        \col2_r[5][2] ) );
  QDFFRBN \col1_r_reg[5][2]  ( .D(n1011), .CK(clk), .RB(n159), .Q(
        \col1_r[5][2] ) );
  QDFFRBN \col2_r_reg[5][1]  ( .D(n1010), .CK(clk), .RB(n925), .Q(
        \col2_r[5][1] ) );
  QDFFRBN \col1_r_reg[5][1]  ( .D(n1009), .CK(clk), .RB(n894), .Q(
        \col1_r[5][1] ) );
  QDFFRBN \col2_r_reg[5][0]  ( .D(n1008), .CK(clk), .RB(n935), .Q(
        \col2_r[5][0] ) );
  QDFFRBN \col1_r_reg[5][0]  ( .D(n1007), .CK(clk), .RB(n877), .Q(
        \col1_r[5][0] ) );
  QDFFRBN \col2_r_reg[6][7]  ( .D(n1006), .CK(clk), .RB(n877), .Q(
        \col2_r[6][7] ) );
  QDFFRBN \col1_r_reg[6][7]  ( .D(n1005), .CK(clk), .RB(n877), .Q(
        \col1_r[6][7] ) );
  QDFFRBN \col2_r_reg[6][6]  ( .D(n1004), .CK(clk), .RB(n877), .Q(
        \col2_r[6][6] ) );
  QDFFRBN \col1_r_reg[6][6]  ( .D(n1003), .CK(clk), .RB(n877), .Q(
        \col1_r[6][6] ) );
  QDFFRBN \col2_r_reg[6][5]  ( .D(n1002), .CK(clk), .RB(n877), .Q(
        \col2_r[6][5] ) );
  QDFFRBN \col1_r_reg[6][5]  ( .D(n1001), .CK(clk), .RB(n878), .Q(
        \col1_r[6][5] ) );
  QDFFRBN \col2_r_reg[6][4]  ( .D(n1000), .CK(clk), .RB(n878), .Q(
        \col2_r[6][4] ) );
  QDFFRBN \col1_r_reg[6][4]  ( .D(n999), .CK(clk), .RB(n878), .Q(
        \col1_r[6][4] ) );
  QDFFRBN \col2_r_reg[6][3]  ( .D(n998), .CK(clk), .RB(n878), .Q(
        \col2_r[6][3] ) );
  QDFFRBN \col1_r_reg[6][3]  ( .D(n997), .CK(clk), .RB(n878), .Q(
        \col1_r[6][3] ) );
  QDFFRBN \col2_r_reg[6][2]  ( .D(n996), .CK(clk), .RB(n878), .Q(
        \col2_r[6][2] ) );
  QDFFRBN \col1_r_reg[6][2]  ( .D(n995), .CK(clk), .RB(n893), .Q(
        \col1_r[6][2] ) );
  QDFFRBN \col2_r_reg[6][1]  ( .D(n994), .CK(clk), .RB(n896), .Q(
        \col2_r[6][1] ) );
  QDFFRBN \col1_r_reg[6][1]  ( .D(n993), .CK(clk), .RB(n893), .Q(
        \col1_r[6][1] ) );
  QDFFRBN \col2_r_reg[6][0]  ( .D(n992), .CK(clk), .RB(n896), .Q(
        \col2_r[6][0] ) );
  QDFFRBN \col1_r_reg[6][0]  ( .D(n991), .CK(clk), .RB(n893), .Q(
        \col1_r[6][0] ) );
  QDFFRBN \col2_r_reg[7][7]  ( .D(n990), .CK(clk), .RB(n896), .Q(
        \col2_r[7][7] ) );
  QDFFRBN \col1_r_reg[7][7]  ( .D(n989), .CK(clk), .RB(n875), .Q(
        \col1_r[7][7] ) );
  QDFFRBN \col2_r_reg[7][6]  ( .D(n988), .CK(clk), .RB(n875), .Q(
        \col2_r[7][6] ) );
  QDFFRBN \col1_r_reg[7][6]  ( .D(n987), .CK(clk), .RB(n875), .Q(
        \col1_r[7][6] ) );
  QDFFRBN \col2_r_reg[7][5]  ( .D(n986), .CK(clk), .RB(n875), .Q(
        \col2_r[7][5] ) );
  QDFFRBN \col1_r_reg[7][5]  ( .D(n985), .CK(clk), .RB(n875), .Q(
        \col1_r[7][5] ) );
  QDFFRBN \col2_r_reg[7][4]  ( .D(n984), .CK(clk), .RB(n875), .Q(
        \col2_r[7][4] ) );
  QDFFRBN \col1_r_reg[7][4]  ( .D(n983), .CK(clk), .RB(n876), .Q(
        \col1_r[7][4] ) );
  QDFFRBN \col2_r_reg[7][3]  ( .D(n982), .CK(clk), .RB(n876), .Q(
        \col2_r[7][3] ) );
  QDFFRBN \col1_r_reg[7][3]  ( .D(n981), .CK(clk), .RB(n876), .Q(
        \col1_r[7][3] ) );
  QDFFRBN \col2_r_reg[7][2]  ( .D(n980), .CK(clk), .RB(n876), .Q(
        \col2_r[7][2] ) );
  QDFFRBN \col1_r_reg[7][2]  ( .D(n979), .CK(clk), .RB(n876), .Q(
        \col1_r[7][2] ) );
  QDFFRBN \col2_r_reg[7][1]  ( .D(n978), .CK(clk), .RB(n876), .Q(
        \col2_r[7][1] ) );
  QDFFRBN \col1_r_reg[7][1]  ( .D(n977), .CK(clk), .RB(n882), .Q(
        \col1_r[7][1] ) );
  QDFFRBN \col2_r_reg[7][0]  ( .D(n976), .CK(clk), .RB(n892), .Q(
        \col2_r[7][0] ) );
  QDFFRBN \col1_r_reg[7][0]  ( .D(n975), .CK(clk), .RB(n894), .Q(
        \col1_r[7][0] ) );
  QDFFRBN \up_sum_r_reg[8]  ( .D(n926), .CK(clk), .RB(n895), .Q(up_sum_r[8])
         );
  QDFFRBN \up_sum_r_reg[7]  ( .D(n927), .CK(clk), .RB(n894), .Q(up_sum_r[7])
         );
  QDFFRBN \up_sum_r_reg[6]  ( .D(n928), .CK(clk), .RB(n883), .Q(up_sum_r[6])
         );
  QDFFRBN \up_sum_r_reg[5]  ( .D(n929), .CK(clk), .RB(n882), .Q(up_sum_r[5])
         );
  QDFFRBN \up_sum_r_reg[4]  ( .D(n930), .CK(clk), .RB(n882), .Q(up_sum_r[4])
         );
  QDFFRBN \up_sum_r_reg[3]  ( .D(n931), .CK(clk), .RB(n882), .Q(up_sum_r[3])
         );
  QDFFRBN \up_sum_r_reg[2]  ( .D(n932), .CK(clk), .RB(n882), .Q(up_sum_r[2])
         );
  QDFFRBN \up_sum_r_reg[1]  ( .D(n933), .CK(clk), .RB(n882), .Q(up_sum_r[1])
         );
  QDFFRBN \up_sum_r_reg[0]  ( .D(n934), .CK(clk), .RB(n884), .Q(up_sum_r[0])
         );
  QDFFRBN \down_sum_r_reg[8]  ( .D(n936), .CK(clk), .RB(n883), .Q(
        down_sum_r[8]) );
  QDFFRBN \down_sum_r_reg[7]  ( .D(n937), .CK(clk), .RB(n883), .Q(
        down_sum_r[7]) );
  QDFFRBN \down_sum_r_reg[6]  ( .D(n938), .CK(clk), .RB(n883), .Q(
        down_sum_r[6]) );
  QDFFRBN \down_sum_r_reg[5]  ( .D(n939), .CK(clk), .RB(n883), .Q(
        down_sum_r[5]) );
  QDFFRBN \down_sum_r_reg[4]  ( .D(n940), .CK(clk), .RB(n883), .Q(
        down_sum_r[4]) );
  QDFFRBN \down_sum_r_reg[3]  ( .D(n941), .CK(clk), .RB(n879), .Q(
        down_sum_r[3]) );
  QDFFRBN \down_sum_r_reg[2]  ( .D(n942), .CK(clk), .RB(n879), .Q(
        down_sum_r[2]) );
  QDFFRBN \down_sum_r_reg[1]  ( .D(n943), .CK(clk), .RB(n879), .Q(
        down_sum_r[1]) );
  QDFFRBN \down_sum_r_reg[0]  ( .D(n944), .CK(clk), .RB(n879), .Q(
        down_sum_r[0]) );
  QDFFRBN \hor_sum_r_reg[8]  ( .D(n946), .CK(clk), .RB(n879), .Q(hor_sum_r[8])
         );
  QDFFRBN \hor_sum_r_reg[7]  ( .D(n947), .CK(clk), .RB(n879), .Q(hor_sum_r[7])
         );
  QDFFRBN \hor_sum_r_reg[6]  ( .D(n948), .CK(clk), .RB(n881), .Q(hor_sum_r[6])
         );
  QDFFRBN \hor_sum_r_reg[5]  ( .D(n949), .CK(clk), .RB(n880), .Q(hor_sum_r[5])
         );
  QDFFRBN \hor_sum_r_reg[4]  ( .D(n950), .CK(clk), .RB(n880), .Q(hor_sum_r[4])
         );
  QDFFRBN \hor_sum_r_reg[3]  ( .D(n951), .CK(clk), .RB(n880), .Q(hor_sum_r[3])
         );
  QDFFRBN \hor_sum_r_reg[2]  ( .D(n952), .CK(clk), .RB(n880), .Q(hor_sum_r[2])
         );
  QDFFRBN \hor_sum_r_reg[1]  ( .D(n953), .CK(clk), .RB(n880), .Q(hor_sum_r[1])
         );
  QDFFRBN \hor_sum_r_reg[0]  ( .D(n954), .CK(clk), .RB(n895), .Q(hor_sum_r[0])
         );
  QDFFRBN \ver_sum_r_reg[8]  ( .D(n956), .CK(clk), .RB(n881), .Q(ver_sum_r[8])
         );
  QDFFRBN \ver_sum_r_reg[7]  ( .D(n957), .CK(clk), .RB(n881), .Q(ver_sum_r[7])
         );
  QDFFRBN \ver_sum_r_reg[6]  ( .D(n958), .CK(clk), .RB(n881), .Q(ver_sum_r[6])
         );
  QDFFRBN \ver_sum_r_reg[5]  ( .D(n959), .CK(clk), .RB(n881), .Q(ver_sum_r[5])
         );
  QDFFRBN \ver_sum_r_reg[4]  ( .D(n960), .CK(clk), .RB(n881), .Q(ver_sum_r[4])
         );
  QDFFRBN \ver_sum_r_reg[3]  ( .D(n961), .CK(clk), .RB(n888), .Q(ver_sum_r[3])
         );
  QDFFRBN \ver_sum_r_reg[2]  ( .D(n962), .CK(clk), .RB(n887), .Q(ver_sum_r[2])
         );
  QDFFRBN \ver_sum_r_reg[1]  ( .D(n963), .CK(clk), .RB(n887), .Q(ver_sum_r[1])
         );
  QDFFRBN \ver_sum_r_reg[0]  ( .D(n964), .CK(clk), .RB(n887), .Q(ver_sum_r[0])
         );
  QDFFRBN \cen_r_reg[7]  ( .D(n965), .CK(clk), .RB(n887), .Q(cen_r[7]) );
  QDFFRBN \cen_r_reg[6]  ( .D(n966), .CK(clk), .RB(n887), .Q(cen_r[6]) );
  QDFFRBN \cen_r_reg[5]  ( .D(n967), .CK(clk), .RB(n889), .Q(cen_r[5]) );
  QDFFRBN \cen_r_reg[4]  ( .D(n968), .CK(clk), .RB(n888), .Q(cen_r[4]) );
  QDFFRBN \cen_r_reg[3]  ( .D(n969), .CK(clk), .RB(n888), .Q(cen_r[3]) );
  QDFFRBN \cen_r_reg[2]  ( .D(n970), .CK(clk), .RB(n888), .Q(cen_r[2]) );
  QDFFRBN \cen_r_reg[1]  ( .D(n971), .CK(clk), .RB(n888), .Q(cen_r[1]) );
  QDFFRBN \cen_r_reg[0]  ( .D(n974), .CK(clk), .RB(n888), .Q(cen_r[0]) );
  QDFFRBN RGB_valid_r_reg ( .D(RGB_valid_w), .CK(clk), .RB(n890), .Q(RGB_valid) );
  QDFFRBN \G_data_r_reg[7]  ( .D(n922), .CK(clk), .RB(n889), .Q(G_data_r[7])
         );
  QDFFRBN \G_data_r_reg[6]  ( .D(n921), .CK(clk), .RB(n889), .Q(G_data_r[6])
         );
  QDFFRBN \G_data_r_reg[5]  ( .D(n920), .CK(clk), .RB(n889), .Q(G_data_r[5])
         );
  QDFFRBN \G_data_r_reg[4]  ( .D(n919), .CK(clk), .RB(n889), .Q(G_data_r[4])
         );
  QDFFRBN \G_data_r_reg[3]  ( .D(n918), .CK(clk), .RB(n889), .Q(G_data_r[3])
         );
  QDFFRBN \G_data_r_reg[2]  ( .D(n917), .CK(clk), .RB(n885), .Q(G_data_r[2])
         );
  QDFFRBN \G_data_r_reg[1]  ( .D(n916), .CK(clk), .RB(n884), .Q(G_data_r[1])
         );
  QDFFRBN \G_data_r_reg[0]  ( .D(n915), .CK(clk), .RB(n884), .Q(G_data_r[0])
         );
  QDFFRBN \B_data_r_reg[7]  ( .D(n914), .CK(clk), .RB(n884), .Q(B_data_r[7])
         );
  QDFFRBN \B_data_r_reg[6]  ( .D(n913), .CK(clk), .RB(n884), .Q(B_data_r[6])
         );
  QDFFRBN \B_data_r_reg[5]  ( .D(n912), .CK(clk), .RB(n884), .Q(B_data_r[5])
         );
  QDFFRBN \B_data_r_reg[4]  ( .D(n911), .CK(clk), .RB(n886), .Q(B_data_r[4])
         );
  QDFFRBN \B_data_r_reg[3]  ( .D(n910), .CK(clk), .RB(n885), .Q(B_data_r[3])
         );
  QDFFRBN \B_data_r_reg[2]  ( .D(n909), .CK(clk), .RB(n885), .Q(B_data_r[2])
         );
  QDFFRBN \B_data_r_reg[1]  ( .D(n908), .CK(clk), .RB(n885), .Q(B_data_r[1])
         );
  QDFFRBN \B_data_r_reg[0]  ( .D(n907), .CK(clk), .RB(n885), .Q(B_data_r[0])
         );
  QDFFRBN \color_r_reg[1]  ( .D(n906), .CK(clk), .RB(n885), .Q(color[1]) );
  QDFFRBN \color_r_reg[0]  ( .D(n905), .CK(clk), .RB(n887), .Q(color[0]) );
  DFFSBN \state_r_reg[0]  ( .D(state_w[0]), .CK(clk), .SB(n848), .Q(state_r[0]), .QB(n847) );
  QDFFRBN \RGB_data_r_reg[7]  ( .D(n904), .CK(clk), .RB(n886), .Q(RGB_data[7])
         );
  QDFFRBN \RGB_data_r_reg[6]  ( .D(n903), .CK(clk), .RB(n886), .Q(RGB_data[6])
         );
  QDFFRBN \RGB_data_r_reg[5]  ( .D(n902), .CK(clk), .RB(n886), .Q(RGB_data[5])
         );
  QDFFRBN \RGB_data_r_reg[4]  ( .D(n901), .CK(clk), .RB(n886), .Q(RGB_data[4])
         );
  QDFFRBN \RGB_data_r_reg[3]  ( .D(n900), .CK(clk), .RB(n886), .Q(RGB_data[3])
         );
  QDFFRBN \RGB_data_r_reg[2]  ( .D(n899), .CK(clk), .RB(n851), .Q(RGB_data[2])
         );
  QDFFRBN \RGB_data_r_reg[1]  ( .D(n898), .CK(clk), .RB(n851), .Q(RGB_data[1])
         );
  QDFFRBN \RGB_data_r_reg[0]  ( .D(n897), .CK(clk), .RB(n851), .Q(RGB_data[0])
         );
  FA1S \intadd_9/U8  ( .A(down_sum_r[2]), .B(up_sum_r[2]), .CI(\intadd_9/CI ), 
        .CO(\intadd_9/n7 ), .S(\intadd_9/SUM[0] ) );
  FA1S \intadd_9/U7  ( .A(down_sum_r[3]), .B(up_sum_r[3]), .CI(\intadd_9/n7 ), 
        .CO(\intadd_9/n6 ), .S(\intadd_9/SUM[1] ) );
  FA1S \intadd_9/U6  ( .A(down_sum_r[4]), .B(up_sum_r[4]), .CI(\intadd_9/n6 ), 
        .CO(\intadd_9/n5 ), .S(\intadd_9/SUM[2] ) );
  FA1S \intadd_9/U5  ( .A(down_sum_r[5]), .B(up_sum_r[5]), .CI(\intadd_9/n5 ), 
        .CO(\intadd_9/n4 ), .S(\intadd_9/SUM[3] ) );
  FA1S \intadd_9/U4  ( .A(down_sum_r[6]), .B(up_sum_r[6]), .CI(\intadd_9/n4 ), 
        .CO(\intadd_9/n3 ), .S(\intadd_9/SUM[4] ) );
  FA1S \intadd_9/U3  ( .A(down_sum_r[7]), .B(up_sum_r[7]), .CI(\intadd_9/n3 ), 
        .CO(\intadd_9/n2 ), .S(\intadd_9/SUM[5] ) );
  FA1S \intadd_9/U2  ( .A(down_sum_r[8]), .B(up_sum_r[8]), .CI(\intadd_9/n2 ), 
        .CO(\intadd_9/n1 ), .S(\intadd_9/SUM[6] ) );
  FA1S \intadd_10/U8  ( .A(ver_sum_r[2]), .B(hor_sum_r[2]), .CI(\intadd_10/CI ), .CO(\intadd_10/n7 ), .S(\intadd_10/SUM[0] ) );
  FA1S \intadd_10/U7  ( .A(ver_sum_r[3]), .B(hor_sum_r[3]), .CI(\intadd_10/n7 ), .CO(\intadd_10/n6 ), .S(\intadd_10/SUM[1] ) );
  FA1S \intadd_10/U6  ( .A(ver_sum_r[4]), .B(hor_sum_r[4]), .CI(\intadd_10/n6 ), .CO(\intadd_10/n5 ), .S(\intadd_10/SUM[2] ) );
  FA1S \intadd_10/U5  ( .A(ver_sum_r[5]), .B(hor_sum_r[5]), .CI(\intadd_10/n5 ), .CO(\intadd_10/n4 ), .S(\intadd_10/SUM[3] ) );
  FA1S \intadd_10/U4  ( .A(ver_sum_r[6]), .B(hor_sum_r[6]), .CI(\intadd_10/n4 ), .CO(\intadd_10/n3 ), .S(\intadd_10/SUM[4] ) );
  FA1S \intadd_10/U3  ( .A(ver_sum_r[7]), .B(hor_sum_r[7]), .CI(\intadd_10/n3 ), .CO(\intadd_10/n2 ), .S(\intadd_10/SUM[5] ) );
  FA1S \intadd_10/U2  ( .A(ver_sum_r[8]), .B(hor_sum_r[8]), .CI(\intadd_10/n2 ), .CO(\intadd_10/n1 ), .S(\intadd_10/SUM[6] ) );
  FA1S \intadd_11/U7  ( .A(\intadd_11/B[0] ), .B(\intadd_11/A[0] ), .CI(
        \intadd_11/CI ), .CO(\intadd_11/n6 ), .S(\intadd_11/SUM[0] ) );
  FA1S \intadd_11/U6  ( .A(\intadd_11/B[1] ), .B(\intadd_11/A[1] ), .CI(
        \intadd_11/n6 ), .CO(\intadd_11/n5 ), .S(\intadd_11/SUM[1] ) );
  FA1S \intadd_11/U5  ( .A(\intadd_11/B[2] ), .B(\intadd_11/A[2] ), .CI(
        \intadd_11/n5 ), .CO(\intadd_11/n4 ), .S(\intadd_11/SUM[2] ) );
  FA1S \intadd_11/U4  ( .A(\intadd_11/B[3] ), .B(\intadd_11/A[3] ), .CI(
        \intadd_11/n4 ), .CO(\intadd_11/n3 ), .S(\intadd_11/SUM[3] ) );
  FA1S \intadd_11/U3  ( .A(\intadd_11/B[4] ), .B(\intadd_11/A[4] ), .CI(
        \intadd_11/n3 ), .CO(\intadd_11/n2 ), .S(\intadd_11/SUM[4] ) );
  FA1S \intadd_11/U2  ( .A(\intadd_11/B[5] ), .B(\intadd_11/A[5] ), .CI(
        \intadd_11/n2 ), .CO(\intadd_11/n1 ), .S(\intadd_11/SUM[5] ) );
  FA1S \intadd_12/U7  ( .A(\intadd_12/B[0] ), .B(\intadd_12/A[0] ), .CI(
        \intadd_12/CI ), .CO(\intadd_12/n6 ), .S(\intadd_12/SUM[0] ) );
  FA1S \intadd_12/U6  ( .A(\intadd_12/B[1] ), .B(\intadd_12/A[1] ), .CI(
        \intadd_12/n6 ), .CO(\intadd_12/n5 ), .S(\intadd_12/SUM[1] ) );
  FA1S \intadd_12/U5  ( .A(\intadd_12/B[2] ), .B(\intadd_12/A[2] ), .CI(
        \intadd_12/n5 ), .CO(\intadd_12/n4 ), .S(\intadd_12/SUM[2] ) );
  FA1S \intadd_12/U4  ( .A(\intadd_12/B[3] ), .B(\intadd_12/A[3] ), .CI(
        \intadd_12/n4 ), .CO(\intadd_12/n3 ), .S(\intadd_12/SUM[3] ) );
  FA1S \intadd_12/U3  ( .A(\intadd_12/B[4] ), .B(\intadd_12/A[4] ), .CI(
        \intadd_12/n3 ), .CO(\intadd_12/n2 ), .S(\intadd_12/SUM[4] ) );
  FA1S \intadd_12/U2  ( .A(\intadd_12/B[5] ), .B(\intadd_12/A[5] ), .CI(
        \intadd_12/n2 ), .CO(\intadd_12/n1 ), .S(\intadd_12/SUM[5] ) );
  QDFFRBN valid_r_reg ( .D(valid), .CK(clk), .RB(n873), .Q(valid_r) );
  QDFFRBN \data_in_r_reg[7]  ( .D(data_in[7]), .CK(clk), .RB(n863), .Q(
        pixel9[7]) );
  QDFFRBN \data_in_r_reg[6]  ( .D(data_in[6]), .CK(clk), .RB(n851), .Q(
        pixel9[6]) );
  QDFFRBN \data_in_r_reg[5]  ( .D(data_in[5]), .CK(clk), .RB(n850), .Q(
        pixel9[5]) );
  QDFFRBN \data_in_r_reg[4]  ( .D(data_in[4]), .CK(clk), .RB(n850), .Q(
        pixel9[4]) );
  QDFFRBN \data_in_r_reg[3]  ( .D(data_in[3]), .CK(clk), .RB(n852), .Q(
        pixel9[3]) );
  QDFFRBN \data_in_r_reg[2]  ( .D(data_in[2]), .CK(clk), .RB(n852), .Q(
        pixel9[2]) );
  QDFFRBN \data_in_r_reg[1]  ( .D(data_in[1]), .CK(clk), .RB(n852), .Q(
        pixel9[1]) );
  QDFFRBN \data_in_r_reg[0]  ( .D(data_in[0]), .CK(clk), .RB(n852), .Q(
        pixel9[0]) );
  ND3 U3 ( .I1(state_r[0]), .I2(n113), .I3(n485), .O(n479) );
  BUF1 U4 ( .I(n552), .O(n38) );
  BUF1 U5 ( .I(n596), .O(n44) );
  BUF1 U6 ( .I(n594), .O(n58) );
  BUF1 U7 ( .I(n554), .O(n39) );
  BUF1 U8 ( .I(n551), .O(n47) );
  BUF1 U9 ( .I(n562), .O(n40) );
  BUF1 U10 ( .I(n560), .O(n50) );
  BUF1 U11 ( .I(n612), .O(n45) );
  BUF1 U12 ( .I(n610), .O(n60) );
  BUF1 U13 ( .I(n587), .O(n43) );
  BUF1 U14 ( .I(n585), .O(n56) );
  BUF1 U15 ( .I(n580), .O(n42) );
  BUF1 U16 ( .I(n577), .O(n54) );
  BUF1 U17 ( .I(n569), .O(n52) );
  BUF1 U18 ( .I(n571), .O(n41) );
  BUF1 U19 ( .I(n622), .O(n64) );
  BUF1 U20 ( .I(n611), .O(n61) );
  BUF1 U21 ( .I(n595), .O(n59) );
  BUF1 U22 ( .I(n613), .O(n46) );
  ND2 U23 ( .I1(n538), .I2(n541), .O(n117) );
  BUF1 U24 ( .I(n579), .O(n55) );
  ND2 U25 ( .I1(n543), .I2(n544), .O(n599) );
  BUF1 U26 ( .I(n553), .O(n49) );
  ND2 U27 ( .I1(n538), .I2(n541), .O(n602) );
  BUF1 U28 ( .I(n586), .O(n57) );
  BUF1 U29 ( .I(n561), .O(n51) );
  BUF1 U30 ( .I(n570), .O(n53) );
  BUF1 U31 ( .I(n614), .O(n48) );
  ND2 U32 ( .I1(n536), .I2(n545), .O(n542) );
  BUF1 U33 ( .I(n525), .O(n17) );
  BUF1 U34 ( .I(n371), .O(n24) );
  BUF1 U35 ( .I(n601), .O(n78) );
  ND2 U36 ( .I1(n615), .I2(n631), .O(n540) );
  BUF1 U37 ( .I(n842), .O(n77) );
  ND2 U38 ( .I1(n115), .I2(n167), .O(n206) );
  ND2 U39 ( .I1(n497), .I2(n503), .O(n532) );
  ND2 U40 ( .I1(n162), .I2(n809), .O(n167) );
  ND2 U41 ( .I1(state_r[0]), .I2(n487), .O(n531) );
  ND2 U42 ( .I1(counter_r[0]), .I2(n169), .O(n514) );
  ND2 U43 ( .I1(state_r[1]), .I2(n18), .O(n505) );
  ND2 U44 ( .I1(counter_r[0]), .I2(counter_r[1]), .O(n511) );
  BUF1 U45 ( .I(state_r[2]), .O(n21) );
  ND2 U46 ( .I1(state_r[1]), .I2(n847), .O(n528) );
  BUF1 U47 ( .I(n417), .O(n604) );
  BUF1 U48 ( .I(n633), .O(n589) );
  BUF1 U49 ( .I(n735), .O(n574) );
  BUF1 U50 ( .I(n566), .O(n564) );
  BUF1 U51 ( .I(n415), .O(n557) );
  AN3S U52 ( .I1(n746), .I2(n745), .I3(n744), .O(\intadd_11/CI ) );
  AN3S U53 ( .I1(n741), .I2(n740), .I3(n739), .O(\intadd_11/B[0] ) );
  AN3S U54 ( .I1(n757), .I2(n756), .I3(n755), .O(\intadd_11/A[2] ) );
  AN3S U55 ( .I1(n761), .I2(n760), .I3(n759), .O(\intadd_11/B[2] ) );
  AN3S U56 ( .I1(n773), .I2(n772), .I3(n771), .O(\intadd_11/A[4] ) );
  AN3S U57 ( .I1(n778), .I2(n777), .I3(n776), .O(\intadd_11/B[4] ) );
  BUF1 U58 ( .I(n485), .O(n742) );
  BUF1 U59 ( .I(n566), .O(n736) );
  BUF1 U60 ( .I(n582), .O(n743) );
  BUF1 U61 ( .I(n633), .O(n747) );
  ND2S U62 ( .I1(n168), .I2(n169), .O(n179) );
  BUF1 U63 ( .I(n582), .O(n260) );
  ND2S U64 ( .I1(n709), .I2(n708), .O(n706) );
  ND2S U65 ( .I1(n734), .I2(n733), .O(n731) );
  ND2S U66 ( .I1(n543), .I2(n544), .O(n110) );
  ND2S U67 ( .I1(n538), .I2(n541), .O(n118) );
  BUF1 U68 ( .I(n584), .O(n605) );
  BUF1 U69 ( .I(n584), .O(n558) );
  BUF1 U70 ( .I(n485), .O(n623) );
  ND2S U71 ( .I1(n520), .I2(n538), .O(n498) );
  BUF1 U72 ( .I(n206), .O(n705) );
  BUF1 U73 ( .I(n206), .O(n369) );
  BUF1 U74 ( .I(n705), .O(n372) );
  ND2S U75 ( .I1(n198), .I2(n197), .O(n732) );
  BUF1 U76 ( .I(n629), .O(n363) );
  AN3S U77 ( .I1(n750), .I2(n749), .I3(n748), .O(\intadd_11/A[1] ) );
  AN3S U78 ( .I1(n754), .I2(n753), .I3(n752), .O(\intadd_11/B[1] ) );
  AN3S U79 ( .I1(n766), .I2(n765), .I3(n764), .O(\intadd_11/A[3] ) );
  AN3S U80 ( .I1(n769), .I2(n768), .I3(n767), .O(\intadd_11/B[3] ) );
  BUF1 U81 ( .I(n705), .O(n300) );
  AN3S U82 ( .I1(n787), .I2(n786), .I3(n785), .O(\intadd_11/A[5] ) );
  AN3S U83 ( .I1(n796), .I2(n795), .I3(n794), .O(\intadd_11/B[5] ) );
  BUF1 U84 ( .I(n629), .O(n798) );
  BUF1 U85 ( .I(n605), .O(n618) );
  ND2S U86 ( .I1(n78), .I2(n604), .O(n603) );
  BUF1 U87 ( .I(n605), .O(n608) );
  ND2S U88 ( .I1(n601), .I2(n589), .O(n588) );
  BUF1 U89 ( .I(n584), .O(n590) );
  ND2S U90 ( .I1(n78), .I2(n582), .O(n581) );
  BUF1 U91 ( .I(n584), .O(n621) );
  BUF1 U92 ( .I(n576), .O(n578) );
  ND2S U93 ( .I1(n601), .I2(n574), .O(n573) );
  BUF1 U94 ( .I(n576), .O(n583) );
  BUF1 U95 ( .I(n605), .O(n575) );
  ND2S U96 ( .I1(n78), .I2(n564), .O(n565) );
  BUF1 U97 ( .I(n558), .O(n568) );
  BUF1 U98 ( .I(n584), .O(n567) );
  BUF1 U99 ( .I(n558), .O(n559) );
  BUF1 U100 ( .I(n558), .O(n607) );
  ND2S U101 ( .I1(n601), .I2(n557), .O(n556) );
  BUF1 U102 ( .I(n584), .O(n617) );
  BUF1 U103 ( .I(n559), .O(n606) );
  BUF1 U104 ( .I(n605), .O(n576) );
  BUF1 U105 ( .I(n558), .O(n593) );
  ND2S U106 ( .I1(n78), .I2(n549), .O(n547) );
  BUF1 U107 ( .I(n558), .O(n600) );
  ND2S U108 ( .I1(n544), .I2(n549), .O(n539) );
  BUF1 U109 ( .I(n593), .O(n550) );
  BUF1 U110 ( .I(n558), .O(n592) );
  BUF1 U111 ( .I(n710), .O(n801) );
  ND2S U112 ( .I1(logic_state_r[0]), .I2(n20), .O(n811) );
  ND2S U113 ( .I1(n21), .I2(n503), .O(n518) );
  ND2S U114 ( .I1(n20), .I2(n510), .O(n375) );
  ND2S U115 ( .I1(n116), .I2(n519), .O(n409) );
  ND2S U116 ( .I1(n115), .I2(n540), .O(n484) );
  ND2S U117 ( .I1(counter_r[1]), .I2(n168), .O(n513) );
  ND2S U118 ( .I1(n535), .I2(n473), .O(n475) );
  ND2S U119 ( .I1(n115), .I2(n530), .O(n515) );
  ND2S U120 ( .I1(n105), .I2(hor_sum_r[1]), .O(n383) );
  ND2S U121 ( .I1(n104), .I2(hor_sum_r[2]), .O(n380) );
  ND2S U122 ( .I1(n373), .I2(hor_sum_r[3]), .O(n386) );
  ND2S U123 ( .I1(n104), .I2(hor_sum_r[4]), .O(n389) );
  ND2S U124 ( .I1(n105), .I2(hor_sum_r[5]), .O(n392) );
  ND2S U125 ( .I1(n373), .I2(hor_sum_r[6]), .O(n401) );
  ND2S U126 ( .I1(n104), .I2(hor_sum_r[7]), .O(n407) );
  OR3B2S U127 ( .I1(n409), .B1(n508), .B2(n487), .O(n410) );
  OA112 U128 ( .C1(n555), .C2(n598), .A1(n613), .B1(n117), .O(n1) );
  OA112 U129 ( .C1(n572), .C2(n25), .A1(n613), .B1(n602), .O(n2) );
  OA112 U130 ( .C1(n775), .C2(n598), .A1(n613), .B1(n118), .O(n3) );
  AN2 U131 ( .I1(n572), .I2(n525), .O(n4) );
  AN2 U132 ( .I1(n521), .I2(n525), .O(n5) );
  AN2 U133 ( .I1(n524), .I2(n525), .O(n6) );
  AN2 U134 ( .I1(n522), .I2(n17), .O(n7) );
  AN2 U135 ( .I1(n523), .I2(n17), .O(n8) );
  AN2 U136 ( .I1(n155), .I2(n17), .O(n9) );
  OA112 U137 ( .C1(n632), .C2(n25), .A1(n46), .B1(n602), .O(n10) );
  OA112 U138 ( .C1(n774), .C2(n25), .A1(n46), .B1(n117), .O(n11) );
  AN2 U139 ( .I1(n615), .I2(n614), .O(n12) );
  OA112 U140 ( .C1(n563), .C2(n25), .A1(n46), .B1(n118), .O(n13) );
  OR2 U141 ( .I1(logic_state_r[0]), .I2(n375), .O(n14) );
  NR2 U142 ( .I1(n106), .I2(n127), .O(n15) );
  OA12 U143 ( .B1(n510), .B2(n811), .A1(n809), .O(n16) );
  ND3 U144 ( .I1(logic_state_r[1]), .I2(logic_state_r[2]), .I3(n509), .O(n162)
         );
  INV1S U145 ( .I(n847), .O(n18) );
  INV1S U146 ( .I(logic_state_r[2]), .O(n19) );
  INV1S U147 ( .I(n19), .O(n20) );
  INV1S U148 ( .I(counter_r[2]), .O(n22) );
  INV1S U149 ( .I(n22), .O(n23) );
  INV1S U150 ( .I(n544), .O(n25) );
  INV1S U151 ( .I(n1), .O(n26) );
  INV1S U152 ( .I(n1), .O(n27) );
  INV1S U153 ( .I(n13), .O(n28) );
  INV1S U154 ( .I(n13), .O(n29) );
  INV1S U155 ( .I(n2), .O(n30) );
  INV1S U156 ( .I(n2), .O(n31) );
  INV1S U157 ( .I(n10), .O(n32) );
  INV1S U158 ( .I(n10), .O(n33) );
  INV1S U159 ( .I(n3), .O(n34) );
  INV1S U160 ( .I(n3), .O(n35) );
  INV1S U161 ( .I(n11), .O(n36) );
  INV1S U162 ( .I(n11), .O(n37) );
  INV1S U163 ( .I(n12), .O(n62) );
  INV1S U164 ( .I(n12), .O(n63) );
  INV1S U165 ( .I(n15), .O(n65) );
  INV1S U166 ( .I(n15), .O(n66) );
  INV1S U167 ( .I(n131), .O(n67) );
  INV1S U168 ( .I(n134), .O(n68) );
  INV1S U169 ( .I(n137), .O(n69) );
  INV1S U170 ( .I(n140), .O(n70) );
  INV1S U171 ( .I(n143), .O(n71) );
  INV1S U172 ( .I(n146), .O(n72) );
  INV1S U173 ( .I(n149), .O(n73) );
  INV1S U174 ( .I(n152), .O(n74) );
  INV1S U175 ( .I(n16), .O(n75) );
  INV1S U176 ( .I(n16), .O(n76) );
  INV1S U177 ( .I(n162), .O(n79) );
  INV1S U178 ( .I(n162), .O(n80) );
  INV1S U179 ( .I(n9), .O(n81) );
  INV1S U180 ( .I(n9), .O(n82) );
  INV1S U181 ( .I(n9), .O(n83) );
  INV1S U182 ( .I(n5), .O(n84) );
  INV1S U183 ( .I(n5), .O(n85) );
  INV1S U184 ( .I(n5), .O(n86) );
  INV1S U185 ( .I(n7), .O(n87) );
  INV1S U186 ( .I(n7), .O(n88) );
  INV1S U187 ( .I(n7), .O(n89) );
  INV1S U188 ( .I(n4), .O(n90) );
  INV1S U189 ( .I(n4), .O(n91) );
  INV1S U190 ( .I(n4), .O(n92) );
  INV1S U191 ( .I(n8), .O(n93) );
  INV1S U192 ( .I(n8), .O(n94) );
  INV1S U193 ( .I(n8), .O(n95) );
  INV1S U194 ( .I(n6), .O(n96) );
  INV1S U195 ( .I(n6), .O(n97) );
  INV1S U196 ( .I(n6), .O(n98) );
  INV1S U197 ( .I(n508), .O(n99) );
  INV1S U198 ( .I(n99), .O(n100) );
  INV1S U199 ( .I(n99), .O(n101) );
  INV1S U200 ( .I(n99), .O(n102) );
  INV1S U201 ( .I(n373), .O(n103) );
  INV1S U202 ( .I(n103), .O(n104) );
  INV1S U203 ( .I(n103), .O(n105) );
  INV1S U204 ( .I(n14), .O(n106) );
  INV1S U205 ( .I(n14), .O(n107) );
  INV1S U206 ( .I(n14), .O(n108) );
  BUF1 U207 ( .I(n520), .O(n109) );
  BUF1 U208 ( .I(n616), .O(n111) );
  INV1S U209 ( .I(n376), .O(n112) );
  INV1S U210 ( .I(state_r[3]), .O(n113) );
  INV1S U211 ( .I(valid_r), .O(n114) );
  INV1S U212 ( .I(n114), .O(n115) );
  INV1S U213 ( .I(n114), .O(n116) );
  ND3 U214 ( .I1(n545), .I2(n116), .I3(n25), .O(n548) );
  AN2 U215 ( .I1(n526), .I2(n17), .O(n527) );
  INV1S U216 ( .I(n527), .O(n119) );
  INV1S U217 ( .I(n527), .O(n120) );
  INV1S U218 ( .I(n527), .O(n121) );
  AN2 U219 ( .I1(n615), .I2(n46), .O(n620) );
  INV1S U220 ( .I(n620), .O(n122) );
  INV1S U221 ( .I(n620), .O(n123) );
  INV1S U222 ( .I(n620), .O(n124) );
  INV1S U223 ( .I(n377), .O(n841) );
  INV1S U224 ( .I(n841), .O(n125) );
  INV1S U225 ( .I(n841), .O(n126) );
  INV1S U226 ( .I(n374), .O(n840) );
  INV1S U227 ( .I(n840), .O(n127) );
  INV1S U228 ( .I(n840), .O(n128) );
  INV1S U229 ( .I(pixel9[7]), .O(n129) );
  INV1S U230 ( .I(n129), .O(n130) );
  INV1S U231 ( .I(n129), .O(n131) );
  INV1S U232 ( .I(pixel9[6]), .O(n132) );
  INV1S U233 ( .I(n132), .O(n133) );
  INV1S U234 ( .I(n132), .O(n134) );
  INV1S U235 ( .I(pixel9[5]), .O(n135) );
  INV1S U236 ( .I(n135), .O(n136) );
  INV1S U237 ( .I(n135), .O(n137) );
  INV1S U238 ( .I(pixel9[4]), .O(n138) );
  INV1S U239 ( .I(n138), .O(n139) );
  INV1S U240 ( .I(n138), .O(n140) );
  INV1S U241 ( .I(pixel9[3]), .O(n141) );
  INV1S U242 ( .I(n141), .O(n142) );
  INV1S U243 ( .I(n141), .O(n143) );
  INV1S U244 ( .I(pixel9[2]), .O(n144) );
  INV1S U245 ( .I(n144), .O(n145) );
  INV1S U246 ( .I(n144), .O(n146) );
  INV1S U247 ( .I(pixel9[1]), .O(n147) );
  INV1S U248 ( .I(n147), .O(n148) );
  INV1S U249 ( .I(n147), .O(n149) );
  INV1S U250 ( .I(pixel9[0]), .O(n150) );
  INV1S U251 ( .I(n150), .O(n151) );
  INV1S U252 ( .I(n150), .O(n152) );
  OR2 U253 ( .I1(n23), .I2(n179), .O(n529) );
  INV1S U254 ( .I(n529), .O(n153) );
  INV1S U255 ( .I(n529), .O(n154) );
  INV1S U256 ( .I(n529), .O(n155) );
  BUF1 U257 ( .I(n735), .O(n422) );
  BUF1 U258 ( .I(n417), .O(n597) );
  HA1 U259 ( .A(n151), .B(n711), .C(n714), .S(n712) );
  BUF1 U260 ( .I(n206), .O(n629) );
  BUF1 U261 ( .I(n629), .O(n710) );
  BUF1 U262 ( .I(n206), .O(n370) );
  BUF1 U263 ( .I(n206), .O(n371) );
  BUF1 U264 ( .I(n605), .O(n591) );
  BUF1 U265 ( .I(n559), .O(n609) );
  BUF1 U266 ( .I(n605), .O(n619) );
  BUF1 U267 ( .I(n629), .O(n658) );
  ND3 U268 ( .I1(n395), .I2(n476), .I3(n116), .O(n396) );
  BUF1 U269 ( .I(n158), .O(n161) );
  BUF1 U270 ( .I(n892), .O(n886) );
  BUF1 U271 ( .I(n892), .O(n885) );
  BUF1 U272 ( .I(n891), .O(n889) );
  BUF1 U273 ( .I(n894), .O(n881) );
  BUF1 U274 ( .I(n893), .O(n884) );
  BUF1 U275 ( .I(n935), .O(n895) );
  BUF1 U276 ( .I(n895), .O(n875) );
  BUF1 U277 ( .I(n890), .O(n878) );
  BUF1 U278 ( .I(rst_n), .O(n935) );
  BUF1 U279 ( .I(n896), .O(n874) );
  BUF1 U280 ( .I(n157), .O(n867) );
  BUF1 U281 ( .I(n925), .O(n871) );
  BUF1 U282 ( .I(n157), .O(n868) );
  BUF1 U283 ( .I(n160), .O(n861) );
  BUF1 U284 ( .I(n157), .O(n865) );
  BUF1 U285 ( .I(n160), .O(n863) );
  BUF1 U286 ( .I(n158), .O(n855) );
  BUF1 U287 ( .I(n159), .O(n858) );
  BUF1 U288 ( .I(n161), .O(n850) );
  BUF1 U289 ( .I(n891), .O(n890) );
  BUF1 U290 ( .I(n161), .O(n851) );
  INV1S U291 ( .I(state_r[3]), .O(n503) );
  NR2 U292 ( .I1(state_r[2]), .I2(n503), .O(n519) );
  INV1S U293 ( .I(logic_state_r[1]), .O(n510) );
  OA12 U294 ( .B1(n528), .B2(n409), .A1(n375), .O(n156) );
  INV1S U295 ( .I(logic_state_r[0]), .O(n509) );
  NR2 U296 ( .I1(n20), .I2(n510), .O(n804) );
  INV1S U297 ( .I(n804), .O(n376) );
  ND3 U298 ( .I1(n156), .I2(n509), .I3(n376), .O(n1164) );
  BUF1 U299 ( .I(n935), .O(n925) );
  BUF1 U300 ( .I(n925), .O(n891) );
  BUF1 U301 ( .I(n891), .O(n877) );
  BUF1 U302 ( .I(n895), .O(n876) );
  BUF1 U303 ( .I(rst_n), .O(n158) );
  BUF1 U304 ( .I(n161), .O(n849) );
  BUF1 U305 ( .I(n935), .O(n896) );
  BUF1 U306 ( .I(n896), .O(n893) );
  BUF1 U307 ( .I(n893), .O(n882) );
  BUF1 U308 ( .I(n893), .O(n883) );
  BUF1 U309 ( .I(n890), .O(n879) );
  BUF1 U310 ( .I(n895), .O(n894) );
  BUF1 U311 ( .I(n158), .O(n160) );
  BUF1 U312 ( .I(n160), .O(n860) );
  BUF1 U313 ( .I(n160), .O(n864) );
  BUF1 U314 ( .I(n158), .O(n157) );
  BUF1 U315 ( .I(n157), .O(n869) );
  BUF1 U316 ( .I(n157), .O(n870) );
  BUF1 U317 ( .I(n158), .O(n159) );
  BUF1 U318 ( .I(n159), .O(n856) );
  BUF1 U319 ( .I(n160), .O(n862) );
  BUF1 U320 ( .I(n157), .O(n866) );
  BUF1 U321 ( .I(n159), .O(n853) );
  BUF1 U322 ( .I(n159), .O(n854) );
  BUF1 U323 ( .I(n894), .O(n880) );
  BUF1 U324 ( .I(n161), .O(n848) );
  BUF1 U325 ( .I(n160), .O(n859) );
  BUF1 U326 ( .I(n925), .O(n872) );
  BUF1 U327 ( .I(n159), .O(n857) );
  BUF1 U328 ( .I(n891), .O(n888) );
  BUF1 U329 ( .I(n161), .O(n852) );
  BUF1 U330 ( .I(n896), .O(n873) );
  BUF1 U331 ( .I(n894), .O(n892) );
  BUF1 U332 ( .I(n892), .O(n887) );
  INV1S U333 ( .I(n811), .O(n163) );
  NR2 U334 ( .I1(n79), .I2(n163), .O(n166) );
  INV1S U335 ( .I(col_last), .O(n164) );
  ND3 U336 ( .I1(n509), .I2(n510), .I3(n19), .O(n809) );
  OR2 U337 ( .I1(n163), .I2(n167), .O(n508) );
  MOAI1S U338 ( .A1(n166), .A2(n164), .B1(col_last_buf_r), .B2(n99), .O(n972)
         );
  INV1S U339 ( .I(pic_last), .O(n165) );
  MOAI1S U340 ( .A1(n166), .A2(n165), .B1(pic_last_buf_r), .B2(n99), .O(n923)
         );
  OR2 U341 ( .I1(n23), .I2(n511), .O(n735) );
  INV1S U342 ( .I(n422), .O(n416) );
  INV1S U343 ( .I(counter_r[0]), .O(n168) );
  OR2 U344 ( .I1(counter_r[2]), .I2(n513), .O(n566) );
  INV1S U345 ( .I(n736), .O(n423) );
  AOI22S U346 ( .A1(n416), .A2(\col3_r[1][0] ), .B1(n423), .B2(\col3_r[0][0] ), 
        .O(n172) );
  NR2 U347 ( .I1(n22), .I2(n511), .O(n348) );
  INV1S U348 ( .I(n348), .O(n485) );
  INV1S U349 ( .I(n742), .O(n737) );
  OR2 U350 ( .I1(n22), .I2(n513), .O(n417) );
  INV1S U351 ( .I(n597), .O(n781) );
  AOI22S U352 ( .A1(n737), .A2(\col3_r[5][0] ), .B1(n781), .B2(\col3_r[4][0] ), 
        .O(n171) );
  INV1S U353 ( .I(counter_r[1]), .O(n169) );
  OR2 U354 ( .I1(n22), .I2(n179), .O(n582) );
  INV1S U355 ( .I(n743), .O(n738) );
  OR2 U356 ( .I1(n22), .I2(n514), .O(n633) );
  INV1S U357 ( .I(n633), .O(n770) );
  AOI22S U358 ( .A1(n738), .A2(\col3_r[2][0] ), .B1(n770), .B2(\col3_r[3][0] ), 
        .O(n170) );
  ND3 U359 ( .I1(n172), .I2(n171), .I3(n170), .O(n198) );
  AOI22S U360 ( .A1(n416), .A2(\col1_r[1][0] ), .B1(n423), .B2(\col1_r[0][0] ), 
        .O(n175) );
  AOI22S U361 ( .A1(n737), .A2(\col1_r[5][0] ), .B1(n781), .B2(\col1_r[4][0] ), 
        .O(n174) );
  INV1S U362 ( .I(n747), .O(n436) );
  AOI22S U363 ( .A1(n738), .A2(\col1_r[2][0] ), .B1(n436), .B2(\col1_r[3][0] ), 
        .O(n173) );
  ND3 U364 ( .I1(n175), .I2(n174), .I3(n173), .O(n197) );
  MOAI1S U365 ( .A1(n198), .A2(n197), .B1(n198), .B2(n197), .O(n176) );
  MOAI1S U366 ( .A1(n363), .A2(n176), .B1(up_sum_r[0]), .B2(n371), .O(n934) );
  INV1S U367 ( .I(n743), .O(n784) );
  INV1S U368 ( .I(n747), .O(n775) );
  AOI22S U369 ( .A1(n784), .A2(\col2_r[4][0] ), .B1(n775), .B2(\col2_r[5][0] ), 
        .O(n178) );
  NR2 U370 ( .I1(counter_r[2]), .I2(n514), .O(n644) );
  INV1S U371 ( .I(n644), .O(n415) );
  INV1S U372 ( .I(n557), .O(n555) );
  INV1S U373 ( .I(n623), .O(n320) );
  AOI22S U374 ( .A1(n555), .A2(\col2_r[1][0] ), .B1(n320), .B2(\col2_r[7][0] ), 
        .O(n177) );
  AN2 U375 ( .I1(n178), .I2(n177), .O(n182) );
  INV1S U376 ( .I(n422), .O(n780) );
  AOI22S U377 ( .A1(n780), .A2(\col2_r[3][0] ), .B1(n781), .B2(\col2_r[6][0] ), 
        .O(n181) );
  INV1S U378 ( .I(n736), .O(n287) );
  AOI22S U379 ( .A1(n287), .A2(\col2_r[2][0] ), .B1(n154), .B2(\col2_r[0][0] ), 
        .O(n180) );
  ND3 U380 ( .I1(n182), .I2(n181), .I3(n180), .O(n297) );
  INV1S U381 ( .I(n574), .O(n291) );
  INV1S U382 ( .I(n566), .O(n639) );
  AOI22S U383 ( .A1(n291), .A2(\col2_r[1][0] ), .B1(n639), .B2(\col2_r[0][0] ), 
        .O(n185) );
  INV1S U384 ( .I(n623), .O(n292) );
  INV1S U385 ( .I(n604), .O(n328) );
  AOI22S U386 ( .A1(n292), .A2(\col2_r[5][0] ), .B1(n328), .B2(\col2_r[4][0] ), 
        .O(n184) );
  INV1S U387 ( .I(n589), .O(n624) );
  AOI22S U388 ( .A1(n738), .A2(\col2_r[2][0] ), .B1(n624), .B2(\col2_r[3][0] ), 
        .O(n183) );
  ND3 U389 ( .I1(n185), .I2(n184), .I3(n183), .O(n296) );
  INV1S U390 ( .I(n186), .O(n187) );
  MOAI1S U391 ( .A1(n372), .A2(n187), .B1(n24), .B2(ver_sum_r[0]), .O(n964) );
  INV1S U392 ( .I(n415), .O(n683) );
  INV1S U393 ( .I(n735), .O(n789) );
  INV1S U394 ( .I(n564), .O(n675) );
  AOI22S U395 ( .A1(n789), .A2(\col3_r[2][0] ), .B1(n675), .B2(\col3_r[1][0] ), 
        .O(n190) );
  INV1S U396 ( .I(n417), .O(n668) );
  INV1S U397 ( .I(n582), .O(n667) );
  AOI22S U398 ( .A1(n668), .A2(\col3_r[5][0] ), .B1(n667), .B2(\col3_r[3][0] ), 
        .O(n189) );
  INV1S U399 ( .I(n742), .O(n678) );
  INV1S U400 ( .I(n747), .O(n792) );
  AOI22S U401 ( .A1(n678), .A2(\col3_r[6][0] ), .B1(n792), .B2(\col3_r[4][0] ), 
        .O(n188) );
  ND3 U402 ( .I1(n190), .I2(n189), .I3(n188), .O(n191) );
  OAI22S U403 ( .A1(n683), .A2(n191), .B1(\col3_r[0][0] ), .B2(n191), .O(n213)
         );
  INV1S U404 ( .I(n415), .O(n472) );
  INV1S U405 ( .I(n564), .O(n788) );
  AOI22S U406 ( .A1(n789), .A2(\col1_r[2][0] ), .B1(n788), .B2(\col1_r[1][0] ), 
        .O(n194) );
  AOI22S U407 ( .A1(n668), .A2(\col1_r[5][0] ), .B1(n667), .B2(\col1_r[3][0] ), 
        .O(n193) );
  AOI22S U408 ( .A1(n678), .A2(\col1_r[6][0] ), .B1(n792), .B2(\col1_r[4][0] ), 
        .O(n192) );
  ND3 U409 ( .I1(n194), .I2(n193), .I3(n192), .O(n195) );
  OAI22S U410 ( .A1(n472), .A2(n195), .B1(\col1_r[0][0] ), .B2(n195), .O(n212)
         );
  MOAI1S U411 ( .A1(n213), .A2(n212), .B1(n213), .B2(n212), .O(n196) );
  MOAI1S U412 ( .A1(n369), .A2(n196), .B1(hor_sum_r[0]), .B2(n370), .O(n954)
         );
  AOI22S U413 ( .A1(n416), .A2(\col3_r[1][1] ), .B1(n423), .B2(\col3_r[0][1] ), 
        .O(n201) );
  INV1S U414 ( .I(n604), .O(n790) );
  AOI22S U415 ( .A1(n737), .A2(\col3_r[5][1] ), .B1(n790), .B2(\col3_r[4][1] ), 
        .O(n200) );
  AOI22S U416 ( .A1(n738), .A2(\col3_r[2][1] ), .B1(n770), .B2(\col3_r[3][1] ), 
        .O(n199) );
  ND3 U417 ( .I1(n201), .I2(n200), .I3(n199), .O(n733) );
  MOAI1S U418 ( .A1(n732), .A2(n733), .B1(n732), .B2(n733), .O(n205) );
  AOI22S U419 ( .A1(n416), .A2(\col1_r[1][1] ), .B1(\col1_r[0][1] ), .B2(n287), 
        .O(n204) );
  AOI22S U420 ( .A1(n737), .A2(\col1_r[5][1] ), .B1(n781), .B2(\col1_r[4][1] ), 
        .O(n203) );
  AOI22S U421 ( .A1(\col1_r[2][1] ), .A2(n784), .B1(\col1_r[3][1] ), .B2(n775), 
        .O(n202) );
  ND3 U422 ( .I1(n204), .I2(n203), .I3(n202), .O(n734) );
  MOAI1S U423 ( .A1(n205), .A2(n734), .B1(n205), .B2(n734), .O(n207) );
  BUF1 U424 ( .I(n206), .O(n310) );
  MOAI1S U425 ( .A1(n363), .A2(n207), .B1(up_sum_r[1]), .B2(n310), .O(n933) );
  MOAI1S U426 ( .A1(\intadd_11/SUM[0] ), .A2(n300), .B1(up_sum_r[2]), .B2(n310), .O(n932) );
  INV1S U427 ( .I(n422), .O(n466) );
  AOI22S U428 ( .A1(n466), .A2(\col1_r[2][1] ), .B1(\col1_r[1][1] ), .B2(n287), 
        .O(n210) );
  INV1S U429 ( .I(n597), .O(n677) );
  INV1S U430 ( .I(n260), .O(n646) );
  AOI22S U431 ( .A1(n677), .A2(\col1_r[5][1] ), .B1(n646), .B2(\col1_r[3][1] ), 
        .O(n209) );
  AOI22S U432 ( .A1(n678), .A2(\col1_r[6][1] ), .B1(\col1_r[4][1] ), .B2(n775), 
        .O(n208) );
  ND3 U433 ( .I1(n210), .I2(n209), .I3(n208), .O(n211) );
  INV1S U434 ( .I(n415), .O(n495) );
  OAI22S U435 ( .A1(\col1_r[0][1] ), .A2(n211), .B1(n495), .B2(n211), .O(n707)
         );
  NR2 U436 ( .I1(n213), .I2(n212), .O(n709) );
  AOI22S U437 ( .A1(n466), .A2(\col3_r[2][1] ), .B1(n788), .B2(\col3_r[1][1] ), 
        .O(n216) );
  INV1S U438 ( .I(n260), .O(n676) );
  AOI22S U439 ( .A1(n668), .A2(\col3_r[5][1] ), .B1(n676), .B2(\col3_r[3][1] ), 
        .O(n215) );
  INV1S U440 ( .I(n742), .O(n467) );
  AOI22S U441 ( .A1(n467), .A2(\col3_r[6][1] ), .B1(n792), .B2(\col3_r[4][1] ), 
        .O(n214) );
  ND3 U442 ( .I1(n216), .I2(n215), .I3(n214), .O(n217) );
  AO12 U443 ( .B1(n495), .B2(\col3_r[0][1] ), .A1(n217), .O(n708) );
  MOAI1S U444 ( .A1(n709), .A2(n708), .B1(n709), .B2(n708), .O(n218) );
  MOAI1S U445 ( .A1(n707), .A2(n218), .B1(n707), .B2(n218), .O(n219) );
  MOAI1S U446 ( .A1(n369), .A2(n219), .B1(hor_sum_r[1]), .B2(n310), .O(n953)
         );
  MOAI1S U447 ( .A1(\intadd_11/SUM[1] ), .A2(n300), .B1(up_sum_r[3]), .B2(n310), .O(n931) );
  MOAI1S U448 ( .A1(\intadd_12/SUM[0] ), .A2(n300), .B1(hor_sum_r[2]), .B2(
        n370), .O(n952) );
  MOAI1S U449 ( .A1(\intadd_11/SUM[2] ), .A2(n300), .B1(up_sum_r[4]), .B2(n310), .O(n930) );
  MOAI1S U450 ( .A1(\intadd_12/SUM[1] ), .A2(n372), .B1(hor_sum_r[3]), .B2(
        n370), .O(n951) );
  INV1S U451 ( .I(n623), .O(n615) );
  AOI22S U452 ( .A1(n615), .A2(\col1_r[7][5] ), .B1(n555), .B2(\col1_r[1][5] ), 
        .O(n224) );
  INV1S U453 ( .I(n743), .O(n350) );
  INV1S U454 ( .I(n589), .O(n337) );
  AOI22S U455 ( .A1(n350), .A2(\col1_r[4][5] ), .B1(n337), .B2(\col1_r[5][5] ), 
        .O(n223) );
  INV1S U456 ( .I(n417), .O(n347) );
  AOI22S U457 ( .A1(n291), .A2(\col1_r[3][5] ), .B1(n347), .B2(\col1_r[6][5] ), 
        .O(n221) );
  INV1S U458 ( .I(n736), .O(n563) );
  AOI22S U459 ( .A1(n563), .A2(\col1_r[2][5] ), .B1(n154), .B2(\col1_r[0][5] ), 
        .O(n220) );
  AN2 U460 ( .I1(n221), .I2(n220), .O(n222) );
  ND3 U461 ( .I1(n224), .I2(n223), .I3(n222), .O(n307) );
  INV1S U462 ( .I(n742), .O(n782) );
  AOI22S U463 ( .A1(n782), .A2(\col1_r[7][4] ), .B1(n555), .B2(\col1_r[1][4] ), 
        .O(n229) );
  INV1S U464 ( .I(n743), .O(n338) );
  INV1S U465 ( .I(n589), .O(n524) );
  AOI22S U466 ( .A1(n338), .A2(\col1_r[4][4] ), .B1(n524), .B2(\col1_r[5][4] ), 
        .O(n228) );
  INV1S U467 ( .I(n735), .O(n346) );
  INV1S U468 ( .I(n604), .O(n341) );
  AOI22S U469 ( .A1(n346), .A2(\col1_r[3][4] ), .B1(n341), .B2(\col1_r[6][4] ), 
        .O(n226) );
  AOI22S U470 ( .A1(n563), .A2(\col1_r[2][4] ), .B1(n155), .B2(\col1_r[0][4] ), 
        .O(n225) );
  AN2 U471 ( .I1(n226), .I2(n225), .O(n227) );
  ND3 U472 ( .I1(n229), .I2(n228), .I3(n227), .O(n728) );
  INV1S U473 ( .I(n485), .O(n393) );
  INV1S U474 ( .I(n557), .O(n521) );
  AOI22S U475 ( .A1(n393), .A2(\col1_r[7][3] ), .B1(n521), .B2(\col1_r[1][3] ), 
        .O(n234) );
  AOI22S U476 ( .A1(n338), .A2(\col1_r[4][3] ), .B1(n337), .B2(\col1_r[5][3] ), 
        .O(n233) );
  INV1S U477 ( .I(n574), .O(n324) );
  AOI22S U478 ( .A1(n324), .A2(\col1_r[3][3] ), .B1(n347), .B2(\col1_r[6][3] ), 
        .O(n231) );
  AOI22S U479 ( .A1(n563), .A2(\col1_r[2][3] ), .B1(n153), .B2(\col1_r[0][3] ), 
        .O(n230) );
  AN2 U480 ( .I1(n231), .I2(n230), .O(n232) );
  ND3 U481 ( .I1(n234), .I2(n233), .I3(n232), .O(n724) );
  AOI22S U482 ( .A1(n393), .A2(\col1_r[7][2] ), .B1(n555), .B2(\col1_r[1][2] ), 
        .O(n239) );
  AOI22S U483 ( .A1(n350), .A2(\col1_r[4][2] ), .B1(n337), .B2(\col1_r[5][2] ), 
        .O(n238) );
  AOI22S U484 ( .A1(n324), .A2(\col1_r[3][2] ), .B1(n341), .B2(\col1_r[6][2] ), 
        .O(n236) );
  INV1S U485 ( .I(n736), .O(n342) );
  AOI22S U486 ( .A1(n342), .A2(\col1_r[2][2] ), .B1(n154), .B2(\col1_r[0][2] ), 
        .O(n235) );
  AN2 U487 ( .I1(n236), .I2(n235), .O(n237) );
  ND3 U488 ( .I1(n239), .I2(n238), .I3(n237), .O(n720) );
  AOI22S U489 ( .A1(n393), .A2(\col1_r[7][1] ), .B1(n521), .B2(\col1_r[1][1] ), 
        .O(n244) );
  INV1S U490 ( .I(n260), .O(n523) );
  AOI22S U491 ( .A1(\col1_r[5][1] ), .A2(n775), .B1(n523), .B2(\col1_r[4][1] ), 
        .O(n243) );
  AOI22S U492 ( .A1(n324), .A2(\col1_r[3][1] ), .B1(n341), .B2(\col1_r[6][1] ), 
        .O(n241) );
  INV1S U493 ( .I(n736), .O(n779) );
  AOI22S U494 ( .A1(\col1_r[0][1] ), .A2(n155), .B1(n779), .B2(\col1_r[2][1] ), 
        .O(n240) );
  AN2 U495 ( .I1(n241), .I2(n240), .O(n242) );
  ND3 U496 ( .I1(n244), .I2(n243), .I3(n242), .O(n715) );
  AOI22S U497 ( .A1(n393), .A2(\col1_r[7][0] ), .B1(n521), .B2(\col1_r[1][0] ), 
        .O(n249) );
  AOI22S U498 ( .A1(n338), .A2(\col1_r[4][0] ), .B1(n337), .B2(\col1_r[5][0] ), 
        .O(n248) );
  AOI22S U499 ( .A1(n324), .A2(\col1_r[3][0] ), .B1(n341), .B2(\col1_r[6][0] ), 
        .O(n246) );
  AOI22S U500 ( .A1(n342), .A2(\col1_r[2][0] ), .B1(\col1_r[0][0] ), .B2(n153), 
        .O(n245) );
  AN2 U501 ( .I1(n246), .I2(n245), .O(n247) );
  ND3 U502 ( .I1(n249), .I2(n248), .I3(n247), .O(n711) );
  INV1S U503 ( .I(n250), .O(n251) );
  BUF1 U504 ( .I(n24), .O(n799) );
  MOAI1S U505 ( .A1(n363), .A2(n251), .B1(n799), .B2(down_sum_r[5]), .O(n939)
         );
  BUF1 U506 ( .I(n710), .O(n797) );
  MOAI1S U507 ( .A1(\intadd_11/SUM[3] ), .A2(n300), .B1(up_sum_r[5]), .B2(n797), .O(n929) );
  AOI22S U508 ( .A1(n350), .A2(\col2_r[4][5] ), .B1(n337), .B2(\col2_r[5][5] ), 
        .O(n253) );
  INV1S U509 ( .I(n557), .O(n321) );
  AOI22S U510 ( .A1(n321), .A2(\col2_r[1][5] ), .B1(n320), .B2(\col2_r[7][5] ), 
        .O(n252) );
  AN2 U511 ( .I1(n253), .I2(n252), .O(n256) );
  INV1S U512 ( .I(n735), .O(n572) );
  AOI22S U513 ( .A1(n572), .A2(\col2_r[3][5] ), .B1(n341), .B2(\col2_r[6][5] ), 
        .O(n255) );
  AOI22S U514 ( .A1(n342), .A2(\col2_r[2][5] ), .B1(n155), .B2(\col2_r[0][5] ), 
        .O(n254) );
  ND3 U515 ( .I1(n256), .I2(n255), .I3(n254), .O(n334) );
  INV1S U516 ( .I(n564), .O(n522) );
  AOI22S U517 ( .A1(n291), .A2(\col2_r[1][5] ), .B1(n522), .B2(\col2_r[0][5] ), 
        .O(n259) );
  AOI22S U518 ( .A1(n292), .A2(\col2_r[5][5] ), .B1(n347), .B2(\col2_r[4][5] ), 
        .O(n258) );
  INV1S U519 ( .I(n743), .O(n751) );
  AOI22S U520 ( .A1(n751), .A2(\col2_r[2][5] ), .B1(n624), .B2(\col2_r[3][5] ), 
        .O(n257) );
  ND3 U521 ( .I1(n259), .I2(n258), .I3(n257), .O(n333) );
  INV1S U522 ( .I(n260), .O(n632) );
  INV1S U523 ( .I(n633), .O(n349) );
  AOI22S U524 ( .A1(n632), .A2(\col2_r[4][4] ), .B1(n349), .B2(\col2_r[5][4] ), 
        .O(n262) );
  AOI22S U525 ( .A1(n321), .A2(\col2_r[1][4] ), .B1(n615), .B2(\col2_r[7][4] ), 
        .O(n261) );
  AN2 U526 ( .I1(n262), .I2(n261), .O(n265) );
  INV1S U527 ( .I(n417), .O(n526) );
  AOI22S U528 ( .A1(n572), .A2(\col2_r[3][4] ), .B1(n526), .B2(\col2_r[6][4] ), 
        .O(n264) );
  AOI22S U529 ( .A1(n342), .A2(\col2_r[2][4] ), .B1(n153), .B2(\col2_r[0][4] ), 
        .O(n263) );
  ND3 U530 ( .I1(n265), .I2(n264), .I3(n263), .O(n702) );
  INV1S U531 ( .I(n574), .O(n652) );
  AOI22S U532 ( .A1(n652), .A2(\col2_r[1][4] ), .B1(n522), .B2(\col2_r[0][4] ), 
        .O(n268) );
  AOI22S U533 ( .A1(n292), .A2(\col2_r[5][4] ), .B1(n328), .B2(\col2_r[4][4] ), 
        .O(n267) );
  AOI22S U534 ( .A1(n751), .A2(\col2_r[2][4] ), .B1(n524), .B2(\col2_r[3][4] ), 
        .O(n266) );
  ND3 U535 ( .I1(n268), .I2(n267), .I3(n266), .O(n701) );
  AOI22S U536 ( .A1(n632), .A2(\col2_r[4][3] ), .B1(n349), .B2(\col2_r[5][3] ), 
        .O(n270) );
  AOI22S U537 ( .A1(n321), .A2(\col2_r[1][3] ), .B1(n320), .B2(\col2_r[7][3] ), 
        .O(n269) );
  AN2 U538 ( .I1(n270), .I2(n269), .O(n273) );
  AOI22S U539 ( .A1(n572), .A2(\col2_r[3][3] ), .B1(n526), .B2(\col2_r[6][3] ), 
        .O(n272) );
  AOI22S U540 ( .A1(n287), .A2(\col2_r[2][3] ), .B1(n154), .B2(\col2_r[0][3] ), 
        .O(n271) );
  ND3 U541 ( .I1(n273), .I2(n272), .I3(n271), .O(n697) );
  AOI22S U542 ( .A1(n291), .A2(\col2_r[1][3] ), .B1(n639), .B2(\col2_r[0][3] ), 
        .O(n276) );
  AOI22S U543 ( .A1(n292), .A2(\col2_r[5][3] ), .B1(n328), .B2(\col2_r[4][3] ), 
        .O(n275) );
  AOI22S U544 ( .A1(n751), .A2(\col2_r[2][3] ), .B1(n624), .B2(\col2_r[3][3] ), 
        .O(n274) );
  ND3 U545 ( .I1(n276), .I2(n275), .I3(n274), .O(n696) );
  AOI22S U546 ( .A1(n632), .A2(\col2_r[4][2] ), .B1(n349), .B2(\col2_r[5][2] ), 
        .O(n278) );
  AOI22S U547 ( .A1(n321), .A2(\col2_r[1][2] ), .B1(n320), .B2(\col2_r[7][2] ), 
        .O(n277) );
  AN2 U548 ( .I1(n278), .I2(n277), .O(n281) );
  AOI22S U549 ( .A1(n572), .A2(\col2_r[3][2] ), .B1(n526), .B2(\col2_r[6][2] ), 
        .O(n280) );
  AOI22S U550 ( .A1(n287), .A2(\col2_r[2][2] ), .B1(n155), .B2(\col2_r[0][2] ), 
        .O(n279) );
  ND3 U551 ( .I1(n281), .I2(n280), .I3(n279), .O(n692) );
  AOI22S U552 ( .A1(n291), .A2(\col2_r[1][2] ), .B1(n522), .B2(\col2_r[0][2] ), 
        .O(n284) );
  AOI22S U553 ( .A1(n292), .A2(\col2_r[5][2] ), .B1(n328), .B2(\col2_r[4][2] ), 
        .O(n283) );
  AOI22S U554 ( .A1(n751), .A2(\col2_r[2][2] ), .B1(n624), .B2(\col2_r[3][2] ), 
        .O(n282) );
  ND3 U555 ( .I1(n284), .I2(n283), .I3(n282), .O(n691) );
  AOI22S U556 ( .A1(n350), .A2(\col2_r[4][1] ), .B1(n349), .B2(\col2_r[5][1] ), 
        .O(n286) );
  AOI22S U557 ( .A1(n321), .A2(\col2_r[1][1] ), .B1(n320), .B2(\col2_r[7][1] ), 
        .O(n285) );
  AN2 U558 ( .I1(n286), .I2(n285), .O(n290) );
  AOI22S U559 ( .A1(n324), .A2(\col2_r[3][1] ), .B1(n526), .B2(\col2_r[6][1] ), 
        .O(n289) );
  AOI22S U560 ( .A1(n287), .A2(\col2_r[2][1] ), .B1(n153), .B2(\col2_r[0][1] ), 
        .O(n288) );
  ND3 U561 ( .I1(n290), .I2(n289), .I3(n288), .O(n687) );
  AOI22S U562 ( .A1(n291), .A2(\col2_r[1][1] ), .B1(n639), .B2(\col2_r[0][1] ), 
        .O(n295) );
  AOI22S U563 ( .A1(n292), .A2(\col2_r[5][1] ), .B1(n328), .B2(\col2_r[4][1] ), 
        .O(n294) );
  AOI22S U564 ( .A1(n738), .A2(\col2_r[2][1] ), .B1(n624), .B2(\col2_r[3][1] ), 
        .O(n293) );
  ND3 U565 ( .I1(n295), .I2(n294), .I3(n293), .O(n686) );
  HA1 U566 ( .A(n297), .B(n296), .C(n685), .S(n186) );
  INV1S U567 ( .I(n298), .O(n299) );
  BUF1 U568 ( .I(n629), .O(n717) );
  MOAI1S U569 ( .A1(n369), .A2(n299), .B1(n717), .B2(ver_sum_r[5]), .O(n959)
         );
  MOAI1S U570 ( .A1(\intadd_12/SUM[2] ), .A2(n300), .B1(hor_sum_r[4]), .B2(
        n370), .O(n950) );
  AOI22S U571 ( .A1(n615), .A2(\col1_r[7][6] ), .B1(n555), .B2(\col1_r[1][6] ), 
        .O(n305) );
  AOI22S U572 ( .A1(n338), .A2(\col1_r[4][6] ), .B1(n524), .B2(\col1_r[5][6] ), 
        .O(n304) );
  AOI22S U573 ( .A1(n346), .A2(\col1_r[3][6] ), .B1(n347), .B2(\col1_r[6][6] ), 
        .O(n302) );
  AOI22S U574 ( .A1(n563), .A2(\col1_r[2][6] ), .B1(n153), .B2(\col1_r[0][6] ), 
        .O(n301) );
  AN2 U575 ( .I1(n302), .I2(n301), .O(n303) );
  ND3 U576 ( .I1(n305), .I2(n304), .I3(n303), .O(n317) );
  FA1S U577 ( .A(n136), .B(n307), .CI(n306), .CO(n316), .S(n250) );
  INV1S U578 ( .I(n308), .O(n309) );
  MOAI1S U579 ( .A1(n363), .A2(n309), .B1(n799), .B2(down_sum_r[6]), .O(n938)
         );
  MOAI1S U580 ( .A1(\intadd_11/SUM[4] ), .A2(n798), .B1(up_sum_r[6]), .B2(n310), .O(n928) );
  AOI22S U581 ( .A1(n348), .A2(\col1_r[7][7] ), .B1(n521), .B2(\col1_r[1][7] ), 
        .O(n315) );
  AOI22S U582 ( .A1(n350), .A2(\col1_r[4][7] ), .B1(n524), .B2(\col1_r[5][7] ), 
        .O(n314) );
  AOI22S U583 ( .A1(n346), .A2(\col1_r[3][7] ), .B1(n347), .B2(\col1_r[6][7] ), 
        .O(n312) );
  AOI22S U584 ( .A1(n563), .A2(\col1_r[2][7] ), .B1(n153), .B2(\col1_r[0][7] ), 
        .O(n311) );
  AN2 U585 ( .I1(n312), .I2(n311), .O(n313) );
  ND3 U586 ( .I1(n315), .I2(n314), .I3(n313), .O(n360) );
  FA1S U587 ( .A(n133), .B(n317), .CI(n316), .CO(n359), .S(n308) );
  INV1S U588 ( .I(n318), .O(n319) );
  MOAI1S U589 ( .A1(n363), .A2(n319), .B1(n371), .B2(down_sum_r[8]), .O(n936)
         );
  AOI22S U590 ( .A1(n338), .A2(\col2_r[4][6] ), .B1(n349), .B2(\col2_r[5][6] ), 
        .O(n323) );
  AOI22S U591 ( .A1(n321), .A2(\col2_r[1][6] ), .B1(n320), .B2(\col2_r[7][6] ), 
        .O(n322) );
  AN2 U592 ( .I1(n323), .I2(n322), .O(n327) );
  AOI22S U593 ( .A1(n324), .A2(\col2_r[3][6] ), .B1(n526), .B2(\col2_r[6][6] ), 
        .O(n326) );
  AOI22S U594 ( .A1(n342), .A2(\col2_r[2][6] ), .B1(n154), .B2(\col2_r[0][6] ), 
        .O(n325) );
  ND3 U595 ( .I1(n327), .I2(n326), .I3(n325), .O(n356) );
  AOI22S U596 ( .A1(n346), .A2(\col2_r[1][6] ), .B1(n522), .B2(\col2_r[0][6] ), 
        .O(n331) );
  AOI22S U597 ( .A1(n348), .A2(\col2_r[5][6] ), .B1(n328), .B2(\col2_r[4][6] ), 
        .O(n330) );
  AOI22S U598 ( .A1(n751), .A2(\col2_r[2][6] ), .B1(n524), .B2(\col2_r[3][6] ), 
        .O(n329) );
  ND3 U599 ( .I1(n331), .I2(n330), .I3(n329), .O(n355) );
  FA1S U600 ( .A(n334), .B(n333), .CI(n332), .CO(n354), .S(n298) );
  INV1S U601 ( .I(n335), .O(n336) );
  MOAI1S U602 ( .A1(n369), .A2(n336), .B1(n717), .B2(ver_sum_r[6]), .O(n958)
         );
  MOAI1S U603 ( .A1(\intadd_12/SUM[3] ), .A2(n372), .B1(hor_sum_r[5]), .B2(
        n370), .O(n949) );
  AOI22S U604 ( .A1(n338), .A2(\col2_r[4][7] ), .B1(n337), .B2(\col2_r[5][7] ), 
        .O(n340) );
  AOI22S U605 ( .A1(n495), .A2(\col2_r[1][7] ), .B1(n393), .B2(\col2_r[7][7] ), 
        .O(n339) );
  AN2 U606 ( .I1(n340), .I2(n339), .O(n345) );
  AOI22S U607 ( .A1(n346), .A2(\col2_r[3][7] ), .B1(n341), .B2(\col2_r[6][7] ), 
        .O(n344) );
  AOI22S U608 ( .A1(n342), .A2(\col2_r[2][7] ), .B1(\col2_r[0][7] ), .B2(n154), 
        .O(n343) );
  ND3 U609 ( .I1(n345), .I2(n344), .I3(n343), .O(n366) );
  AOI22S U610 ( .A1(n346), .A2(\col2_r[1][7] ), .B1(n522), .B2(\col2_r[0][7] ), 
        .O(n353) );
  AOI22S U611 ( .A1(n348), .A2(\col2_r[5][7] ), .B1(n347), .B2(\col2_r[4][7] ), 
        .O(n352) );
  AOI22S U612 ( .A1(n350), .A2(\col2_r[2][7] ), .B1(n349), .B2(\col2_r[3][7] ), 
        .O(n351) );
  ND3 U613 ( .I1(n353), .I2(n352), .I3(n351), .O(n365) );
  FA1S U614 ( .A(n356), .B(n355), .CI(n354), .CO(n364), .S(n335) );
  INV1S U615 ( .I(n357), .O(n358) );
  MOAI1S U616 ( .A1(n369), .A2(n358), .B1(n717), .B2(ver_sum_r[8]), .O(n956)
         );
  FA1S U617 ( .A(n130), .B(n360), .CI(n359), .CO(n318), .S(n361) );
  INV1S U618 ( .I(n361), .O(n362) );
  MOAI1S U619 ( .A1(n363), .A2(n362), .B1(n24), .B2(down_sum_r[7]), .O(n937)
         );
  MOAI1S U620 ( .A1(\intadd_11/SUM[5] ), .A2(n798), .B1(up_sum_r[7]), .B2(n797), .O(n927) );
  FA1S U621 ( .A(n366), .B(n365), .CI(n364), .CO(n357), .S(n367) );
  INV1S U622 ( .I(n367), .O(n368) );
  MOAI1S U623 ( .A1(n369), .A2(n368), .B1(n717), .B2(ver_sum_r[7]), .O(n957)
         );
  MOAI1S U624 ( .A1(\intadd_12/SUM[4] ), .A2(n372), .B1(hor_sum_r[6]), .B2(n24), .O(n948) );
  MOAI1S U625 ( .A1(\intadd_12/SUM[5] ), .A2(n372), .B1(hor_sum_r[7]), .B2(
        n370), .O(n947) );
  MOAI1S U626 ( .A1(\intadd_12/n1 ), .A2(n372), .B1(hor_sum_r[8]), .B2(n371), 
        .O(n946) );
  NR2 U627 ( .I1(n509), .I2(n376), .O(n373) );
  NR3 U628 ( .I1(n509), .I2(logic_state_r[1]), .I3(logic_state_r[2]), .O(n374)
         );
  AOI22S U629 ( .A1(cen_r[1]), .A2(n127), .B1(B_data_r[1]), .B2(n100), .O(n379) );
  NR2 U630 ( .I1(logic_state_r[0]), .I2(n376), .O(n377) );
  AOI22S U631 ( .A1(n106), .A2(\intadd_9/SUM[1] ), .B1(ver_sum_r[2]), .B2(n126), .O(n378) );
  ND3 U632 ( .I1(n380), .I2(n379), .I3(n378), .O(n908) );
  AOI22S U633 ( .A1(cen_r[0]), .A2(n128), .B1(B_data_r[0]), .B2(n101), .O(n382) );
  AOI22S U634 ( .A1(n106), .A2(\intadd_9/SUM[0] ), .B1(ver_sum_r[1]), .B2(n125), .O(n381) );
  ND3 U635 ( .I1(n383), .I2(n382), .I3(n381), .O(n907) );
  AOI22S U636 ( .A1(cen_r[2]), .A2(n374), .B1(B_data_r[2]), .B2(n102), .O(n385) );
  AOI22S U637 ( .A1(n107), .A2(\intadd_9/SUM[2] ), .B1(ver_sum_r[3]), .B2(n377), .O(n384) );
  ND3 U638 ( .I1(n386), .I2(n385), .I3(n384), .O(n909) );
  AOI22S U639 ( .A1(cen_r[3]), .A2(n127), .B1(B_data_r[3]), .B2(n100), .O(n388) );
  AOI22S U640 ( .A1(n108), .A2(\intadd_9/SUM[3] ), .B1(ver_sum_r[4]), .B2(n126), .O(n387) );
  ND3 U641 ( .I1(n389), .I2(n388), .I3(n387), .O(n910) );
  AOI22S U642 ( .A1(cen_r[4]), .A2(n128), .B1(B_data_r[4]), .B2(n101), .O(n391) );
  AOI22S U643 ( .A1(n107), .A2(\intadd_9/SUM[4] ), .B1(ver_sum_r[5]), .B2(n125), .O(n390) );
  ND3 U644 ( .I1(n392), .I2(n391), .I3(n390), .O(n911) );
  NR2 U645 ( .I1(n393), .I2(end_col_r), .O(n538) );
  INV1S U646 ( .I(n538), .O(n492) );
  NR2 U647 ( .I1(n492), .I2(n409), .O(n474) );
  INV1S U648 ( .I(n505), .O(n520) );
  INV1S U649 ( .I(n21), .O(n497) );
  AOI22S U650 ( .A1(n474), .A2(n528), .B1(n109), .B2(n497), .O(n398) );
  INV1S U651 ( .I(end_col_r), .O(n631) );
  MOAI1S U652 ( .A1(n503), .A2(state_r[2]), .B1(n503), .B2(n18), .O(n394) );
  INV1S U653 ( .I(state_r[1]), .O(n487) );
  AO13S U654 ( .B1(n116), .B2(n540), .B3(n394), .A1(n487), .O(n397) );
  NR2 U655 ( .I1(n847), .I2(n623), .O(n395) );
  INV1S U656 ( .I(n532), .O(n476) );
  ND3 U657 ( .I1(n398), .I2(n397), .I3(n396), .O(state_w[1]) );
  AOI22S U658 ( .A1(cen_r[5]), .A2(n374), .B1(B_data_r[5]), .B2(n102), .O(n400) );
  AOI22S U659 ( .A1(n106), .A2(\intadd_9/SUM[5] ), .B1(ver_sum_r[6]), .B2(n377), .O(n399) );
  ND3 U660 ( .I1(n401), .I2(n400), .I3(n399), .O(n912) );
  ND2S U661 ( .I1(n128), .I2(cen_r[7]), .O(n404) );
  AOI22S U662 ( .A1(hor_sum_r[8]), .A2(n373), .B1(B_data_r[7]), .B2(n100), .O(
        n403) );
  AOI22S U663 ( .A1(n107), .A2(\intadd_9/n1 ), .B1(ver_sum_r[8]), .B2(n126), 
        .O(n402) );
  ND3 U664 ( .I1(n404), .I2(n403), .I3(n402), .O(n914) );
  AOI22S U665 ( .A1(cen_r[6]), .A2(n127), .B1(B_data_r[6]), .B2(n101), .O(n406) );
  AOI22S U666 ( .A1(n108), .A2(\intadd_9/SUM[6] ), .B1(ver_sum_r[7]), .B2(n125), .O(n405) );
  ND3 U667 ( .I1(n407), .I2(n406), .I3(n405), .O(n913) );
  ND2S U668 ( .I1(RGB_valid), .I2(n809), .O(n408) );
  ND2S U669 ( .I1(n408), .I2(n75), .O(RGB_valid_w) );
  ND2S U670 ( .I1(n811), .I2(n410), .O(n1163) );
  AOI22S U671 ( .A1(n416), .A2(\col1_r[2][7] ), .B1(n423), .B2(\col1_r[1][7] ), 
        .O(n413) );
  INV1S U672 ( .I(n597), .O(n661) );
  AOI22S U673 ( .A1(n661), .A2(\col1_r[5][7] ), .B1(n523), .B2(\col1_r[3][7] ), 
        .O(n412) );
  AOI22S U674 ( .A1(n737), .A2(\col1_r[6][7] ), .B1(n436), .B2(\col1_r[4][7] ), 
        .O(n411) );
  ND3 U675 ( .I1(n413), .I2(n412), .I3(n411), .O(n414) );
  OAI22S U676 ( .A1(n521), .A2(n414), .B1(\col1_r[0][7] ), .B2(n414), .O(
        \intadd_12/B[5] ) );
  INV1S U677 ( .I(n415), .O(n446) );
  AOI22S U678 ( .A1(n416), .A2(\col3_r[2][7] ), .B1(n423), .B2(\col3_r[1][7] ), 
        .O(n420) );
  INV1S U679 ( .I(n417), .O(n653) );
  AOI22S U680 ( .A1(n653), .A2(\col3_r[5][7] ), .B1(n676), .B2(\col3_r[3][7] ), 
        .O(n419) );
  INV1S U681 ( .I(n742), .O(n441) );
  AOI22S U682 ( .A1(n441), .A2(\col3_r[6][7] ), .B1(n436), .B2(\col3_r[4][7] ), 
        .O(n418) );
  ND3 U683 ( .I1(n420), .I2(n419), .I3(n418), .O(n421) );
  OAI22S U684 ( .A1(n446), .A2(n421), .B1(\col3_r[0][7] ), .B2(n421), .O(
        \intadd_12/A[5] ) );
  INV1S U685 ( .I(n422), .O(n447) );
  AOI22S U686 ( .A1(n447), .A2(\col1_r[2][6] ), .B1(n423), .B2(\col1_r[1][6] ), 
        .O(n426) );
  AOI22S U687 ( .A1(n653), .A2(\col1_r[5][6] ), .B1(n523), .B2(\col1_r[3][6] ), 
        .O(n425) );
  AOI22S U688 ( .A1(n441), .A2(\col1_r[6][6] ), .B1(n436), .B2(\col1_r[4][6] ), 
        .O(n424) );
  ND3 U689 ( .I1(n426), .I2(n425), .I3(n424), .O(n427) );
  OAI22S U690 ( .A1(n446), .A2(n427), .B1(\col1_r[0][6] ), .B2(n427), .O(
        \intadd_12/B[4] ) );
  INV1S U691 ( .I(n566), .O(n452) );
  AOI22S U692 ( .A1(n447), .A2(\col3_r[2][6] ), .B1(n452), .B2(\col3_r[1][6] ), 
        .O(n430) );
  AOI22S U693 ( .A1(n661), .A2(\col3_r[5][6] ), .B1(n676), .B2(\col3_r[3][6] ), 
        .O(n429) );
  AOI22S U694 ( .A1(n441), .A2(\col3_r[6][6] ), .B1(n436), .B2(\col3_r[4][6] ), 
        .O(n428) );
  ND3 U695 ( .I1(n430), .I2(n429), .I3(n428), .O(n431) );
  OAI22S U696 ( .A1(n446), .A2(n431), .B1(\col3_r[0][6] ), .B2(n431), .O(
        \intadd_12/A[4] ) );
  AOI22S U697 ( .A1(n447), .A2(\col1_r[2][5] ), .B1(n452), .B2(\col1_r[1][5] ), 
        .O(n434) );
  AOI22S U698 ( .A1(n653), .A2(\col1_r[5][5] ), .B1(n523), .B2(\col1_r[3][5] ), 
        .O(n433) );
  INV1S U699 ( .I(n747), .O(n461) );
  AOI22S U700 ( .A1(n441), .A2(\col1_r[6][5] ), .B1(n461), .B2(\col1_r[4][5] ), 
        .O(n432) );
  ND3 U701 ( .I1(n434), .I2(n433), .I3(n432), .O(n435) );
  OAI22S U702 ( .A1(n446), .A2(n435), .B1(\col1_r[0][5] ), .B2(n435), .O(
        \intadd_12/B[3] ) );
  AOI22S U703 ( .A1(n447), .A2(\col3_r[2][5] ), .B1(n452), .B2(\col3_r[1][5] ), 
        .O(n439) );
  AOI22S U704 ( .A1(n677), .A2(\col3_r[5][5] ), .B1(n676), .B2(\col3_r[3][5] ), 
        .O(n438) );
  AOI22S U705 ( .A1(n441), .A2(\col3_r[6][5] ), .B1(n436), .B2(\col3_r[4][5] ), 
        .O(n437) );
  ND3 U706 ( .I1(n439), .I2(n438), .I3(n437), .O(n440) );
  OAI22S U707 ( .A1(n446), .A2(n440), .B1(\col3_r[0][5] ), .B2(n440), .O(
        \intadd_12/A[3] ) );
  AOI22S U708 ( .A1(n447), .A2(\col1_r[2][4] ), .B1(n452), .B2(\col1_r[1][4] ), 
        .O(n444) );
  AOI22S U709 ( .A1(n661), .A2(\col1_r[5][4] ), .B1(n646), .B2(\col1_r[3][4] ), 
        .O(n443) );
  AOI22S U710 ( .A1(n441), .A2(\col1_r[6][4] ), .B1(n461), .B2(\col1_r[4][4] ), 
        .O(n442) );
  ND3 U711 ( .I1(n444), .I2(n443), .I3(n442), .O(n445) );
  OAI22S U712 ( .A1(n446), .A2(n445), .B1(\col1_r[0][4] ), .B2(n445), .O(
        \intadd_12/B[2] ) );
  AOI22S U713 ( .A1(n447), .A2(\col3_r[2][4] ), .B1(n452), .B2(\col3_r[1][4] ), 
        .O(n450) );
  AOI22S U714 ( .A1(n677), .A2(\col3_r[5][4] ), .B1(n646), .B2(\col3_r[3][4] ), 
        .O(n449) );
  AOI22S U715 ( .A1(n467), .A2(\col3_r[6][4] ), .B1(n461), .B2(\col3_r[4][4] ), 
        .O(n448) );
  ND3 U716 ( .I1(n450), .I2(n449), .I3(n448), .O(n451) );
  OAI22S U717 ( .A1(n472), .A2(n451), .B1(\col3_r[0][4] ), .B2(n451), .O(
        \intadd_12/A[2] ) );
  AOI22S U718 ( .A1(n466), .A2(\col1_r[2][3] ), .B1(n452), .B2(\col1_r[1][3] ), 
        .O(n455) );
  AOI22S U719 ( .A1(n661), .A2(\col1_r[5][3] ), .B1(n523), .B2(\col1_r[3][3] ), 
        .O(n454) );
  AOI22S U720 ( .A1(n467), .A2(\col1_r[6][3] ), .B1(n461), .B2(\col1_r[4][3] ), 
        .O(n453) );
  ND3 U721 ( .I1(n455), .I2(n454), .I3(n453), .O(n456) );
  OAI22S U722 ( .A1(n472), .A2(n456), .B1(\col1_r[0][3] ), .B2(n456), .O(
        \intadd_12/B[1] ) );
  AOI22S U723 ( .A1(n466), .A2(\col3_r[2][3] ), .B1(n788), .B2(\col3_r[1][3] ), 
        .O(n459) );
  AOI22S U724 ( .A1(n653), .A2(\col3_r[5][3] ), .B1(n646), .B2(\col3_r[3][3] ), 
        .O(n458) );
  AOI22S U725 ( .A1(n467), .A2(\col3_r[6][3] ), .B1(n461), .B2(\col3_r[4][3] ), 
        .O(n457) );
  ND3 U726 ( .I1(n459), .I2(n458), .I3(n457), .O(n460) );
  OAI22S U727 ( .A1(n472), .A2(n460), .B1(\col3_r[0][3] ), .B2(n460), .O(
        \intadd_12/A[1] ) );
  AOI22S U728 ( .A1(n466), .A2(\col1_r[2][2] ), .B1(n788), .B2(\col1_r[1][2] ), 
        .O(n464) );
  AOI22S U729 ( .A1(n661), .A2(\col1_r[5][2] ), .B1(n646), .B2(\col1_r[3][2] ), 
        .O(n463) );
  AOI22S U730 ( .A1(n467), .A2(\col1_r[6][2] ), .B1(n461), .B2(\col1_r[4][2] ), 
        .O(n462) );
  ND3 U731 ( .I1(n464), .I2(n463), .I3(n462), .O(n465) );
  OAI22S U732 ( .A1(n472), .A2(n465), .B1(\col1_r[0][2] ), .B2(n465), .O(
        \intadd_12/CI ) );
  AOI22S U733 ( .A1(n466), .A2(\col3_r[2][2] ), .B1(n788), .B2(\col3_r[1][2] ), 
        .O(n470) );
  AOI22S U734 ( .A1(n668), .A2(\col3_r[5][2] ), .B1(n676), .B2(\col3_r[3][2] ), 
        .O(n469) );
  AOI22S U735 ( .A1(n467), .A2(\col3_r[6][2] ), .B1(n792), .B2(\col3_r[4][2] ), 
        .O(n468) );
  ND3 U736 ( .I1(n470), .I2(n469), .I3(n468), .O(n471) );
  OAI22S U737 ( .A1(n472), .A2(n471), .B1(\col3_r[0][2] ), .B2(n471), .O(
        \intadd_12/B[0] ) );
  NR2 U738 ( .I1(n532), .I2(n505), .O(n488) );
  AOI13HS U739 ( .B1(state_r[2]), .B2(n503), .B3(n505), .A1(n488), .O(n535) );
  AO13S U740 ( .B1(n528), .B2(n531), .B3(n498), .A1(state_r[3]), .O(n473) );
  AOI22S U741 ( .A1(n116), .A2(n475), .B1(n474), .B2(n505), .O(n517) );
  OA12 U742 ( .B1(n21), .B2(n520), .A1(state_r[3]), .O(n500) );
  AOI13HS U743 ( .B1(n476), .B2(n487), .B3(n847), .A1(n500), .O(n530) );
  MOAI1S U744 ( .A1(counter_r[0]), .A2(n517), .B1(counter_r[0]), .B2(n515), 
        .O(n1161) );
  AOI13HS U745 ( .B1(state_r[1]), .B2(n113), .B3(n631), .A1(n497), .O(n477) );
  INV1S U746 ( .I(n115), .O(n533) );
  NR2 U747 ( .I1(n477), .I2(n533), .O(n482) );
  ND2S U748 ( .I1(n18), .I2(n631), .O(n478) );
  AOI22S U749 ( .A1(state_r[3]), .A2(n478), .B1(state_r[1]), .B2(n782), .O(
        n480) );
  AOI13HS U750 ( .B1(n480), .B2(n505), .B3(n479), .A1(n21), .O(n481) );
  MOAI1S U751 ( .A1(n482), .A2(n847), .B1(n116), .B2(n481), .O(state_w[0]) );
  NR2 U752 ( .I1(n109), .I2(n495), .O(n483) );
  NR3 U753 ( .I1(state_r[3]), .I2(n484), .I3(n483), .O(n491) );
  ND2S U754 ( .I1(state_r[0]), .I2(n485), .O(n486) );
  ND3 U755 ( .I1(n487), .I2(n631), .I3(n486), .O(n489) );
  MOAI1S U756 ( .A1(n113), .A2(n489), .B1(n488), .B2(n495), .O(n490) );
  MOAI1S U757 ( .A1(n491), .A2(n497), .B1(n115), .B2(n490), .O(state_w[2]) );
  NR2 U758 ( .I1(state_r[1]), .I2(n18), .O(n493) );
  NR2 U759 ( .I1(n493), .I2(n492), .O(n494) );
  NR2 U760 ( .I1(n494), .I2(n533), .O(n502) );
  NR2 U761 ( .I1(n520), .I2(n497), .O(n496) );
  MOAI1S U762 ( .A1(n498), .A2(n497), .B1(n496), .B2(n495), .O(n499) );
  NR2 U763 ( .I1(n500), .I2(n499), .O(n501) );
  OAI22S U764 ( .A1(n113), .A2(n502), .B1(n533), .B2(n501), .O(state_w[3]) );
  NR2 U765 ( .I1(n811), .I2(logic_state_r[1]), .O(n842) );
  INV1S U766 ( .I(n531), .O(n504) );
  MOAI1S U767 ( .A1(n505), .A2(n518), .B1(n519), .B2(n504), .O(n506) );
  OR3B2S U768 ( .I1(n77), .B1(n115), .B2(n506), .O(n507) );
  OAI112HS U769 ( .C1(n510), .C2(n509), .A1(n508), .B1(n507), .O(n1162) );
  XOR2HS U770 ( .I1(n511), .I2(counter_r[2]), .O(n512) );
  MOAI1S U771 ( .A1(n512), .A2(n517), .B1(n23), .B2(n515), .O(n1160) );
  AN2 U772 ( .I1(n514), .I2(n513), .O(n516) );
  MOAI1S U773 ( .A1(n517), .A2(n516), .B1(counter_r[1]), .B2(n515), .O(n1159)
         );
  MOAI1S U774 ( .A1(n520), .A2(n519), .B1(n520), .B2(n518), .O(n537) );
  OAI22S U775 ( .A1(n535), .A2(n533), .B1(n537), .B2(n533), .O(n525) );
  MOAI1S U776 ( .A1(n129), .A2(n83), .B1(\col3_r[0][7] ), .B2(n81), .O(n1158)
         );
  MOAI1S U777 ( .A1(n132), .A2(n81), .B1(\col3_r[0][6] ), .B2(n82), .O(n1157)
         );
  MOAI1S U778 ( .A1(n135), .A2(n82), .B1(\col3_r[0][5] ), .B2(n83), .O(n1156)
         );
  MOAI1S U779 ( .A1(n138), .A2(n83), .B1(\col3_r[0][4] ), .B2(n81), .O(n1155)
         );
  MOAI1S U780 ( .A1(n141), .A2(n81), .B1(\col3_r[0][3] ), .B2(n82), .O(n1154)
         );
  MOAI1S U781 ( .A1(n144), .A2(n82), .B1(\col3_r[0][2] ), .B2(n83), .O(n1153)
         );
  MOAI1S U782 ( .A1(n147), .A2(n83), .B1(\col3_r[0][1] ), .B2(n81), .O(n1152)
         );
  MOAI1S U783 ( .A1(n150), .A2(n81), .B1(\col3_r[0][0] ), .B2(n82), .O(n1151)
         );
  MOAI1S U784 ( .A1(n67), .A2(n86), .B1(\col3_r[1][7] ), .B2(n84), .O(n1150)
         );
  MOAI1S U785 ( .A1(n68), .A2(n84), .B1(\col3_r[1][6] ), .B2(n85), .O(n1149)
         );
  MOAI1S U786 ( .A1(n69), .A2(n85), .B1(\col3_r[1][5] ), .B2(n86), .O(n1148)
         );
  MOAI1S U787 ( .A1(n70), .A2(n86), .B1(\col3_r[1][4] ), .B2(n84), .O(n1147)
         );
  MOAI1S U788 ( .A1(n71), .A2(n84), .B1(\col3_r[1][3] ), .B2(n85), .O(n1146)
         );
  MOAI1S U789 ( .A1(n72), .A2(n85), .B1(\col3_r[1][2] ), .B2(n86), .O(n1145)
         );
  MOAI1S U790 ( .A1(n73), .A2(n86), .B1(\col3_r[1][1] ), .B2(n84), .O(n1144)
         );
  MOAI1S U791 ( .A1(n74), .A2(n84), .B1(\col3_r[1][0] ), .B2(n85), .O(n1143)
         );
  MOAI1S U792 ( .A1(n129), .A2(n89), .B1(\col3_r[2][7] ), .B2(n87), .O(n1142)
         );
  MOAI1S U793 ( .A1(n132), .A2(n87), .B1(\col3_r[2][6] ), .B2(n88), .O(n1141)
         );
  MOAI1S U794 ( .A1(n135), .A2(n88), .B1(\col3_r[2][5] ), .B2(n89), .O(n1140)
         );
  MOAI1S U795 ( .A1(n138), .A2(n89), .B1(\col3_r[2][4] ), .B2(n87), .O(n1139)
         );
  MOAI1S U796 ( .A1(n141), .A2(n87), .B1(\col3_r[2][3] ), .B2(n88), .O(n1138)
         );
  MOAI1S U797 ( .A1(n144), .A2(n88), .B1(\col3_r[2][2] ), .B2(n89), .O(n1137)
         );
  MOAI1S U798 ( .A1(n147), .A2(n89), .B1(\col3_r[2][1] ), .B2(n87), .O(n1136)
         );
  MOAI1S U799 ( .A1(n150), .A2(n87), .B1(\col3_r[2][0] ), .B2(n88), .O(n1135)
         );
  MOAI1S U800 ( .A1(n67), .A2(n92), .B1(\col3_r[3][7] ), .B2(n90), .O(n1134)
         );
  MOAI1S U801 ( .A1(n68), .A2(n90), .B1(\col3_r[3][6] ), .B2(n91), .O(n1133)
         );
  MOAI1S U802 ( .A1(n69), .A2(n91), .B1(\col3_r[3][5] ), .B2(n92), .O(n1132)
         );
  MOAI1S U803 ( .A1(n70), .A2(n92), .B1(\col3_r[3][4] ), .B2(n90), .O(n1131)
         );
  MOAI1S U804 ( .A1(n71), .A2(n90), .B1(\col3_r[3][3] ), .B2(n91), .O(n1130)
         );
  MOAI1S U805 ( .A1(n72), .A2(n91), .B1(\col3_r[3][2] ), .B2(n92), .O(n1129)
         );
  MOAI1S U806 ( .A1(n73), .A2(n92), .B1(\col3_r[3][1] ), .B2(n90), .O(n1128)
         );
  MOAI1S U807 ( .A1(n74), .A2(n90), .B1(\col3_r[3][0] ), .B2(n91), .O(n1127)
         );
  MOAI1S U808 ( .A1(n67), .A2(n95), .B1(\col3_r[4][7] ), .B2(n93), .O(n1126)
         );
  MOAI1S U809 ( .A1(n68), .A2(n93), .B1(\col3_r[4][6] ), .B2(n94), .O(n1125)
         );
  MOAI1S U810 ( .A1(n69), .A2(n94), .B1(\col3_r[4][5] ), .B2(n95), .O(n1124)
         );
  MOAI1S U811 ( .A1(n70), .A2(n95), .B1(\col3_r[4][4] ), .B2(n93), .O(n1123)
         );
  MOAI1S U812 ( .A1(n71), .A2(n93), .B1(\col3_r[4][3] ), .B2(n94), .O(n1122)
         );
  MOAI1S U813 ( .A1(n72), .A2(n94), .B1(\col3_r[4][2] ), .B2(n95), .O(n1121)
         );
  MOAI1S U814 ( .A1(n73), .A2(n95), .B1(\col3_r[4][1] ), .B2(n93), .O(n1120)
         );
  MOAI1S U815 ( .A1(n74), .A2(n93), .B1(\col3_r[4][0] ), .B2(n94), .O(n1119)
         );
  MOAI1S U816 ( .A1(n67), .A2(n98), .B1(\col3_r[5][7] ), .B2(n96), .O(n1118)
         );
  MOAI1S U817 ( .A1(n68), .A2(n96), .B1(\col3_r[5][6] ), .B2(n97), .O(n1117)
         );
  MOAI1S U818 ( .A1(n69), .A2(n97), .B1(\col3_r[5][5] ), .B2(n98), .O(n1116)
         );
  MOAI1S U819 ( .A1(n70), .A2(n98), .B1(\col3_r[5][4] ), .B2(n96), .O(n1115)
         );
  MOAI1S U820 ( .A1(n71), .A2(n96), .B1(\col3_r[5][3] ), .B2(n97), .O(n1114)
         );
  MOAI1S U821 ( .A1(n72), .A2(n97), .B1(\col3_r[5][2] ), .B2(n98), .O(n1113)
         );
  MOAI1S U822 ( .A1(n73), .A2(n98), .B1(\col3_r[5][1] ), .B2(n96), .O(n1112)
         );
  MOAI1S U823 ( .A1(n74), .A2(n96), .B1(\col3_r[5][0] ), .B2(n97), .O(n1111)
         );
  MOAI1S U824 ( .A1(n67), .A2(n121), .B1(\col3_r[6][7] ), .B2(n119), .O(n1110)
         );
  MOAI1S U825 ( .A1(n68), .A2(n119), .B1(\col3_r[6][6] ), .B2(n120), .O(n1109)
         );
  MOAI1S U826 ( .A1(n69), .A2(n120), .B1(\col3_r[6][5] ), .B2(n121), .O(n1108)
         );
  MOAI1S U827 ( .A1(n70), .A2(n121), .B1(\col3_r[6][4] ), .B2(n119), .O(n1107)
         );
  MOAI1S U828 ( .A1(n71), .A2(n119), .B1(\col3_r[6][3] ), .B2(n120), .O(n1106)
         );
  MOAI1S U829 ( .A1(n72), .A2(n120), .B1(\col3_r[6][2] ), .B2(n121), .O(n1105)
         );
  MOAI1S U830 ( .A1(n73), .A2(n121), .B1(\col3_r[6][1] ), .B2(n119), .O(n1104)
         );
  MOAI1S U831 ( .A1(n74), .A2(n119), .B1(\col3_r[6][0] ), .B2(n120), .O(n1103)
         );
  NR2 U832 ( .I1(n532), .I2(n528), .O(n544) );
  INV1S U833 ( .I(n155), .O(n549) );
  INV1S U834 ( .I(n530), .O(n546) );
  NR2 U835 ( .I1(n532), .I2(n531), .O(n601) );
  NR2 U836 ( .I1(n78), .I2(n533), .O(n536) );
  NR2 U837 ( .I1(n537), .I2(n631), .O(n534) );
  AN2B1S U838 ( .I1(n535), .B1(n534), .O(n545) );
  NR2 U839 ( .I1(n546), .I2(n542), .O(n613) );
  NR2 U840 ( .I1(n537), .I2(n542), .O(n541) );
  ND3 U841 ( .I1(n539), .I2(n46), .I3(n117), .O(n552) );
  AN2B1S U842 ( .I1(n541), .B1(n540), .O(n584) );
  INV1S U843 ( .I(n542), .O(n543) );
  NR2 U844 ( .I1(n549), .I2(n599), .O(n551) );
  AO222 U845 ( .A1(n38), .A2(\col2_r[0][7] ), .B1(n592), .B2(\col3_r[0][7] ), 
        .C1(n551), .C2(pixel9[7]), .O(n1102) );
  INV1S U846 ( .I(n544), .O(n598) );
  NR2 U847 ( .I1(n546), .I2(n548), .O(n614) );
  ND3 U848 ( .I1(n547), .I2(n48), .I3(n602), .O(n554) );
  OR2B1S U849 ( .I1(n548), .B1(n78), .O(n616) );
  NR2 U850 ( .I1(n549), .I2(n616), .O(n553) );
  AO222 U851 ( .A1(n39), .A2(\col1_r[0][7] ), .B1(n131), .B2(n49), .C1(
        \col2_r[0][7] ), .C2(n550), .O(n1101) );
  AO222 U852 ( .A1(n552), .A2(\col2_r[0][6] ), .B1(n600), .B2(\col3_r[0][6] ), 
        .C1(n133), .C2(n47), .O(n1100) );
  AO222 U853 ( .A1(n554), .A2(\col1_r[0][6] ), .B1(n553), .B2(pixel9[6]), .C1(
        \col2_r[0][6] ), .C2(n550), .O(n1099) );
  AO222 U854 ( .A1(n38), .A2(\col2_r[0][5] ), .B1(n592), .B2(\col3_r[0][5] ), 
        .C1(n136), .C2(n551), .O(n1098) );
  AO222 U855 ( .A1(n39), .A2(\col1_r[0][5] ), .B1(n49), .B2(pixel9[5]), .C1(
        \col2_r[0][5] ), .C2(n550), .O(n1097) );
  AO222 U856 ( .A1(n552), .A2(\col2_r[0][4] ), .B1(n600), .B2(\col3_r[0][4] ), 
        .C1(n139), .C2(n47), .O(n1096) );
  AO222 U857 ( .A1(n554), .A2(\col1_r[0][4] ), .B1(n553), .B2(pixel9[4]), .C1(
        \col2_r[0][4] ), .C2(n550), .O(n1095) );
  AO222 U858 ( .A1(n38), .A2(\col2_r[0][3] ), .B1(n600), .B2(\col3_r[0][3] ), 
        .C1(n142), .C2(n551), .O(n1094) );
  AO222 U859 ( .A1(n39), .A2(\col1_r[0][3] ), .B1(n49), .B2(pixel9[3]), .C1(
        \col2_r[0][3] ), .C2(n550), .O(n1093) );
  AO222 U860 ( .A1(n552), .A2(\col2_r[0][2] ), .B1(n592), .B2(\col3_r[0][2] ), 
        .C1(n145), .C2(n47), .O(n1092) );
  AO222 U861 ( .A1(n554), .A2(\col1_r[0][2] ), .B1(n553), .B2(pixel9[2]), .C1(
        \col2_r[0][2] ), .C2(n550), .O(n1091) );
  AO222 U862 ( .A1(n38), .A2(\col2_r[0][1] ), .B1(n47), .B2(pixel9[1]), .C1(
        \col3_r[0][1] ), .C2(n593), .O(n1090) );
  AO222 U863 ( .A1(n554), .A2(\col1_r[0][1] ), .B1(n49), .B2(n148), .C1(n619), 
        .C2(\col2_r[0][1] ), .O(n1089) );
  AO222 U864 ( .A1(n552), .A2(\col2_r[0][0] ), .B1(n47), .B2(pixel9[0]), .C1(
        \col3_r[0][0] ), .C2(n593), .O(n1088) );
  AO222 U865 ( .A1(n39), .A2(\col1_r[0][0] ), .B1(n49), .B2(n151), .C1(n576), 
        .C2(\col2_r[0][0] ), .O(n1087) );
  NR2 U866 ( .I1(n557), .I2(n599), .O(n560) );
  AO222 U867 ( .A1(n27), .A2(\col2_r[1][7] ), .B1(n606), .B2(\col3_r[1][7] ), 
        .C1(n130), .C2(n560), .O(n1086) );
  ND3 U868 ( .I1(n556), .I2(n614), .I3(n118), .O(n562) );
  NR2 U869 ( .I1(n557), .I2(n616), .O(n561) );
  AO222 U870 ( .A1(n562), .A2(\col1_r[1][7] ), .B1(n617), .B2(\col2_r[1][7] ), 
        .C1(n131), .C2(n561), .O(n1085) );
  AO222 U871 ( .A1(n26), .A2(\col2_r[1][6] ), .B1(n134), .B2(n50), .C1(n607), 
        .C2(\col3_r[1][6] ), .O(n1084) );
  AO222 U872 ( .A1(n40), .A2(\col1_r[1][6] ), .B1(pixel9[6]), .B2(n51), .C1(
        n576), .C2(\col2_r[1][6] ), .O(n1083) );
  AO222 U873 ( .A1(n26), .A2(\col2_r[1][5] ), .B1(n137), .B2(n560), .C1(n559), 
        .C2(\col3_r[1][5] ), .O(n1082) );
  AO222 U874 ( .A1(n40), .A2(\col1_r[1][5] ), .B1(pixel9[5]), .B2(n561), .C1(
        n576), .C2(\col2_r[1][5] ), .O(n1081) );
  AO222 U875 ( .A1(n27), .A2(\col2_r[1][4] ), .B1(n140), .B2(n50), .C1(n559), 
        .C2(\col3_r[1][4] ), .O(n1080) );
  AO222 U876 ( .A1(n562), .A2(\col1_r[1][4] ), .B1(pixel9[4]), .B2(n51), .C1(
        n576), .C2(\col2_r[1][4] ), .O(n1079) );
  AO222 U877 ( .A1(n27), .A2(\col2_r[1][3] ), .B1(n143), .B2(n560), .C1(n559), 
        .C2(\col3_r[1][3] ), .O(n1078) );
  AO222 U878 ( .A1(n562), .A2(\col1_r[1][3] ), .B1(pixel9[3]), .B2(n561), .C1(
        n567), .C2(\col2_r[1][3] ), .O(n1077) );
  AO222 U879 ( .A1(n26), .A2(\col2_r[1][2] ), .B1(n146), .B2(n50), .C1(n568), 
        .C2(\col3_r[1][2] ), .O(n1076) );
  AO222 U880 ( .A1(n40), .A2(\col1_r[1][2] ), .B1(pixel9[2]), .B2(n51), .C1(
        n567), .C2(\col2_r[1][2] ), .O(n1075) );
  AO222 U881 ( .A1(n26), .A2(\col2_r[1][1] ), .B1(n149), .B2(n50), .C1(
        \col3_r[1][1] ), .C2(n609), .O(n1074) );
  AO222 U882 ( .A1(n40), .A2(\col1_r[1][1] ), .B1(pixel9[1]), .B2(n51), .C1(
        n567), .C2(\col2_r[1][1] ), .O(n1073) );
  AO222 U883 ( .A1(n27), .A2(\col2_r[1][0] ), .B1(n152), .B2(n50), .C1(
        \col3_r[1][0] ), .C2(n609), .O(n1072) );
  AO222 U884 ( .A1(n562), .A2(\col1_r[1][0] ), .B1(pixel9[0]), .B2(n51), .C1(
        n567), .C2(\col2_r[1][0] ), .O(n1071) );
  NR2 U885 ( .I1(n564), .I2(n110), .O(n569) );
  AO222 U886 ( .A1(n29), .A2(\col2_r[2][7] ), .B1(n600), .B2(\col3_r[2][7] ), 
        .C1(pixel9[7]), .C2(n569), .O(n1070) );
  ND3 U887 ( .I1(n565), .I2(n48), .I3(n602), .O(n571) );
  NR2 U888 ( .I1(n566), .I2(n616), .O(n570) );
  AO222 U889 ( .A1(n41), .A2(\col1_r[2][7] ), .B1(n617), .B2(\col2_r[2][7] ), 
        .C1(n130), .C2(n570), .O(n1069) );
  AO222 U890 ( .A1(n28), .A2(\col2_r[2][6] ), .B1(n133), .B2(n52), .C1(n568), 
        .C2(\col3_r[2][6] ), .O(n1068) );
  AO222 U891 ( .A1(n571), .A2(\col1_r[2][6] ), .B1(n134), .B2(n53), .C1(n567), 
        .C2(\col2_r[2][6] ), .O(n1067) );
  AO222 U892 ( .A1(n28), .A2(\col2_r[2][5] ), .B1(n136), .B2(n569), .C1(n568), 
        .C2(\col3_r[2][5] ), .O(n1066) );
  AO222 U893 ( .A1(n571), .A2(\col1_r[2][5] ), .B1(n137), .B2(n570), .C1(n567), 
        .C2(\col2_r[2][5] ), .O(n1065) );
  AO222 U894 ( .A1(n29), .A2(\col2_r[2][4] ), .B1(n139), .B2(n52), .C1(n568), 
        .C2(\col3_r[2][4] ), .O(n1064) );
  AO222 U895 ( .A1(n41), .A2(\col1_r[2][4] ), .B1(n140), .B2(n53), .C1(n575), 
        .C2(\col2_r[2][4] ), .O(n1063) );
  AO222 U896 ( .A1(n29), .A2(\col2_r[2][3] ), .B1(n142), .B2(n569), .C1(n568), 
        .C2(\col3_r[2][3] ), .O(n1062) );
  AO222 U897 ( .A1(n41), .A2(\col1_r[2][3] ), .B1(n143), .B2(n570), .C1(n575), 
        .C2(\col2_r[2][3] ), .O(n1061) );
  AO222 U898 ( .A1(n28), .A2(\col2_r[2][2] ), .B1(n145), .B2(n52), .C1(n568), 
        .C2(\col3_r[2][2] ), .O(n1060) );
  AO222 U899 ( .A1(n571), .A2(\col1_r[2][2] ), .B1(n146), .B2(n53), .C1(n575), 
        .C2(\col2_r[2][2] ), .O(n1059) );
  AO222 U900 ( .A1(n28), .A2(\col2_r[2][1] ), .B1(n148), .B2(n52), .C1(
        \col3_r[2][1] ), .C2(n593), .O(n1058) );
  AO222 U901 ( .A1(n571), .A2(\col1_r[2][1] ), .B1(n149), .B2(n53), .C1(n575), 
        .C2(\col2_r[2][1] ), .O(n1057) );
  AO222 U902 ( .A1(n29), .A2(\col2_r[2][0] ), .B1(n151), .B2(n52), .C1(
        \col3_r[2][0] ), .C2(n609), .O(n1056) );
  AO222 U903 ( .A1(n41), .A2(\col1_r[2][0] ), .B1(n152), .B2(n53), .C1(n575), 
        .C2(\col2_r[2][0] ), .O(n1055) );
  NR2 U904 ( .I1(n574), .I2(n110), .O(n577) );
  AO222 U905 ( .A1(n31), .A2(\col2_r[3][7] ), .B1(n600), .B2(\col3_r[3][7] ), 
        .C1(n131), .C2(n577), .O(n1054) );
  ND3 U906 ( .I1(n573), .I2(n48), .I3(n117), .O(n580) );
  NR2 U907 ( .I1(n574), .I2(n616), .O(n579) );
  AO222 U908 ( .A1(n42), .A2(\col1_r[3][7] ), .B1(n617), .B2(\col2_r[3][7] ), 
        .C1(pixel9[7]), .C2(n579), .O(n1053) );
  AO222 U909 ( .A1(n30), .A2(\col2_r[3][6] ), .B1(pixel9[6]), .B2(n54), .C1(
        n583), .C2(\col3_r[3][6] ), .O(n1052) );
  AO222 U910 ( .A1(n580), .A2(\col1_r[3][6] ), .B1(n133), .B2(n55), .C1(n575), 
        .C2(\col2_r[3][6] ), .O(n1051) );
  AO222 U911 ( .A1(n30), .A2(\col2_r[3][5] ), .B1(pixel9[5]), .B2(n577), .C1(
        n583), .C2(\col3_r[3][5] ), .O(n1050) );
  AO222 U912 ( .A1(n580), .A2(\col1_r[3][5] ), .B1(n136), .B2(n579), .C1(n578), 
        .C2(\col2_r[3][5] ), .O(n1049) );
  AO222 U913 ( .A1(n31), .A2(\col2_r[3][4] ), .B1(pixel9[4]), .B2(n54), .C1(
        n583), .C2(\col3_r[3][4] ), .O(n1048) );
  AO222 U914 ( .A1(n42), .A2(\col1_r[3][4] ), .B1(n139), .B2(n55), .C1(n578), 
        .C2(\col2_r[3][4] ), .O(n1047) );
  AO222 U915 ( .A1(n31), .A2(\col2_r[3][3] ), .B1(pixel9[3]), .B2(n577), .C1(
        n583), .C2(\col3_r[3][3] ), .O(n1046) );
  AO222 U916 ( .A1(n42), .A2(\col1_r[3][3] ), .B1(n142), .B2(n579), .C1(n578), 
        .C2(\col2_r[3][3] ), .O(n1045) );
  AO222 U917 ( .A1(n30), .A2(\col2_r[3][2] ), .B1(pixel9[2]), .B2(n54), .C1(
        n583), .C2(\col3_r[3][2] ), .O(n1044) );
  AO222 U918 ( .A1(n580), .A2(\col1_r[3][2] ), .B1(n145), .B2(n55), .C1(n578), 
        .C2(\col2_r[3][2] ), .O(n1043) );
  AO222 U919 ( .A1(n30), .A2(\col2_r[3][1] ), .B1(pixel9[1]), .B2(n54), .C1(
        \col3_r[3][1] ), .C2(n609), .O(n1042) );
  AO222 U920 ( .A1(n580), .A2(\col1_r[3][1] ), .B1(n148), .B2(n55), .C1(n578), 
        .C2(\col2_r[3][1] ), .O(n1041) );
  AO222 U921 ( .A1(n31), .A2(\col2_r[3][0] ), .B1(pixel9[0]), .B2(n54), .C1(
        \col3_r[3][0] ), .C2(n592), .O(n1040) );
  AO222 U922 ( .A1(n42), .A2(\col1_r[3][0] ), .B1(n151), .B2(n55), .C1(n578), 
        .C2(\col2_r[3][0] ), .O(n1039) );
  NR2 U923 ( .I1(n582), .I2(n110), .O(n585) );
  AO222 U924 ( .A1(n33), .A2(\col2_r[4][7] ), .B1(n606), .B2(\col3_r[4][7] ), 
        .C1(n130), .C2(n585), .O(n1038) );
  ND3 U925 ( .I1(n581), .I2(n48), .I3(n118), .O(n587) );
  NR2 U926 ( .I1(n582), .I2(n616), .O(n586) );
  AO222 U927 ( .A1(n43), .A2(\col1_r[4][7] ), .B1(n619), .B2(\col2_r[4][7] ), 
        .C1(n131), .C2(n586), .O(n1037) );
  AO222 U928 ( .A1(n32), .A2(\col2_r[4][6] ), .B1(n134), .B2(n56), .C1(n583), 
        .C2(\col3_r[4][6] ), .O(n1036) );
  AO222 U929 ( .A1(n587), .A2(\col1_r[4][6] ), .B1(pixel9[6]), .B2(n57), .C1(
        n621), .C2(\col2_r[4][6] ), .O(n1035) );
  AO222 U930 ( .A1(n32), .A2(\col2_r[4][5] ), .B1(n137), .B2(n585), .C1(n590), 
        .C2(\col3_r[4][5] ), .O(n1034) );
  AO222 U931 ( .A1(n587), .A2(\col1_r[4][5] ), .B1(pixel9[5]), .B2(n586), .C1(
        n621), .C2(\col2_r[4][5] ), .O(n1033) );
  AO222 U932 ( .A1(n33), .A2(\col2_r[4][4] ), .B1(n140), .B2(n56), .C1(n590), 
        .C2(\col3_r[4][4] ), .O(n1032) );
  AO222 U933 ( .A1(n43), .A2(\col1_r[4][4] ), .B1(pixel9[4]), .B2(n57), .C1(
        n621), .C2(\col2_r[4][4] ), .O(n1031) );
  AO222 U934 ( .A1(n33), .A2(\col2_r[4][3] ), .B1(n143), .B2(n585), .C1(n590), 
        .C2(\col3_r[4][3] ), .O(n1030) );
  AO222 U935 ( .A1(n43), .A2(\col1_r[4][3] ), .B1(pixel9[3]), .B2(n586), .C1(
        n621), .C2(\col2_r[4][3] ), .O(n1029) );
  AO222 U936 ( .A1(n32), .A2(\col2_r[4][2] ), .B1(n146), .B2(n56), .C1(n590), 
        .C2(\col3_r[4][2] ), .O(n1028) );
  AO222 U937 ( .A1(n587), .A2(\col1_r[4][2] ), .B1(pixel9[2]), .B2(n57), .C1(
        n621), .C2(\col2_r[4][2] ), .O(n1027) );
  AO222 U938 ( .A1(n32), .A2(\col2_r[4][1] ), .B1(n149), .B2(n56), .C1(
        \col3_r[4][1] ), .C2(n593), .O(n1026) );
  AO222 U939 ( .A1(n587), .A2(\col1_r[4][1] ), .B1(pixel9[1]), .B2(n57), .C1(
        n591), .C2(\col2_r[4][1] ), .O(n1025) );
  AO222 U940 ( .A1(n33), .A2(\col2_r[4][0] ), .B1(n152), .B2(n56), .C1(
        \col3_r[4][0] ), .C2(n592), .O(n1024) );
  AO222 U941 ( .A1(n43), .A2(\col1_r[4][0] ), .B1(pixel9[0]), .B2(n57), .C1(
        n591), .C2(\col2_r[4][0] ), .O(n1023) );
  NR2 U942 ( .I1(n589), .I2(n599), .O(n594) );
  AO222 U943 ( .A1(n35), .A2(\col2_r[5][7] ), .B1(n606), .B2(\col3_r[5][7] ), 
        .C1(pixel9[7]), .C2(n594), .O(n1022) );
  ND3 U944 ( .I1(n588), .I2(n614), .I3(n602), .O(n596) );
  NR2 U945 ( .I1(n589), .I2(n111), .O(n595) );
  AO222 U946 ( .A1(n596), .A2(\col1_r[5][7] ), .B1(n617), .B2(\col2_r[5][7] ), 
        .C1(n130), .C2(n595), .O(n1021) );
  AO222 U947 ( .A1(n34), .A2(\col2_r[5][6] ), .B1(n133), .B2(n58), .C1(n590), 
        .C2(\col3_r[5][6] ), .O(n1020) );
  AO222 U948 ( .A1(n44), .A2(\col1_r[5][6] ), .B1(n134), .B2(n59), .C1(n591), 
        .C2(\col2_r[5][6] ), .O(n1019) );
  AO222 U949 ( .A1(n34), .A2(\col2_r[5][5] ), .B1(n136), .B2(n594), .C1(n590), 
        .C2(\col3_r[5][5] ), .O(n1018) );
  AO222 U950 ( .A1(n44), .A2(\col1_r[5][5] ), .B1(n137), .B2(n595), .C1(n591), 
        .C2(\col2_r[5][5] ), .O(n1017) );
  AO222 U951 ( .A1(n35), .A2(\col2_r[5][4] ), .B1(n139), .B2(n58), .C1(n607), 
        .C2(\col3_r[5][4] ), .O(n1016) );
  AO222 U952 ( .A1(n596), .A2(\col1_r[5][4] ), .B1(n140), .B2(n59), .C1(n591), 
        .C2(\col2_r[5][4] ), .O(n1015) );
  AO222 U953 ( .A1(n35), .A2(\col2_r[5][3] ), .B1(n142), .B2(n594), .C1(n607), 
        .C2(\col3_r[5][3] ), .O(n1014) );
  AO222 U954 ( .A1(n596), .A2(\col1_r[5][3] ), .B1(n143), .B2(n595), .C1(n608), 
        .C2(\col2_r[5][3] ), .O(n1013) );
  AO222 U955 ( .A1(n34), .A2(\col2_r[5][2] ), .B1(n145), .B2(n58), .C1(n607), 
        .C2(\col3_r[5][2] ), .O(n1012) );
  AO222 U956 ( .A1(n44), .A2(\col1_r[5][2] ), .B1(n146), .B2(n59), .C1(n591), 
        .C2(\col2_r[5][2] ), .O(n1011) );
  AO222 U957 ( .A1(n34), .A2(\col2_r[5][1] ), .B1(n148), .B2(n58), .C1(
        \col3_r[5][1] ), .C2(n592), .O(n1010) );
  AO222 U958 ( .A1(n44), .A2(\col1_r[5][1] ), .B1(n149), .B2(n59), .C1(n608), 
        .C2(\col2_r[5][1] ), .O(n1009) );
  AO222 U959 ( .A1(n35), .A2(\col2_r[5][0] ), .B1(n151), .B2(n58), .C1(
        \col3_r[5][0] ), .C2(n593), .O(n1008) );
  AO222 U960 ( .A1(n596), .A2(\col1_r[5][0] ), .B1(n152), .B2(n59), .C1(n608), 
        .C2(\col2_r[5][0] ), .O(n1007) );
  INV1S U961 ( .I(n597), .O(n774) );
  NR2 U962 ( .I1(n604), .I2(n599), .O(n610) );
  AO222 U963 ( .A1(n37), .A2(\col2_r[6][7] ), .B1(n600), .B2(\col3_r[6][7] ), 
        .C1(n131), .C2(n610), .O(n1006) );
  ND3 U964 ( .I1(n603), .I2(n48), .I3(n117), .O(n612) );
  NR2 U965 ( .I1(n604), .I2(n111), .O(n611) );
  AO222 U966 ( .A1(n45), .A2(\col1_r[6][7] ), .B1(n617), .B2(\col2_r[6][7] ), 
        .C1(pixel9[7]), .C2(n611), .O(n1005) );
  AO222 U967 ( .A1(n36), .A2(\col2_r[6][6] ), .B1(pixel9[6]), .B2(n60), .C1(
        n606), .C2(\col3_r[6][6] ), .O(n1004) );
  AO222 U968 ( .A1(n612), .A2(\col1_r[6][6] ), .B1(n133), .B2(n61), .C1(n608), 
        .C2(\col2_r[6][6] ), .O(n1003) );
  AO222 U969 ( .A1(n36), .A2(\col2_r[6][5] ), .B1(pixel9[5]), .B2(n610), .C1(
        n607), .C2(\col3_r[6][5] ), .O(n1002) );
  AO222 U970 ( .A1(n612), .A2(\col1_r[6][5] ), .B1(n136), .B2(n611), .C1(n608), 
        .C2(\col2_r[6][5] ), .O(n1001) );
  AO222 U971 ( .A1(n37), .A2(\col2_r[6][4] ), .B1(pixel9[4]), .B2(n60), .C1(
        n606), .C2(\col3_r[6][4] ), .O(n1000) );
  AO222 U972 ( .A1(n45), .A2(\col1_r[6][4] ), .B1(n139), .B2(n61), .C1(n618), 
        .C2(\col2_r[6][4] ), .O(n999) );
  AO222 U973 ( .A1(n37), .A2(\col2_r[6][3] ), .B1(pixel9[3]), .B2(n610), .C1(
        n606), .C2(\col3_r[6][3] ), .O(n998) );
  AO222 U974 ( .A1(n45), .A2(\col1_r[6][3] ), .B1(n142), .B2(n611), .C1(n618), 
        .C2(\col2_r[6][3] ), .O(n997) );
  AO222 U975 ( .A1(n36), .A2(\col2_r[6][2] ), .B1(pixel9[2]), .B2(n60), .C1(
        n607), .C2(\col3_r[6][2] ), .O(n996) );
  AO222 U976 ( .A1(n612), .A2(\col1_r[6][2] ), .B1(n145), .B2(n61), .C1(n608), 
        .C2(\col2_r[6][2] ), .O(n995) );
  AO222 U977 ( .A1(n36), .A2(\col2_r[6][1] ), .B1(pixel9[1]), .B2(n60), .C1(
        \col3_r[6][1] ), .C2(n609), .O(n994) );
  AO222 U978 ( .A1(n612), .A2(\col1_r[6][1] ), .B1(n148), .B2(n61), .C1(n618), 
        .C2(\col2_r[6][1] ), .O(n993) );
  AO222 U979 ( .A1(n37), .A2(\col2_r[6][0] ), .B1(pixel9[0]), .B2(n60), .C1(
        \col3_r[6][0] ), .C2(n609), .O(n992) );
  AO222 U980 ( .A1(n45), .A2(\col1_r[6][0] ), .B1(n151), .B2(n61), .C1(n618), 
        .C2(\col2_r[6][0] ), .O(n991) );
  MOAI1S U981 ( .A1(n122), .A2(n67), .B1(\col2_r[7][7] ), .B2(n124), .O(n990)
         );
  NR2 U982 ( .I1(n623), .I2(n111), .O(n622) );
  AO222 U983 ( .A1(n63), .A2(\col1_r[7][7] ), .B1(n617), .B2(\col2_r[7][7] ), 
        .C1(n130), .C2(n622), .O(n989) );
  MOAI1S U984 ( .A1(n123), .A2(n68), .B1(\col2_r[7][6] ), .B2(n122), .O(n988)
         );
  AO222 U985 ( .A1(n62), .A2(\col1_r[7][6] ), .B1(n134), .B2(n64), .C1(n619), 
        .C2(\col2_r[7][6] ), .O(n987) );
  MOAI1S U986 ( .A1(n124), .A2(n69), .B1(\col2_r[7][5] ), .B2(n123), .O(n986)
         );
  AO222 U987 ( .A1(n62), .A2(\col1_r[7][5] ), .B1(n137), .B2(n622), .C1(n618), 
        .C2(\col2_r[7][5] ), .O(n985) );
  MOAI1S U988 ( .A1(n122), .A2(n70), .B1(\col2_r[7][4] ), .B2(n124), .O(n984)
         );
  AO222 U989 ( .A1(n63), .A2(\col1_r[7][4] ), .B1(n140), .B2(n64), .C1(n619), 
        .C2(\col2_r[7][4] ), .O(n983) );
  MOAI1S U990 ( .A1(n123), .A2(n71), .B1(\col2_r[7][3] ), .B2(n122), .O(n982)
         );
  AO222 U991 ( .A1(n63), .A2(\col1_r[7][3] ), .B1(n143), .B2(n622), .C1(n619), 
        .C2(\col2_r[7][3] ), .O(n981) );
  MOAI1S U992 ( .A1(n124), .A2(n72), .B1(\col2_r[7][2] ), .B2(n123), .O(n980)
         );
  AO222 U993 ( .A1(n62), .A2(\col1_r[7][2] ), .B1(n146), .B2(n64), .C1(n618), 
        .C2(\col2_r[7][2] ), .O(n979) );
  MOAI1S U994 ( .A1(n122), .A2(n73), .B1(\col2_r[7][1] ), .B2(n124), .O(n978)
         );
  AO222 U995 ( .A1(n62), .A2(\col1_r[7][1] ), .B1(n149), .B2(n64), .C1(n619), 
        .C2(\col2_r[7][1] ), .O(n977) );
  MOAI1S U996 ( .A1(n123), .A2(n74), .B1(\col2_r[7][0] ), .B2(n122), .O(n976)
         );
  AO222 U997 ( .A1(n63), .A2(\col1_r[7][0] ), .B1(n152), .B2(n64), .C1(n621), 
        .C2(\col2_r[7][0] ), .O(n975) );
  AOI22S U998 ( .A1(n652), .A2(\col2_r[2][0] ), .B1(n639), .B2(\col2_r[1][0] ), 
        .O(n627) );
  AOI22S U999 ( .A1(n677), .A2(\col2_r[5][0] ), .B1(n632), .B2(\col2_r[3][0] ), 
        .O(n626) );
  INV1S U1000 ( .I(n623), .O(n791) );
  AOI22S U1001 ( .A1(n791), .A2(\col2_r[6][0] ), .B1(n624), .B2(\col2_r[4][0] ), .O(n625) );
  ND3 U1002 ( .I1(n627), .I2(n626), .I3(n625), .O(n628) );
  OAI22S U1003 ( .A1(n644), .A2(n628), .B1(\col2_r[0][0] ), .B2(n628), .O(n630) );
  BUF1 U1004 ( .I(n629), .O(n659) );
  MOAI1S U1005 ( .A1(n630), .A2(n659), .B1(cen_r[0]), .B2(n658), .O(n974) );
  MOAI1S U1006 ( .A1(n631), .A2(n659), .B1(col_last_buf_r), .B2(n658), .O(n973) );
  AOI22S U1007 ( .A1(n652), .A2(\col2_r[2][1] ), .B1(n639), .B2(\col2_r[1][1] ), .O(n636) );
  AOI22S U1008 ( .A1(n653), .A2(\col2_r[5][1] ), .B1(n632), .B2(\col2_r[3][1] ), .O(n635) );
  INV1S U1009 ( .I(n633), .O(n669) );
  AOI22S U1010 ( .A1(n791), .A2(\col2_r[6][1] ), .B1(n669), .B2(\col2_r[4][1] ), .O(n634) );
  ND3 U1011 ( .I1(n636), .I2(n635), .I3(n634), .O(n637) );
  OAI22S U1012 ( .A1(n644), .A2(n637), .B1(\col2_r[0][1] ), .B2(n637), .O(n638) );
  MOAI1S U1013 ( .A1(n638), .A2(n659), .B1(cen_r[1]), .B2(n658), .O(n971) );
  AOI22S U1014 ( .A1(n652), .A2(\col2_r[2][2] ), .B1(n639), .B2(\col2_r[1][2] ), .O(n642) );
  AOI22S U1015 ( .A1(n677), .A2(\col2_r[5][2] ), .B1(n667), .B2(\col2_r[3][2] ), .O(n641) );
  AOI22S U1016 ( .A1(n791), .A2(\col2_r[6][2] ), .B1(n669), .B2(\col2_r[4][2] ), .O(n640) );
  ND3 U1017 ( .I1(n642), .I2(n641), .I3(n640), .O(n643) );
  OAI22S U1018 ( .A1(n644), .A2(n643), .B1(\col2_r[0][2] ), .B2(n643), .O(n645) );
  MOAI1S U1019 ( .A1(n645), .A2(n659), .B1(cen_r[2]), .B2(n658), .O(n970) );
  AOI22S U1020 ( .A1(n652), .A2(\col2_r[2][3] ), .B1(n675), .B2(\col2_r[1][3] ), .O(n649) );
  AOI22S U1021 ( .A1(n668), .A2(\col2_r[5][3] ), .B1(n646), .B2(\col2_r[3][3] ), .O(n648) );
  AOI22S U1022 ( .A1(n791), .A2(\col2_r[6][3] ), .B1(n669), .B2(\col2_r[4][3] ), .O(n647) );
  ND3 U1023 ( .I1(n649), .I2(n648), .I3(n647), .O(n650) );
  OAI22S U1024 ( .A1(n683), .A2(n650), .B1(\col2_r[0][3] ), .B2(n650), .O(n651) );
  MOAI1S U1025 ( .A1(n651), .A2(n659), .B1(cen_r[3]), .B2(n658), .O(n969) );
  AOI22S U1026 ( .A1(n652), .A2(\col2_r[2][4] ), .B1(n675), .B2(\col2_r[1][4] ), .O(n656) );
  AOI22S U1027 ( .A1(n653), .A2(\col2_r[5][4] ), .B1(n667), .B2(\col2_r[3][4] ), .O(n655) );
  AOI22S U1028 ( .A1(n678), .A2(\col2_r[6][4] ), .B1(n669), .B2(\col2_r[4][4] ), .O(n654) );
  ND3 U1029 ( .I1(n656), .I2(n655), .I3(n654), .O(n657) );
  OAI22S U1030 ( .A1(n683), .A2(n657), .B1(\col2_r[0][4] ), .B2(n657), .O(n660) );
  MOAI1S U1031 ( .A1(n660), .A2(n659), .B1(cen_r[4]), .B2(n658), .O(n968) );
  AOI22S U1032 ( .A1(n789), .A2(\col2_r[2][5] ), .B1(n675), .B2(\col2_r[1][5] ), .O(n664) );
  AOI22S U1033 ( .A1(n661), .A2(\col2_r[5][5] ), .B1(n667), .B2(\col2_r[3][5] ), .O(n663) );
  AOI22S U1034 ( .A1(n791), .A2(\col2_r[6][5] ), .B1(n669), .B2(\col2_r[4][5] ), .O(n662) );
  ND3 U1035 ( .I1(n664), .I2(n663), .I3(n662), .O(n665) );
  OAI22S U1036 ( .A1(n683), .A2(n665), .B1(\col2_r[0][5] ), .B2(n665), .O(n666) );
  MOAI1S U1037 ( .A1(n666), .A2(n798), .B1(cen_r[5]), .B2(n797), .O(n967) );
  AOI22S U1038 ( .A1(n789), .A2(\col2_r[2][6] ), .B1(n675), .B2(\col2_r[1][6] ), .O(n672) );
  AOI22S U1039 ( .A1(n668), .A2(\col2_r[5][6] ), .B1(n667), .B2(\col2_r[3][6] ), .O(n671) );
  AOI22S U1040 ( .A1(n678), .A2(\col2_r[6][6] ), .B1(n669), .B2(\col2_r[4][6] ), .O(n670) );
  ND3 U1041 ( .I1(n672), .I2(n671), .I3(n670), .O(n673) );
  OAI22S U1042 ( .A1(n683), .A2(n673), .B1(\col2_r[0][6] ), .B2(n673), .O(n674) );
  MOAI1S U1043 ( .A1(n674), .A2(n798), .B1(cen_r[6]), .B2(n797), .O(n966) );
  AOI22S U1044 ( .A1(n789), .A2(\col2_r[2][7] ), .B1(n675), .B2(\col2_r[1][7] ), .O(n681) );
  AOI22S U1045 ( .A1(n677), .A2(\col2_r[5][7] ), .B1(n676), .B2(\col2_r[3][7] ), .O(n680) );
  AOI22S U1046 ( .A1(n678), .A2(\col2_r[6][7] ), .B1(n792), .B2(\col2_r[4][7] ), .O(n679) );
  ND3 U1047 ( .I1(n681), .I2(n680), .I3(n679), .O(n682) );
  OAI22S U1048 ( .A1(n683), .A2(n682), .B1(\col2_r[0][7] ), .B2(n682), .O(n684) );
  MOAI1S U1049 ( .A1(n684), .A2(n798), .B1(cen_r[7]), .B2(n797), .O(n965) );
  FA1S U1050 ( .A(n687), .B(n686), .CI(n685), .CO(n690), .S(n688) );
  INV1S U1051 ( .I(n688), .O(n689) );
  MOAI1S U1052 ( .A1(n705), .A2(n689), .B1(n710), .B2(ver_sum_r[1]), .O(n963)
         );
  FA1S U1053 ( .A(n692), .B(n691), .CI(n690), .CO(n695), .S(n693) );
  INV1S U1054 ( .I(n693), .O(n694) );
  MOAI1S U1055 ( .A1(n705), .A2(n694), .B1(n710), .B2(ver_sum_r[2]), .O(n962)
         );
  FA1S U1056 ( .A(n697), .B(n696), .CI(n695), .CO(n700), .S(n698) );
  INV1S U1057 ( .I(n698), .O(n699) );
  MOAI1S U1058 ( .A1(n705), .A2(n699), .B1(n710), .B2(ver_sum_r[3]), .O(n961)
         );
  FA1S U1059 ( .A(n702), .B(n701), .CI(n700), .CO(n332), .S(n703) );
  INV1S U1060 ( .I(n703), .O(n704) );
  MOAI1S U1061 ( .A1(n705), .A2(n704), .B1(n710), .B2(ver_sum_r[4]), .O(n960)
         );
  MOAI1S U1062 ( .A1(n709), .A2(n708), .B1(n707), .B2(n706), .O(
        \intadd_12/A[0] ) );
  INV1S U1063 ( .I(n712), .O(n713) );
  MOAI1S U1064 ( .A1(n801), .A2(n713), .B1(n717), .B2(down_sum_r[0]), .O(n944)
         );
  FA1S U1065 ( .A(n148), .B(n715), .CI(n714), .CO(n719), .S(n716) );
  INV1S U1066 ( .I(n716), .O(n718) );
  MOAI1S U1067 ( .A1(n801), .A2(n718), .B1(n717), .B2(down_sum_r[1]), .O(n943)
         );
  FA1S U1068 ( .A(n145), .B(n720), .CI(n719), .CO(n723), .S(n721) );
  INV1S U1069 ( .I(n721), .O(n722) );
  MOAI1S U1070 ( .A1(n801), .A2(n722), .B1(n799), .B2(down_sum_r[2]), .O(n942)
         );
  FA1S U1071 ( .A(n142), .B(n724), .CI(n723), .CO(n727), .S(n725) );
  INV1S U1072 ( .I(n725), .O(n726) );
  MOAI1S U1073 ( .A1(n801), .A2(n726), .B1(n799), .B2(down_sum_r[3]), .O(n941)
         );
  FA1S U1074 ( .A(n139), .B(n728), .CI(n727), .CO(n306), .S(n729) );
  INV1S U1075 ( .I(n729), .O(n730) );
  MOAI1S U1076 ( .A1(n801), .A2(n730), .B1(n799), .B2(down_sum_r[4]), .O(n940)
         );
  MOAI1S U1077 ( .A1(n734), .A2(n733), .B1(n732), .B2(n731), .O(
        \intadd_11/A[0] ) );
  INV1S U1078 ( .I(n735), .O(n758) );
  INV1S U1079 ( .I(n736), .O(n762) );
  AOI22S U1080 ( .A1(n758), .A2(\col3_r[1][2] ), .B1(n762), .B2(\col3_r[0][2] ), .O(n741) );
  AOI22S U1081 ( .A1(n737), .A2(\col3_r[5][2] ), .B1(n781), .B2(\col3_r[4][2] ), .O(n740) );
  AOI22S U1082 ( .A1(n738), .A2(\col3_r[2][2] ), .B1(n770), .B2(\col3_r[3][2] ), .O(n739) );
  AOI22S U1083 ( .A1(n758), .A2(\col1_r[1][2] ), .B1(n762), .B2(\col1_r[0][2] ), .O(n746) );
  INV1S U1084 ( .I(n742), .O(n763) );
  AOI22S U1085 ( .A1(n763), .A2(\col1_r[5][2] ), .B1(n790), .B2(\col1_r[4][2] ), .O(n745) );
  INV1S U1086 ( .I(n743), .O(n793) );
  AOI22S U1087 ( .A1(n793), .A2(\col1_r[2][2] ), .B1(n770), .B2(\col1_r[3][2] ), .O(n744) );
  AOI22S U1088 ( .A1(n758), .A2(\col3_r[1][3] ), .B1(n762), .B2(\col3_r[0][3] ), .O(n750) );
  AOI22S U1089 ( .A1(n763), .A2(\col3_r[5][3] ), .B1(n774), .B2(\col3_r[4][3] ), .O(n749) );
  INV1S U1090 ( .I(n747), .O(n783) );
  AOI22S U1091 ( .A1(n793), .A2(\col3_r[2][3] ), .B1(n783), .B2(\col3_r[3][3] ), .O(n748) );
  AOI22S U1092 ( .A1(n758), .A2(\col1_r[1][3] ), .B1(n762), .B2(\col1_r[0][3] ), .O(n754) );
  AOI22S U1093 ( .A1(n763), .A2(\col1_r[5][3] ), .B1(n790), .B2(\col1_r[4][3] ), .O(n753) );
  AOI22S U1094 ( .A1(n751), .A2(\col1_r[2][3] ), .B1(n783), .B2(\col1_r[3][3] ), .O(n752) );
  AOI22S U1095 ( .A1(n758), .A2(\col3_r[1][4] ), .B1(n762), .B2(\col3_r[0][4] ), .O(n757) );
  AOI22S U1096 ( .A1(n763), .A2(\col3_r[5][4] ), .B1(n790), .B2(\col3_r[4][4] ), .O(n756) );
  AOI22S U1097 ( .A1(n793), .A2(\col3_r[2][4] ), .B1(n770), .B2(\col3_r[3][4] ), .O(n755) );
  AOI22S U1098 ( .A1(n758), .A2(\col1_r[1][4] ), .B1(n779), .B2(\col1_r[0][4] ), .O(n761) );
  AOI22S U1099 ( .A1(n763), .A2(\col1_r[5][4] ), .B1(n774), .B2(\col1_r[4][4] ), .O(n760) );
  AOI22S U1100 ( .A1(n793), .A2(\col1_r[2][4] ), .B1(n783), .B2(\col1_r[3][4] ), .O(n759) );
  AOI22S U1101 ( .A1(n780), .A2(\col3_r[1][5] ), .B1(n762), .B2(\col3_r[0][5] ), .O(n766) );
  AOI22S U1102 ( .A1(n763), .A2(\col3_r[5][5] ), .B1(n774), .B2(\col3_r[4][5] ), .O(n765) );
  AOI22S U1103 ( .A1(n793), .A2(\col3_r[2][5] ), .B1(n783), .B2(\col3_r[3][5] ), .O(n764) );
  AOI22S U1104 ( .A1(n780), .A2(\col1_r[1][5] ), .B1(n779), .B2(\col1_r[0][5] ), .O(n769) );
  AOI22S U1105 ( .A1(n782), .A2(\col1_r[5][5] ), .B1(n790), .B2(\col1_r[4][5] ), .O(n768) );
  AOI22S U1106 ( .A1(n784), .A2(\col1_r[2][5] ), .B1(n783), .B2(\col1_r[3][5] ), .O(n767) );
  AOI22S U1107 ( .A1(n780), .A2(\col3_r[1][6] ), .B1(n779), .B2(\col3_r[0][6] ), .O(n773) );
  AOI22S U1108 ( .A1(n782), .A2(\col3_r[5][6] ), .B1(n774), .B2(\col3_r[4][6] ), .O(n772) );
  AOI22S U1109 ( .A1(n784), .A2(\col3_r[2][6] ), .B1(n770), .B2(\col3_r[3][6] ), .O(n771) );
  AOI22S U1110 ( .A1(n780), .A2(\col1_r[1][6] ), .B1(n779), .B2(\col1_r[0][6] ), .O(n778) );
  AOI22S U1111 ( .A1(n782), .A2(\col1_r[5][6] ), .B1(n774), .B2(\col1_r[4][6] ), .O(n777) );
  AOI22S U1112 ( .A1(n784), .A2(\col1_r[2][6] ), .B1(n775), .B2(\col1_r[3][6] ), .O(n776) );
  AOI22S U1113 ( .A1(n780), .A2(\col3_r[1][7] ), .B1(n779), .B2(\col3_r[0][7] ), .O(n787) );
  AOI22S U1114 ( .A1(n782), .A2(\col3_r[5][7] ), .B1(n781), .B2(\col3_r[4][7] ), .O(n786) );
  AOI22S U1115 ( .A1(n784), .A2(\col3_r[2][7] ), .B1(n783), .B2(\col3_r[3][7] ), .O(n785) );
  AOI22S U1116 ( .A1(n789), .A2(\col1_r[1][7] ), .B1(n788), .B2(\col1_r[0][7] ), .O(n796) );
  AOI22S U1117 ( .A1(n791), .A2(\col1_r[5][7] ), .B1(n790), .B2(\col1_r[4][7] ), .O(n795) );
  AOI22S U1118 ( .A1(n793), .A2(\col1_r[2][7] ), .B1(n792), .B2(\col1_r[3][7] ), .O(n794) );
  MOAI1S U1119 ( .A1(\intadd_11/n1 ), .A2(n798), .B1(up_sum_r[8]), .B2(n797), 
        .O(n926) );
  INV1S U1120 ( .I(end_pic_r), .O(n800) );
  MOAI1S U1121 ( .A1(n801), .A2(n800), .B1(n799), .B2(pic_last_buf_r), .O(n924) );
  NR2 U1122 ( .I1(ver_sum_r[1]), .I2(hor_sum_r[1]), .O(n803) );
  ND2S U1123 ( .I1(ver_sum_r[0]), .I2(hor_sum_r[0]), .O(n802) );
  MOAI1S U1124 ( .A1(n803), .A2(n802), .B1(ver_sum_r[1]), .B2(hor_sum_r[1]), 
        .O(\intadd_10/CI ) );
  AO222 U1125 ( .A1(n100), .A2(G_data_r[7]), .B1(n66), .B2(\intadd_10/n1 ), 
        .C1(cen_r[7]), .C2(n804), .O(n922) );
  AO222 U1126 ( .A1(n65), .A2(\intadd_10/SUM[6] ), .B1(n102), .B2(G_data_r[6]), 
        .C1(cen_r[6]), .C2(n804), .O(n921) );
  AO222 U1127 ( .A1(n66), .A2(\intadd_10/SUM[5] ), .B1(n100), .B2(G_data_r[5]), 
        .C1(cen_r[5]), .C2(n804), .O(n920) );
  AO222 U1128 ( .A1(n65), .A2(\intadd_10/SUM[4] ), .B1(n101), .B2(G_data_r[4]), 
        .C1(cen_r[4]), .C2(n804), .O(n919) );
  AO222 U1129 ( .A1(n66), .A2(\intadd_10/SUM[3] ), .B1(n102), .B2(G_data_r[3]), 
        .C1(cen_r[3]), .C2(n804), .O(n918) );
  AO222 U1130 ( .A1(n65), .A2(\intadd_10/SUM[2] ), .B1(n100), .B2(G_data_r[2]), 
        .C1(cen_r[2]), .C2(n112), .O(n917) );
  AO222 U1131 ( .A1(n66), .A2(\intadd_10/SUM[1] ), .B1(n101), .B2(G_data_r[1]), 
        .C1(cen_r[1]), .C2(n112), .O(n916) );
  AO222 U1132 ( .A1(n65), .A2(\intadd_10/SUM[0] ), .B1(n102), .B2(G_data_r[0]), 
        .C1(cen_r[0]), .C2(n112), .O(n915) );
  NR2 U1133 ( .I1(down_sum_r[1]), .I2(up_sum_r[1]), .O(n806) );
  ND2S U1134 ( .I1(down_sum_r[0]), .I2(up_sum_r[0]), .O(n805) );
  MOAI1S U1135 ( .A1(n806), .A2(n805), .B1(down_sum_r[1]), .B2(up_sum_r[1]), 
        .O(\intadd_9/CI ) );
  ND2S U1136 ( .I1(logic_state_r[1]), .I2(n20), .O(n808) );
  ND2S U1137 ( .I1(n809), .I2(n808), .O(n807) );
  MOAI1S U1138 ( .A1(logic_state_r[0]), .A2(n808), .B1(color[1]), .B2(n807), 
        .O(n906) );
  ND2S U1139 ( .I1(n809), .I2(n811), .O(n810) );
  MOAI1S U1140 ( .A1(logic_state_r[1]), .A2(n811), .B1(color[0]), .B2(n810), 
        .O(n905) );
  AOI22S U1141 ( .A1(n128), .A2(\intadd_9/n1 ), .B1(ver_sum_r[8]), .B2(n104), 
        .O(n814) );
  AOI22S U1142 ( .A1(n79), .A2(B_data_r[7]), .B1(hor_sum_r[8]), .B2(n125), .O(
        n813) );
  AOI22S U1143 ( .A1(n107), .A2(cen_r[7]), .B1(n77), .B2(G_data_r[7]), .O(n812) );
  ND3 U1144 ( .I1(n814), .I2(n813), .I3(n812), .O(n815) );
  AO12 U1145 ( .B1(RGB_data[7]), .B2(n75), .A1(n815), .O(n904) );
  AOI22S U1146 ( .A1(n374), .A2(\intadd_9/SUM[6] ), .B1(ver_sum_r[7]), .B2(
        n105), .O(n818) );
  AOI22S U1147 ( .A1(n80), .A2(B_data_r[6]), .B1(hor_sum_r[7]), .B2(n377), .O(
        n817) );
  AOI22S U1148 ( .A1(n108), .A2(cen_r[6]), .B1(n842), .B2(G_data_r[6]), .O(
        n816) );
  ND3 U1149 ( .I1(n818), .I2(n817), .I3(n816), .O(n819) );
  AO12 U1150 ( .B1(RGB_data[6]), .B2(n76), .A1(n819), .O(n903) );
  AOI22S U1151 ( .A1(n127), .A2(\intadd_9/SUM[5] ), .B1(ver_sum_r[6]), .B2(
        n105), .O(n822) );
  AOI22S U1152 ( .A1(n80), .A2(B_data_r[5]), .B1(hor_sum_r[6]), .B2(n126), .O(
        n821) );
  AOI22S U1153 ( .A1(n106), .A2(cen_r[5]), .B1(n77), .B2(G_data_r[5]), .O(n820) );
  ND3 U1154 ( .I1(n822), .I2(n821), .I3(n820), .O(n823) );
  AO12 U1155 ( .B1(RGB_data[5]), .B2(n75), .A1(n823), .O(n902) );
  AOI22S U1156 ( .A1(n128), .A2(\intadd_9/SUM[4] ), .B1(ver_sum_r[5]), .B2(
        n104), .O(n826) );
  AOI22S U1157 ( .A1(n80), .A2(B_data_r[4]), .B1(hor_sum_r[5]), .B2(n125), .O(
        n825) );
  AOI22S U1158 ( .A1(n107), .A2(cen_r[4]), .B1(n842), .B2(G_data_r[4]), .O(
        n824) );
  ND3 U1159 ( .I1(n826), .I2(n825), .I3(n824), .O(n827) );
  AO12 U1160 ( .B1(RGB_data[4]), .B2(n76), .A1(n827), .O(n901) );
  AOI22S U1161 ( .A1(n374), .A2(\intadd_9/SUM[3] ), .B1(ver_sum_r[4]), .B2(
        n105), .O(n830) );
  AOI22S U1162 ( .A1(n79), .A2(B_data_r[3]), .B1(hor_sum_r[4]), .B2(n126), .O(
        n829) );
  AOI22S U1163 ( .A1(n108), .A2(cen_r[3]), .B1(n77), .B2(G_data_r[3]), .O(n828) );
  ND3 U1164 ( .I1(n830), .I2(n829), .I3(n828), .O(n831) );
  AO12 U1165 ( .B1(RGB_data[3]), .B2(n75), .A1(n831), .O(n900) );
  AOI22S U1166 ( .A1(n127), .A2(\intadd_9/SUM[2] ), .B1(ver_sum_r[3]), .B2(
        n373), .O(n834) );
  AOI22S U1167 ( .A1(n79), .A2(B_data_r[2]), .B1(hor_sum_r[3]), .B2(n126), .O(
        n833) );
  AOI22S U1168 ( .A1(n106), .A2(cen_r[2]), .B1(n77), .B2(G_data_r[2]), .O(n832) );
  ND3 U1169 ( .I1(n834), .I2(n833), .I3(n832), .O(n835) );
  AO12 U1170 ( .B1(RGB_data[2]), .B2(n76), .A1(n835), .O(n899) );
  AOI22S U1171 ( .A1(n128), .A2(\intadd_9/SUM[1] ), .B1(ver_sum_r[2]), .B2(
        n104), .O(n838) );
  AOI22S U1172 ( .A1(n79), .A2(B_data_r[1]), .B1(hor_sum_r[2]), .B2(n125), .O(
        n837) );
  AOI22S U1173 ( .A1(n107), .A2(cen_r[1]), .B1(n77), .B2(G_data_r[1]), .O(n836) );
  ND3 U1174 ( .I1(n838), .I2(n837), .I3(n836), .O(n839) );
  AO12 U1175 ( .B1(RGB_data[1]), .B2(n75), .A1(n839), .O(n898) );
  AOI22S U1176 ( .A1(n374), .A2(\intadd_9/SUM[0] ), .B1(ver_sum_r[1]), .B2(
        n105), .O(n845) );
  AOI22S U1177 ( .A1(n80), .A2(B_data_r[0]), .B1(hor_sum_r[1]), .B2(n377), .O(
        n844) );
  AOI22S U1178 ( .A1(n108), .A2(cen_r[0]), .B1(n842), .B2(G_data_r[0]), .O(
        n843) );
  ND3 U1179 ( .I1(n845), .I2(n844), .I3(n843), .O(n846) );
  AO12 U1180 ( .B1(RGB_data[0]), .B2(n76), .A1(n846), .O(n897) );
endmodule


module gamma_122 ( clk, rst_n, pixel_in, valid_in, color_in, last_pic_in, 
        pixel_out, valid_out, color_out, last_pic_out );
  input [7:0] pixel_in;
  input [1:0] color_in;
  output [7:0] pixel_out;
  output [1:0] color_out;
  input clk, rst_n, valid_in, last_pic_in;
  output valid_out, last_pic_out;
  wire   n_valid_out_reg, n_last_pic_out_reg, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277;
  wire   [1:0] n_color_out_reg;
  wire   [7:0] pixel_in_reg;
  wire   [7:0] n_pixel_out_reg;

  QDFFRBN \pixel_in_reg_reg[7]  ( .D(pixel_in[7]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[7]) );
  QDFFRBN \pixel_in_reg_reg[6]  ( .D(pixel_in[6]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[6]) );
  QDFFRBN \pixel_in_reg_reg[5]  ( .D(pixel_in[5]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[5]) );
  QDFFRBN \pixel_in_reg_reg[3]  ( .D(pixel_in[3]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[3]) );
  QDFFRBN \pixel_in_reg_reg[2]  ( .D(pixel_in[2]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[2]) );
  QDFFRBN \pixel_in_reg_reg[1]  ( .D(pixel_in[1]), .CK(clk), .RB(n276), .Q(
        pixel_in_reg[1]) );
  QDFFRBN \pixel_in_reg_reg[0]  ( .D(pixel_in[0]), .CK(clk), .RB(n276), .Q(
        pixel_in_reg[0]) );
  QDFFRBN valid_in_reg_reg ( .D(valid_in), .CK(clk), .RB(n276), .Q(
        n_valid_out_reg) );
  QDFFRBN \color_in_reg_reg[1]  ( .D(color_in[1]), .CK(clk), .RB(n276), .Q(
        n_color_out_reg[1]) );
  QDFFRBN \color_out_reg_reg[1]  ( .D(n_color_out_reg[1]), .CK(clk), .RB(n276), 
        .Q(color_out[1]) );
  QDFFRBN \color_in_reg_reg[0]  ( .D(color_in[0]), .CK(clk), .RB(n276), .Q(
        n_color_out_reg[0]) );
  QDFFRBN \color_out_reg_reg[0]  ( .D(n_color_out_reg[0]), .CK(clk), .RB(n275), 
        .Q(color_out[0]) );
  QDFFRBN last_pic_in_reg_reg ( .D(last_pic_in), .CK(clk), .RB(n275), .Q(
        n_last_pic_out_reg) );
  QDFFRBN last_pic_out_reg_reg ( .D(n_last_pic_out_reg), .CK(clk), .RB(n275), 
        .Q(last_pic_out) );
  QDFFRBN \pixel_out_reg_reg[7]  ( .D(n_pixel_out_reg[7]), .CK(clk), .RB(n275), 
        .Q(pixel_out[7]) );
  QDFFRBN \pixel_out_reg_reg[6]  ( .D(n_pixel_out_reg[6]), .CK(clk), .RB(n275), 
        .Q(pixel_out[6]) );
  QDFFRBN \pixel_out_reg_reg[5]  ( .D(n_pixel_out_reg[5]), .CK(clk), .RB(n275), 
        .Q(pixel_out[5]) );
  QDFFRBN \pixel_out_reg_reg[4]  ( .D(n_pixel_out_reg[4]), .CK(clk), .RB(n274), 
        .Q(pixel_out[4]) );
  QDFFRBN \pixel_out_reg_reg[3]  ( .D(n_pixel_out_reg[3]), .CK(clk), .RB(n274), 
        .Q(pixel_out[3]) );
  QDFFRBN \pixel_out_reg_reg[2]  ( .D(n_pixel_out_reg[2]), .CK(clk), .RB(n274), 
        .Q(pixel_out[2]) );
  QDFFRBN \pixel_out_reg_reg[1]  ( .D(n_pixel_out_reg[1]), .CK(clk), .RB(n274), 
        .Q(pixel_out[1]) );
  QDFFRBN \pixel_out_reg_reg[0]  ( .D(n_pixel_out_reg[0]), .CK(clk), .RB(n274), 
        .Q(pixel_out[0]) );
  QDFFRBN valid_out_reg_reg ( .D(n_valid_out_reg), .CK(clk), .RB(n274), .Q(
        valid_out) );
  QDLHN \n_pixel_out_reg_reg[0]  ( .CK(n26), .D(n255), .Q(n_pixel_out_reg[0])
         );
  QDLHN \n_pixel_out_reg_reg[4]  ( .CK(n26), .D(n251), .Q(n_pixel_out_reg[4])
         );
  QDLHN \n_pixel_out_reg_reg[3]  ( .CK(n26), .D(n252), .Q(n_pixel_out_reg[3])
         );
  QDLHN \n_pixel_out_reg_reg[2]  ( .CK(n257), .D(n253), .Q(n_pixel_out_reg[2])
         );
  QDLHN \n_pixel_out_reg_reg[1]  ( .CK(n257), .D(n254), .Q(n_pixel_out_reg[1])
         );
  QDLHN \n_pixel_out_reg_reg[7]  ( .CK(n257), .D(n256), .Q(n_pixel_out_reg[7])
         );
  QDLHN \n_pixel_out_reg_reg[5]  ( .CK(n257), .D(n250), .Q(n_pixel_out_reg[5])
         );
  QDLHN \n_pixel_out_reg_reg[6]  ( .CK(n257), .D(n249), .Q(n_pixel_out_reg[6])
         );
  QDFFRBN \pixel_in_reg_reg[4]  ( .D(pixel_in[4]), .CK(clk), .RB(n277), .Q(
        pixel_in_reg[4]) );
  BUF1 U3 ( .I(n189), .O(n12) );
  BUF1 U4 ( .I(n173), .O(n11) );
  BUF1 U5 ( .I(n260), .O(n2) );
  AN2 U6 ( .I1(n82), .I2(n220), .O(n1) );
  INV1S U7 ( .I(n239), .O(n3) );
  INV1S U8 ( .I(n3), .O(n4) );
  INV1S U9 ( .I(n233), .O(n5) );
  INV1S U10 ( .I(n5), .O(n6) );
  INV1S U11 ( .I(n239), .O(n7) );
  INV1S U12 ( .I(n226), .O(n8) );
  INV1S U13 ( .I(n195), .O(n9) );
  INV1S U14 ( .I(n9), .O(n10) );
  INV1S U15 ( .I(n1), .O(n13) );
  INV1S U16 ( .I(n1), .O(n14) );
  INV1S U17 ( .I(n169), .O(n15) );
  INV1S U18 ( .I(n169), .O(n16) );
  INV1S U19 ( .I(n226), .O(n17) );
  INV1S U20 ( .I(n17), .O(n18) );
  INV1S U21 ( .I(n166), .O(n19) );
  INV1S U22 ( .I(n19), .O(n20) );
  INV1S U23 ( .I(n221), .O(n21) );
  INV1S U24 ( .I(n221), .O(n22) );
  INV1S U25 ( .I(n176), .O(n23) );
  INV1S U26 ( .I(n23), .O(n24) );
  INV1S U27 ( .I(n154), .O(n25) );
  BUF1 U28 ( .I(n257), .O(n26) );
  NR2 U29 ( .I1(pixel_in_reg[6]), .I2(n50), .O(n27) );
  NR2 U30 ( .I1(n9), .I2(n113), .O(n28) );
  INV1S U31 ( .I(n103), .O(n29) );
  INV1S U32 ( .I(pixel_in_reg[4]), .O(n30) );
  INV1S U33 ( .I(n30), .O(n31) );
  INV1S U34 ( .I(n30), .O(n32) );
  BUF1 U35 ( .I(rst_n), .O(n277) );
  OAI22S U36 ( .A1(n15), .A2(n209), .B1(n113), .B2(n209), .O(n114) );
  BUF1 U37 ( .I(rst_n), .O(n274) );
  BUF1 U38 ( .I(rst_n), .O(n275) );
  BUF1 U39 ( .I(rst_n), .O(n276) );
  INV1S U40 ( .I(pixel_in_reg[7]), .O(n50) );
  NR2 U41 ( .I1(pixel_in_reg[6]), .I2(n50), .O(n268) );
  INV1S U42 ( .I(pixel_in_reg[6]), .O(n39) );
  NR2 U43 ( .I1(pixel_in_reg[7]), .I2(n39), .O(n260) );
  NR2 U44 ( .I1(n27), .I2(n2), .O(n38) );
  INV1S U45 ( .I(pixel_in_reg[5]), .O(n194) );
  ND2S U46 ( .I1(n32), .I2(pixel_in_reg[3]), .O(n168) );
  NR2 U47 ( .I1(n194), .I2(n168), .O(n239) );
  INV1S U48 ( .I(pixel_in_reg[0]), .O(n113) );
  INV1S U49 ( .I(pixel_in_reg[2]), .O(n40) );
  NR2 U50 ( .I1(n40), .I2(pixel_in_reg[1]), .O(n195) );
  ND2S U51 ( .I1(n113), .I2(n195), .O(n233) );
  INV1S U52 ( .I(n6), .O(n142) );
  ND2S U53 ( .I1(pixel_in_reg[1]), .I2(n40), .O(n95) );
  NR2 U54 ( .I1(pixel_in_reg[2]), .I2(pixel_in_reg[1]), .O(n143) );
  ND2S U55 ( .I1(pixel_in_reg[0]), .I2(n143), .O(n207) );
  ND2S U56 ( .I1(n95), .I2(n207), .O(n238) );
  ND2S U57 ( .I1(pixel_in_reg[3]), .I2(n194), .O(n52) );
  NR2 U58 ( .I1(pixel_in_reg[4]), .I2(n52), .O(n176) );
  OA12 U59 ( .B1(n142), .B2(n238), .A1(n24), .O(n191) );
  ND2S U60 ( .I1(pixel_in_reg[2]), .I2(pixel_in_reg[1]), .O(n61) );
  NR2 U61 ( .I1(n61), .I2(pixel_in_reg[0]), .O(n173) );
  NR2 U62 ( .I1(n9), .I2(n113), .O(n167) );
  NR2 U63 ( .I1(n11), .I2(n28), .O(n105) );
  INV1S U64 ( .I(n168), .O(n153) );
  ND2S U65 ( .I1(n194), .I2(n153), .O(n221) );
  ND2S U66 ( .I1(pixel_in_reg[1]), .I2(pixel_in_reg[0]), .O(n125) );
  ND3 U67 ( .I1(n21), .I2(n40), .I3(n125), .O(n49) );
  OA12 U68 ( .B1(n105), .B2(n23), .A1(n49), .O(n33) );
  INV1S U69 ( .I(pixel_in_reg[3]), .O(n220) );
  ND3 U70 ( .I1(n32), .I2(n194), .I3(n220), .O(n226) );
  INV1S U71 ( .I(n61), .O(n227) );
  ND2S U72 ( .I1(pixel_in_reg[0]), .I2(n227), .O(n155) );
  INV1S U73 ( .I(n155), .O(n112) );
  ND2S U74 ( .I1(n24), .I2(n112), .O(n240) );
  ND3 U75 ( .I1(n33), .I2(n18), .I3(n240), .O(n269) );
  NR3 U76 ( .I1(n4), .I2(n191), .I3(n269), .O(n266) );
  ND2S U77 ( .I1(pixel_in_reg[5]), .I2(pixel_in_reg[3]), .O(n234) );
  NR2 U78 ( .I1(n234), .I2(n31), .O(n189) );
  INV1S U79 ( .I(n12), .O(n94) );
  ND2S U80 ( .I1(n220), .I2(pixel_in_reg[5]), .O(n34) );
  INV1S U81 ( .I(n34), .O(n41) );
  ND2S U82 ( .I1(n31), .I2(n41), .O(n169) );
  ND2S U83 ( .I1(n94), .I2(n169), .O(n157) );
  NR2 U84 ( .I1(n34), .I2(n32), .O(n166) );
  NR2 U85 ( .I1(n40), .I2(n19), .O(n35) );
  NR2 U86 ( .I1(n157), .I2(n35), .O(n188) );
  NR2 U87 ( .I1(n31), .I2(pixel_in_reg[5]), .O(n82) );
  ND2S U88 ( .I1(n113), .I2(n143), .O(n103) );
  INV1S U89 ( .I(n103), .O(n219) );
  ND2S U90 ( .I1(n24), .I2(n29), .O(n200) );
  AN2 U91 ( .I1(n13), .I2(n200), .O(n36) );
  ND3 U92 ( .I1(n266), .I2(n188), .I3(n36), .O(n37) );
  NR2 U93 ( .I1(n50), .I2(n39), .O(n224) );
  ND2S U94 ( .I1(n37), .I2(n224), .O(n271) );
  ND3 U95 ( .I1(n38), .I2(n3), .I3(n271), .O(n256) );
  ND2S U96 ( .I1(n50), .I2(n39), .O(n264) );
  INV1S U97 ( .I(n264), .O(n270) );
  INV1S U98 ( .I(n14), .O(n76) );
  ND2S U99 ( .I1(n40), .I2(n125), .O(n222) );
  AOI22S U100 ( .A1(n176), .A2(n219), .B1(n76), .B2(n222), .O(n69) );
  ND2S U101 ( .I1(n227), .I2(n21), .O(n230) );
  AN3B2S U102 ( .I1(n230), .B1(n189), .B2(n41), .O(n45) );
  OR3B2S U103 ( .I1(n191), .B1(n69), .B2(n45), .O(n43) );
  OAI112HS U104 ( .C1(n221), .C2(n9), .A1(n45), .B1(n7), .O(n42) );
  AOI22S U105 ( .A1(n270), .A2(n43), .B1(n260), .B2(n42), .O(n48) );
  INV1S U106 ( .I(n95), .O(n190) );
  ND2S U107 ( .I1(pixel_in_reg[0]), .I2(n190), .O(n202) );
  ND2S U108 ( .I1(n202), .I2(n6), .O(n44) );
  ND2S U109 ( .I1(n44), .I2(n22), .O(n119) );
  ND2S U110 ( .I1(n22), .I2(n28), .O(n83) );
  ND2S U111 ( .I1(n45), .I2(n83), .O(n46) );
  AN2B1S U112 ( .I1(n119), .B1(n46), .O(n273) );
  ND3 U113 ( .I1(n268), .I2(n266), .I3(n273), .O(n47) );
  ND3 U114 ( .I1(n48), .I2(n271), .I3(n47), .O(n250) );
  NR2 U115 ( .I1(n50), .I2(n49), .O(n51) );
  AOI13HS U116 ( .B1(n31), .B2(n224), .B3(n52), .A1(n51), .O(n74) );
  ND2S U117 ( .I1(n166), .I2(n173), .O(n115) );
  INV1S U118 ( .I(n115), .O(n160) );
  NR2 U119 ( .I1(n22), .I2(n76), .O(n54) );
  ND2S U120 ( .I1(n113), .I2(n190), .O(n144) );
  ND2S U121 ( .I1(n23), .I2(n18), .O(n53) );
  MOAI1S U122 ( .A1(n54), .A2(n144), .B1(n190), .B2(n53), .O(n55) );
  NR2 U123 ( .I1(n160), .I2(n55), .O(n129) );
  ND2S U124 ( .I1(n173), .I2(n76), .O(n181) );
  AN2 U125 ( .I1(n28), .I2(n76), .O(n159) );
  MOAI1S U126 ( .A1(n103), .A2(n18), .B1(n5), .B2(n20), .O(n56) );
  AN3B2S U127 ( .I1(n181), .B1(n159), .B2(n56), .O(n246) );
  INV1S U128 ( .I(n207), .O(n154) );
  AOI22S U129 ( .A1(n154), .A2(n17), .B1(n20), .B2(n167), .O(n89) );
  INV1S U130 ( .I(n202), .O(n107) );
  NR2 U131 ( .I1(n10), .I2(n107), .O(n179) );
  ND2S U132 ( .I1(n179), .I2(n207), .O(n57) );
  AOI22S U133 ( .A1(n24), .A2(n142), .B1(n21), .B2(n57), .O(n58) );
  ND2S U134 ( .I1(n15), .I2(n103), .O(n201) );
  NR2 U135 ( .I1(n19), .I2(n155), .O(n122) );
  AO12 U136 ( .B1(n143), .B2(n12), .A1(n122), .O(n172) );
  AN4B1S U137 ( .I1(n89), .I2(n58), .I3(n201), .B1(n172), .O(n59) );
  ND3 U138 ( .I1(n129), .I2(n246), .I3(n59), .O(n68) );
  ND2S U139 ( .I1(n227), .I2(n4), .O(n178) );
  AOI13HS U140 ( .B1(n226), .B2(n94), .B3(n13), .A1(n9), .O(n60) );
  AN3B2S U141 ( .I1(n178), .B1(n160), .B2(n60), .O(n140) );
  ND2S U142 ( .I1(n227), .I2(n8), .O(n123) );
  ND2S U143 ( .I1(n29), .I2(n21), .O(n81) );
  NR2 U144 ( .I1(n94), .I2(n61), .O(n210) );
  ND2S U145 ( .I1(n16), .I2(n29), .O(n231) );
  ND2S U146 ( .I1(n112), .I2(n76), .O(n62) );
  ND3 U147 ( .I1(n231), .I2(n200), .I3(n62), .O(n63) );
  AO112 U148 ( .C1(n22), .C2(n238), .A1(n210), .B1(n63), .O(n165) );
  AN3B1S U149 ( .I1(n123), .I2(n81), .B1(n165), .O(n193) );
  ND2S U150 ( .I1(n28), .I2(n239), .O(n177) );
  ND2S U151 ( .I1(n94), .I2(n226), .O(n64) );
  ND2S U152 ( .I1(n190), .I2(n64), .O(n65) );
  AN4B1S U153 ( .I1(n14), .I2(n177), .I3(n65), .B1(n172), .O(n66) );
  ND3 U154 ( .I1(n140), .I2(n193), .I3(n66), .O(n67) );
  AOI22S U155 ( .A1(n270), .A2(n68), .B1(n2), .B2(n67), .O(n73) );
  ND2S U156 ( .I1(n13), .I2(n7), .O(n141) );
  ND2S U157 ( .I1(n119), .I2(n230), .O(n78) );
  OAI112HS U158 ( .C1(n19), .C2(n222), .A1(n69), .B1(n83), .O(n229) );
  NR3 U159 ( .I1(n141), .I2(n78), .I3(n229), .O(n70) );
  ND3 U160 ( .I1(n123), .I2(n70), .I3(n201), .O(n71) );
  ND2S U161 ( .I1(n71), .I2(n27), .O(n72) );
  ND3 U162 ( .I1(n74), .I2(n73), .I3(n72), .O(n252) );
  AOI22S U163 ( .A1(n12), .A2(n154), .B1(n15), .B2(n142), .O(n111) );
  AOI22S U164 ( .A1(n16), .A2(n112), .B1(n219), .B2(n4), .O(n237) );
  INV1S U165 ( .I(n144), .O(n152) );
  AOI22S U166 ( .A1(n15), .A2(n219), .B1(n166), .B2(n152), .O(n84) );
  ND3 U167 ( .I1(n111), .I2(n237), .I3(n84), .O(n75) );
  AOI13HS U168 ( .B1(n32), .B2(pixel_in_reg[5]), .B3(n107), .A1(n75), .O(n80)
         );
  AOI22S U169 ( .A1(n176), .A2(n107), .B1(n8), .B2(n152), .O(n77) );
  ND2S U170 ( .I1(n207), .I2(n144), .O(n164) );
  ND2S U171 ( .I1(n76), .I2(n164), .O(n192) );
  ND3 U172 ( .I1(n77), .I2(n200), .I3(n192), .O(n216) );
  ND2S U173 ( .I1(n176), .I2(n11), .O(n211) );
  ND3 U174 ( .I1(n89), .I2(n81), .I3(n211), .O(n236) );
  NR3 U175 ( .I1(n216), .I2(n78), .I3(n236), .O(n79) );
  ND3 U176 ( .I1(n140), .I2(n80), .I3(n79), .O(n102) );
  AOI22S U177 ( .A1(pixel_in_reg[3]), .A2(n219), .B1(n82), .B2(n152), .O(n100)
         );
  ND2S U178 ( .I1(n107), .I2(n20), .O(n241) );
  ND2S U179 ( .I1(n241), .I2(n81), .O(n118) );
  MOAI1S U180 ( .A1(n202), .A2(n18), .B1(n5), .B2(n82), .O(n86) );
  ND3 U181 ( .I1(n84), .I2(n240), .I3(n83), .O(n85) );
  NR3 U182 ( .I1(n118), .I2(n86), .I3(n85), .O(n87) );
  ND3 U183 ( .I1(n87), .I2(n181), .I3(n178), .O(n215) );
  ND2S U184 ( .I1(n11), .I2(n17), .O(n90) );
  OAI12HS U185 ( .B1(n16), .B2(n153), .A1(n107), .O(n88) );
  ND3 U186 ( .I1(n90), .I2(n89), .I3(n88), .O(n91) );
  NR2 U187 ( .I1(n215), .I2(n91), .O(n93) );
  ND2S U188 ( .I1(n29), .I2(n20), .O(n92) );
  ND2S U189 ( .I1(n12), .I2(n167), .O(n244) );
  ND3 U190 ( .I1(n93), .I2(n92), .I3(n244), .O(n158) );
  MOAI1S U191 ( .A1(n233), .A2(n18), .B1(n15), .B2(n11), .O(n97) );
  MOAI1S U192 ( .A1(n95), .A2(n94), .B1(n176), .B2(n167), .O(n96) );
  NR3 U193 ( .I1(n158), .I2(n97), .I3(n96), .O(n99) );
  OAI12HS U194 ( .B1(n143), .B2(n142), .A1(n239), .O(n98) );
  ND3 U195 ( .I1(n100), .I2(n99), .I3(n98), .O(n101) );
  AOI22S U196 ( .A1(n268), .A2(n102), .B1(n260), .B2(n101), .O(n135) );
  ND2S U197 ( .I1(n105), .I2(n103), .O(n104) );
  AOI22S U198 ( .A1(n189), .A2(n104), .B1(n112), .B2(n141), .O(n121) );
  AOI22S U199 ( .A1(n219), .A2(n166), .B1(n112), .B2(n21), .O(n109) );
  ND2S U200 ( .I1(n234), .I2(n13), .O(n106) );
  INV1S U201 ( .I(n105), .O(n136) );
  AOI22S U202 ( .A1(n107), .A2(n106), .B1(n8), .B2(n136), .O(n108) );
  OAI112HS U203 ( .C1(n179), .C2(n23), .A1(n109), .B1(n108), .O(n110) );
  AN2B1S U204 ( .I1(n111), .B1(n110), .O(n149) );
  ND2S U205 ( .I1(n112), .I2(n8), .O(n245) );
  OAI112HS U206 ( .C1(n25), .C2(n23), .A1(n177), .B1(n245), .O(n209) );
  OA112 U207 ( .C1(n207), .C2(n7), .A1(n149), .B1(n114), .O(n116) );
  ND2S U208 ( .I1(n116), .I2(n115), .O(n117) );
  NR2 U209 ( .I1(n118), .I2(n117), .O(n120) );
  ND3 U210 ( .I1(n121), .I2(n120), .I3(n119), .O(n133) );
  ND2S U211 ( .I1(n190), .I2(n157), .O(n131) );
  AN2B1S U212 ( .I1(n240), .B1(n210), .O(n218) );
  AN4B1S U213 ( .I1(n181), .I2(n123), .I3(n211), .B1(n122), .O(n124) );
  ND3 U214 ( .I1(n237), .I2(n218), .I3(n124), .O(n138) );
  ND2S U215 ( .I1(n32), .I2(pixel_in_reg[5]), .O(n127) );
  INV1S U216 ( .I(n141), .O(n126) );
  OAI22S U217 ( .A1(n233), .A2(n127), .B1(n126), .B2(n125), .O(n128) );
  NR2 U218 ( .I1(n138), .I2(n128), .O(n130) );
  ND3 U219 ( .I1(n131), .I2(n130), .I3(n129), .O(n132) );
  AOI22S U220 ( .A1(n270), .A2(n133), .B1(n224), .B2(n132), .O(n134) );
  ND2S U221 ( .I1(n135), .I2(n134), .O(n255) );
  AOI22S U222 ( .A1(n195), .A2(n20), .B1(n16), .B2(n136), .O(n146) );
  MOAI1S U223 ( .A1(n155), .A2(n14), .B1(n24), .B2(n10), .O(n137) );
  AN3B2S U224 ( .I1(n177), .B1(n138), .B2(n137), .O(n139) );
  ND3 U225 ( .I1(n140), .I2(n146), .I3(n139), .O(n151) );
  AOI22S U226 ( .A1(n142), .A2(n141), .B1(n22), .B2(n173), .O(n148) );
  MOAI1S U227 ( .A1(n234), .A2(n144), .B1(n143), .B2(n17), .O(n145) );
  AN3B2S U228 ( .I1(n146), .B1(n165), .B2(n145), .O(n147) );
  ND3 U229 ( .I1(n149), .I2(n148), .I3(n147), .O(n150) );
  AOI22S U230 ( .A1(n224), .A2(n151), .B1(n2), .B2(n150), .O(n187) );
  AOI22S U231 ( .A1(n12), .A2(n154), .B1(n153), .B2(n152), .O(n163) );
  ND2S U232 ( .I1(n6), .I2(n155), .O(n156) );
  AOI22S U233 ( .A1(n24), .A2(n164), .B1(n157), .B2(n156), .O(n162) );
  NR3 U234 ( .I1(n160), .I2(n159), .I3(n158), .O(n161) );
  ND3 U235 ( .I1(n163), .I2(n162), .I3(n161), .O(n185) );
  OAI22S U236 ( .A1(n166), .A2(n165), .B1(n164), .B2(n165), .O(n258) );
  NR2 U237 ( .I1(n227), .I2(n167), .O(n170) );
  OAI22S U238 ( .A1(n170), .A2(n169), .B1(n6), .B2(n168), .O(n171) );
  NR2 U239 ( .I1(n172), .I2(n171), .O(n213) );
  OR2 U240 ( .I1(n10), .I2(n11), .O(n175) );
  ND2S U241 ( .I1(n31), .I2(n7), .O(n174) );
  AOI22S U242 ( .A1(n176), .A2(n175), .B1(n29), .B2(n174), .O(n182) );
  OAI112HS U243 ( .C1(n179), .C2(n18), .A1(n178), .B1(n177), .O(n180) );
  AN4B1S U244 ( .I1(n182), .I2(n181), .I3(n192), .B1(n180), .O(n183) );
  ND3 U245 ( .I1(n258), .I2(n213), .I3(n183), .O(n184) );
  AOI22S U246 ( .A1(n270), .A2(n185), .B1(n268), .B2(n184), .O(n186) );
  ND2S U247 ( .I1(n187), .I2(n186), .O(n254) );
  ND2S U248 ( .I1(n188), .I2(n7), .O(n199) );
  OAI12HS U249 ( .B1(n10), .B2(n190), .A1(n189), .O(n217) );
  AN4B1S U250 ( .I1(n193), .I2(n192), .I3(n217), .B1(n191), .O(n197) );
  ND3 U251 ( .I1(pixel_in_reg[4]), .I2(n195), .I3(n194), .O(n196) );
  ND3 U252 ( .I1(n197), .I2(n201), .I3(n196), .O(n198) );
  AOI22S U253 ( .A1(pixel_in_reg[7]), .A2(n199), .B1(n270), .B2(n198), .O(n206) );
  ND3 U254 ( .I1(n14), .I2(n241), .I3(n200), .O(n204) );
  OAI112HS U255 ( .C1(n221), .C2(n202), .A1(n266), .B1(n201), .O(n203) );
  AOI22S U256 ( .A1(n27), .A2(n204), .B1(n260), .B2(n203), .O(n205) );
  ND2S U257 ( .I1(n206), .I2(n205), .O(n251) );
  ND2S U258 ( .I1(n224), .I2(n271), .O(n257) );
  NR2 U259 ( .I1(n19), .I2(n207), .O(n208) );
  NR3 U260 ( .I1(n210), .I2(n209), .I3(n208), .O(n212) );
  ND3 U261 ( .I1(n213), .I2(n212), .I3(n211), .O(n214) );
  NR3 U262 ( .I1(n216), .I2(n215), .I3(n214), .O(n265) );
  OAI112HS U263 ( .C1(n219), .C2(n3), .A1(n218), .B1(n217), .O(n225) );
  OAI22S U264 ( .A1(n222), .A2(n221), .B1(n220), .B2(pixel_in_reg[4]), .O(n223) );
  AOI22S U265 ( .A1(pixel_in_reg[7]), .A2(n225), .B1(n224), .B2(n223), .O(n263) );
  NR2 U266 ( .I1(n227), .I2(n226), .O(n228) );
  NR2 U267 ( .I1(n229), .I2(n228), .O(n232) );
  ND3 U268 ( .I1(n232), .I2(n231), .I3(n230), .O(n261) );
  NR2 U269 ( .I1(n234), .I2(n233), .O(n235) );
  AN3B2S U270 ( .I1(n237), .B1(n236), .B2(n235), .O(n248) );
  ND2S U271 ( .I1(n4), .I2(n238), .O(n242) );
  ND3 U272 ( .I1(n242), .I2(n241), .I3(n240), .O(n243) );
  AN4B1S U273 ( .I1(n246), .I2(n245), .I3(n244), .B1(n243), .O(n247) );
  ND3 U274 ( .I1(n258), .I2(n248), .I3(n247), .O(n259) );
  AOI22S U275 ( .A1(n268), .A2(n261), .B1(n2), .B2(n259), .O(n262) );
  OAI112HS U276 ( .C1(n265), .C2(n264), .A1(n263), .B1(n262), .O(n253) );
  INV1S U277 ( .I(n266), .O(n267) );
  AOI22S U278 ( .A1(n270), .A2(n269), .B1(n27), .B2(n267), .O(n272) );
  OAI112HS U279 ( .C1(pixel_in_reg[6]), .C2(n273), .A1(n272), .B1(n271), .O(
        n249) );
endmodule


module top ( clk, rst_n, pixel_in, valid_in, color_in, last_col_in, 
        last_pic_in, mode_in, pixel_out, valid_out, color_out, last_col_out, 
        last_pic_out, finish_operation );
  input [7:0] pixel_in;
  input [1:0] color_in;
  input [2:0] mode_in;
  output [7:0] pixel_out;
  output [1:0] color_out;
  input clk, rst_n, valid_in, last_col_in, last_pic_in;
  output valid_out, last_col_out, last_pic_out, finish_operation;
  wire   valid_in_dem, last_col_in_dem, last_col_in_reg, last_pic_in_dem,
         valid_in_den, valid_out_dem, last_col_in_den, last_col_out_dem,
         last_pic_in_den, last_pic_out_dem, valid_in_mean, valid_out_den,
         last_pic_in_mean, last_pic_out_den, valid_in_gain, finish_out_mean,
         valid_value_in_wb, last_pic_in_wb, valid_gain_in_wb, valid_out_gain,
         valid_in_gamma, valid_value_out_wb, last_pic_in_gamma,
         last_pic_out_wb, last_col_out_den, valid_out_mean, last_pic_out_mean,
         valid_out_gamma, last_pic_out_gamma, \denoise/n_last_pic_out_reg ,
         \denoise/n_last_col_out_reg , \denoise/n_valid_out_reg ,
         \denoise/n_last_pic_2 , \denoise/n_last_col_2 ,
         \denoise/n_last_pic_1 , \denoise/n_last_col_1 ,
         \denoise/first_col_b[0][7] , \denoise/first_col_b[0][6] ,
         \denoise/first_col_b[0][5] , \denoise/first_col_b[0][4] ,
         \denoise/first_col_b[0][3] , \denoise/first_col_b[0][2] ,
         \denoise/first_col_b[0][1] , \denoise/first_col_b[0][0] ,
         \denoise/first_col_b[1][7] , \denoise/first_col_b[1][6] ,
         \denoise/first_col_b[1][5] , \denoise/first_col_b[1][4] ,
         \denoise/first_col_b[1][3] , \denoise/first_col_b[1][2] ,
         \denoise/first_col_b[1][1] , \denoise/first_col_b[1][0] ,
         \denoise/first_col_b[2][7] , \denoise/first_col_b[2][6] ,
         \denoise/first_col_b[2][5] , \denoise/first_col_b[2][4] ,
         \denoise/first_col_b[2][3] , \denoise/first_col_b[2][2] ,
         \denoise/first_col_b[2][1] , \denoise/first_col_b[2][0] ,
         \denoise/first_col_b[3][7] , \denoise/first_col_b[3][6] ,
         \denoise/first_col_b[3][5] , \denoise/first_col_b[3][4] ,
         \denoise/first_col_b[3][3] , \denoise/first_col_b[3][2] ,
         \denoise/first_col_b[3][1] , \denoise/first_col_b[3][0] ,
         \denoise/first_col_b[4][7] , \denoise/first_col_b[4][6] ,
         \denoise/first_col_b[4][5] , \denoise/first_col_b[4][4] ,
         \denoise/first_col_b[4][3] , \denoise/first_col_b[4][2] ,
         \denoise/first_col_b[4][1] , \denoise/first_col_b[4][0] ,
         \denoise/first_col_b[5][7] , \denoise/first_col_b[5][6] ,
         \denoise/first_col_b[5][5] , \denoise/first_col_b[5][4] ,
         \denoise/first_col_b[5][3] , \denoise/first_col_b[5][2] ,
         \denoise/first_col_b[5][1] , \denoise/first_col_b[5][0] ,
         \denoise/second_col_b[0][7] , \denoise/second_col_b[0][6] ,
         \denoise/second_col_b[0][5] , \denoise/second_col_b[0][4] ,
         \denoise/second_col_b[0][3] , \denoise/second_col_b[0][2] ,
         \denoise/second_col_b[0][1] , \denoise/second_col_b[0][0] ,
         \denoise/second_col_b[1][7] , \denoise/second_col_b[1][6] ,
         \denoise/second_col_b[1][5] , \denoise/second_col_b[1][4] ,
         \denoise/second_col_b[1][3] , \denoise/second_col_b[1][2] ,
         \denoise/second_col_b[1][1] , \denoise/second_col_b[1][0] ,
         \denoise/second_col_b[2][7] , \denoise/second_col_b[2][6] ,
         \denoise/second_col_b[2][5] , \denoise/second_col_b[2][4] ,
         \denoise/second_col_b[2][3] , \denoise/second_col_b[2][2] ,
         \denoise/second_col_b[2][1] , \denoise/second_col_b[2][0] ,
         \denoise/second_col_b[3][7] , \denoise/second_col_b[3][6] ,
         \denoise/second_col_b[3][5] , \denoise/second_col_b[3][4] ,
         \denoise/second_col_b[3][3] , \denoise/second_col_b[3][2] ,
         \denoise/second_col_b[3][1] , \denoise/second_col_b[3][0] ,
         \denoise/second_col_b[4][7] , \denoise/second_col_b[4][6] ,
         \denoise/second_col_b[4][5] , \denoise/second_col_b[4][4] ,
         \denoise/second_col_b[4][3] , \denoise/second_col_b[4][2] ,
         \denoise/second_col_b[4][1] , \denoise/second_col_b[4][0] ,
         \denoise/second_col_b[5][7] , \denoise/second_col_b[5][6] ,
         \denoise/second_col_b[5][5] , \denoise/second_col_b[5][4] ,
         \denoise/second_col_b[5][3] , \denoise/second_col_b[5][2] ,
         \denoise/second_col_b[5][1] , \denoise/second_col_b[5][0] ,
         \denoise/first_col_g[0][7] , \denoise/first_col_g[0][6] ,
         \denoise/first_col_g[0][5] , \denoise/first_col_g[0][4] ,
         \denoise/first_col_g[0][3] , \denoise/first_col_g[0][2] ,
         \denoise/first_col_g[0][1] , \denoise/first_col_g[0][0] ,
         \denoise/first_col_g[1][7] , \denoise/first_col_g[1][6] ,
         \denoise/first_col_g[1][5] , \denoise/first_col_g[1][4] ,
         \denoise/first_col_g[1][3] , \denoise/first_col_g[1][2] ,
         \denoise/first_col_g[1][1] , \denoise/first_col_g[1][0] ,
         \denoise/first_col_g[2][7] , \denoise/first_col_g[2][6] ,
         \denoise/first_col_g[2][5] , \denoise/first_col_g[2][4] ,
         \denoise/first_col_g[2][3] , \denoise/first_col_g[2][2] ,
         \denoise/first_col_g[2][1] , \denoise/first_col_g[2][0] ,
         \denoise/first_col_g[3][7] , \denoise/first_col_g[3][6] ,
         \denoise/first_col_g[3][5] , \denoise/first_col_g[3][4] ,
         \denoise/first_col_g[3][3] , \denoise/first_col_g[3][2] ,
         \denoise/first_col_g[3][1] , \denoise/first_col_g[3][0] ,
         \denoise/first_col_g[4][7] , \denoise/first_col_g[4][6] ,
         \denoise/first_col_g[4][5] , \denoise/first_col_g[4][4] ,
         \denoise/first_col_g[4][3] , \denoise/first_col_g[4][2] ,
         \denoise/first_col_g[4][1] , \denoise/first_col_g[4][0] ,
         \denoise/first_col_g[5][7] , \denoise/first_col_g[5][6] ,
         \denoise/first_col_g[5][5] , \denoise/first_col_g[5][4] ,
         \denoise/first_col_g[5][3] , \denoise/first_col_g[5][2] ,
         \denoise/first_col_g[5][1] , \denoise/first_col_g[5][0] ,
         \denoise/second_col_g[0][7] , \denoise/second_col_g[0][6] ,
         \denoise/second_col_g[0][5] , \denoise/second_col_g[0][4] ,
         \denoise/second_col_g[0][3] , \denoise/second_col_g[0][2] ,
         \denoise/second_col_g[0][1] , \denoise/second_col_g[0][0] ,
         \denoise/second_col_g[1][7] , \denoise/second_col_g[1][6] ,
         \denoise/second_col_g[1][5] , \denoise/second_col_g[1][4] ,
         \denoise/second_col_g[1][3] , \denoise/second_col_g[1][2] ,
         \denoise/second_col_g[1][1] , \denoise/second_col_g[1][0] ,
         \denoise/second_col_g[2][7] , \denoise/second_col_g[2][6] ,
         \denoise/second_col_g[2][5] , \denoise/second_col_g[2][4] ,
         \denoise/second_col_g[2][3] , \denoise/second_col_g[2][2] ,
         \denoise/second_col_g[2][1] , \denoise/second_col_g[2][0] ,
         \denoise/second_col_g[3][7] , \denoise/second_col_g[3][6] ,
         \denoise/second_col_g[3][5] , \denoise/second_col_g[3][4] ,
         \denoise/second_col_g[3][3] , \denoise/second_col_g[3][2] ,
         \denoise/second_col_g[3][1] , \denoise/second_col_g[3][0] ,
         \denoise/second_col_g[4][7] , \denoise/second_col_g[4][6] ,
         \denoise/second_col_g[4][5] , \denoise/second_col_g[4][4] ,
         \denoise/second_col_g[4][3] , \denoise/second_col_g[4][2] ,
         \denoise/second_col_g[4][1] , \denoise/second_col_g[4][0] ,
         \denoise/second_col_g[5][7] , \denoise/second_col_g[5][6] ,
         \denoise/second_col_g[5][5] , \denoise/second_col_g[5][4] ,
         \denoise/second_col_g[5][3] , \denoise/second_col_g[5][2] ,
         \denoise/second_col_g[5][1] , \denoise/second_col_g[5][0] ,
         \denoise/first_col_r[0][7] , \denoise/first_col_r[0][6] ,
         \denoise/first_col_r[0][5] , \denoise/first_col_r[0][4] ,
         \denoise/first_col_r[0][3] , \denoise/first_col_r[0][2] ,
         \denoise/first_col_r[0][1] , \denoise/first_col_r[0][0] ,
         \denoise/first_col_r[1][7] , \denoise/first_col_r[1][6] ,
         \denoise/first_col_r[1][5] , \denoise/first_col_r[1][4] ,
         \denoise/first_col_r[1][3] , \denoise/first_col_r[1][2] ,
         \denoise/first_col_r[1][1] , \denoise/first_col_r[1][0] ,
         \denoise/first_col_r[2][7] , \denoise/first_col_r[2][6] ,
         \denoise/first_col_r[2][5] , \denoise/first_col_r[2][4] ,
         \denoise/first_col_r[2][3] , \denoise/first_col_r[2][2] ,
         \denoise/first_col_r[2][1] , \denoise/first_col_r[2][0] ,
         \denoise/first_col_r[3][7] , \denoise/first_col_r[3][6] ,
         \denoise/first_col_r[3][5] , \denoise/first_col_r[3][4] ,
         \denoise/first_col_r[3][3] , \denoise/first_col_r[3][2] ,
         \denoise/first_col_r[3][1] , \denoise/first_col_r[3][0] ,
         \denoise/first_col_r[4][7] , \denoise/first_col_r[4][6] ,
         \denoise/first_col_r[4][5] , \denoise/first_col_r[4][4] ,
         \denoise/first_col_r[4][3] , \denoise/first_col_r[4][2] ,
         \denoise/first_col_r[4][1] , \denoise/first_col_r[4][0] ,
         \denoise/first_col_r[5][7] , \denoise/first_col_r[5][6] ,
         \denoise/first_col_r[5][5] , \denoise/first_col_r[5][4] ,
         \denoise/first_col_r[5][3] , \denoise/first_col_r[5][2] ,
         \denoise/first_col_r[5][1] , \denoise/first_col_r[5][0] ,
         \denoise/second_col_r[0][7] , \denoise/second_col_r[0][6] ,
         \denoise/second_col_r[0][5] , \denoise/second_col_r[0][4] ,
         \denoise/second_col_r[0][3] , \denoise/second_col_r[0][2] ,
         \denoise/second_col_r[0][1] , \denoise/second_col_r[0][0] ,
         \denoise/second_col_r[1][7] , \denoise/second_col_r[1][6] ,
         \denoise/second_col_r[1][5] , \denoise/second_col_r[1][4] ,
         \denoise/second_col_r[1][3] , \denoise/second_col_r[1][2] ,
         \denoise/second_col_r[1][1] , \denoise/second_col_r[1][0] ,
         \denoise/second_col_r[2][7] , \denoise/second_col_r[2][6] ,
         \denoise/second_col_r[2][5] , \denoise/second_col_r[2][4] ,
         \denoise/second_col_r[2][3] , \denoise/second_col_r[2][2] ,
         \denoise/second_col_r[2][1] , \denoise/second_col_r[2][0] ,
         \denoise/second_col_r[3][7] , \denoise/second_col_r[3][6] ,
         \denoise/second_col_r[3][5] , \denoise/second_col_r[3][4] ,
         \denoise/second_col_r[3][3] , \denoise/second_col_r[3][2] ,
         \denoise/second_col_r[3][1] , \denoise/second_col_r[3][0] ,
         \denoise/second_col_r[4][7] , \denoise/second_col_r[4][6] ,
         \denoise/second_col_r[4][5] , \denoise/second_col_r[4][4] ,
         \denoise/second_col_r[4][3] , \denoise/second_col_r[4][2] ,
         \denoise/second_col_r[4][1] , \denoise/second_col_r[4][0] ,
         \denoise/second_col_r[5][7] , \denoise/second_col_r[5][6] ,
         \denoise/second_col_r[5][5] , \denoise/second_col_r[5][4] ,
         \denoise/second_col_r[5][3] , \denoise/second_col_r[5][2] ,
         \denoise/second_col_r[5][1] , \denoise/second_col_r[5][0] ,
         \denoise/valid_in_reg , \denoise/init_12_last_flag , \mean/valid_r ,
         \mean/last_r , \mean/finish_tmp , \gain/N648 , \gain/N626 ,
         \gain/N478 , \gain/N456 , \gain/finish_G_r , \gain/MSB_G_r[1] ,
         \gain/N325 , \gain/N303 , \gain/finish_R_r , \gain/MSB_R_r[1] ,
         \gain/valid_r , \gain/valid_gain_tmp , \wb/last_tmp , \wb/valid_tmp ,
         \wb/valid_gain_r , \wb/valid_value_r , \C237/DATA2_0 , \C237/DATA2_1 ,
         \C237/DATA2_2 , \C237/DATA2_3 , \C237/DATA2_4 , \C237/DATA2_5 ,
         \C237/DATA2_6 , \C237/DATA2_7 , \C237/DATA2_8 , \C237/DATA2_9 ,
         \C237/DATA2_10 , n1063, n1064, n1066, n1067, n1068, n1069, n1070,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363,
         n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373,
         n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383,
         n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393,
         n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403,
         n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413,
         n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423,
         n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433,
         n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443,
         n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453,
         n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463,
         n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473,
         n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483,
         n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493,
         n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503,
         n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513,
         n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523,
         n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533,
         n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543,
         n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553,
         n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563,
         n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573,
         n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583,
         n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593,
         n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603,
         n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613,
         n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623,
         n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633,
         n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643,
         n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653,
         n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663,
         n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673,
         n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683,
         n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693,
         n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703,
         n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713,
         n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723,
         n1724, n1725, n1726, n1727, n1728, \DP_OP_654J1_124_416/n161 ,
         \DP_OP_654J1_124_416/n160 , \DP_OP_654J1_124_416/n159 ,
         \DP_OP_654J1_124_416/n158 , \DP_OP_654J1_124_416/n157 ,
         \DP_OP_654J1_124_416/n156 , \DP_OP_654J1_124_416/n155 ,
         \DP_OP_654J1_124_416/n154 , \DP_OP_654J1_124_416/n153 ,
         \DP_OP_654J1_124_416/n152 , \DP_OP_654J1_124_416/n151 ,
         \DP_OP_654J1_124_416/n150 , \DP_OP_654J1_124_416/n149 ,
         \DP_OP_654J1_124_416/n148 , \DP_OP_654J1_124_416/n147 ,
         \DP_OP_654J1_124_416/n146 , \DP_OP_654J1_124_416/n145 ,
         \DP_OP_654J1_124_416/n144 , \DP_OP_654J1_124_416/n143 ,
         \DP_OP_654J1_124_416/n142 , \DP_OP_654J1_124_416/n141 ,
         \DP_OP_654J1_124_416/n140 , \DP_OP_654J1_124_416/n139 ,
         \DP_OP_654J1_124_416/n138 , \DP_OP_654J1_124_416/n137 ,
         \DP_OP_654J1_124_416/n136 , \DP_OP_654J1_124_416/n135 ,
         \DP_OP_654J1_124_416/n134 , \DP_OP_654J1_124_416/n133 ,
         \DP_OP_654J1_124_416/n132 , \DP_OP_654J1_124_416/n131 ,
         \DP_OP_654J1_124_416/n130 , \DP_OP_654J1_124_416/n129 ,
         \DP_OP_654J1_124_416/n128 , \DP_OP_654J1_124_416/n127 ,
         \DP_OP_654J1_124_416/n126 , \DP_OP_654J1_124_416/n125 ,
         \DP_OP_654J1_124_416/n124 , \DP_OP_654J1_124_416/n123 ,
         \DP_OP_654J1_124_416/n122 , \DP_OP_654J1_124_416/n121 ,
         \DP_OP_654J1_124_416/n120 , \DP_OP_654J1_124_416/n119 ,
         \DP_OP_654J1_124_416/n118 , \DP_OP_654J1_124_416/n117 ,
         \DP_OP_654J1_124_416/n116 , \DP_OP_654J1_124_416/n115 ,
         \DP_OP_654J1_124_416/n114 , \DP_OP_654J1_124_416/n113 ,
         \DP_OP_654J1_124_416/n112 , \DP_OP_654J1_124_416/n111 ,
         \DP_OP_654J1_124_416/n110 , \DP_OP_654J1_124_416/n109 ,
         \DP_OP_654J1_124_416/n108 , \DP_OP_654J1_124_416/n107 ,
         \DP_OP_654J1_124_416/n106 , \DP_OP_654J1_124_416/n105 ,
         \DP_OP_654J1_124_416/n104 , \DP_OP_654J1_124_416/n103 ,
         \DP_OP_654J1_124_416/n102 , \DP_OP_654J1_124_416/n101 ,
         \DP_OP_654J1_124_416/n100 , \DP_OP_654J1_124_416/n99 ,
         \DP_OP_654J1_124_416/n98 , \DP_OP_654J1_124_416/n97 ,
         \DP_OP_654J1_124_416/n96 , \DP_OP_654J1_124_416/n95 ,
         \DP_OP_654J1_124_416/n94 , \DP_OP_654J1_124_416/n93 ,
         \DP_OP_654J1_124_416/n92 , \DP_OP_654J1_124_416/n91 ,
         \DP_OP_654J1_124_416/n90 , \DP_OP_654J1_124_416/n89 ,
         \DP_OP_654J1_124_416/n88 , \DP_OP_654J1_124_416/n87 ,
         \DP_OP_654J1_124_416/n86 , \DP_OP_654J1_124_416/n85 ,
         \DP_OP_654J1_124_416/n84 , \DP_OP_654J1_124_416/n83 ,
         \DP_OP_654J1_124_416/n82 , \DP_OP_654J1_124_416/n81 ,
         \DP_OP_654J1_124_416/n80 , \DP_OP_654J1_124_416/n79 ,
         \DP_OP_654J1_124_416/n78 , \DP_OP_654J1_124_416/n77 ,
         \DP_OP_654J1_124_416/n76 , \DP_OP_654J1_124_416/n75 ,
         \DP_OP_654J1_124_416/n74 , \DP_OP_654J1_124_416/n73 ,
         \DP_OP_654J1_124_416/n72 , \DP_OP_654J1_124_416/n71 ,
         \DP_OP_654J1_124_416/n70 , \DP_OP_654J1_124_416/n69 ,
         \DP_OP_654J1_124_416/n68 , \DP_OP_654J1_124_416/n67 ,
         \DP_OP_654J1_124_416/n66 , \DP_OP_654J1_124_416/n65 ,
         \DP_OP_654J1_124_416/n64 , \DP_OP_654J1_124_416/n63 ,
         \DP_OP_654J1_124_416/n62 , \DP_OP_654J1_124_416/n61 ,
         \DP_OP_654J1_124_416/n60 , \DP_OP_654J1_124_416/n59 ,
         \DP_OP_654J1_124_416/n58 , \DP_OP_654J1_124_416/n57 ,
         \DP_OP_654J1_124_416/n56 , \DP_OP_654J1_124_416/n55 ,
         \DP_OP_654J1_124_416/n54 , \DP_OP_654J1_124_416/n53 ,
         \DP_OP_654J1_124_416/n52 , \DP_OP_654J1_124_416/n51 ,
         \DP_OP_654J1_124_416/n50 , \DP_OP_654J1_124_416/n49 ,
         \DP_OP_654J1_124_416/n48 , \DP_OP_654J1_124_416/n47 ,
         \DP_OP_654J1_124_416/n46 , \DP_OP_654J1_124_416/n45 ,
         \DP_OP_654J1_124_416/n44 , \DP_OP_654J1_124_416/n43 ,
         \DP_OP_654J1_124_416/n42 , \DP_OP_654J1_124_416/n41 ,
         \DP_OP_654J1_124_416/n40 , \DP_OP_654J1_124_416/n39 ,
         \DP_OP_654J1_124_416/n38 , \DP_OP_654J1_124_416/n37 ,
         \DP_OP_654J1_124_416/n36 , \DP_OP_654J1_124_416/n35 ,
         \DP_OP_654J1_124_416/n34 , \DP_OP_654J1_124_416/n33 ,
         \DP_OP_654J1_124_416/n32 , \DP_OP_654J1_124_416/n31 ,
         \DP_OP_654J1_124_416/n30 , \DP_OP_654J1_124_416/n29 ,
         \DP_OP_654J1_124_416/n28 , \DP_OP_654J1_124_416/n27 ,
         \DP_OP_654J1_124_416/n26 , \DP_OP_654J1_124_416/n25 ,
         \DP_OP_654J1_124_416/n24 , \DP_OP_654J1_124_416/n23 ,
         \DP_OP_654J1_124_416/n22 , \DP_OP_654J1_124_416/n21 ,
         \DP_OP_654J1_124_416/n20 , \DP_OP_654J1_124_416/n19 ,
         \DP_OP_654J1_124_416/n18 , \DP_OP_654J1_124_416/n17 ,
         \DP_OP_654J1_124_416/n16 , \DP_OP_654J1_124_416/n15 ,
         \DP_OP_654J1_124_416/n14 , \DP_OP_654J1_124_416/n13 ,
         \DP_OP_654J1_124_416/n12 , \DP_OP_654J1_124_416/n11 ,
         \DP_OP_654J1_124_416/n10 , \DP_OP_654J1_124_416/n9 ,
         \DP_OP_654J1_124_416/n8 , \DP_OP_654J1_124_416/n7 ,
         \DP_OP_654J1_124_416/n6 , \DP_OP_654J1_124_416/n5 ,
         \DP_OP_654J1_124_416/n4 , \DP_OP_654J1_124_416/n3 ,
         \DP_OP_654J1_124_416/n2 , \DP_OP_654J1_124_416/n1 , \intadd_0/B[9] ,
         \intadd_0/B[8] , \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] ,
         \intadd_0/B[4] , \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] ,
         \intadd_0/B[0] , \intadd_0/CI , \intadd_0/SUM[9] , \intadd_0/SUM[8] ,
         \intadd_0/SUM[7] , \intadd_0/SUM[6] , \intadd_0/SUM[5] ,
         \intadd_0/SUM[4] , \intadd_0/SUM[3] , \intadd_0/SUM[2] ,
         \intadd_0/SUM[1] , \intadd_0/SUM[0] , \intadd_0/n10 , \intadd_0/n9 ,
         \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 ,
         \intadd_1/B[9] , \intadd_1/B[8] , \intadd_1/B[7] , \intadd_1/B[6] ,
         \intadd_1/B[5] , \intadd_1/B[4] , \intadd_1/B[3] , \intadd_1/B[2] ,
         \intadd_1/B[1] , \intadd_1/B[0] , \intadd_1/CI , \intadd_1/SUM[9] ,
         \intadd_1/SUM[8] , \intadd_1/SUM[7] , \intadd_1/SUM[6] ,
         \intadd_1/SUM[5] , \intadd_1/SUM[4] , \intadd_1/SUM[3] ,
         \intadd_1/SUM[2] , \intadd_1/SUM[1] , \intadd_1/SUM[0] ,
         \intadd_1/n10 , \intadd_1/n9 , \intadd_1/n8 , \intadd_1/n7 ,
         \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 , \intadd_1/n3 ,
         \intadd_1/n2 , \intadd_1/n1 , \intadd_2/B[9] , \intadd_2/B[8] ,
         \intadd_2/B[7] , \intadd_2/B[6] , \intadd_2/B[5] , \intadd_2/B[4] ,
         \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] ,
         \intadd_2/CI , \intadd_2/SUM[9] , \intadd_2/SUM[8] ,
         \intadd_2/SUM[7] , \intadd_2/SUM[6] , \intadd_2/SUM[5] ,
         \intadd_2/SUM[4] , \intadd_2/SUM[3] , \intadd_2/SUM[2] ,
         \intadd_2/SUM[1] , \intadd_2/SUM[0] , \intadd_2/n10 , \intadd_2/n9 ,
         \intadd_2/n8 , \intadd_2/n7 , \intadd_2/n6 , \intadd_2/n5 ,
         \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 ,
         \intadd_3/A[9] , \intadd_3/A[8] , \intadd_3/A[7] , \intadd_3/A[6] ,
         \intadd_3/A[5] , \intadd_3/A[4] , \intadd_3/A[3] , \intadd_3/A[2] ,
         \intadd_3/A[1] , \intadd_3/n10 , \intadd_3/n9 , \intadd_3/n8 ,
         \intadd_3/n7 , \intadd_3/n6 , \intadd_3/n5 , \intadd_3/n4 ,
         \intadd_3/n3 , \intadd_3/n2 , \intadd_3/n1 , \intadd_4/CI ,
         \intadd_4/n8 , \intadd_4/n7 , \intadd_4/n6 , \intadd_4/n5 ,
         \intadd_4/n4 , \intadd_4/n3 , \intadd_4/n2 , \intadd_4/n1 ,
         \intadd_5/A[7] , \intadd_5/A[6] , \intadd_5/A[5] , \intadd_5/A[4] ,
         \intadd_5/A[3] , \intadd_5/A[2] , \intadd_5/B[7] , \intadd_5/B[6] ,
         \intadd_5/B[5] , \intadd_5/B[4] , \intadd_5/B[3] , \intadd_5/B[2] ,
         \intadd_5/B[1] , \intadd_5/n8 , \intadd_5/n7 , \intadd_5/n6 ,
         \intadd_5/n5 , \intadd_5/n4 , \intadd_5/n3 , \intadd_5/n2 ,
         \intadd_5/n1 , n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739,
         n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749,
         n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759,
         n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769,
         n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779,
         n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789,
         n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799,
         n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809,
         n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819,
         n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829,
         n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839,
         n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849,
         n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859,
         n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869,
         n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877, n1878, n1879,
         n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889,
         n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899,
         n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909,
         n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919,
         n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929,
         n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939,
         n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949,
         n1950, n1951, n1952, n1953, n1955, n1957, n1958, n1959, n1960, n1961,
         n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971,
         n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981,
         n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991,
         n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001,
         n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011,
         n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021,
         n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031,
         n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041,
         n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051,
         n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061,
         n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071,
         n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081,
         n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091,
         n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101,
         n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111,
         n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121,
         n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131,
         n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141,
         n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151,
         n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161,
         n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171,
         n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181,
         n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191,
         n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201,
         n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211,
         n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221,
         n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231,
         n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241,
         n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251,
         n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261,
         n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271,
         n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281,
         n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291,
         n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301,
         n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311,
         n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321,
         n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331,
         n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341,
         n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351,
         n2352, n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361,
         n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371,
         n2372, n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381,
         n2382, n2383, n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391,
         n2392, n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401,
         n2402, n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411,
         n2412, n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421,
         n2422, n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431,
         n2432, n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441,
         n2442, n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451,
         n2452, n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461,
         n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471,
         n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481,
         n2482, n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491,
         n2492, n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501,
         n2502, n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511,
         n2512, n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521,
         n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531,
         n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541,
         n2542, n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551,
         n2552, n2553, n2554, n2555, n2556, n2557, n2558, n2559, n2560, n2561,
         n2562, n2563, n2564, n2565, n2566, n2567, n2568, n2569, n2570, n2571,
         n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581,
         n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591,
         n2592, n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601,
         n2602, n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611,
         n2612, n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621,
         n2622, n2623, n2624, n2625, n2626, n2627, n2628, n2629, n2630, n2631,
         n2632, n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641,
         n2642, n2643, n2644, n2645, n2646, n2647, n2648, n2649, n2650, n2651,
         n2652, n2653, n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661,
         n2662, n2663, n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671,
         n2672, n2673, n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681,
         n2682, n2683, n2684, n2685, n2686, n2687, n2688, n2689, n2690, n2691,
         n2692, n2693, n2694, n2695, n2696, n2697, n2698, n2699, n2700, n2701,
         n2702, n2703, n2704, n2705, n2706, n2707, n2708, n2709, n2710, n2711,
         n2712, n2713, n2714, n2715, n2716, n2717, n2718, n2719, n2720, n2721,
         n2722, n2723, n2724, n2725, n2726, n2727, n2728, n2729, n2730, n2731,
         n2732, n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741,
         n2742, n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751,
         n2752, n2753, n2754, n2755, n2756, n2757, n2758, n2759, n2760, n2761,
         n2762, n2763, n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771,
         n2772, n2773, n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781,
         n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791,
         n2792, n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801,
         n2802, n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811,
         n2812, n2813, n2814, n2815, n2816, n2817, n2818, n2819, n2820, n2821,
         n2822, n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830, n2831,
         n2832, n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840, n2841,
         n2842, n2843, n2844, n2845, n2846, n2847, n2848, n2849, n2850, n2851,
         n2852, n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860, n2861,
         n2862, n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870, n2871,
         n2872, n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880, n2881,
         n2882, n2883, n2884, n2885, n2886, n2887, n2888, n2889, n2890, n2891,
         n2892, n2893, n2894, n2895, n2896, n2897, n2898, n2899, n2900, n2901,
         n2902, n2903, n2904, n2905, n2906, n2907, n2908, n2909, n2910, n2911,
         n2912, n2913, n2914, n2915, n2916, n2917, n2918, n2919, n2920, n2921,
         n2922, n2923, n2924, n2925, n2926, n2927, n2928, n2929, n2930, n2931,
         n2932, n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941,
         n2942, n2943, n2944, n2945, n2946, n2947, n2948, n2949, n2950, n2951,
         n2952, n2953, n2954, n2955, n2956, n2957, n2958, n2959, n2960, n2961,
         n2962, n2963, n2964, n2965, n2966, n2967, n2968, n2969, n2970, n2971,
         n2972, n2973, n2974, n2975, n2976, n2977, n2978, n2979, n2980, n2981,
         n2982, n2983, n2984, n2985, n2986, n2987, n2988, n2989, n2990, n2991,
         n2992, n2993, n2994, n2995, n2996, n2997, n2998, n2999, n3000, n3001,
         n3002, n3003, n3004, n3005, n3006, n3007, n3008, n3009, n3010, n3011,
         n3012, n3013, n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3021,
         n3022, n3023, n3024, n3025, n3026, n3027, n3028, n3029, n3030, n3031,
         n3032, n3033, n3034, n3035, n3036, n3037, n3038, n3039, n3040, n3041,
         n3042, n3043, n3044, n3045, n3046, n3047, n3048, n3049, n3050, n3051,
         n3052, n3053, n3054, n3055, n3056, n3057, n3058, n3059, n3060, n3061,
         n3062, n3063, n3064, n3065, n3066, n3067, n3068, n3069, n3070, n3071,
         n3072, n3073, n3074, n3075, n3076, n3077, n3078, n3079, n3080, n3081,
         n3082, n3083, n3084, n3085, n3086, n3087, n3088, n3089, n3090, n3091,
         n3092, n3093, n3094, n3095, n3096, n3097, n3098, n3099, n3100, n3101,
         n3102, n3103, n3104, n3105, n3106, n3107, n3108, n3109, n3110, n3111,
         n3112, n3113, n3114, n3115, n3116, n3117, n3118, n3119, n3120, n3121,
         n3122, n3123, n3124, n3125, n3126, n3127, n3128, n3129, n3130, n3131,
         n3132, n3133, n3134, n3135, n3136, n3137, n3138, n3139, n3140, n3141,
         n3142, n3143, n3144, n3145, n3146, n3147, n3148, n3149, n3150, n3151,
         n3152, n3153, n3154, n3155, n3156, n3157, n3158, n3159, n3160, n3161,
         n3162, n3163, n3164, n3165, n3166, n3167, n3168, n3169, n3170, n3171,
         n3172, n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180, n3181,
         n3182, n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190, n3191,
         n3192, n3193, n3194, n3195, n3196, n3197, n3198, n3199, n3200, n3201,
         n3202, n3203, n3204, n3205, n3206, n3207, n3208, n3209, n3210, n3211,
         n3212, n3213, n3214, n3215, n3216, n3217, n3218, n3219, n3220, n3221,
         n3222, n3223, n3224, n3225, n3226, n3227, n3228, n3229, n3230, n3231,
         n3232, n3233, n3234, n3235, n3236, n3237, n3238, n3239, n3240, n3241,
         n3242, n3243, n3244, n3245, n3246, n3247, n3248, n3249, n3250, n3251,
         n3252, n3253, n3254, n3255, n3256, n3257, n3258, n3259, n3260, n3261,
         n3262, n3263, n3264, n3265, n3266, n3267, n3268, n3269, n3270, n3271,
         n3272, n3273, n3274, n3275, n3276, n3277, n3278, n3279, n3280, n3281,
         n3282, n3283, n3284, n3285, n3286, n3287, n3288, n3289, n3290, n3291,
         n3292, n3293, n3294, n3295, n3296, n3297, n3298, n3299, n3300, n3301,
         n3302, n3303, n3304, n3305, n3306, n3307, n3308, n3309, n3310, n3311,
         n3312, n3313, n3314, n3315, n3316, n3317, n3318, n3319, n3320, n3321,
         n3322, n3323, n3324, n3325, n3326, n3327, n3328, n3329, n3330, n3331,
         n3332, n3333, n3334, n3335, n3336, n3337, n3338, n3339, n3340, n3341,
         n3342, n3343, n3344, n3345, n3346, n3347, n3348, n3349, n3350, n3351,
         n3352, n3353, n3354, n3355, n3356, n3357, n3358, n3359, n3360, n3361,
         n3362, n3363, n3364, n3365, n3366, n3367, n3368, n3369, n3370, n3371,
         n3372, n3373, n3374, n3375, n3376, n3377, n3378, n3379, n3380, n3381,
         n3382, n3383, n3384, n3385, n3386, n3387, n3388, n3389, n3390, n3391,
         n3392, n3393, n3394, n3395, n3396, n3397, n3398, n3399, n3400, n3401,
         n3402, n3403, n3404, n3405, n3406, n3407, n3408, n3409, n3410, n3411,
         n3412, n3413, n3414, n3415, n3416, n3417, n3418, n3419, n3420, n3421,
         n3422, n3423, n3424, n3425, n3426, n3427, n3428, n3429, n3430, n3431,
         n3432, n3433, n3434, n3435, n3436, n3437, n3438, n3439, n3440, n3441,
         n3442, n3443, n3444, n3445, n3446, n3447, n3448, n3449, n3450, n3451,
         n3452, n3453, n3454, n3455, n3456, n3457, n3458, n3459, n3460, n3461,
         n3462, n3463, n3464, n3465, n3466, n3467, n3468, n3469, n3470, n3471,
         n3472, n3473, n3474, n3475, n3476, n3477, n3478, n3479, n3480, n3481,
         n3482, n3483, n3484, n3485, n3486, n3487, n3488, n3489, n3490, n3491,
         n3492, n3493, n3494, n3495, n3496, n3497, n3498, n3499, n3500, n3501,
         n3502, n3503, n3504, n3505, n3506, n3507, n3508, n3509, n3510, n3511,
         n3512, n3513, n3514, n3515, n3516, n3517, n3518, n3519, n3520, n3521,
         n3522, n3523, n3524, n3525, n3526, n3527, n3528, n3529, n3530, n3531,
         n3532, n3533, n3534, n3535, n3536, n3537, n3538, n3539, n3540, n3541,
         n3542, n3543, n3544, n3545, n3546, n3547, n3548, n3549, n3550, n3551,
         n3552, n3553, n3554, n3555, n3556, n3557, n3558, n3559, n3560, n3561,
         n3562, n3563, n3564, n3565, n3566, n3567, n3568, n3569, n3570, n3571,
         n3572, n3573, n3574, n3575, n3576, n3577, n3578, n3579, n3580, n3581,
         n3582, n3583, n3584, n3585, n3586, n3587, n3588, n3589, n3590, n3591,
         n3592, n3593, n3594, n3595, n3596, n3597, n3598, n3599, n3600, n3601,
         n3602, n3603, n3604, n3605, n3606, n3607, n3608, n3609, n3610, n3611,
         n3612, n3613, n3614, n3615, n3616, n3617, n3618, n3619, n3620, n3621,
         n3622, n3623, n3624, n3625, n3626, n3627, n3628, n3629, n3630, n3631,
         n3632, n3633, n3634, n3635, n3636, n3637, n3638, n3639, n3640, n3641,
         n3642, n3643, n3644, n3645, n3646, n3647, n3648, n3649, n3650, n3651,
         n3652, n3653, n3654, n3655, n3656, n3657, n3658, n3659, n3660, n3661,
         n3662, n3663, n3664, n3665, n3666, n3667, n3668, n3669, n3670, n3671,
         n3672, n3673, n3674, n3675, n3676, n3677, n3678, n3679, n3680, n3681,
         n3682, n3683, n3684, n3685, n3686, n3687, n3688, n3689, n3690, n3691,
         n3692, n3693, n3694, n3695, n3696, n3697, n3698, n3699, n3700, n3701,
         n3702, n3703, n3704, n3705, n3706, n3707, n3708, n3709, n3710, n3711,
         n3712, n3713, n3714, n3715, n3716, n3717, n3718, n3719, n3720, n3721,
         n3722, n3723, n3724, n3725, n3726, n3727, n3728, n3729, n3730, n3731,
         n3732, n3733, n3734, n3735, n3736, n3737, n3738, n3739, n3740, n3741,
         n3742, n3743, n3744, n3745, n3746, n3747, n3748, n3749, n3750, n3751,
         n3752, n3753;
  wire   [2:0] mode_reg;
  wire   [7:0] pixel_in_dem;
  wire   [7:0] pixel_in_den;
  wire   [7:0] pixel_out_dem;
  wire   [1:0] color_out_dem;
  wire   [7:0] pixel_in_mean;
  wire   [7:0] pixel_out_den;
  wire   [1:0] color_in_mean;
  wire   [1:0] color_out_den;
  wire   [7:0] r_mean_out_mean;
  wire   [7:0] g_mean_out_mean;
  wire   [7:0] b_mean_out_mean;
  wire   [7:0] pixel_in_wb;
  wire   [1:0] color_in_wb;
  wire   [15:0] k_r_in_wb;
  wire   [15:0] k_r_out_gain;
  wire   [15:0] k_g_in_wb;
  wire   [15:0] k_g_out_gain;
  wire   [15:0] k_b_in_wb;
  wire   [15:0] k_b_out_gain;
  wire   [7:0] pixel_in_gamma;
  wire   [7:0] pixel_out_wb;
  wire   [1:0] color_in_gamma;
  wire   [1:0] color_out_wb;
  wire   [1:0] color_out_mean;
  wire   [7:0] pixel_out_gamma;
  wire   [1:0] color_out_gamma;
  wire   [1:0] \denoise/n_color_out_reg ;
  wire   [7:0] \denoise/n_pixel_out_reg ;
  wire   [11:0] \denoise/sum9 ;
  wire   [9:0] \denoise/new_sum6 ;
  wire   [2:0] \denoise/state_2 ;
  wire   [1:0] \denoise/color_2 ;
  wire   [11:0] \denoise/n_sum9 ;
  wire   [9:0] \denoise/n_new_sum6 ;
  wire   [1:0] \denoise/n_color_2 ;
  wire   [2:0] \denoise/n_state_2 ;
  wire   [2:0] \denoise/counter_1 ;
  wire   [9:0] \denoise/sum3_b ;
  wire   [9:0] \denoise/sum6_b ;
  wire   [9:0] \denoise/sum3_g ;
  wire   [9:0] \denoise/sum6_g ;
  wire   [9:0] \denoise/sum3_r ;
  wire   [9:0] \denoise/sum6_r ;
  wire   [9:0] \denoise/sum6 ;
  wire   [9:0] \denoise/sum3 ;
  wire   [7:0] \denoise/pos7 ;
  wire   [7:0] \denoise/pos8 ;
  wire   [7:0] \denoise/pos9 ;
  wire   [2:0] \denoise/n_counter_1 ;
  wire   [2:0] \denoise/n_state_1 ;
  wire   [7:0] \denoise/pixel_in_reg ;
  wire   [1:0] \denoise/valid_count_0 ;
  wire   [1:0] \mean/color_r ;
  wire   [7:0] \mean/value_r ;
  wire   [1:0] \mean/last_state_w ;
  wire   [1:0] \mean/last_state_r ;
  wire   [7:0] \mean/b_mean_tmp ;
  wire   [27:0] \mean/sum_b ;
  wire   [7:0] \mean/g_mean_tmp ;
  wire   [27:0] \mean/sum_g ;
  wire   [7:0] \mean/r_mean_tmp ;
  wire   [27:0] \mean/sum_r ;
  wire   [15:0] \gain/K_B_tmp ;
  wire   [15:0] \gain/B_r ;
  wire   [15:0] \gain/b_mean_r ;
  wire   [4:0] \gain/counter_B_r ;
  wire   [1:0] \gain/state_B_r ;
  wire   [15:0] \gain/K_G_tmp ;
  wire   [15:0] \gain/G_r ;
  wire   [15:0] \gain/g_mean_r ;
  wire   [4:0] \gain/counter_G_r ;
  wire   [1:0] \gain/state_G_r ;
  wire   [15:0] \gain/K_mean_r ;
  wire   [15:0] \gain/K_R_tmp ;
  wire   [15:0] \gain/R_r ;
  wire   [15:0] \gain/r_mean_r ;
  wire   [4:0] \gain/counter_R_r ;
  wire   [1:0] \gain/state_R_r ;
  wire   [7:0] \gain/K_mean_w ;
  wire   [1:0] \wb/color_r ;
  wire   [7:0] \wb/K_B_r ;
  wire   [7:0] \wb/K_G_r ;
  wire   [7:0] \wb/K_R_r ;
  wire   [7:0] \wb/value_r ;
  wire   [7:0] \wb/value_tmp_2 ;

  demosaic demosaic ( .clk(clk), .rst_n(n2095), .valid(valid_in_dem), 
        .data_in(pixel_in_dem), .end_col(last_col_in_dem), .end_pic(
        last_pic_in_dem), .RGB_valid(valid_out_dem), .RGB_data(pixel_out_dem), 
        .color(color_out_dem), .col_last(last_col_out_dem), .pic_last(
        last_pic_out_dem) );
  gamma_122 gamma ( .clk(clk), .rst_n(n2102), .pixel_in(pixel_in_gamma), 
        .valid_in(valid_in_gamma), .color_in(color_in_gamma), .last_pic_in(
        last_pic_in_gamma), .pixel_out(pixel_out_gamma), .valid_out(
        valid_out_gamma), .color_out(color_out_gamma), .last_pic_out(
        last_pic_out_gamma) );
  QDFFRBN \pixel_in_reg_reg[7]  ( .D(pixel_in[7]), .CK(clk), .RB(n3596), .Q(
        pixel_in_wb[7]) );
  QDFFRBN \pixel_in_reg_reg[6]  ( .D(pixel_in[6]), .CK(clk), .RB(n3696), .Q(
        pixel_in_wb[6]) );
  QDFFRBN \pixel_in_reg_reg[5]  ( .D(pixel_in[5]), .CK(clk), .RB(n3688), .Q(
        pixel_in_wb[5]) );
  QDFFRBN \pixel_in_reg_reg[4]  ( .D(pixel_in[4]), .CK(clk), .RB(n3680), .Q(
        pixel_in_wb[4]) );
  QDFFRBN \pixel_in_reg_reg[3]  ( .D(pixel_in[3]), .CK(clk), .RB(n3681), .Q(
        pixel_in_wb[3]) );
  QDFFRBN \pixel_in_reg_reg[2]  ( .D(pixel_in[2]), .CK(clk), .RB(n3681), .Q(
        pixel_in_wb[2]) );
  QDFFRBN \pixel_in_reg_reg[1]  ( .D(pixel_in[1]), .CK(clk), .RB(n3681), .Q(
        pixel_in_wb[1]) );
  QDFFRBN \pixel_in_reg_reg[0]  ( .D(pixel_in[0]), .CK(clk), .RB(n3681), .Q(
        pixel_in_wb[0]) );
  QDFFRBN valid_in_reg_reg ( .D(valid_in), .CK(clk), .RB(n3681), .Q(
        valid_value_in_wb) );
  QDFFRBN last_col_in_reg_reg ( .D(last_col_in), .CK(clk), .RB(n3681), .Q(
        last_col_in_reg) );
  QDFFRBN last_pic_in_reg_reg ( .D(last_pic_in), .CK(clk), .RB(n3682), .Q(
        last_pic_in_wb) );
  QDFFRBN \mode_reg_reg[2]  ( .D(mode_in[2]), .CK(clk), .RB(n3682), .Q(
        mode_reg[2]) );
  QDFFRBN \mode_reg_reg[1]  ( .D(mode_in[1]), .CK(clk), .RB(n3682), .Q(
        mode_reg[1]) );
  QDFFRBN \mode_reg_reg[0]  ( .D(mode_in[0]), .CK(clk), .RB(n3682), .Q(
        mode_reg[0]) );
  QDFFRBN \denoise/new_sum6_reg[0]  ( .D(\denoise/n_new_sum6 [0]), .CK(clk), 
        .RB(n3682), .Q(\denoise/new_sum6 [0]) );
  QDFFRBN \denoise/new_sum6_reg[1]  ( .D(\denoise/n_new_sum6 [1]), .CK(clk), 
        .RB(n3682), .Q(\denoise/new_sum6 [1]) );
  QDFFRBN \denoise/new_sum6_reg[2]  ( .D(\denoise/n_new_sum6 [2]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [2]) );
  QDFFRBN \denoise/new_sum6_reg[3]  ( .D(\denoise/n_new_sum6 [3]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [3]) );
  QDFFRBN \denoise/new_sum6_reg[4]  ( .D(\denoise/n_new_sum6 [4]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [4]) );
  QDFFRBN \denoise/new_sum6_reg[5]  ( .D(\denoise/n_new_sum6 [5]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [5]) );
  QDFFRBN \denoise/new_sum6_reg[6]  ( .D(\denoise/n_new_sum6 [6]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [6]) );
  QDFFRBN \denoise/new_sum6_reg[7]  ( .D(\denoise/n_new_sum6 [7]), .CK(clk), 
        .RB(n3683), .Q(\denoise/new_sum6 [7]) );
  QDFFRBN \denoise/new_sum6_reg[8]  ( .D(\denoise/n_new_sum6 [8]), .CK(clk), 
        .RB(n3684), .Q(\denoise/new_sum6 [8]) );
  QDFFRBN \denoise/new_sum6_reg[9]  ( .D(\denoise/n_new_sum6 [9]), .CK(clk), 
        .RB(n3684), .Q(\denoise/new_sum6 [9]) );
  QDFFRBN \denoise/sum9_reg[0]  ( .D(\denoise/n_sum9 [0]), .CK(clk), .RB(n3684), .Q(\denoise/sum9 [0]) );
  QDFFRBN \denoise/sum9_reg[1]  ( .D(\denoise/n_sum9 [1]), .CK(clk), .RB(n3684), .Q(\denoise/sum9 [1]) );
  QDFFRBN \denoise/sum9_reg[2]  ( .D(\denoise/n_sum9 [2]), .CK(clk), .RB(n3684), .Q(\denoise/sum9 [2]) );
  QDFFRBN \denoise/sum9_reg[3]  ( .D(\denoise/n_sum9 [3]), .CK(clk), .RB(n3684), .Q(\denoise/sum9 [3]) );
  QDFFRBN \denoise/sum9_reg[4]  ( .D(\denoise/n_sum9 [4]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [4]) );
  QDFFRBN \denoise/sum9_reg[5]  ( .D(\denoise/n_sum9 [5]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [5]) );
  QDFFRBN \denoise/sum9_reg[6]  ( .D(\denoise/n_sum9 [6]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [6]) );
  QDFFRBN \denoise/sum9_reg[7]  ( .D(\denoise/n_sum9 [7]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [7]) );
  QDFFRBN \denoise/sum9_reg[8]  ( .D(\denoise/n_sum9 [8]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [8]) );
  QDFFRBN \denoise/sum9_reg[9]  ( .D(\denoise/n_sum9 [9]), .CK(clk), .RB(n3685), .Q(\denoise/sum9 [9]) );
  QDFFRBN \denoise/sum9_reg[10]  ( .D(\denoise/n_sum9 [10]), .CK(clk), .RB(
        n3686), .Q(\denoise/sum9 [10]) );
  QDFFRBN \denoise/sum9_reg[11]  ( .D(\denoise/n_sum9 [11]), .CK(clk), .RB(
        n3686), .Q(\denoise/sum9 [11]) );
  QDFFRBN \denoise/pixel_out_reg_reg[0]  ( .D(\denoise/n_pixel_out_reg [0]), 
        .CK(clk), .RB(n3686), .Q(pixel_out_den[0]) );
  QDFFRBN \denoise/pixel_out_reg_reg[1]  ( .D(\denoise/n_pixel_out_reg [1]), 
        .CK(clk), .RB(n3686), .Q(pixel_out_den[1]) );
  QDFFRBN \denoise/pixel_out_reg_reg[2]  ( .D(\denoise/n_pixel_out_reg [2]), 
        .CK(clk), .RB(n3686), .Q(pixel_out_den[2]) );
  QDFFRBN \denoise/pixel_out_reg_reg[3]  ( .D(\denoise/n_pixel_out_reg [3]), 
        .CK(clk), .RB(n3686), .Q(pixel_out_den[3]) );
  QDFFRBN \denoise/pixel_out_reg_reg[4]  ( .D(\denoise/n_pixel_out_reg [4]), 
        .CK(clk), .RB(n3752), .Q(pixel_out_den[4]) );
  QDFFRBN \denoise/pixel_out_reg_reg[5]  ( .D(\denoise/n_pixel_out_reg [5]), 
        .CK(clk), .RB(n3737), .Q(pixel_out_den[5]) );
  QDFFRBN \denoise/pixel_out_reg_reg[6]  ( .D(\denoise/n_pixel_out_reg [6]), 
        .CK(clk), .RB(n3736), .Q(pixel_out_den[6]) );
  QDFFRBN \denoise/pixel_out_reg_reg[7]  ( .D(\denoise/n_pixel_out_reg [7]), 
        .CK(clk), .RB(n3752), .Q(pixel_out_den[7]) );
  QDFFRBN \denoise/last_pic_in_reg_reg  ( .D(last_pic_in_den), .CK(clk), .RB(
        n3737), .Q(\denoise/n_last_pic_1 ) );
  QDFFRBN \denoise/last_pic_1_reg  ( .D(\denoise/n_last_pic_1 ), .CK(clk), 
        .RB(n3740), .Q(\denoise/n_last_pic_2 ) );
  QDFFRBN \denoise/last_col_in_reg_reg  ( .D(last_col_in_den), .CK(clk), .RB(
        n3687), .Q(\denoise/n_last_col_1 ) );
  QDFFRBN \denoise/last_col_1_reg  ( .D(\denoise/n_last_col_1 ), .CK(clk), 
        .RB(n3687), .Q(\denoise/n_last_col_2 ) );
  QDFFRBN \denoise/last_col_2_reg  ( .D(\denoise/n_last_col_2 ), .CK(clk), 
        .RB(n3687), .Q(\denoise/n_last_col_out_reg ) );
  QDFFRBN \denoise/last_col_out_reg_reg  ( .D(\denoise/n_last_col_out_reg ), 
        .CK(clk), .RB(n3687), .Q(last_col_out_den) );
  QDFFRBN \denoise/valid_in_reg_reg  ( .D(valid_in_den), .CK(clk), .RB(n3687), 
        .Q(\denoise/valid_in_reg ) );
  QDFFRBN \denoise/state_0_reg[0]  ( .D(n1701), .CK(clk), .RB(n3688), .Q(
        \denoise/n_state_1 [0]) );
  QDFFRBN \denoise/state_1_reg[0]  ( .D(n1752), .CK(clk), .RB(n3688), .Q(
        \denoise/n_state_2 [0]) );
  QDFFRBN \denoise/state_2_reg[0]  ( .D(\denoise/n_state_2 [0]), .CK(clk), 
        .RB(n3688), .Q(\denoise/state_2 [0]) );
  QDFFRBN \denoise/init_12_last_flag_reg  ( .D(n1700), .CK(clk), .RB(n3688), 
        .Q(\denoise/init_12_last_flag ) );
  QDFFRBN \denoise/state_0_reg[1]  ( .D(n1702), .CK(clk), .RB(n3688), .Q(
        \denoise/n_state_1 [1]) );
  QDFFRBN \denoise/state_1_reg[1]  ( .D(\denoise/n_state_1 [1]), .CK(clk), 
        .RB(n3741), .Q(\denoise/n_state_2 [1]) );
  QDFFRBN \denoise/state_2_reg[1]  ( .D(\denoise/n_state_2 [1]), .CK(clk), 
        .RB(n3739), .Q(\denoise/state_2 [1]) );
  QDFFRBN \denoise/counter_0_reg[2]  ( .D(n1705), .CK(clk), .RB(n3738), .Q(
        \denoise/n_counter_1 [2]) );
  QDFFRBN \denoise/counter_1_reg[2]  ( .D(n1862), .CK(clk), .RB(n3741), .Q(
        \denoise/counter_1 [2]) );
  QDFFRBN \denoise/counter_0_reg[0]  ( .D(n1703), .CK(clk), .RB(n3739), .Q(
        \denoise/n_counter_1 [0]) );
  QDFFRBN \denoise/counter_1_reg[0]  ( .D(\denoise/n_counter_1 [0]), .CK(clk), 
        .RB(n3738), .Q(\denoise/counter_1 [0]) );
  QDFFRBN \denoise/counter_0_reg[1]  ( .D(n1704), .CK(clk), .RB(n3689), .Q(
        \denoise/n_counter_1 [1]) );
  QDFFRBN \denoise/counter_1_reg[1]  ( .D(\denoise/n_counter_1 [1]), .CK(clk), 
        .RB(n3689), .Q(\denoise/counter_1 [1]) );
  QDFFRBN \denoise/color_1_reg[0]  ( .D(n1699), .CK(clk), .RB(n3689), .Q(
        \denoise/n_color_2 [0]) );
  QDFFRBN \denoise/color_1_reg[1]  ( .D(n1698), .CK(clk), .RB(n3689), .Q(
        \denoise/n_color_2 [1]) );
  QDFFRBN \denoise/pixel_in_reg_reg[0]  ( .D(pixel_in_den[0]), .CK(clk), .RB(
        n3689), .Q(\denoise/pixel_in_reg [0]) );
  QDFFRBN \denoise/pos9_reg[0]  ( .D(n1697), .CK(clk), .RB(n3689), .Q(
        \denoise/pos9 [0]) );
  QDFFRBN \denoise/second_col_r_reg[5][0]  ( .D(n1696), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[5][0] ) );
  QDFFRBN \denoise/second_col_r_reg[4][0]  ( .D(n1695), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[4][0] ) );
  QDFFRBN \denoise/second_col_r_reg[3][0]  ( .D(n1694), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[3][0] ) );
  QDFFRBN \denoise/second_col_r_reg[2][0]  ( .D(n1693), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[2][0] ) );
  QDFFRBN \denoise/second_col_r_reg[1][0]  ( .D(n1692), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[1][0] ) );
  QDFFRBN \denoise/second_col_r_reg[0][0]  ( .D(n1691), .CK(clk), .RB(n3690), 
        .Q(\denoise/second_col_r[0][0] ) );
  QDFFRBN \denoise/first_col_r_reg[5][0]  ( .D(n1690), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[5][0] ) );
  QDFFRBN \denoise/first_col_r_reg[4][0]  ( .D(n1689), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[4][0] ) );
  QDFFRBN \denoise/first_col_r_reg[3][0]  ( .D(n1688), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[3][0] ) );
  QDFFRBN \denoise/first_col_r_reg[2][0]  ( .D(n1687), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[2][0] ) );
  QDFFRBN \denoise/first_col_r_reg[1][0]  ( .D(n1686), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[1][0] ) );
  QDFFRBN \denoise/first_col_r_reg[0][0]  ( .D(n1685), .CK(clk), .RB(n3691), 
        .Q(\denoise/first_col_r[0][0] ) );
  QDFFRBN \denoise/second_col_g_reg[0][0]  ( .D(n1684), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[0][0] ) );
  QDFFRBN \denoise/second_col_g_reg[1][0]  ( .D(n1683), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[1][0] ) );
  QDFFRBN \denoise/second_col_g_reg[2][0]  ( .D(n1682), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[2][0] ) );
  QDFFRBN \denoise/second_col_g_reg[3][0]  ( .D(n1681), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[3][0] ) );
  QDFFRBN \denoise/second_col_g_reg[4][0]  ( .D(n1680), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[4][0] ) );
  QDFFRBN \denoise/second_col_g_reg[5][0]  ( .D(n1679), .CK(clk), .RB(n3692), 
        .Q(\denoise/second_col_g[5][0] ) );
  QDFFRBN \denoise/first_col_g_reg[0][0]  ( .D(n1678), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[0][0] ) );
  QDFFRBN \denoise/first_col_g_reg[1][0]  ( .D(n1677), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[1][0] ) );
  QDFFRBN \denoise/first_col_g_reg[2][0]  ( .D(n1676), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[2][0] ) );
  QDFFRBN \denoise/first_col_g_reg[3][0]  ( .D(n1675), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[3][0] ) );
  QDFFRBN \denoise/first_col_g_reg[4][0]  ( .D(n1674), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[4][0] ) );
  QDFFRBN \denoise/first_col_g_reg[5][0]  ( .D(n1673), .CK(clk), .RB(n3693), 
        .Q(\denoise/first_col_g[5][0] ) );
  QDFFRBN \denoise/second_col_b_reg[0][0]  ( .D(n1672), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[0][0] ) );
  QDFFRBN \denoise/second_col_b_reg[1][0]  ( .D(n1671), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[1][0] ) );
  QDFFRBN \denoise/second_col_b_reg[2][0]  ( .D(n1670), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[2][0] ) );
  QDFFRBN \denoise/second_col_b_reg[3][0]  ( .D(n1669), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[3][0] ) );
  QDFFRBN \denoise/second_col_b_reg[4][0]  ( .D(n1668), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[4][0] ) );
  QDFFRBN \denoise/second_col_b_reg[5][0]  ( .D(n1667), .CK(clk), .RB(n3694), 
        .Q(\denoise/second_col_b[5][0] ) );
  QDFFRBN \denoise/first_col_b_reg[0][0]  ( .D(n1666), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[0][0] ) );
  QDFFRBN \denoise/first_col_b_reg[1][0]  ( .D(n1665), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[1][0] ) );
  QDFFRBN \denoise/first_col_b_reg[2][0]  ( .D(n1664), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[2][0] ) );
  QDFFRBN \denoise/first_col_b_reg[3][0]  ( .D(n1663), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[3][0] ) );
  QDFFRBN \denoise/first_col_b_reg[4][0]  ( .D(n1662), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[4][0] ) );
  QDFFRBN \denoise/first_col_b_reg[5][0]  ( .D(n1661), .CK(clk), .RB(n3695), 
        .Q(\denoise/first_col_b[5][0] ) );
  QDFFRBN \denoise/pos7_reg[0]  ( .D(n1393), .CK(clk), .RB(n3696), .Q(
        \denoise/pos7 [0]) );
  QDFFRBN \denoise/pos8_reg[0]  ( .D(n1407), .CK(clk), .RB(n3696), .Q(
        \denoise/pos8 [0]) );
  QDFFRBN \denoise/pixel_in_reg_reg[1]  ( .D(pixel_in_den[1]), .CK(clk), .RB(
        n3696), .Q(\denoise/pixel_in_reg [1]) );
  QDFFRBN \denoise/pos9_reg[1]  ( .D(n1660), .CK(clk), .RB(n3696), .Q(
        \denoise/pos9 [1]) );
  QDFFRBN \denoise/second_col_r_reg[5][1]  ( .D(n1659), .CK(clk), .RB(n3696), 
        .Q(\denoise/second_col_r[5][1] ) );
  QDFFRBN \denoise/second_col_r_reg[4][1]  ( .D(n1658), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_r[4][1] ) );
  QDFFRBN \denoise/second_col_r_reg[3][1]  ( .D(n1657), .CK(clk), .RB(n3664), 
        .Q(\denoise/second_col_r[3][1] ) );
  QDFFRBN \denoise/second_col_r_reg[2][1]  ( .D(n1656), .CK(clk), .RB(n3664), 
        .Q(\denoise/second_col_r[2][1] ) );
  QDFFRBN \denoise/second_col_r_reg[1][1]  ( .D(n1655), .CK(clk), .RB(n3751), 
        .Q(\denoise/second_col_r[1][1] ) );
  QDFFRBN \denoise/second_col_r_reg[0][1]  ( .D(n1654), .CK(clk), .RB(n3743), 
        .Q(\denoise/second_col_r[0][1] ) );
  QDFFRBN \denoise/first_col_r_reg[5][1]  ( .D(n1653), .CK(clk), .RB(n3745), 
        .Q(\denoise/first_col_r[5][1] ) );
  QDFFRBN \denoise/first_col_r_reg[4][1]  ( .D(n1652), .CK(clk), .RB(n3751), 
        .Q(\denoise/first_col_r[4][1] ) );
  QDFFRBN \denoise/first_col_r_reg[3][1]  ( .D(n1651), .CK(clk), .RB(n3743), 
        .Q(\denoise/first_col_r[3][1] ) );
  QDFFRBN \denoise/first_col_r_reg[2][1]  ( .D(n1650), .CK(clk), .RB(n3745), 
        .Q(\denoise/first_col_r[2][1] ) );
  QDFFRBN \denoise/first_col_r_reg[1][1]  ( .D(n1649), .CK(clk), .RB(n3665), 
        .Q(\denoise/first_col_r[1][1] ) );
  QDFFRBN \denoise/first_col_r_reg[0][1]  ( .D(n1648), .CK(clk), .RB(n3665), 
        .Q(\denoise/first_col_r[0][1] ) );
  QDFFRBN \denoise/second_col_g_reg[0][1]  ( .D(n1647), .CK(clk), .RB(n3665), 
        .Q(\denoise/second_col_g[0][1] ) );
  QDFFRBN \denoise/second_col_g_reg[1][1]  ( .D(n1646), .CK(clk), .RB(n3665), 
        .Q(\denoise/second_col_g[1][1] ) );
  QDFFRBN \denoise/second_col_g_reg[2][1]  ( .D(n1645), .CK(clk), .RB(n3665), 
        .Q(\denoise/second_col_g[2][1] ) );
  QDFFRBN \denoise/second_col_g_reg[3][1]  ( .D(n1644), .CK(clk), .RB(n3665), 
        .Q(\denoise/second_col_g[3][1] ) );
  QDFFRBN \denoise/second_col_g_reg[4][1]  ( .D(n1643), .CK(clk), .RB(n3666), 
        .Q(\denoise/second_col_g[4][1] ) );
  QDFFRBN \denoise/second_col_g_reg[5][1]  ( .D(n1642), .CK(clk), .RB(n3666), 
        .Q(\denoise/second_col_g[5][1] ) );
  QDFFRBN \denoise/first_col_g_reg[0][1]  ( .D(n1641), .CK(clk), .RB(n3666), 
        .Q(\denoise/first_col_g[0][1] ) );
  QDFFRBN \denoise/first_col_g_reg[1][1]  ( .D(n1640), .CK(clk), .RB(n3666), 
        .Q(\denoise/first_col_g[1][1] ) );
  QDFFRBN \denoise/first_col_g_reg[2][1]  ( .D(n1639), .CK(clk), .RB(n3666), 
        .Q(\denoise/first_col_g[2][1] ) );
  QDFFRBN \denoise/first_col_g_reg[3][1]  ( .D(n1638), .CK(clk), .RB(n3666), 
        .Q(\denoise/first_col_g[3][1] ) );
  QDFFRBN \denoise/first_col_g_reg[4][1]  ( .D(n1637), .CK(clk), .RB(n3746), 
        .Q(\denoise/first_col_g[4][1] ) );
  QDFFRBN \denoise/first_col_g_reg[5][1]  ( .D(n1636), .CK(clk), .RB(n3744), 
        .Q(\denoise/first_col_g[5][1] ) );
  QDFFRBN \denoise/second_col_b_reg[0][1]  ( .D(n1635), .CK(clk), .RB(n3742), 
        .Q(\denoise/second_col_b[0][1] ) );
  QDFFRBN \denoise/second_col_b_reg[1][1]  ( .D(n1634), .CK(clk), .RB(n3746), 
        .Q(\denoise/second_col_b[1][1] ) );
  QDFFRBN \denoise/second_col_b_reg[2][1]  ( .D(n1633), .CK(clk), .RB(n3744), 
        .Q(\denoise/second_col_b[2][1] ) );
  QDFFRBN \denoise/second_col_b_reg[3][1]  ( .D(n1632), .CK(clk), .RB(n3742), 
        .Q(\denoise/second_col_b[3][1] ) );
  QDFFRBN \denoise/second_col_b_reg[4][1]  ( .D(n1631), .CK(clk), .RB(n3667), 
        .Q(\denoise/second_col_b[4][1] ) );
  QDFFRBN \denoise/second_col_b_reg[5][1]  ( .D(n1630), .CK(clk), .RB(n3667), 
        .Q(\denoise/second_col_b[5][1] ) );
  QDFFRBN \denoise/first_col_b_reg[0][1]  ( .D(n1629), .CK(clk), .RB(n3667), 
        .Q(\denoise/first_col_b[0][1] ) );
  QDFFRBN \denoise/first_col_b_reg[1][1]  ( .D(n1628), .CK(clk), .RB(n3667), 
        .Q(\denoise/first_col_b[1][1] ) );
  QDFFRBN \denoise/first_col_b_reg[2][1]  ( .D(n1627), .CK(clk), .RB(n3667), 
        .Q(\denoise/first_col_b[2][1] ) );
  QDFFRBN \denoise/first_col_b_reg[3][1]  ( .D(n1626), .CK(clk), .RB(n3667), 
        .Q(\denoise/first_col_b[3][1] ) );
  QDFFRBN \denoise/first_col_b_reg[4][1]  ( .D(n1625), .CK(clk), .RB(n3668), 
        .Q(\denoise/first_col_b[4][1] ) );
  QDFFRBN \denoise/first_col_b_reg[5][1]  ( .D(n1624), .CK(clk), .RB(n3668), 
        .Q(\denoise/first_col_b[5][1] ) );
  QDFFRBN \denoise/pos7_reg[1]  ( .D(n1392), .CK(clk), .RB(n3668), .Q(
        \denoise/pos7 [1]) );
  QDFFRBN \denoise/pos8_reg[1]  ( .D(n1406), .CK(clk), .RB(n3668), .Q(
        \denoise/pos8 [1]) );
  QDFFRBN \denoise/pixel_in_reg_reg[2]  ( .D(pixel_in_den[2]), .CK(clk), .RB(
        n3668), .Q(\denoise/pixel_in_reg [2]) );
  QDFFRBN \denoise/pos9_reg[2]  ( .D(n1623), .CK(clk), .RB(n3668), .Q(
        \denoise/pos9 [2]) );
  QDFFRBN \denoise/second_col_r_reg[5][2]  ( .D(n1622), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[5][2] ) );
  QDFFRBN \denoise/second_col_r_reg[4][2]  ( .D(n1621), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[4][2] ) );
  QDFFRBN \denoise/second_col_r_reg[3][2]  ( .D(n1620), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[3][2] ) );
  QDFFRBN \denoise/second_col_r_reg[2][2]  ( .D(n1619), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[2][2] ) );
  QDFFRBN \denoise/second_col_r_reg[1][2]  ( .D(n1618), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[1][2] ) );
  QDFFRBN \denoise/second_col_r_reg[0][2]  ( .D(n1617), .CK(clk), .RB(n3669), 
        .Q(\denoise/second_col_r[0][2] ) );
  QDFFRBN \denoise/first_col_r_reg[5][2]  ( .D(n1616), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[5][2] ) );
  QDFFRBN \denoise/first_col_r_reg[4][2]  ( .D(n1615), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[4][2] ) );
  QDFFRBN \denoise/first_col_r_reg[3][2]  ( .D(n1614), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[3][2] ) );
  QDFFRBN \denoise/first_col_r_reg[2][2]  ( .D(n1613), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[2][2] ) );
  QDFFRBN \denoise/first_col_r_reg[1][2]  ( .D(n1612), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[1][2] ) );
  QDFFRBN \denoise/first_col_r_reg[0][2]  ( .D(n1611), .CK(clk), .RB(n3670), 
        .Q(\denoise/first_col_r[0][2] ) );
  QDFFRBN \denoise/second_col_g_reg[0][2]  ( .D(n1610), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_g[0][2] ) );
  QDFFRBN \denoise/second_col_g_reg[1][2]  ( .D(n1609), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_g[1][2] ) );
  QDFFRBN \denoise/second_col_g_reg[2][2]  ( .D(n1608), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_g[2][2] ) );
  QDFFRBN \denoise/second_col_g_reg[3][2]  ( .D(n1607), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_g[3][2] ) );
  QDFFRBN \denoise/second_col_g_reg[4][2]  ( .D(n1606), .CK(clk), .RB(n3671), 
        .Q(\denoise/second_col_g[4][2] ) );
  QDFFRBN \denoise/second_col_g_reg[5][2]  ( .D(n1605), .CK(clk), .RB(n3672), 
        .Q(\denoise/second_col_g[5][2] ) );
  QDFFRBN \denoise/first_col_g_reg[0][2]  ( .D(n1604), .CK(clk), .RB(n3672), 
        .Q(\denoise/first_col_g[0][2] ) );
  QDFFRBN \denoise/first_col_g_reg[1][2]  ( .D(n1603), .CK(clk), .RB(n3672), 
        .Q(\denoise/first_col_g[1][2] ) );
  QDFFRBN \denoise/first_col_g_reg[2][2]  ( .D(n1602), .CK(clk), .RB(n3672), 
        .Q(\denoise/first_col_g[2][2] ) );
  QDFFRBN \denoise/first_col_g_reg[3][2]  ( .D(n1601), .CK(clk), .RB(n3672), 
        .Q(\denoise/first_col_g[3][2] ) );
  QDFFRBN \denoise/first_col_g_reg[4][2]  ( .D(n1600), .CK(clk), .RB(n3672), 
        .Q(\denoise/first_col_g[4][2] ) );
  QDFFRBN \denoise/first_col_g_reg[5][2]  ( .D(n1599), .CK(clk), .RB(n3673), 
        .Q(\denoise/first_col_g[5][2] ) );
  QDFFRBN \denoise/second_col_b_reg[0][2]  ( .D(n1598), .CK(clk), .RB(n3673), 
        .Q(\denoise/second_col_b[0][2] ) );
  QDFFRBN \denoise/second_col_b_reg[1][2]  ( .D(n1597), .CK(clk), .RB(n3673), 
        .Q(\denoise/second_col_b[1][2] ) );
  QDFFRBN \denoise/second_col_b_reg[2][2]  ( .D(n1596), .CK(clk), .RB(n3673), 
        .Q(\denoise/second_col_b[2][2] ) );
  QDFFRBN \denoise/second_col_b_reg[3][2]  ( .D(n1595), .CK(clk), .RB(n3673), 
        .Q(\denoise/second_col_b[3][2] ) );
  QDFFRBN \denoise/second_col_b_reg[4][2]  ( .D(n1594), .CK(clk), .RB(n3673), 
        .Q(\denoise/second_col_b[4][2] ) );
  QDFFRBN \denoise/second_col_b_reg[5][2]  ( .D(n1593), .CK(clk), .RB(n3674), 
        .Q(\denoise/second_col_b[5][2] ) );
  QDFFRBN \denoise/first_col_b_reg[0][2]  ( .D(n1592), .CK(clk), .RB(n3674), 
        .Q(\denoise/first_col_b[0][2] ) );
  QDFFRBN \denoise/first_col_b_reg[1][2]  ( .D(n1591), .CK(clk), .RB(n3674), 
        .Q(\denoise/first_col_b[1][2] ) );
  QDFFRBN \denoise/first_col_b_reg[2][2]  ( .D(n1590), .CK(clk), .RB(n3674), 
        .Q(\denoise/first_col_b[2][2] ) );
  QDFFRBN \denoise/first_col_b_reg[3][2]  ( .D(n1589), .CK(clk), .RB(n3674), 
        .Q(\denoise/first_col_b[3][2] ) );
  QDFFRBN \denoise/first_col_b_reg[4][2]  ( .D(n1588), .CK(clk), .RB(n3674), 
        .Q(\denoise/first_col_b[4][2] ) );
  QDFFRBN \denoise/first_col_b_reg[5][2]  ( .D(n1587), .CK(clk), .RB(n3675), 
        .Q(\denoise/first_col_b[5][2] ) );
  QDFFRBN \denoise/pos7_reg[2]  ( .D(n1391), .CK(clk), .RB(n3675), .Q(
        \denoise/pos7 [2]) );
  QDFFRBN \denoise/pos8_reg[2]  ( .D(n1405), .CK(clk), .RB(n3675), .Q(
        \denoise/pos8 [2]) );
  QDFFRBN \denoise/pixel_in_reg_reg[3]  ( .D(pixel_in_den[3]), .CK(clk), .RB(
        n3675), .Q(\denoise/pixel_in_reg [3]) );
  QDFFRBN \denoise/pos9_reg[3]  ( .D(n1586), .CK(clk), .RB(n3675), .Q(
        \denoise/pos9 [3]) );
  QDFFRBN \denoise/second_col_r_reg[5][3]  ( .D(n1585), .CK(clk), .RB(n3675), 
        .Q(\denoise/second_col_r[5][3] ) );
  QDFFRBN \denoise/second_col_r_reg[4][3]  ( .D(n1584), .CK(clk), .RB(n3676), 
        .Q(\denoise/second_col_r[4][3] ) );
  QDFFRBN \denoise/second_col_r_reg[3][3]  ( .D(n1583), .CK(clk), .RB(n3676), 
        .Q(\denoise/second_col_r[3][3] ) );
  QDFFRBN \denoise/second_col_r_reg[2][3]  ( .D(n1582), .CK(clk), .RB(n3676), 
        .Q(\denoise/second_col_r[2][3] ) );
  QDFFRBN \denoise/second_col_r_reg[1][3]  ( .D(n1581), .CK(clk), .RB(n3676), 
        .Q(\denoise/second_col_r[1][3] ) );
  QDFFRBN \denoise/second_col_r_reg[0][3]  ( .D(n1580), .CK(clk), .RB(n3676), 
        .Q(\denoise/second_col_r[0][3] ) );
  QDFFRBN \denoise/first_col_r_reg[5][3]  ( .D(n1579), .CK(clk), .RB(n3676), 
        .Q(\denoise/first_col_r[5][3] ) );
  QDFFRBN \denoise/first_col_r_reg[4][3]  ( .D(n1578), .CK(clk), .RB(n3677), 
        .Q(\denoise/first_col_r[4][3] ) );
  QDFFRBN \denoise/first_col_r_reg[3][3]  ( .D(n1577), .CK(clk), .RB(n3677), 
        .Q(\denoise/first_col_r[3][3] ) );
  QDFFRBN \denoise/first_col_r_reg[2][3]  ( .D(n1576), .CK(clk), .RB(n3677), 
        .Q(\denoise/first_col_r[2][3] ) );
  QDFFRBN \denoise/first_col_r_reg[1][3]  ( .D(n1575), .CK(clk), .RB(n3677), 
        .Q(\denoise/first_col_r[1][3] ) );
  QDFFRBN \denoise/first_col_r_reg[0][3]  ( .D(n1574), .CK(clk), .RB(n3677), 
        .Q(\denoise/first_col_r[0][3] ) );
  QDFFRBN \denoise/second_col_g_reg[0][3]  ( .D(n1573), .CK(clk), .RB(n3677), 
        .Q(\denoise/second_col_g[0][3] ) );
  QDFFRBN \denoise/second_col_g_reg[1][3]  ( .D(n1572), .CK(clk), .RB(n3678), 
        .Q(\denoise/second_col_g[1][3] ) );
  QDFFRBN \denoise/second_col_g_reg[2][3]  ( .D(n1571), .CK(clk), .RB(n3678), 
        .Q(\denoise/second_col_g[2][3] ) );
  QDFFRBN \denoise/second_col_g_reg[3][3]  ( .D(n1570), .CK(clk), .RB(n3678), 
        .Q(\denoise/second_col_g[3][3] ) );
  QDFFRBN \denoise/second_col_g_reg[4][3]  ( .D(n1569), .CK(clk), .RB(n3678), 
        .Q(\denoise/second_col_g[4][3] ) );
  QDFFRBN \denoise/second_col_g_reg[5][3]  ( .D(n1568), .CK(clk), .RB(n3678), 
        .Q(\denoise/second_col_g[5][3] ) );
  QDFFRBN \denoise/first_col_g_reg[0][3]  ( .D(n1567), .CK(clk), .RB(n3678), 
        .Q(\denoise/first_col_g[0][3] ) );
  QDFFRBN \denoise/first_col_g_reg[1][3]  ( .D(n1566), .CK(clk), .RB(n3679), 
        .Q(\denoise/first_col_g[1][3] ) );
  QDFFRBN \denoise/first_col_g_reg[2][3]  ( .D(n1565), .CK(clk), .RB(n3679), 
        .Q(\denoise/first_col_g[2][3] ) );
  QDFFRBN \denoise/first_col_g_reg[3][3]  ( .D(n1564), .CK(clk), .RB(n3679), 
        .Q(\denoise/first_col_g[3][3] ) );
  QDFFRBN \denoise/first_col_g_reg[4][3]  ( .D(n1563), .CK(clk), .RB(n3679), 
        .Q(\denoise/first_col_g[4][3] ) );
  QDFFRBN \denoise/first_col_g_reg[5][3]  ( .D(n1562), .CK(clk), .RB(n3679), 
        .Q(\denoise/first_col_g[5][3] ) );
  QDFFRBN \denoise/second_col_b_reg[0][3]  ( .D(n1561), .CK(clk), .RB(n3679), 
        .Q(\denoise/second_col_b[0][3] ) );
  QDFFRBN \denoise/second_col_b_reg[1][3]  ( .D(n1560), .CK(clk), .RB(n3680), 
        .Q(\denoise/second_col_b[1][3] ) );
  QDFFRBN \denoise/second_col_b_reg[2][3]  ( .D(n1559), .CK(clk), .RB(n3680), 
        .Q(\denoise/second_col_b[2][3] ) );
  QDFFRBN \denoise/second_col_b_reg[3][3]  ( .D(n1558), .CK(clk), .RB(n3680), 
        .Q(\denoise/second_col_b[3][3] ) );
  QDFFRBN \denoise/second_col_b_reg[4][3]  ( .D(n1557), .CK(clk), .RB(n3680), 
        .Q(\denoise/second_col_b[4][3] ) );
  QDFFRBN \denoise/second_col_b_reg[5][3]  ( .D(n1556), .CK(clk), .RB(n3680), 
        .Q(\denoise/second_col_b[5][3] ) );
  QDFFRBN \denoise/first_col_b_reg[0][3]  ( .D(n1555), .CK(clk), .RB(n3713), 
        .Q(\denoise/first_col_b[0][3] ) );
  QDFFRBN \denoise/first_col_b_reg[1][3]  ( .D(n1554), .CK(clk), .RB(n3713), 
        .Q(\denoise/first_col_b[1][3] ) );
  QDFFRBN \denoise/first_col_b_reg[2][3]  ( .D(n1553), .CK(clk), .RB(n3713), 
        .Q(\denoise/first_col_b[2][3] ) );
  QDFFRBN \denoise/first_col_b_reg[3][3]  ( .D(n1552), .CK(clk), .RB(n3713), 
        .Q(\denoise/first_col_b[3][3] ) );
  QDFFRBN \denoise/first_col_b_reg[4][3]  ( .D(n1551), .CK(clk), .RB(n3713), 
        .Q(\denoise/first_col_b[4][3] ) );
  QDFFRBN \denoise/first_col_b_reg[5][3]  ( .D(n1550), .CK(clk), .RB(n3714), 
        .Q(\denoise/first_col_b[5][3] ) );
  QDFFRBN \denoise/pos7_reg[3]  ( .D(n1390), .CK(clk), .RB(n3714), .Q(
        \denoise/pos7 [3]) );
  QDFFRBN \denoise/pos8_reg[3]  ( .D(n1404), .CK(clk), .RB(n3714), .Q(
        \denoise/pos8 [3]) );
  QDFFRBN \denoise/pixel_in_reg_reg[4]  ( .D(pixel_in_den[4]), .CK(clk), .RB(
        n3714), .Q(\denoise/pixel_in_reg [4]) );
  QDFFRBN \denoise/pos9_reg[4]  ( .D(n1549), .CK(clk), .RB(n3714), .Q(
        \denoise/pos9 [4]) );
  QDFFRBN \denoise/second_col_r_reg[5][4]  ( .D(n1548), .CK(clk), .RB(n3714), 
        .Q(\denoise/second_col_r[5][4] ) );
  QDFFRBN \denoise/second_col_r_reg[4][4]  ( .D(n1547), .CK(clk), .RB(n3715), 
        .Q(\denoise/second_col_r[4][4] ) );
  QDFFRBN \denoise/second_col_r_reg[3][4]  ( .D(n1546), .CK(clk), .RB(n3715), 
        .Q(\denoise/second_col_r[3][4] ) );
  QDFFRBN \denoise/second_col_r_reg[2][4]  ( .D(n1545), .CK(clk), .RB(n3715), 
        .Q(\denoise/second_col_r[2][4] ) );
  QDFFRBN \denoise/second_col_r_reg[1][4]  ( .D(n1544), .CK(clk), .RB(n3715), 
        .Q(\denoise/second_col_r[1][4] ) );
  QDFFRBN \denoise/second_col_r_reg[0][4]  ( .D(n1543), .CK(clk), .RB(n3715), 
        .Q(\denoise/second_col_r[0][4] ) );
  QDFFRBN \denoise/first_col_r_reg[5][4]  ( .D(n1542), .CK(clk), .RB(n3715), 
        .Q(\denoise/first_col_r[5][4] ) );
  QDFFRBN \denoise/first_col_r_reg[4][4]  ( .D(n1541), .CK(clk), .RB(n3716), 
        .Q(\denoise/first_col_r[4][4] ) );
  QDFFRBN \denoise/first_col_r_reg[3][4]  ( .D(n1540), .CK(clk), .RB(n3716), 
        .Q(\denoise/first_col_r[3][4] ) );
  QDFFRBN \denoise/first_col_r_reg[2][4]  ( .D(n1539), .CK(clk), .RB(n3716), 
        .Q(\denoise/first_col_r[2][4] ) );
  QDFFRBN \denoise/first_col_r_reg[1][4]  ( .D(n1538), .CK(clk), .RB(n3716), 
        .Q(\denoise/first_col_r[1][4] ) );
  QDFFRBN \denoise/first_col_r_reg[0][4]  ( .D(n1537), .CK(clk), .RB(n3716), 
        .Q(\denoise/first_col_r[0][4] ) );
  QDFFRBN \denoise/second_col_g_reg[0][4]  ( .D(n1536), .CK(clk), .RB(n3716), 
        .Q(\denoise/second_col_g[0][4] ) );
  QDFFRBN \denoise/second_col_g_reg[1][4]  ( .D(n1535), .CK(clk), .RB(n3717), 
        .Q(\denoise/second_col_g[1][4] ) );
  QDFFRBN \denoise/second_col_g_reg[2][4]  ( .D(n1534), .CK(clk), .RB(n3717), 
        .Q(\denoise/second_col_g[2][4] ) );
  QDFFRBN \denoise/second_col_g_reg[3][4]  ( .D(n1533), .CK(clk), .RB(n3722), 
        .Q(\denoise/second_col_g[3][4] ) );
  QDFFRBN \denoise/second_col_g_reg[4][4]  ( .D(n1532), .CK(clk), .RB(n3717), 
        .Q(\denoise/second_col_g[4][4] ) );
  QDFFRBN \denoise/second_col_g_reg[5][4]  ( .D(n1531), .CK(clk), .RB(n3717), 
        .Q(\denoise/second_col_g[5][4] ) );
  QDFFRBN \denoise/first_col_g_reg[0][4]  ( .D(n1530), .CK(clk), .RB(n3717), 
        .Q(\denoise/first_col_g[0][4] ) );
  QDFFRBN \denoise/first_col_g_reg[1][4]  ( .D(n1529), .CK(clk), .RB(n3717), 
        .Q(\denoise/first_col_g[1][4] ) );
  QDFFRBN \denoise/first_col_g_reg[2][4]  ( .D(n1528), .CK(clk), .RB(n3718), 
        .Q(\denoise/first_col_g[2][4] ) );
  QDFFRBN \denoise/first_col_g_reg[3][4]  ( .D(n1527), .CK(clk), .RB(n3718), 
        .Q(\denoise/first_col_g[3][4] ) );
  QDFFRBN \denoise/first_col_g_reg[4][4]  ( .D(n1526), .CK(clk), .RB(n3718), 
        .Q(\denoise/first_col_g[4][4] ) );
  QDFFRBN \denoise/first_col_g_reg[5][4]  ( .D(n1525), .CK(clk), .RB(n3718), 
        .Q(\denoise/first_col_g[5][4] ) );
  QDFFRBN \denoise/second_col_b_reg[0][4]  ( .D(n1524), .CK(clk), .RB(n3718), 
        .Q(\denoise/second_col_b[0][4] ) );
  QDFFRBN \denoise/second_col_b_reg[1][4]  ( .D(n1523), .CK(clk), .RB(n3718), 
        .Q(\denoise/second_col_b[1][4] ) );
  QDFFRBN \denoise/second_col_b_reg[2][4]  ( .D(n1522), .CK(clk), .RB(n3719), 
        .Q(\denoise/second_col_b[2][4] ) );
  QDFFRBN \denoise/second_col_b_reg[3][4]  ( .D(n1521), .CK(clk), .RB(n3719), 
        .Q(\denoise/second_col_b[3][4] ) );
  QDFFRBN \denoise/second_col_b_reg[4][4]  ( .D(n1520), .CK(clk), .RB(n3719), 
        .Q(\denoise/second_col_b[4][4] ) );
  QDFFRBN \denoise/second_col_b_reg[5][4]  ( .D(n1519), .CK(clk), .RB(n3719), 
        .Q(\denoise/second_col_b[5][4] ) );
  QDFFRBN \denoise/first_col_b_reg[0][4]  ( .D(n1518), .CK(clk), .RB(n3719), 
        .Q(\denoise/first_col_b[0][4] ) );
  QDFFRBN \denoise/first_col_b_reg[1][4]  ( .D(n1517), .CK(clk), .RB(n3719), 
        .Q(\denoise/first_col_b[1][4] ) );
  QDFFRBN \denoise/first_col_b_reg[2][4]  ( .D(n1516), .CK(clk), .RB(n3720), 
        .Q(\denoise/first_col_b[2][4] ) );
  QDFFRBN \denoise/first_col_b_reg[3][4]  ( .D(n1515), .CK(clk), .RB(n3720), 
        .Q(\denoise/first_col_b[3][4] ) );
  QDFFRBN \denoise/first_col_b_reg[4][4]  ( .D(n1514), .CK(clk), .RB(n3720), 
        .Q(\denoise/first_col_b[4][4] ) );
  QDFFRBN \denoise/first_col_b_reg[5][4]  ( .D(n1513), .CK(clk), .RB(n3720), 
        .Q(\denoise/first_col_b[5][4] ) );
  QDFFRBN \denoise/pos7_reg[4]  ( .D(n1389), .CK(clk), .RB(n3720), .Q(
        \denoise/pos7 [4]) );
  QDFFRBN \denoise/pos8_reg[4]  ( .D(n1403), .CK(clk), .RB(n3720), .Q(
        \denoise/pos8 [4]) );
  QDFFRBN \denoise/pixel_in_reg_reg[5]  ( .D(pixel_in_den[5]), .CK(clk), .RB(
        n3721), .Q(\denoise/pixel_in_reg [5]) );
  QDFFRBN \denoise/pos9_reg[5]  ( .D(n1512), .CK(clk), .RB(n3721), .Q(
        \denoise/pos9 [5]) );
  QDFFRBN \denoise/second_col_r_reg[5][5]  ( .D(n1511), .CK(clk), .RB(n3721), 
        .Q(\denoise/second_col_r[5][5] ) );
  QDFFRBN \denoise/second_col_r_reg[4][5]  ( .D(n1510), .CK(clk), .RB(n3721), 
        .Q(\denoise/second_col_r[4][5] ) );
  QDFFRBN \denoise/second_col_r_reg[3][5]  ( .D(n1509), .CK(clk), .RB(n3721), 
        .Q(\denoise/second_col_r[3][5] ) );
  QDFFRBN \denoise/second_col_r_reg[2][5]  ( .D(n1508), .CK(clk), .RB(n3721), 
        .Q(\denoise/second_col_r[2][5] ) );
  QDFFRBN \denoise/second_col_r_reg[1][5]  ( .D(n1507), .CK(clk), .RB(n3722), 
        .Q(\denoise/second_col_r[1][5] ) );
  QDFFRBN \denoise/second_col_r_reg[0][5]  ( .D(n1506), .CK(clk), .RB(n3722), 
        .Q(\denoise/second_col_r[0][5] ) );
  QDFFRBN \denoise/first_col_r_reg[5][5]  ( .D(n1505), .CK(clk), .RB(n3722), 
        .Q(\denoise/first_col_r[5][5] ) );
  QDFFRBN \denoise/first_col_r_reg[4][5]  ( .D(n1504), .CK(clk), .RB(n3722), 
        .Q(\denoise/first_col_r[4][5] ) );
  QDFFRBN \denoise/first_col_r_reg[3][5]  ( .D(n1503), .CK(clk), .RB(n3722), 
        .Q(\denoise/first_col_r[3][5] ) );
  QDFFRBN \denoise/first_col_r_reg[2][5]  ( .D(n1502), .CK(clk), .RB(n3723), 
        .Q(\denoise/first_col_r[2][5] ) );
  QDFFRBN \denoise/first_col_r_reg[1][5]  ( .D(n1501), .CK(clk), .RB(n3723), 
        .Q(\denoise/first_col_r[1][5] ) );
  QDFFRBN \denoise/first_col_r_reg[0][5]  ( .D(n1500), .CK(clk), .RB(n3723), 
        .Q(\denoise/first_col_r[0][5] ) );
  QDFFRBN \denoise/second_col_g_reg[0][5]  ( .D(n1499), .CK(clk), .RB(n3723), 
        .Q(\denoise/second_col_g[0][5] ) );
  QDFFRBN \denoise/second_col_g_reg[1][5]  ( .D(n1498), .CK(clk), .RB(n3723), 
        .Q(\denoise/second_col_g[1][5] ) );
  QDFFRBN \denoise/second_col_g_reg[2][5]  ( .D(n1497), .CK(clk), .RB(n3723), 
        .Q(\denoise/second_col_g[2][5] ) );
  QDFFRBN \denoise/second_col_g_reg[3][5]  ( .D(n1496), .CK(clk), .RB(n3724), 
        .Q(\denoise/second_col_g[3][5] ) );
  QDFFRBN \denoise/second_col_g_reg[4][5]  ( .D(n1495), .CK(clk), .RB(n3724), 
        .Q(\denoise/second_col_g[4][5] ) );
  QDFFRBN \denoise/second_col_g_reg[5][5]  ( .D(n1494), .CK(clk), .RB(n3724), 
        .Q(\denoise/second_col_g[5][5] ) );
  QDFFRBN \denoise/first_col_g_reg[0][5]  ( .D(n1493), .CK(clk), .RB(n3724), 
        .Q(\denoise/first_col_g[0][5] ) );
  QDFFRBN \denoise/first_col_g_reg[1][5]  ( .D(n1492), .CK(clk), .RB(n3724), 
        .Q(\denoise/first_col_g[1][5] ) );
  QDFFRBN \denoise/first_col_g_reg[2][5]  ( .D(n1491), .CK(clk), .RB(n3724), 
        .Q(\denoise/first_col_g[2][5] ) );
  QDFFRBN \denoise/first_col_g_reg[3][5]  ( .D(n1490), .CK(clk), .RB(n3725), 
        .Q(\denoise/first_col_g[3][5] ) );
  QDFFRBN \denoise/first_col_g_reg[4][5]  ( .D(n1489), .CK(clk), .RB(n3725), 
        .Q(\denoise/first_col_g[4][5] ) );
  QDFFRBN \denoise/first_col_g_reg[5][5]  ( .D(n1488), .CK(clk), .RB(n3725), 
        .Q(\denoise/first_col_g[5][5] ) );
  QDFFRBN \denoise/second_col_b_reg[0][5]  ( .D(n1487), .CK(clk), .RB(n3725), 
        .Q(\denoise/second_col_b[0][5] ) );
  QDFFRBN \denoise/second_col_b_reg[1][5]  ( .D(n1486), .CK(clk), .RB(n3725), 
        .Q(\denoise/second_col_b[1][5] ) );
  QDFFRBN \denoise/second_col_b_reg[2][5]  ( .D(n1485), .CK(clk), .RB(n3725), 
        .Q(\denoise/second_col_b[2][5] ) );
  QDFFRBN \denoise/second_col_b_reg[3][5]  ( .D(n1484), .CK(clk), .RB(n3726), 
        .Q(\denoise/second_col_b[3][5] ) );
  QDFFRBN \denoise/second_col_b_reg[4][5]  ( .D(n1483), .CK(clk), .RB(n3726), 
        .Q(\denoise/second_col_b[4][5] ) );
  QDFFRBN \denoise/second_col_b_reg[5][5]  ( .D(n1482), .CK(clk), .RB(n3726), 
        .Q(\denoise/second_col_b[5][5] ) );
  QDFFRBN \denoise/first_col_b_reg[0][5]  ( .D(n1481), .CK(clk), .RB(n3726), 
        .Q(\denoise/first_col_b[0][5] ) );
  QDFFRBN \denoise/first_col_b_reg[1][5]  ( .D(n1480), .CK(clk), .RB(n3726), 
        .Q(\denoise/first_col_b[1][5] ) );
  QDFFRBN \denoise/first_col_b_reg[2][5]  ( .D(n1479), .CK(clk), .RB(n3726), 
        .Q(\denoise/first_col_b[2][5] ) );
  QDFFRBN \denoise/first_col_b_reg[3][5]  ( .D(n1478), .CK(clk), .RB(n3727), 
        .Q(\denoise/first_col_b[3][5] ) );
  QDFFRBN \denoise/first_col_b_reg[4][5]  ( .D(n1477), .CK(clk), .RB(n3727), 
        .Q(\denoise/first_col_b[4][5] ) );
  QDFFRBN \denoise/first_col_b_reg[5][5]  ( .D(n1476), .CK(clk), .RB(n3727), 
        .Q(\denoise/first_col_b[5][5] ) );
  QDFFRBN \denoise/pos7_reg[5]  ( .D(n1388), .CK(clk), .RB(n3727), .Q(
        \denoise/pos7 [5]) );
  QDFFRBN \denoise/pos8_reg[5]  ( .D(n1402), .CK(clk), .RB(n3727), .Q(
        \denoise/pos8 [5]) );
  QDFFRBN \denoise/pixel_in_reg_reg[6]  ( .D(pixel_in_den[6]), .CK(clk), .RB(
        n3727), .Q(\denoise/pixel_in_reg [6]) );
  QDFFRBN \denoise/pos9_reg[6]  ( .D(n1475), .CK(clk), .RB(n3728), .Q(
        \denoise/pos9 [6]) );
  QDFFRBN \denoise/second_col_r_reg[5][6]  ( .D(n1474), .CK(clk), .RB(n3728), 
        .Q(\denoise/second_col_r[5][6] ) );
  QDFFRBN \denoise/second_col_r_reg[4][6]  ( .D(n1473), .CK(clk), .RB(n3728), 
        .Q(\denoise/second_col_r[4][6] ) );
  QDFFRBN \denoise/second_col_r_reg[3][6]  ( .D(n1472), .CK(clk), .RB(n3728), 
        .Q(\denoise/second_col_r[3][6] ) );
  QDFFRBN \denoise/second_col_r_reg[2][6]  ( .D(n1471), .CK(clk), .RB(n3728), 
        .Q(\denoise/second_col_r[2][6] ) );
  QDFFRBN \denoise/second_col_r_reg[1][6]  ( .D(n1470), .CK(clk), .RB(n3728), 
        .Q(\denoise/second_col_r[1][6] ) );
  QDFFRBN \denoise/second_col_r_reg[0][6]  ( .D(n1469), .CK(clk), .RB(n3729), 
        .Q(\denoise/second_col_r[0][6] ) );
  QDFFRBN \denoise/first_col_r_reg[5][6]  ( .D(n1468), .CK(clk), .RB(n3729), 
        .Q(\denoise/first_col_r[5][6] ) );
  QDFFRBN \denoise/first_col_r_reg[4][6]  ( .D(n1467), .CK(clk), .RB(n3729), 
        .Q(\denoise/first_col_r[4][6] ) );
  QDFFRBN \denoise/first_col_r_reg[3][6]  ( .D(n1466), .CK(clk), .RB(n3729), 
        .Q(\denoise/first_col_r[3][6] ) );
  QDFFRBN \denoise/first_col_r_reg[2][6]  ( .D(n1465), .CK(clk), .RB(n3729), 
        .Q(\denoise/first_col_r[2][6] ) );
  QDFFRBN \denoise/first_col_r_reg[1][6]  ( .D(n1464), .CK(clk), .RB(n3729), 
        .Q(\denoise/first_col_r[1][6] ) );
  QDFFRBN \denoise/first_col_r_reg[0][6]  ( .D(n1463), .CK(clk), .RB(n3730), 
        .Q(\denoise/first_col_r[0][6] ) );
  QDFFRBN \denoise/second_col_g_reg[0][6]  ( .D(n1462), .CK(clk), .RB(n3730), 
        .Q(\denoise/second_col_g[0][6] ) );
  QDFFRBN \denoise/second_col_g_reg[1][6]  ( .D(n1461), .CK(clk), .RB(n3730), 
        .Q(\denoise/second_col_g[1][6] ) );
  QDFFRBN \denoise/second_col_g_reg[2][6]  ( .D(n1460), .CK(clk), .RB(n3730), 
        .Q(\denoise/second_col_g[2][6] ) );
  QDFFRBN \denoise/second_col_g_reg[3][6]  ( .D(n1459), .CK(clk), .RB(n3730), 
        .Q(\denoise/second_col_g[3][6] ) );
  QDFFRBN \denoise/second_col_g_reg[4][6]  ( .D(n1458), .CK(clk), .RB(n3730), 
        .Q(\denoise/second_col_g[4][6] ) );
  QDFFRBN \denoise/second_col_g_reg[5][6]  ( .D(n1457), .CK(clk), .RB(n3704), 
        .Q(\denoise/second_col_g[5][6] ) );
  QDFFRBN \denoise/first_col_g_reg[0][6]  ( .D(n1456), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[0][6] ) );
  QDFFRBN \denoise/first_col_g_reg[1][6]  ( .D(n1455), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[1][6] ) );
  QDFFRBN \denoise/first_col_g_reg[2][6]  ( .D(n1454), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[2][6] ) );
  QDFFRBN \denoise/first_col_g_reg[3][6]  ( .D(n1453), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[3][6] ) );
  QDFFRBN \denoise/first_col_g_reg[4][6]  ( .D(n1452), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[4][6] ) );
  QDFFRBN \denoise/first_col_g_reg[5][6]  ( .D(n1451), .CK(clk), .RB(n3697), 
        .Q(\denoise/first_col_g[5][6] ) );
  QDFFRBN \denoise/second_col_b_reg[0][6]  ( .D(n1450), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[0][6] ) );
  QDFFRBN \denoise/second_col_b_reg[1][6]  ( .D(n1449), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[1][6] ) );
  QDFFRBN \denoise/second_col_b_reg[2][6]  ( .D(n1448), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[2][6] ) );
  QDFFRBN \denoise/second_col_b_reg[3][6]  ( .D(n1447), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[3][6] ) );
  QDFFRBN \denoise/second_col_b_reg[4][6]  ( .D(n1446), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[4][6] ) );
  QDFFRBN \denoise/second_col_b_reg[5][6]  ( .D(n1445), .CK(clk), .RB(n3698), 
        .Q(\denoise/second_col_b[5][6] ) );
  QDFFRBN \denoise/first_col_b_reg[0][6]  ( .D(n1444), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[0][6] ) );
  QDFFRBN \denoise/first_col_b_reg[1][6]  ( .D(n1443), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[1][6] ) );
  QDFFRBN \denoise/first_col_b_reg[2][6]  ( .D(n1442), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[2][6] ) );
  QDFFRBN \denoise/first_col_b_reg[3][6]  ( .D(n1441), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[3][6] ) );
  QDFFRBN \denoise/first_col_b_reg[4][6]  ( .D(n1440), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[4][6] ) );
  QDFFRBN \denoise/first_col_b_reg[5][6]  ( .D(n1439), .CK(clk), .RB(n3699), 
        .Q(\denoise/first_col_b[5][6] ) );
  QDFFRBN \denoise/pos7_reg[6]  ( .D(n1387), .CK(clk), .RB(n3700), .Q(
        \denoise/pos7 [6]) );
  QDFFRBN \denoise/pos8_reg[6]  ( .D(n1401), .CK(clk), .RB(n3700), .Q(
        \denoise/pos8 [6]) );
  QDFFRBN \denoise/pixel_in_reg_reg[7]  ( .D(pixel_in_den[7]), .CK(clk), .RB(
        n3700), .Q(\denoise/pixel_in_reg [7]) );
  QDFFRBN \denoise/pos9_reg[7]  ( .D(n1438), .CK(clk), .RB(n3700), .Q(
        \denoise/pos9 [7]) );
  QDFFRBN \denoise/second_col_r_reg[5][7]  ( .D(n1437), .CK(clk), .RB(n3700), 
        .Q(\denoise/second_col_r[5][7] ) );
  QDFFRBN \denoise/second_col_r_reg[4][7]  ( .D(n1436), .CK(clk), .RB(n3700), 
        .Q(\denoise/second_col_r[4][7] ) );
  QDFFRBN \denoise/second_col_r_reg[3][7]  ( .D(n1435), .CK(clk), .RB(n3701), 
        .Q(\denoise/second_col_r[3][7] ) );
  QDFFRBN \denoise/second_col_r_reg[2][7]  ( .D(n1434), .CK(clk), .RB(n3701), 
        .Q(\denoise/second_col_r[2][7] ) );
  QDFFRBN \denoise/second_col_r_reg[1][7]  ( .D(n1433), .CK(clk), .RB(n3701), 
        .Q(\denoise/second_col_r[1][7] ) );
  QDFFRBN \denoise/second_col_r_reg[0][7]  ( .D(n1432), .CK(clk), .RB(n3701), 
        .Q(\denoise/second_col_r[0][7] ) );
  QDFFRBN \denoise/first_col_r_reg[5][7]  ( .D(n1431), .CK(clk), .RB(n3701), 
        .Q(\denoise/first_col_r[5][7] ) );
  QDFFRBN \denoise/first_col_r_reg[4][7]  ( .D(n1430), .CK(clk), .RB(n3701), 
        .Q(\denoise/first_col_r[4][7] ) );
  QDFFRBN \denoise/first_col_r_reg[3][7]  ( .D(n1429), .CK(clk), .RB(n3702), 
        .Q(\denoise/first_col_r[3][7] ) );
  QDFFRBN \denoise/first_col_r_reg[2][7]  ( .D(n1428), .CK(clk), .RB(n3702), 
        .Q(\denoise/first_col_r[2][7] ) );
  QDFFRBN \denoise/first_col_r_reg[1][7]  ( .D(n1427), .CK(clk), .RB(n3702), 
        .Q(\denoise/first_col_r[1][7] ) );
  QDFFRBN \denoise/first_col_r_reg[0][7]  ( .D(n1426), .CK(clk), .RB(n3702), 
        .Q(\denoise/first_col_r[0][7] ) );
  QDFFRBN \denoise/second_col_g_reg[0][7]  ( .D(n1425), .CK(clk), .RB(n3702), 
        .Q(\denoise/second_col_g[0][7] ) );
  QDFFRBN \denoise/second_col_g_reg[1][7]  ( .D(n1424), .CK(clk), .RB(n3702), 
        .Q(\denoise/second_col_g[1][7] ) );
  QDFFRBN \denoise/second_col_g_reg[2][7]  ( .D(n1423), .CK(clk), .RB(n3753), 
        .Q(\denoise/second_col_g[2][7] ) );
  QDFFRBN \denoise/second_col_g_reg[3][7]  ( .D(n1422), .CK(clk), .RB(n3732), 
        .Q(\denoise/second_col_g[3][7] ) );
  QDFFRBN \denoise/second_col_g_reg[4][7]  ( .D(n1421), .CK(clk), .RB(n3735), 
        .Q(\denoise/second_col_g[4][7] ) );
  QDFFRBN \denoise/second_col_g_reg[5][7]  ( .D(n1420), .CK(clk), .RB(n3753), 
        .Q(\denoise/second_col_g[5][7] ) );
  QDFFRBN \denoise/first_col_g_reg[0][7]  ( .D(n1419), .CK(clk), .RB(n3732), 
        .Q(\denoise/first_col_g[0][7] ) );
  QDFFRBN \denoise/first_col_g_reg[1][7]  ( .D(n1418), .CK(clk), .RB(n3735), 
        .Q(\denoise/first_col_g[1][7] ) );
  QDFFRBN \denoise/first_col_g_reg[2][7]  ( .D(n1417), .CK(clk), .RB(n3703), 
        .Q(\denoise/first_col_g[2][7] ) );
  QDFFRBN \denoise/first_col_g_reg[3][7]  ( .D(n1416), .CK(clk), .RB(n3703), 
        .Q(\denoise/first_col_g[3][7] ) );
  QDFFRBN \denoise/first_col_g_reg[4][7]  ( .D(n1415), .CK(clk), .RB(n3703), 
        .Q(\denoise/first_col_g[4][7] ) );
  QDFFRBN \denoise/first_col_g_reg[5][7]  ( .D(n1414), .CK(clk), .RB(n3703), 
        .Q(\denoise/first_col_g[5][7] ) );
  QDFFRBN \denoise/second_col_b_reg[0][7]  ( .D(n1413), .CK(clk), .RB(n3703), 
        .Q(\denoise/second_col_b[0][7] ) );
  QDFFRBN \denoise/second_col_b_reg[1][7]  ( .D(n1412), .CK(clk), .RB(n3703), 
        .Q(\denoise/second_col_b[1][7] ) );
  QDFFRBN \denoise/second_col_b_reg[2][7]  ( .D(n1411), .CK(clk), .RB(n3704), 
        .Q(\denoise/second_col_b[2][7] ) );
  QDFFRBN \denoise/second_col_b_reg[3][7]  ( .D(n1410), .CK(clk), .RB(n3704), 
        .Q(\denoise/second_col_b[3][7] ) );
  QDFFRBN \denoise/second_col_b_reg[4][7]  ( .D(n1409), .CK(clk), .RB(n3704), 
        .Q(\denoise/second_col_b[4][7] ) );
  QDFFRBN \denoise/second_col_b_reg[5][7]  ( .D(n1408), .CK(clk), .RB(n3704), 
        .Q(\denoise/second_col_b[5][7] ) );
  QDFFRBN \denoise/pos8_reg[7]  ( .D(n1400), .CK(clk), .RB(n3704), .Q(
        \denoise/pos8 [7]) );
  QDFFRBN \denoise/first_col_b_reg[0][7]  ( .D(n1399), .CK(clk), .RB(n3733), 
        .Q(\denoise/first_col_b[0][7] ) );
  QDFFRBN \denoise/first_col_b_reg[1][7]  ( .D(n1398), .CK(clk), .RB(n3734), 
        .Q(\denoise/first_col_b[1][7] ) );
  QDFFRBN \denoise/first_col_b_reg[2][7]  ( .D(n1397), .CK(clk), .RB(n3731), 
        .Q(\denoise/first_col_b[2][7] ) );
  QDFFRBN \denoise/first_col_b_reg[3][7]  ( .D(n1396), .CK(clk), .RB(n3733), 
        .Q(\denoise/first_col_b[3][7] ) );
  QDFFRBN \denoise/first_col_b_reg[4][7]  ( .D(n1395), .CK(clk), .RB(n3734), 
        .Q(\denoise/first_col_b[4][7] ) );
  QDFFRBN \denoise/first_col_b_reg[5][7]  ( .D(n1394), .CK(clk), .RB(n3731), 
        .Q(\denoise/first_col_b[5][7] ) );
  QDFFRBN \denoise/pos7_reg[7]  ( .D(n1386), .CK(clk), .RB(n3705), .Q(
        \denoise/pos7 [7]) );
  QDFFRBN \denoise/color_out_reg_reg[0]  ( .D(\denoise/n_color_out_reg [0]), 
        .CK(clk), .RB(n3705), .Q(color_out_den[0]) );
  QDFFRBN \denoise/color_out_reg_reg[1]  ( .D(\denoise/n_color_out_reg [1]), 
        .CK(clk), .RB(n3705), .Q(color_out_den[1]) );
  QDFFRBN \denoise/valid_out_reg_reg  ( .D(\denoise/n_valid_out_reg ), .CK(clk), .RB(n3705), .Q(valid_out_den) );
  QDFFRBN \denoise/sum6_r_reg[0]  ( .D(n1383), .CK(clk), .RB(n3705), .Q(
        \denoise/sum6_r [0]) );
  QDFFRBN \denoise/sum3_r_reg[0]  ( .D(n1382), .CK(clk), .RB(n3705), .Q(
        \denoise/sum3_r [0]) );
  QDFFRBN \denoise/sum6_r_reg[1]  ( .D(n1377), .CK(clk), .RB(n3706), .Q(
        \denoise/sum6_r [1]) );
  QDFFRBN \denoise/sum3_r_reg[1]  ( .D(n1376), .CK(clk), .RB(n3706), .Q(
        \denoise/sum3_r [1]) );
  QDFFRBN \denoise/sum6_r_reg[2]  ( .D(n1369), .CK(clk), .RB(n3706), .Q(
        \denoise/sum6_r [2]) );
  QDFFRBN \denoise/sum3_r_reg[2]  ( .D(n1368), .CK(clk), .RB(n3706), .Q(
        \denoise/sum3_r [2]) );
  QDFFRBN \denoise/sum6_r_reg[3]  ( .D(n1361), .CK(clk), .RB(n3706), .Q(
        \denoise/sum6_r [3]) );
  QDFFRBN \denoise/sum3_r_reg[3]  ( .D(n1360), .CK(clk), .RB(n3706), .Q(
        \denoise/sum3_r [3]) );
  QDFFRBN \denoise/sum6_r_reg[4]  ( .D(n1353), .CK(clk), .RB(n3707), .Q(
        \denoise/sum6_r [4]) );
  QDFFRBN \denoise/sum3_r_reg[4]  ( .D(n1352), .CK(clk), .RB(n3707), .Q(
        \denoise/sum3_r [4]) );
  QDFFRBN \denoise/sum6_r_reg[5]  ( .D(n1345), .CK(clk), .RB(n3707), .Q(
        \denoise/sum6_r [5]) );
  QDFFRBN \denoise/sum3_r_reg[5]  ( .D(n1344), .CK(clk), .RB(n3707), .Q(
        \denoise/sum3_r [5]) );
  QDFFRBN \denoise/sum6_r_reg[6]  ( .D(n1337), .CK(clk), .RB(n3707), .Q(
        \denoise/sum6_r [6]) );
  QDFFRBN \denoise/sum3_r_reg[6]  ( .D(n1336), .CK(clk), .RB(n3707), .Q(
        \denoise/sum3_r [6]) );
  QDFFRBN \denoise/sum6_r_reg[7]  ( .D(n1329), .CK(clk), .RB(n3708), .Q(
        \denoise/sum6_r [7]) );
  QDFFRBN \denoise/sum3_r_reg[7]  ( .D(n1328), .CK(clk), .RB(n3708), .Q(
        \denoise/sum3_r [7]) );
  QDFFRBN \denoise/sum6_r_reg[8]  ( .D(n1321), .CK(clk), .RB(n3708), .Q(
        \denoise/sum6_r [8]) );
  QDFFRBN \denoise/sum3_r_reg[8]  ( .D(n1320), .CK(clk), .RB(n3708), .Q(
        \denoise/sum3_r [8]) );
  QDFFRBN \denoise/sum6_r_reg[9]  ( .D(n1313), .CK(clk), .RB(n3708), .Q(
        \denoise/sum6_r [9]) );
  QDFFRBN \denoise/sum3_r_reg[9]  ( .D(n1312), .CK(clk), .RB(n3708), .Q(
        \denoise/sum3_r [9]) );
  QDFFRBN \denoise/sum6_g_reg[0]  ( .D(n1381), .CK(clk), .RB(n3709), .Q(
        \denoise/sum6_g [0]) );
  QDFFRBN \denoise/sum3_g_reg[0]  ( .D(n1380), .CK(clk), .RB(n3709), .Q(
        \denoise/sum3_g [0]) );
  QDFFRBN \denoise/sum6_g_reg[1]  ( .D(n1375), .CK(clk), .RB(n3709), .Q(
        \denoise/sum6_g [1]) );
  QDFFRBN \denoise/sum3_g_reg[1]  ( .D(n1374), .CK(clk), .RB(n3709), .Q(
        \denoise/sum3_g [1]) );
  QDFFRBN \denoise/sum6_g_reg[2]  ( .D(n1367), .CK(clk), .RB(n3709), .Q(
        \denoise/sum6_g [2]) );
  QDFFRBN \denoise/sum3_g_reg[2]  ( .D(n1366), .CK(clk), .RB(n3709), .Q(
        \denoise/sum3_g [2]) );
  QDFFRBN \denoise/sum6_g_reg[3]  ( .D(n1359), .CK(clk), .RB(n3710), .Q(
        \denoise/sum6_g [3]) );
  QDFFRBN \denoise/sum3_g_reg[3]  ( .D(n1358), .CK(clk), .RB(n3710), .Q(
        \denoise/sum3_g [3]) );
  QDFFRBN \denoise/sum6_g_reg[4]  ( .D(n1351), .CK(clk), .RB(n3710), .Q(
        \denoise/sum6_g [4]) );
  QDFFRBN \denoise/sum3_g_reg[4]  ( .D(n1350), .CK(clk), .RB(n3710), .Q(
        \denoise/sum3_g [4]) );
  QDFFRBN \denoise/sum6_g_reg[5]  ( .D(n1343), .CK(clk), .RB(n3710), .Q(
        \denoise/sum6_g [5]) );
  QDFFRBN \denoise/sum3_g_reg[5]  ( .D(n1342), .CK(clk), .RB(n3710), .Q(
        \denoise/sum3_g [5]) );
  QDFFRBN \denoise/sum6_g_reg[6]  ( .D(n1335), .CK(clk), .RB(n3711), .Q(
        \denoise/sum6_g [6]) );
  QDFFRBN \denoise/sum3_g_reg[6]  ( .D(n1334), .CK(clk), .RB(n3711), .Q(
        \denoise/sum3_g [6]) );
  QDFFRBN \denoise/sum6_g_reg[7]  ( .D(n1327), .CK(clk), .RB(n3711), .Q(
        \denoise/sum6_g [7]) );
  QDFFRBN \denoise/sum3_g_reg[7]  ( .D(n1326), .CK(clk), .RB(n3711), .Q(
        \denoise/sum3_g [7]) );
  QDFFRBN \denoise/sum6_g_reg[8]  ( .D(n1319), .CK(clk), .RB(n3711), .Q(
        \denoise/sum6_g [8]) );
  QDFFRBN \denoise/sum3_g_reg[8]  ( .D(n1318), .CK(clk), .RB(n3711), .Q(
        \denoise/sum3_g [8]) );
  QDFFRBN \denoise/sum6_g_reg[9]  ( .D(n1311), .CK(clk), .RB(n3712), .Q(
        \denoise/sum6_g [9]) );
  QDFFRBN \denoise/sum3_g_reg[9]  ( .D(n1310), .CK(clk), .RB(n3712), .Q(
        \denoise/sum3_g [9]) );
  QDFFRBN \denoise/sum6_b_reg[0]  ( .D(n1379), .CK(clk), .RB(n3712), .Q(
        \denoise/sum6_b [0]) );
  QDFFRBN \denoise/sum3_b_reg[0]  ( .D(n1385), .CK(clk), .RB(n3712), .Q(
        \denoise/sum3_b [0]) );
  QDFFRBN \denoise/sum3_reg[0]  ( .D(n1384), .CK(clk), .RB(n3712), .Q(
        \denoise/sum3 [0]) );
  QDFFRBN \denoise/sum6_reg[0]  ( .D(n1378), .CK(clk), .RB(n3712), .Q(
        \denoise/sum6 [0]) );
  QDFFRBN \denoise/sum6_b_reg[1]  ( .D(n1373), .CK(clk), .RB(n3713), .Q(
        \denoise/sum6_b [1]) );
  QDFFRBN \denoise/sum6_reg[1]  ( .D(n1370), .CK(clk), .RB(n3629), .Q(
        \denoise/sum6 [1]) );
  QDFFRBN \denoise/sum3_b_reg[1]  ( .D(n1372), .CK(clk), .RB(n3620), .Q(
        \denoise/sum3_b [1]) );
  QDFFRBN \denoise/sum3_reg[1]  ( .D(n1371), .CK(clk), .RB(n3612), .Q(
        \denoise/sum3 [1]) );
  QDFFRBN \denoise/sum6_b_reg[2]  ( .D(n1365), .CK(clk), .RB(n3612), .Q(
        \denoise/sum6_b [2]) );
  QDFFRBN \denoise/sum6_reg[2]  ( .D(n1362), .CK(clk), .RB(n3612), .Q(
        \denoise/sum6 [2]) );
  QDFFRBN \denoise/sum3_b_reg[2]  ( .D(n1364), .CK(clk), .RB(n3612), .Q(
        \denoise/sum3_b [2]) );
  QDFFRBN \denoise/sum3_reg[2]  ( .D(n1363), .CK(clk), .RB(n3612), .Q(
        \denoise/sum3 [2]) );
  QDFFRBN \denoise/sum6_b_reg[3]  ( .D(n1357), .CK(clk), .RB(n3613), .Q(
        \denoise/sum6_b [3]) );
  QDFFRBN \denoise/sum6_reg[3]  ( .D(n1354), .CK(clk), .RB(n3613), .Q(
        \denoise/sum6 [3]) );
  QDFFRBN \denoise/sum3_b_reg[3]  ( .D(n1356), .CK(clk), .RB(n3613), .Q(
        \denoise/sum3_b [3]) );
  QDFFRBN \denoise/sum3_reg[3]  ( .D(n1355), .CK(clk), .RB(n3613), .Q(
        \denoise/sum3 [3]) );
  QDFFRBN \denoise/sum6_b_reg[4]  ( .D(n1349), .CK(clk), .RB(n3613), .Q(
        \denoise/sum6_b [4]) );
  QDFFRBN \denoise/sum6_reg[4]  ( .D(n1346), .CK(clk), .RB(n3613), .Q(
        \denoise/sum6 [4]) );
  QDFFRBN \denoise/sum3_b_reg[4]  ( .D(n1348), .CK(clk), .RB(n3614), .Q(
        \denoise/sum3_b [4]) );
  QDFFRBN \denoise/sum3_reg[4]  ( .D(n1347), .CK(clk), .RB(n3614), .Q(
        \denoise/sum3 [4]) );
  QDFFRBN \denoise/sum6_b_reg[5]  ( .D(n1341), .CK(clk), .RB(n3614), .Q(
        \denoise/sum6_b [5]) );
  QDFFRBN \denoise/sum6_reg[5]  ( .D(n1338), .CK(clk), .RB(n3614), .Q(
        \denoise/sum6 [5]) );
  QDFFRBN \denoise/sum3_b_reg[5]  ( .D(n1340), .CK(clk), .RB(n3614), .Q(
        \denoise/sum3_b [5]) );
  QDFFRBN \denoise/sum3_reg[5]  ( .D(n1339), .CK(clk), .RB(n3614), .Q(
        \denoise/sum3 [5]) );
  QDFFRBN \denoise/sum6_b_reg[6]  ( .D(n1333), .CK(clk), .RB(n3615), .Q(
        \denoise/sum6_b [6]) );
  QDFFRBN \denoise/sum6_reg[6]  ( .D(n1330), .CK(clk), .RB(n3615), .Q(
        \denoise/sum6 [6]) );
  QDFFRBN \denoise/sum3_b_reg[6]  ( .D(n1332), .CK(clk), .RB(n3615), .Q(
        \denoise/sum3_b [6]) );
  QDFFRBN \denoise/sum3_reg[6]  ( .D(n1331), .CK(clk), .RB(n3615), .Q(
        \denoise/sum3 [6]) );
  QDFFRBN \denoise/sum6_b_reg[7]  ( .D(n1325), .CK(clk), .RB(n3615), .Q(
        \denoise/sum6_b [7]) );
  QDFFRBN \denoise/sum6_reg[7]  ( .D(n1322), .CK(clk), .RB(n3615), .Q(
        \denoise/sum6 [7]) );
  QDFFRBN \denoise/sum3_b_reg[7]  ( .D(n1324), .CK(clk), .RB(n3616), .Q(
        \denoise/sum3_b [7]) );
  QDFFRBN \denoise/sum3_reg[7]  ( .D(n1323), .CK(clk), .RB(n3616), .Q(
        \denoise/sum3 [7]) );
  QDFFRBN \denoise/sum6_b_reg[8]  ( .D(n1317), .CK(clk), .RB(n3616), .Q(
        \denoise/sum6_b [8]) );
  QDFFRBN \denoise/sum6_reg[8]  ( .D(n1314), .CK(clk), .RB(n3616), .Q(
        \denoise/sum6 [8]) );
  QDFFRBN \denoise/sum3_b_reg[8]  ( .D(n1316), .CK(clk), .RB(n3616), .Q(
        \denoise/sum3_b [8]) );
  QDFFRBN \denoise/sum3_reg[8]  ( .D(n1315), .CK(clk), .RB(n3616), .Q(
        \denoise/sum3 [8]) );
  QDFFRBN \denoise/sum6_b_reg[9]  ( .D(n1309), .CK(clk), .RB(n3617), .Q(
        \denoise/sum6_b [9]) );
  QDFFRBN \denoise/sum6_reg[9]  ( .D(n1306), .CK(clk), .RB(n3617), .Q(
        \denoise/sum6 [9]) );
  QDFFRBN \denoise/sum3_b_reg[9]  ( .D(n1308), .CK(clk), .RB(n3617), .Q(
        \denoise/sum3_b [9]) );
  QDFFRBN \denoise/sum3_reg[9]  ( .D(n1307), .CK(clk), .RB(n3617), .Q(
        \denoise/sum3 [9]) );
  QDFFRBN \denoise/last_pic_2_reg  ( .D(\denoise/n_last_pic_2 ), .CK(clk), 
        .RB(n3617), .Q(\denoise/n_last_pic_out_reg ) );
  QDFFRBN \denoise/last_pic_out_reg_reg  ( .D(\denoise/n_last_pic_out_reg ), 
        .CK(clk), .RB(n3617), .Q(last_pic_out_den) );
  QDFFRBN \mean/last_state_r_reg[1]  ( .D(\mean/last_state_w [1]), .CK(clk), 
        .RB(n3618), .Q(\mean/last_state_r [1]) );
  QDFFRBN \mean/last_state_r_reg[0]  ( .D(\mean/last_state_w [0]), .CK(clk), 
        .RB(n3618), .Q(\mean/last_state_r [0]) );
  QDFFRBN \mean/value_r_reg[1]  ( .D(pixel_in_mean[1]), .CK(clk), .RB(n3618), 
        .Q(\mean/value_r [1]) );
  QDFFRBN \mean/value_r_reg[2]  ( .D(pixel_in_mean[2]), .CK(clk), .RB(n3618), 
        .Q(\mean/value_r [2]) );
  QDFFRBN \mean/value_r_reg[3]  ( .D(pixel_in_mean[3]), .CK(clk), .RB(n3618), 
        .Q(\mean/value_r [3]) );
  QDFFRBN \mean/value_r_reg[4]  ( .D(pixel_in_mean[4]), .CK(clk), .RB(n3619), 
        .Q(\mean/value_r [4]) );
  QDFFRBN \mean/value_r_reg[5]  ( .D(pixel_in_mean[5]), .CK(clk), .RB(n3619), 
        .Q(\mean/value_r [5]) );
  QDFFRBN \mean/value_r_reg[6]  ( .D(pixel_in_mean[6]), .CK(clk), .RB(n3619), 
        .Q(\mean/value_r [6]) );
  QDFFRBN \mean/value_r_reg[7]  ( .D(pixel_in_mean[7]), .CK(clk), .RB(n3619), 
        .Q(\mean/value_r [7]) );
  QDFFRBN \mean/valid_r_reg  ( .D(valid_in_mean), .CK(clk), .RB(n3619), .Q(
        \mean/valid_r ) );
  QDFFRBN \mean/valid_tmp_reg  ( .D(\mean/valid_r ), .CK(clk), .RB(n3619), .Q(
        valid_out_mean) );
  QDFFRBN \mean/last_r_reg  ( .D(last_pic_in_mean), .CK(clk), .RB(n3620), .Q(
        \mean/last_r ) );
  QDFFRBN \mean/last_tmp_reg  ( .D(\mean/last_r ), .CK(clk), .RB(n3620), .Q(
        last_pic_out_mean) );
  QDFFRBN \mean/color_r_reg[0]  ( .D(color_in_mean[0]), .CK(clk), .RB(n3620), 
        .Q(\mean/color_r [0]) );
  QDFFRBN \mean/color_tmp_reg[0]  ( .D(\mean/color_r [0]), .CK(clk), .RB(n3620), .Q(color_out_mean[0]) );
  QDFFRBN \mean/color_r_reg[1]  ( .D(color_in_mean[1]), .CK(clk), .RB(n3620), 
        .Q(\mean/color_r [1]) );
  QDFFRBN \mean/color_tmp_reg[1]  ( .D(\mean/color_r [1]), .CK(clk), .RB(n3621), .Q(color_out_mean[1]) );
  QDFFRBN \mean/sum_r_reg[0]  ( .D(n1305), .CK(clk), .RB(n3621), .Q(
        \mean/sum_r [0]) );
  QDFFRBN \mean/sum_r_reg[1]  ( .D(n1304), .CK(clk), .RB(n3621), .Q(
        \mean/sum_r [1]) );
  QDFFRBN \mean/sum_r_reg[2]  ( .D(n1303), .CK(clk), .RB(n3621), .Q(
        \mean/sum_r [2]) );
  QDFFRBN \mean/sum_r_reg[3]  ( .D(n1302), .CK(clk), .RB(n3621), .Q(
        \mean/sum_r [3]) );
  QDFFRBN \mean/sum_r_reg[4]  ( .D(n1301), .CK(clk), .RB(n3621), .Q(
        \mean/sum_r [4]) );
  QDFFRBN \mean/sum_r_reg[5]  ( .D(n1300), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [5]) );
  QDFFRBN \mean/sum_r_reg[6]  ( .D(n1299), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [6]) );
  QDFFRBN \mean/sum_r_reg[7]  ( .D(n1298), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [7]) );
  QDFFRBN \mean/sum_r_reg[8]  ( .D(n1297), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [8]) );
  QDFFRBN \mean/sum_r_reg[9]  ( .D(n1296), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [9]) );
  QDFFRBN \mean/sum_r_reg[10]  ( .D(n1295), .CK(clk), .RB(n3622), .Q(
        \mean/sum_r [10]) );
  QDFFRBN \mean/sum_r_reg[11]  ( .D(n1294), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [11]) );
  QDFFRBN \mean/sum_r_reg[12]  ( .D(n1293), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [12]) );
  QDFFRBN \mean/sum_r_reg[13]  ( .D(n1292), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [13]) );
  QDFFRBN \mean/sum_r_reg[14]  ( .D(n1291), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [14]) );
  QDFFRBN \mean/sum_r_reg[15]  ( .D(n1290), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [15]) );
  QDFFRBN \mean/sum_r_reg[16]  ( .D(n1289), .CK(clk), .RB(n3623), .Q(
        \mean/sum_r [16]) );
  QDFFRBN \mean/sum_r_reg[17]  ( .D(n1288), .CK(clk), .RB(n3624), .Q(
        \mean/sum_r [17]) );
  QDFFRBN \mean/sum_r_reg[18]  ( .D(n1287), .CK(clk), .RB(n3624), .Q(
        \mean/sum_r [18]) );
  QDFFRBN \mean/sum_r_reg[19]  ( .D(n1286), .CK(clk), .RB(n3624), .Q(
        \mean/sum_r [19]) );
  QDFFRBN \mean/sum_r_reg[20]  ( .D(n1285), .CK(clk), .RB(n3624), .Q(
        \mean/r_mean_tmp [0]) );
  QDFFRBN \mean/r_mean_o_reg[0]  ( .D(\mean/r_mean_tmp [0]), .CK(clk), .RB(
        n3624), .Q(r_mean_out_mean[0]) );
  QDFFRBN \mean/sum_r_reg[21]  ( .D(n1284), .CK(clk), .RB(n3624), .Q(
        \mean/r_mean_tmp [1]) );
  QDFFRBN \mean/r_mean_o_reg[1]  ( .D(\mean/r_mean_tmp [1]), .CK(clk), .RB(
        n3625), .Q(r_mean_out_mean[1]) );
  QDFFRBN \mean/sum_r_reg[22]  ( .D(n1283), .CK(clk), .RB(n3625), .Q(
        \mean/r_mean_tmp [2]) );
  QDFFRBN \mean/r_mean_o_reg[2]  ( .D(\mean/r_mean_tmp [2]), .CK(clk), .RB(
        n3625), .Q(r_mean_out_mean[2]) );
  QDFFRBN \mean/sum_r_reg[23]  ( .D(n1282), .CK(clk), .RB(n3625), .Q(
        \mean/r_mean_tmp [3]) );
  QDFFRBN \mean/r_mean_o_reg[3]  ( .D(\mean/r_mean_tmp [3]), .CK(clk), .RB(
        n3625), .Q(r_mean_out_mean[3]) );
  QDFFRBN \mean/sum_r_reg[24]  ( .D(n1281), .CK(clk), .RB(n3625), .Q(
        \mean/r_mean_tmp [4]) );
  QDFFRBN \mean/r_mean_o_reg[4]  ( .D(\mean/r_mean_tmp [4]), .CK(clk), .RB(
        n3626), .Q(r_mean_out_mean[4]) );
  QDFFRBN \mean/sum_r_reg[25]  ( .D(n1280), .CK(clk), .RB(n3626), .Q(
        \mean/r_mean_tmp [5]) );
  QDFFRBN \mean/r_mean_o_reg[5]  ( .D(\mean/r_mean_tmp [5]), .CK(clk), .RB(
        n3626), .Q(r_mean_out_mean[5]) );
  QDFFRBN \mean/sum_r_reg[26]  ( .D(n1279), .CK(clk), .RB(n3626), .Q(
        \mean/r_mean_tmp [6]) );
  QDFFRBN \mean/r_mean_o_reg[6]  ( .D(\mean/r_mean_tmp [6]), .CK(clk), .RB(
        n3626), .Q(r_mean_out_mean[6]) );
  QDFFRBN \mean/sum_r_reg[27]  ( .D(n1278), .CK(clk), .RB(n3626), .Q(
        \mean/r_mean_tmp [7]) );
  QDFFRBN \mean/r_mean_o_reg[7]  ( .D(\mean/r_mean_tmp [7]), .CK(clk), .RB(
        n3627), .Q(r_mean_out_mean[7]) );
  QDFFRBN \mean/sum_g_reg[0]  ( .D(n1277), .CK(clk), .RB(n3627), .Q(
        \mean/sum_g [0]) );
  QDFFRBN \mean/sum_g_reg[1]  ( .D(n1276), .CK(clk), .RB(n3627), .Q(
        \mean/sum_g [1]) );
  QDFFRBN \mean/sum_g_reg[2]  ( .D(n1275), .CK(clk), .RB(n3627), .Q(
        \mean/sum_g [2]) );
  QDFFRBN \mean/sum_g_reg[3]  ( .D(n1274), .CK(clk), .RB(n3627), .Q(
        \mean/sum_g [3]) );
  QDFFRBN \mean/sum_g_reg[4]  ( .D(n1273), .CK(clk), .RB(n3627), .Q(
        \mean/sum_g [4]) );
  QDFFRBN \mean/sum_g_reg[5]  ( .D(n1272), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [5]) );
  QDFFRBN \mean/sum_g_reg[6]  ( .D(n1271), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [6]) );
  QDFFRBN \mean/sum_g_reg[7]  ( .D(n1270), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [7]) );
  QDFFRBN \mean/sum_g_reg[8]  ( .D(n1269), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [8]) );
  QDFFRBN \mean/sum_g_reg[9]  ( .D(n1268), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [9]) );
  QDFFRBN \mean/sum_g_reg[10]  ( .D(n1267), .CK(clk), .RB(n3628), .Q(
        \mean/sum_g [10]) );
  QDFFRBN \mean/sum_g_reg[11]  ( .D(n1266), .CK(clk), .RB(n3629), .Q(
        \mean/sum_g [11]) );
  QDFFRBN \mean/sum_g_reg[12]  ( .D(n1265), .CK(clk), .RB(n3629), .Q(
        \mean/sum_g [12]) );
  QDFFRBN \mean/sum_g_reg[13]  ( .D(n1264), .CK(clk), .RB(n3629), .Q(
        \mean/sum_g [13]) );
  QDFFRBN \mean/sum_g_reg[14]  ( .D(n1263), .CK(clk), .RB(n3603), .Q(
        \mean/sum_g [14]) );
  QDFFRBN \mean/sum_g_reg[15]  ( .D(n1262), .CK(clk), .RB(n3596), .Q(
        \mean/sum_g [15]) );
  QDFFRBN \mean/sum_g_reg[16]  ( .D(n1261), .CK(clk), .RB(n3596), .Q(
        \mean/sum_g [16]) );
  QDFFRBN \mean/sum_g_reg[17]  ( .D(n1260), .CK(clk), .RB(n3597), .Q(
        \mean/sum_g [17]) );
  QDFFRBN \mean/sum_g_reg[18]  ( .D(n1259), .CK(clk), .RB(n3597), .Q(
        \mean/sum_g [18]) );
  QDFFRBN \mean/sum_g_reg[19]  ( .D(n1258), .CK(clk), .RB(n3597), .Q(
        \mean/sum_g [19]) );
  QDFFRBN \mean/sum_g_reg[20]  ( .D(n1257), .CK(clk), .RB(n3597), .Q(
        \mean/g_mean_tmp [0]) );
  QDFFRBN \mean/sum_g_reg[21]  ( .D(n1256), .CK(clk), .RB(n3597), .Q(
        \mean/g_mean_tmp [1]) );
  QDFFRBN \mean/sum_g_reg[22]  ( .D(n1255), .CK(clk), .RB(n3597), .Q(
        \mean/g_mean_tmp [2]) );
  QDFFRBN \mean/sum_g_reg[23]  ( .D(n1254), .CK(clk), .RB(n3748), .Q(
        \mean/g_mean_tmp [3]) );
  QDFFRBN \mean/sum_g_reg[24]  ( .D(n1253), .CK(clk), .RB(n3748), .Q(
        \mean/g_mean_tmp [4]) );
  QDFFRBN \mean/sum_g_reg[25]  ( .D(n1252), .CK(clk), .RB(n3748), .Q(
        \mean/g_mean_tmp [5]) );
  QDFFRBN \mean/sum_g_reg[26]  ( .D(n1251), .CK(clk), .RB(n3750), .Q(
        \mean/g_mean_tmp [6]) );
  QDFFRBN \mean/sum_g_reg[27]  ( .D(n1250), .CK(clk), .RB(n3750), .Q(
        \mean/g_mean_tmp [7]) );
  QDFFRBN \mean/sum_b_reg[26]  ( .D(n1249), .CK(clk), .RB(n3748), .Q(
        \mean/b_mean_tmp [6]) );
  QDFFRBN \mean/sum_b_reg[0]  ( .D(n1248), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [0]) );
  QDFFRBN \mean/sum_b_reg[1]  ( .D(n1247), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [1]) );
  QDFFRBN \mean/sum_b_reg[2]  ( .D(n1246), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [2]) );
  QDFFRBN \mean/sum_b_reg[3]  ( .D(n1245), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [3]) );
  QDFFRBN \mean/sum_b_reg[4]  ( .D(n1244), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [4]) );
  QDFFRBN \mean/sum_b_reg[5]  ( .D(n1243), .CK(clk), .RB(n3598), .Q(
        \mean/sum_b [5]) );
  QDFFRBN \mean/sum_b_reg[6]  ( .D(n1242), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [6]) );
  QDFFRBN \mean/sum_b_reg[7]  ( .D(n1241), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [7]) );
  QDFFRBN \mean/sum_b_reg[8]  ( .D(n1240), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [8]) );
  QDFFRBN \mean/sum_b_reg[9]  ( .D(n1239), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [9]) );
  QDFFRBN \mean/sum_b_reg[10]  ( .D(n1238), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [10]) );
  QDFFRBN \mean/sum_b_reg[11]  ( .D(n1237), .CK(clk), .RB(n3599), .Q(
        \mean/sum_b [11]) );
  QDFFRBN \mean/sum_b_reg[12]  ( .D(n1236), .CK(clk), .RB(n3747), .Q(
        \mean/sum_b [12]) );
  QDFFRBN \mean/sum_b_reg[13]  ( .D(n1235), .CK(clk), .RB(n3747), .Q(
        \mean/sum_b [13]) );
  QDFFRBN \mean/sum_b_reg[14]  ( .D(n1234), .CK(clk), .RB(n3749), .Q(
        \mean/sum_b [14]) );
  QDFFRBN \mean/sum_b_reg[15]  ( .D(n1233), .CK(clk), .RB(n3749), .Q(
        \mean/sum_b [15]) );
  QDFFRBN \mean/sum_b_reg[16]  ( .D(n1232), .CK(clk), .RB(n3749), .Q(
        \mean/sum_b [16]) );
  QDFFRBN \mean/sum_b_reg[17]  ( .D(n1231), .CK(clk), .RB(n3747), .Q(
        \mean/sum_b [17]) );
  QDFFRBN \mean/sum_b_reg[18]  ( .D(n1230), .CK(clk), .RB(n3600), .Q(
        \mean/sum_b [18]) );
  QDFFRBN \mean/sum_b_reg[19]  ( .D(n1229), .CK(clk), .RB(n3600), .Q(
        \mean/sum_b [19]) );
  QDFFRBN \mean/sum_b_reg[20]  ( .D(n1228), .CK(clk), .RB(n3600), .Q(
        \mean/b_mean_tmp [0]) );
  QDFFRBN \mean/sum_b_reg[21]  ( .D(n1227), .CK(clk), .RB(n3600), .Q(
        \mean/b_mean_tmp [1]) );
  QDFFRBN \mean/sum_b_reg[22]  ( .D(n1226), .CK(clk), .RB(n3600), .Q(
        \mean/b_mean_tmp [2]) );
  QDFFRBN \mean/sum_b_reg[23]  ( .D(n1225), .CK(clk), .RB(n3600), .Q(
        \mean/b_mean_tmp [3]) );
  QDFFRBN \mean/sum_b_reg[24]  ( .D(n1224), .CK(clk), .RB(n3601), .Q(
        \mean/b_mean_tmp [4]) );
  QDFFRBN \mean/sum_b_reg[25]  ( .D(n1223), .CK(clk), .RB(n3601), .Q(
        \mean/b_mean_tmp [5]) );
  QDFFRBN \mean/sum_b_reg[27]  ( .D(n1222), .CK(clk), .RB(n3601), .Q(
        \mean/b_mean_tmp [7]) );
  QDFFRBN \mean/finish_tmp_reg  ( .D(n1720), .CK(clk), .RB(n3601), .Q(
        \mean/finish_tmp ) );
  QDFFRBN \mean/finish_o_reg  ( .D(\mean/finish_tmp ), .CK(clk), .RB(n3601), 
        .Q(finish_out_mean) );
  QDFFRBN \mean/b_mean_o_reg[0]  ( .D(\mean/b_mean_tmp [0]), .CK(clk), .RB(
        n3601), .Q(b_mean_out_mean[0]) );
  QDFFRBN \mean/b_mean_o_reg[1]  ( .D(\mean/b_mean_tmp [1]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[1]) );
  QDFFRBN \mean/b_mean_o_reg[2]  ( .D(\mean/b_mean_tmp [2]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[2]) );
  QDFFRBN \mean/b_mean_o_reg[3]  ( .D(\mean/b_mean_tmp [3]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[3]) );
  QDFFRBN \mean/b_mean_o_reg[4]  ( .D(\mean/b_mean_tmp [4]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[4]) );
  QDFFRBN \mean/b_mean_o_reg[5]  ( .D(\mean/b_mean_tmp [5]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[5]) );
  QDFFRBN \mean/b_mean_o_reg[6]  ( .D(\mean/b_mean_tmp [6]), .CK(clk), .RB(
        n3602), .Q(b_mean_out_mean[6]) );
  QDFFRBN \mean/b_mean_o_reg[7]  ( .D(\mean/b_mean_tmp [7]), .CK(clk), .RB(
        n3603), .Q(b_mean_out_mean[7]) );
  QDFFRBN \mean/g_mean_o_reg[0]  ( .D(\mean/g_mean_tmp [0]), .CK(clk), .RB(
        n3603), .Q(g_mean_out_mean[0]) );
  QDFFRBN \mean/g_mean_o_reg[1]  ( .D(\mean/g_mean_tmp [1]), .CK(clk), .RB(
        n3603), .Q(g_mean_out_mean[1]) );
  QDFFRBN \mean/g_mean_o_reg[2]  ( .D(\mean/g_mean_tmp [2]), .CK(clk), .RB(
        n3603), .Q(g_mean_out_mean[2]) );
  QDFFRBN \mean/g_mean_o_reg[3]  ( .D(\mean/g_mean_tmp [3]), .CK(clk), .RB(
        n3603), .Q(g_mean_out_mean[3]) );
  QDFFRBN \mean/g_mean_o_reg[4]  ( .D(\mean/g_mean_tmp [4]), .CK(clk), .RB(
        n3604), .Q(g_mean_out_mean[4]) );
  QDFFRBN \mean/g_mean_o_reg[5]  ( .D(\mean/g_mean_tmp [5]), .CK(clk), .RB(
        n3604), .Q(g_mean_out_mean[5]) );
  QDFFRBN \mean/g_mean_o_reg[6]  ( .D(\mean/g_mean_tmp [6]), .CK(clk), .RB(
        n3604), .Q(g_mean_out_mean[6]) );
  QDFFRBN \mean/g_mean_o_reg[7]  ( .D(\mean/g_mean_tmp [7]), .CK(clk), .RB(
        n3604), .Q(g_mean_out_mean[7]) );
  QDFFRBN \gain/valid_r_reg  ( .D(valid_in_gain), .CK(clk), .RB(n3604), .Q(
        \gain/valid_r ) );
  QDFFRBN \gain/r_mean_r_reg[0]  ( .D(n1203), .CK(clk), .RB(n3604), .Q(
        \gain/r_mean_r [0]) );
  QDFFRBN \gain/r_mean_r_reg[14]  ( .D(n1217), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [14]) );
  QDFFRBN \gain/r_mean_r_reg[13]  ( .D(n1216), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [13]) );
  QDFFRBN \gain/r_mean_r_reg[12]  ( .D(n1215), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [12]) );
  QDFFRBN \gain/r_mean_r_reg[11]  ( .D(n1214), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [11]) );
  QDFFRBN \gain/r_mean_r_reg[10]  ( .D(n1213), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [10]) );
  QDFFRBN \gain/r_mean_r_reg[9]  ( .D(n1212), .CK(clk), .RB(n3605), .Q(
        \gain/r_mean_r [9]) );
  QDFFRBN \gain/r_mean_r_reg[8]  ( .D(n1211), .CK(clk), .RB(n3606), .Q(
        \gain/r_mean_r [8]) );
  QDFFRBN \gain/r_mean_r_reg[7]  ( .D(n1210), .CK(clk), .RB(n3606), .Q(
        \gain/r_mean_r [7]) );
  QDFFRBN \gain/counter_R_r_reg[3]  ( .D(n1202), .CK(clk), .RB(n3606), .Q(
        \gain/counter_R_r [3]) );
  QDFFRBN \gain/state_R_r_reg[0]  ( .D(n1728), .CK(clk), .RB(n3606), .Q(
        \gain/state_R_r [0]) );
  QDFFRBN \gain/state_R_r_reg[1]  ( .D(n1727), .CK(clk), .RB(n3606), .Q(
        \gain/state_R_r [1]) );
  QDFFRBN \gain/finish_R_r_reg  ( .D(n1726), .CK(clk), .RB(n3607), .Q(
        \gain/finish_R_r ) );
  QDFFRBN \gain/r_mean_r_reg[15]  ( .D(n1218), .CK(clk), .RB(n3607), .Q(
        \gain/r_mean_r [15]) );
  QDFFRBN \gain/r_mean_r_reg[6]  ( .D(n1209), .CK(clk), .RB(n3607), .Q(
        \gain/r_mean_r [6]) );
  QDFFRBN \gain/r_mean_r_reg[5]  ( .D(n1208), .CK(clk), .RB(n3607), .Q(
        \gain/r_mean_r [5]) );
  QDFFRBN \gain/r_mean_r_reg[4]  ( .D(n1207), .CK(clk), .RB(n3607), .Q(
        \gain/r_mean_r [4]) );
  QDFFRBN \gain/r_mean_r_reg[3]  ( .D(n1206), .CK(clk), .RB(n3607), .Q(
        \gain/r_mean_r [3]) );
  QDFFRBN \gain/r_mean_r_reg[2]  ( .D(n1205), .CK(clk), .RB(n3608), .Q(
        \gain/r_mean_r [2]) );
  QDFFRBN \gain/r_mean_r_reg[1]  ( .D(n1204), .CK(clk), .RB(n3608), .Q(
        \gain/r_mean_r [1]) );
  QDFFRBN \gain/R_r_reg[7]  ( .D(n1149), .CK(clk), .RB(n3608), .Q(
        \gain/R_r [7]) );
  QDFFRBN \gain/R_r_reg[6]  ( .D(n1148), .CK(clk), .RB(n3608), .Q(
        \gain/R_r [6]) );
  QDFFRBN \gain/R_r_reg[5]  ( .D(n1147), .CK(clk), .RB(n3608), .Q(
        \gain/R_r [5]) );
  QDFFRBN \gain/R_r_reg[4]  ( .D(n1146), .CK(clk), .RB(n3608), .Q(
        \gain/R_r [4]) );
  QDFFRBN \gain/R_r_reg[3]  ( .D(n1145), .CK(clk), .RB(n3609), .Q(
        \gain/R_r [3]) );
  QDFFRBN \gain/R_r_reg[2]  ( .D(n1144), .CK(clk), .RB(n3609), .Q(
        \gain/R_r [2]) );
  QDFFRBN \gain/R_r_reg[1]  ( .D(n1143), .CK(clk), .RB(n3609), .Q(
        \gain/R_r [1]) );
  QDFFRBN \gain/R_r_reg[0]  ( .D(n1142), .CK(clk), .RB(n3609), .Q(
        \gain/R_r [0]) );
  QDFFRBN \gain/counter_R_r_reg[0]  ( .D(n1201), .CK(clk), .RB(n3609), .Q(
        \gain/counter_R_r [0]) );
  QDFFRBN \gain/counter_R_r_reg[1]  ( .D(n1200), .CK(clk), .RB(n3609), .Q(
        \gain/counter_R_r [1]) );
  QDFFRBN \gain/counter_R_r_reg[2]  ( .D(n1199), .CK(clk), .RB(n3610), .Q(
        \gain/counter_R_r [2]) );
  QDFFRBN \gain/g_mean_r_reg[0]  ( .D(n1179), .CK(clk), .RB(n3610), .Q(
        \gain/g_mean_r [0]) );
  QDFFRBN \gain/g_mean_r_reg[14]  ( .D(n1193), .CK(clk), .RB(n3610), .Q(
        \gain/g_mean_r [14]) );
  QDFFRBN \gain/g_mean_r_reg[13]  ( .D(n1192), .CK(clk), .RB(n3610), .Q(
        \gain/g_mean_r [13]) );
  QDFFRBN \gain/g_mean_r_reg[12]  ( .D(n1191), .CK(clk), .RB(n3610), .Q(
        \gain/g_mean_r [12]) );
  QDFFRBN \gain/g_mean_r_reg[11]  ( .D(n1190), .CK(clk), .RB(n3610), .Q(
        \gain/g_mean_r [11]) );
  QDFFRBN \gain/g_mean_r_reg[10]  ( .D(n1189), .CK(clk), .RB(n3611), .Q(
        \gain/g_mean_r [10]) );
  QDFFRBN \gain/g_mean_r_reg[9]  ( .D(n1188), .CK(clk), .RB(n3611), .Q(
        \gain/g_mean_r [9]) );
  QDFFRBN \gain/g_mean_r_reg[8]  ( .D(n1187), .CK(clk), .RB(n3611), .Q(
        \gain/g_mean_r [8]) );
  QDFFRBN \gain/g_mean_r_reg[7]  ( .D(n1186), .CK(clk), .RB(n3611), .Q(
        \gain/g_mean_r [7]) );
  QDFFRBN \gain/counter_G_r_reg[3]  ( .D(n1178), .CK(clk), .RB(n3611), .Q(
        \gain/counter_G_r [3]) );
  QDFFRBN \gain/state_G_r_reg[0]  ( .D(n1724), .CK(clk), .RB(n3612), .Q(
        \gain/state_G_r [0]) );
  QDFFRBN \gain/state_G_r_reg[1]  ( .D(n1723), .CK(clk), .RB(n3655), .Q(
        \gain/state_G_r [1]) );
  QDFFRBN \gain/g_mean_r_reg[15]  ( .D(n1194), .CK(clk), .RB(n3647), .Q(
        \gain/g_mean_r [15]) );
  QDFFRBN \gain/g_mean_r_reg[6]  ( .D(n1185), .CK(clk), .RB(n3647), .Q(
        \gain/g_mean_r [6]) );
  QDFFRBN \gain/g_mean_r_reg[5]  ( .D(n1184), .CK(clk), .RB(n3647), .Q(
        \gain/g_mean_r [5]) );
  QDFFRBN \gain/g_mean_r_reg[4]  ( .D(n1183), .CK(clk), .RB(n3647), .Q(
        \gain/g_mean_r [4]) );
  QDFFRBN \gain/g_mean_r_reg[3]  ( .D(n1182), .CK(clk), .RB(n3647), .Q(
        \gain/g_mean_r [3]) );
  QDFFRBN \gain/g_mean_r_reg[2]  ( .D(n1181), .CK(clk), .RB(n3648), .Q(
        \gain/g_mean_r [2]) );
  QDFFRBN \gain/g_mean_r_reg[1]  ( .D(n1180), .CK(clk), .RB(n3664), .Q(
        \gain/g_mean_r [1]) );
  QDFFRBN \gain/G_r_reg[7]  ( .D(n1165), .CK(clk), .RB(n3648), .Q(
        \gain/G_r [7]) );
  QDFFRBN \gain/G_r_reg[6]  ( .D(n1164), .CK(clk), .RB(n3648), .Q(
        \gain/G_r [6]) );
  QDFFRBN \gain/G_r_reg[5]  ( .D(n1163), .CK(clk), .RB(n3648), .Q(
        \gain/G_r [5]) );
  QDFFRBN \gain/G_r_reg[4]  ( .D(n1162), .CK(clk), .RB(n3648), .Q(
        \gain/G_r [4]) );
  QDFFRBN \gain/G_r_reg[3]  ( .D(n1161), .CK(clk), .RB(n3648), .Q(
        \gain/G_r [3]) );
  QDFFRBN \gain/G_r_reg[2]  ( .D(n1160), .CK(clk), .RB(n3649), .Q(
        \gain/G_r [2]) );
  QDFFRBN \gain/G_r_reg[1]  ( .D(n1159), .CK(clk), .RB(n3649), .Q(
        \gain/G_r [1]) );
  QDFFRBN \gain/G_r_reg[0]  ( .D(n1158), .CK(clk), .RB(n3649), .Q(
        \gain/G_r [0]) );
  QDFFRBN \gain/counter_G_r_reg[0]  ( .D(n1177), .CK(clk), .RB(n3649), .Q(
        \gain/counter_G_r [0]) );
  QDFFRBN \gain/counter_G_r_reg[1]  ( .D(n1176), .CK(clk), .RB(n3649), .Q(
        \gain/counter_G_r [1]) );
  QDFFRBN \gain/counter_G_r_reg[2]  ( .D(n1175), .CK(clk), .RB(n3649), .Q(
        \gain/counter_G_r [2]) );
  QDFFRBN \gain/K_mean_r_reg[8]  ( .D(\gain/K_mean_w [0]), .CK(clk), .RB(n3650), .Q(\gain/K_mean_r [8]) );
  QDFFRBN \gain/G_r_reg[8]  ( .D(n1166), .CK(clk), .RB(n3650), .Q(
        \gain/G_r [8]) );
  QDFFRBN \gain/R_r_reg[8]  ( .D(n1150), .CK(clk), .RB(n3650), .Q(
        \gain/R_r [8]) );
  QDFFRBN \gain/K_mean_r_reg[9]  ( .D(\gain/K_mean_w [1]), .CK(clk), .RB(n3650), .Q(\gain/K_mean_r [9]) );
  QDFFRBN \gain/G_r_reg[9]  ( .D(n1167), .CK(clk), .RB(n3650), .Q(
        \gain/G_r [9]) );
  QDFFRBN \gain/R_r_reg[9]  ( .D(n1151), .CK(clk), .RB(n3650), .Q(
        \gain/R_r [9]) );
  QDFFRBN \gain/K_mean_r_reg[10]  ( .D(\gain/K_mean_w [2]), .CK(clk), .RB(
        n3651), .Q(\gain/K_mean_r [10]) );
  QDFFRBN \gain/G_r_reg[10]  ( .D(n1168), .CK(clk), .RB(n3651), .Q(
        \gain/G_r [10]) );
  QDFFRBN \gain/R_r_reg[10]  ( .D(n1152), .CK(clk), .RB(n3651), .Q(
        \gain/R_r [10]) );
  QDFFRBN \gain/K_mean_r_reg[11]  ( .D(\gain/K_mean_w [3]), .CK(clk), .RB(
        n3651), .Q(\gain/K_mean_r [11]) );
  QDFFRBN \gain/G_r_reg[11]  ( .D(n1169), .CK(clk), .RB(n3651), .Q(
        \gain/G_r [11]) );
  QDFFRBN \gain/R_r_reg[11]  ( .D(n1153), .CK(clk), .RB(n3651), .Q(
        \gain/R_r [11]) );
  QDFFRBN \gain/K_mean_r_reg[12]  ( .D(\gain/K_mean_w [4]), .CK(clk), .RB(
        n3652), .Q(\gain/K_mean_r [12]) );
  QDFFRBN \gain/G_r_reg[12]  ( .D(n1170), .CK(clk), .RB(n3652), .Q(
        \gain/G_r [12]) );
  QDFFRBN \gain/R_r_reg[12]  ( .D(n1154), .CK(clk), .RB(n3652), .Q(
        \gain/R_r [12]) );
  QDFFRBN \gain/K_mean_r_reg[13]  ( .D(\gain/K_mean_w [5]), .CK(clk), .RB(
        n3652), .Q(\gain/K_mean_r [13]) );
  QDFFRBN \gain/G_r_reg[13]  ( .D(n1171), .CK(clk), .RB(n3652), .Q(
        \gain/G_r [13]) );
  QDFFRBN \gain/R_r_reg[13]  ( .D(n1155), .CK(clk), .RB(n3652), .Q(
        \gain/R_r [13]) );
  QDFFRBN \gain/K_mean_r_reg[14]  ( .D(\gain/K_mean_w [6]), .CK(clk), .RB(
        n3653), .Q(\gain/K_mean_r [14]) );
  QDFFRBN \gain/G_r_reg[14]  ( .D(n1172), .CK(clk), .RB(n3653), .Q(
        \gain/G_r [14]) );
  QDFFRBN \gain/R_r_reg[14]  ( .D(n1156), .CK(clk), .RB(n3653), .Q(
        \gain/R_r [14]) );
  QDFFRBN \gain/K_mean_r_reg[15]  ( .D(\gain/K_mean_w [7]), .CK(clk), .RB(
        n3653), .Q(\gain/K_mean_r [15]) );
  QDFFRBN \gain/G_r_reg[15]  ( .D(n1173), .CK(clk), .RB(n3653), .Q(
        \gain/G_r [15]) );
  QDFFRBN \gain/R_r_reg[15]  ( .D(n1157), .CK(clk), .RB(n3653), .Q(
        \gain/R_r [15]) );
  QDFFRBN \gain/finish_G_r_reg  ( .D(n1725), .CK(clk), .RB(n3654), .Q(
        \gain/finish_G_r ) );
  QDFFRBN \gain/state_B_r_reg[0]  ( .D(n1722), .CK(clk), .RB(n3654), .Q(
        \gain/state_B_r [0]) );
  QDFFRBN \gain/b_mean_r_reg[1]  ( .D(n1124), .CK(clk), .RB(n3654), .Q(
        \gain/b_mean_r [1]) );
  QDFFRBN \gain/b_mean_r_reg[12]  ( .D(n1135), .CK(clk), .RB(n3654), .Q(
        \gain/b_mean_r [12]) );
  QDFFRBN \gain/b_mean_r_reg[11]  ( .D(n1134), .CK(clk), .RB(n3654), .Q(
        \gain/b_mean_r [11]) );
  QDFFRBN \gain/b_mean_r_reg[10]  ( .D(n1133), .CK(clk), .RB(n3655), .Q(
        \gain/b_mean_r [10]) );
  QDFFRBN \gain/b_mean_r_reg[9]  ( .D(n1132), .CK(clk), .RB(n3655), .Q(
        \gain/b_mean_r [9]) );
  QDFFRBN \gain/b_mean_r_reg[8]  ( .D(n1131), .CK(clk), .RB(n3655), .Q(
        \gain/b_mean_r [8]) );
  QDFFRBN \gain/b_mean_r_reg[7]  ( .D(n1130), .CK(clk), .RB(n3655), .Q(
        \gain/b_mean_r [7]) );
  QDFFRBN \gain/state_B_r_reg[1]  ( .D(n1721), .CK(clk), .RB(n3655), .Q(
        \gain/state_B_r [1]) );
  QDFFRBN \gain/valid_gain_o_reg  ( .D(\gain/valid_gain_tmp ), .CK(clk), .RB(
        n3656), .Q(valid_out_gain) );
  QDFFRBN \gain/b_mean_r_reg[0]  ( .D(n1139), .CK(clk), .RB(n3656), .Q(
        \gain/b_mean_r [0]) );
  QDFFRBN \gain/b_mean_r_reg[6]  ( .D(n1129), .CK(clk), .RB(n3656), .Q(
        \gain/b_mean_r [6]) );
  QDFFRBN \gain/b_mean_r_reg[5]  ( .D(n1128), .CK(clk), .RB(n3656), .Q(
        \gain/b_mean_r [5]) );
  QDFFRBN \gain/b_mean_r_reg[4]  ( .D(n1127), .CK(clk), .RB(n3656), .Q(
        \gain/b_mean_r [4]) );
  QDFFRBN \gain/b_mean_r_reg[3]  ( .D(n1126), .CK(clk), .RB(n3656), .Q(
        \gain/b_mean_r [3]) );
  QDFFRBN \gain/b_mean_r_reg[2]  ( .D(n1125), .CK(clk), .RB(n3657), .Q(
        \gain/b_mean_r [2]) );
  QDFFRBN \gain/b_mean_r_reg[15]  ( .D(n1138), .CK(clk), .RB(n3657), .Q(
        \gain/b_mean_r [15]) );
  QDFFRBN \gain/b_mean_r_reg[14]  ( .D(n1137), .CK(clk), .RB(n3657), .Q(
        \gain/b_mean_r [14]) );
  QDFFRBN \gain/b_mean_r_reg[13]  ( .D(n1136), .CK(clk), .RB(n3657), .Q(
        \gain/b_mean_r [13]) );
  QDFFRBN \gain/counter_B_r_reg[3]  ( .D(n1140), .CK(clk), .RB(n3657), .Q(
        \gain/counter_B_r [3]) );
  QDFFRBN \gain/counter_B_r_reg[0]  ( .D(n1120), .CK(clk), .RB(n3657), .Q(
        \gain/counter_B_r [0]) );
  QDFFRBN \gain/counter_B_r_reg[1]  ( .D(n1119), .CK(clk), .RB(n3658), .Q(
        \gain/counter_B_r [1]) );
  QDFFRBN \gain/counter_B_r_reg[2]  ( .D(n1118), .CK(clk), .RB(n3658), .Q(
        \gain/counter_B_r [2]) );
  QDFFRBN \gain/K_B_tmp_reg[0]  ( .D(n1077), .CK(clk), .RB(n3658), .Q(
        \gain/K_B_tmp [0]) );
  QDFFRBN \gain/K_B_tmp_reg[1]  ( .D(n1076), .CK(clk), .RB(n3658), .Q(
        \gain/K_B_tmp [1]) );
  QDFFRBN \gain/K_B_tmp_reg[2]  ( .D(n1075), .CK(clk), .RB(n3658), .Q(
        \gain/K_B_tmp [2]) );
  QDFFRBN \gain/K_B_tmp_reg[3]  ( .D(n1074), .CK(clk), .RB(n3658), .Q(
        \gain/K_B_tmp [3]) );
  QDFFRBN \gain/K_B_tmp_reg[4]  ( .D(n1073), .CK(clk), .RB(n3659), .Q(
        \gain/K_B_tmp [4]) );
  QDFFRBN \gain/K_B_o_reg[4]  ( .D(\gain/K_B_tmp [4]), .CK(clk), .RB(n3659), 
        .Q(k_b_out_gain[4]) );
  QDFFRBN \gain/K_B_tmp_reg[5]  ( .D(n1072), .CK(clk), .RB(n3659), .Q(
        \gain/K_B_tmp [5]) );
  QDFFRBN \gain/K_B_o_reg[5]  ( .D(\gain/K_B_tmp [5]), .CK(clk), .RB(n3659), 
        .Q(k_b_out_gain[5]) );
  QDFFRBN \gain/K_B_tmp_reg[6]  ( .D(n1071), .CK(clk), .RB(n3659), .Q(
        \gain/K_B_tmp [6]) );
  QDFFRBN \gain/K_B_o_reg[6]  ( .D(\gain/K_B_tmp [6]), .CK(clk), .RB(n3659), 
        .Q(k_b_out_gain[6]) );
  QDFFRBN \gain/K_B_tmp_reg[7]  ( .D(n1070), .CK(clk), .RB(n3660), .Q(
        \gain/K_B_tmp [7]) );
  QDFFRBN \gain/K_B_o_reg[7]  ( .D(\gain/K_B_tmp [7]), .CK(clk), .RB(n3660), 
        .Q(k_b_out_gain[7]) );
  QDFFRBN \gain/K_B_tmp_reg[8]  ( .D(n1069), .CK(clk), .RB(n3660), .Q(
        \gain/K_B_tmp [8]) );
  QDFFRBN \gain/K_B_o_reg[8]  ( .D(\gain/K_B_tmp [8]), .CK(clk), .RB(n3660), 
        .Q(k_b_out_gain[8]) );
  QDFFRBN \gain/K_B_tmp_reg[9]  ( .D(n1068), .CK(clk), .RB(n3660), .Q(
        \gain/K_B_tmp [9]) );
  QDFFRBN \gain/K_B_o_reg[9]  ( .D(\gain/K_B_tmp [9]), .CK(clk), .RB(n3660), 
        .Q(k_b_out_gain[9]) );
  QDFFRBN \gain/K_B_tmp_reg[10]  ( .D(n1067), .CK(clk), .RB(n3661), .Q(
        \gain/K_B_tmp [10]) );
  QDFFRBN \gain/K_B_o_reg[10]  ( .D(\gain/K_B_tmp [10]), .CK(clk), .RB(n3661), 
        .Q(k_b_out_gain[10]) );
  QDFFRBN \gain/K_B_tmp_reg[11]  ( .D(n1066), .CK(clk), .RB(n3661), .Q(
        \gain/K_B_tmp [11]) );
  QDFFRBN \gain/K_B_o_reg[11]  ( .D(\gain/K_B_tmp [11]), .CK(clk), .RB(n3661), 
        .Q(k_b_out_gain[11]) );
  QDFFRBN \gain/K_G_tmp_reg[0]  ( .D(n1117), .CK(clk), .RB(n3661), .Q(
        \gain/K_G_tmp [0]) );
  QDFFRBN \gain/K_G_tmp_reg[1]  ( .D(n1116), .CK(clk), .RB(n3661), .Q(
        \gain/K_G_tmp [1]) );
  QDFFRBN \gain/K_G_tmp_reg[2]  ( .D(n1115), .CK(clk), .RB(n3662), .Q(
        \gain/K_G_tmp [2]) );
  QDFFRBN \gain/K_G_tmp_reg[3]  ( .D(n1114), .CK(clk), .RB(n3662), .Q(
        \gain/K_G_tmp [3]) );
  QDFFRBN \gain/K_G_tmp_reg[4]  ( .D(n1113), .CK(clk), .RB(n3662), .Q(
        \gain/K_G_tmp [4]) );
  QDFFRBN \gain/K_G_o_reg[4]  ( .D(\gain/K_G_tmp [4]), .CK(clk), .RB(n3662), 
        .Q(k_g_out_gain[4]) );
  QDFFRBN \gain/K_G_tmp_reg[5]  ( .D(n1112), .CK(clk), .RB(n3662), .Q(
        \gain/K_G_tmp [5]) );
  QDFFRBN \gain/K_G_o_reg[5]  ( .D(\gain/K_G_tmp [5]), .CK(clk), .RB(n3662), 
        .Q(k_g_out_gain[5]) );
  QDFFRBN \gain/K_G_tmp_reg[6]  ( .D(n1111), .CK(clk), .RB(n3663), .Q(
        \gain/K_G_tmp [6]) );
  QDFFRBN \gain/K_G_o_reg[6]  ( .D(\gain/K_G_tmp [6]), .CK(clk), .RB(n3663), 
        .Q(k_g_out_gain[6]) );
  QDFFRBN \gain/K_G_tmp_reg[7]  ( .D(n1110), .CK(clk), .RB(n3663), .Q(
        \gain/K_G_tmp [7]) );
  QDFFRBN \gain/K_G_o_reg[7]  ( .D(\gain/K_G_tmp [7]), .CK(clk), .RB(n3663), 
        .Q(k_g_out_gain[7]) );
  QDFFRBN \gain/K_G_tmp_reg[8]  ( .D(n1109), .CK(clk), .RB(n3663), .Q(
        \gain/K_G_tmp [8]) );
  QDFFRBN \gain/K_G_o_reg[8]  ( .D(\gain/K_G_tmp [8]), .CK(clk), .RB(n3663), 
        .Q(k_g_out_gain[8]) );
  QDFFRBN \gain/K_G_tmp_reg[9]  ( .D(n1108), .CK(clk), .RB(n3664), .Q(
        \gain/K_G_tmp [9]) );
  QDFFRBN \gain/K_G_o_reg[9]  ( .D(\gain/K_G_tmp [9]), .CK(clk), .RB(n3664), 
        .Q(k_g_out_gain[9]) );
  QDFFRBN \gain/K_G_tmp_reg[10]  ( .D(n1107), .CK(clk), .RB(n3664), .Q(
        \gain/K_G_tmp [10]) );
  QDFFRBN \gain/K_G_o_reg[10]  ( .D(\gain/K_G_tmp [10]), .CK(clk), .RB(n3638), 
        .Q(k_g_out_gain[10]) );
  QDFFRBN \gain/K_G_tmp_reg[11]  ( .D(n1106), .CK(clk), .RB(n3629), .Q(
        \gain/K_G_tmp [11]) );
  QDFFRBN \gain/K_G_o_reg[11]  ( .D(\gain/K_G_tmp [11]), .CK(clk), .RB(n3629), 
        .Q(k_g_out_gain[11]) );
  QDFFRBN \gain/K_R_tmp_reg[0]  ( .D(n1105), .CK(clk), .RB(n3630), .Q(
        \gain/K_R_tmp [0]) );
  QDFFRBN \gain/K_R_o_reg[0]  ( .D(\gain/K_R_tmp [0]), .CK(clk), .RB(n3630), 
        .Q(k_r_out_gain[0]) );
  QDFFRBN \gain/K_R_tmp_reg[1]  ( .D(n1104), .CK(clk), .RB(n3630), .Q(
        \gain/K_R_tmp [1]) );
  QDFFRBN \gain/K_R_o_reg[1]  ( .D(\gain/K_R_tmp [1]), .CK(clk), .RB(n3630), 
        .Q(k_r_out_gain[1]) );
  QDFFRBN \gain/K_R_tmp_reg[2]  ( .D(n1103), .CK(clk), .RB(n3630), .Q(
        \gain/K_R_tmp [2]) );
  QDFFRBN \gain/K_R_o_reg[2]  ( .D(\gain/K_R_tmp [2]), .CK(clk), .RB(n3630), 
        .Q(k_r_out_gain[2]) );
  QDFFRBN \gain/K_R_tmp_reg[3]  ( .D(n1102), .CK(clk), .RB(n3631), .Q(
        \gain/K_R_tmp [3]) );
  QDFFRBN \gain/K_R_o_reg[3]  ( .D(\gain/K_R_tmp [3]), .CK(clk), .RB(n3631), 
        .Q(k_r_out_gain[3]) );
  QDFFRBN \gain/K_R_tmp_reg[4]  ( .D(n1101), .CK(clk), .RB(n3631), .Q(
        \gain/K_R_tmp [4]) );
  QDFFRBN \gain/K_R_o_reg[4]  ( .D(\gain/K_R_tmp [4]), .CK(clk), .RB(n3631), 
        .Q(k_r_out_gain[4]) );
  QDFFRBN \gain/K_R_tmp_reg[5]  ( .D(n1100), .CK(clk), .RB(n3631), .Q(
        \gain/K_R_tmp [5]) );
  QDFFRBN \gain/K_R_o_reg[5]  ( .D(\gain/K_R_tmp [5]), .CK(clk), .RB(n3631), 
        .Q(k_r_out_gain[5]) );
  QDFFRBN \gain/K_R_tmp_reg[6]  ( .D(n1099), .CK(clk), .RB(n3632), .Q(
        \gain/K_R_tmp [6]) );
  QDFFRBN \gain/K_R_o_reg[6]  ( .D(\gain/K_R_tmp [6]), .CK(clk), .RB(n3632), 
        .Q(k_r_out_gain[6]) );
  QDFFRBN \gain/K_R_tmp_reg[7]  ( .D(n1098), .CK(clk), .RB(n3632), .Q(
        \gain/K_R_tmp [7]) );
  QDFFRBN \gain/K_R_o_reg[7]  ( .D(\gain/K_R_tmp [7]), .CK(clk), .RB(n3632), 
        .Q(k_r_out_gain[7]) );
  QDFFRBN \gain/K_R_tmp_reg[8]  ( .D(n1097), .CK(clk), .RB(n3632), .Q(
        \gain/K_R_tmp [8]) );
  QDFFRBN \gain/K_R_o_reg[8]  ( .D(\gain/K_R_tmp [8]), .CK(clk), .RB(n3632), 
        .Q(k_r_out_gain[8]) );
  QDFFRBN \gain/K_R_tmp_reg[9]  ( .D(n1096), .CK(clk), .RB(n3633), .Q(
        \gain/K_R_tmp [9]) );
  QDFFRBN \gain/K_R_o_reg[9]  ( .D(\gain/K_R_tmp [9]), .CK(clk), .RB(n3633), 
        .Q(k_r_out_gain[9]) );
  QDFFRBN \gain/K_R_tmp_reg[10]  ( .D(n1095), .CK(clk), .RB(n3633), .Q(
        \gain/K_R_tmp [10]) );
  QDFFRBN \gain/K_R_o_reg[10]  ( .D(\gain/K_R_tmp [10]), .CK(clk), .RB(n3633), 
        .Q(k_r_out_gain[10]) );
  QDFFRBN \gain/K_R_tmp_reg[11]  ( .D(n1094), .CK(clk), .RB(n3633), .Q(
        \gain/K_R_tmp [11]) );
  QDFFRBN \gain/K_R_o_reg[11]  ( .D(\gain/K_R_tmp [11]), .CK(clk), .RB(n3633), 
        .Q(k_r_out_gain[11]) );
  QDFFRBN \gain/B_r_reg[0]  ( .D(n1078), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [0]) );
  QDFFRBN \gain/B_r_reg[1]  ( .D(n1079), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [1]) );
  QDFFRBN \gain/B_r_reg[2]  ( .D(n1080), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [2]) );
  QDFFRBN \gain/B_r_reg[3]  ( .D(n1081), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [3]) );
  QDFFRBN \gain/B_r_reg[4]  ( .D(n1082), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [4]) );
  QDFFRBN \gain/B_r_reg[5]  ( .D(n1083), .CK(clk), .RB(n3634), .Q(
        \gain/B_r [5]) );
  QDFFRBN \gain/B_r_reg[6]  ( .D(n1084), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [6]) );
  QDFFRBN \gain/B_r_reg[7]  ( .D(n1085), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [7]) );
  QDFFRBN \gain/B_r_reg[8]  ( .D(n1086), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [8]) );
  QDFFRBN \gain/B_r_reg[9]  ( .D(n1087), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [9]) );
  QDFFRBN \gain/B_r_reg[10]  ( .D(n1088), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [10]) );
  QDFFRBN \gain/B_r_reg[11]  ( .D(n1089), .CK(clk), .RB(n3635), .Q(
        \gain/B_r [11]) );
  QDFFRBN \gain/B_r_reg[12]  ( .D(n1090), .CK(clk), .RB(n3636), .Q(
        \gain/B_r [12]) );
  QDFFRBN \gain/B_r_reg[13]  ( .D(n1091), .CK(clk), .RB(n3636), .Q(
        \gain/B_r [13]) );
  QDFFRBN \gain/B_r_reg[14]  ( .D(n1092), .CK(clk), .RB(n3636), .Q(
        \gain/B_r [14]) );
  QDFFRBN \gain/B_r_reg[15]  ( .D(n1093), .CK(clk), .RB(n3636), .Q(
        \gain/B_r [15]) );
  QDFFRBN \wb/K_B_r_reg[0]  ( .D(k_b_in_wb[4]), .CK(clk), .RB(n3636), .Q(
        \wb/K_B_r [0]) );
  QDFFRBN \wb/K_B_r_reg[1]  ( .D(k_b_in_wb[5]), .CK(clk), .RB(n3636), .Q(
        \wb/K_B_r [1]) );
  QDFFRBN \wb/K_B_r_reg[2]  ( .D(k_b_in_wb[6]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [2]) );
  QDFFRBN \wb/K_B_r_reg[3]  ( .D(k_b_in_wb[7]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [3]) );
  QDFFRBN \wb/K_B_r_reg[4]  ( .D(k_b_in_wb[8]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [4]) );
  QDFFRBN \wb/K_B_r_reg[5]  ( .D(k_b_in_wb[9]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [5]) );
  QDFFRBN \wb/K_B_r_reg[6]  ( .D(k_b_in_wb[10]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [6]) );
  QDFFRBN \wb/K_B_r_reg[7]  ( .D(k_b_in_wb[11]), .CK(clk), .RB(n3637), .Q(
        \wb/K_B_r [7]) );
  QDFFRBN \wb/K_G_r_reg[0]  ( .D(k_g_in_wb[4]), .CK(clk), .RB(n3638), .Q(
        \wb/K_G_r [0]) );
  QDFFRBN \wb/K_G_r_reg[1]  ( .D(k_g_in_wb[5]), .CK(clk), .RB(n3638), .Q(
        \wb/K_G_r [1]) );
  QDFFRBN \wb/K_G_r_reg[2]  ( .D(k_g_in_wb[6]), .CK(clk), .RB(n3638), .Q(
        \wb/K_G_r [2]) );
  QDFFRBN \wb/K_G_r_reg[3]  ( .D(k_g_in_wb[7]), .CK(clk), .RB(n3638), .Q(
        \wb/K_G_r [3]) );
  QDFFRBN \wb/K_G_r_reg[4]  ( .D(k_g_in_wb[8]), .CK(clk), .RB(n3638), .Q(
        \wb/K_G_r [4]) );
  QDFFRBN \wb/K_G_r_reg[5]  ( .D(k_g_in_wb[9]), .CK(clk), .RB(n3639), .Q(
        \wb/K_G_r [5]) );
  QDFFRBN \wb/K_G_r_reg[6]  ( .D(k_g_in_wb[10]), .CK(clk), .RB(n3639), .Q(
        \wb/K_G_r [6]) );
  QDFFRBN \wb/K_G_r_reg[7]  ( .D(k_g_in_wb[11]), .CK(clk), .RB(n3639), .Q(
        \wb/K_G_r [7]) );
  QDFFRBN \wb/K_R_r_reg[0]  ( .D(k_r_in_wb[4]), .CK(clk), .RB(n3639), .Q(
        \wb/K_R_r [0]) );
  QDFFRBN \wb/K_R_r_reg[1]  ( .D(k_r_in_wb[5]), .CK(clk), .RB(n3639), .Q(
        \wb/K_R_r [1]) );
  QDFFRBN \wb/K_R_r_reg[2]  ( .D(k_r_in_wb[6]), .CK(clk), .RB(n3639), .Q(
        \wb/K_R_r [2]) );
  QDFFRBN \wb/K_R_r_reg[3]  ( .D(k_r_in_wb[7]), .CK(clk), .RB(n3640), .Q(
        \wb/K_R_r [3]) );
  QDFFRBN \wb/K_R_r_reg[4]  ( .D(k_r_in_wb[8]), .CK(clk), .RB(n3640), .Q(
        \wb/K_R_r [4]) );
  QDFFRBN \wb/K_R_r_reg[5]  ( .D(k_r_in_wb[9]), .CK(clk), .RB(n3640), .Q(
        \wb/K_R_r [5]) );
  QDFFRBN \wb/K_R_r_reg[6]  ( .D(k_r_in_wb[10]), .CK(clk), .RB(n3640), .Q(
        \wb/K_R_r [6]) );
  QDFFRBN \wb/K_R_r_reg[7]  ( .D(k_r_in_wb[11]), .CK(clk), .RB(n3640), .Q(
        \wb/K_R_r [7]) );
  QDFFRBN \wb/value_r_reg[0]  ( .D(pixel_in_wb[0]), .CK(clk), .RB(n3640), .Q(
        \wb/value_r [0]) );
  QDFFRBN \wb/value_r_reg[1]  ( .D(pixel_in_wb[1]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [1]) );
  QDFFRBN \wb/value_r_reg[2]  ( .D(pixel_in_wb[2]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [2]) );
  QDFFRBN \wb/value_r_reg[3]  ( .D(pixel_in_wb[3]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [3]) );
  QDFFRBN \wb/value_r_reg[4]  ( .D(pixel_in_wb[4]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [4]) );
  QDFFRBN \wb/value_r_reg[5]  ( .D(pixel_in_wb[5]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [5]) );
  QDFFRBN \wb/value_r_reg[6]  ( .D(pixel_in_wb[6]), .CK(clk), .RB(n3641), .Q(
        \wb/value_r [6]) );
  QDFFRBN \wb/value_r_reg[7]  ( .D(pixel_in_wb[7]), .CK(clk), .RB(n3642), .Q(
        \wb/value_r [7]) );
  QDFFRBN \wb/valid_gain_r_reg  ( .D(valid_gain_in_wb), .CK(clk), .RB(n3642), 
        .Q(\wb/valid_gain_r ) );
  QDFFRBN \wb/valid_value_r_reg  ( .D(valid_value_in_wb), .CK(clk), .RB(n3642), 
        .Q(\wb/valid_value_r ) );
  QDFFRBN \wb/color_r_reg[0]  ( .D(color_in_wb[0]), .CK(clk), .RB(n3642), .Q(
        \wb/color_r [0]) );
  QDFFRBN \wb/color_tmp_reg[0]  ( .D(\wb/color_r [0]), .CK(clk), .RB(n3642), 
        .Q(color_out_wb[0]) );
  QDFFRBN \wb/color_r_reg[1]  ( .D(color_in_wb[1]), .CK(clk), .RB(n3642), .Q(
        \wb/color_r [1]) );
  QDFFRBN \wb/color_tmp_reg[1]  ( .D(\wb/color_r [1]), .CK(clk), .RB(n3643), 
        .Q(color_out_wb[1]) );
  QDFFRBN \wb/last_tmp_reg  ( .D(last_pic_in_wb), .CK(clk), .RB(n3643), .Q(
        \wb/last_tmp ) );
  QDFFRBN \wb/last_o_reg  ( .D(\wb/last_tmp ), .CK(clk), .RB(n3643), .Q(
        last_pic_out_wb) );
  QDFFRBN \wb/value_o_reg[0]  ( .D(\wb/value_tmp_2 [0]), .CK(clk), .RB(n3643), 
        .Q(pixel_out_wb[0]) );
  QDFFRBN \wb/value_o_reg[1]  ( .D(\wb/value_tmp_2 [1]), .CK(clk), .RB(n3643), 
        .Q(pixel_out_wb[1]) );
  QDFFRBN \wb/value_o_reg[2]  ( .D(\wb/value_tmp_2 [2]), .CK(clk), .RB(n3643), 
        .Q(pixel_out_wb[2]) );
  QDFFRBN \wb/value_o_reg[3]  ( .D(\wb/value_tmp_2 [3]), .CK(clk), .RB(n3644), 
        .Q(pixel_out_wb[3]) );
  QDFFRBN \wb/value_o_reg[4]  ( .D(\wb/value_tmp_2 [4]), .CK(clk), .RB(n3644), 
        .Q(pixel_out_wb[4]) );
  QDFFRBN \wb/value_o_reg[5]  ( .D(\wb/value_tmp_2 [5]), .CK(clk), .RB(n3644), 
        .Q(pixel_out_wb[5]) );
  QDFFRBN \wb/value_o_reg[6]  ( .D(\wb/value_tmp_2 [6]), .CK(clk), .RB(n3644), 
        .Q(pixel_out_wb[6]) );
  QDFFRBN \wb/value_o_reg[7]  ( .D(\wb/value_tmp_2 [7]), .CK(clk), .RB(n3644), 
        .Q(pixel_out_wb[7]) );
  QDFFRBN \wb/valid_o_reg  ( .D(\wb/valid_tmp ), .CK(clk), .RB(n3644), .Q(
        valid_value_out_wb) );
  DFFSBN \color_in_reg_reg[1]  ( .D(color_in[1]), .CK(clk), .SB(n3596), .Q(
        color_in_wb[1]), .QB(n3595) );
  DFFSBN \color_in_reg_reg[0]  ( .D(color_in[0]), .CK(clk), .SB(n2091), .Q(
        color_in_wb[0]), .QB(n3594) );
  DFFSBN \denoise/color_2_reg[0]  ( .D(\denoise/n_color_2 [0]), .CK(clk), .SB(
        n3596), .Q(\denoise/color_2 [0]), .QB(n3589) );
  DFFSBN \denoise/color_2_reg[1]  ( .D(\denoise/n_color_2 [1]), .CK(clk), .SB(
        n2102), .Q(\denoise/color_2 [1]), .QB(n3585) );
  DFFSBN \gain/MSB_R_r_reg[0]  ( .D(n1221), .CK(clk), .SB(n3596), .Q(
        \gain/N325 ), .QB(n3586) );
  DFFSBN \gain/MSB_R_r_reg[1]  ( .D(n1220), .CK(clk), .SB(n3747), .Q(
        \gain/MSB_R_r[1] ), .QB(n3584) );
  DFFSBN \gain/MSB_R_r_reg[2]  ( .D(n1219), .CK(clk), .SB(n2092), .Q(
        \gain/N303 ), .QB(n3587) );
  DFFSBN \gain/MSB_G_r_reg[0]  ( .D(n1197), .CK(clk), .SB(n3606), .Q(
        \gain/N478 ), .QB(n3583) );
  DFFSBN \gain/MSB_G_r_reg[1]  ( .D(n1196), .CK(clk), .SB(n2092), .Q(
        \gain/MSB_G_r[1] ), .QB(n3588) );
  DFFSBN \gain/MSB_G_r_reg[2]  ( .D(n1195), .CK(clk), .SB(n3744), .Q(
        \gain/N456 ), .QB(n3592) );
  DFFSBN \gain/MSB_B_r_reg[0]  ( .D(n1123), .CK(clk), .SB(n2092), .Q(
        \gain/N648 ), .QB(n3591) );
  DFFSBN \gain/MSB_B_r_reg[1]  ( .D(n1122), .CK(clk), .SB(n3731), .Q(n1732), 
        .QB(n3590) );
  DFFSBN \gain/MSB_B_r_reg[2]  ( .D(n1121), .CK(clk), .SB(n3734), .Q(
        \gain/N626 ), .QB(n3593) );
  DFFSBN \color_out_reg_reg[0]  ( .D(n1709), .CK(clk), .SB(n2102), .QB(n1953)
         );
  DFFSBN \color_out_reg_reg[1]  ( .D(n1710), .CK(clk), .SB(n2095), .QB(n1955)
         );
  QDFFRBN \denoise/valid_count_0_reg[0]  ( .D(n1064), .CK(clk), .RB(n3646), 
        .Q(\denoise/valid_count_0 [0]) );
  QDFFRBN \denoise/valid_count_0_reg[1]  ( .D(n1063), .CK(clk), .RB(n3647), 
        .Q(\denoise/valid_count_0 [1]) );
  FA1S \DP_OP_654J1_124_416/U55  ( .A(\DP_OP_654J1_124_416/n159 ), .B(
        \DP_OP_654J1_124_416/n152 ), .CI(\DP_OP_654J1_124_416/n97 ), .CO(
        \DP_OP_654J1_124_416/n93 ), .S(\DP_OP_654J1_124_416/n94 ) );
  FA1S \DP_OP_654J1_124_416/U53  ( .A(\DP_OP_654J1_124_416/n158 ), .B(
        \DP_OP_654J1_124_416/n144 ), .CI(\DP_OP_654J1_124_416/n151 ), .CO(
        \DP_OP_654J1_124_416/n89 ), .S(\DP_OP_654J1_124_416/n90 ) );
  FA1S \DP_OP_654J1_124_416/U52  ( .A(\DP_OP_654J1_124_416/n95 ), .B(
        \DP_OP_654J1_124_416/n92 ), .CI(\DP_OP_654J1_124_416/n90 ), .CO(
        \DP_OP_654J1_124_416/n87 ), .S(\DP_OP_654J1_124_416/n88 ) );
  FA1S \DP_OP_654J1_124_416/U50  ( .A(\DP_OP_654J1_124_416/n157 ), .B(
        \DP_OP_654J1_124_416/n136 ), .CI(\DP_OP_654J1_124_416/n143 ), .CO(
        \DP_OP_654J1_124_416/n83 ), .S(\DP_OP_654J1_124_416/n84 ) );
  FA1S \DP_OP_654J1_124_416/U49  ( .A(\DP_OP_654J1_124_416/n150 ), .B(
        \DP_OP_654J1_124_416/n91 ), .CI(\DP_OP_654J1_124_416/n86 ), .CO(
        \DP_OP_654J1_124_416/n81 ), .S(\DP_OP_654J1_124_416/n82 ) );
  FA1S \DP_OP_654J1_124_416/U48  ( .A(\DP_OP_654J1_124_416/n89 ), .B(
        \DP_OP_654J1_124_416/n84 ), .CI(\DP_OP_654J1_124_416/n82 ), .CO(
        \DP_OP_654J1_124_416/n79 ), .S(\DP_OP_654J1_124_416/n80 ) );
  FA1S \DP_OP_654J1_124_416/U46  ( .A(\DP_OP_654J1_124_416/n156 ), .B(
        \DP_OP_654J1_124_416/n128 ), .CI(\DP_OP_654J1_124_416/n149 ), .CO(
        \DP_OP_654J1_124_416/n75 ), .S(\DP_OP_654J1_124_416/n76 ) );
  FA1S \DP_OP_654J1_124_416/U45  ( .A(\DP_OP_654J1_124_416/n142 ), .B(
        \DP_OP_654J1_124_416/n135 ), .CI(\DP_OP_654J1_124_416/n85 ), .CO(
        \DP_OP_654J1_124_416/n73 ), .S(\DP_OP_654J1_124_416/n74 ) );
  FA1S \DP_OP_654J1_124_416/U44  ( .A(\DP_OP_654J1_124_416/n78 ), .B(
        \DP_OP_654J1_124_416/n83 ), .CI(\DP_OP_654J1_124_416/n76 ), .CO(
        \DP_OP_654J1_124_416/n71 ), .S(\DP_OP_654J1_124_416/n72 ) );
  FA1S \DP_OP_654J1_124_416/U43  ( .A(\DP_OP_654J1_124_416/n81 ), .B(
        \DP_OP_654J1_124_416/n74 ), .CI(\DP_OP_654J1_124_416/n72 ), .CO(
        \DP_OP_654J1_124_416/n69 ), .S(\DP_OP_654J1_124_416/n70 ) );
  FA1S \DP_OP_654J1_124_416/U41  ( .A(\DP_OP_654J1_124_416/n155 ), .B(
        \DP_OP_654J1_124_416/n120 ), .CI(\DP_OP_654J1_124_416/n148 ), .CO(
        \DP_OP_654J1_124_416/n65 ), .S(\DP_OP_654J1_124_416/n66 ) );
  FA1S \DP_OP_654J1_124_416/U40  ( .A(\DP_OP_654J1_124_416/n141 ), .B(
        \DP_OP_654J1_124_416/n127 ), .CI(\DP_OP_654J1_124_416/n134 ), .CO(
        \DP_OP_654J1_124_416/n63 ), .S(\DP_OP_654J1_124_416/n64 ) );
  FA1S \DP_OP_654J1_124_416/U39  ( .A(\DP_OP_654J1_124_416/n77 ), .B(
        \DP_OP_654J1_124_416/n68 ), .CI(\DP_OP_654J1_124_416/n75 ), .CO(
        \DP_OP_654J1_124_416/n61 ), .S(\DP_OP_654J1_124_416/n62 ) );
  FA1S \DP_OP_654J1_124_416/U38  ( .A(\DP_OP_654J1_124_416/n64 ), .B(
        \DP_OP_654J1_124_416/n66 ), .CI(\DP_OP_654J1_124_416/n73 ), .CO(
        \DP_OP_654J1_124_416/n59 ), .S(\DP_OP_654J1_124_416/n60 ) );
  FA1S \DP_OP_654J1_124_416/U37  ( .A(\DP_OP_654J1_124_416/n71 ), .B(
        \DP_OP_654J1_124_416/n62 ), .CI(\DP_OP_654J1_124_416/n60 ), .CO(
        \DP_OP_654J1_124_416/n57 ), .S(\DP_OP_654J1_124_416/n58 ) );
  FA1S \DP_OP_654J1_124_416/U35  ( .A(\DP_OP_654J1_124_416/n126 ), .B(
        \DP_OP_654J1_124_416/n119 ), .CI(\DP_OP_654J1_124_416/n147 ), .CO(
        \DP_OP_654J1_124_416/n53 ), .S(\DP_OP_654J1_124_416/n54 ) );
  FA1S \DP_OP_654J1_124_416/U34  ( .A(\DP_OP_654J1_124_416/n140 ), .B(
        \DP_OP_654J1_124_416/n133 ), .CI(\DP_OP_654J1_124_416/n67 ), .CO(
        \DP_OP_654J1_124_416/n51 ), .S(\DP_OP_654J1_124_416/n52 ) );
  FA1S \DP_OP_654J1_124_416/U33  ( .A(\DP_OP_654J1_124_416/n56 ), .B(
        \DP_OP_654J1_124_416/n65 ), .CI(\DP_OP_654J1_124_416/n63 ), .CO(
        \DP_OP_654J1_124_416/n49 ), .S(\DP_OP_654J1_124_416/n50 ) );
  FA1S \DP_OP_654J1_124_416/U32  ( .A(\DP_OP_654J1_124_416/n54 ), .B(
        \DP_OP_654J1_124_416/n52 ), .CI(\DP_OP_654J1_124_416/n61 ), .CO(
        \DP_OP_654J1_124_416/n47 ), .S(\DP_OP_654J1_124_416/n48 ) );
  FA1S \DP_OP_654J1_124_416/U31  ( .A(\DP_OP_654J1_124_416/n50 ), .B(
        \DP_OP_654J1_124_416/n59 ), .CI(\DP_OP_654J1_124_416/n48 ), .CO(
        \DP_OP_654J1_124_416/n45 ), .S(\DP_OP_654J1_124_416/n46 ) );
  FA1S \DP_OP_654J1_124_416/U30  ( .A(\DP_OP_654J1_124_416/n139 ), .B(
        \DP_OP_654J1_124_416/n104 ), .CI(\DP_OP_654J1_124_416/n111 ), .CO(
        \DP_OP_654J1_124_416/n43 ), .S(\DP_OP_654J1_124_416/n44 ) );
  FA1S \DP_OP_654J1_124_416/U29  ( .A(\DP_OP_654J1_124_416/n118 ), .B(
        \DP_OP_654J1_124_416/n125 ), .CI(\DP_OP_654J1_124_416/n132 ), .CO(
        \DP_OP_654J1_124_416/n41 ), .S(\DP_OP_654J1_124_416/n42 ) );
  FA1S \DP_OP_654J1_124_416/U28  ( .A(\DP_OP_654J1_124_416/n55 ), .B(
        \DP_OP_654J1_124_416/n53 ), .CI(\DP_OP_654J1_124_416/n42 ), .CO(
        \DP_OP_654J1_124_416/n39 ), .S(\DP_OP_654J1_124_416/n40 ) );
  FA1S \DP_OP_654J1_124_416/U27  ( .A(\DP_OP_654J1_124_416/n44 ), .B(
        \DP_OP_654J1_124_416/n51 ), .CI(\DP_OP_654J1_124_416/n49 ), .CO(
        \DP_OP_654J1_124_416/n37 ), .S(\DP_OP_654J1_124_416/n38 ) );
  FA1S \DP_OP_654J1_124_416/U26  ( .A(\DP_OP_654J1_124_416/n40 ), .B(
        \DP_OP_654J1_124_416/n47 ), .CI(\DP_OP_654J1_124_416/n38 ), .CO(
        \DP_OP_654J1_124_416/n35 ), .S(\DP_OP_654J1_124_416/n36 ) );
  FA1S \DP_OP_654J1_124_416/U25  ( .A(\DP_OP_654J1_124_416/n131 ), .B(
        \DP_OP_654J1_124_416/n103 ), .CI(\DP_OP_654J1_124_416/n110 ), .CO(
        \DP_OP_654J1_124_416/n33 ), .S(\DP_OP_654J1_124_416/n34 ) );
  FA1S \DP_OP_654J1_124_416/U24  ( .A(\DP_OP_654J1_124_416/n124 ), .B(
        \DP_OP_654J1_124_416/n117 ), .CI(\DP_OP_654J1_124_416/n43 ), .CO(
        \DP_OP_654J1_124_416/n31 ), .S(\DP_OP_654J1_124_416/n32 ) );
  FA1S \DP_OP_654J1_124_416/U23  ( .A(\DP_OP_654J1_124_416/n41 ), .B(
        \DP_OP_654J1_124_416/n34 ), .CI(\DP_OP_654J1_124_416/n39 ), .CO(
        \DP_OP_654J1_124_416/n29 ), .S(\DP_OP_654J1_124_416/n30 ) );
  FA1S \DP_OP_654J1_124_416/U22  ( .A(\DP_OP_654J1_124_416/n32 ), .B(
        \DP_OP_654J1_124_416/n37 ), .CI(\DP_OP_654J1_124_416/n30 ), .CO(
        \DP_OP_654J1_124_416/n27 ), .S(\DP_OP_654J1_124_416/n28 ) );
  FA1S \DP_OP_654J1_124_416/U21  ( .A(\DP_OP_654J1_124_416/n123 ), .B(
        \DP_OP_654J1_124_416/n102 ), .CI(\DP_OP_654J1_124_416/n109 ), .CO(
        \DP_OP_654J1_124_416/n25 ), .S(\DP_OP_654J1_124_416/n26 ) );
  FA1S \DP_OP_654J1_124_416/U20  ( .A(\DP_OP_654J1_124_416/n116 ), .B(
        \DP_OP_654J1_124_416/n33 ), .CI(\DP_OP_654J1_124_416/n26 ), .CO(
        \DP_OP_654J1_124_416/n23 ), .S(\DP_OP_654J1_124_416/n24 ) );
  FA1S \DP_OP_654J1_124_416/U19  ( .A(\DP_OP_654J1_124_416/n31 ), .B(
        \DP_OP_654J1_124_416/n24 ), .CI(\DP_OP_654J1_124_416/n29 ), .CO(
        \DP_OP_654J1_124_416/n21 ), .S(\DP_OP_654J1_124_416/n22 ) );
  FA1S \DP_OP_654J1_124_416/U18  ( .A(\DP_OP_654J1_124_416/n115 ), .B(
        \DP_OP_654J1_124_416/n101 ), .CI(\DP_OP_654J1_124_416/n108 ), .CO(
        \DP_OP_654J1_124_416/n19 ), .S(\DP_OP_654J1_124_416/n20 ) );
  FA1S \DP_OP_654J1_124_416/U17  ( .A(\DP_OP_654J1_124_416/n25 ), .B(
        \DP_OP_654J1_124_416/n20 ), .CI(\DP_OP_654J1_124_416/n23 ), .CO(
        \DP_OP_654J1_124_416/n17 ), .S(\DP_OP_654J1_124_416/n18 ) );
  FA1S \DP_OP_654J1_124_416/U16  ( .A(\DP_OP_654J1_124_416/n107 ), .B(
        \DP_OP_654J1_124_416/n100 ), .CI(\DP_OP_654J1_124_416/n19 ), .CO(
        \DP_OP_654J1_124_416/n15 ), .S(\DP_OP_654J1_124_416/n16 ) );
  FA1S \DP_OP_654J1_124_416/U14  ( .A(\DP_OP_654J1_124_416/n146 ), .B(
        \DP_OP_654J1_124_416/n14 ), .CI(\DP_OP_654J1_124_416/n98 ), .CO(
        \DP_OP_654J1_124_416/n13 ) );
  FA1S \DP_OP_654J1_124_416/U13  ( .A(\DP_OP_654J1_124_416/n96 ), .B(
        \DP_OP_654J1_124_416/n13 ), .CI(\DP_OP_654J1_124_416/n94 ), .CO(
        \DP_OP_654J1_124_416/n12 ) );
  FA1S \DP_OP_654J1_124_416/U12  ( .A(\DP_OP_654J1_124_416/n93 ), .B(
        \DP_OP_654J1_124_416/n88 ), .CI(\DP_OP_654J1_124_416/n12 ), .CO(
        \DP_OP_654J1_124_416/n11 ), .S(\C237/DATA2_0 ) );
  FA1S \DP_OP_654J1_124_416/U11  ( .A(\DP_OP_654J1_124_416/n87 ), .B(
        \DP_OP_654J1_124_416/n80 ), .CI(\DP_OP_654J1_124_416/n11 ), .CO(
        \DP_OP_654J1_124_416/n10 ), .S(\C237/DATA2_1 ) );
  FA1S \DP_OP_654J1_124_416/U10  ( .A(\DP_OP_654J1_124_416/n79 ), .B(
        \DP_OP_654J1_124_416/n70 ), .CI(\DP_OP_654J1_124_416/n10 ), .CO(
        \DP_OP_654J1_124_416/n9 ), .S(\C237/DATA2_2 ) );
  FA1S \DP_OP_654J1_124_416/U9  ( .A(\DP_OP_654J1_124_416/n69 ), .B(
        \DP_OP_654J1_124_416/n58 ), .CI(\DP_OP_654J1_124_416/n9 ), .CO(
        \DP_OP_654J1_124_416/n8 ), .S(\C237/DATA2_3 ) );
  FA1S \DP_OP_654J1_124_416/U8  ( .A(\DP_OP_654J1_124_416/n57 ), .B(
        \DP_OP_654J1_124_416/n46 ), .CI(\DP_OP_654J1_124_416/n8 ), .CO(
        \DP_OP_654J1_124_416/n7 ), .S(\C237/DATA2_4 ) );
  FA1S \DP_OP_654J1_124_416/U7  ( .A(\DP_OP_654J1_124_416/n45 ), .B(
        \DP_OP_654J1_124_416/n36 ), .CI(\DP_OP_654J1_124_416/n7 ), .CO(
        \DP_OP_654J1_124_416/n6 ), .S(\C237/DATA2_5 ) );
  FA1S \DP_OP_654J1_124_416/U6  ( .A(\DP_OP_654J1_124_416/n35 ), .B(
        \DP_OP_654J1_124_416/n28 ), .CI(\DP_OP_654J1_124_416/n6 ), .CO(
        \DP_OP_654J1_124_416/n5 ), .S(\C237/DATA2_6 ) );
  FA1S \DP_OP_654J1_124_416/U5  ( .A(\DP_OP_654J1_124_416/n27 ), .B(
        \DP_OP_654J1_124_416/n22 ), .CI(\DP_OP_654J1_124_416/n5 ), .CO(
        \DP_OP_654J1_124_416/n4 ), .S(\C237/DATA2_7 ) );
  FA1S \DP_OP_654J1_124_416/U4  ( .A(\DP_OP_654J1_124_416/n18 ), .B(
        \DP_OP_654J1_124_416/n21 ), .CI(\DP_OP_654J1_124_416/n4 ), .CO(
        \DP_OP_654J1_124_416/n3 ), .S(\C237/DATA2_8 ) );
  FA1S \DP_OP_654J1_124_416/U3  ( .A(\DP_OP_654J1_124_416/n16 ), .B(
        \DP_OP_654J1_124_416/n17 ), .CI(\DP_OP_654J1_124_416/n3 ), .CO(
        \DP_OP_654J1_124_416/n2 ), .S(\C237/DATA2_9 ) );
  FA1S \DP_OP_654J1_124_416/U2  ( .A(\DP_OP_654J1_124_416/n99 ), .B(
        \DP_OP_654J1_124_416/n15 ), .CI(\DP_OP_654J1_124_416/n2 ), .CO(
        \DP_OP_654J1_124_416/n1 ), .S(\C237/DATA2_10 ) );
  FA1S \intadd_0/U11  ( .A(\intadd_0/B[0] ), .B(n1745), .CI(\intadd_0/CI ), 
        .CO(\intadd_0/n10 ), .S(\intadd_0/SUM[0] ) );
  FA1S \intadd_0/U10  ( .A(\intadd_0/B[1] ), .B(\gain/b_mean_r [5]), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(\intadd_0/SUM[1] ) );
  FA1S \intadd_0/U9  ( .A(\intadd_0/B[2] ), .B(\gain/b_mean_r [6]), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[2] ) );
  FA1S \intadd_0/U8  ( .A(\intadd_0/B[3] ), .B(\gain/b_mean_r [7]), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[3] ) );
  FA1S \intadd_0/U7  ( .A(\intadd_0/B[4] ), .B(\gain/b_mean_r [8]), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[4] ) );
  FA1S \intadd_0/U6  ( .A(\intadd_0/B[5] ), .B(n1746), .CI(\intadd_0/n6 ), 
        .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[5] ) );
  FA1S \intadd_0/U5  ( .A(\intadd_0/B[6] ), .B(\gain/b_mean_r [10]), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[6] ) );
  FA1S \intadd_0/U4  ( .A(\intadd_0/B[7] ), .B(\gain/b_mean_r [11]), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[7] ) );
  FA1S \intadd_0/U3  ( .A(\intadd_0/B[8] ), .B(\gain/b_mean_r [12]), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[8] ) );
  FA1S \intadd_0/U2  ( .A(\intadd_0/B[9] ), .B(\gain/b_mean_r [13]), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[9] ) );
  FA1S \intadd_1/U11  ( .A(\intadd_1/B[0] ), .B(n1749), .CI(\intadd_1/CI ), 
        .CO(\intadd_1/n10 ), .S(\intadd_1/SUM[0] ) );
  FA1S \intadd_1/U10  ( .A(\intadd_1/B[1] ), .B(\gain/r_mean_r [5]), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\intadd_1/SUM[1] ) );
  FA1S \intadd_1/U9  ( .A(\intadd_1/B[2] ), .B(\gain/r_mean_r [6]), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\intadd_1/SUM[2] ) );
  FA1S \intadd_1/U8  ( .A(\intadd_1/B[3] ), .B(\gain/r_mean_r [7]), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[3] ) );
  FA1S \intadd_1/U7  ( .A(\intadd_1/B[4] ), .B(\gain/r_mean_r [8]), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[4] ) );
  FA1S \intadd_1/U6  ( .A(\intadd_1/B[5] ), .B(\gain/r_mean_r [9]), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[5] ) );
  FA1S \intadd_1/U5  ( .A(\intadd_1/B[6] ), .B(\gain/r_mean_r [10]), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[6] ) );
  FA1S \intadd_1/U4  ( .A(\intadd_1/B[7] ), .B(\gain/r_mean_r [11]), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[7] ) );
  FA1S \intadd_1/U3  ( .A(\intadd_1/B[8] ), .B(\gain/r_mean_r [12]), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[8] ) );
  FA1S \intadd_1/U2  ( .A(\intadd_1/B[9] ), .B(\gain/r_mean_r [13]), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[9] ) );
  FA1S \intadd_2/U11  ( .A(\intadd_2/B[0] ), .B(n1747), .CI(\intadd_2/CI ), 
        .CO(\intadd_2/n10 ), .S(\intadd_2/SUM[0] ) );
  FA1S \intadd_2/U10  ( .A(\intadd_2/B[1] ), .B(\gain/g_mean_r [5]), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(\intadd_2/SUM[1] ) );
  FA1S \intadd_2/U9  ( .A(\intadd_2/B[2] ), .B(\gain/g_mean_r [6]), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(\intadd_2/SUM[2] ) );
  FA1S \intadd_2/U8  ( .A(\intadd_2/B[3] ), .B(\gain/g_mean_r [7]), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(\intadd_2/SUM[3] ) );
  FA1S \intadd_2/U7  ( .A(\intadd_2/B[4] ), .B(\gain/g_mean_r [8]), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(\intadd_2/SUM[4] ) );
  FA1S \intadd_2/U6  ( .A(\intadd_2/B[5] ), .B(\gain/g_mean_r [9]), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(\intadd_2/SUM[5] ) );
  FA1S \intadd_2/U5  ( .A(\intadd_2/B[6] ), .B(\gain/g_mean_r [10]), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[6] ) );
  FA1S \intadd_2/U4  ( .A(\intadd_2/B[7] ), .B(\gain/g_mean_r [11]), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[7] ) );
  FA1S \intadd_2/U3  ( .A(\intadd_2/B[8] ), .B(\gain/g_mean_r [12]), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[8] ) );
  FA1S \intadd_2/U2  ( .A(\intadd_2/B[9] ), .B(\gain/g_mean_r [13]), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(\intadd_2/SUM[9] ) );
  FA1S \intadd_3/U11  ( .A(\denoise/sum6 [0]), .B(\denoise/sum3 [0]), .CI(
        \denoise/n_new_sum6 [0]), .CO(\intadd_3/n10 ), .S(\denoise/n_sum9 [0])
         );
  FA1S \intadd_3/U10  ( .A(\denoise/n_new_sum6 [1]), .B(\intadd_3/A[1] ), .CI(
        \intadd_3/n10 ), .CO(\intadd_3/n9 ), .S(\denoise/n_sum9 [1]) );
  FA1S \intadd_3/U9  ( .A(\denoise/n_new_sum6 [2]), .B(\intadd_3/A[2] ), .CI(
        \intadd_3/n9 ), .CO(\intadd_3/n8 ), .S(\denoise/n_sum9 [2]) );
  FA1S \intadd_3/U8  ( .A(\denoise/n_new_sum6 [3]), .B(\intadd_3/A[3] ), .CI(
        \intadd_3/n8 ), .CO(\intadd_3/n7 ), .S(\denoise/n_sum9 [3]) );
  FA1S \intadd_3/U7  ( .A(\denoise/n_new_sum6 [4]), .B(\intadd_3/A[4] ), .CI(
        \intadd_3/n7 ), .CO(\intadd_3/n6 ), .S(\denoise/n_sum9 [4]) );
  FA1S \intadd_3/U6  ( .A(\denoise/n_new_sum6 [5]), .B(\intadd_3/A[5] ), .CI(
        \intadd_3/n6 ), .CO(\intadd_3/n5 ), .S(\denoise/n_sum9 [5]) );
  FA1S \intadd_3/U5  ( .A(\denoise/n_new_sum6 [6]), .B(\intadd_3/A[6] ), .CI(
        \intadd_3/n5 ), .CO(\intadd_3/n4 ), .S(\denoise/n_sum9 [6]) );
  FA1S \intadd_3/U4  ( .A(\denoise/n_new_sum6 [7]), .B(\intadd_3/A[7] ), .CI(
        \intadd_3/n4 ), .CO(\intadd_3/n3 ), .S(\denoise/n_sum9 [7]) );
  FA1S \intadd_3/U3  ( .A(\denoise/n_new_sum6 [8]), .B(\intadd_3/A[8] ), .CI(
        \intadd_3/n3 ), .CO(\intadd_3/n2 ), .S(\denoise/n_sum9 [8]) );
  FA1S \intadd_3/U2  ( .A(\denoise/n_new_sum6 [9]), .B(\intadd_3/A[9] ), .CI(
        \intadd_3/n2 ), .CO(\intadd_3/n1 ), .S(\denoise/n_sum9 [9]) );
  FA1S \intadd_4/U9  ( .A(\denoise/sum3 [2]), .B(\denoise/sum6 [2]), .CI(
        \intadd_4/CI ), .CO(\intadd_4/n8 ), .S(\intadd_3/A[2] ) );
  FA1S \intadd_4/U8  ( .A(\denoise/sum3 [3]), .B(\denoise/sum6 [3]), .CI(
        \intadd_4/n8 ), .CO(\intadd_4/n7 ), .S(\intadd_3/A[3] ) );
  FA1S \intadd_4/U7  ( .A(\denoise/sum3 [4]), .B(\denoise/sum6 [4]), .CI(
        \intadd_4/n7 ), .CO(\intadd_4/n6 ), .S(\intadd_3/A[4] ) );
  FA1S \intadd_4/U6  ( .A(\denoise/sum3 [5]), .B(\denoise/sum6 [5]), .CI(
        \intadd_4/n6 ), .CO(\intadd_4/n5 ), .S(\intadd_3/A[5] ) );
  FA1S \intadd_4/U5  ( .A(\denoise/sum3 [6]), .B(\denoise/sum6 [6]), .CI(
        \intadd_4/n5 ), .CO(\intadd_4/n4 ), .S(\intadd_3/A[6] ) );
  FA1S \intadd_4/U4  ( .A(\denoise/sum3 [7]), .B(\denoise/sum6 [7]), .CI(
        \intadd_4/n4 ), .CO(\intadd_4/n3 ), .S(\intadd_3/A[7] ) );
  FA1S \intadd_4/U3  ( .A(\denoise/sum3 [8]), .B(\denoise/sum6 [8]), .CI(
        \intadd_4/n3 ), .CO(\intadd_4/n2 ), .S(\intadd_3/A[8] ) );
  FA1S \intadd_4/U2  ( .A(\denoise/sum3 [9]), .B(\denoise/sum6 [9]), .CI(
        \intadd_4/n2 ), .CO(\intadd_4/n1 ), .S(\intadd_3/A[9] ) );
  FA1S \intadd_5/U9  ( .A(\denoise/pos8 [0]), .B(\denoise/pos9 [0]), .CI(
        \denoise/pos7 [0]), .CO(\intadd_5/n8 ), .S(\denoise/n_new_sum6 [0]) );
  FA1S \intadd_5/U8  ( .A(\intadd_5/B[1] ), .B(\denoise/pos9 [1]), .CI(
        \intadd_5/n8 ), .CO(\intadd_5/n7 ), .S(\denoise/n_new_sum6 [1]) );
  FA1S \intadd_5/U7  ( .A(\intadd_5/B[2] ), .B(\intadd_5/A[2] ), .CI(
        \intadd_5/n7 ), .CO(\intadd_5/n6 ), .S(\denoise/n_new_sum6 [2]) );
  FA1S \intadd_5/U6  ( .A(\intadd_5/B[3] ), .B(\intadd_5/A[3] ), .CI(
        \intadd_5/n6 ), .CO(\intadd_5/n5 ), .S(\denoise/n_new_sum6 [3]) );
  FA1S \intadd_5/U5  ( .A(\intadd_5/B[4] ), .B(\intadd_5/A[4] ), .CI(
        \intadd_5/n5 ), .CO(\intadd_5/n4 ), .S(\denoise/n_new_sum6 [4]) );
  FA1S \intadd_5/U4  ( .A(\intadd_5/B[5] ), .B(\intadd_5/A[5] ), .CI(
        \intadd_5/n4 ), .CO(\intadd_5/n3 ), .S(\denoise/n_new_sum6 [5]) );
  FA1S \intadd_5/U3  ( .A(\intadd_5/B[6] ), .B(\intadd_5/A[6] ), .CI(
        \intadd_5/n3 ), .CO(\intadd_5/n2 ), .S(\denoise/n_new_sum6 [6]) );
  FA1S \intadd_5/U2  ( .A(\intadd_5/B[7] ), .B(\intadd_5/A[7] ), .CI(
        \intadd_5/n2 ), .CO(\intadd_5/n1 ), .S(\denoise/n_new_sum6 [7]) );
  QDFFRBN \mean/value_r_reg[0]  ( .D(pixel_in_mean[0]), .CK(clk), .RB(n3618), 
        .Q(\mean/value_r [0]) );
  HA1 \DP_OP_654J1_124_416/U36  ( .A(\DP_OP_654J1_124_416/n112 ), .B(
        \DP_OP_654J1_124_416/n105 ), .C(\DP_OP_654J1_124_416/n55 ), .S(
        \DP_OP_654J1_124_416/n56 ) );
  HA1 \DP_OP_654J1_124_416/U42  ( .A(\DP_OP_654J1_124_416/n113 ), .B(
        \DP_OP_654J1_124_416/n106 ), .C(\DP_OP_654J1_124_416/n67 ), .S(
        \DP_OP_654J1_124_416/n68 ) );
  HA1 \DP_OP_654J1_124_416/U47  ( .A(\DP_OP_654J1_124_416/n121 ), .B(
        \DP_OP_654J1_124_416/n114 ), .C(\DP_OP_654J1_124_416/n77 ), .S(
        \DP_OP_654J1_124_416/n78 ) );
  HA1 \DP_OP_654J1_124_416/U51  ( .A(\DP_OP_654J1_124_416/n129 ), .B(
        \DP_OP_654J1_124_416/n122 ), .C(\DP_OP_654J1_124_416/n85 ), .S(
        \DP_OP_654J1_124_416/n86 ) );
  HA1 \DP_OP_654J1_124_416/U54  ( .A(\DP_OP_654J1_124_416/n137 ), .B(
        \DP_OP_654J1_124_416/n130 ), .C(\DP_OP_654J1_124_416/n91 ), .S(
        \DP_OP_654J1_124_416/n92 ) );
  HA1 \DP_OP_654J1_124_416/U56  ( .A(\DP_OP_654J1_124_416/n145 ), .B(
        \DP_OP_654J1_124_416/n138 ), .C(\DP_OP_654J1_124_416/n95 ), .S(
        \DP_OP_654J1_124_416/n96 ) );
  HA1 \DP_OP_654J1_124_416/U57  ( .A(\DP_OP_654J1_124_416/n160 ), .B(
        \DP_OP_654J1_124_416/n153 ), .C(\DP_OP_654J1_124_416/n97 ), .S(
        \DP_OP_654J1_124_416/n98 ) );
  HA1 \DP_OP_654J1_124_416/U15  ( .A(\DP_OP_654J1_124_416/n154 ), .B(
        \DP_OP_654J1_124_416/n161 ), .C(\DP_OP_654J1_124_416/n14 ) );
  QDFFRBT last_pic_out_reg_reg ( .D(n1706), .CK(clk), .RB(n3645), .Q(
        last_pic_out) );
  QDFFRBT valid_out_reg_reg ( .D(n1719), .CK(clk), .RB(n3646), .Q(valid_out)
         );
  QDFFRBT \pixel_out_reg_reg[7]  ( .D(n1718), .CK(clk), .RB(n3646), .Q(
        pixel_out[7]) );
  QDFFRBT \pixel_out_reg_reg[6]  ( .D(n1717), .CK(clk), .RB(n3646), .Q(
        pixel_out[6]) );
  QDFFRBT \pixel_out_reg_reg[5]  ( .D(n1716), .CK(clk), .RB(n3646), .Q(
        pixel_out[5]) );
  QDFFRBT \pixel_out_reg_reg[4]  ( .D(n1715), .CK(clk), .RB(n3646), .Q(
        pixel_out[4]) );
  QDFFRBT \pixel_out_reg_reg[3]  ( .D(n1714), .CK(clk), .RB(n3645), .Q(
        pixel_out[3]) );
  QDFFRBT \pixel_out_reg_reg[2]  ( .D(n1713), .CK(clk), .RB(n3645), .Q(
        pixel_out[2]) );
  QDFFRBT \pixel_out_reg_reg[1]  ( .D(n1712), .CK(clk), .RB(n3645), .Q(
        pixel_out[1]) );
  QDFFRBT \pixel_out_reg_reg[0]  ( .D(n1711), .CK(clk), .RB(n3645), .Q(
        pixel_out[0]) );
  QDFFRBT finish_reg_reg ( .D(n1708), .CK(clk), .RB(n3645), .Q(
        finish_operation) );
  QDFFRBT last_col_out_reg_reg ( .D(n1707), .CK(clk), .RB(n3687), .Q(
        last_col_out) );
  BUF1 U1820 ( .I(n3556), .O(n3567) );
  OR2 U1821 ( .I1(n2084), .I2(n2076), .O(\gain/K_mean_w [3]) );
  ND2 U1822 ( .I1(n2705), .I2(n2711), .O(\denoise/n_pixel_out_reg [1]) );
  OR2 U1823 ( .I1(n2754), .I2(n2753), .O(n2755) );
  OR2 U1824 ( .I1(n2081), .I2(n2080), .O(n2082) );
  ND2 U1825 ( .I1(n3300), .I2(\mean/b_mean_tmp [6]), .O(n3355) );
  ND2 U1826 ( .I1(n3241), .I2(\mean/r_mean_tmp [6]), .O(n3242) );
  ND2 U1827 ( .I1(n3239), .I2(\mean/r_mean_tmp [4]), .O(n3240) );
  ND2 U1828 ( .I1(n2014), .I2(n2006), .O(\denoise/n_pixel_out_reg [3]) );
  ND2 U1829 ( .I1(n3353), .I2(\mean/b_mean_tmp [4]), .O(n3354) );
  ND2 U1830 ( .I1(n3292), .I2(\mean/g_mean_tmp [4]), .O(n3293) );
  ND2 U1831 ( .I1(n3351), .I2(\mean/b_mean_tmp [2]), .O(n3352) );
  ND2 U1832 ( .I1(n3237), .I2(\mean/r_mean_tmp [2]), .O(n3238) );
  OR2 U1833 ( .I1(n2057), .I2(n2056), .O(n2058) );
  ND2 U1834 ( .I1(n3290), .I2(\mean/g_mean_tmp [2]), .O(n3291) );
  ND2 U1835 ( .I1(n3349), .I2(\mean/b_mean_tmp [0]), .O(n3350) );
  ND2 U1836 ( .I1(n3235), .I2(\mean/r_mean_tmp [0]), .O(n3236) );
  ND2 U1837 ( .I1(n2007), .I2(\denoise/n_pixel_out_reg [4]), .O(n1999) );
  ND2 U1838 ( .I1(n3347), .I2(\mean/sum_b [18]), .O(n3348) );
  ND2 U1839 ( .I1(n3389), .I2(n2457), .O(n3490) );
  ND2 U1840 ( .I1(n3288), .I2(\mean/g_mean_tmp [0]), .O(n3289) );
  ND2 U1841 ( .I1(n3233), .I2(\mean/sum_r [18]), .O(n3234) );
  ND2 U1842 ( .I1(n3286), .I2(\mean/sum_g [18]), .O(n3287) );
  ND2 U1843 ( .I1(\mean/sum_b [16]), .I2(n3345), .O(n3346) );
  ND2 U1844 ( .I1(\mean/sum_r [16]), .I2(n3231), .O(n3232) );
  ND2 U1845 ( .I1(\mean/sum_g [16]), .I2(n3284), .O(n3285) );
  ND2 U1846 ( .I1(n1994), .I2(n1987), .O(\denoise/n_pixel_out_reg [5]) );
  ND2 U1847 ( .I1(n2637), .I2(n3572), .O(n3556) );
  BUF1 U1848 ( .I(n3537), .O(n1756) );
  BUF1 U1849 ( .I(n2794), .O(n1799) );
  BUF1 U1850 ( .I(n3143), .O(n1830) );
  ND2 U1851 ( .I1(n2317), .I2(n2147), .O(n2282) );
  ND2 U1852 ( .I1(n2317), .I2(n2158), .O(n2293) );
  ND2 U1853 ( .I1(n2158), .I2(n2310), .O(n2160) );
  ND2 U1854 ( .I1(n2147), .I2(n2310), .O(n2149) );
  ND2 U1855 ( .I1(n2158), .I2(n2312), .O(n2159) );
  ND2 U1856 ( .I1(n2147), .I2(n2312), .O(n2148) );
  BUF1 U1857 ( .I(n3383), .O(n1776) );
  ND2 U1858 ( .I1(\denoise/sum9 [10]), .I2(n1970), .O(n1975) );
  ND2 U1859 ( .I1(n2316), .I2(n2310), .O(n2319) );
  ND2 U1860 ( .I1(n2317), .I2(n2316), .O(n2339) );
  BUF1 U1861 ( .I(n3431), .O(n1777) );
  ND2 U1862 ( .I1(n2316), .I2(n2312), .O(n2322) );
  ND2 U1863 ( .I1(n2317), .I2(n2145), .O(n2306) );
  ND2 U1864 ( .I1(n2145), .I2(n2310), .O(n2143) );
  BUF1 U1865 ( .I(n2733), .O(n1770) );
  ND2 U1866 ( .I1(n1751), .I2(n2638), .O(n3559) );
  ND2 U1867 ( .I1(n2145), .I2(n2312), .O(n2146) );
  BUF1 U1868 ( .I(n2734), .O(n1773) );
  ND2 U1869 ( .I1(\denoise/counter_1 [0]), .I2(n2154), .O(n2157) );
  ND2 U1870 ( .I1(\denoise/valid_count_0 [0]), .I2(n3582), .O(n2944) );
  ND2 U1871 ( .I1(n3582), .I2(n3581), .O(n2942) );
  ND2 U1872 ( .I1(n2637), .I2(\gain/state_B_r [1]), .O(n3579) );
  BUF1 U1873 ( .I(\gain/g_mean_r [0]), .O(n1748) );
  BUF1 U1874 ( .I(\gain/g_mean_r [4]), .O(n1747) );
  BUF1 U1875 ( .I(\denoise/valid_in_reg ), .O(n1769) );
  BUF1 U1876 ( .I(\denoise/n_state_1 [0]), .O(n1752) );
  BUF1 U1877 ( .I(\gain/MSB_G_r[1] ), .O(n1767) );
  BUF1 U1878 ( .I(\gain/b_mean_r [13]), .O(n1743) );
  BUF1 U1879 ( .I(\gain/b_mean_r [9]), .O(n1746) );
  BUF1 U1880 ( .I(\mean/value_r [0]), .O(n1794) );
  BUF1 U1881 ( .I(\gain/r_mean_r [4]), .O(n1749) );
  BUF1 U1882 ( .I(\gain/MSB_R_r[1] ), .O(n1768) );
  BUF1 U1883 ( .I(\gain/r_mean_r [0]), .O(n1750) );
  BUF1 U1884 ( .I(\gain/valid_r ), .O(n1751) );
  INV2 U1885 ( .I(n2042), .O(n2038) );
  ND3 U1886 ( .I1(n1989), .I2(n1988), .I3(\denoise/n_pixel_out_reg [6]), .O(
        n1991) );
  MOAI1S U1887 ( .A1(n1997), .A2(n1998), .B1(n1997), .B2(
        \denoise/n_pixel_out_reg [4]), .O(n2014) );
  ND2S U1888 ( .I1(n2693), .I2(\denoise/n_pixel_out_reg [2]), .O(n2695) );
  MOAI1S U1889 ( .A1(n1977), .A2(n1978), .B1(n1977), .B2(
        \denoise/n_pixel_out_reg [6]), .O(n1994) );
  ND2S U1890 ( .I1(n2014), .I2(n2013), .O(n2011) );
  OR3B2S U1891 ( .I1(n2447), .B1(n2446), .B2(n2445), .O(n2449) );
  OR3B2S U1892 ( .I1(n2420), .B1(n2419), .B2(n2418), .O(n2422) );
  OR3B2S U1893 ( .I1(n2628), .B1(n2627), .B2(n2626), .O(n2630) );
  ND2S U1894 ( .I1(n1988), .I2(\denoise/n_pixel_out_reg [6]), .O(n1984) );
  MOAI1S U1895 ( .A1(n2653), .A2(n2656), .B1(\gain/B_r [2]), .B2(n2652), .O(
        n2664) );
  ND2S U1896 ( .I1(\gain/b_mean_r [0]), .I2(n3570), .O(n3571) );
  ND2S U1897 ( .I1(\mean/sum_b [13]), .I2(\mean/sum_b [12]), .O(n3297) );
  AN3S U1898 ( .I1(\mean/sum_b [8]), .I2(\mean/sum_b [9]), .I3(n3332), .O(
        n3335) );
  ND2S U1899 ( .I1(\mean/sum_g [13]), .I2(\mean/sum_g [12]), .O(n3276) );
  AN3S U1900 ( .I1(\mean/sum_g [8]), .I2(\mean/sum_g [9]), .I3(n3270), .O(
        n3273) );
  ND2S U1901 ( .I1(\mean/sum_r [13]), .I2(\mean/sum_r [12]), .O(n3223) );
  AN3S U1902 ( .I1(\mean/sum_r [8]), .I2(\mean/sum_r [9]), .I3(n3217), .O(
        n3220) );
  OAI12HS U1903 ( .B1(n1975), .B2(\denoise/n_pixel_out_reg [7]), .A1(n1965), 
        .O(n1978) );
  INV1S U1904 ( .I(n1974), .O(n1965) );
  ND2S U1905 ( .I1(n1985), .I2(n1984), .O(n1990) );
  ND3 U1906 ( .I1(n2001), .I2(n2000), .I3(\denoise/n_pixel_out_reg [5]), .O(
        n2003) );
  ND3 U1907 ( .I1(n2697), .I2(n2696), .I3(\denoise/n_pixel_out_reg [3]), .O(
        n2699) );
  ND2S U1908 ( .I1(\denoise/counter_1 [0]), .I2(\denoise/counter_1 [2]), .O(
        n2161) );
  MAOI1 U1909 ( .A1(n2432), .A2(n2431), .B1(\gain/r_mean_r [9]), .B2(
        \intadd_1/B[5] ), .O(n2433) );
  ND2S U1910 ( .I1(\gain/r_mean_r [9]), .I2(\intadd_1/B[5] ), .O(n2431) );
  MAOI1 U1911 ( .A1(n2407), .A2(n2406), .B1(\gain/g_mean_r [9]), .B2(
        \intadd_2/B[5] ), .O(n2408) );
  ND2S U1912 ( .I1(\gain/g_mean_r [9]), .I2(\intadd_2/B[5] ), .O(n2406) );
  MAOI1 U1913 ( .A1(n2615), .A2(n2614), .B1(\gain/b_mean_r [9]), .B2(
        \intadd_0/B[5] ), .O(n2616) );
  ND2S U1914 ( .I1(n1746), .I2(\intadd_0/B[5] ), .O(n2614) );
  FA1S U1915 ( .A(n3524), .B(n3380), .CI(n3428), .CO(n2073), .S(n2078) );
  FA1S U1916 ( .A(n3379), .B(n3522), .CI(n3427), .CO(n2055), .S(n2074) );
  BUF1 U1917 ( .I(n2202), .O(n2145) );
  BUF1 U1918 ( .I(n2204), .O(n2147) );
  BUF1 U1919 ( .I(n2309), .O(n2316) );
  BUF1 U1920 ( .I(n2203), .O(n2158) );
  ND3 U1921 ( .I1(mode_reg[1]), .I2(mode_reg[2]), .I3(n2472), .O(n2782) );
  ND2S U1922 ( .I1(\wb/color_r [1]), .I2(\wb/color_r [0]), .O(n2679) );
  ND2S U1923 ( .I1(\gain/r_mean_r [15]), .I2(n3475), .O(n2453) );
  ND2S U1924 ( .I1(\gain/r_mean_r [11]), .I2(\intadd_1/B[7] ), .O(n2435) );
  ND2S U1925 ( .I1(n3479), .I2(n2453), .O(n2448) );
  ND2S U1926 ( .I1(\gain/r_mean_r [13]), .I2(\intadd_1/B[9] ), .O(n2439) );
  ND2S U1927 ( .I1(\gain/g_mean_r [15]), .I2(n3443), .O(n2426) );
  ND2S U1928 ( .I1(\gain/g_mean_r [11]), .I2(\intadd_2/B[7] ), .O(n2410) );
  ND2S U1929 ( .I1(n3447), .I2(n2426), .O(n2421) );
  ND2S U1930 ( .I1(\gain/g_mean_r [13]), .I2(\intadd_2/B[9] ), .O(n2412) );
  ND2S U1931 ( .I1(\gain/b_mean_r [15]), .I2(n3562), .O(n2634) );
  ND2S U1932 ( .I1(\gain/b_mean_r [11]), .I2(\intadd_0/B[7] ), .O(n2618) );
  ND2S U1933 ( .I1(n1743), .I2(\intadd_0/B[9] ), .O(n2620) );
  FA1S U1934 ( .A(n3425), .B(n3377), .CI(n3520), .CO(n2031), .S(n2050) );
  FA1S U1935 ( .A(n3376), .B(n3423), .CI(n3519), .CO(n2025), .S(n2030) );
  FA1S U1936 ( .A(n3375), .B(n3422), .CI(n3518), .CO(n2023), .S(n2026) );
  FA1S U1937 ( .A(n2074), .B(n2073), .CI(n2072), .CO(n2053), .S(n2741) );
  FA1S U1938 ( .A(n3506), .B(n3432), .CI(n3384), .CO(n2748), .S(n2752) );
  ND2S U1939 ( .I1(\denoise/n_counter_1 [2]), .I2(n2923), .O(n2936) );
  ND2S U1940 ( .I1(\denoise/n_counter_1 [1]), .I2(n2923), .O(n2921) );
  ND2S U1941 ( .I1(n2144), .I2(n2310), .O(n2183) );
  BUF1 U1942 ( .I(n2208), .O(n2201) );
  ND2S U1943 ( .I1(n2144), .I2(n2312), .O(n2188) );
  ND2S U1944 ( .I1(n2144), .I2(n2317), .O(n2295) );
  ND2S U1945 ( .I1(\denoise/n_counter_1 [2]), .I2(\denoise/n_counter_1 [0]), 
        .O(n2931) );
  ND3 U1946 ( .I1(mode_reg[0]), .I2(n2473), .I3(n2769), .O(n2778) );
  ND2S U1947 ( .I1(n1968), .I2(n1966), .O(n1967) );
  ND3 U1948 ( .I1(n1816), .I2(last_col_out_dem), .I3(color_out_dem[1]), .O(
        n2490) );
  ND2S U1949 ( .I1(n2772), .I2(color_out_mean[1]), .O(n2821) );
  BUF1 U1950 ( .I(n2502), .O(n2772) );
  ND2S U1951 ( .I1(n2772), .I2(color_out_mean[0]), .O(n2503) );
  ND2S U1952 ( .I1(n2473), .I2(n2769), .O(n2469) );
  ND2S U1953 ( .I1(\wb/valid_gain_r ), .I2(\wb/valid_value_r ), .O(n2680) );
  ND2S U1954 ( .I1(mode_reg[2]), .I2(n2472), .O(n2471) );
  ND2S U1955 ( .I1(n2662), .I2(n2661), .O(n2663) );
  ND2S U1956 ( .I1(n2669), .I2(n2668), .O(n2670) );
  ND2S U1957 ( .I1(\gain/R_r [15]), .I2(n3473), .O(n2455) );
  ND2S U1958 ( .I1(\gain/G_r [15]), .I2(n3441), .O(n2429) );
  BUF1 U1959 ( .I(n3505), .O(n3574) );
  ND2S U1960 ( .I1(\gain/B_r [15]), .I2(n3563), .O(n2636) );
  ND2S U1961 ( .I1(n3535), .I2(n3534), .O(n2399) );
  ND2S U1962 ( .I1(n3574), .I2(n3536), .O(n3534) );
  ND2S U1963 ( .I1(\gain/state_B_r [0]), .I2(n2383), .O(n3537) );
  ND2S U1964 ( .I1(n1732), .I2(\gain/N648 ), .O(n2603) );
  ND2S U1965 ( .I1(\gain/N648 ), .I2(n3590), .O(n2604) );
  ND2S U1966 ( .I1(n1946), .I2(n2813), .O(n3524) );
  ND2S U1967 ( .I1(n1947), .I2(n2807), .O(n3521) );
  ND2S U1968 ( .I1(n1793), .I2(n3591), .O(n3510) );
  ND2S U1969 ( .I1(n2637), .I2(\gain/state_B_r [1]), .O(n1888) );
  ND2S U1970 ( .I1(n2637), .I2(\gain/state_B_r [1]), .O(n1887) );
  ND2S U1971 ( .I1(n1945), .I2(n2822), .O(n3526) );
  ND2S U1972 ( .I1(\gain/counter_B_r [2]), .I2(n2404), .O(n2387) );
  ND2S U1973 ( .I1(n2381), .I2(n2398), .O(n3528) );
  ND2S U1974 ( .I1(\gain/state_G_r [0]), .I2(n2392), .O(n2494) );
  ND2S U1975 ( .I1(n2366), .I2(\gain/N456 ), .O(n2394) );
  ND2S U1976 ( .I1(n2365), .I2(n2364), .O(n2366) );
  ND2S U1977 ( .I1(n3442), .I2(n3437), .O(n3435) );
  ND2S U1978 ( .I1(n3434), .I2(n3442), .O(n2581) );
  ND2S U1979 ( .I1(\gain/g_mean_r [1]), .I2(n3465), .O(n3461) );
  ND2S U1980 ( .I1(\gain/g_mean_r [3]), .I2(n3459), .O(n3454) );
  ND2S U1981 ( .I1(n1945), .I2(n2518), .O(n3425) );
  ND2S U1982 ( .I1(\gain/state_G_r [0]), .I2(n2369), .O(n3438) );
  ND2S U1983 ( .I1(\gain/counter_G_r [2]), .I2(n2397), .O(n2496) );
  ND2S U1984 ( .I1(\gain/MSB_G_r[1] ), .I2(n3583), .O(n3414) );
  ND2S U1985 ( .I1(n1869), .I2(n3401), .O(n3419) );
  ND2S U1986 ( .I1(n1767), .I2(\gain/N478 ), .O(n3403) );
  ND2S U1987 ( .I1(n2151), .I2(n2150), .O(n3395) );
  ND2S U1988 ( .I1(n3389), .I2(n3387), .O(n3390) );
  ND2S U1989 ( .I1(\gain/state_R_r [0]), .I2(n2352), .O(n3388) );
  ND2S U1990 ( .I1(n3386), .I2(n3474), .O(n3385) );
  ND2S U1991 ( .I1(\gain/r_mean_r [1]), .I2(n3504), .O(n3499) );
  ND2S U1992 ( .I1(\gain/r_mean_r [3]), .I2(n3497), .O(n3492) );
  ND2S U1993 ( .I1(n3481), .I2(n1751), .O(n2355) );
  ND2S U1994 ( .I1(n3396), .I2(n2348), .O(n3356) );
  ND2S U1995 ( .I1(n1778), .I2(n2356), .O(n2610) );
  BUF1 U1996 ( .I(n3374), .O(n3389) );
  ND3 U1997 ( .I1(n3343), .I2(\mean/sum_b [15]), .I3(\mean/sum_b [14]), .O(
        n3299) );
  ND2S U1998 ( .I1(\mean/sum_b [12]), .I2(n3339), .O(n3340) );
  ND2S U1999 ( .I1(n1794), .I2(\mean/sum_b [0]), .O(n3302) );
  ND2S U2000 ( .I1(n3294), .I2(\mean/g_mean_tmp [6]), .O(n3295) );
  ND3 U2001 ( .I1(n3281), .I2(\mean/sum_g [15]), .I3(\mean/sum_g [14]), .O(
        n3283) );
  ND2S U2002 ( .I1(\mean/sum_g [12]), .I2(n3274), .O(n3275) );
  ND2S U2003 ( .I1(\mean/value_r [0]), .I2(\mean/sum_g [0]), .O(n3248) );
  ND3 U2004 ( .I1(n3228), .I2(\mean/sum_r [15]), .I3(\mean/sum_r [14]), .O(
        n3230) );
  ND2S U2005 ( .I1(\mean/sum_r [12]), .I2(n3221), .O(n3222) );
  ND2S U2006 ( .I1(n1794), .I2(\mean/sum_r [0]), .O(n3195) );
  ND3 U2007 ( .I1(mode_reg[1]), .I2(n2473), .I3(n2472), .O(n2773) );
  ND3 U2008 ( .I1(\denoise/state_2 [0]), .I2(\denoise/color_2 [1]), .I3(n3589), 
        .O(n2138) );
  ND3 U2009 ( .I1(\denoise/state_2 [0]), .I2(\denoise/color_2 [0]), .I3(n3585), 
        .O(n2128) );
  AN3S U2010 ( .I1(n2221), .I2(n2220), .I3(n2219), .O(n2326) );
  AN3S U2011 ( .I1(n2227), .I2(n2226), .I3(n2225), .O(n2324) );
  AN3S U2012 ( .I1(n2264), .I2(n2263), .I3(n2262), .O(n2341) );
  AN3S U2013 ( .I1(n2194), .I2(n2193), .I3(n2192), .O(n2320) );
  AN3S U2014 ( .I1(n2180), .I2(n2179), .I3(n2178), .O(n2333) );
  AN3S U2015 ( .I1(n2281), .I2(n2280), .I3(n2279), .O(n2343) );
  AN3S U2016 ( .I1(n2171), .I2(n2170), .I3(n2169), .O(n2321) );
  AN3S U2017 ( .I1(n2177), .I2(n2176), .I3(n2175), .O(n2327) );
  AN3S U2018 ( .I1(n2272), .I2(n2271), .I3(n2270), .O(n2338) );
  AN3S U2019 ( .I1(n2191), .I2(n2190), .I3(n2189), .O(n2328) );
  AN3S U2020 ( .I1(n2174), .I2(n2173), .I3(n2172), .O(n2330) );
  AN3S U2021 ( .I1(n2292), .I2(n2291), .I3(n2290), .O(n2344) );
  AN3S U2022 ( .I1(n2165), .I2(n2164), .I3(n2163), .O(n2318) );
  AN3S U2023 ( .I1(n2168), .I2(n2167), .I3(n2166), .O(n2332) );
  AN3S U2024 ( .I1(n2253), .I2(n2252), .I3(n2251), .O(n2342) );
  AN3S U2025 ( .I1(n2186), .I2(n2185), .I3(n2184), .O(n2335) );
  AN3S U2026 ( .I1(n2214), .I2(n2213), .I3(n2212), .O(n2329) );
  AN3S U2027 ( .I1(n2261), .I2(n2260), .I3(n2259), .O(n2857) );
  AN3S U2028 ( .I1(n2217), .I2(n2216), .I3(n2215), .O(n2315) );
  AN3S U2029 ( .I1(n2231), .I2(n2230), .I3(n2229), .O(n2314) );
  AN3S U2030 ( .I1(n2305), .I2(n2304), .I3(n2303), .O(n2848) );
  AN3S U2031 ( .I1(n2211), .I2(n2210), .I3(n2209), .O(n2311) );
  AN3S U2032 ( .I1(n2207), .I2(n2206), .I3(n2205), .O(n2313) );
  AN3S U2033 ( .I1(n2269), .I2(n2268), .I3(n2267), .O(n2847) );
  ND2S U2034 ( .I1(\denoise/n_counter_1 [0]), .I2(\denoise/n_counter_1 [1]), 
        .O(n2934) );
  ND2S U2035 ( .I1(n1769), .I2(n1951), .O(n2586) );
  ND2S U2036 ( .I1(n2931), .I2(n2836), .O(n2834) );
  ND2S U2037 ( .I1(\denoise/sum9 [9]), .I2(n1967), .O(n1971) );
  INV3CK U2038 ( .I(n1953), .O(color_out[0]) );
  INV3CK U2039 ( .I(n1955), .O(color_out[1]) );
  AN3S U2040 ( .I1(n2506), .I2(n2505), .I3(n2504), .O(n2508) );
  AN3S U2041 ( .I1(n2512), .I2(n2511), .I3(n2510), .O(n2514) );
  ND2S U2042 ( .I1(n2571), .I2(n1754), .O(n1122) );
  ND2S U2043 ( .I1(n3399), .I2(n3398), .O(n3400) );
  ND2S U2044 ( .I1(n2572), .I2(n3403), .O(n1196) );
  ND2S U2045 ( .I1(n2691), .I2(n2684), .O(\wb/value_tmp_2 [7]) );
  ND2S U2046 ( .I1(\C237/DATA2_7 ), .I2(n1864), .O(n2684) );
  ND2S U2047 ( .I1(n2691), .I2(n2682), .O(\wb/value_tmp_2 [6]) );
  ND2S U2048 ( .I1(\C237/DATA2_6 ), .I2(n1865), .O(n2682) );
  ND2S U2049 ( .I1(n1853), .I2(n2687), .O(\wb/value_tmp_2 [5]) );
  ND2S U2050 ( .I1(\C237/DATA2_5 ), .I2(n1864), .O(n2687) );
  ND2S U2051 ( .I1(n2691), .I2(n2685), .O(\wb/value_tmp_2 [4]) );
  ND2S U2052 ( .I1(\C237/DATA2_4 ), .I2(n1865), .O(n2685) );
  ND2S U2053 ( .I1(n2691), .I2(n2683), .O(\wb/value_tmp_2 [3]) );
  ND2S U2054 ( .I1(n2691), .I2(n2681), .O(\wb/value_tmp_2 [2]) );
  ND2S U2055 ( .I1(n1853), .I2(n2690), .O(\wb/value_tmp_2 [1]) );
  ND2S U2056 ( .I1(n1853), .I2(n2686), .O(\wb/value_tmp_2 [0]) );
  ND2S U2057 ( .I1(n2677), .I2(n2676), .O(n1092) );
  ND2S U2058 ( .I1(n2645), .I2(n2644), .O(n1091) );
  ND2S U2059 ( .I1(n2651), .I2(n2650), .O(n1090) );
  ND2S U2060 ( .I1(n2647), .I2(n2646), .O(n1089) );
  ND2S U2061 ( .I1(n2649), .I2(n2648), .O(n1088) );
  ND2S U2062 ( .I1(n2643), .I2(n2642), .O(n1087) );
  ND2S U2063 ( .I1(n2641), .I2(n2640), .O(n1086) );
  ND2S U2064 ( .I1(n2667), .I2(n2666), .O(n1081) );
  ND2S U2065 ( .I1(n1735), .I2(n2665), .O(n2666) );
  ND2S U2066 ( .I1(n2659), .I2(n2658), .O(n1080) );
  ND2S U2067 ( .I1(n1735), .I2(n2657), .O(n2658) );
  ND2S U2068 ( .I1(n2673), .I2(n2672), .O(n1079) );
  ND2S U2069 ( .I1(n1735), .I2(n2671), .O(n2672) );
  ND2S U2070 ( .I1(n2601), .I2(n2600), .O(n1136) );
  ND2S U2071 ( .I1(n2609), .I2(n2608), .O(n1137) );
  ND2S U2072 ( .I1(n1887), .I2(n1756), .O(n1721) );
  ND2S U2073 ( .I1(n2596), .I2(n2595), .O(n1131) );
  ND2S U2074 ( .I1(n2594), .I2(n2593), .O(n1135) );
  ND2S U2075 ( .I1(n3479), .I2(n3478), .O(n3480) );
  ND2S U2076 ( .I1(n3447), .I2(n3446), .O(n3448) );
  ND2S U2077 ( .I1(n3436), .I2(n3435), .O(n2393) );
  ND2S U2078 ( .I1(n2582), .I2(n2581), .O(n1177) );
  ND2S U2079 ( .I1(n3421), .I2(n3438), .O(n1723) );
  ND2S U2080 ( .I1(n2613), .I2(n2612), .O(n1187) );
  ND3 U2081 ( .I1(n3389), .I2(\gain/counter_R_r [1]), .I3(
        \gain/counter_R_r [0]), .O(n3393) );
  ND2S U2082 ( .I1(n3391), .I2(n3390), .O(n3392) );
  ND2S U2083 ( .I1(n2573), .I2(n3385), .O(n1201) );
  ND2S U2084 ( .I1(n2580), .I2(n2579), .O(n1211) );
  ND2S U2085 ( .I1(n2578), .I2(n2577), .O(n1216) );
  ND2S U2086 ( .I1(n3343), .I2(n1884), .O(n3341) );
  ND2S U2087 ( .I1(n3335), .I2(n1883), .O(n3334) );
  ND2S U2088 ( .I1(n1883), .I2(n3332), .O(n3331) );
  ND2S U2089 ( .I1(n3342), .I2(n3329), .O(n3330) );
  ND2S U2090 ( .I1(n1884), .I2(n3325), .O(n3326) );
  ND2S U2091 ( .I1(n1883), .I2(n3321), .O(n3322) );
  ND2S U2092 ( .I1(n3342), .I2(n3317), .O(n3318) );
  ND2S U2093 ( .I1(n1884), .I2(n3313), .O(n3314) );
  ND2S U2094 ( .I1(n1883), .I2(n3309), .O(n3310) );
  ND2S U2095 ( .I1(\mean/value_r [0]), .I2(n3342), .O(n3301) );
  ND2S U2096 ( .I1(n3281), .I2(n1882), .O(n3278) );
  ND2S U2097 ( .I1(n3273), .I2(n1881), .O(n3271) );
  ND2S U2098 ( .I1(n1881), .I2(n3270), .O(n3268) );
  ND2S U2099 ( .I1(n3279), .I2(n3265), .O(n3266) );
  ND2S U2100 ( .I1(n1882), .I2(n3262), .O(n3263) );
  ND2S U2101 ( .I1(n1881), .I2(n3259), .O(n3260) );
  ND2S U2102 ( .I1(n3279), .I2(n3256), .O(n3257) );
  ND2S U2103 ( .I1(n1882), .I2(n3253), .O(n3254) );
  ND2S U2104 ( .I1(n1881), .I2(n3250), .O(n3251) );
  ND2S U2105 ( .I1(n1794), .I2(n3279), .O(n3244) );
  ND3 U2106 ( .I1(n3228), .I2(\mean/sum_r [14]), .I3(n3226), .O(n3227) );
  ND2S U2107 ( .I1(n3228), .I2(n1880), .O(n3225) );
  ND2S U2108 ( .I1(n3220), .I2(n1879), .O(n3218) );
  ND2S U2109 ( .I1(n1879), .I2(n3217), .O(n3215) );
  ND2S U2110 ( .I1(n3226), .I2(n3212), .O(n3213) );
  ND2S U2111 ( .I1(n1880), .I2(n3209), .O(n3210) );
  ND2S U2112 ( .I1(n1879), .I2(n3206), .O(n3207) );
  ND2S U2113 ( .I1(n3226), .I2(n3203), .O(n3204) );
  ND2S U2114 ( .I1(n1880), .I2(n3200), .O(n3201) );
  ND2S U2115 ( .I1(n1879), .I2(n3197), .O(n3198) );
  ND2S U2116 ( .I1(n1794), .I2(n3226), .O(n3191) );
  ND2S U2117 ( .I1(\mean/last_state_r [0]), .I2(last_pic_in_mean), .O(n2768)
         );
  ND2S U2118 ( .I1(n2562), .I2(n2561), .O(n1307) );
  ND2S U2119 ( .I1(n2570), .I2(n2569), .O(n1306) );
  ND2S U2120 ( .I1(n2564), .I2(n2563), .O(n1315) );
  ND2S U2121 ( .I1(n2558), .I2(n2557), .O(n1314) );
  ND2S U2122 ( .I1(n2560), .I2(n2559), .O(n1323) );
  ND2S U2123 ( .I1(n2566), .I2(n2565), .O(n1322) );
  ND2S U2124 ( .I1(n2541), .I2(n2540), .O(n1331) );
  ND2S U2125 ( .I1(n2545), .I2(n2544), .O(n1330) );
  ND2S U2126 ( .I1(n2543), .I2(n2542), .O(n1339) );
  ND2S U2127 ( .I1(n2547), .I2(n2546), .O(n1338) );
  ND2S U2128 ( .I1(n2549), .I2(n2548), .O(n1347) );
  ND2S U2129 ( .I1(n2556), .I2(n2555), .O(n1346) );
  ND2S U2130 ( .I1(n2538), .I2(n2537), .O(n1355) );
  ND2S U2131 ( .I1(n2528), .I2(n2527), .O(n1354) );
  ND2S U2132 ( .I1(n2536), .I2(n2535), .O(n1363) );
  ND2S U2133 ( .I1(n2534), .I2(n2533), .O(n1362) );
  ND2S U2134 ( .I1(n2532), .I2(n2531), .O(n1371) );
  ND2S U2135 ( .I1(n2530), .I2(n2529), .O(n1370) );
  ND2S U2136 ( .I1(n2551), .I2(n2550), .O(n1378) );
  ND2S U2137 ( .I1(n2553), .I2(n2552), .O(n1384) );
  ND3 U2138 ( .I1(\denoise/state_2 [0]), .I2(\denoise/state_2 [1]), .I3(n3585), 
        .O(\denoise/n_color_out_reg [1]) );
  ND3 U2139 ( .I1(\denoise/state_2 [0]), .I2(\denoise/state_2 [1]), .I3(n3589), 
        .O(\denoise/n_color_out_reg [0]) );
  ND2S U2140 ( .I1(n1752), .I2(n2832), .O(n2833) );
  ND2S U2141 ( .I1(n2588), .I2(n2587), .O(n1705) );
  ND3 U2142 ( .I1(\denoise/n_state_1 [1]), .I2(n2837), .I3(
        \denoise/n_last_col_2 ), .O(n2346) );
  ND2S U2143 ( .I1(n1986), .I2(n1995), .O(n1987) );
  ND2S U2144 ( .I1(n2005), .I2(n2015), .O(n2006) );
  ND2S U2145 ( .I1(n2702), .I2(n2712), .O(n2705) );
  ND2S U2146 ( .I1(n2716), .I2(n2694), .O(n2702) );
  MOAI1S U2147 ( .A1(n2369), .A2(n2430), .B1(n3449), .B2(\gain/valid_r ), .O(
        n3433) );
  AN2 U2148 ( .I1(n2356), .I2(n2355), .O(n1733) );
  INV1S U2149 ( .I(n2825), .O(n1821) );
  INV1S U2150 ( .I(n1945), .O(n2825) );
  OR2 U2151 ( .I1(\wb/color_r [1]), .I2(n2717), .O(n1734) );
  AN2 U2152 ( .I1(n3574), .I2(n1871), .O(n1735) );
  AN2 U2153 ( .I1(n2456), .I2(n3546), .O(n1736) );
  AN2 U2154 ( .I1(n2430), .I2(n3538), .O(n1737) );
  OA12 U2155 ( .B1(n2383), .B2(n2637), .A1(n3559), .O(n1738) );
  AN2 U2156 ( .I1(\denoise/valid_count_0 [1]), .I2(n3581), .O(n1739) );
  AN2 U2157 ( .I1(n1885), .I2(n2769), .O(n1740) );
  AN2 U2158 ( .I1(n2782), .I2(n2485), .O(n1741) );
  NR2 U2159 ( .I1(n2942), .I2(n2943), .O(n1742) );
  INV1S U2160 ( .I(\gain/b_mean_r [4]), .O(n1744) );
  INV1S U2161 ( .I(n1744), .O(n1745) );
  INV1S U2162 ( .I(n2603), .O(n1753) );
  INV1S U2163 ( .I(n1753), .O(n1754) );
  INV1S U2164 ( .I(n1739), .O(n1755) );
  INV1S U2165 ( .I(n2821), .O(n1757) );
  INV1S U2166 ( .I(n1757), .O(n1758) );
  INV1S U2167 ( .I(n2944), .O(n1759) );
  INV1S U2168 ( .I(n1759), .O(n1760) );
  INV1S U2169 ( .I(n3559), .O(n1761) );
  INV1S U2170 ( .I(n3559), .O(n1762) );
  INV1S U2171 ( .I(n2639), .O(n1763) );
  INV1S U2172 ( .I(\wb/value_r [0]), .O(n1764) );
  INV1S U2173 ( .I(\wb/value_r [0]), .O(n1765) );
  INV1S U2174 ( .I(n3449), .O(n1766) );
  INV1S U2175 ( .I(n2831), .O(n1771) );
  INV1S U2176 ( .I(n1771), .O(n1772) );
  INV1S U2177 ( .I(n1734), .O(n1774) );
  INV1S U2178 ( .I(n1734), .O(n1775) );
  INV1S U2179 ( .I(n3481), .O(n1778) );
  INV1S U2180 ( .I(n3481), .O(n1779) );
  INV1S U2181 ( .I(\wb/value_r [7]), .O(n1780) );
  INV1S U2182 ( .I(\wb/value_r [6]), .O(n1781) );
  INV1S U2183 ( .I(\wb/value_r [6]), .O(n1782) );
  INV1S U2184 ( .I(\wb/value_r [5]), .O(n1783) );
  INV1S U2185 ( .I(\wb/value_r [5]), .O(n1784) );
  INV1S U2186 ( .I(\wb/value_r [4]), .O(n1785) );
  INV1S U2187 ( .I(\wb/value_r [4]), .O(n1786) );
  INV1S U2188 ( .I(\wb/value_r [3]), .O(n1787) );
  INV1S U2189 ( .I(\wb/value_r [3]), .O(n1788) );
  INV1S U2190 ( .I(\wb/value_r [2]), .O(n1789) );
  INV1S U2191 ( .I(\wb/value_r [2]), .O(n1790) );
  INV1S U2192 ( .I(\wb/value_r [1]), .O(n1791) );
  INV1S U2193 ( .I(\wb/value_r [1]), .O(n1792) );
  INV1S U2194 ( .I(n3590), .O(n1793) );
  INV1S U2195 ( .I(n1737), .O(n1795) );
  INV1S U2196 ( .I(n1737), .O(n1796) );
  INV1S U2197 ( .I(n1736), .O(n1797) );
  INV1S U2198 ( .I(n1736), .O(n1798) );
  INV1S U2199 ( .I(n1741), .O(n1800) );
  INV1S U2200 ( .I(n1741), .O(n1801) );
  INV1S U2201 ( .I(n1741), .O(n1802) );
  INV1S U2202 ( .I(n1738), .O(n1803) );
  INV1S U2203 ( .I(n1738), .O(n1804) );
  INV1S U2204 ( .I(n1738), .O(n1805) );
  INV1S U2205 ( .I(n3490), .O(n1806) );
  INV1S U2206 ( .I(n1806), .O(n1807) );
  INV1S U2207 ( .I(n1806), .O(n1808) );
  INV1S U2208 ( .I(n1735), .O(n1809) );
  INV1S U2209 ( .I(n1735), .O(n1810) );
  INV1S U2210 ( .I(n1735), .O(n1811) );
  INV1S U2211 ( .I(n1733), .O(n1812) );
  INV1S U2212 ( .I(n1733), .O(n1813) );
  INV1S U2213 ( .I(n1733), .O(n1814) );
  INV1S U2214 ( .I(n2470), .O(n1815) );
  INV1S U2215 ( .I(n1815), .O(n1816) );
  INV1S U2216 ( .I(n1815), .O(n1817) );
  INV1S U2217 ( .I(n1742), .O(n1818) );
  INV1S U2218 ( .I(n1742), .O(n1819) );
  INV1S U2219 ( .I(n1742), .O(n1820) );
  INV1S U2220 ( .I(n1821), .O(n1822) );
  INV1S U2221 ( .I(n1821), .O(n1823) );
  INV1S U2222 ( .I(n2932), .O(n1824) );
  INV1S U2223 ( .I(n1824), .O(n1825) );
  INV1S U2224 ( .I(n1824), .O(n1826) );
  INV1S U2225 ( .I(n2922), .O(n1827) );
  INV1S U2226 ( .I(n1827), .O(n1828) );
  INV1S U2227 ( .I(n1827), .O(n1829) );
  INV1S U2228 ( .I(n2930), .O(n1831) );
  INV1S U2229 ( .I(n1831), .O(n1832) );
  INV1S U2230 ( .I(n1831), .O(n1833) );
  INV1S U2231 ( .I(n2935), .O(n1834) );
  INV1S U2232 ( .I(n1834), .O(n1835) );
  INV1S U2233 ( .I(n1834), .O(n1836) );
  INV1S U2234 ( .I(n2938), .O(n1837) );
  INV1S U2235 ( .I(n1837), .O(n1838) );
  INV1S U2236 ( .I(n1837), .O(n1839) );
  INV1S U2237 ( .I(n2941), .O(n1840) );
  INV1S U2238 ( .I(n1840), .O(n1841) );
  INV1S U2239 ( .I(n1840), .O(n1842) );
  INV1S U2240 ( .I(n1760), .O(n1843) );
  INV1S U2241 ( .I(n2944), .O(n1844) );
  INV1S U2242 ( .I(n2944), .O(n1845) );
  INV1S U2243 ( .I(n1740), .O(n1846) );
  INV1S U2244 ( .I(n1740), .O(n1847) );
  INV1S U2245 ( .I(n1740), .O(n1848) );
  INV1S U2246 ( .I(n1740), .O(n1849) );
  AO222 U2247 ( .A1(n1773), .A2(\wb/K_R_r [0]), .B1(n1770), .B2(\wb/K_B_r [0]), 
        .C1(n1774), .C2(\wb/K_G_r [0]), .O(n1960) );
  INV1S U2248 ( .I(n1960), .O(n1850) );
  INV1S U2249 ( .I(n1960), .O(n1851) );
  INV1S U2250 ( .I(n3303), .O(n1852) );
  BUF1 U2251 ( .I(n2691), .O(n1853) );
  BUF1 U2252 ( .I(n2820), .O(n1854) );
  INV1S U2253 ( .I(n2719), .O(n1855) );
  INV1S U2254 ( .I(n2731), .O(n1856) );
  INV1S U2255 ( .I(n2721), .O(n1857) );
  INV1S U2256 ( .I(n2727), .O(n1858) );
  INV1S U2257 ( .I(n2729), .O(n1859) );
  INV1S U2258 ( .I(n2725), .O(n1860) );
  INV1S U2259 ( .I(n2723), .O(n1861) );
  INV1S U2260 ( .I(n2917), .O(n1862) );
  INV1S U2261 ( .I(n3586), .O(n1863) );
  ND2S U2262 ( .I1(\wb/valid_tmp ), .I2(n2679), .O(n2688) );
  INV1S U2263 ( .I(n2688), .O(n1864) );
  INV1S U2264 ( .I(n2688), .O(n1865) );
  OAI12HS U2265 ( .B1(\C237/DATA2_10 ), .B2(n2678), .A1(n1864), .O(n2691) );
  BUF1 U2266 ( .I(\gain/N303 ), .O(n1866) );
  INV1S U2267 ( .I(n3583), .O(n1867) );
  INV1S U2268 ( .I(n3593), .O(n1868) );
  INV1S U2269 ( .I(n3592), .O(n1869) );
  INV1S U2270 ( .I(n3591), .O(n1870) );
  INV1S U2271 ( .I(n3567), .O(n1871) );
  INV1S U2272 ( .I(n3567), .O(n1872) );
  INV1S U2273 ( .I(n3433), .O(n1873) );
  INV1S U2274 ( .I(n1873), .O(n1874) );
  INV1S U2275 ( .I(n1873), .O(n1875) );
  AN2 U2276 ( .I1(n3539), .I2(n3466), .O(n3469) );
  INV1S U2277 ( .I(n3469), .O(n1876) );
  INV1S U2278 ( .I(n3469), .O(n1877) );
  INV1S U2279 ( .I(n3469), .O(n1878) );
  INV1S U2280 ( .I(n3229), .O(n1879) );
  INV1S U2281 ( .I(n3229), .O(n1880) );
  ND3 U2282 ( .I1(\mean/valid_r ), .I2(n3298), .I3(n3243), .O(n3229) );
  INV1S U2283 ( .I(n3282), .O(n1881) );
  INV1S U2284 ( .I(n3282), .O(n1882) );
  ND3 U2285 ( .I1(\mean/valid_r ), .I2(\mean/color_r [0]), .I3(n3243), .O(
        n3282) );
  INV1S U2286 ( .I(n3337), .O(n1883) );
  INV1S U2287 ( .I(n3337), .O(n1884) );
  ND3 U2288 ( .I1(\mean/valid_r ), .I2(\mean/color_r [1]), .I3(n3298), .O(
        n3337) );
  INV1S U2289 ( .I(n2474), .O(n2823) );
  INV1S U2290 ( .I(n2823), .O(n1885) );
  INV1S U2291 ( .I(n2823), .O(n1886) );
  INV1S U2292 ( .I(n2918), .O(n3164) );
  INV1S U2293 ( .I(n3164), .O(n1889) );
  INV1S U2294 ( .I(n3164), .O(n1890) );
  AN2 U2295 ( .I1(n2456), .I2(\gain/state_R_r [1]), .O(n3553) );
  INV1S U2296 ( .I(n3553), .O(n1891) );
  INV1S U2297 ( .I(n3553), .O(n1892) );
  INV1S U2298 ( .I(n3553), .O(n1893) );
  INV1S U2299 ( .I(n2919), .O(n3141) );
  INV1S U2300 ( .I(n3141), .O(n1894) );
  INV1S U2301 ( .I(n3141), .O(n1895) );
  INV1S U2302 ( .I(n2920), .O(n3142) );
  INV1S U2303 ( .I(n3142), .O(n1896) );
  INV1S U2304 ( .I(n3142), .O(n1897) );
  INV1S U2305 ( .I(n2924), .O(n3144) );
  INV1S U2306 ( .I(n3144), .O(n1898) );
  INV1S U2307 ( .I(n3144), .O(n1899) );
  INV1S U2308 ( .I(n2929), .O(n3148) );
  INV1S U2309 ( .I(n3148), .O(n1900) );
  INV1S U2310 ( .I(n3148), .O(n1901) );
  INV1S U2311 ( .I(n2937), .O(n3151) );
  INV1S U2312 ( .I(n3151), .O(n1902) );
  INV1S U2313 ( .I(n3151), .O(n1903) );
  INV1S U2314 ( .I(n2933), .O(n3150) );
  INV1S U2315 ( .I(n3150), .O(n1904) );
  INV1S U2316 ( .I(n3150), .O(n1905) );
  INV1S U2317 ( .I(n2939), .O(n3152) );
  INV1S U2318 ( .I(n3152), .O(n1906) );
  INV1S U2319 ( .I(n3152), .O(n1907) );
  INV1S U2320 ( .I(n2841), .O(n3149) );
  INV1S U2321 ( .I(n3149), .O(n1908) );
  INV1S U2322 ( .I(n3149), .O(n1909) );
  INV1S U2323 ( .I(n2639), .O(n3525) );
  INV1S U2324 ( .I(n3525), .O(n1910) );
  INV1S U2325 ( .I(n3525), .O(n1911) );
  INV1S U2326 ( .I(n3525), .O(n1912) );
  INV1S U2327 ( .I(\denoise/pos9 [0]), .O(n1913) );
  INV1S U2328 ( .I(\denoise/pos9 [0]), .O(n1914) );
  INV1S U2329 ( .I(\denoise/pos9 [0]), .O(n1915) );
  INV1S U2330 ( .I(\denoise/pos9 [0]), .O(n1916) );
  INV1S U2331 ( .I(\denoise/pos9 [1]), .O(n1917) );
  INV1S U2332 ( .I(\denoise/pos9 [1]), .O(n1918) );
  INV1S U2333 ( .I(\denoise/pos9 [1]), .O(n1919) );
  INV1S U2334 ( .I(\denoise/pos9 [1]), .O(n1920) );
  INV1S U2335 ( .I(\denoise/pos9 [2]), .O(n1921) );
  INV1S U2336 ( .I(\denoise/pos9 [2]), .O(n1922) );
  INV1S U2337 ( .I(\denoise/pos9 [2]), .O(n1923) );
  INV1S U2338 ( .I(\denoise/pos9 [2]), .O(n1924) );
  INV1S U2339 ( .I(\denoise/pos9 [3]), .O(n1925) );
  INV1S U2340 ( .I(\denoise/pos9 [3]), .O(n1926) );
  INV1S U2341 ( .I(\denoise/pos9 [3]), .O(n1927) );
  INV1S U2342 ( .I(\denoise/pos9 [3]), .O(n1928) );
  INV1S U2343 ( .I(\denoise/pos9 [4]), .O(n1929) );
  INV1S U2344 ( .I(\denoise/pos9 [4]), .O(n1930) );
  INV1S U2345 ( .I(\denoise/pos9 [4]), .O(n1931) );
  INV1S U2346 ( .I(\denoise/pos9 [4]), .O(n1932) );
  INV1S U2347 ( .I(\denoise/pos9 [5]), .O(n1933) );
  INV1S U2348 ( .I(\denoise/pos9 [5]), .O(n1934) );
  INV1S U2349 ( .I(\denoise/pos9 [5]), .O(n1935) );
  INV1S U2350 ( .I(\denoise/pos9 [5]), .O(n1936) );
  INV1S U2351 ( .I(\denoise/pos9 [6]), .O(n1937) );
  INV1S U2352 ( .I(\denoise/pos9 [6]), .O(n1938) );
  INV1S U2353 ( .I(\denoise/pos9 [6]), .O(n1939) );
  INV1S U2354 ( .I(\denoise/pos9 [6]), .O(n1940) );
  INV1S U2355 ( .I(\denoise/pos9 [7]), .O(n1941) );
  INV1S U2356 ( .I(\denoise/pos9 [7]), .O(n1942) );
  INV1S U2357 ( .I(\denoise/pos9 [7]), .O(n1943) );
  INV1S U2358 ( .I(\denoise/pos9 [7]), .O(n1944) );
  INV1S U2359 ( .I(n2021), .O(n2771) );
  INV1S U2360 ( .I(n2771), .O(n1945) );
  INV1S U2361 ( .I(n2771), .O(n1946) );
  INV1S U2362 ( .I(n2771), .O(n1947) );
  INV1S U2363 ( .I(n2526), .O(n3580) );
  INV1S U2364 ( .I(n3580), .O(n1948) );
  INV1S U2365 ( .I(n3580), .O(n1949) );
  INV1S U2366 ( .I(n3580), .O(n1950) );
  INV1S U2367 ( .I(n2345), .O(n2568) );
  INV1S U2368 ( .I(n2568), .O(n1951) );
  INV1S U2369 ( .I(n2568), .O(n1952) );
  OR2 U2370 ( .I1(n1760), .I2(n2943), .O(n3153) );
  INV1S U2371 ( .I(n3153), .O(n1957) );
  INV1S U2372 ( .I(n3153), .O(n1958) );
  INV1S U2373 ( .I(n3153), .O(n1959) );
  ND3 U2374 ( .I1(\denoise/n_counter_1 [0]), .I2(n2917), .I3(n2916), .O(n2943)
         );
  AN2 U2375 ( .I1(n2757), .I2(n2756), .O(n1961) );
  AN2 U2376 ( .I1(n2083), .I2(n2738), .O(n1962) );
  AN2 U2377 ( .I1(n2059), .I2(n2063), .O(n1963) );
  AN2 U2378 ( .I1(n2039), .I2(n2038), .O(n1964) );
  FA1S U2379 ( .A(n2079), .B(n2078), .CI(n2077), .CO(n2072), .S(n2745) );
  FA1S U2380 ( .A(n2055), .B(n2054), .CI(n2053), .CO(n2048), .S(n2070) );
  FA1S U2381 ( .A(n2031), .B(n2030), .CI(n2029), .CO(n2024), .S(n2046) );
  OR2 U2382 ( .I1(n2034), .I2(n2028), .O(\gain/K_mean_w [7]) );
  NR2 U2383 ( .I1(\wb/color_r [0]), .I2(n2718), .O(n2733) );
  INV1S U2384 ( .I(n2731), .O(n2732) );
  FA1S U2385 ( .A(n3521), .B(n3426), .CI(n3378), .CO(n2049), .S(n2054) );
  BUF1 U2386 ( .I(n2200), .O(n2274) );
  BUF1 U2387 ( .I(n2203), .O(n2276) );
  BUF1 U2388 ( .I(n2204), .O(n2286) );
  BUF1 U2389 ( .I(n2208), .O(n2284) );
  BUF1 U2390 ( .I(n2200), .O(n2298) );
  ND3 U2391 ( .I1(n1981), .I2(n1980), .I3(\denoise/n_pixel_out_reg [7]), .O(
        n1982) );
  FA1S U2392 ( .A(n2026), .B(n2025), .CI(n2024), .CO(n2022), .S(n2042) );
  INV1S U2393 ( .I(\gain/K_mean_w [6]), .O(n2047) );
  INV1S U2394 ( .I(\gain/K_mean_w [2]), .O(n2746) );
  BUF1 U2395 ( .I(n2378), .O(n3424) );
  BUF1 U2396 ( .I(n3374), .O(n3474) );
  ND3 U2397 ( .I1(mode_reg[1]), .I2(mode_reg[0]), .I3(n2473), .O(n2021) );
  ND3 U2398 ( .I1(\mean/value_r [1]), .I2(\mean/value_r [0]), .I3(
        \mean/sum_b [0]), .O(n3304) );
  ND3 U2399 ( .I1(\mean/value_r [1]), .I2(n1794), .I3(\mean/sum_g [0]), .O(
        n3245) );
  ND3 U2400 ( .I1(\mean/value_r [1]), .I2(\mean/value_r [0]), .I3(
        \mean/sum_r [0]), .O(n3192) );
  MOAI1S U2401 ( .A1(n1985), .A2(n1984), .B1(n1983), .B2(n1982), .O(n1993) );
  ND3 U2402 ( .I1(n2008), .I2(n2007), .I3(\denoise/n_pixel_out_reg [4]), .O(
        n2010) );
  BUF1 U2403 ( .I(n2522), .O(n2523) );
  BUF1 U2404 ( .I(n3505), .O(n2405) );
  BUF1 U2405 ( .I(n3424), .O(n3421) );
  ND3 U2406 ( .I1(n3343), .I2(\mean/sum_b [14]), .I3(n3342), .O(n3344) );
  ND3 U2407 ( .I1(n3281), .I2(\mean/sum_g [14]), .I3(n3279), .O(n3280) );
  BUF1 U2408 ( .I(n2098), .O(n2100) );
  BUF1 U2409 ( .I(n2130), .O(n3170) );
  BUF1 U2410 ( .I(n2138), .O(n2130) );
  BUF1 U2411 ( .I(n2135), .O(n3169) );
  BUF1 U2412 ( .I(n2114), .O(n3168) );
  ND3 U2413 ( .I1(\denoise/state_2 [0]), .I2(n3589), .I3(n3585), .O(n2118) );
  BUF1 U2414 ( .I(n2183), .O(n2915) );
  BUF1 U2415 ( .I(n2282), .O(n2909) );
  BUF1 U2416 ( .I(n2188), .O(n2890) );
  BUF1 U2417 ( .I(n2183), .O(n2899) );
  BUF1 U2418 ( .I(n2159), .O(n2248) );
  BUF1 U2419 ( .I(n2155), .O(n2244) );
  BUF1 U2420 ( .I(n2339), .O(n2906) );
  BUF1 U2421 ( .I(n2295), .O(n2294) );
  ND3 U2422 ( .I1(n2838), .I2(n1862), .I3(\denoise/n_state_1 [1]), .O(n2588)
         );
  BUF1 U2423 ( .I(n2100), .O(n3645) );
  BUF1 U2424 ( .I(n2099), .O(n3643) );
  BUF1 U2425 ( .I(n2101), .O(n3639) );
  BUF1 U2426 ( .I(n2088), .O(n3631) );
  BUF1 U2427 ( .I(n3751), .O(n3662) );
  BUF1 U2428 ( .I(n3746), .O(n3659) );
  BUF1 U2429 ( .I(n2089), .O(n3656) );
  BUF1 U2430 ( .I(n2089), .O(n3654) );
  BUF1 U2431 ( .I(n2089), .O(n3652) );
  BUF1 U2432 ( .I(n2100), .O(n3650) );
  BUF1 U2433 ( .I(n2100), .O(n3648) );
  BUF1 U2434 ( .I(n2090), .O(n3611) );
  BUF1 U2435 ( .I(n2091), .O(n3608) );
  BUF1 U2436 ( .I(n2091), .O(n3606) );
  BUF1 U2437 ( .I(n2091), .O(n3604) );
  BUF1 U2438 ( .I(n3750), .O(n3749) );
  BUF1 U2439 ( .I(n3747), .O(n3598) );
  BUF1 U2440 ( .I(n3748), .O(n3597) );
  BUF1 U2441 ( .I(n2088), .O(n3628) );
  BUF1 U2442 ( .I(n2090), .O(n3625) );
  BUF1 U2443 ( .I(n2087), .O(n3623) );
  BUF1 U2444 ( .I(n2097), .O(n3619) );
  BUF1 U2445 ( .I(n3753), .O(n3710) );
  BUF1 U2446 ( .I(n2096), .O(n3708) );
  BUF1 U2447 ( .I(n3733), .O(n3706) );
  BUF1 U2448 ( .I(n3733), .O(n3734) );
  BUF1 U2449 ( .I(n3753), .O(n3735) );
  BUF1 U2450 ( .I(n3735), .O(n3702) );
  BUF1 U2451 ( .I(n3736), .O(n3699) );
  BUF1 U2452 ( .I(n3737), .O(n3697) );
  BUF1 U2453 ( .I(n2094), .O(n3729) );
  BUF1 U2454 ( .I(n2094), .O(n3727) );
  BUF1 U2455 ( .I(n2095), .O(n3725) );
  BUF1 U2456 ( .I(n2095), .O(n3723) );
  BUF1 U2457 ( .I(n3731), .O(n3721) );
  BUF1 U2458 ( .I(n2096), .O(n3718) );
  BUF1 U2459 ( .I(n3753), .O(n3717) );
  BUF1 U2460 ( .I(n3732), .O(n3714) );
  BUF1 U2461 ( .I(n3741), .O(n3679) );
  BUF1 U2462 ( .I(n3742), .O(n3678) );
  BUF1 U2463 ( .I(n3742), .O(n3676) );
  BUF1 U2464 ( .I(n3751), .O(n3673) );
  BUF1 U2465 ( .I(n3743), .O(n3670) );
  BUF1 U2466 ( .I(n2093), .O(n3669) );
  BUF1 U2467 ( .I(n2093), .O(n3667) );
  BUF1 U2468 ( .I(n3744), .O(n3666) );
  BUF1 U2469 ( .I(n3745), .O(n3743) );
  BUF1 U2470 ( .I(n3752), .O(n3695) );
  BUF1 U2471 ( .I(n3737), .O(n3693) );
  BUF1 U2472 ( .I(n3738), .O(n3691) );
  BUF1 U2473 ( .I(n3738), .O(n3689) );
  BUF1 U2474 ( .I(n3752), .O(n3740) );
  BUF1 U2475 ( .I(n3736), .O(n3685) );
  BUF1 U2476 ( .I(n3740), .O(n3683) );
  BUF1 U2477 ( .I(n3741), .O(n3681) );
  INV1S U2478 ( .I(\denoise/sum9 [8]), .O(n1966) );
  OA13S U2479 ( .B1(\denoise/sum9 [10]), .B2(\denoise/sum9 [8]), .B3(
        \denoise/sum9 [9]), .A1(\denoise/sum9 [11]), .O(n1968) );
  OA12 U2480 ( .B1(\denoise/sum9 [11]), .B2(n1966), .A1(n1967), .O(n1981) );
  INV1S U2481 ( .I(\denoise/sum9 [7]), .O(n1980) );
  OR2 U2482 ( .I1(n1967), .I2(\denoise/sum9 [9]), .O(n1970) );
  AOI13HS U2483 ( .B1(n1981), .B2(n1980), .B3(n1971), .A1(n1975), .O(n1969) );
  AN2B1S U2484 ( .I1(\denoise/sum9 [11]), .B1(n1968), .O(n1974) );
  OR2 U2485 ( .I1(n1969), .I2(n1974), .O(\denoise/n_pixel_out_reg [7]) );
  AN2 U2486 ( .I1(n1980), .I2(\denoise/n_pixel_out_reg [7]), .O(n1973) );
  AOI22S U2487 ( .A1(n1981), .A2(n1973), .B1(n1971), .B2(n1970), .O(n1977) );
  AN2B1S U2488 ( .I1(n1975), .B1(n1974), .O(n1972) );
  AOI22S U2489 ( .A1(\denoise/n_pixel_out_reg [7]), .A2(n1980), .B1(
        \denoise/sum9 [7]), .B2(n1972), .O(n1989) );
  INV1S U2490 ( .I(\denoise/sum9 [6]), .O(n1988) );
  OR2 U2491 ( .I1(n1981), .I2(n1973), .O(n1983) );
  ND3 U2492 ( .I1(n1989), .I2(n1988), .I3(n1983), .O(n1976) );
  AO12 U2493 ( .B1(n1977), .B2(n1976), .A1(n1978), .O(
        \denoise/n_pixel_out_reg [6]) );
  INV1S U2494 ( .I(\denoise/sum9 [5]), .O(n2000) );
  NR2 U2495 ( .I1(n1978), .I2(n1977), .O(n1979) );
  AOI22S U2496 ( .A1(\denoise/n_pixel_out_reg [6]), .A2(n1988), .B1(
        \denoise/sum9 [6]), .B2(n1979), .O(n2001) );
  INV1S U2497 ( .I(n1989), .O(n1985) );
  ND3 U2498 ( .I1(n2000), .I2(n2001), .I3(n1990), .O(n1986) );
  INV1S U2499 ( .I(n1993), .O(n1995) );
  AN2 U2500 ( .I1(n2000), .I2(\denoise/n_pixel_out_reg [5]), .O(n1992) );
  AOI22S U2501 ( .A1(n1992), .A2(n2001), .B1(n1991), .B2(n1990), .O(n1997) );
  AOI13HS U2502 ( .B1(\denoise/sum9 [5]), .B2(n1993), .B3(n1994), .A1(n1992), 
        .O(n2008) );
  INV1S U2503 ( .I(\denoise/sum9 [4]), .O(n2007) );
  OR2 U2504 ( .I1(n2001), .I2(n1992), .O(n2002) );
  ND3 U2505 ( .I1(n2008), .I2(n2007), .I3(n2002), .O(n1996) );
  OAI22S U2506 ( .A1(n1995), .A2(n1994), .B1(n1993), .B2(
        \denoise/n_pixel_out_reg [5]), .O(n1998) );
  AO12 U2507 ( .B1(n1997), .B2(n1996), .A1(n1998), .O(
        \denoise/n_pixel_out_reg [4]) );
  INV1S U2508 ( .I(\denoise/sum9 [3]), .O(n2696) );
  OA13S U2509 ( .B1(n1998), .B2(n1997), .B3(n2007), .A1(n1999), .O(n2697) );
  INV1S U2510 ( .I(n1999), .O(n2004) );
  OR2 U2511 ( .I1(n2008), .I2(n2004), .O(n2009) );
  ND3 U2512 ( .I1(n2696), .I2(n2697), .I3(n2009), .O(n2005) );
  AOI22S U2513 ( .A1(n2004), .A2(n2008), .B1(n2003), .B2(n2002), .O(n2015) );
  AN2 U2514 ( .I1(n2696), .I2(\denoise/n_pixel_out_reg [3]), .O(n2012) );
  AOI22S U2515 ( .A1(n2012), .A2(n2697), .B1(n2010), .B2(n2009), .O(n2704) );
  INV1S U2516 ( .I(n2015), .O(n2013) );
  MOAI1 U2517 ( .A1(\denoise/sum9 [3]), .A2(\denoise/n_pixel_out_reg [3]), 
        .B1(\denoise/sum9 [3]), .B2(n2011), .O(n2701) );
  INV1S U2518 ( .I(\denoise/sum9 [2]), .O(n2693) );
  OR2 U2519 ( .I1(n2697), .I2(n2012), .O(n2698) );
  ND3 U2520 ( .I1(n2701), .I2(n2693), .I3(n2698), .O(n2016) );
  OAI22S U2521 ( .A1(n2015), .A2(n2014), .B1(n2013), .B2(
        \denoise/n_pixel_out_reg [3]), .O(n2703) );
  AO12 U2522 ( .B1(n2704), .B2(n2016), .A1(n2703), .O(
        \denoise/n_pixel_out_reg [2]) );
  NR2 U2523 ( .I1(\gain/state_B_r [0]), .I2(\gain/state_B_r [1]), .O(n2638) );
  INV1S U2524 ( .I(\gain/b_mean_r [3]), .O(n2660) );
  INV1S U2525 ( .I(\gain/b_mean_r [2]), .O(n2652) );
  INV1S U2526 ( .I(\gain/b_mean_r [1]), .O(n3511) );
  MOAI1S U2527 ( .A1(\gain/N648 ), .A2(\gain/b_mean_r [0]), .B1(\gain/N648 ), 
        .B2(n3511), .O(n2382) );
  OA222 U2528 ( .A1(n2660), .A2(n2603), .B1(n2652), .B2(n3510), .C1(n1732), 
        .C2(n2382), .O(n3508) );
  INV1S U2529 ( .I(\gain/b_mean_r [7]), .O(n3564) );
  NR2 U2530 ( .I1(n1793), .I2(\gain/N648 ), .O(n3527) );
  MOAI1S U2531 ( .A1(n3564), .A2(n1754), .B1(n1745), .B2(n3527), .O(n2018) );
  INV1S U2532 ( .I(\gain/b_mean_r [5]), .O(n3566) );
  INV1S U2533 ( .I(n3510), .O(n2589) );
  MOAI1S U2534 ( .A1(n3566), .A2(n2604), .B1(\gain/b_mean_r [6]), .B2(n2589), 
        .O(n2017) );
  OAI12HS U2535 ( .B1(n2018), .B2(n2017), .A1(\gain/N626 ), .O(n2401) );
  OA12 U2536 ( .B1(\gain/N626 ), .B2(n3508), .A1(n2401), .O(n2381) );
  INV1S U2537 ( .I(\gain/state_B_r [0]), .O(n2637) );
  NR2 U2538 ( .I1(n2637), .I2(\gain/state_B_r [1]), .O(n2398) );
  INV1S U2539 ( .I(\gain/counter_B_r [1]), .O(n3536) );
  INV1S U2540 ( .I(\gain/counter_B_r [0]), .O(n3533) );
  NR2 U2541 ( .I1(n3536), .I2(n3533), .O(n2404) );
  INV1S U2542 ( .I(n2387), .O(n2019) );
  INV1S U2543 ( .I(n3579), .O(n3505) );
  BUF1 U2544 ( .I(n3505), .O(n3558) );
  ND3 U2545 ( .I1(n2019), .I2(\gain/counter_B_r [3]), .I3(n3558), .O(n2020) );
  ND3 U2546 ( .I1(n3559), .I2(n3528), .I3(n2020), .O(n1722) );
  INV2 U2547 ( .I(mode_reg[2]), .O(n2473) );
  INV1S U2548 ( .I(mode_reg[0]), .O(n2472) );
  INV1S U2549 ( .I(n2773), .O(n2502) );
  INV1S U2550 ( .I(n2772), .O(n2774) );
  INV1S U2551 ( .I(last_pic_in_wb), .O(n2783) );
  INV1S U2552 ( .I(n2502), .O(n2775) );
  MOAI1S U2553 ( .A1(n2774), .A2(n2783), .B1(n2775), .B2(last_pic_out_den), 
        .O(last_pic_in_mean) );
  INV1S U2554 ( .I(n2680), .O(\wb/valid_tmp ) );
  AN2 U2555 ( .I1(r_mean_out_mean[7]), .I2(n1945), .O(n3375) );
  AN2 U2556 ( .I1(g_mean_out_mean[7]), .I2(n1946), .O(n3422) );
  INV1S U2557 ( .I(b_mean_out_mean[7]), .O(n2795) );
  NR2 U2558 ( .I1(n2795), .I2(n1823), .O(n3518) );
  AN2 U2559 ( .I1(r_mean_out_mean[6]), .I2(n1947), .O(n3376) );
  AN2 U2560 ( .I1(g_mean_out_mean[6]), .I2(n1821), .O(n3423) );
  INV1S U2561 ( .I(b_mean_out_mean[6]), .O(n2801) );
  NR2 U2562 ( .I1(n2801), .I2(n1823), .O(n3519) );
  INV1S U2563 ( .I(g_mean_out_mean[5]), .O(n2518) );
  AN2 U2564 ( .I1(r_mean_out_mean[5]), .I2(n1821), .O(n3377) );
  AN2 U2565 ( .I1(b_mean_out_mean[5]), .I2(n1946), .O(n3520) );
  INV1S U2566 ( .I(b_mean_out_mean[4]), .O(n2807) );
  AN2 U2567 ( .I1(g_mean_out_mean[4]), .I2(n1946), .O(n3426) );
  OR2 U2568 ( .I1(n1822), .I2(r_mean_out_mean[4]), .O(n3378) );
  AN2 U2569 ( .I1(r_mean_out_mean[3]), .I2(n1947), .O(n3379) );
  AN2 U2570 ( .I1(b_mean_out_mean[3]), .I2(n1947), .O(n3522) );
  AN2 U2571 ( .I1(g_mean_out_mean[3]), .I2(n1945), .O(n3427) );
  INV1S U2572 ( .I(b_mean_out_mean[2]), .O(n2813) );
  OR2 U2573 ( .I1(n2825), .I2(r_mean_out_mean[2]), .O(n3380) );
  OR2 U2574 ( .I1(n2771), .I2(g_mean_out_mean[2]), .O(n3428) );
  INV1S U2575 ( .I(b_mean_out_mean[1]), .O(n2822) );
  OR2 U2576 ( .I1(n2825), .I2(g_mean_out_mean[1]), .O(n3429) );
  OR2 U2577 ( .I1(n2771), .I2(r_mean_out_mean[1]), .O(n3381) );
  AN2 U2578 ( .I1(b_mean_out_mean[0]), .I2(n1947), .O(n3506) );
  AN2 U2579 ( .I1(g_mean_out_mean[0]), .I2(n1946), .O(n3432) );
  AN2 U2580 ( .I1(r_mean_out_mean[0]), .I2(n1946), .O(n3384) );
  HA1 U2581 ( .A(n3526), .B(n3429), .C(n2079), .S(n2747) );
  HA1 U2582 ( .A(n2023), .B(n2022), .C(n2034), .S(n2033) );
  INV1S U2583 ( .I(n2033), .O(n2027) );
  NR2 U2584 ( .I1(n2027), .I2(n2038), .O(n2028) );
  AN2 U2585 ( .I1(n2042), .I2(n2046), .O(n2032) );
  OR2 U2586 ( .I1(n2033), .I2(n2032), .O(n2037) );
  INV1S U2587 ( .I(n2046), .O(n2039) );
  INV1S U2588 ( .I(n2034), .O(n2035) );
  NR2 U2589 ( .I1(n1964), .I2(n2035), .O(n2036) );
  MUX2 U2590 ( .A(n2037), .B(n2036), .S(\gain/K_mean_w [7]), .O(
        \gain/K_mean_w [6]) );
  AN2 U2591 ( .I1(n2046), .I2(n2038), .O(n2041) );
  XNR2HS U2592 ( .I1(n2042), .I2(n2046), .O(n2040) );
  MUX2 U2593 ( .A(n2041), .B(n2040), .S(\gain/K_mean_w [7]), .O(n2045) );
  INV1S U2594 ( .I(\gain/K_mean_w [7]), .O(n2043) );
  MOAI1S U2595 ( .A1(n2043), .A2(n2042), .B1(n2042), .B2(n2043), .O(n2044) );
  MUX2 U2596 ( .A(n2045), .B(n2044), .S(n2047), .O(n2060) );
  MOAI1 U2597 ( .A1(n2047), .A2(n2046), .B1(n2046), .B2(n2047), .O(n2056) );
  INV1S U2598 ( .I(n2056), .O(n2051) );
  FA1 U2599 ( .A(n2050), .B(n2049), .CI(n2048), .CO(n2029), .S(n2066) );
  INV1S U2600 ( .I(n2066), .O(n2063) );
  NR2 U2601 ( .I1(n2051), .I2(n2063), .O(n2052) );
  OR2P U2602 ( .I1(n2060), .I2(n2052), .O(\gain/K_mean_w [5]) );
  INV1S U2603 ( .I(n2070), .O(n2059) );
  AN2 U2604 ( .I1(n2066), .I2(n2070), .O(n2057) );
  INV1S U2605 ( .I(n2060), .O(n2061) );
  NR2 U2606 ( .I1(n1963), .I2(n2061), .O(n2062) );
  MUX2 U2607 ( .A(n2058), .B(n2062), .S(\gain/K_mean_w [5]), .O(
        \gain/K_mean_w [4]) );
  AN2 U2608 ( .I1(n2070), .I2(n2063), .O(n2065) );
  XNR2HS U2609 ( .I1(n2066), .I2(n2070), .O(n2064) );
  MUX2 U2610 ( .A(n2065), .B(n2064), .S(\gain/K_mean_w [5]), .O(n2069) );
  INV1S U2611 ( .I(\gain/K_mean_w [5]), .O(n2067) );
  MOAI1S U2612 ( .A1(n2067), .A2(n2066), .B1(n2066), .B2(n2067), .O(n2068) );
  INV2 U2613 ( .I(\gain/K_mean_w [4]), .O(n2071) );
  MUX2 U2614 ( .A(n2069), .B(n2068), .S(n2071), .O(n2084) );
  MOAI1 U2615 ( .A1(n2071), .A2(n2070), .B1(n2070), .B2(n2071), .O(n2080) );
  INV1S U2616 ( .I(n2080), .O(n2075) );
  INV1S U2617 ( .I(n2741), .O(n2738) );
  NR2 U2618 ( .I1(n2075), .I2(n2738), .O(n2076) );
  INV1S U2619 ( .I(n2745), .O(n2083) );
  AN2 U2620 ( .I1(n2741), .I2(n2745), .O(n2081) );
  INV1S U2621 ( .I(n2084), .O(n2085) );
  NR2 U2622 ( .I1(n1962), .I2(n2085), .O(n2086) );
  MUX2 U2623 ( .A(n2082), .B(n2086), .S(\gain/K_mean_w [3]), .O(
        \gain/K_mean_w [2]) );
  BUF1 U2624 ( .I(rst_n), .O(n3750) );
  BUF1 U2625 ( .I(n3749), .O(n2102) );
  BUF1 U2626 ( .I(rst_n), .O(n2090) );
  BUF1 U2627 ( .I(n2090), .O(n2087) );
  BUF1 U2628 ( .I(n2087), .O(n2088) );
  BUF1 U2629 ( .I(n2088), .O(n3627) );
  BUF1 U2630 ( .I(n2087), .O(n3624) );
  BUF1 U2631 ( .I(n2087), .O(n3626) );
  BUF1 U2632 ( .I(n2087), .O(n3622) );
  BUF1 U2633 ( .I(n3750), .O(n3748) );
  BUF1 U2634 ( .I(n3749), .O(n3747) );
  BUF1 U2635 ( .I(n3747), .O(n3599) );
  BUF1 U2636 ( .I(n3749), .O(n2092) );
  BUF1 U2637 ( .I(n2092), .O(n3600) );
  BUF1 U2638 ( .I(rst_n), .O(n3753) );
  BUF1 U2639 ( .I(n3753), .O(n2096) );
  BUF1 U2640 ( .I(n2096), .O(n3733) );
  BUF1 U2641 ( .I(n3733), .O(n3707) );
  BUF1 U2642 ( .I(n3735), .O(n3709) );
  BUF1 U2643 ( .I(n2096), .O(n3711) );
  BUF1 U2644 ( .I(n2096), .O(n3712) );
  BUF1 U2645 ( .I(n2090), .O(n2098) );
  BUF1 U2646 ( .I(n2098), .O(n2089) );
  BUF1 U2647 ( .I(n3654), .O(n3613) );
  BUF1 U2648 ( .I(n3611), .O(n2097) );
  BUF1 U2649 ( .I(n2097), .O(n3614) );
  BUF1 U2650 ( .I(n2100), .O(n3615) );
  BUF1 U2651 ( .I(n2088), .O(n3616) );
  BUF1 U2652 ( .I(n2097), .O(n3617) );
  BUF1 U2653 ( .I(n2097), .O(n3620) );
  BUF1 U2654 ( .I(n2088), .O(n3621) );
  BUF1 U2655 ( .I(n2090), .O(n3632) );
  BUF1 U2656 ( .I(n2087), .O(n3630) );
  BUF1 U2657 ( .I(n2088), .O(n3629) );
  BUF1 U2658 ( .I(rst_n), .O(n3751) );
  BUF1 U2659 ( .I(n3751), .O(n3745) );
  BUF1 U2660 ( .I(n3745), .O(n3663) );
  BUF1 U2661 ( .I(n3745), .O(n3661) );
  BUF1 U2662 ( .I(n3751), .O(n2093) );
  BUF1 U2663 ( .I(n2093), .O(n3660) );
  BUF1 U2664 ( .I(n2093), .O(n3746) );
  BUF1 U2665 ( .I(n3746), .O(n3658) );
  BUF1 U2666 ( .I(n3746), .O(n3657) );
  BUF1 U2667 ( .I(n2089), .O(n3653) );
  BUF1 U2668 ( .I(n2089), .O(n3651) );
  BUF1 U2669 ( .I(n2100), .O(n3649) );
  BUF1 U2670 ( .I(n2098), .O(n3655) );
  BUF1 U2671 ( .I(n2089), .O(n3612) );
  BUF1 U2672 ( .I(n2090), .O(n3610) );
  BUF1 U2673 ( .I(n2097), .O(n3609) );
  BUF1 U2674 ( .I(n3750), .O(n2091) );
  BUF1 U2675 ( .I(n2091), .O(n3607) );
  BUF1 U2676 ( .I(n2091), .O(n3605) );
  BUF1 U2677 ( .I(n3750), .O(n3603) );
  BUF1 U2678 ( .I(n2092), .O(n3602) );
  BUF1 U2679 ( .I(n2092), .O(n3601) );
  BUF1 U2680 ( .I(n3746), .O(n3744) );
  BUF1 U2681 ( .I(n3744), .O(n3742) );
  BUF1 U2682 ( .I(n3743), .O(n3675) );
  BUF1 U2683 ( .I(n2093), .O(n3674) );
  BUF1 U2684 ( .I(n3743), .O(n3672) );
  BUF1 U2685 ( .I(n2093), .O(n3668) );
  BUF1 U2686 ( .I(n3744), .O(n3665) );
  BUF1 U2687 ( .I(n3745), .O(n3664) );
  BUF1 U2688 ( .I(n3743), .O(n3671) );
  BUF1 U2689 ( .I(rst_n), .O(n3752) );
  BUF1 U2690 ( .I(n3740), .O(n3737) );
  BUF1 U2691 ( .I(n3737), .O(n3694) );
  BUF1 U2692 ( .I(n3737), .O(n3692) );
  BUF1 U2693 ( .I(n3740), .O(n3741) );
  BUF1 U2694 ( .I(n3741), .O(n3739) );
  BUF1 U2695 ( .I(n3739), .O(n3738) );
  BUF1 U2696 ( .I(n3738), .O(n3690) );
  BUF1 U2697 ( .I(n3739), .O(n3687) );
  BUF1 U2698 ( .I(n3739), .O(n3686) );
  BUF1 U2699 ( .I(n3752), .O(n3736) );
  BUF1 U2700 ( .I(n3740), .O(n3684) );
  BUF1 U2701 ( .I(n3740), .O(n3682) );
  BUF1 U2702 ( .I(n3739), .O(n3688) );
  BUF1 U2703 ( .I(n3736), .O(n3696) );
  BUF1 U2704 ( .I(n3734), .O(n3703) );
  BUF1 U2705 ( .I(n3735), .O(n3701) );
  BUF1 U2706 ( .I(n3736), .O(n3700) );
  BUF1 U2707 ( .I(n3736), .O(n3698) );
  BUF1 U2708 ( .I(n3734), .O(n3704) );
  BUF1 U2709 ( .I(rst_n), .O(n2094) );
  BUF1 U2710 ( .I(n2094), .O(n3730) );
  BUF1 U2711 ( .I(n2094), .O(n3728) );
  BUF1 U2712 ( .I(n2094), .O(n3726) );
  BUF1 U2713 ( .I(n3733), .O(n3705) );
  BUF1 U2714 ( .I(n2094), .O(n2095) );
  BUF1 U2715 ( .I(n2095), .O(n3724) );
  BUF1 U2716 ( .I(n3734), .O(n3731) );
  BUF1 U2717 ( .I(n3731), .O(n3720) );
  BUF1 U2718 ( .I(n3735), .O(n3732) );
  BUF1 U2719 ( .I(n3732), .O(n3719) );
  BUF1 U2720 ( .I(n3731), .O(n3722) );
  BUF1 U2721 ( .I(n3732), .O(n3716) );
  BUF1 U2722 ( .I(n3732), .O(n3715) );
  BUF1 U2723 ( .I(n2096), .O(n3713) );
  BUF1 U2724 ( .I(n3741), .O(n3680) );
  BUF1 U2725 ( .I(n3742), .O(n3677) );
  BUF1 U2726 ( .I(n2097), .O(n3618) );
  BUF1 U2727 ( .I(n2098), .O(n3647) );
  BUF1 U2728 ( .I(n3748), .O(n3596) );
  BUF1 U2729 ( .I(n2098), .O(n2099) );
  BUF1 U2730 ( .I(n2099), .O(n2101) );
  BUF1 U2731 ( .I(n2101), .O(n3637) );
  BUF1 U2732 ( .I(n2101), .O(n3638) );
  BUF1 U2733 ( .I(n2101), .O(n3635) );
  BUF1 U2734 ( .I(n2099), .O(n3640) );
  BUF1 U2735 ( .I(n2098), .O(n3641) );
  BUF1 U2736 ( .I(n2099), .O(n3642) );
  BUF1 U2737 ( .I(n2101), .O(n3636) );
  BUF1 U2738 ( .I(n2100), .O(n3646) );
  BUF1 U2739 ( .I(n2099), .O(n3634) );
  BUF1 U2740 ( .I(n2099), .O(n3633) );
  BUF1 U2741 ( .I(n2101), .O(n3644) );
  INV1S U2742 ( .I(mode_reg[1]), .O(n2769) );
  BUF1 U2743 ( .I(n2778), .O(n2485) );
  INV1S U2744 ( .I(last_col_in_reg), .O(n2784) );
  BUF1 U2745 ( .I(n2778), .O(n2780) );
  MOAI1S U2746 ( .A1(n2485), .A2(n2784), .B1(n2780), .B2(last_col_out_dem), 
        .O(last_col_in_den) );
  MOAI1S U2747 ( .A1(n2485), .A2(n2783), .B1(n2780), .B2(last_pic_out_dem), 
        .O(last_pic_in_den) );
  INV1S U2748 ( .I(pixel_in_wb[7]), .O(n2793) );
  MOAI1S U2749 ( .A1(n2485), .A2(n2793), .B1(n2780), .B2(pixel_out_dem[7]), 
        .O(pixel_in_den[7]) );
  INV1S U2750 ( .I(valid_value_in_wb), .O(n2785) );
  BUF1 U2751 ( .I(n2778), .O(n2779) );
  MOAI1S U2752 ( .A1(n2485), .A2(n2785), .B1(n2779), .B2(valid_out_dem), .O(
        valid_in_den) );
  BUF1 U2753 ( .I(n2118), .O(n3184) );
  INV1S U2754 ( .I(\denoise/sum6_r [5]), .O(n2103) );
  BUF1 U2755 ( .I(n2118), .O(n2114) );
  MOAI1S U2756 ( .A1(n3184), .A2(n2103), .B1(n3168), .B2(\denoise/sum3_r [5]), 
        .O(n1344) );
  BUF1 U2757 ( .I(n2128), .O(n3186) );
  INV1S U2758 ( .I(\denoise/sum6_g [5]), .O(n2104) );
  BUF1 U2759 ( .I(n2128), .O(n2135) );
  MOAI1S U2760 ( .A1(n3186), .A2(n2104), .B1(n3169), .B2(\denoise/sum3_g [5]), 
        .O(n1342) );
  BUF1 U2761 ( .I(n2138), .O(n3188) );
  INV1S U2762 ( .I(\denoise/sum6_b [5]), .O(n2105) );
  MOAI1S U2763 ( .A1(n3188), .A2(n2105), .B1(n3170), .B2(\denoise/sum3_b [5]), 
        .O(n1340) );
  BUF1 U2764 ( .I(n2114), .O(n3180) );
  INV1S U2765 ( .I(\denoise/new_sum6 [2]), .O(n2134) );
  MOAI1S U2766 ( .A1(n3180), .A2(n2134), .B1(n2118), .B2(\denoise/sum6_r [2]), 
        .O(n1369) );
  BUF1 U2767 ( .I(n2114), .O(n3185) );
  INV1S U2768 ( .I(\denoise/sum6_r [0]), .O(n2106) );
  MOAI1S U2769 ( .A1(n3185), .A2(n2106), .B1(n3184), .B2(\denoise/sum3_r [0]), 
        .O(n1382) );
  INV1S U2770 ( .I(\denoise/sum6_r [1]), .O(n2107) );
  MOAI1S U2771 ( .A1(n3180), .A2(n2107), .B1(n2114), .B2(\denoise/sum3_r [1]), 
        .O(n1376) );
  INV1S U2772 ( .I(\denoise/sum6_r [2]), .O(n2108) );
  MOAI1S U2773 ( .A1(n3180), .A2(n2108), .B1(n2118), .B2(\denoise/sum3_r [2]), 
        .O(n1368) );
  BUF1 U2774 ( .I(n2135), .O(n3187) );
  INV1S U2775 ( .I(\denoise/sum6_g [0]), .O(n2109) );
  MOAI1S U2776 ( .A1(n3187), .A2(n2109), .B1(n3186), .B2(\denoise/sum3_g [0]), 
        .O(n1380) );
  INV1S U2777 ( .I(\denoise/sum6_r [3]), .O(n2110) );
  MOAI1S U2778 ( .A1(n3185), .A2(n2110), .B1(n3168), .B2(\denoise/sum3_r [3]), 
        .O(n1360) );
  INV1S U2779 ( .I(\denoise/new_sum6 [1]), .O(n2136) );
  MOAI1S U2780 ( .A1(n3185), .A2(n2136), .B1(n2114), .B2(\denoise/sum6_r [1]), 
        .O(n1377) );
  BUF1 U2781 ( .I(n2135), .O(n3176) );
  INV1S U2782 ( .I(\denoise/sum6_g [6]), .O(n2111) );
  BUF1 U2783 ( .I(n2128), .O(n3175) );
  MOAI1S U2784 ( .A1(n3176), .A2(n2111), .B1(n3175), .B2(\denoise/sum3_g [6]), 
        .O(n1334) );
  BUF1 U2785 ( .I(n2130), .O(n3190) );
  INV1S U2786 ( .I(\denoise/sum6_b [9]), .O(n2112) );
  BUF1 U2787 ( .I(n2138), .O(n3177) );
  MOAI1S U2788 ( .A1(n3190), .A2(n2112), .B1(n3177), .B2(\denoise/sum3_b [9]), 
        .O(n1308) );
  INV1S U2789 ( .I(\denoise/sum6_g [3]), .O(n2113) );
  MOAI1S U2790 ( .A1(n3187), .A2(n2113), .B1(n3169), .B2(\denoise/sum3_g [3]), 
        .O(n1358) );
  BUF1 U2791 ( .I(n2114), .O(n3174) );
  INV1S U2792 ( .I(\denoise/sum6_r [4]), .O(n2115) );
  MOAI1S U2793 ( .A1(n3174), .A2(n2115), .B1(n3168), .B2(\denoise/sum3_r [4]), 
        .O(n1352) );
  BUF1 U2794 ( .I(n2130), .O(n3183) );
  INV1S U2795 ( .I(\denoise/sum6_b [8]), .O(n2116) );
  MOAI1S U2796 ( .A1(n3183), .A2(n2116), .B1(n3188), .B2(\denoise/sum3_b [8]), 
        .O(n1316) );
  INV1S U2797 ( .I(\denoise/sum6_g [7]), .O(n2117) );
  MOAI1S U2798 ( .A1(n3176), .A2(n2117), .B1(n3175), .B2(\denoise/sum3_g [7]), 
        .O(n1326) );
  INV1S U2799 ( .I(\denoise/sum6_r [6]), .O(n2119) );
  BUF1 U2800 ( .I(n2118), .O(n3173) );
  MOAI1S U2801 ( .A1(n3174), .A2(n2119), .B1(n3173), .B2(\denoise/sum3_r [6]), 
        .O(n1336) );
  BUF1 U2802 ( .I(n2135), .O(n3181) );
  INV1S U2803 ( .I(\denoise/sum6_g [8]), .O(n2120) );
  MOAI1S U2804 ( .A1(n3181), .A2(n2120), .B1(n3186), .B2(\denoise/sum3_g [8]), 
        .O(n1318) );
  BUF1 U2805 ( .I(n2130), .O(n3179) );
  INV1S U2806 ( .I(\denoise/sum6_b [7]), .O(n2121) );
  MOAI1S U2807 ( .A1(n3179), .A2(n2121), .B1(n3177), .B2(\denoise/sum3_b [7]), 
        .O(n1324) );
  INV1S U2808 ( .I(\denoise/sum6_r [7]), .O(n2122) );
  MOAI1S U2809 ( .A1(n3174), .A2(n2122), .B1(n3173), .B2(\denoise/sum3_r [7]), 
        .O(n1328) );
  INV1S U2810 ( .I(\denoise/sum6_g [9]), .O(n2123) );
  MOAI1S U2811 ( .A1(n3187), .A2(n2123), .B1(n3175), .B2(\denoise/sum3_g [9]), 
        .O(n1310) );
  INV1S U2812 ( .I(\denoise/sum6_g [2]), .O(n2124) );
  MOAI1S U2813 ( .A1(n3181), .A2(n2124), .B1(n2128), .B2(\denoise/sum3_g [2]), 
        .O(n1366) );
  INV1S U2814 ( .I(\denoise/sum6_b [6]), .O(n2125) );
  MOAI1S U2815 ( .A1(n3179), .A2(n2125), .B1(n3177), .B2(\denoise/sum3_b [6]), 
        .O(n1332) );
  INV1S U2816 ( .I(\denoise/sum6_b [0]), .O(n2126) );
  MOAI1S U2817 ( .A1(n3190), .A2(n2126), .B1(n3177), .B2(\denoise/sum3_b [0]), 
        .O(n1385) );
  INV1S U2818 ( .I(\denoise/sum6_r [8]), .O(n2127) );
  MOAI1S U2819 ( .A1(n3180), .A2(n2127), .B1(n3184), .B2(\denoise/sum3_r [8]), 
        .O(n1320) );
  MOAI1S U2820 ( .A1(n3181), .A2(n2134), .B1(n2128), .B2(\denoise/sum6_g [2]), 
        .O(n1367) );
  MOAI1S U2821 ( .A1(n3190), .A2(n2136), .B1(n2130), .B2(\denoise/sum6_b [1]), 
        .O(n1373) );
  INV1S U2822 ( .I(\denoise/sum6_g [1]), .O(n2129) );
  MOAI1S U2823 ( .A1(n3181), .A2(n2129), .B1(n2135), .B2(\denoise/sum3_g [1]), 
        .O(n1374) );
  INV1S U2824 ( .I(\denoise/sum6_b [1]), .O(n2131) );
  MOAI1S U2825 ( .A1(n3183), .A2(n2131), .B1(n2130), .B2(\denoise/sum3_b [1]), 
        .O(n1372) );
  INV1S U2826 ( .I(\denoise/sum6_b [4]), .O(n2132) );
  MOAI1S U2827 ( .A1(n3179), .A2(n2132), .B1(n3170), .B2(\denoise/sum3_b [4]), 
        .O(n1348) );
  INV1S U2828 ( .I(\denoise/sum6_r [9]), .O(n2133) );
  MOAI1S U2829 ( .A1(n3185), .A2(n2133), .B1(n3173), .B2(\denoise/sum3_r [9]), 
        .O(n1312) );
  MOAI1S U2830 ( .A1(n3183), .A2(n2134), .B1(n2138), .B2(\denoise/sum6_b [2]), 
        .O(n1365) );
  MOAI1S U2831 ( .A1(n3187), .A2(n2136), .B1(n2135), .B2(\denoise/sum6_g [1]), 
        .O(n1375) );
  INV1S U2832 ( .I(\denoise/sum6_b [3]), .O(n2137) );
  MOAI1S U2833 ( .A1(n3190), .A2(n2137), .B1(n3170), .B2(\denoise/sum3_b [3]), 
        .O(n1356) );
  INV1S U2834 ( .I(\denoise/sum6_b [2]), .O(n2139) );
  MOAI1S U2835 ( .A1(n3183), .A2(n2139), .B1(n2138), .B2(\denoise/sum3_b [2]), 
        .O(n1364) );
  INV1S U2836 ( .I(\denoise/sum6_g [4]), .O(n2140) );
  MOAI1S U2837 ( .A1(n3176), .A2(n2140), .B1(n3169), .B2(\denoise/sum3_g [4]), 
        .O(n1350) );
  INV1S U2838 ( .I(\gain/state_G_r [1]), .O(n2392) );
  NR2 U2839 ( .I1(\gain/state_G_r [0]), .I2(n2392), .O(n2427) );
  INV1S U2840 ( .I(n2427), .O(n2378) );
  BUF1 U2841 ( .I(n3424), .O(n3467) );
  INV1S U2842 ( .I(\gain/K_G_tmp [6]), .O(n3541) );
  MOAI1S U2843 ( .A1(n3467), .A2(n3541), .B1(n2378), .B2(\gain/K_G_tmp [7]), 
        .O(n1110) );
  INV1S U2844 ( .I(\gain/K_G_tmp [10]), .O(n3544) );
  MOAI1S U2845 ( .A1(n3467), .A2(n3544), .B1(n2378), .B2(\gain/K_G_tmp [11]), 
        .O(n1106) );
  INV1S U2846 ( .I(\gain/K_G_tmp [4]), .O(n3540) );
  MOAI1S U2847 ( .A1(n3467), .A2(n3540), .B1(n2378), .B2(\gain/K_G_tmp [5]), 
        .O(n1112) );
  INV1S U2848 ( .I(\gain/K_G_tmp [8]), .O(n3542) );
  MOAI1S U2849 ( .A1(n3467), .A2(n3542), .B1(n2378), .B2(\gain/K_G_tmp [9]), 
        .O(n1108) );
  NR2 U2850 ( .I1(\denoise/counter_1 [1]), .I2(n2161), .O(n2144) );
  NR2 U2851 ( .I1(\denoise/n_color_2 [0]), .I2(\denoise/n_color_2 [1]), .O(
        n2317) );
  BUF1 U2852 ( .I(n2295), .O(n2858) );
  MOAI1S U2853 ( .A1(n2858), .A2(n1913), .B1(n2294), .B2(
        \denoise/second_col_r[5][0] ), .O(n1696) );
  INV1S U2854 ( .I(\denoise/valid_count_0 [1]), .O(n3582) );
  INV1S U2855 ( .I(\denoise/valid_count_0 [0]), .O(n3581) );
  NR2 U2856 ( .I1(n3582), .I2(n3581), .O(n2525) );
  INV1S U2857 ( .I(n2525), .O(n2539) );
  BUF1 U2858 ( .I(n2539), .O(n2141) );
  BUF1 U2859 ( .I(n2141), .O(n2882) );
  MOAI1S U2860 ( .A1(n2882), .A2(n1941), .B1(n2141), .B2(
        \denoise/pixel_in_reg [7]), .O(n1438) );
  MOAI1S U2861 ( .A1(n2882), .A2(n1917), .B1(n2539), .B2(
        \denoise/pixel_in_reg [1]), .O(n1660) );
  MOAI1S U2862 ( .A1(n2882), .A2(n1914), .B1(n2141), .B2(
        \denoise/pixel_in_reg [0]), .O(n1697) );
  BUF1 U2863 ( .I(n2141), .O(n2883) );
  MOAI1S U2864 ( .A1(n2883), .A2(n1937), .B1(n2141), .B2(
        \denoise/pixel_in_reg [6]), .O(n1475) );
  MOAI1S U2865 ( .A1(n2883), .A2(n1933), .B1(n2141), .B2(
        \denoise/pixel_in_reg [5]), .O(n1512) );
  NR3 U2866 ( .I1(\denoise/counter_1 [0]), .I2(\denoise/counter_1 [2]), .I3(
        \denoise/counter_1 [1]), .O(n2202) );
  BUF1 U2867 ( .I(n2306), .O(n2863) );
  BUF1 U2868 ( .I(n2306), .O(n2265) );
  MOAI1S U2869 ( .A1(n2863), .A2(n1915), .B1(n2265), .B2(
        \denoise/second_col_r[0][0] ), .O(n1691) );
  INV1S U2870 ( .I(\gain/state_R_r [0]), .O(n2456) );
  INV1S U2871 ( .I(n1891), .O(n3374) );
  BUF1 U2872 ( .I(n3374), .O(n2142) );
  INV1S U2873 ( .I(\gain/K_R_tmp [1]), .O(n3547) );
  MOAI1S U2874 ( .A1(n2142), .A2(n3547), .B1(n3553), .B2(\gain/K_R_tmp [0]), 
        .O(n1104) );
  INV1S U2875 ( .I(\gain/K_R_tmp [3]), .O(n3548) );
  MOAI1S U2876 ( .A1(n2142), .A2(n3548), .B1(n2142), .B2(\gain/K_R_tmp [2]), 
        .O(n1102) );
  INV1S U2877 ( .I(\gain/K_R_tmp [8]), .O(n3551) );
  MOAI1S U2878 ( .A1(n2142), .A2(n3551), .B1(n3553), .B2(\gain/K_R_tmp [7]), 
        .O(n1097) );
  INV1S U2879 ( .I(\gain/K_R_tmp [5]), .O(n3549) );
  MOAI1S U2880 ( .A1(n2142), .A2(n3549), .B1(n2142), .B2(\gain/K_R_tmp [4]), 
        .O(n1100) );
  BUF1 U2881 ( .I(n3374), .O(n3550) );
  INV1S U2882 ( .I(\gain/K_R_tmp [10]), .O(n3552) );
  MOAI1S U2883 ( .A1(n3550), .A2(n3552), .B1(n3374), .B2(\gain/K_R_tmp [9]), 
        .O(n1095) );
  INV1S U2884 ( .I(\denoise/n_color_2 [1]), .O(n2845) );
  NR2 U2885 ( .I1(\denoise/n_color_2 [0]), .I2(n2845), .O(n2310) );
  BUF1 U2886 ( .I(n2143), .O(n2873) );
  BUF1 U2887 ( .I(n2143), .O(n2237) );
  MOAI1S U2888 ( .A1(n2873), .A2(n1916), .B1(n2237), .B2(
        \denoise/second_col_b[0][0] ), .O(n1672) );
  BUF1 U2889 ( .I(n2183), .O(n2881) );
  BUF1 U2890 ( .I(n2183), .O(n2250) );
  MOAI1S U2891 ( .A1(n2881), .A2(n1913), .B1(n2250), .B2(
        \denoise/second_col_b[5][0] ), .O(n1667) );
  BUF1 U2892 ( .I(n2143), .O(n2195) );
  BUF1 U2893 ( .I(n2143), .O(n2853) );
  MOAI1S U2894 ( .A1(n2195), .A2(n1942), .B1(n2853), .B2(
        \denoise/second_col_b[0][7] ), .O(n1413) );
  BUF1 U2895 ( .I(n2143), .O(n2874) );
  BUF1 U2896 ( .I(n2143), .O(n2236) );
  MOAI1S U2897 ( .A1(n2874), .A2(n1921), .B1(n2236), .B2(
        \denoise/second_col_b[0][2] ), .O(n1598) );
  MOAI1S U2898 ( .A1(n2195), .A2(n1938), .B1(n2853), .B2(
        \denoise/second_col_b[0][6] ), .O(n1450) );
  MOAI1S U2899 ( .A1(n2874), .A2(n1929), .B1(n2236), .B2(
        \denoise/second_col_b[0][4] ), .O(n1524) );
  MOAI1S U2900 ( .A1(n2195), .A2(n1934), .B1(n2236), .B2(
        \denoise/second_col_b[0][5] ), .O(n1487) );
  INV1S U2901 ( .I(\denoise/n_color_2 [0]), .O(n2844) );
  NR2 U2902 ( .I1(\denoise/n_color_2 [1]), .I2(n2844), .O(n2312) );
  BUF1 U2903 ( .I(n2188), .O(n2872) );
  BUF1 U2904 ( .I(n2188), .O(n2235) );
  MOAI1S U2905 ( .A1(n2872), .A2(n1914), .B1(n2235), .B2(
        \denoise/second_col_g[5][0] ), .O(n1679) );
  BUF1 U2906 ( .I(n2146), .O(n2864) );
  BUF1 U2907 ( .I(n2146), .O(n2238) );
  MOAI1S U2908 ( .A1(n2864), .A2(n1915), .B1(n2238), .B2(
        \denoise/second_col_g[0][0] ), .O(n1684) );
  BUF1 U2909 ( .I(n2146), .O(n2181) );
  BUF1 U2910 ( .I(n2146), .O(n2239) );
  MOAI1S U2911 ( .A1(n2181), .A2(n1935), .B1(n2239), .B2(
        \denoise/second_col_g[0][5] ), .O(n1499) );
  BUF1 U2912 ( .I(n2146), .O(n2849) );
  MOAI1S U2913 ( .A1(n2181), .A2(n1943), .B1(n2849), .B2(
        \denoise/second_col_g[0][7] ), .O(n1425) );
  BUF1 U2914 ( .I(n2146), .O(n2865) );
  MOAI1S U2915 ( .A1(n2865), .A2(n1922), .B1(n2239), .B2(
        \denoise/second_col_g[0][2] ), .O(n1610) );
  MOAI1S U2916 ( .A1(n2865), .A2(n1930), .B1(n2239), .B2(
        \denoise/second_col_g[0][4] ), .O(n1536) );
  MOAI1S U2917 ( .A1(n2181), .A2(n1939), .B1(n2849), .B2(
        \denoise/second_col_g[0][6] ), .O(n1462) );
  INV1S U2918 ( .I(\gain/K_B_tmp [8]), .O(n3577) );
  MOAI1S U2919 ( .A1(n2405), .A2(n3577), .B1(n2405), .B2(\gain/K_B_tmp [7]), 
        .O(n1069) );
  INV1S U2920 ( .I(\gain/K_B_tmp [6]), .O(n3576) );
  MOAI1S U2921 ( .A1(n2405), .A2(n3576), .B1(n3505), .B2(\gain/K_B_tmp [5]), 
        .O(n1071) );
  BUF1 U2922 ( .I(n3505), .O(n3573) );
  INV1S U2923 ( .I(\gain/K_B_tmp [10]), .O(n3578) );
  MOAI1S U2924 ( .A1(n3573), .A2(n3578), .B1(n2405), .B2(\gain/K_B_tmp [9]), 
        .O(n1067) );
  INV1S U2925 ( .I(\gain/K_B_tmp [4]), .O(n3575) );
  MOAI1S U2926 ( .A1(n3573), .A2(n3575), .B1(n2405), .B2(\gain/K_B_tmp [3]), 
        .O(n1073) );
  INV1S U2927 ( .I(\denoise/counter_1 [2]), .O(n2154) );
  NR2 U2928 ( .I1(\denoise/counter_1 [1]), .I2(n2157), .O(n2204) );
  BUF1 U2929 ( .I(n2148), .O(n2866) );
  BUF1 U2930 ( .I(n2148), .O(n2228) );
  MOAI1S U2931 ( .A1(n2866), .A2(n1916), .B1(n2228), .B2(
        \denoise/second_col_g[1][0] ), .O(n1683) );
  BUF1 U2932 ( .I(n2149), .O(n2875) );
  BUF1 U2933 ( .I(n2149), .O(n2241) );
  MOAI1S U2934 ( .A1(n2875), .A2(n1913), .B1(n2241), .B2(
        \denoise/second_col_b[1][0] ), .O(n1671) );
  BUF1 U2935 ( .I(n2282), .O(n2862) );
  BUF1 U2936 ( .I(n2282), .O(n2307) );
  MOAI1S U2937 ( .A1(n2862), .A2(n1914), .B1(n2307), .B2(
        \denoise/second_col_r[1][0] ), .O(n1692) );
  BUF1 U2938 ( .I(n2148), .O(n2867) );
  BUF1 U2939 ( .I(n2148), .O(n2249) );
  MOAI1S U2940 ( .A1(n2867), .A2(n1923), .B1(n2249), .B2(
        \denoise/second_col_g[1][2] ), .O(n1609) );
  BUF1 U2941 ( .I(n2149), .O(n2876) );
  BUF1 U2942 ( .I(n2149), .O(n2234) );
  MOAI1S U2943 ( .A1(n2876), .A2(n1924), .B1(n2234), .B2(
        \denoise/second_col_b[1][2] ), .O(n1597) );
  MOAI1S U2944 ( .A1(n2867), .A2(n1931), .B1(n2249), .B2(
        \denoise/second_col_g[1][4] ), .O(n1535) );
  BUF1 U2945 ( .I(n2148), .O(n2182) );
  MOAI1S U2946 ( .A1(n2182), .A2(n1936), .B1(n2249), .B2(
        \denoise/second_col_g[1][5] ), .O(n1498) );
  BUF1 U2947 ( .I(n2149), .O(n2196) );
  MOAI1S U2948 ( .A1(n2196), .A2(n1933), .B1(n2234), .B2(
        \denoise/second_col_b[1][5] ), .O(n1486) );
  BUF1 U2949 ( .I(n2148), .O(n2850) );
  MOAI1S U2950 ( .A1(n2182), .A2(n1940), .B1(n2850), .B2(
        \denoise/second_col_g[1][6] ), .O(n1461) );
  BUF1 U2951 ( .I(n2149), .O(n2854) );
  MOAI1S U2952 ( .A1(n2196), .A2(n1944), .B1(n2854), .B2(
        \denoise/second_col_b[1][7] ), .O(n1412) );
  MOAI1S U2953 ( .A1(n2196), .A2(n1937), .B1(n2854), .B2(
        \denoise/second_col_b[1][6] ), .O(n1449) );
  MOAI1S U2954 ( .A1(n2876), .A2(n1932), .B1(n2234), .B2(
        \denoise/second_col_b[1][4] ), .O(n1523) );
  MOAI1S U2955 ( .A1(n2182), .A2(n1941), .B1(n2850), .B2(
        \denoise/second_col_g[1][7] ), .O(n1424) );
  NR2 U2956 ( .I1(\gain/state_R_r [0]), .I2(\gain/state_R_r [1]), .O(n3481) );
  NR2 U2957 ( .I1(\gain/state_R_r [1]), .I2(n2456), .O(n3396) );
  NR2 U2958 ( .I1(\gain/N325 ), .I2(n3584), .O(n2353) );
  NR2 U2959 ( .I1(n3584), .I2(n3586), .O(n3362) );
  AOI22S U2960 ( .A1(\gain/r_mean_r [6]), .A2(n2353), .B1(\gain/r_mean_r [7]), 
        .B2(n3362), .O(n2151) );
  NR2 U2961 ( .I1(\gain/MSB_R_r[1] ), .I2(n3586), .O(n3361) );
  NR2 U2962 ( .I1(n1768), .I2(\gain/N325 ), .O(n2500) );
  AOI22S U2963 ( .A1(\gain/r_mean_r [5]), .A2(n3361), .B1(n1749), .B2(n2500), 
        .O(n2150) );
  INV1S U2964 ( .I(n2353), .O(n3369) );
  INV1S U2965 ( .I(\gain/r_mean_r [2]), .O(n3360) );
  INV1S U2966 ( .I(\gain/r_mean_r [1]), .O(n3498) );
  MOAI1S U2967 ( .A1(\gain/N325 ), .A2(\gain/r_mean_r [0]), .B1(\gain/N325 ), 
        .B2(n3498), .O(n2361) );
  INV1S U2968 ( .I(\gain/r_mean_r [3]), .O(n3491) );
  INV1S U2969 ( .I(n3362), .O(n3359) );
  OAI222S U2970 ( .A1(n3369), .A2(n3360), .B1(n1768), .B2(n2361), .C1(n3491), 
        .C2(n3359), .O(n3368) );
  AOI22S U2971 ( .A1(\gain/N303 ), .A2(n3395), .B1(n3368), .B2(n3587), .O(
        n2348) );
  ND3 U2972 ( .I1(\gain/counter_R_r [2]), .I2(\gain/counter_R_r [1]), .I3(
        \gain/counter_R_r [0]), .O(n2350) );
  INV1S U2973 ( .I(n2350), .O(n2152) );
  ND3 U2974 ( .I1(n2152), .I2(\gain/counter_R_r [3]), .I3(n3474), .O(n2153) );
  ND3 U2975 ( .I1(n2355), .I2(n3356), .I3(n2153), .O(n1728) );
  NR2 U2976 ( .I1(\denoise/counter_1 [0]), .I2(n2154), .O(n2208) );
  BUF1 U2977 ( .I(n2208), .O(n2266) );
  INV1S U2978 ( .I(\denoise/counter_1 [1]), .O(n2162) );
  ND3 U2979 ( .I1(n2317), .I2(n2266), .I3(n2162), .O(n2283) );
  BUF1 U2980 ( .I(n2283), .O(n2859) );
  BUF1 U2981 ( .I(n2283), .O(n2308) );
  MOAI1S U2982 ( .A1(n2859), .A2(n1915), .B1(n2308), .B2(
        \denoise/second_col_r[4][0] ), .O(n1695) );
  ND3 U2983 ( .I1(n2201), .I2(n2310), .I3(n2162), .O(n2155) );
  BUF1 U2984 ( .I(n2155), .O(n2222) );
  MOAI1S U2985 ( .A1(n2244), .A2(n1916), .B1(n2222), .B2(
        \denoise/second_col_b[4][0] ), .O(n1668) );
  BUF1 U2986 ( .I(n2155), .O(n2243) );
  MOAI1S U2987 ( .A1(n2244), .A2(n1918), .B1(n2243), .B2(
        \denoise/second_col_b[4][1] ), .O(n1631) );
  BUF1 U2988 ( .I(n2155), .O(n2199) );
  BUF1 U2989 ( .I(n2155), .O(n2218) );
  MOAI1S U2990 ( .A1(n2199), .A2(n1934), .B1(n2218), .B2(
        \denoise/second_col_b[4][5] ), .O(n1483) );
  BUF1 U2991 ( .I(n2155), .O(n2223) );
  MOAI1S U2992 ( .A1(n2223), .A2(n1929), .B1(n2218), .B2(
        \denoise/second_col_b[4][4] ), .O(n1520) );
  MOAI1S U2993 ( .A1(n2223), .A2(n1925), .B1(n2244), .B2(
        \denoise/second_col_b[4][3] ), .O(n1557) );
  MOAI1S U2994 ( .A1(n2223), .A2(n1921), .B1(n2218), .B2(
        \denoise/second_col_b[4][2] ), .O(n1594) );
  MOAI1S U2995 ( .A1(n2199), .A2(n1942), .B1(n2243), .B2(
        \denoise/second_col_b[4][7] ), .O(n1409) );
  MOAI1S U2996 ( .A1(n2199), .A2(n1938), .B1(n2243), .B2(
        \denoise/second_col_b[4][6] ), .O(n1446) );
  ND3 U2997 ( .I1(n2201), .I2(n2312), .I3(n2162), .O(n2156) );
  BUF1 U2998 ( .I(n2156), .O(n2246) );
  BUF1 U2999 ( .I(n2156), .O(n2232) );
  MOAI1S U3000 ( .A1(n2246), .A2(n1913), .B1(n2232), .B2(
        \denoise/second_col_g[4][0] ), .O(n1680) );
  BUF1 U3001 ( .I(n2156), .O(n2245) );
  MOAI1S U3002 ( .A1(n2246), .A2(n1919), .B1(n2245), .B2(
        \denoise/second_col_g[4][1] ), .O(n1643) );
  BUF1 U3003 ( .I(n2156), .O(n2187) );
  MOAI1S U3004 ( .A1(n2187), .A2(n1939), .B1(n2245), .B2(
        \denoise/second_col_g[4][6] ), .O(n1458) );
  MOAI1S U3005 ( .A1(n2187), .A2(n1943), .B1(n2245), .B2(
        \denoise/second_col_g[4][7] ), .O(n1421) );
  BUF1 U3006 ( .I(n2156), .O(n2233) );
  BUF1 U3007 ( .I(n2156), .O(n2240) );
  MOAI1S U3008 ( .A1(n2233), .A2(n1922), .B1(n2240), .B2(
        \denoise/second_col_g[4][2] ), .O(n1606) );
  MOAI1S U3009 ( .A1(n2233), .A2(n1926), .B1(n2246), .B2(
        \denoise/second_col_g[4][3] ), .O(n1569) );
  MOAI1S U3010 ( .A1(n2233), .A2(n1930), .B1(n2240), .B2(
        \denoise/second_col_g[4][4] ), .O(n1532) );
  MOAI1S U3011 ( .A1(n2187), .A2(n1935), .B1(n2240), .B2(
        \denoise/second_col_g[4][5] ), .O(n1495) );
  NR2 U3012 ( .I1(n2162), .I2(n2157), .O(n2203) );
  BUF1 U3013 ( .I(n2159), .O(n2870) );
  BUF1 U3014 ( .I(n2159), .O(n2247) );
  MOAI1S U3015 ( .A1(n2870), .A2(n1914), .B1(n2247), .B2(
        \denoise/second_col_g[3][0] ), .O(n1681) );
  BUF1 U3016 ( .I(n2160), .O(n2879) );
  BUF1 U3017 ( .I(n2160), .O(n2242) );
  MOAI1S U3018 ( .A1(n2879), .A2(n1915), .B1(n2242), .B2(
        \denoise/second_col_b[3][0] ), .O(n1669) );
  BUF1 U3019 ( .I(n2293), .O(n2860) );
  BUF1 U3020 ( .I(n2293), .O(n2296) );
  MOAI1S U3021 ( .A1(n2860), .A2(n1916), .B1(n2296), .B2(
        \denoise/second_col_r[3][0] ), .O(n1694) );
  BUF1 U3022 ( .I(n2160), .O(n2198) );
  BUF1 U3023 ( .I(n2160), .O(n2856) );
  MOAI1S U3024 ( .A1(n2198), .A2(n1940), .B1(n2856), .B2(
        \denoise/second_col_b[3][6] ), .O(n1447) );
  BUF1 U3025 ( .I(n2159), .O(n2197) );
  BUF1 U3026 ( .I(n2159), .O(n2852) );
  MOAI1S U3027 ( .A1(n2197), .A2(n1944), .B1(n2852), .B2(
        \denoise/second_col_g[3][7] ), .O(n1422) );
  MOAI1S U3028 ( .A1(n2197), .A2(n1937), .B1(n2852), .B2(
        \denoise/second_col_g[3][6] ), .O(n1459) );
  BUF1 U3029 ( .I(n2159), .O(n2871) );
  MOAI1S U3030 ( .A1(n2871), .A2(n1923), .B1(n2248), .B2(
        \denoise/second_col_g[3][2] ), .O(n1607) );
  BUF1 U3031 ( .I(n2160), .O(n2880) );
  BUF1 U3032 ( .I(n2160), .O(n2224) );
  MOAI1S U3033 ( .A1(n2880), .A2(n1924), .B1(n2224), .B2(
        \denoise/second_col_b[3][2] ), .O(n1595) );
  MOAI1S U3034 ( .A1(n2197), .A2(n1936), .B1(n2248), .B2(
        \denoise/second_col_g[3][5] ), .O(n1496) );
  MOAI1S U3035 ( .A1(n2198), .A2(n1941), .B1(n2856), .B2(
        \denoise/second_col_b[3][7] ), .O(n1410) );
  MOAI1S U3036 ( .A1(n2880), .A2(n1931), .B1(n2224), .B2(
        \denoise/second_col_b[3][4] ), .O(n1521) );
  MOAI1S U3037 ( .A1(n2198), .A2(n1933), .B1(n2224), .B2(
        \denoise/second_col_b[3][5] ), .O(n1484) );
  MOAI1S U3038 ( .A1(n2871), .A2(n1932), .B1(n2248), .B2(
        \denoise/second_col_g[3][4] ), .O(n1533) );
  BUF1 U3039 ( .I(n2183), .O(n2891) );
  INV1S U3040 ( .I(n2161), .O(n2200) );
  BUF1 U3041 ( .I(n2200), .O(n2254) );
  AOI22S U3042 ( .A1(n2254), .A2(\denoise/second_col_b[5][3] ), .B1(n2284), 
        .B2(\denoise/second_col_b[4][3] ), .O(n2165) );
  BUF1 U3043 ( .I(n2202), .O(n2289) );
  NR3 U3044 ( .I1(\denoise/counter_1 [0]), .I2(\denoise/counter_1 [2]), .I3(
        n2162), .O(n2309) );
  BUF1 U3045 ( .I(n2309), .O(n2288) );
  AOI22S U3046 ( .A1(n2289), .A2(\denoise/second_col_b[0][3] ), .B1(n2288), 
        .B2(\denoise/second_col_b[2][3] ), .O(n2164) );
  BUF1 U3047 ( .I(n2203), .O(n2287) );
  AOI22S U3048 ( .A1(n2287), .A2(\denoise/second_col_b[3][3] ), .B1(n2286), 
        .B2(\denoise/second_col_b[1][3] ), .O(n2163) );
  MOAI1S U3049 ( .A1(n2891), .A2(n2318), .B1(n2899), .B2(
        \denoise/first_col_b[5][3] ), .O(n1550) );
  AOI22S U3050 ( .A1(n2254), .A2(\denoise/second_col_g[5][3] ), .B1(n2284), 
        .B2(\denoise/second_col_g[4][3] ), .O(n2168) );
  BUF1 U3051 ( .I(n2202), .O(n2258) );
  BUF1 U3052 ( .I(n2309), .O(n2257) );
  AOI22S U3053 ( .A1(n2258), .A2(\denoise/second_col_g[0][3] ), .B1(n2257), 
        .B2(\denoise/second_col_g[2][3] ), .O(n2167) );
  BUF1 U3054 ( .I(n2203), .O(n2256) );
  BUF1 U3055 ( .I(n2204), .O(n2255) );
  AOI22S U3056 ( .A1(n2256), .A2(\denoise/second_col_g[3][3] ), .B1(n2255), 
        .B2(\denoise/second_col_g[1][3] ), .O(n2166) );
  BUF1 U3057 ( .I(n2188), .O(n2898) );
  MOAI1S U3058 ( .A1(n2890), .A2(n2332), .B1(n2898), .B2(
        \denoise/first_col_g[5][3] ), .O(n1562) );
  BUF1 U3059 ( .I(n2200), .O(n2285) );
  BUF1 U3060 ( .I(n2208), .O(n2273) );
  AOI22S U3061 ( .A1(n2285), .A2(\denoise/second_col_b[5][5] ), .B1(n2273), 
        .B2(\denoise/second_col_b[4][5] ), .O(n2171) );
  BUF1 U3062 ( .I(n2202), .O(n2278) );
  BUF1 U3063 ( .I(n2309), .O(n2277) );
  AOI22S U3064 ( .A1(n2278), .A2(\denoise/second_col_b[0][5] ), .B1(n2277), 
        .B2(\denoise/second_col_b[2][5] ), .O(n2170) );
  BUF1 U3065 ( .I(n2204), .O(n2275) );
  AOI22S U3066 ( .A1(n2276), .A2(\denoise/second_col_b[3][5] ), .B1(n2275), 
        .B2(\denoise/second_col_b[1][5] ), .O(n2169) );
  MOAI1S U3067 ( .A1(n2198), .A2(n2321), .B1(n2856), .B2(
        \denoise/first_col_b[3][5] ), .O(n1478) );
  MOAI1S U3068 ( .A1(n2871), .A2(n2332), .B1(n2248), .B2(
        \denoise/first_col_g[3][3] ), .O(n1564) );
  MOAI1S U3069 ( .A1(n2874), .A2(n2318), .B1(n2236), .B2(
        \denoise/first_col_b[0][3] ), .O(n1555) );
  AOI22S U3070 ( .A1(n2285), .A2(\denoise/second_col_g[5][4] ), .B1(n2273), 
        .B2(\denoise/second_col_g[4][4] ), .O(n2174) );
  AOI22S U3071 ( .A1(n2289), .A2(\denoise/second_col_g[0][4] ), .B1(n2288), 
        .B2(\denoise/second_col_g[2][4] ), .O(n2173) );
  AOI22S U3072 ( .A1(n2287), .A2(\denoise/second_col_g[3][4] ), .B1(n2286), 
        .B2(\denoise/second_col_g[1][4] ), .O(n2172) );
  MOAI1S U3073 ( .A1(n2181), .A2(n2330), .B1(n2239), .B2(
        \denoise/first_col_g[0][4] ), .O(n1530) );
  MOAI1S U3074 ( .A1(n2223), .A2(n2318), .B1(n2218), .B2(
        \denoise/first_col_b[4][3] ), .O(n1551) );
  AOI22S U3075 ( .A1(n2285), .A2(\denoise/second_col_g[5][5] ), .B1(n2273), 
        .B2(\denoise/second_col_g[4][5] ), .O(n2177) );
  AOI22S U3076 ( .A1(n2289), .A2(\denoise/second_col_g[0][5] ), .B1(n2288), 
        .B2(\denoise/second_col_g[2][5] ), .O(n2176) );
  AOI22S U3077 ( .A1(n2287), .A2(\denoise/second_col_g[3][5] ), .B1(n2286), 
        .B2(\denoise/second_col_g[1][5] ), .O(n2175) );
  MOAI1S U3078 ( .A1(n2182), .A2(n2327), .B1(n2850), .B2(
        \denoise/first_col_g[1][5] ), .O(n1492) );
  MOAI1S U3079 ( .A1(n2182), .A2(n2330), .B1(n2249), .B2(
        \denoise/first_col_g[1][4] ), .O(n1529) );
  MOAI1S U3080 ( .A1(n2181), .A2(n2327), .B1(n2849), .B2(
        \denoise/first_col_g[0][5] ), .O(n1493) );
  AOI22S U3081 ( .A1(n2274), .A2(\denoise/second_col_g[5][6] ), .B1(n2266), 
        .B2(\denoise/second_col_g[4][6] ), .O(n2180) );
  AOI22S U3082 ( .A1(n2278), .A2(\denoise/second_col_g[0][6] ), .B1(n2277), 
        .B2(\denoise/second_col_g[2][6] ), .O(n2179) );
  AOI22S U3083 ( .A1(n2276), .A2(\denoise/second_col_g[3][6] ), .B1(n2275), 
        .B2(\denoise/second_col_g[1][6] ), .O(n2178) );
  MOAI1S U3084 ( .A1(n2181), .A2(n2333), .B1(n2849), .B2(
        \denoise/first_col_g[0][6] ), .O(n1456) );
  MOAI1S U3085 ( .A1(n2182), .A2(n2333), .B1(n2850), .B2(
        \denoise/first_col_g[1][6] ), .O(n1455) );
  MOAI1S U3086 ( .A1(n2233), .A2(n2332), .B1(n2240), .B2(
        \denoise/first_col_g[4][3] ), .O(n1563) );
  MOAI1S U3087 ( .A1(n2197), .A2(n2330), .B1(n2248), .B2(
        \denoise/first_col_g[3][4] ), .O(n1527) );
  MOAI1S U3088 ( .A1(n2187), .A2(n2327), .B1(n2245), .B2(
        \denoise/first_col_g[4][5] ), .O(n1489) );
  MOAI1S U3089 ( .A1(n2880), .A2(n2318), .B1(n2224), .B2(
        \denoise/first_col_b[3][3] ), .O(n1552) );
  MOAI1S U3090 ( .A1(n2197), .A2(n2327), .B1(n2852), .B2(
        \denoise/first_col_g[3][5] ), .O(n1490) );
  MOAI1S U3091 ( .A1(n2867), .A2(n2332), .B1(n2249), .B2(
        \denoise/first_col_g[1][3] ), .O(n1566) );
  MOAI1S U3092 ( .A1(n2865), .A2(n2332), .B1(n2239), .B2(
        \denoise/first_col_g[0][3] ), .O(n1567) );
  BUF1 U3093 ( .I(n2183), .O(n2914) );
  MOAI1S U3094 ( .A1(n2915), .A2(n2321), .B1(n2914), .B2(
        \denoise/first_col_b[5][5] ), .O(n1476) );
  MOAI1S U3095 ( .A1(n2187), .A2(n2330), .B1(n2240), .B2(
        \denoise/first_col_g[4][4] ), .O(n1526) );
  MOAI1S U3096 ( .A1(n2199), .A2(n2321), .B1(n2243), .B2(
        \denoise/first_col_b[4][5] ), .O(n1477) );
  BUF1 U3097 ( .I(n2188), .O(n2913) );
  MOAI1S U3098 ( .A1(n2913), .A2(n2330), .B1(n2898), .B2(
        \denoise/first_col_g[5][4] ), .O(n1525) );
  MOAI1S U3099 ( .A1(n2196), .A2(n2321), .B1(n2854), .B2(
        \denoise/first_col_b[1][5] ), .O(n1480) );
  AOI22S U3100 ( .A1(n2254), .A2(\denoise/second_col_b[5][2] ), .B1(n2284), 
        .B2(\denoise/second_col_b[4][2] ), .O(n2186) );
  AOI22S U3101 ( .A1(n2258), .A2(\denoise/second_col_b[0][2] ), .B1(n2257), 
        .B2(\denoise/second_col_b[2][2] ), .O(n2185) );
  AOI22S U3102 ( .A1(n2256), .A2(\denoise/second_col_b[3][2] ), .B1(n2255), 
        .B2(\denoise/second_col_b[1][2] ), .O(n2184) );
  MOAI1S U3103 ( .A1(n2891), .A2(n2335), .B1(n2881), .B2(
        \denoise/first_col_b[5][2] ), .O(n1587) );
  MOAI1S U3104 ( .A1(n2195), .A2(n2321), .B1(n2853), .B2(
        \denoise/first_col_b[0][5] ), .O(n1481) );
  MOAI1S U3105 ( .A1(n2187), .A2(n2333), .B1(n2245), .B2(
        \denoise/first_col_g[4][6] ), .O(n1452) );
  BUF1 U3106 ( .I(n2188), .O(n2912) );
  MOAI1S U3107 ( .A1(n2913), .A2(n2327), .B1(n2912), .B2(
        \denoise/first_col_g[5][5] ), .O(n1488) );
  MOAI1S U3108 ( .A1(n2913), .A2(n2333), .B1(n2912), .B2(
        \denoise/first_col_g[5][6] ), .O(n1451) );
  AOI22S U3109 ( .A1(n2285), .A2(\denoise/second_col_b[5][4] ), .B1(n2273), 
        .B2(\denoise/second_col_b[4][4] ), .O(n2191) );
  AOI22S U3110 ( .A1(n2289), .A2(\denoise/second_col_b[0][4] ), .B1(n2288), 
        .B2(\denoise/second_col_b[2][4] ), .O(n2190) );
  AOI22S U3111 ( .A1(n2287), .A2(\denoise/second_col_b[3][4] ), .B1(n2286), 
        .B2(\denoise/second_col_b[1][4] ), .O(n2189) );
  MOAI1S U3112 ( .A1(n2195), .A2(n2328), .B1(n2236), .B2(
        \denoise/first_col_b[0][4] ), .O(n1518) );
  MOAI1S U3113 ( .A1(n2196), .A2(n2328), .B1(n2234), .B2(
        \denoise/first_col_b[1][4] ), .O(n1517) );
  MOAI1S U3114 ( .A1(n2223), .A2(n2335), .B1(n2244), .B2(
        \denoise/first_col_b[4][2] ), .O(n1588) );
  MOAI1S U3115 ( .A1(n2880), .A2(n2335), .B1(n2879), .B2(
        \denoise/first_col_b[3][2] ), .O(n1589) );
  AOI22S U3116 ( .A1(n2274), .A2(\denoise/second_col_b[5][6] ), .B1(n2266), 
        .B2(\denoise/second_col_b[4][6] ), .O(n2194) );
  AOI22S U3117 ( .A1(n2278), .A2(\denoise/second_col_b[0][6] ), .B1(n2277), 
        .B2(\denoise/second_col_b[2][6] ), .O(n2193) );
  AOI22S U3118 ( .A1(n2276), .A2(\denoise/second_col_b[3][6] ), .B1(n2275), 
        .B2(\denoise/second_col_b[1][6] ), .O(n2192) );
  MOAI1S U3119 ( .A1(n2195), .A2(n2320), .B1(n2853), .B2(
        \denoise/first_col_b[0][6] ), .O(n1444) );
  MOAI1S U3120 ( .A1(n2876), .A2(n2335), .B1(n2875), .B2(
        \denoise/first_col_b[1][2] ), .O(n1591) );
  MOAI1S U3121 ( .A1(n2196), .A2(n2320), .B1(n2854), .B2(
        \denoise/first_col_b[1][6] ), .O(n1443) );
  MOAI1S U3122 ( .A1(n2874), .A2(n2335), .B1(n2873), .B2(
        \denoise/first_col_b[0][2] ), .O(n1592) );
  MOAI1S U3123 ( .A1(n2198), .A2(n2328), .B1(n2224), .B2(
        \denoise/first_col_b[3][4] ), .O(n1515) );
  MOAI1S U3124 ( .A1(n2199), .A2(n2328), .B1(n2218), .B2(
        \denoise/first_col_b[4][4] ), .O(n1514) );
  MOAI1S U3125 ( .A1(n2197), .A2(n2333), .B1(n2852), .B2(
        \denoise/first_col_g[3][6] ), .O(n1453) );
  MOAI1S U3126 ( .A1(n2198), .A2(n2320), .B1(n2856), .B2(
        \denoise/first_col_b[3][6] ), .O(n1441) );
  MOAI1S U3127 ( .A1(n2915), .A2(n2328), .B1(n2899), .B2(
        \denoise/first_col_b[5][4] ), .O(n1513) );
  MOAI1S U3128 ( .A1(n2199), .A2(n2320), .B1(n2243), .B2(
        \denoise/first_col_b[4][6] ), .O(n1440) );
  MOAI1S U3129 ( .A1(n2876), .A2(n2318), .B1(n2234), .B2(
        \denoise/first_col_b[1][3] ), .O(n1554) );
  AOI22S U3130 ( .A1(n2298), .A2(\denoise/second_col_g[5][0] ), .B1(n2201), 
        .B2(\denoise/second_col_g[4][0] ), .O(n2207) );
  BUF1 U3131 ( .I(n2202), .O(n2302) );
  BUF1 U3132 ( .I(n2309), .O(n2301) );
  AOI22S U3133 ( .A1(n2302), .A2(\denoise/second_col_g[0][0] ), .B1(n2301), 
        .B2(\denoise/second_col_g[2][0] ), .O(n2206) );
  BUF1 U3134 ( .I(n2203), .O(n2300) );
  BUF1 U3135 ( .I(n2204), .O(n2299) );
  AOI22S U3136 ( .A1(n2300), .A2(\denoise/second_col_g[3][0] ), .B1(n2299), 
        .B2(\denoise/second_col_g[1][0] ), .O(n2205) );
  MOAI1S U3137 ( .A1(n2872), .A2(n2313), .B1(n2912), .B2(
        \denoise/first_col_g[5][0] ), .O(n1673) );
  MOAI1S U3138 ( .A1(n2915), .A2(n2320), .B1(n2914), .B2(
        \denoise/first_col_b[5][6] ), .O(n1439) );
  BUF1 U3139 ( .I(n2208), .O(n2297) );
  AOI22S U3140 ( .A1(n2298), .A2(\denoise/second_col_b[5][0] ), .B1(n2297), 
        .B2(\denoise/second_col_b[4][0] ), .O(n2211) );
  AOI22S U3141 ( .A1(n2302), .A2(\denoise/second_col_b[0][0] ), .B1(n2301), 
        .B2(\denoise/second_col_b[2][0] ), .O(n2210) );
  AOI22S U3142 ( .A1(n2300), .A2(\denoise/second_col_b[3][0] ), .B1(n2299), 
        .B2(\denoise/second_col_b[1][0] ), .O(n2209) );
  MOAI1S U3143 ( .A1(n2873), .A2(n2311), .B1(n2853), .B2(
        \denoise/first_col_b[0][0] ), .O(n1666) );
  MOAI1S U3144 ( .A1(n2875), .A2(n2311), .B1(n2854), .B2(
        \denoise/first_col_b[1][0] ), .O(n1665) );
  AOI22S U3145 ( .A1(n2254), .A2(\denoise/second_col_g[5][2] ), .B1(n2297), 
        .B2(\denoise/second_col_g[4][2] ), .O(n2214) );
  AOI22S U3146 ( .A1(n2258), .A2(\denoise/second_col_g[0][2] ), .B1(n2257), 
        .B2(\denoise/second_col_g[2][2] ), .O(n2213) );
  AOI22S U3147 ( .A1(n2256), .A2(\denoise/second_col_g[3][2] ), .B1(n2255), 
        .B2(\denoise/second_col_g[1][2] ), .O(n2212) );
  MOAI1S U3148 ( .A1(n2890), .A2(n2329), .B1(n2872), .B2(
        \denoise/first_col_g[5][2] ), .O(n1599) );
  MOAI1S U3149 ( .A1(n2233), .A2(n2329), .B1(n2246), .B2(
        \denoise/first_col_g[4][2] ), .O(n1600) );
  MOAI1S U3150 ( .A1(n2871), .A2(n2329), .B1(n2870), .B2(
        \denoise/first_col_g[3][2] ), .O(n1601) );
  AOI22S U3151 ( .A1(n2298), .A2(\denoise/second_col_b[5][1] ), .B1(n2297), 
        .B2(\denoise/second_col_b[4][1] ), .O(n2217) );
  AOI22S U3152 ( .A1(n2302), .A2(\denoise/second_col_b[0][1] ), .B1(n2301), 
        .B2(\denoise/second_col_b[2][1] ), .O(n2216) );
  AOI22S U3153 ( .A1(n2300), .A2(\denoise/second_col_b[3][1] ), .B1(n2299), 
        .B2(\denoise/second_col_b[1][1] ), .O(n2215) );
  MOAI1S U3154 ( .A1(n2244), .A2(n2315), .B1(n2218), .B2(
        \denoise/first_col_b[4][1] ), .O(n1625) );
  AOI22S U3155 ( .A1(n2274), .A2(\denoise/second_col_b[5][7] ), .B1(n2284), 
        .B2(\denoise/second_col_b[4][7] ), .O(n2221) );
  AOI22S U3156 ( .A1(n2258), .A2(\denoise/second_col_b[0][7] ), .B1(n2257), 
        .B2(\denoise/second_col_b[2][7] ), .O(n2220) );
  AOI22S U3157 ( .A1(n2256), .A2(\denoise/second_col_b[3][7] ), .B1(n2255), 
        .B2(\denoise/second_col_b[1][7] ), .O(n2219) );
  MOAI1S U3158 ( .A1(n2223), .A2(n2326), .B1(n2222), .B2(
        \denoise/first_col_b[4][7] ), .O(n1395) );
  MOAI1S U3159 ( .A1(n2867), .A2(n2329), .B1(n2866), .B2(
        \denoise/first_col_g[1][2] ), .O(n1603) );
  MOAI1S U3160 ( .A1(n2865), .A2(n2329), .B1(n2864), .B2(
        \denoise/first_col_g[0][2] ), .O(n1604) );
  MOAI1S U3161 ( .A1(n2879), .A2(n2315), .B1(n2224), .B2(
        \denoise/first_col_b[3][1] ), .O(n1626) );
  MOAI1S U3162 ( .A1(n2870), .A2(n2313), .B1(n2852), .B2(
        \denoise/first_col_g[3][0] ), .O(n1675) );
  AOI22S U3163 ( .A1(n2274), .A2(\denoise/second_col_g[5][7] ), .B1(n2266), 
        .B2(\denoise/second_col_g[4][7] ), .O(n2227) );
  AOI22S U3164 ( .A1(n2278), .A2(\denoise/second_col_g[0][7] ), .B1(n2277), 
        .B2(\denoise/second_col_g[2][7] ), .O(n2226) );
  AOI22S U3165 ( .A1(n2276), .A2(\denoise/second_col_g[3][7] ), .B1(n2275), 
        .B2(\denoise/second_col_g[1][7] ), .O(n2225) );
  MOAI1S U3166 ( .A1(n2867), .A2(n2324), .B1(n2228), .B2(
        \denoise/first_col_g[1][7] ), .O(n1418) );
  AOI22S U3167 ( .A1(n2298), .A2(\denoise/second_col_g[5][1] ), .B1(n2297), 
        .B2(\denoise/second_col_g[4][1] ), .O(n2231) );
  AOI22S U3168 ( .A1(n2302), .A2(\denoise/second_col_g[0][1] ), .B1(n2301), 
        .B2(\denoise/second_col_g[2][1] ), .O(n2230) );
  AOI22S U3169 ( .A1(n2300), .A2(\denoise/second_col_g[3][1] ), .B1(n2299), 
        .B2(\denoise/second_col_g[1][1] ), .O(n2229) );
  MOAI1S U3170 ( .A1(n2872), .A2(n2314), .B1(n2898), .B2(
        \denoise/first_col_g[5][1] ), .O(n1636) );
  MOAI1S U3171 ( .A1(n2864), .A2(n2313), .B1(n2849), .B2(
        \denoise/first_col_g[0][0] ), .O(n1678) );
  MOAI1S U3172 ( .A1(n2233), .A2(n2324), .B1(n2232), .B2(
        \denoise/first_col_g[4][7] ), .O(n1415) );
  MOAI1S U3173 ( .A1(n2881), .A2(n2311), .B1(n2914), .B2(
        \denoise/first_col_b[5][0] ), .O(n1661) );
  MOAI1S U3174 ( .A1(n2875), .A2(n2315), .B1(n2234), .B2(
        \denoise/first_col_b[1][1] ), .O(n1628) );
  MOAI1S U3175 ( .A1(n2890), .A2(n2324), .B1(n2235), .B2(
        \denoise/first_col_g[5][7] ), .O(n1414) );
  MOAI1S U3176 ( .A1(n2866), .A2(n2313), .B1(n2850), .B2(
        \denoise/first_col_g[1][0] ), .O(n1677) );
  MOAI1S U3177 ( .A1(n2873), .A2(n2315), .B1(n2236), .B2(
        \denoise/first_col_b[0][1] ), .O(n1629) );
  MOAI1S U3178 ( .A1(n2874), .A2(n2326), .B1(n2237), .B2(
        \denoise/first_col_b[0][7] ), .O(n1399) );
  MOAI1S U3179 ( .A1(n2865), .A2(n2324), .B1(n2238), .B2(
        \denoise/first_col_g[0][7] ), .O(n1419) );
  MOAI1S U3180 ( .A1(n2864), .A2(n2314), .B1(n2239), .B2(
        \denoise/first_col_g[0][1] ), .O(n1641) );
  MOAI1S U3181 ( .A1(n2246), .A2(n2314), .B1(n2240), .B2(
        \denoise/first_col_g[4][1] ), .O(n1637) );
  MOAI1S U3182 ( .A1(n2876), .A2(n2326), .B1(n2241), .B2(
        \denoise/first_col_b[1][7] ), .O(n1398) );
  MOAI1S U3183 ( .A1(n2880), .A2(n2326), .B1(n2242), .B2(
        \denoise/first_col_b[3][7] ), .O(n1396) );
  MOAI1S U3184 ( .A1(n2879), .A2(n2311), .B1(n2856), .B2(
        \denoise/first_col_b[3][0] ), .O(n1663) );
  MOAI1S U3185 ( .A1(n2244), .A2(n2311), .B1(n2243), .B2(
        \denoise/first_col_b[4][0] ), .O(n1662) );
  MOAI1S U3186 ( .A1(n2246), .A2(n2313), .B1(n2245), .B2(
        \denoise/first_col_g[4][0] ), .O(n1674) );
  MOAI1S U3187 ( .A1(n2871), .A2(n2324), .B1(n2247), .B2(
        \denoise/first_col_g[3][7] ), .O(n1416) );
  MOAI1S U3188 ( .A1(n2870), .A2(n2314), .B1(n2248), .B2(
        \denoise/first_col_g[3][1] ), .O(n1638) );
  MOAI1S U3189 ( .A1(n2866), .A2(n2314), .B1(n2249), .B2(
        \denoise/first_col_g[1][1] ), .O(n1640) );
  MOAI1S U3190 ( .A1(n2891), .A2(n2326), .B1(n2250), .B2(
        \denoise/first_col_b[5][7] ), .O(n1394) );
  MOAI1S U3191 ( .A1(n2881), .A2(n2315), .B1(n2899), .B2(
        \denoise/first_col_b[5][1] ), .O(n1624) );
  BUF1 U3192 ( .I(n2306), .O(n2889) );
  AOI22S U3193 ( .A1(n2254), .A2(\denoise/second_col_r[5][3] ), .B1(n2284), 
        .B2(\denoise/second_col_r[4][3] ), .O(n2253) );
  AOI22S U3194 ( .A1(n2256), .A2(\denoise/second_col_r[3][3] ), .B1(n2255), 
        .B2(\denoise/second_col_r[1][3] ), .O(n2252) );
  AOI22S U3195 ( .A1(n2258), .A2(\denoise/second_col_r[0][3] ), .B1(n2257), 
        .B2(\denoise/second_col_r[2][3] ), .O(n2251) );
  BUF1 U3196 ( .I(n2306), .O(n2897) );
  MOAI1S U3197 ( .A1(n2889), .A2(n2342), .B1(n2897), .B2(
        \denoise/first_col_r[0][3] ), .O(n1574) );
  BUF1 U3198 ( .I(n2293), .O(n2886) );
  AOI22S U3199 ( .A1(n2254), .A2(\denoise/second_col_r[5][2] ), .B1(n2297), 
        .B2(\denoise/second_col_r[4][2] ), .O(n2261) );
  AOI22S U3200 ( .A1(n2256), .A2(\denoise/second_col_r[3][2] ), .B1(n2255), 
        .B2(\denoise/second_col_r[1][2] ), .O(n2260) );
  AOI22S U3201 ( .A1(n2258), .A2(\denoise/second_col_r[0][2] ), .B1(n2257), 
        .B2(\denoise/second_col_r[2][2] ), .O(n2259) );
  MOAI1S U3202 ( .A1(n2886), .A2(n2857), .B1(n2860), .B2(
        \denoise/first_col_r[3][2] ), .O(n1614) );
  MOAI1S U3203 ( .A1(n2889), .A2(n2857), .B1(n2863), .B2(
        \denoise/first_col_r[0][2] ), .O(n1611) );
  AOI22S U3204 ( .A1(n2274), .A2(\denoise/second_col_r[5][7] ), .B1(n2266), 
        .B2(\denoise/second_col_r[4][7] ), .O(n2264) );
  AOI22S U3205 ( .A1(n2276), .A2(\denoise/second_col_r[3][7] ), .B1(n2275), 
        .B2(\denoise/second_col_r[1][7] ), .O(n2263) );
  AOI22S U3206 ( .A1(n2278), .A2(\denoise/second_col_r[0][7] ), .B1(n2277), 
        .B2(\denoise/second_col_r[2][7] ), .O(n2262) );
  MOAI1S U3207 ( .A1(n2889), .A2(n2341), .B1(n2265), .B2(
        \denoise/first_col_r[0][7] ), .O(n1426) );
  AOI22S U3208 ( .A1(n2298), .A2(\denoise/second_col_r[5][0] ), .B1(n2266), 
        .B2(\denoise/second_col_r[4][0] ), .O(n2269) );
  AOI22S U3209 ( .A1(n2300), .A2(\denoise/second_col_r[3][0] ), .B1(n2299), 
        .B2(\denoise/second_col_r[1][0] ), .O(n2268) );
  AOI22S U3210 ( .A1(n2302), .A2(\denoise/second_col_r[0][0] ), .B1(n2301), 
        .B2(\denoise/second_col_r[2][0] ), .O(n2267) );
  BUF1 U3211 ( .I(n2282), .O(n2908) );
  MOAI1S U3212 ( .A1(n2862), .A2(n2847), .B1(n2908), .B2(
        \denoise/first_col_r[1][0] ), .O(n1686) );
  BUF1 U3213 ( .I(n2295), .O(n2901) );
  AOI22S U3214 ( .A1(n2285), .A2(\denoise/second_col_r[5][5] ), .B1(n2273), 
        .B2(\denoise/second_col_r[4][5] ), .O(n2272) );
  AOI22S U3215 ( .A1(n2287), .A2(\denoise/second_col_r[3][5] ), .B1(n2286), 
        .B2(\denoise/second_col_r[1][5] ), .O(n2271) );
  AOI22S U3216 ( .A1(n2289), .A2(\denoise/second_col_r[0][5] ), .B1(n2288), 
        .B2(\denoise/second_col_r[2][5] ), .O(n2270) );
  BUF1 U3217 ( .I(n2295), .O(n2900) );
  MOAI1S U3218 ( .A1(n2901), .A2(n2338), .B1(n2900), .B2(
        \denoise/first_col_r[5][5] ), .O(n1505) );
  BUF1 U3219 ( .I(n2283), .O(n2885) );
  BUF1 U3220 ( .I(n2283), .O(n2893) );
  MOAI1S U3221 ( .A1(n2885), .A2(n2342), .B1(n2893), .B2(
        \denoise/first_col_r[4][3] ), .O(n1578) );
  BUF1 U3222 ( .I(n2293), .O(n2904) );
  MOAI1S U3223 ( .A1(n2860), .A2(n2847), .B1(n2904), .B2(
        \denoise/first_col_r[3][0] ), .O(n1688) );
  AOI22S U3224 ( .A1(n2274), .A2(\denoise/second_col_r[5][6] ), .B1(n2273), 
        .B2(\denoise/second_col_r[4][6] ), .O(n2281) );
  AOI22S U3225 ( .A1(n2276), .A2(\denoise/second_col_r[3][6] ), .B1(n2275), 
        .B2(\denoise/second_col_r[1][6] ), .O(n2280) );
  AOI22S U3226 ( .A1(n2278), .A2(\denoise/second_col_r[0][6] ), .B1(n2277), 
        .B2(\denoise/second_col_r[2][6] ), .O(n2279) );
  MOAI1S U3227 ( .A1(n2909), .A2(n2343), .B1(n2908), .B2(
        \denoise/first_col_r[1][6] ), .O(n1464) );
  BUF1 U3228 ( .I(n2282), .O(n2888) );
  BUF1 U3229 ( .I(n2282), .O(n2896) );
  MOAI1S U3230 ( .A1(n2888), .A2(n2342), .B1(n2896), .B2(
        \denoise/first_col_r[1][3] ), .O(n1575) );
  BUF1 U3231 ( .I(n2283), .O(n2903) );
  BUF1 U3232 ( .I(n2283), .O(n2902) );
  MOAI1S U3233 ( .A1(n2903), .A2(n2338), .B1(n2902), .B2(
        \denoise/first_col_r[4][5] ), .O(n1504) );
  BUF1 U3234 ( .I(n2306), .O(n2910) );
  MOAI1S U3235 ( .A1(n2863), .A2(n2847), .B1(n2910), .B2(
        \denoise/first_col_r[0][0] ), .O(n1685) );
  BUF1 U3236 ( .I(n2293), .O(n2894) );
  MOAI1S U3237 ( .A1(n2886), .A2(n2342), .B1(n2894), .B2(
        \denoise/first_col_r[3][3] ), .O(n1577) );
  AOI22S U3238 ( .A1(n2285), .A2(\denoise/second_col_r[5][4] ), .B1(n2284), 
        .B2(\denoise/second_col_r[4][4] ), .O(n2292) );
  AOI22S U3239 ( .A1(n2287), .A2(\denoise/second_col_r[3][4] ), .B1(n2286), 
        .B2(\denoise/second_col_r[1][4] ), .O(n2291) );
  AOI22S U3240 ( .A1(n2289), .A2(\denoise/second_col_r[0][4] ), .B1(n2288), 
        .B2(\denoise/second_col_r[2][4] ), .O(n2290) );
  MOAI1S U3241 ( .A1(n2909), .A2(n2344), .B1(n2896), .B2(
        \denoise/first_col_r[1][4] ), .O(n1538) );
  MOAI1S U3242 ( .A1(n2903), .A2(n2343), .B1(n2902), .B2(
        \denoise/first_col_r[4][6] ), .O(n1467) );
  BUF1 U3243 ( .I(n2293), .O(n2905) );
  MOAI1S U3244 ( .A1(n2905), .A2(n2338), .B1(n2904), .B2(
        \denoise/first_col_r[3][5] ), .O(n1503) );
  MOAI1S U3245 ( .A1(n2901), .A2(n2343), .B1(n2900), .B2(
        \denoise/first_col_r[5][6] ), .O(n1468) );
  MOAI1S U3246 ( .A1(n2888), .A2(n2857), .B1(n2862), .B2(
        \denoise/first_col_r[1][2] ), .O(n1612) );
  BUF1 U3247 ( .I(n2295), .O(n2884) );
  MOAI1S U3248 ( .A1(n2884), .A2(n2341), .B1(n2294), .B2(
        \denoise/first_col_r[5][7] ), .O(n1431) );
  MOAI1S U3249 ( .A1(n2905), .A2(n2343), .B1(n2904), .B2(
        \denoise/first_col_r[3][6] ), .O(n1466) );
  BUF1 U3250 ( .I(n2295), .O(n2892) );
  MOAI1S U3251 ( .A1(n2884), .A2(n2342), .B1(n2892), .B2(
        \denoise/first_col_r[5][3] ), .O(n1579) );
  MOAI1S U3252 ( .A1(n2886), .A2(n2341), .B1(n2296), .B2(
        \denoise/first_col_r[3][7] ), .O(n1429) );
  AOI22S U3253 ( .A1(n2298), .A2(\denoise/second_col_r[5][1] ), .B1(n2297), 
        .B2(\denoise/second_col_r[4][1] ), .O(n2305) );
  AOI22S U3254 ( .A1(n2300), .A2(\denoise/second_col_r[3][1] ), .B1(n2299), 
        .B2(\denoise/second_col_r[1][1] ), .O(n2304) );
  AOI22S U3255 ( .A1(n2302), .A2(\denoise/second_col_r[0][1] ), .B1(n2301), 
        .B2(\denoise/second_col_r[2][1] ), .O(n2303) );
  MOAI1S U3256 ( .A1(n2860), .A2(n2848), .B1(n2894), .B2(
        \denoise/first_col_r[3][1] ), .O(n1651) );
  MOAI1S U3257 ( .A1(n2862), .A2(n2848), .B1(n2896), .B2(
        \denoise/first_col_r[1][1] ), .O(n1649) );
  MOAI1S U3258 ( .A1(n2884), .A2(n2857), .B1(n2858), .B2(
        \denoise/first_col_r[5][2] ), .O(n1616) );
  MOAI1S U3259 ( .A1(n2863), .A2(n2848), .B1(n2897), .B2(
        \denoise/first_col_r[0][1] ), .O(n1648) );
  MOAI1S U3260 ( .A1(n2909), .A2(n2338), .B1(n2908), .B2(
        \denoise/first_col_r[1][5] ), .O(n1501) );
  BUF1 U3261 ( .I(n2306), .O(n2911) );
  MOAI1S U3262 ( .A1(n2911), .A2(n2344), .B1(n2897), .B2(
        \denoise/first_col_r[0][4] ), .O(n1537) );
  MOAI1S U3263 ( .A1(n2901), .A2(n2344), .B1(n2892), .B2(
        \denoise/first_col_r[5][4] ), .O(n1542) );
  MOAI1S U3264 ( .A1(n2911), .A2(n2338), .B1(n2910), .B2(
        \denoise/first_col_r[0][5] ), .O(n1500) );
  MOAI1S U3265 ( .A1(n2888), .A2(n2341), .B1(n2307), .B2(
        \denoise/first_col_r[1][7] ), .O(n1427) );
  MOAI1S U3266 ( .A1(n2858), .A2(n2847), .B1(n2900), .B2(
        \denoise/first_col_r[5][0] ), .O(n1690) );
  MOAI1S U3267 ( .A1(n2905), .A2(n2344), .B1(n2894), .B2(
        \denoise/first_col_r[3][4] ), .O(n1540) );
  MOAI1S U3268 ( .A1(n2903), .A2(n2344), .B1(n2893), .B2(
        \denoise/first_col_r[4][4] ), .O(n1541) );
  MOAI1S U3269 ( .A1(n2858), .A2(n2848), .B1(n2892), .B2(
        \denoise/first_col_r[5][1] ), .O(n1653) );
  MOAI1S U3270 ( .A1(n2911), .A2(n2343), .B1(n2910), .B2(
        \denoise/first_col_r[0][6] ), .O(n1463) );
  MOAI1S U3271 ( .A1(n2885), .A2(n2341), .B1(n2308), .B2(
        \denoise/first_col_r[4][7] ), .O(n1430) );
  BUF1 U3272 ( .I(n2319), .O(n2877) );
  BUF1 U3273 ( .I(n2319), .O(n2325) );
  MOAI1S U3274 ( .A1(n2877), .A2(n1913), .B1(n2325), .B2(
        \denoise/second_col_b[2][0] ), .O(n1670) );
  BUF1 U3275 ( .I(n2319), .O(n2855) );
  MOAI1S U3276 ( .A1(n2877), .A2(n2311), .B1(n2855), .B2(
        \denoise/first_col_b[2][0] ), .O(n1664) );
  BUF1 U3277 ( .I(n2322), .O(n2868) );
  BUF1 U3278 ( .I(n2322), .O(n2851) );
  MOAI1S U3279 ( .A1(n2868), .A2(n2313), .B1(n2851), .B2(
        \denoise/first_col_g[2][0] ), .O(n1676) );
  BUF1 U3280 ( .I(n2322), .O(n2323) );
  MOAI1S U3281 ( .A1(n2868), .A2(n1914), .B1(n2323), .B2(
        \denoise/second_col_g[2][0] ), .O(n1682) );
  BUF1 U3282 ( .I(n2322), .O(n2331) );
  MOAI1S U3283 ( .A1(n2868), .A2(n2314), .B1(n2331), .B2(
        \denoise/first_col_g[2][1] ), .O(n1639) );
  BUF1 U3284 ( .I(n2319), .O(n2336) );
  MOAI1S U3285 ( .A1(n2877), .A2(n2315), .B1(n2336), .B2(
        \denoise/first_col_b[2][1] ), .O(n1627) );
  BUF1 U3286 ( .I(n2339), .O(n2861) );
  MOAI1S U3287 ( .A1(n2861), .A2(n2847), .B1(n2906), .B2(
        \denoise/first_col_r[2][0] ), .O(n1687) );
  BUF1 U3288 ( .I(n2339), .O(n2340) );
  MOAI1S U3289 ( .A1(n2861), .A2(n1915), .B1(n2340), .B2(
        \denoise/second_col_r[2][0] ), .O(n1693) );
  BUF1 U3290 ( .I(n2339), .O(n2895) );
  MOAI1S U3291 ( .A1(n2861), .A2(n2848), .B1(n2895), .B2(
        \denoise/first_col_r[2][1] ), .O(n1650) );
  BUF1 U3292 ( .I(n2319), .O(n2878) );
  MOAI1S U3293 ( .A1(n2878), .A2(n2318), .B1(n2336), .B2(
        \denoise/first_col_b[2][3] ), .O(n1553) );
  BUF1 U3294 ( .I(n2319), .O(n2334) );
  MOAI1S U3295 ( .A1(n2334), .A2(n2320), .B1(n2855), .B2(
        \denoise/first_col_b[2][6] ), .O(n1442) );
  BUF1 U3296 ( .I(n2322), .O(n2337) );
  MOAI1S U3297 ( .A1(n2337), .A2(n1942), .B1(n2851), .B2(
        \denoise/second_col_g[2][7] ), .O(n1423) );
  MOAI1S U3298 ( .A1(n2334), .A2(n1934), .B1(n2336), .B2(
        \denoise/second_col_b[2][5] ), .O(n1485) );
  MOAI1S U3299 ( .A1(n2334), .A2(n2321), .B1(n2855), .B2(
        \denoise/first_col_b[2][5] ), .O(n1479) );
  BUF1 U3300 ( .I(n2322), .O(n2869) );
  MOAI1S U3301 ( .A1(n2869), .A2(n1929), .B1(n2331), .B2(
        \denoise/second_col_g[2][4] ), .O(n1534) );
  MOAI1S U3302 ( .A1(n2878), .A2(n1930), .B1(n2336), .B2(
        \denoise/second_col_b[2][4] ), .O(n1522) );
  MOAI1S U3303 ( .A1(n2869), .A2(n2324), .B1(n2323), .B2(
        \denoise/first_col_g[2][7] ), .O(n1417) );
  MOAI1S U3304 ( .A1(n2878), .A2(n2326), .B1(n2325), .B2(
        \denoise/first_col_b[2][7] ), .O(n1397) );
  MOAI1S U3305 ( .A1(n2337), .A2(n2327), .B1(n2851), .B2(
        \denoise/first_col_g[2][5] ), .O(n1491) );
  MOAI1S U3306 ( .A1(n2337), .A2(n1935), .B1(n2331), .B2(
        \denoise/second_col_g[2][5] ), .O(n1497) );
  MOAI1S U3307 ( .A1(n2869), .A2(n1921), .B1(n2331), .B2(
        \denoise/second_col_g[2][2] ), .O(n1608) );
  MOAI1S U3308 ( .A1(n2334), .A2(n2328), .B1(n2336), .B2(
        \denoise/first_col_b[2][4] ), .O(n1516) );
  MOAI1S U3309 ( .A1(n2334), .A2(n1938), .B1(n2855), .B2(
        \denoise/second_col_b[2][6] ), .O(n1448) );
  MOAI1S U3310 ( .A1(n2869), .A2(n2329), .B1(n2868), .B2(
        \denoise/first_col_g[2][2] ), .O(n1602) );
  MOAI1S U3311 ( .A1(n2337), .A2(n2330), .B1(n2331), .B2(
        \denoise/first_col_g[2][4] ), .O(n1528) );
  MOAI1S U3312 ( .A1(n2869), .A2(n2332), .B1(n2331), .B2(
        \denoise/first_col_g[2][3] ), .O(n1565) );
  MOAI1S U3313 ( .A1(n2337), .A2(n2333), .B1(n2851), .B2(
        \denoise/first_col_g[2][6] ), .O(n1454) );
  MOAI1S U3314 ( .A1(n2334), .A2(n1943), .B1(n2855), .B2(
        \denoise/second_col_b[2][7] ), .O(n1411) );
  MOAI1S U3315 ( .A1(n2878), .A2(n2335), .B1(n2877), .B2(
        \denoise/first_col_b[2][2] ), .O(n1590) );
  MOAI1S U3316 ( .A1(n2878), .A2(n1922), .B1(n2336), .B2(
        \denoise/second_col_b[2][2] ), .O(n1596) );
  MOAI1S U3317 ( .A1(n2337), .A2(n1939), .B1(n2851), .B2(
        \denoise/second_col_g[2][6] ), .O(n1460) );
  BUF1 U3318 ( .I(n2339), .O(n2907) );
  MOAI1S U3319 ( .A1(n2907), .A2(n2338), .B1(n2906), .B2(
        \denoise/first_col_r[2][5] ), .O(n1502) );
  BUF1 U3320 ( .I(n2339), .O(n2887) );
  MOAI1S U3321 ( .A1(n2887), .A2(n2341), .B1(n2340), .B2(
        \denoise/first_col_r[2][7] ), .O(n1428) );
  MOAI1S U3322 ( .A1(n2887), .A2(n2857), .B1(n2861), .B2(
        \denoise/first_col_r[2][2] ), .O(n1613) );
  MOAI1S U3323 ( .A1(n2887), .A2(n2342), .B1(n2895), .B2(
        \denoise/first_col_r[2][3] ), .O(n1576) );
  MOAI1S U3324 ( .A1(n2907), .A2(n2343), .B1(n2906), .B2(
        \denoise/first_col_r[2][6] ), .O(n1465) );
  MOAI1S U3325 ( .A1(n2907), .A2(n2344), .B1(n2895), .B2(
        \denoise/first_col_r[2][4] ), .O(n1539) );
  INV1S U3326 ( .I(n1755), .O(n2345) );
  NR3 U3327 ( .I1(n2931), .I2(n2586), .I3(\denoise/n_counter_1 [1]), .O(n2837)
         );
  INV1S U3328 ( .I(n2837), .O(n2583) );
  INV1S U3329 ( .I(\denoise/n_state_1 [1]), .O(n2839) );
  ND2S U3330 ( .I1(\denoise/init_12_last_flag ), .I2(n2839), .O(n2347) );
  MOAI1S U3331 ( .A1(n2583), .A2(n2347), .B1(n1752), .B2(n2346), .O(n1701) );
  OR2 U3332 ( .I1(n1893), .I2(\gain/counter_R_r [3]), .O(n2351) );
  NR2 U3333 ( .I1(\gain/state_R_r [1]), .I2(n2348), .O(n2352) );
  OR2 U3334 ( .I1(n2352), .I2(n2456), .O(n2356) );
  AO12 U3335 ( .B1(n3550), .B2(n2350), .A1(n2610), .O(n2349) );
  MOAI1S U3336 ( .A1(n2351), .A2(n2350), .B1(\gain/counter_R_r [3]), .B2(n2349), .O(n1202) );
  AO12 U3337 ( .B1(n2500), .B2(n3587), .A1(n3388), .O(n3367) );
  INV1S U3338 ( .I(n3367), .O(n2360) );
  AOI22S U3339 ( .A1(n2500), .A2(n3498), .B1(n2353), .B2(n3491), .O(n2359) );
  AOI22S U3340 ( .A1(\gain/N303 ), .A2(\gain/r_mean_r [4]), .B1(n1750), .B2(
        n3587), .O(n2354) );
  MOAI1S U3341 ( .A1(n3584), .A2(n2354), .B1(n3584), .B2(\gain/r_mean_r [2]), 
        .O(n2575) );
  OA22 U3342 ( .A1(n3362), .A2(\gain/N303 ), .B1(n2575), .B2(n3586), .O(n2358)
         );
  INV1S U3343 ( .I(\gain/r_mean_r [12]), .O(n2438) );
  MOAI1S U3344 ( .A1(n1733), .A2(n2438), .B1(\gain/r_mean_r [13]), .B2(n3550), 
        .O(n2357) );
  AO13S U3345 ( .B1(n2360), .B2(n2359), .B3(n2358), .A1(n2357), .O(n1215) );
  NR2 U3346 ( .I1(n3587), .I2(n3388), .O(n3373) );
  INV1S U3347 ( .I(n2361), .O(n2363) );
  INV1S U3348 ( .I(\gain/r_mean_r [10]), .O(n2436) );
  MOAI1S U3349 ( .A1(n2436), .A2(n1892), .B1(\gain/r_mean_r [9]), .B2(n1812), 
        .O(n2362) );
  AO13S U3350 ( .B1(n1768), .B2(n3373), .B3(n2363), .A1(n2362), .O(n1212) );
  INV1S U3351 ( .I(\gain/g_mean_r [3]), .O(n3453) );
  INV1S U3352 ( .I(\gain/g_mean_r [2]), .O(n3404) );
  INV1S U3353 ( .I(\gain/g_mean_r [1]), .O(n3460) );
  MOAI1S U3354 ( .A1(\gain/N478 ), .A2(\gain/g_mean_r [0]), .B1(\gain/N478 ), 
        .B2(n3460), .O(n2389) );
  OA222 U3355 ( .A1(n3453), .A2(n3403), .B1(n3404), .B2(n3414), .C1(n1767), 
        .C2(n2389), .O(n3412) );
  NR2 U3356 ( .I1(\gain/MSB_G_r[1] ), .I2(n3583), .O(n3405) );
  NR2 U3357 ( .I1(n1767), .I2(\gain/N478 ), .O(n3399) );
  AOI22S U3358 ( .A1(\gain/g_mean_r [5]), .A2(n3405), .B1(n1747), .B2(n3399), 
        .O(n2365) );
  INV1S U3359 ( .I(n3414), .O(n2373) );
  INV1S U3360 ( .I(n3403), .O(n3406) );
  AOI22S U3361 ( .A1(\gain/g_mean_r [6]), .A2(n2373), .B1(\gain/g_mean_r [7]), 
        .B2(n3406), .O(n2364) );
  OAI12HS U3362 ( .B1(\gain/N456 ), .B2(n3412), .A1(n2394), .O(n2495) );
  AN2 U3363 ( .I1(n2392), .I2(n2495), .O(n2369) );
  INV1S U3364 ( .I(n3438), .O(n3401) );
  MOAI1S U3365 ( .A1(\gain/N456 ), .A2(n3460), .B1(\gain/N456 ), .B2(
        \gain/g_mean_r [5]), .O(n2367) );
  MOAI1S U3366 ( .A1(n3588), .A2(n2367), .B1(n3588), .B2(n3453), .O(n3409) );
  AOI22S U3367 ( .A1(\gain/N456 ), .A2(\gain/g_mean_r [4]), .B1(n1748), .B2(
        n3592), .O(n2368) );
  MOAI1S U3368 ( .A1(\gain/MSB_G_r[1] ), .A2(\gain/g_mean_r [2]), .B1(n1767), 
        .B2(n2368), .O(n2374) );
  AOI22S U3369 ( .A1(n1867), .A2(n3409), .B1(n2374), .B2(n3583), .O(n2372) );
  ND2S U3370 ( .I1(n3588), .I2(n3592), .O(n2371) );
  INV1S U3371 ( .I(\gain/g_mean_r [14]), .O(n3445) );
  INV1S U3372 ( .I(\gain/state_G_r [0]), .O(n2430) );
  NR2 U3373 ( .I1(\gain/state_G_r [0]), .I2(\gain/state_G_r [1]), .O(n3449) );
  MOAI1S U3374 ( .A1(n3445), .A2(n3421), .B1(\gain/g_mean_r [13]), .B2(n1875), 
        .O(n2370) );
  AO13S U3375 ( .B1(n3401), .B2(n2372), .B3(n2371), .A1(n2370), .O(n1192) );
  AOI13HS U3376 ( .B1(n3588), .B2(n3583), .B3(n3592), .A1(n3438), .O(n3402) );
  AOI22S U3377 ( .A1(n3399), .A2(n3460), .B1(n2373), .B2(n3453), .O(n2377) );
  AOI22S U3378 ( .A1(\gain/N478 ), .A2(n2374), .B1(n3403), .B2(n3592), .O(
        n2376) );
  INV1S U3379 ( .I(\gain/g_mean_r [12]), .O(n3413) );
  INV1S U3380 ( .I(n3424), .O(n3545) );
  MOAI1S U3381 ( .A1(n1873), .A2(n3413), .B1(\gain/g_mean_r [13]), .B2(n3545), 
        .O(n2375) );
  AO13S U3382 ( .B1(n3402), .B2(n2377), .B3(n2376), .A1(n2375), .O(n1191) );
  OR2 U3383 ( .I1(n3421), .I2(\gain/counter_G_r [3]), .O(n2380) );
  INV1S U3384 ( .I(\gain/counter_G_r [1]), .O(n3437) );
  INV1S U3385 ( .I(\gain/counter_G_r [0]), .O(n3434) );
  NR2 U3386 ( .I1(n3437), .I2(n3434), .O(n2397) );
  INV1S U3387 ( .I(n3424), .O(n3543) );
  INV1S U3388 ( .I(n2378), .O(n3442) );
  MOAI1S U3389 ( .A1(n3543), .A2(n3401), .B1(n3442), .B2(n2496), .O(n2379) );
  MOAI1S U3390 ( .A1(n2380), .A2(n2496), .B1(\gain/counter_G_r [3]), .B2(n2379), .O(n1178) );
  NR2 U3391 ( .I1(\gain/state_B_r [1]), .I2(n2381), .O(n2383) );
  NR2 U3392 ( .I1(n3593), .I2(n3537), .O(n3507) );
  INV1S U3393 ( .I(n2382), .O(n2385) );
  INV1S U3394 ( .I(\gain/b_mean_r [10]), .O(n3514) );
  MOAI1S U3395 ( .A1(n3514), .A2(n1887), .B1(n1746), .B2(n1803), .O(n2384) );
  AO13S U3396 ( .B1(n1793), .B2(n3507), .B3(n2385), .A1(n2384), .O(n1132) );
  OR2 U3397 ( .I1(\gain/counter_B_r [3]), .I2(n3579), .O(n2388) );
  INV1S U3398 ( .I(n1721), .O(n3530) );
  AO12 U3399 ( .B1(n3573), .B2(n2387), .A1(n3530), .O(n2386) );
  MOAI1S U3400 ( .A1(n2388), .A2(n2387), .B1(\gain/counter_B_r [3]), .B2(n2386), .O(n1140) );
  INV1S U3401 ( .I(n3419), .O(n2611) );
  INV1S U3402 ( .I(n2389), .O(n2391) );
  INV1S U3403 ( .I(\gain/g_mean_r [10]), .O(n3417) );
  MOAI1S U3404 ( .A1(n3417), .A2(n3467), .B1(\gain/g_mean_r [9]), .B2(n1875), 
        .O(n2390) );
  AO13S U3405 ( .B1(\gain/MSB_G_r[1] ), .B2(n2611), .B3(n2391), .A1(n2390), 
        .O(n1188) );
  INV1S U3406 ( .I(\gain/counter_G_r [2]), .O(n2396) );
  AN2 U3407 ( .I1(n1723), .I2(n2581), .O(n3436) );
  MOAI1S U3408 ( .A1(n2394), .A2(n2494), .B1(\gain/counter_G_r [2]), .B2(n2393), .O(n2395) );
  AO13S U3409 ( .B1(n3543), .B2(n2397), .B3(n2396), .A1(n2395), .O(n1175) );
  INV1S U3410 ( .I(\gain/counter_B_r [2]), .O(n2403) );
  INV1S U3411 ( .I(n2398), .O(n2400) );
  NR2 U3412 ( .I1(\gain/counter_B_r [0]), .I2(n1888), .O(n3532) );
  NR2 U3413 ( .I1(n3530), .I2(n3532), .O(n3535) );
  MOAI1S U3414 ( .A1(n2401), .A2(n2400), .B1(\gain/counter_B_r [2]), .B2(n2399), .O(n2402) );
  AO13S U3415 ( .B1(n2405), .B2(n2404), .B3(n2403), .A1(n2402), .O(n1118) );
  INV1S U3416 ( .I(\gain/G_r [11]), .O(\intadd_2/B[7] ) );
  INV1S U3417 ( .I(\gain/G_r [8]), .O(\intadd_2/B[4] ) );
  INV1S U3418 ( .I(\gain/G_r [9]), .O(\intadd_2/B[5] ) );
  INV1S U3419 ( .I(\gain/G_r [13]), .O(\intadd_2/B[9] ) );
  INV1S U3420 ( .I(\gain/G_r [7]), .O(\intadd_2/B[3] ) );
  INV1S U3421 ( .I(\gain/G_r [6]), .O(\intadd_2/B[2] ) );
  INV1S U3422 ( .I(\gain/G_r [5]), .O(\intadd_2/B[1] ) );
  INV1S U3423 ( .I(\gain/G_r [3]), .O(n3459) );
  NR2 U3424 ( .I1(\gain/G_r [2]), .I2(n3404), .O(n2465) );
  OR2B1S U3425 ( .I1(\gain/G_r [0]), .B1(n1748), .O(n3470) );
  INV1S U3426 ( .I(\gain/G_r [1]), .O(n3465) );
  AOI22S U3427 ( .A1(\gain/G_r [1]), .A2(n3460), .B1(n3470), .B2(n3461), .O(
        n2467) );
  MOAI1S U3428 ( .A1(n2465), .A2(n2467), .B1(\gain/G_r [2]), .B2(n3404), .O(
        n3457) );
  AOI22S U3429 ( .A1(\gain/G_r [3]), .A2(n3453), .B1(n3454), .B2(n3457), .O(
        \intadd_2/CI ) );
  INV1S U3430 ( .I(\gain/G_r [4]), .O(\intadd_2/B[0] ) );
  INV1S U3431 ( .I(n3424), .O(n3539) );
  INV1S U3432 ( .I(\gain/g_mean_r [15]), .O(n3441) );
  INV1S U3433 ( .I(\gain/G_r [15]), .O(n3443) );
  MOAI1S U3434 ( .A1(n3417), .A2(\gain/G_r [10]), .B1(\gain/g_mean_r [11]), 
        .B2(\intadd_2/B[7] ), .O(n2416) );
  NR2 U3435 ( .I1(\gain/g_mean_r [8]), .I2(\intadd_2/B[4] ), .O(n2407) );
  INV1S U3436 ( .I(\gain/g_mean_r [11]), .O(n3420) );
  MOAI1S U3437 ( .A1(n2416), .A2(n2408), .B1(n3420), .B2(\gain/G_r [11]), .O(
        n2409) );
  AOI13HS U3438 ( .B1(\gain/G_r [10]), .B2(n3417), .B3(n2410), .A1(n2409), .O(
        n2411) );
  MOAI1S U3439 ( .A1(\gain/G_r [12]), .A2(n3413), .B1(\gain/g_mean_r [13]), 
        .B2(\intadd_2/B[9] ), .O(n2420) );
  OA22 U3440 ( .A1(n2411), .A2(n2420), .B1(\gain/g_mean_r [13]), .B2(
        \intadd_2/B[9] ), .O(n2424) );
  ND3 U3441 ( .I1(\gain/G_r [12]), .I2(n2412), .I3(n3413), .O(n2423) );
  FA1S U3442 ( .A(\intadd_2/CI ), .B(\gain/g_mean_r [4]), .CI(\intadd_2/B[0] ), 
        .CO(n2413) );
  FA1S U3443 ( .A(\intadd_2/B[1] ), .B(\gain/g_mean_r [5]), .CI(n2413), .CO(
        n2414) );
  FA1S U3444 ( .A(\intadd_2/B[2] ), .B(\gain/g_mean_r [6]), .CI(n2414), .CO(
        n2415) );
  MAO222 U3445 ( .A1(\intadd_2/B[3] ), .B1(\gain/g_mean_r [7]), .C1(n2415), 
        .O(n2417) );
  NR2 U3446 ( .I1(n2417), .I2(n2416), .O(n2419) );
  AOI22S U3447 ( .A1(\gain/g_mean_r [8]), .A2(\intadd_2/B[4] ), .B1(
        \gain/g_mean_r [9]), .B2(\intadd_2/B[5] ), .O(n2418) );
  NR2 U3448 ( .I1(\gain/G_r [14]), .I2(n3445), .O(n3439) );
  INV1S U3449 ( .I(n3439), .O(n3447) );
  AOI13HS U3450 ( .B1(n2424), .B2(n2423), .B3(n2422), .A1(n2421), .O(n2425) );
  AOI13HS U3451 ( .B1(\gain/G_r [14]), .B2(n3445), .B3(n2426), .A1(n2425), .O(
        n2428) );
  ND3 U3452 ( .I1(n2429), .I2(n2428), .I3(n2427), .O(n3538) );
  INV1S U3453 ( .I(n1795), .O(n3466) );
  MOAI1S U3454 ( .A1(\intadd_2/SUM[1] ), .A2(n1878), .B1(\gain/G_r [5]), .B2(
        n1796), .O(n1163) );
  MOAI1S U3455 ( .A1(\intadd_2/SUM[3] ), .A2(n1876), .B1(\gain/G_r [7]), .B2(
        n1796), .O(n1165) );
  MOAI1S U3456 ( .A1(\intadd_2/SUM[2] ), .A2(n1877), .B1(\gain/G_r [6]), .B2(
        n1795), .O(n1164) );
  MOAI1S U3457 ( .A1(\intadd_2/SUM[0] ), .A2(n1878), .B1(\gain/G_r [4]), .B2(
        n1795), .O(n1162) );
  INV1S U3458 ( .I(\gain/R_r [11]), .O(\intadd_1/B[7] ) );
  INV1S U3459 ( .I(\gain/R_r [8]), .O(\intadd_1/B[4] ) );
  INV1S U3460 ( .I(\gain/R_r [9]), .O(\intadd_1/B[5] ) );
  INV1S U3461 ( .I(\gain/R_r [13]), .O(\intadd_1/B[9] ) );
  INV1S U3462 ( .I(\gain/R_r [7]), .O(\intadd_1/B[3] ) );
  INV1S U3463 ( .I(\gain/R_r [6]), .O(\intadd_1/B[2] ) );
  INV1S U3464 ( .I(\gain/R_r [5]), .O(\intadd_1/B[1] ) );
  INV1S U3465 ( .I(\gain/R_r [3]), .O(n3497) );
  NR2 U3466 ( .I1(\gain/R_r [2]), .I2(n3360), .O(n2460) );
  OR2B1S U3467 ( .I1(\gain/R_r [0]), .B1(n1750), .O(n3502) );
  INV1S U3468 ( .I(\gain/R_r [1]), .O(n3504) );
  AOI22S U3469 ( .A1(\gain/R_r [1]), .A2(n3498), .B1(n3502), .B2(n3499), .O(
        n2462) );
  MOAI1S U3470 ( .A1(n2460), .A2(n2462), .B1(\gain/R_r [2]), .B2(n3360), .O(
        n3495) );
  AOI22S U3471 ( .A1(\gain/R_r [3]), .A2(n3491), .B1(n3492), .B2(n3495), .O(
        \intadd_1/CI ) );
  INV1S U3472 ( .I(\gain/R_r [4]), .O(\intadd_1/B[0] ) );
  INV1S U3473 ( .I(\gain/r_mean_r [15]), .O(n3473) );
  INV1S U3474 ( .I(\gain/r_mean_r [14]), .O(n3477) );
  INV1S U3475 ( .I(\gain/R_r [15]), .O(n3475) );
  MOAI1S U3476 ( .A1(n2436), .A2(\gain/R_r [10]), .B1(\gain/r_mean_r [11]), 
        .B2(\intadd_1/B[7] ), .O(n2443) );
  NR2 U3477 ( .I1(\gain/r_mean_r [8]), .I2(\intadd_1/B[4] ), .O(n2432) );
  OAI22S U3478 ( .A1(\gain/r_mean_r [11]), .A2(\intadd_1/B[7] ), .B1(n2443), 
        .B2(n2433), .O(n2434) );
  AOI13HS U3479 ( .B1(\gain/R_r [10]), .B2(n2436), .B3(n2435), .A1(n2434), .O(
        n2437) );
  MOAI1S U3480 ( .A1(\gain/R_r [12]), .A2(n2438), .B1(\gain/r_mean_r [13]), 
        .B2(\intadd_1/B[9] ), .O(n2447) );
  OA22 U3481 ( .A1(n2437), .A2(n2447), .B1(\gain/r_mean_r [13]), .B2(
        \intadd_1/B[9] ), .O(n2451) );
  ND3 U3482 ( .I1(\gain/R_r [12]), .I2(n2439), .I3(n2438), .O(n2450) );
  FA1S U3483 ( .A(\intadd_1/CI ), .B(\gain/r_mean_r [4]), .CI(\intadd_1/B[0] ), 
        .CO(n2440) );
  FA1S U3484 ( .A(\intadd_1/B[1] ), .B(\gain/r_mean_r [5]), .CI(n2440), .CO(
        n2441) );
  FA1S U3485 ( .A(\intadd_1/B[2] ), .B(\gain/r_mean_r [6]), .CI(n2441), .CO(
        n2442) );
  MAO222 U3486 ( .A1(\intadd_1/B[3] ), .B1(\gain/r_mean_r [7]), .C1(n2442), 
        .O(n2444) );
  NR2 U3487 ( .I1(n2444), .I2(n2443), .O(n2446) );
  AOI22S U3488 ( .A1(\gain/r_mean_r [8]), .A2(\intadd_1/B[4] ), .B1(
        \gain/r_mean_r [9]), .B2(\intadd_1/B[5] ), .O(n2445) );
  NR2 U3489 ( .I1(\gain/R_r [14]), .I2(n3477), .O(n3471) );
  INV1S U3490 ( .I(n3471), .O(n3479) );
  AOI13HS U3491 ( .B1(n2451), .B2(n2450), .B3(n2449), .A1(n2448), .O(n2452) );
  AOI13HS U3492 ( .B1(\gain/R_r [14]), .B2(n3477), .B3(n2453), .A1(n2452), .O(
        n2454) );
  ND3 U3493 ( .I1(n2455), .I2(n2454), .I3(n3474), .O(n3546) );
  MOAI1S U3494 ( .A1(\intadd_1/SUM[1] ), .A2(n1808), .B1(\gain/R_r [5]), .B2(
        n1798), .O(n1147) );
  MOAI1S U3495 ( .A1(\intadd_1/SUM[3] ), .A2(n1807), .B1(\gain/R_r [7]), .B2(
        n1797), .O(n1149) );
  INV1S U3496 ( .I(n1797), .O(n2457) );
  OAI12HS U3497 ( .B1(n1750), .B2(n1893), .A1(n2457), .O(n2458) );
  MOAI1S U3498 ( .A1(n3502), .A2(n1808), .B1(\gain/R_r [0]), .B2(n2458), .O(
        n1142) );
  MOAI1S U3499 ( .A1(\intadd_1/SUM[2] ), .A2(n1808), .B1(\gain/R_r [6]), .B2(
        n1797), .O(n1148) );
  MOAI1S U3500 ( .A1(\intadd_1/SUM[0] ), .A2(n1807), .B1(\gain/R_r [4]), .B2(
        n1798), .O(n1146) );
  ND2S U3501 ( .I1(\gain/R_r [2]), .I2(n3360), .O(n2459) );
  OR2B1S U3502 ( .I1(n2460), .B1(n2459), .O(n2461) );
  MOAI1S U3503 ( .A1(n2462), .A2(n2461), .B1(n2462), .B2(n2461), .O(n2463) );
  MOAI1S U3504 ( .A1(n1807), .A2(n2463), .B1(\gain/R_r [2]), .B2(n1797), .O(
        n1144) );
  ND2S U3505 ( .I1(\gain/G_r [2]), .I2(n3404), .O(n2464) );
  OR2B1S U3506 ( .I1(n2465), .B1(n2464), .O(n2466) );
  MOAI1S U3507 ( .A1(n2467), .A2(n2466), .B1(n2467), .B2(n2466), .O(n2468) );
  MOAI1S U3508 ( .A1(n1876), .A2(n2468), .B1(\gain/G_r [2]), .B2(n1795), .O(
        n1160) );
  ND2S U3509 ( .I1(last_pic_out_den), .I2(n1802), .O(n2477) );
  NR2 U3510 ( .I1(mode_reg[0]), .I2(n2469), .O(n2470) );
  AOI22S U3511 ( .A1(n2772), .A2(last_pic_out_mean), .B1(n2470), .B2(
        last_pic_out_dem), .O(n2476) );
  OR2 U3512 ( .I1(mode_reg[1]), .I2(n2471), .O(n2522) );
  INV1S U3513 ( .I(n2523), .O(n2737) );
  NR2 U3514 ( .I1(n2473), .I2(n2472), .O(n2474) );
  AOI22S U3515 ( .A1(n2737), .A2(last_pic_out_wb), .B1(n1885), .B2(
        last_pic_out_gamma), .O(n2475) );
  ND3 U3516 ( .I1(n2477), .I2(n2476), .I3(n2475), .O(n1706) );
  AOI22S U3517 ( .A1(n2737), .A2(color_out_wb[0]), .B1(n2474), .B2(
        color_out_gamma[0]), .O(n2479) );
  AOI22S U3518 ( .A1(n2470), .A2(color_out_dem[0]), .B1(color_out_den[0]), 
        .B2(n1800), .O(n2478) );
  ND3 U3519 ( .I1(n2479), .I2(n2478), .I3(n2503), .O(n1709) );
  AOI22S U3520 ( .A1(n1822), .A2(valid_out_gain), .B1(n1886), .B2(
        valid_out_gamma), .O(n2482) );
  AOI22S U3521 ( .A1(n2772), .A2(valid_out_mean), .B1(n1817), .B2(
        valid_out_dem), .O(n2481) );
  INV1S U3522 ( .I(n2523), .O(n2824) );
  AOI22S U3523 ( .A1(n2824), .A2(valid_value_out_wb), .B1(valid_out_den), .B2(
        n1801), .O(n2480) );
  ND3 U3524 ( .I1(n2482), .I2(n2481), .I3(n2480), .O(n1719) );
  AOI22S U3525 ( .A1(n2737), .A2(color_out_wb[1]), .B1(n1886), .B2(
        color_out_gamma[1]), .O(n2484) );
  AOI22S U3526 ( .A1(n1816), .A2(color_out_dem[1]), .B1(color_out_den[1]), 
        .B2(n1802), .O(n2483) );
  ND3 U3527 ( .I1(n2484), .I2(n2483), .I3(n1758), .O(n1710) );
  OR3B2S U3528 ( .I1(n2485), .B1(last_col_out_den), .B2(color_out_den[1]), .O(
        n2486) );
  MOAI1S U3529 ( .A1(color_out_den[0]), .A2(n2486), .B1(n2502), .B2(
        finish_out_mean), .O(n2493) );
  ND3 U3530 ( .I1(n1885), .I2(last_pic_out_gamma), .I3(color_out_gamma[1]), 
        .O(n2488) );
  ND2S U3531 ( .I1(n1947), .I2(n2782), .O(n2487) );
  MOAI1S U3532 ( .A1(color_out_gamma[0]), .A2(n2488), .B1(valid_out_gain), 
        .B2(n2487), .O(n2492) );
  INV1S U3533 ( .I(n2523), .O(n2814) );
  ND3 U3534 ( .I1(n2814), .I2(last_pic_out_wb), .I3(color_out_wb[1]), .O(n2489) );
  OAI22S U3535 ( .A1(color_out_dem[0]), .A2(n2490), .B1(color_out_wb[0]), .B2(
        n2489), .O(n2491) );
  OR3 U3536 ( .I1(n2493), .I2(n2492), .I3(n2491), .O(n1708) );
  ND2S U3537 ( .I1(n3449), .I2(\gain/valid_r ), .O(n2499) );
  NR2 U3538 ( .I1(n2495), .I2(n2494), .O(n3398) );
  INV1S U3539 ( .I(n3398), .O(n3397) );
  INV1S U3540 ( .I(n2496), .O(n2497) );
  ND3 U3541 ( .I1(n2497), .I2(\gain/counter_G_r [3]), .I3(n3442), .O(n2498) );
  ND3 U3542 ( .I1(n2499), .I2(n3397), .I3(n2498), .O(n1724) );
  ND2S U3543 ( .I1(\gain/MSB_R_r[1] ), .I2(n3356), .O(n2501) );
  OR2B1S U3544 ( .I1(n3356), .B1(n2500), .O(n3357) );
  ND3 U3545 ( .I1(n2501), .I2(n3359), .I3(n3357), .O(n1220) );
  ND2S U3546 ( .I1(pixel_out_dem[0]), .I2(n1817), .O(n2509) );
  AOI22S U3547 ( .A1(n1823), .A2(k_r_out_gain[0]), .B1(n2814), .B2(
        pixel_out_wb[0]), .O(n2506) );
  INV1S U3548 ( .I(n2502), .O(n2777) );
  NR3 U3549 ( .I1(color_out_mean[0]), .I2(color_out_mean[1]), .I3(n2777), .O(
        n2820) );
  AOI22S U3550 ( .A1(r_mean_out_mean[0]), .A2(n1854), .B1(b_mean_out_mean[0]), 
        .B2(n1757), .O(n2505) );
  NR2 U3551 ( .I1(color_out_mean[1]), .I2(n2503), .O(n2831) );
  ND2S U3552 ( .I1(n2831), .I2(g_mean_out_mean[0]), .O(n2504) );
  AOI22S U3553 ( .A1(n2474), .A2(pixel_out_gamma[0]), .B1(pixel_out_den[0]), 
        .B2(n1802), .O(n2507) );
  ND3 U3554 ( .I1(n2509), .I2(n2508), .I3(n2507), .O(n1711) );
  ND2S U3555 ( .I1(pixel_out_dem[3]), .I2(n1816), .O(n2515) );
  AOI22S U3556 ( .A1(n1822), .A2(k_r_out_gain[3]), .B1(n2824), .B2(
        pixel_out_wb[3]), .O(n2512) );
  AOI22S U3557 ( .A1(r_mean_out_mean[3]), .A2(n1854), .B1(b_mean_out_mean[3]), 
        .B2(n1757), .O(n2511) );
  ND2S U3558 ( .I1(n1772), .I2(g_mean_out_mean[3]), .O(n2510) );
  AOI22S U3559 ( .A1(n1885), .A2(pixel_out_gamma[3]), .B1(pixel_out_den[3]), 
        .B2(n1800), .O(n2513) );
  ND3 U3560 ( .I1(n2515), .I2(n2514), .I3(n2513), .O(n1714) );
  ND2S U3561 ( .I1(pixel_out_dem[5]), .I2(n2470), .O(n2521) );
  AOI22S U3562 ( .A1(n1823), .A2(k_r_out_gain[5]), .B1(n2824), .B2(
        pixel_out_wb[5]), .O(n2517) );
  AOI22S U3563 ( .A1(r_mean_out_mean[5]), .A2(n1854), .B1(b_mean_out_mean[5]), 
        .B2(n1757), .O(n2516) );
  OA112 U3564 ( .C1(n2518), .C2(n1771), .A1(n2517), .B1(n2516), .O(n2520) );
  AOI22S U3565 ( .A1(n1886), .A2(pixel_out_gamma[5]), .B1(pixel_out_den[5]), 
        .B2(n1801), .O(n2519) );
  ND3 U3566 ( .I1(n2521), .I2(n2520), .I3(n2519), .O(n1716) );
  AN2 U3567 ( .I1(\denoise/pos8 [1]), .I2(\denoise/pos7 [1]), .O(
        \intadd_5/B[2] ) );
  ND2S U3568 ( .I1(\denoise/n_color_out_reg [1]), .I2(
        \denoise/n_color_out_reg [0]), .O(\denoise/n_valid_out_reg ) );
  AN2 U3569 ( .I1(n2522), .I2(k_b_out_gain[10]), .O(k_b_in_wb[10]) );
  AN2 U3570 ( .I1(n2522), .I2(k_r_out_gain[11]), .O(k_r_in_wb[11]) );
  AN2 U3571 ( .I1(n2522), .I2(k_g_out_gain[11]), .O(k_g_in_wb[11]) );
  AN2 U3572 ( .I1(n2522), .I2(k_g_out_gain[10]), .O(k_g_in_wb[10]) );
  AN2 U3573 ( .I1(n2523), .I2(k_r_out_gain[10]), .O(k_r_in_wb[10]) );
  BUF1 U3574 ( .I(n2522), .O(n2770) );
  AN2 U3575 ( .I1(n2770), .I2(k_r_out_gain[6]), .O(k_r_in_wb[6]) );
  AN2 U3576 ( .I1(n2770), .I2(k_g_out_gain[6]), .O(k_g_in_wb[6]) );
  AN2 U3577 ( .I1(n2770), .I2(k_b_out_gain[11]), .O(k_b_in_wb[11]) );
  AN2 U3578 ( .I1(n2770), .I2(k_b_out_gain[6]), .O(k_b_in_wb[6]) );
  BUF1 U3579 ( .I(n2523), .O(n2524) );
  AN2 U3580 ( .I1(n2524), .I2(k_g_out_gain[8]), .O(k_g_in_wb[8]) );
  AN2 U3581 ( .I1(n2524), .I2(k_b_out_gain[7]), .O(k_b_in_wb[7]) );
  AN2 U3582 ( .I1(n2524), .I2(k_r_out_gain[9]), .O(k_r_in_wb[9]) );
  AN2 U3583 ( .I1(n2524), .I2(k_b_out_gain[9]), .O(k_b_in_wb[9]) );
  AN2 U3584 ( .I1(n2524), .I2(k_g_out_gain[9]), .O(k_g_in_wb[9]) );
  AN2 U3585 ( .I1(n2524), .I2(k_r_out_gain[7]), .O(k_r_in_wb[7]) );
  AOI22S U3586 ( .A1(n1739), .A2(\denoise/sum6_b [3]), .B1(n2525), .B2(
        \denoise/sum6 [3]), .O(n2528) );
  INV1S U3587 ( .I(n2942), .O(n2526) );
  AOI22S U3588 ( .A1(n2526), .A2(\denoise/sum6_r [3]), .B1(n1843), .B2(
        \denoise/sum6_g [3]), .O(n2527) );
  INV1S U3589 ( .I(n2539), .O(n2843) );
  AOI22S U3590 ( .A1(n1739), .A2(\denoise/sum6_b [1]), .B1(n2843), .B2(
        \denoise/sum6 [1]), .O(n2530) );
  AOI22S U3591 ( .A1(n1949), .A2(\denoise/sum6_r [1]), .B1(n1845), .B2(
        \denoise/sum6_g [1]), .O(n2529) );
  AOI22S U3592 ( .A1(n1952), .A2(\denoise/sum3_b [1]), .B1(n2843), .B2(
        \denoise/sum3 [1]), .O(n2532) );
  AOI22S U3593 ( .A1(n1950), .A2(\denoise/sum3_r [1]), .B1(n1843), .B2(
        \denoise/sum3_g [1]), .O(n2531) );
  AOI22S U3594 ( .A1(n1951), .A2(\denoise/sum6_b [2]), .B1(n2843), .B2(
        \denoise/sum6 [2]), .O(n2534) );
  AOI22S U3595 ( .A1(n1948), .A2(\denoise/sum6_r [2]), .B1(n1759), .B2(
        \denoise/sum6_g [2]), .O(n2533) );
  AOI22S U3596 ( .A1(n1739), .A2(\denoise/sum3_b [2]), .B1(n2843), .B2(
        \denoise/sum3 [2]), .O(n2536) );
  AOI22S U3597 ( .A1(n1949), .A2(\denoise/sum3_r [2]), .B1(n1844), .B2(
        \denoise/sum3_g [2]), .O(n2535) );
  AOI22S U3598 ( .A1(n2345), .A2(\denoise/sum3_b [3]), .B1(n2843), .B2(
        \denoise/sum3 [3]), .O(n2538) );
  AOI22S U3599 ( .A1(n1949), .A2(\denoise/sum3_r [3]), .B1(n1845), .B2(
        \denoise/sum3_g [3]), .O(n2537) );
  BUF1 U3600 ( .I(n2539), .O(n3021) );
  INV1S U3601 ( .I(n3021), .O(n2554) );
  AOI22S U3602 ( .A1(n1952), .A2(\denoise/sum3_b [6]), .B1(n2554), .B2(
        \denoise/sum3 [6]), .O(n2541) );
  AOI22S U3603 ( .A1(n1950), .A2(\denoise/sum3_r [6]), .B1(n1843), .B2(
        \denoise/sum3_g [6]), .O(n2540) );
  AOI22S U3604 ( .A1(n1951), .A2(\denoise/sum3_b [5]), .B1(n2554), .B2(
        \denoise/sum3 [5]), .O(n2543) );
  AOI22S U3605 ( .A1(n1948), .A2(\denoise/sum3_r [5]), .B1(n1759), .B2(
        \denoise/sum3_g [5]), .O(n2542) );
  AOI22S U3606 ( .A1(n2345), .A2(\denoise/sum6_b [6]), .B1(n2554), .B2(
        \denoise/sum6 [6]), .O(n2545) );
  AOI22S U3607 ( .A1(n2526), .A2(\denoise/sum6_r [6]), .B1(n1844), .B2(
        \denoise/sum6_g [6]), .O(n2544) );
  AOI22S U3608 ( .A1(n2345), .A2(\denoise/sum6_b [5]), .B1(n2554), .B2(
        \denoise/sum6 [5]), .O(n2547) );
  AOI22S U3609 ( .A1(n1949), .A2(\denoise/sum6_r [5]), .B1(n1845), .B2(
        \denoise/sum6_g [5]), .O(n2546) );
  AOI22S U3610 ( .A1(n1952), .A2(\denoise/sum3_b [4]), .B1(n2554), .B2(
        \denoise/sum3 [4]), .O(n2549) );
  AOI22S U3611 ( .A1(n1950), .A2(\denoise/sum3_r [4]), .B1(n1843), .B2(
        \denoise/sum3_g [4]), .O(n2548) );
  INV1S U3612 ( .I(n3021), .O(n3140) );
  AOI22S U3613 ( .A1(n1951), .A2(\denoise/sum6_b [0]), .B1(n3140), .B2(
        \denoise/sum6 [0]), .O(n2551) );
  AOI22S U3614 ( .A1(n1948), .A2(\denoise/sum6_r [0]), .B1(n1759), .B2(
        \denoise/sum6_g [0]), .O(n2550) );
  AOI22S U3615 ( .A1(n2345), .A2(\denoise/sum3_b [0]), .B1(n3140), .B2(
        \denoise/sum3 [0]), .O(n2553) );
  AOI22S U3616 ( .A1(n2526), .A2(\denoise/sum3_r [0]), .B1(n1844), .B2(
        \denoise/sum3_g [0]), .O(n2552) );
  AOI22S U3617 ( .A1(n2345), .A2(\denoise/sum6_b [4]), .B1(n2554), .B2(
        \denoise/sum6 [4]), .O(n2556) );
  AOI22S U3618 ( .A1(n1949), .A2(\denoise/sum6_r [4]), .B1(n1845), .B2(
        \denoise/sum6_g [4]), .O(n2555) );
  INV1S U3619 ( .I(n2883), .O(n2567) );
  AOI22S U3620 ( .A1(n1952), .A2(\denoise/sum6_b [8]), .B1(n2567), .B2(
        \denoise/sum6 [8]), .O(n2558) );
  AOI22S U3621 ( .A1(n1950), .A2(\denoise/sum6_r [8]), .B1(n1845), .B2(
        \denoise/sum6_g [8]), .O(n2557) );
  AOI22S U3622 ( .A1(n1951), .A2(\denoise/sum3_b [7]), .B1(n2567), .B2(
        \denoise/sum3 [7]), .O(n2560) );
  AOI22S U3623 ( .A1(n1948), .A2(\denoise/sum3_r [7]), .B1(n1844), .B2(
        \denoise/sum3_g [7]), .O(n2559) );
  AOI22S U3624 ( .A1(n1952), .A2(\denoise/sum3_b [9]), .B1(n2567), .B2(
        \denoise/sum3 [9]), .O(n2562) );
  AOI22S U3625 ( .A1(n1950), .A2(\denoise/sum3_r [9]), .B1(n1845), .B2(
        \denoise/sum3_g [9]), .O(n2561) );
  AOI22S U3626 ( .A1(n1739), .A2(\denoise/sum3_b [8]), .B1(n2567), .B2(
        \denoise/sum3 [8]), .O(n2564) );
  AOI22S U3627 ( .A1(n1949), .A2(\denoise/sum3_r [8]), .B1(n1843), .B2(
        \denoise/sum3_g [8]), .O(n2563) );
  AOI22S U3628 ( .A1(n1952), .A2(\denoise/sum6_b [7]), .B1(n2567), .B2(
        \denoise/sum6 [7]), .O(n2566) );
  AOI22S U3629 ( .A1(n1950), .A2(\denoise/sum6_r [7]), .B1(n1844), .B2(
        \denoise/sum6_g [7]), .O(n2565) );
  AOI22S U3630 ( .A1(n1951), .A2(\denoise/sum6_b [9]), .B1(n2567), .B2(
        \denoise/sum6 [9]), .O(n2570) );
  AOI22S U3631 ( .A1(n1948), .A2(\denoise/sum6_r [9]), .B1(n1844), .B2(
        \denoise/sum6_g [9]), .O(n2569) );
  MOAI1S U3632 ( .A1(n3528), .A2(n3527), .B1(n3528), .B2(n3590), .O(n2571) );
  MOAI1S U3633 ( .A1(n3397), .A2(n3399), .B1(n3397), .B2(n3588), .O(n2572) );
  INV1S U3634 ( .I(n3388), .O(n3358) );
  AOI22S U3635 ( .A1(n1863), .A2(n3358), .B1(\gain/counter_R_r [0]), .B2(n2610), .O(n2573) );
  INV1S U3636 ( .I(\gain/counter_R_r [0]), .O(n3386) );
  AOI22S U3637 ( .A1(\gain/r_mean_r [13]), .A2(n1814), .B1(\gain/r_mean_r [14]), .B2(n3474), .O(n2578) );
  MOAI1S U3638 ( .A1(n3587), .A2(\gain/r_mean_r [5]), .B1(n3587), .B2(n3498), 
        .O(n2574) );
  MOAI1S U3639 ( .A1(n1768), .A2(\gain/r_mean_r [3]), .B1(\gain/MSB_R_r[1] ), 
        .B2(n2574), .O(n3365) );
  MOAI1S U3640 ( .A1(n3586), .A2(n3365), .B1(n3586), .B2(n2575), .O(n2576) );
  OAI112HS U3641 ( .C1(\gain/MSB_R_r[1] ), .C2(n1866), .A1(n3358), .B1(n2576), 
        .O(n2577) );
  ND3 U3642 ( .I1(n3362), .I2(n3373), .I3(n1750), .O(n2580) );
  AOI22S U3643 ( .A1(\gain/r_mean_r [9]), .A2(n3474), .B1(\gain/r_mean_r [8]), 
        .B2(n1812), .O(n2579) );
  OA22 U3644 ( .A1(n3583), .A2(n3438), .B1(n1723), .B2(n3434), .O(n2582) );
  OR2B1S U3645 ( .I1(n2586), .B1(n1752), .O(n2838) );
  MOAI1S U3646 ( .A1(\denoise/n_counter_1 [2]), .A2(n2934), .B1(
        \denoise/n_counter_1 [2]), .B2(n2934), .O(n2585) );
  NR2 U3647 ( .I1(n2586), .I2(\denoise/n_state_1 [1]), .O(n2832) );
  OR2B1S U3648 ( .I1(n2832), .B1(n2838), .O(n2836) );
  OAI112HS U3649 ( .C1(\denoise/n_state_1 [0]), .C2(n2583), .A1(
        \denoise/n_counter_1 [2]), .B1(n2839), .O(n2584) );
  MOAI1S U3650 ( .A1(n2586), .A2(n2585), .B1(n2834), .B2(n2584), .O(n2587) );
  AOI22S U3651 ( .A1(n3527), .A2(n3511), .B1(n2589), .B2(n2660), .O(n2592) );
  INV1S U3652 ( .I(\gain/b_mean_r [0]), .O(n3568) );
  MOAI1S U3653 ( .A1(\gain/N626 ), .A2(n3568), .B1(\gain/N626 ), .B2(
        \gain/b_mean_r [4]), .O(n2590) );
  AOI22S U3654 ( .A1(n3590), .A2(\gain/b_mean_r [2]), .B1(n1793), .B2(n2590), 
        .O(n2598) );
  AOI22S U3655 ( .A1(n1870), .A2(n2598), .B1(n1754), .B2(n3593), .O(n2591) );
  OAI22S U3656 ( .A1(n3527), .A2(n3537), .B1(n3593), .B2(n1756), .O(n2607) );
  ND3 U3657 ( .I1(n2592), .I2(n2591), .I3(n2607), .O(n2594) );
  AOI22S U3658 ( .A1(n1743), .A2(n3558), .B1(\gain/b_mean_r [12]), .B2(n1805), 
        .O(n2593) );
  ND3 U3659 ( .I1(n1753), .I2(n3507), .I3(\gain/b_mean_r [0]), .O(n2596) );
  AOI22S U3660 ( .A1(\gain/b_mean_r [9]), .A2(n3558), .B1(\gain/b_mean_r [8]), 
        .B2(n1803), .O(n2595) );
  AOI22S U3661 ( .A1(\gain/b_mean_r [13]), .A2(n1803), .B1(\gain/b_mean_r [14]), .B2(n3558), .O(n2601) );
  MOAI1S U3662 ( .A1(\gain/N626 ), .A2(\gain/b_mean_r [1]), .B1(\gain/N626 ), 
        .B2(n3566), .O(n2597) );
  MOAI1S U3663 ( .A1(n1793), .A2(\gain/b_mean_r [3]), .B1(n1732), .B2(n2597), 
        .O(n2602) );
  OAI22S U3664 ( .A1(n3591), .A2(n2602), .B1(n1870), .B2(n2598), .O(n2599) );
  OAI112HS U3665 ( .C1(n1732), .C2(n1868), .A1(n2607), .B1(n2599), .O(n2600)
         );
  OAI22S U3666 ( .A1(n3568), .A2(n2604), .B1(n2652), .B2(n1754), .O(n3513) );
  MOAI1S U3667 ( .A1(\gain/N648 ), .A2(n2602), .B1(n3593), .B2(n3513), .O(
        n2606) );
  INV1S U3668 ( .I(\gain/b_mean_r [6]), .O(n3565) );
  OAI22S U3669 ( .A1(n1744), .A2(n2604), .B1(n3565), .B2(n2603), .O(n2605) );
  AOI22S U3670 ( .A1(n2607), .A2(n2606), .B1(n3507), .B2(n2605), .O(n2609) );
  AOI22S U3671 ( .A1(\gain/b_mean_r [14]), .A2(n1804), .B1(\gain/b_mean_r [15]), .B2(n3558), .O(n2608) );
  INV1S U3672 ( .I(n2610), .O(n1727) );
  ND3 U3673 ( .I1(n3406), .I2(n2611), .I3(n1748), .O(n2613) );
  AOI22S U3674 ( .A1(\gain/g_mean_r [9]), .A2(n3442), .B1(\gain/g_mean_r [8]), 
        .B2(n1874), .O(n2612) );
  AN2 U3675 ( .I1(\intadd_3/n1 ), .I2(\intadd_4/n1 ), .O(\denoise/n_sum9 [11])
         );
  AN2 U3676 ( .I1(\denoise/sum3 [1]), .I2(\denoise/sum6 [1]), .O(\intadd_4/CI ) );
  AN2 U3677 ( .I1(\intadd_5/n1 ), .I2(n2763), .O(\denoise/n_new_sum6 [9]) );
  INV1S U3678 ( .I(\gain/B_r [11]), .O(\intadd_0/B[7] ) );
  INV1S U3679 ( .I(\gain/B_r [8]), .O(\intadd_0/B[4] ) );
  INV1S U3680 ( .I(\gain/B_r [9]), .O(\intadd_0/B[5] ) );
  INV1S U3681 ( .I(\gain/B_r [13]), .O(\intadd_0/B[9] ) );
  INV1S U3682 ( .I(\gain/B_r [7]), .O(\intadd_0/B[3] ) );
  INV1S U3683 ( .I(\gain/B_r [6]), .O(\intadd_0/B[2] ) );
  INV1S U3684 ( .I(\gain/B_r [5]), .O(\intadd_0/B[1] ) );
  OR2 U3685 ( .I1(n2660), .I2(\gain/B_r [3]), .O(n2661) );
  NR2 U3686 ( .I1(\gain/B_r [2]), .I2(n2652), .O(n2653) );
  INV1S U3687 ( .I(\gain/B_r [0]), .O(n3570) );
  OR2 U3688 ( .I1(n3511), .I2(\gain/B_r [1]), .O(n2668) );
  AOI22S U3689 ( .A1(\gain/B_r [1]), .A2(n3511), .B1(n3571), .B2(n2668), .O(
        n2656) );
  AOI22S U3690 ( .A1(\gain/B_r [3]), .A2(n2660), .B1(n2661), .B2(n2664), .O(
        \intadd_0/CI ) );
  INV1S U3691 ( .I(\gain/B_r [4]), .O(\intadd_0/B[0] ) );
  INV1S U3692 ( .I(\gain/b_mean_r [15]), .O(n3563) );
  INV1S U3693 ( .I(\gain/b_mean_r [14]), .O(n3554) );
  INV1S U3694 ( .I(\gain/B_r [15]), .O(n3562) );
  MOAI1S U3695 ( .A1(n3514), .A2(\gain/B_r [10]), .B1(\gain/b_mean_r [11]), 
        .B2(\intadd_0/B[7] ), .O(n2624) );
  NR2 U3696 ( .I1(\gain/b_mean_r [8]), .I2(\intadd_0/B[4] ), .O(n2615) );
  INV1S U3697 ( .I(\gain/b_mean_r [11]), .O(n3517) );
  MOAI1S U3698 ( .A1(n2624), .A2(n2616), .B1(n3517), .B2(\gain/B_r [11]), .O(
        n2617) );
  AOI13HS U3699 ( .B1(\gain/B_r [10]), .B2(n3514), .B3(n2618), .A1(n2617), .O(
        n2619) );
  INV1S U3700 ( .I(\gain/b_mean_r [12]), .O(n3509) );
  MOAI1S U3701 ( .A1(\gain/B_r [12]), .A2(n3509), .B1(n1743), .B2(
        \intadd_0/B[9] ), .O(n2628) );
  OA22 U3702 ( .A1(n2619), .A2(n2628), .B1(\gain/b_mean_r [13]), .B2(
        \intadd_0/B[9] ), .O(n2632) );
  ND3 U3703 ( .I1(\gain/B_r [12]), .I2(n2620), .I3(n3509), .O(n2631) );
  FA1S U3704 ( .A(\intadd_0/CI ), .B(\gain/b_mean_r [4]), .CI(\intadd_0/B[0] ), 
        .CO(n2621) );
  FA1S U3705 ( .A(\intadd_0/B[1] ), .B(\gain/b_mean_r [5]), .CI(n2621), .CO(
        n2622) );
  FA1S U3706 ( .A(\intadd_0/B[2] ), .B(\gain/b_mean_r [6]), .CI(n2622), .CO(
        n2623) );
  MAO222 U3707 ( .A1(\intadd_0/B[3] ), .B1(\gain/b_mean_r [7]), .C1(n2623), 
        .O(n2625) );
  NR2 U3708 ( .I1(n2625), .I2(n2624), .O(n2627) );
  AOI22S U3709 ( .A1(\gain/b_mean_r [8]), .A2(\intadd_0/B[4] ), .B1(
        \gain/b_mean_r [9]), .B2(\intadd_0/B[5] ), .O(n2626) );
  NR2 U3710 ( .I1(\gain/B_r [14]), .I2(n3554), .O(n3555) );
  OR2B1S U3711 ( .I1(n3555), .B1(n2634), .O(n2629) );
  AOI13HS U3712 ( .B1(n2632), .B2(n2631), .B3(n2630), .A1(n2629), .O(n2633) );
  AOI13HS U3713 ( .B1(\gain/B_r [14]), .B2(n3554), .B3(n2634), .A1(n2633), .O(
        n2635) );
  ND3 U3714 ( .I1(n2636), .I2(n2635), .I3(n3574), .O(n3572) );
  OA22 U3715 ( .A1(n1871), .A2(\intadd_0/B[4] ), .B1(\intadd_0/SUM[4] ), .B2(
        n1811), .O(n2641) );
  AN2B1S U3716 ( .I1(n2638), .B1(\gain/valid_r ), .O(n2639) );
  AOI22S U3717 ( .A1(\gain/b_mean_r [8]), .A2(n1910), .B1(n1762), .B2(
        \gain/K_mean_r [8]), .O(n2640) );
  OA22 U3718 ( .A1(n1872), .A2(\intadd_0/B[5] ), .B1(\intadd_0/SUM[5] ), .B2(
        n1809), .O(n2643) );
  AOI22S U3719 ( .A1(n1746), .A2(n1911), .B1(n1761), .B2(\gain/K_mean_r [9]), 
        .O(n2642) );
  OA22 U3720 ( .A1(n1871), .A2(\intadd_0/B[9] ), .B1(\intadd_0/SUM[9] ), .B2(
        n1810), .O(n2645) );
  AOI22S U3721 ( .A1(n1743), .A2(n1912), .B1(n1762), .B2(\gain/K_mean_r [13]), 
        .O(n2644) );
  OA22 U3722 ( .A1(n1872), .A2(\intadd_0/B[7] ), .B1(\intadd_0/SUM[7] ), .B2(
        n1811), .O(n2647) );
  AOI22S U3723 ( .A1(\gain/b_mean_r [11]), .A2(n1910), .B1(n1761), .B2(
        \gain/K_mean_r [11]), .O(n2646) );
  INV1S U3724 ( .I(\gain/B_r [10]), .O(\intadd_0/B[6] ) );
  OA22 U3725 ( .A1(n1871), .A2(\intadd_0/B[6] ), .B1(\intadd_0/SUM[6] ), .B2(
        n1809), .O(n2649) );
  AOI22S U3726 ( .A1(\gain/b_mean_r [10]), .A2(n1911), .B1(n1762), .B2(
        \gain/K_mean_r [10]), .O(n2648) );
  INV1S U3727 ( .I(\gain/B_r [12]), .O(\intadd_0/B[8] ) );
  OA22 U3728 ( .A1(n1872), .A2(\intadd_0/B[8] ), .B1(\intadd_0/SUM[8] ), .B2(
        n1810), .O(n2651) );
  AOI22S U3729 ( .A1(\gain/b_mean_r [12]), .A2(n1912), .B1(n1761), .B2(
        \gain/K_mean_r [12]), .O(n2650) );
  AOI22S U3730 ( .A1(\gain/b_mean_r [2]), .A2(n1910), .B1(\gain/B_r [2]), .B2(
        n3556), .O(n2659) );
  AN2 U3731 ( .I1(n2652), .I2(\gain/B_r [2]), .O(n2654) );
  NR2 U3732 ( .I1(n2654), .I2(n2653), .O(n2655) );
  MOAI1S U3733 ( .A1(n2656), .A2(n2655), .B1(n2656), .B2(n2655), .O(n2657) );
  AOI22S U3734 ( .A1(\gain/b_mean_r [3]), .A2(n1911), .B1(\gain/B_r [3]), .B2(
        n3556), .O(n2667) );
  ND2S U3735 ( .I1(\gain/B_r [3]), .I2(n2660), .O(n2662) );
  MOAI1S U3736 ( .A1(n2664), .A2(n2663), .B1(n2664), .B2(n2663), .O(n2665) );
  AOI22S U3737 ( .A1(\gain/b_mean_r [1]), .A2(n1912), .B1(\gain/B_r [1]), .B2(
        n3556), .O(n2673) );
  ND2S U3738 ( .I1(\gain/B_r [1]), .I2(n3511), .O(n2669) );
  MOAI1S U3739 ( .A1(n3571), .A2(n2670), .B1(n3571), .B2(n2670), .O(n2671) );
  AOI22S U3740 ( .A1(\gain/B_r [14]), .A2(n3556), .B1(n1761), .B2(
        \gain/K_mean_r [14]), .O(n2677) );
  MOAI1S U3741 ( .A1(\gain/B_r [14]), .A2(\intadd_0/n1 ), .B1(\gain/B_r [14]), 
        .B2(\intadd_0/n1 ), .O(n2674) );
  MOAI1S U3742 ( .A1(n3554), .A2(n2674), .B1(n3554), .B2(n2674), .O(n2675) );
  OA22 U3743 ( .A1(n1811), .A2(n2675), .B1(n1763), .B2(n3554), .O(n2676) );
  OR3 U3744 ( .I1(\C237/DATA2_8 ), .I2(\C237/DATA2_9 ), .I3(
        \DP_OP_654J1_124_416/n1 ), .O(n2678) );
  NR2 U3745 ( .I1(n2680), .I2(n2679), .O(n2689) );
  AOI22S U3746 ( .A1(\wb/value_r [6]), .A2(n2689), .B1(\C237/DATA2_2 ), .B2(
        n1865), .O(n2681) );
  AOI22S U3747 ( .A1(\wb/value_r [7]), .A2(n2689), .B1(\C237/DATA2_3 ), .B2(
        n1864), .O(n2683) );
  AOI22S U3748 ( .A1(\wb/value_r [4]), .A2(n2689), .B1(\C237/DATA2_0 ), .B2(
        n1865), .O(n2686) );
  AOI22S U3749 ( .A1(\wb/value_r [5]), .A2(n2689), .B1(\C237/DATA2_1 ), .B2(
        n1864), .O(n2690) );
  MOAI1S U3750 ( .A1(n2701), .A2(n2695), .B1(n2701), .B2(n2695), .O(n2716) );
  OR2 U3751 ( .I1(n2703), .I2(n2704), .O(n2692) );
  MOAI1S U3752 ( .A1(n2693), .A2(n2692), .B1(n2693), .B2(
        \denoise/n_pixel_out_reg [2]), .O(n2709) );
  NR2 U3753 ( .I1(\denoise/sum9 [1]), .I2(n2709), .O(n2694) );
  INV1S U3754 ( .I(n2695), .O(n2700) );
  AOI22S U3755 ( .A1(n2701), .A2(n2700), .B1(n2699), .B2(n2698), .O(n2712) );
  MOAI1S U3756 ( .A1(n2704), .A2(n2703), .B1(n2704), .B2(
        \denoise/n_pixel_out_reg [2]), .O(n2711) );
  AO12 U3757 ( .B1(\gain/state_G_r [1]), .B2(\gain/state_G_r [0]), .A1(
        \gain/finish_G_r ), .O(n1725) );
  AO12 U3758 ( .B1(\gain/state_R_r [1]), .B2(\gain/state_R_r [0]), .A1(
        \gain/finish_R_r ), .O(n1726) );
  INV1S U3759 ( .I(n1725), .O(n2707) );
  INV1S U3760 ( .I(n1726), .O(n2706) );
  NR2 U3761 ( .I1(n2707), .I2(n2706), .O(\gain/valid_gain_tmp ) );
  INV1S U3762 ( .I(\denoise/n_pixel_out_reg [1]), .O(n2710) );
  MAO222 U3763 ( .A1(\denoise/sum9 [1]), .B1(n2710), .C1(\denoise/sum9 [0]), 
        .O(n2708) );
  NR2 U3764 ( .I1(n2709), .I2(n2708), .O(n2715) );
  MOAI1S U3765 ( .A1(n2712), .A2(n2711), .B1(n2712), .B2(n2710), .O(n2713) );
  INV1S U3766 ( .I(n2713), .O(n2714) );
  OAI12HS U3767 ( .B1(n2716), .B2(n2715), .A1(n2714), .O(
        \denoise/n_pixel_out_reg [0]) );
  NR2 U3768 ( .I1(\wb/color_r [0]), .I2(\wb/color_r [1]), .O(n2734) );
  INV1S U3769 ( .I(\wb/color_r [0]), .O(n2717) );
  INV1S U3770 ( .I(\wb/color_r [1]), .O(n2718) );
  AO222 U3771 ( .A1(n2734), .A2(\wb/K_R_r [7]), .B1(n1775), .B2(\wb/K_G_r [7]), 
        .C1(n2733), .C2(\wb/K_B_r [7]), .O(n2719) );
  INV1S U3772 ( .I(n2719), .O(n2720) );
  INV1S U3773 ( .I(\wb/value_r [7]), .O(n2735) );
  NR2 U3774 ( .I1(n1855), .I2(n2735), .O(\DP_OP_654J1_124_416/n99 ) );
  NR2 U3775 ( .I1(n1855), .I2(n1782), .O(\DP_OP_654J1_124_416/n100 ) );
  NR2 U3776 ( .I1(n2720), .I2(n1784), .O(\DP_OP_654J1_124_416/n101 ) );
  NR2 U3777 ( .I1(n2720), .I2(n1786), .O(\DP_OP_654J1_124_416/n102 ) );
  NR2 U3778 ( .I1(n2720), .I2(n1788), .O(\DP_OP_654J1_124_416/n103 ) );
  NR2 U3779 ( .I1(n2720), .I2(n1790), .O(\DP_OP_654J1_124_416/n104 ) );
  NR2 U3780 ( .I1(n2720), .I2(n1792), .O(\DP_OP_654J1_124_416/n105 ) );
  NR2 U3781 ( .I1(n2720), .I2(n1764), .O(\DP_OP_654J1_124_416/n106 ) );
  AO222 U3782 ( .A1(n1773), .A2(\wb/K_R_r [6]), .B1(n1770), .B2(\wb/K_B_r [6]), 
        .C1(n1774), .C2(\wb/K_G_r [6]), .O(n2721) );
  INV1S U3783 ( .I(n2721), .O(n2722) );
  NR2 U3784 ( .I1(n1857), .I2(n1780), .O(\DP_OP_654J1_124_416/n107 ) );
  NR2 U3785 ( .I1(n1857), .I2(n1781), .O(\DP_OP_654J1_124_416/n108 ) );
  NR2 U3786 ( .I1(n2722), .I2(n1784), .O(\DP_OP_654J1_124_416/n109 ) );
  NR2 U3787 ( .I1(n2722), .I2(n1785), .O(\DP_OP_654J1_124_416/n110 ) );
  NR2 U3788 ( .I1(n2722), .I2(n1787), .O(\DP_OP_654J1_124_416/n111 ) );
  NR2 U3789 ( .I1(n2722), .I2(n1789), .O(\DP_OP_654J1_124_416/n112 ) );
  NR2 U3790 ( .I1(n2722), .I2(n1791), .O(\DP_OP_654J1_124_416/n113 ) );
  NR2 U3791 ( .I1(n2722), .I2(n1765), .O(\DP_OP_654J1_124_416/n114 ) );
  AO222 U3792 ( .A1(n1773), .A2(\wb/K_R_r [5]), .B1(n1770), .B2(\wb/K_B_r [5]), 
        .C1(n1774), .C2(\wb/K_G_r [5]), .O(n2723) );
  INV1S U3793 ( .I(n2723), .O(n2724) );
  NR2 U3794 ( .I1(n1861), .I2(n2735), .O(\DP_OP_654J1_124_416/n115 ) );
  NR2 U3795 ( .I1(n1861), .I2(n1782), .O(\DP_OP_654J1_124_416/n116 ) );
  NR2 U3796 ( .I1(n2724), .I2(n1783), .O(\DP_OP_654J1_124_416/n117 ) );
  NR2 U3797 ( .I1(n2724), .I2(n1786), .O(\DP_OP_654J1_124_416/n118 ) );
  NR2 U3798 ( .I1(n2724), .I2(n1788), .O(\DP_OP_654J1_124_416/n119 ) );
  NR2 U3799 ( .I1(n2724), .I2(n1790), .O(\DP_OP_654J1_124_416/n120 ) );
  NR2 U3800 ( .I1(n2724), .I2(n1792), .O(\DP_OP_654J1_124_416/n121 ) );
  NR2 U3801 ( .I1(n2724), .I2(n1765), .O(\DP_OP_654J1_124_416/n122 ) );
  AO222 U3802 ( .A1(n2734), .A2(\wb/K_R_r [4]), .B1(n2733), .B2(\wb/K_B_r [4]), 
        .C1(n1775), .C2(\wb/K_G_r [4]), .O(n2725) );
  INV1S U3803 ( .I(n2725), .O(n2726) );
  NR2 U3804 ( .I1(n1860), .I2(n1780), .O(\DP_OP_654J1_124_416/n123 ) );
  NR2 U3805 ( .I1(n1860), .I2(n1781), .O(\DP_OP_654J1_124_416/n124 ) );
  NR2 U3806 ( .I1(n2726), .I2(n1783), .O(\DP_OP_654J1_124_416/n125 ) );
  NR2 U3807 ( .I1(n2726), .I2(n1785), .O(\DP_OP_654J1_124_416/n126 ) );
  NR2 U3808 ( .I1(n2726), .I2(n1788), .O(\DP_OP_654J1_124_416/n127 ) );
  NR2 U3809 ( .I1(n2726), .I2(n1790), .O(\DP_OP_654J1_124_416/n128 ) );
  NR2 U3810 ( .I1(n2726), .I2(n1791), .O(\DP_OP_654J1_124_416/n129 ) );
  NR2 U3811 ( .I1(n2726), .I2(n1764), .O(\DP_OP_654J1_124_416/n130 ) );
  AO222 U3812 ( .A1(n1773), .A2(\wb/K_R_r [3]), .B1(n2733), .B2(\wb/K_B_r [3]), 
        .C1(n1775), .C2(\wb/K_G_r [3]), .O(n2727) );
  INV1S U3813 ( .I(n2727), .O(n2728) );
  NR2 U3814 ( .I1(n1858), .I2(n2735), .O(\DP_OP_654J1_124_416/n131 ) );
  NR2 U3815 ( .I1(n1858), .I2(n1782), .O(\DP_OP_654J1_124_416/n132 ) );
  NR2 U3816 ( .I1(n2728), .I2(n1784), .O(\DP_OP_654J1_124_416/n133 ) );
  NR2 U3817 ( .I1(n2728), .I2(n1785), .O(\DP_OP_654J1_124_416/n134 ) );
  NR2 U3818 ( .I1(n2728), .I2(n1787), .O(\DP_OP_654J1_124_416/n135 ) );
  NR2 U3819 ( .I1(n2728), .I2(n1789), .O(\DP_OP_654J1_124_416/n136 ) );
  NR2 U3820 ( .I1(n2728), .I2(n1792), .O(\DP_OP_654J1_124_416/n137 ) );
  NR2 U3821 ( .I1(n2728), .I2(n1765), .O(\DP_OP_654J1_124_416/n138 ) );
  AO222 U3822 ( .A1(n2734), .A2(\wb/K_R_r [2]), .B1(n1770), .B2(\wb/K_B_r [2]), 
        .C1(n1775), .C2(\wb/K_G_r [2]), .O(n2729) );
  INV1S U3823 ( .I(n2729), .O(n2730) );
  NR2 U3824 ( .I1(n1859), .I2(n1780), .O(\DP_OP_654J1_124_416/n139 ) );
  NR2 U3825 ( .I1(n1859), .I2(n1781), .O(\DP_OP_654J1_124_416/n140 ) );
  NR2 U3826 ( .I1(n2730), .I2(n1783), .O(\DP_OP_654J1_124_416/n141 ) );
  NR2 U3827 ( .I1(n2730), .I2(n1786), .O(\DP_OP_654J1_124_416/n142 ) );
  NR2 U3828 ( .I1(n2730), .I2(n1787), .O(\DP_OP_654J1_124_416/n143 ) );
  NR2 U3829 ( .I1(n2730), .I2(n1790), .O(\DP_OP_654J1_124_416/n144 ) );
  NR2 U3830 ( .I1(n2730), .I2(n1791), .O(\DP_OP_654J1_124_416/n145 ) );
  NR2 U3831 ( .I1(n2730), .I2(n1764), .O(\DP_OP_654J1_124_416/n146 ) );
  AO222 U3832 ( .A1(n1773), .A2(\wb/K_R_r [1]), .B1(n1770), .B2(\wb/K_B_r [1]), 
        .C1(n1774), .C2(\wb/K_G_r [1]), .O(n2731) );
  NR2 U3833 ( .I1(n1856), .I2(n2735), .O(\DP_OP_654J1_124_416/n147 ) );
  NR2 U3834 ( .I1(n1856), .I2(n1782), .O(\DP_OP_654J1_124_416/n148 ) );
  NR2 U3835 ( .I1(n2732), .I2(n1783), .O(\DP_OP_654J1_124_416/n149 ) );
  NR2 U3836 ( .I1(n2732), .I2(n1786), .O(\DP_OP_654J1_124_416/n150 ) );
  NR2 U3837 ( .I1(n2732), .I2(n1788), .O(\DP_OP_654J1_124_416/n151 ) );
  NR2 U3838 ( .I1(n2732), .I2(n1789), .O(\DP_OP_654J1_124_416/n152 ) );
  NR2 U3839 ( .I1(n2732), .I2(n1791), .O(\DP_OP_654J1_124_416/n153 ) );
  NR2 U3840 ( .I1(n2732), .I2(n1764), .O(\DP_OP_654J1_124_416/n154 ) );
  NR2 U3841 ( .I1(n1850), .I2(n1780), .O(\DP_OP_654J1_124_416/n155 ) );
  NR2 U3842 ( .I1(n1850), .I2(n1781), .O(\DP_OP_654J1_124_416/n156 ) );
  NR2 U3843 ( .I1(n1851), .I2(n1784), .O(\DP_OP_654J1_124_416/n157 ) );
  NR2 U3844 ( .I1(n1850), .I2(n1785), .O(\DP_OP_654J1_124_416/n158 ) );
  NR2 U3845 ( .I1(n1851), .I2(n1787), .O(\DP_OP_654J1_124_416/n159 ) );
  NR2 U3846 ( .I1(n1850), .I2(n1789), .O(\DP_OP_654J1_124_416/n160 ) );
  NR2 U3847 ( .I1(n1851), .I2(n1792), .O(\DP_OP_654J1_124_416/n161 ) );
  INV1S U3848 ( .I(n2770), .O(n2736) );
  OR2 U3849 ( .I1(k_b_out_gain[8]), .I2(n2736), .O(k_b_in_wb[8]) );
  OR2 U3850 ( .I1(k_r_out_gain[8]), .I2(n2736), .O(k_r_in_wb[8]) );
  OR2 U3851 ( .I1(k_g_out_gain[7]), .I2(n2736), .O(k_g_in_wb[7]) );
  OR2 U3852 ( .I1(k_b_out_gain[5]), .I2(n2736), .O(k_b_in_wb[5]) );
  OR2 U3853 ( .I1(k_g_out_gain[5]), .I2(n2736), .O(k_g_in_wb[5]) );
  OR2 U3854 ( .I1(k_r_out_gain[5]), .I2(n2736), .O(k_r_in_wb[5]) );
  OR2 U3855 ( .I1(k_b_out_gain[4]), .I2(n2737), .O(k_b_in_wb[4]) );
  OR2 U3856 ( .I1(k_g_out_gain[4]), .I2(n2737), .O(k_g_in_wb[4]) );
  OR2 U3857 ( .I1(k_r_out_gain[4]), .I2(n2737), .O(k_r_in_wb[4]) );
  AN2 U3858 ( .I1(n2745), .I2(n2738), .O(n2740) );
  XNR2HS U3859 ( .I1(n2741), .I2(n2745), .O(n2739) );
  MUX2 U3860 ( .A(n2740), .B(n2739), .S(\gain/K_mean_w [3]), .O(n2744) );
  INV1S U3861 ( .I(\gain/K_mean_w [3]), .O(n2742) );
  MOAI1S U3862 ( .A1(n2742), .A2(n2741), .B1(n2741), .B2(n2742), .O(n2743) );
  MUX2 U3863 ( .A(n2744), .B(n2743), .S(n2746), .O(n2758) );
  MOAI1 U3864 ( .A1(n2746), .A2(n2745), .B1(n2745), .B2(n2746), .O(n2753) );
  INV1S U3865 ( .I(n2753), .O(n2750) );
  FA1 U3866 ( .A(n3381), .B(n2748), .CI(n2747), .CO(n2077), .S(n2749) );
  INV1S U3867 ( .I(n2749), .O(n2756) );
  NR2 U3868 ( .I1(n2750), .I2(n2756), .O(n2751) );
  OR2 U3869 ( .I1(n2758), .I2(n2751), .O(\gain/K_mean_w [1]) );
  INV1S U3870 ( .I(n2752), .O(n2757) );
  NR2 U3871 ( .I1(n2756), .I2(n2757), .O(n2754) );
  INV1S U3872 ( .I(n2758), .O(n2759) );
  NR2 U3873 ( .I1(n1961), .I2(n2759), .O(n2760) );
  MUX2 U3874 ( .A(n2755), .B(n2760), .S(\gain/K_mean_w [1]), .O(
        \gain/K_mean_w [0]) );
  FA1S U3875 ( .A(\denoise/pos7 [6]), .B(\denoise/pos9 [6]), .CI(
        \denoise/pos8 [6]), .CO(\intadd_5/B[7] ), .S(\intadd_5/A[6] ) );
  FA1S U3876 ( .A(\denoise/pos7 [5]), .B(\denoise/pos9 [5]), .CI(
        \denoise/pos8 [5]), .CO(\intadd_5/B[6] ), .S(\intadd_5/A[5] ) );
  FA1S U3877 ( .A(\denoise/pos7 [4]), .B(\denoise/pos9 [4]), .CI(
        \denoise/pos8 [4]), .CO(\intadd_5/B[5] ), .S(\intadd_5/A[4] ) );
  FA1S U3878 ( .A(\denoise/pos7 [3]), .B(\denoise/pos9 [3]), .CI(
        \denoise/pos8 [3]), .CO(\intadd_5/B[4] ), .S(\intadd_5/A[3] ) );
  FA1S U3879 ( .A(\denoise/pos7 [2]), .B(\denoise/pos9 [2]), .CI(
        \denoise/pos8 [2]), .CO(\intadd_5/B[3] ), .S(\intadd_5/A[2] ) );
  NR2 U3880 ( .I1(\denoise/pos8 [1]), .I2(\denoise/pos7 [1]), .O(n2761) );
  NR2 U3881 ( .I1(\intadd_5/B[2] ), .I2(n2761), .O(\intadd_5/B[1] ) );
  FA1S U3882 ( .A(\denoise/pos7 [7]), .B(\denoise/pos9 [7]), .CI(
        \denoise/pos8 [7]), .CO(n2763), .S(\intadd_5/A[7] ) );
  NR2 U3883 ( .I1(\denoise/sum3 [1]), .I2(\denoise/sum6 [1]), .O(n2762) );
  NR2 U3884 ( .I1(\intadd_4/CI ), .I2(n2762), .O(\intadd_3/A[1] ) );
  NR2 U3885 ( .I1(\intadd_5/n1 ), .I2(n2763), .O(n2764) );
  NR2 U3886 ( .I1(\denoise/n_new_sum6 [9]), .I2(n2764), .O(
        \denoise/n_new_sum6 [8]) );
  NR2 U3887 ( .I1(\intadd_3/n1 ), .I2(\intadd_4/n1 ), .O(n2765) );
  NR2 U3888 ( .I1(\denoise/n_sum9 [11]), .I2(n2765), .O(\denoise/n_sum9 [10])
         );
  INV1S U3889 ( .I(\mean/last_state_r [0]), .O(n2767) );
  OR2 U3890 ( .I1(last_pic_in_mean), .I2(n2767), .O(n2766) );
  MOAI1S U3891 ( .A1(\mean/last_state_r [1]), .A2(n2766), .B1(last_pic_in_mean), .B2(n2767), .O(\mean/last_state_w [0]) );
  MOAI1S U3892 ( .A1(\mean/last_state_r [1]), .A2(n2768), .B1(
        \mean/last_state_r [1]), .B2(n2767), .O(\mean/last_state_w [1]) );
  MUX2 U3893 ( .A(last_pic_out), .B(last_pic_out_wb), .S(n1848), .O(
        last_pic_in_gamma) );
  MOAI1S U3894 ( .A1(n1846), .A2(n3594), .B1(n1849), .B2(color_out_wb[0]), .O(
        color_in_gamma[0]) );
  MOAI1S U3895 ( .A1(n1847), .A2(n3595), .B1(n1846), .B2(color_out_wb[1]), .O(
        color_in_gamma[1]) );
  MOAI1S U3896 ( .A1(n1848), .A2(n2785), .B1(n1847), .B2(valid_value_out_wb), 
        .O(valid_in_gamma) );
  INV1S U3897 ( .I(pixel_in_wb[0]), .O(n2786) );
  MOAI1S U3898 ( .A1(n1849), .A2(n2786), .B1(n1848), .B2(pixel_out_wb[0]), .O(
        pixel_in_gamma[0]) );
  INV1S U3899 ( .I(pixel_in_wb[1]), .O(n2787) );
  MOAI1S U3900 ( .A1(n1846), .A2(n2787), .B1(n1849), .B2(pixel_out_wb[1]), .O(
        pixel_in_gamma[1]) );
  INV1S U3901 ( .I(pixel_in_wb[2]), .O(n2788) );
  MOAI1S U3902 ( .A1(n1847), .A2(n2788), .B1(n1846), .B2(pixel_out_wb[2]), .O(
        pixel_in_gamma[2]) );
  INV1S U3903 ( .I(pixel_in_wb[3]), .O(n2789) );
  MOAI1S U3904 ( .A1(n1848), .A2(n2789), .B1(n1847), .B2(pixel_out_wb[3]), .O(
        pixel_in_gamma[3]) );
  INV1S U3905 ( .I(pixel_in_wb[4]), .O(n2790) );
  MOAI1S U3906 ( .A1(n1849), .A2(n2790), .B1(n1848), .B2(pixel_out_wb[4]), .O(
        pixel_in_gamma[4]) );
  INV1S U3907 ( .I(pixel_in_wb[5]), .O(n2791) );
  MOAI1S U3908 ( .A1(n1846), .A2(n2791), .B1(n1849), .B2(pixel_out_wb[5]), .O(
        pixel_in_gamma[5]) );
  INV1S U3909 ( .I(pixel_in_wb[6]), .O(n2792) );
  MOAI1S U3910 ( .A1(n1847), .A2(n2792), .B1(n1846), .B2(pixel_out_wb[6]), .O(
        pixel_in_gamma[6]) );
  MOAI1S U3911 ( .A1(n1848), .A2(n2793), .B1(n1847), .B2(pixel_out_wb[7]), .O(
        pixel_in_gamma[7]) );
  AO22 U3912 ( .A1(n2770), .A2(valid_out_gain), .B1(n2814), .B2(last_col_in), 
        .O(valid_gain_in_wb) );
  MOAI1S U3913 ( .A1(n2021), .A2(n2785), .B1(n1945), .B2(finish_out_mean), .O(
        valid_in_gain) );
  INV1S U3914 ( .I(n2772), .O(n2776) );
  MOAI1S U3915 ( .A1(n2775), .A2(n3594), .B1(n2776), .B2(color_out_den[0]), 
        .O(color_in_mean[0]) );
  MOAI1S U3916 ( .A1(n2775), .A2(n3595), .B1(n2776), .B2(color_out_den[1]), 
        .O(color_in_mean[1]) );
  MOAI1S U3917 ( .A1(n2775), .A2(n2785), .B1(n2774), .B2(valid_out_den), .O(
        valid_in_mean) );
  MOAI1S U3918 ( .A1(n2775), .A2(n2786), .B1(n2774), .B2(pixel_out_den[0]), 
        .O(pixel_in_mean[0]) );
  MOAI1S U3919 ( .A1(n2773), .A2(n2787), .B1(n2774), .B2(pixel_out_den[1]), 
        .O(pixel_in_mean[1]) );
  MOAI1S U3920 ( .A1(n2777), .A2(n2788), .B1(n2774), .B2(pixel_out_den[2]), 
        .O(pixel_in_mean[2]) );
  MOAI1S U3921 ( .A1(n2775), .A2(n2789), .B1(n2774), .B2(pixel_out_den[3]), 
        .O(pixel_in_mean[3]) );
  MOAI1S U3922 ( .A1(n2777), .A2(n2790), .B1(n2776), .B2(pixel_out_den[4]), 
        .O(pixel_in_mean[4]) );
  MOAI1S U3923 ( .A1(n2777), .A2(n2791), .B1(n2776), .B2(pixel_out_den[5]), 
        .O(pixel_in_mean[5]) );
  MOAI1S U3924 ( .A1(n2777), .A2(n2792), .B1(n2776), .B2(pixel_out_den[6]), 
        .O(pixel_in_mean[6]) );
  MOAI1S U3925 ( .A1(n2777), .A2(n2793), .B1(n2776), .B2(pixel_out_den[7]), 
        .O(pixel_in_mean[7]) );
  BUF1 U3926 ( .I(n2778), .O(n2781) );
  MOAI1S U3927 ( .A1(n2781), .A2(n2786), .B1(n2779), .B2(pixel_out_dem[0]), 
        .O(pixel_in_den[0]) );
  MOAI1S U3928 ( .A1(n2781), .A2(n2787), .B1(n2779), .B2(pixel_out_dem[1]), 
        .O(pixel_in_den[1]) );
  MOAI1S U3929 ( .A1(n2781), .A2(n2788), .B1(n2779), .B2(pixel_out_dem[2]), 
        .O(pixel_in_den[2]) );
  MOAI1S U3930 ( .A1(n2781), .A2(n2789), .B1(n2779), .B2(pixel_out_dem[3]), 
        .O(pixel_in_den[3]) );
  MOAI1S U3931 ( .A1(n2780), .A2(n2790), .B1(n2779), .B2(pixel_out_dem[4]), 
        .O(pixel_in_den[4]) );
  MOAI1S U3932 ( .A1(n2781), .A2(n2791), .B1(n2780), .B2(pixel_out_dem[5]), 
        .O(pixel_in_den[5]) );
  MOAI1S U3933 ( .A1(n2781), .A2(n2792), .B1(n2780), .B2(pixel_out_dem[6]), 
        .O(pixel_in_den[6]) );
  AN2B1S U3934 ( .I1(n2782), .B1(n1816), .O(n2794) );
  NR2 U3935 ( .I1(n1799), .I2(n2783), .O(last_pic_in_dem) );
  NR2 U3936 ( .I1(n2794), .I2(n2784), .O(last_col_in_dem) );
  NR2 U3937 ( .I1(n1799), .I2(n2785), .O(valid_in_dem) );
  NR2 U3938 ( .I1(n2794), .I2(n2786), .O(pixel_in_dem[0]) );
  NR2 U3939 ( .I1(n1799), .I2(n2787), .O(pixel_in_dem[1]) );
  NR2 U3940 ( .I1(n2794), .I2(n2788), .O(pixel_in_dem[2]) );
  NR2 U3941 ( .I1(n1799), .I2(n2789), .O(pixel_in_dem[3]) );
  NR2 U3942 ( .I1(n2794), .I2(n2790), .O(pixel_in_dem[4]) );
  NR2 U3943 ( .I1(n1799), .I2(n2791), .O(pixel_in_dem[5]) );
  NR2 U3944 ( .I1(n2794), .I2(n2792), .O(pixel_in_dem[6]) );
  NR2 U3945 ( .I1(n1799), .I2(n2793), .O(pixel_in_dem[7]) );
  MAO222 U3946 ( .A1(\mean/last_state_r [1]), .B1(\mean/last_state_r [0]), 
        .C1(finish_out_mean), .O(n1720) );
  MOAI1S U3947 ( .A1(n2795), .A2(n2821), .B1(r_mean_out_mean[7]), .B2(n2820), 
        .O(n2800) );
  ND2S U3948 ( .I1(pixel_out_den[7]), .I2(n1801), .O(n2798) );
  AOI22S U3949 ( .A1(n1817), .A2(pixel_out_dem[7]), .B1(n1886), .B2(
        pixel_out_gamma[7]), .O(n2797) );
  AOI22S U3950 ( .A1(n1822), .A2(k_r_out_gain[7]), .B1(n2814), .B2(
        pixel_out_wb[7]), .O(n2796) );
  ND3 U3951 ( .I1(n2798), .I2(n2797), .I3(n2796), .O(n2799) );
  AO112 U3952 ( .C1(g_mean_out_mean[7]), .C2(n1772), .A1(n2800), .B1(n2799), 
        .O(n1718) );
  MOAI1S U3953 ( .A1(n2801), .A2(n1758), .B1(r_mean_out_mean[6]), .B2(n2820), 
        .O(n2806) );
  ND2S U3954 ( .I1(pixel_out_dem[6]), .I2(n2470), .O(n2804) );
  AOI22S U3955 ( .A1(n1885), .A2(pixel_out_gamma[6]), .B1(pixel_out_den[6]), 
        .B2(n1800), .O(n2803) );
  AOI22S U3956 ( .A1(n1822), .A2(k_r_out_gain[6]), .B1(n2824), .B2(
        pixel_out_wb[6]), .O(n2802) );
  ND3 U3957 ( .I1(n2804), .I2(n2803), .I3(n2802), .O(n2805) );
  AO112 U3958 ( .C1(g_mean_out_mean[6]), .C2(n2831), .A1(n2806), .B1(n2805), 
        .O(n1717) );
  MOAI1S U3959 ( .A1(n2807), .A2(n1758), .B1(r_mean_out_mean[4]), .B2(n2820), 
        .O(n2812) );
  ND2S U3960 ( .I1(pixel_out_dem[4]), .I2(n1817), .O(n2810) );
  AOI22S U3961 ( .A1(n1885), .A2(pixel_out_gamma[4]), .B1(pixel_out_den[4]), 
        .B2(n1801), .O(n2809) );
  AOI22S U3962 ( .A1(n1823), .A2(k_r_out_gain[4]), .B1(n2824), .B2(
        pixel_out_wb[4]), .O(n2808) );
  ND3 U3963 ( .I1(n2810), .I2(n2809), .I3(n2808), .O(n2811) );
  AO112 U3964 ( .C1(g_mean_out_mean[4]), .C2(n1772), .A1(n2812), .B1(n2811), 
        .O(n1715) );
  MOAI1S U3965 ( .A1(n2813), .A2(n2821), .B1(r_mean_out_mean[2]), .B2(n2820), 
        .O(n2819) );
  ND2S U3966 ( .I1(pixel_out_dem[2]), .I2(n1816), .O(n2817) );
  AOI22S U3967 ( .A1(n1886), .A2(pixel_out_gamma[2]), .B1(pixel_out_den[2]), 
        .B2(n1802), .O(n2816) );
  AOI22S U3968 ( .A1(n1823), .A2(k_r_out_gain[2]), .B1(n2814), .B2(
        pixel_out_wb[2]), .O(n2815) );
  ND3 U3969 ( .I1(n2817), .I2(n2816), .I3(n2815), .O(n2818) );
  AO112 U3970 ( .C1(g_mean_out_mean[2]), .C2(n2831), .A1(n2819), .B1(n2818), 
        .O(n1713) );
  MOAI1S U3971 ( .A1(n2822), .A2(n2821), .B1(r_mean_out_mean[1]), .B2(n2820), 
        .O(n2830) );
  ND2S U3972 ( .I1(pixel_out_dem[1]), .I2(n1817), .O(n2828) );
  AOI22S U3973 ( .A1(n1886), .A2(pixel_out_gamma[1]), .B1(pixel_out_den[1]), 
        .B2(n1800), .O(n2827) );
  AOI22S U3974 ( .A1(n1822), .A2(k_r_out_gain[1]), .B1(n2824), .B2(
        pixel_out_wb[1]), .O(n2826) );
  ND3 U3975 ( .I1(n2828), .I2(n2827), .I3(n2826), .O(n2829) );
  AO112 U3976 ( .C1(g_mean_out_mean[1]), .C2(n1772), .A1(n2830), .B1(n2829), 
        .O(n1712) );
  AO22 U3977 ( .A1(n1817), .A2(last_col_out_dem), .B1(last_col_out_den), .B2(
        n1800), .O(n1707) );
  INV1S U3978 ( .I(\denoise/n_counter_1 [1]), .O(n2916) );
  INV1S U3979 ( .I(\denoise/n_counter_1 [0]), .O(n2923) );
  AOI22S U3980 ( .A1(n2923), .A2(n2916), .B1(n2834), .B2(n2833), .O(n2835) );
  MOAI1S U3981 ( .A1(n2836), .A2(n2916), .B1(n2835), .B2(n2934), .O(n1704) );
  MOAI1S U3982 ( .A1(n2923), .A2(n2836), .B1(n2923), .B2(n2836), .O(n1703) );
  AN2 U3983 ( .I1(\denoise/n_state_1 [0]), .I2(n2837), .O(n2840) );
  INV1S U3984 ( .I(\denoise/n_counter_1 [2]), .O(n2917) );
  OAI22S U3985 ( .A1(n2840), .A2(n2839), .B1(n2838), .B2(n2943), .O(n1702) );
  NR2 U3986 ( .I1(n1755), .I2(n2931), .O(n2841) );
  OAI22S U3987 ( .A1(n1909), .A2(\denoise/init_12_last_flag ), .B1(n2916), 
        .B2(\denoise/init_12_last_flag ), .O(n2842) );
  NR3 U3988 ( .I1(\denoise/n_state_1 [1]), .I2(\denoise/n_state_1 [0]), .I3(
        n2842), .O(n1700) );
  AN2 U3989 ( .I1(\denoise/valid_in_reg ), .I2(n2843), .O(n2846) );
  AOI22S U3990 ( .A1(\denoise/valid_in_reg ), .A2(n3581), .B1(n2846), .B2(
        n2844), .O(n1699) );
  AOI22S U3991 ( .A1(n1769), .A2(n3582), .B1(n2846), .B2(n2845), .O(n1698) );
  MOAI1S U3992 ( .A1(n2859), .A2(n2847), .B1(n2902), .B2(
        \denoise/first_col_r[4][0] ), .O(n1689) );
  MOAI1S U3993 ( .A1(n2858), .A2(n1920), .B1(n2900), .B2(
        \denoise/second_col_r[5][1] ), .O(n1659) );
  MOAI1S U3994 ( .A1(n2859), .A2(n1917), .B1(n2902), .B2(
        \denoise/second_col_r[4][1] ), .O(n1658) );
  MOAI1S U3995 ( .A1(n2860), .A2(n1918), .B1(n2904), .B2(
        \denoise/second_col_r[3][1] ), .O(n1657) );
  MOAI1S U3996 ( .A1(n2861), .A2(n1919), .B1(n2906), .B2(
        \denoise/second_col_r[2][1] ), .O(n1656) );
  MOAI1S U3997 ( .A1(n2862), .A2(n1920), .B1(n2908), .B2(
        \denoise/second_col_r[1][1] ), .O(n1655) );
  MOAI1S U3998 ( .A1(n2863), .A2(n1917), .B1(n2910), .B2(
        \denoise/second_col_r[0][1] ), .O(n1654) );
  MOAI1S U3999 ( .A1(n2859), .A2(n2848), .B1(n2893), .B2(
        \denoise/first_col_r[4][1] ), .O(n1652) );
  MOAI1S U4000 ( .A1(n2864), .A2(n1918), .B1(n2849), .B2(
        \denoise/second_col_g[0][1] ), .O(n1647) );
  MOAI1S U4001 ( .A1(n2866), .A2(n1919), .B1(n2850), .B2(
        \denoise/second_col_g[1][1] ), .O(n1646) );
  MOAI1S U4002 ( .A1(n2868), .A2(n1920), .B1(n2851), .B2(
        \denoise/second_col_g[2][1] ), .O(n1645) );
  MOAI1S U4003 ( .A1(n2870), .A2(n1917), .B1(n2852), .B2(
        \denoise/second_col_g[3][1] ), .O(n1644) );
  MOAI1S U4004 ( .A1(n2872), .A2(n1918), .B1(n2912), .B2(
        \denoise/second_col_g[5][1] ), .O(n1642) );
  MOAI1S U4005 ( .A1(n2873), .A2(n1919), .B1(n2853), .B2(
        \denoise/second_col_b[0][1] ), .O(n1635) );
  MOAI1S U4006 ( .A1(n2875), .A2(n1920), .B1(n2854), .B2(
        \denoise/second_col_b[1][1] ), .O(n1634) );
  MOAI1S U4007 ( .A1(n2877), .A2(n1917), .B1(n2855), .B2(
        \denoise/second_col_b[2][1] ), .O(n1633) );
  MOAI1S U4008 ( .A1(n2879), .A2(n1918), .B1(n2856), .B2(
        \denoise/second_col_b[3][1] ), .O(n1632) );
  MOAI1S U4009 ( .A1(n2881), .A2(n1919), .B1(n2914), .B2(
        \denoise/second_col_b[5][1] ), .O(n1630) );
  MOAI1S U4010 ( .A1(n2883), .A2(n1923), .B1(n2882), .B2(
        \denoise/pixel_in_reg [2]), .O(n1623) );
  MOAI1S U4011 ( .A1(n2884), .A2(n1924), .B1(n2892), .B2(
        \denoise/second_col_r[5][2] ), .O(n1622) );
  MOAI1S U4012 ( .A1(n2885), .A2(n1921), .B1(n2893), .B2(
        \denoise/second_col_r[4][2] ), .O(n1621) );
  MOAI1S U4013 ( .A1(n2886), .A2(n1922), .B1(n2894), .B2(
        \denoise/second_col_r[3][2] ), .O(n1620) );
  MOAI1S U4014 ( .A1(n2887), .A2(n1923), .B1(n2895), .B2(
        \denoise/second_col_r[2][2] ), .O(n1619) );
  MOAI1S U4015 ( .A1(n2888), .A2(n1924), .B1(n2896), .B2(
        \denoise/second_col_r[1][2] ), .O(n1618) );
  MOAI1S U4016 ( .A1(n2889), .A2(n1921), .B1(n2897), .B2(
        \denoise/second_col_r[0][2] ), .O(n1617) );
  MOAI1S U4017 ( .A1(n2885), .A2(n2857), .B1(n2859), .B2(
        \denoise/first_col_r[4][2] ), .O(n1615) );
  MOAI1S U4018 ( .A1(n2890), .A2(n1922), .B1(n2898), .B2(
        \denoise/second_col_g[5][2] ), .O(n1605) );
  MOAI1S U4019 ( .A1(n2891), .A2(n1923), .B1(n2899), .B2(
        \denoise/second_col_b[5][2] ), .O(n1593) );
  MOAI1S U4020 ( .A1(n2883), .A2(n1927), .B1(n2882), .B2(
        \denoise/pixel_in_reg [3]), .O(n1586) );
  MOAI1S U4021 ( .A1(n2884), .A2(n1928), .B1(n2858), .B2(
        \denoise/second_col_r[5][3] ), .O(n1585) );
  MOAI1S U4022 ( .A1(n2885), .A2(n1925), .B1(n2859), .B2(
        \denoise/second_col_r[4][3] ), .O(n1584) );
  MOAI1S U4023 ( .A1(n2886), .A2(n1926), .B1(n2860), .B2(
        \denoise/second_col_r[3][3] ), .O(n1583) );
  MOAI1S U4024 ( .A1(n2887), .A2(n1927), .B1(n2861), .B2(
        \denoise/second_col_r[2][3] ), .O(n1582) );
  MOAI1S U4025 ( .A1(n2888), .A2(n1928), .B1(n2862), .B2(
        \denoise/second_col_r[1][3] ), .O(n1581) );
  MOAI1S U4026 ( .A1(n2889), .A2(n1925), .B1(n2863), .B2(
        \denoise/second_col_r[0][3] ), .O(n1580) );
  MOAI1S U4027 ( .A1(n2865), .A2(n1926), .B1(n2864), .B2(
        \denoise/second_col_g[0][3] ), .O(n1573) );
  MOAI1S U4028 ( .A1(n2867), .A2(n1927), .B1(n2866), .B2(
        \denoise/second_col_g[1][3] ), .O(n1572) );
  MOAI1S U4029 ( .A1(n2869), .A2(n1928), .B1(n2868), .B2(
        \denoise/second_col_g[2][3] ), .O(n1571) );
  MOAI1S U4030 ( .A1(n2871), .A2(n1925), .B1(n2870), .B2(
        \denoise/second_col_g[3][3] ), .O(n1570) );
  MOAI1S U4031 ( .A1(n2890), .A2(n1926), .B1(n2872), .B2(
        \denoise/second_col_g[5][3] ), .O(n1568) );
  MOAI1S U4032 ( .A1(n2874), .A2(n1927), .B1(n2873), .B2(
        \denoise/second_col_b[0][3] ), .O(n1561) );
  MOAI1S U4033 ( .A1(n2876), .A2(n1928), .B1(n2875), .B2(
        \denoise/second_col_b[1][3] ), .O(n1560) );
  MOAI1S U4034 ( .A1(n2878), .A2(n1925), .B1(n2877), .B2(
        \denoise/second_col_b[2][3] ), .O(n1559) );
  MOAI1S U4035 ( .A1(n2880), .A2(n1926), .B1(n2879), .B2(
        \denoise/second_col_b[3][3] ), .O(n1558) );
  MOAI1S U4036 ( .A1(n2891), .A2(n1927), .B1(n2881), .B2(
        \denoise/second_col_b[5][3] ), .O(n1556) );
  MOAI1S U4037 ( .A1(n2883), .A2(n1931), .B1(n2882), .B2(
        \denoise/pixel_in_reg [4]), .O(n1549) );
  MOAI1S U4038 ( .A1(n2884), .A2(n1932), .B1(n2892), .B2(
        \denoise/second_col_r[5][4] ), .O(n1548) );
  MOAI1S U4039 ( .A1(n2885), .A2(n1929), .B1(n2893), .B2(
        \denoise/second_col_r[4][4] ), .O(n1547) );
  MOAI1S U4040 ( .A1(n2886), .A2(n1930), .B1(n2894), .B2(
        \denoise/second_col_r[3][4] ), .O(n1546) );
  MOAI1S U4041 ( .A1(n2887), .A2(n1931), .B1(n2895), .B2(
        \denoise/second_col_r[2][4] ), .O(n1545) );
  MOAI1S U4042 ( .A1(n2888), .A2(n1932), .B1(n2896), .B2(
        \denoise/second_col_r[1][4] ), .O(n1544) );
  MOAI1S U4043 ( .A1(n2889), .A2(n1929), .B1(n2897), .B2(
        \denoise/second_col_r[0][4] ), .O(n1543) );
  MOAI1S U4044 ( .A1(n2890), .A2(n1930), .B1(n2898), .B2(
        \denoise/second_col_g[5][4] ), .O(n1531) );
  MOAI1S U4045 ( .A1(n2891), .A2(n1931), .B1(n2899), .B2(
        \denoise/second_col_b[5][4] ), .O(n1519) );
  MOAI1S U4046 ( .A1(n2901), .A2(n1936), .B1(n2892), .B2(
        \denoise/second_col_r[5][5] ), .O(n1511) );
  MOAI1S U4047 ( .A1(n2903), .A2(n1933), .B1(n2893), .B2(
        \denoise/second_col_r[4][5] ), .O(n1510) );
  MOAI1S U4048 ( .A1(n2905), .A2(n1934), .B1(n2894), .B2(
        \denoise/second_col_r[3][5] ), .O(n1509) );
  MOAI1S U4049 ( .A1(n2907), .A2(n1935), .B1(n2895), .B2(
        \denoise/second_col_r[2][5] ), .O(n1508) );
  MOAI1S U4050 ( .A1(n2909), .A2(n1936), .B1(n2896), .B2(
        \denoise/second_col_r[1][5] ), .O(n1507) );
  MOAI1S U4051 ( .A1(n2911), .A2(n1933), .B1(n2897), .B2(
        \denoise/second_col_r[0][5] ), .O(n1506) );
  MOAI1S U4052 ( .A1(n2913), .A2(n1934), .B1(n2898), .B2(
        \denoise/second_col_g[5][5] ), .O(n1494) );
  MOAI1S U4053 ( .A1(n2915), .A2(n1935), .B1(n2899), .B2(
        \denoise/second_col_b[5][5] ), .O(n1482) );
  MOAI1S U4054 ( .A1(n2901), .A2(n1940), .B1(n2900), .B2(
        \denoise/second_col_r[5][6] ), .O(n1474) );
  MOAI1S U4055 ( .A1(n2903), .A2(n1937), .B1(n2902), .B2(
        \denoise/second_col_r[4][6] ), .O(n1473) );
  MOAI1S U4056 ( .A1(n2905), .A2(n1938), .B1(n2904), .B2(
        \denoise/second_col_r[3][6] ), .O(n1472) );
  MOAI1S U4057 ( .A1(n2907), .A2(n1939), .B1(n2906), .B2(
        \denoise/second_col_r[2][6] ), .O(n1471) );
  MOAI1S U4058 ( .A1(n2909), .A2(n1940), .B1(n2908), .B2(
        \denoise/second_col_r[1][6] ), .O(n1470) );
  MOAI1S U4059 ( .A1(n2911), .A2(n1937), .B1(n2910), .B2(
        \denoise/second_col_r[0][6] ), .O(n1469) );
  MOAI1S U4060 ( .A1(n2913), .A2(n1938), .B1(n2912), .B2(
        \denoise/second_col_g[5][6] ), .O(n1457) );
  MOAI1S U4061 ( .A1(n2915), .A2(n1939), .B1(n2914), .B2(
        \denoise/second_col_b[5][6] ), .O(n1445) );
  MOAI1S U4062 ( .A1(n2901), .A2(n1944), .B1(n2900), .B2(
        \denoise/second_col_r[5][7] ), .O(n1437) );
  MOAI1S U4063 ( .A1(n2903), .A2(n1941), .B1(n2902), .B2(
        \denoise/second_col_r[4][7] ), .O(n1436) );
  MOAI1S U4064 ( .A1(n2905), .A2(n1942), .B1(n2904), .B2(
        \denoise/second_col_r[3][7] ), .O(n1435) );
  MOAI1S U4065 ( .A1(n2907), .A2(n1943), .B1(n2906), .B2(
        \denoise/second_col_r[2][7] ), .O(n1434) );
  MOAI1S U4066 ( .A1(n2909), .A2(n1944), .B1(n2908), .B2(
        \denoise/second_col_r[1][7] ), .O(n1433) );
  MOAI1S U4067 ( .A1(n2911), .A2(n1941), .B1(n2910), .B2(
        \denoise/second_col_r[0][7] ), .O(n1432) );
  MOAI1S U4068 ( .A1(n2913), .A2(n1942), .B1(n2912), .B2(
        \denoise/second_col_g[5][7] ), .O(n1420) );
  MOAI1S U4069 ( .A1(n2915), .A2(n1943), .B1(n2914), .B2(
        \denoise/second_col_b[5][7] ), .O(n1408) );
  ND3 U4070 ( .I1(n2917), .I2(n2923), .I3(n2916), .O(n2940) );
  NR2 U4071 ( .I1(n3580), .I2(n2940), .O(n2918) );
  NR2 U4072 ( .I1(n1760), .I2(n2921), .O(n2919) );
  INV1S U4073 ( .I(n3021), .O(n3007) );
  AOI22S U4074 ( .A1(\denoise/second_col_g[2][0] ), .A2(n1894), .B1(n3007), 
        .B2(\denoise/pos8 [0]), .O(n2928) );
  NR2 U4075 ( .I1(n2942), .I2(n2921), .O(n2920) );
  NR2 U4076 ( .I1(n1755), .I2(n2921), .O(n2922) );
  AOI22S U4077 ( .A1(\denoise/second_col_r[2][0] ), .A2(n1896), .B1(
        \denoise/second_col_b[2][0] ), .B2(n1828), .O(n2927) );
  NR2 U4078 ( .I1(n2942), .I2(n2936), .O(n2924) );
  NR2 U4079 ( .I1(n1755), .I2(n2934), .O(n2925) );
  BUF1 U4080 ( .I(n2925), .O(n3143) );
  AOI22S U4081 ( .A1(\denoise/second_col_r[4][0] ), .A2(n1898), .B1(
        \denoise/second_col_b[3][0] ), .B2(n1830), .O(n2926) );
  ND3 U4082 ( .I1(n2928), .I2(n2927), .I3(n2926), .O(n2954) );
  NR2 U4083 ( .I1(n2931), .I2(n2944), .O(n2929) );
  NR2 U4084 ( .I1(n1755), .I2(n2936), .O(n2930) );
  AOI22S U4085 ( .A1(\denoise/second_col_g[5][0] ), .A2(n1900), .B1(
        \denoise/second_col_b[4][0] ), .B2(n1832), .O(n2952) );
  NR2 U4086 ( .I1(n2931), .I2(n2942), .O(n2932) );
  AOI22S U4087 ( .A1(\denoise/second_col_r[5][0] ), .A2(n1825), .B1(
        \denoise/second_col_b[5][0] ), .B2(n1908), .O(n2951) );
  NR2 U4088 ( .I1(n2934), .I2(n2942), .O(n2933) );
  NR2 U4089 ( .I1(n2934), .I2(n1760), .O(n2935) );
  AOI22S U4090 ( .A1(\denoise/second_col_r[3][0] ), .A2(n1904), .B1(
        \denoise/second_col_g[3][0] ), .B2(n1835), .O(n2949) );
  NR2 U4091 ( .I1(n2936), .I2(n2944), .O(n2937) );
  NR2 U4092 ( .I1(n2944), .I2(n2940), .O(n2938) );
  AOI22S U4093 ( .A1(\denoise/second_col_g[4][0] ), .A2(n1903), .B1(
        \denoise/second_col_g[0][0] ), .B2(n1838), .O(n2948) );
  NR2 U4094 ( .I1(n1755), .I2(n2943), .O(n2939) );
  NR2 U4095 ( .I1(n2568), .I2(n2940), .O(n2941) );
  AOI22S U4096 ( .A1(\denoise/second_col_b[1][0] ), .A2(n1906), .B1(
        \denoise/second_col_b[0][0] ), .B2(n1841), .O(n2947) );
  INV1S U4097 ( .I(\denoise/second_col_r[1][0] ), .O(n2945) );
  MOAI1S U4098 ( .A1(n2945), .A2(n1818), .B1(\denoise/second_col_g[1][0] ), 
        .B2(n1957), .O(n2946) );
  AN4B1S U4099 ( .I1(n2949), .I2(n2948), .I3(n2947), .B1(n2946), .O(n2950) );
  ND3 U4100 ( .I1(n2952), .I2(n2951), .I3(n2950), .O(n2953) );
  AO112 U4101 ( .C1(\denoise/second_col_r[0][0] ), .C2(n1889), .A1(n2954), 
        .B1(n2953), .O(n1407) );
  AOI22S U4102 ( .A1(\denoise/second_col_g[2][1] ), .A2(n2919), .B1(n3007), 
        .B2(\denoise/pos8 [1]), .O(n2957) );
  AOI22S U4103 ( .A1(\denoise/second_col_r[2][1] ), .A2(n2920), .B1(
        \denoise/second_col_b[2][1] ), .B2(n2922), .O(n2956) );
  AOI22S U4104 ( .A1(\denoise/second_col_r[4][1] ), .A2(n2924), .B1(
        \denoise/second_col_b[3][1] ), .B2(n3143), .O(n2955) );
  ND3 U4105 ( .I1(n2957), .I2(n2956), .I3(n2955), .O(n2967) );
  AOI22S U4106 ( .A1(\denoise/second_col_g[5][1] ), .A2(n2929), .B1(
        \denoise/second_col_b[4][1] ), .B2(n2930), .O(n2965) );
  AOI22S U4107 ( .A1(\denoise/second_col_r[5][1] ), .A2(n1826), .B1(
        \denoise/second_col_b[5][1] ), .B2(n1909), .O(n2964) );
  AOI22S U4108 ( .A1(\denoise/second_col_r[3][1] ), .A2(n2933), .B1(
        \denoise/second_col_g[3][1] ), .B2(n2935), .O(n2962) );
  AOI22S U4109 ( .A1(\denoise/second_col_g[4][1] ), .A2(n1902), .B1(
        \denoise/second_col_g[0][1] ), .B2(n1838), .O(n2961) );
  AOI22S U4110 ( .A1(\denoise/second_col_b[1][1] ), .A2(n1907), .B1(
        \denoise/second_col_b[0][1] ), .B2(n1841), .O(n2960) );
  INV1S U4111 ( .I(\denoise/second_col_r[1][1] ), .O(n2958) );
  MOAI1S U4112 ( .A1(n2958), .A2(n1818), .B1(\denoise/second_col_g[1][1] ), 
        .B2(n1958), .O(n2959) );
  AN4B1S U4113 ( .I1(n2962), .I2(n2961), .I3(n2960), .B1(n2959), .O(n2963) );
  ND3 U4114 ( .I1(n2965), .I2(n2964), .I3(n2963), .O(n2966) );
  AO112 U4115 ( .C1(\denoise/second_col_r[0][1] ), .C2(n2918), .A1(n2967), 
        .B1(n2966), .O(n1406) );
  AOI22S U4116 ( .A1(\denoise/second_col_g[2][2] ), .A2(n1895), .B1(n3007), 
        .B2(\denoise/pos8 [2]), .O(n2970) );
  AOI22S U4117 ( .A1(\denoise/second_col_r[2][2] ), .A2(n1897), .B1(
        \denoise/second_col_b[2][2] ), .B2(n1828), .O(n2969) );
  AOI22S U4118 ( .A1(\denoise/second_col_r[4][2] ), .A2(n1899), .B1(
        \denoise/second_col_b[3][2] ), .B2(n1830), .O(n2968) );
  ND3 U4119 ( .I1(n2970), .I2(n2969), .I3(n2968), .O(n2980) );
  AOI22S U4120 ( .A1(\denoise/second_col_g[5][2] ), .A2(n1901), .B1(
        \denoise/second_col_b[4][2] ), .B2(n1832), .O(n2978) );
  AOI22S U4121 ( .A1(\denoise/second_col_r[5][2] ), .A2(n2932), .B1(
        \denoise/second_col_b[5][2] ), .B2(n2841), .O(n2977) );
  AOI22S U4122 ( .A1(\denoise/second_col_r[3][2] ), .A2(n1905), .B1(
        \denoise/second_col_g[3][2] ), .B2(n1835), .O(n2975) );
  AOI22S U4123 ( .A1(\denoise/second_col_g[4][2] ), .A2(n2937), .B1(
        \denoise/second_col_g[0][2] ), .B2(n1839), .O(n2974) );
  AOI22S U4124 ( .A1(\denoise/second_col_b[1][2] ), .A2(n2939), .B1(
        \denoise/second_col_b[0][2] ), .B2(n1842), .O(n2973) );
  INV1S U4125 ( .I(\denoise/second_col_r[1][2] ), .O(n2971) );
  MOAI1S U4126 ( .A1(n2971), .A2(n1819), .B1(\denoise/second_col_g[1][2] ), 
        .B2(n1959), .O(n2972) );
  AN4B1S U4127 ( .I1(n2975), .I2(n2974), .I3(n2973), .B1(n2972), .O(n2976) );
  ND3 U4128 ( .I1(n2978), .I2(n2977), .I3(n2976), .O(n2979) );
  AO112 U4129 ( .C1(\denoise/second_col_r[0][2] ), .C2(n1890), .A1(n2980), 
        .B1(n2979), .O(n1405) );
  AOI22S U4130 ( .A1(\denoise/second_col_g[2][3] ), .A2(n1894), .B1(n3007), 
        .B2(\denoise/pos8 [3]), .O(n2983) );
  AOI22S U4131 ( .A1(\denoise/second_col_r[2][3] ), .A2(n1896), .B1(
        \denoise/second_col_b[2][3] ), .B2(n1829), .O(n2982) );
  AOI22S U4132 ( .A1(\denoise/second_col_r[4][3] ), .A2(n1898), .B1(
        \denoise/second_col_b[3][3] ), .B2(n2925), .O(n2981) );
  ND3 U4133 ( .I1(n2983), .I2(n2982), .I3(n2981), .O(n2993) );
  AOI22S U4134 ( .A1(\denoise/second_col_g[5][3] ), .A2(n1900), .B1(
        \denoise/second_col_b[4][3] ), .B2(n1833), .O(n2991) );
  AOI22S U4135 ( .A1(\denoise/second_col_r[5][3] ), .A2(n1825), .B1(
        \denoise/second_col_b[5][3] ), .B2(n1908), .O(n2990) );
  AOI22S U4136 ( .A1(\denoise/second_col_r[3][3] ), .A2(n1904), .B1(
        \denoise/second_col_g[3][3] ), .B2(n1836), .O(n2988) );
  AOI22S U4137 ( .A1(\denoise/second_col_g[4][3] ), .A2(n1903), .B1(
        \denoise/second_col_g[0][3] ), .B2(n2938), .O(n2987) );
  AOI22S U4138 ( .A1(\denoise/second_col_b[1][3] ), .A2(n1906), .B1(
        \denoise/second_col_b[0][3] ), .B2(n2941), .O(n2986) );
  INV1S U4139 ( .I(\denoise/second_col_r[1][3] ), .O(n2984) );
  MOAI1S U4140 ( .A1(n2984), .A2(n1819), .B1(\denoise/second_col_g[1][3] ), 
        .B2(n1957), .O(n2985) );
  AN4B1S U4141 ( .I1(n2988), .I2(n2987), .I3(n2986), .B1(n2985), .O(n2989) );
  ND3 U4142 ( .I1(n2991), .I2(n2990), .I3(n2989), .O(n2992) );
  AO112 U4143 ( .C1(\denoise/second_col_r[0][3] ), .C2(n1889), .A1(n2993), 
        .B1(n2992), .O(n1404) );
  AOI22S U4144 ( .A1(\denoise/second_col_g[2][4] ), .A2(n2919), .B1(n3007), 
        .B2(\denoise/pos8 [4]), .O(n2996) );
  AOI22S U4145 ( .A1(\denoise/second_col_r[2][4] ), .A2(n2920), .B1(
        \denoise/second_col_b[2][4] ), .B2(n1829), .O(n2995) );
  AOI22S U4146 ( .A1(\denoise/second_col_r[4][4] ), .A2(n2924), .B1(
        \denoise/second_col_b[3][4] ), .B2(n2925), .O(n2994) );
  ND3 U4147 ( .I1(n2996), .I2(n2995), .I3(n2994), .O(n3006) );
  AOI22S U4148 ( .A1(\denoise/second_col_g[5][4] ), .A2(n2929), .B1(
        \denoise/second_col_b[4][4] ), .B2(n1833), .O(n3004) );
  AOI22S U4149 ( .A1(\denoise/second_col_r[5][4] ), .A2(n2932), .B1(
        \denoise/second_col_b[5][4] ), .B2(n1909), .O(n3003) );
  AOI22S U4150 ( .A1(\denoise/second_col_r[3][4] ), .A2(n2933), .B1(
        \denoise/second_col_g[3][4] ), .B2(n1836), .O(n3001) );
  AOI22S U4151 ( .A1(\denoise/second_col_g[4][4] ), .A2(n1902), .B1(
        \denoise/second_col_g[0][4] ), .B2(n1839), .O(n3000) );
  AOI22S U4152 ( .A1(\denoise/second_col_b[1][4] ), .A2(n1907), .B1(
        \denoise/second_col_b[0][4] ), .B2(n1842), .O(n2999) );
  INV1S U4153 ( .I(\denoise/second_col_r[1][4] ), .O(n2997) );
  MOAI1S U4154 ( .A1(n2997), .A2(n1820), .B1(\denoise/second_col_g[1][4] ), 
        .B2(n1958), .O(n2998) );
  AN4B1S U4155 ( .I1(n3001), .I2(n3000), .I3(n2999), .B1(n2998), .O(n3002) );
  ND3 U4156 ( .I1(n3004), .I2(n3003), .I3(n3002), .O(n3005) );
  AO112 U4157 ( .C1(\denoise/second_col_r[0][4] ), .C2(n2918), .A1(n3006), 
        .B1(n3005), .O(n1403) );
  AOI22S U4158 ( .A1(\denoise/second_col_g[2][5] ), .A2(n1895), .B1(n3007), 
        .B2(\denoise/pos8 [5]), .O(n3010) );
  AOI22S U4159 ( .A1(\denoise/second_col_r[2][5] ), .A2(n1897), .B1(
        \denoise/second_col_b[2][5] ), .B2(n2922), .O(n3009) );
  AOI22S U4160 ( .A1(\denoise/second_col_r[4][5] ), .A2(n1899), .B1(
        \denoise/second_col_b[3][5] ), .B2(n3143), .O(n3008) );
  ND3 U4161 ( .I1(n3010), .I2(n3009), .I3(n3008), .O(n3020) );
  AOI22S U4162 ( .A1(\denoise/second_col_g[5][5] ), .A2(n1901), .B1(
        \denoise/second_col_b[4][5] ), .B2(n2930), .O(n3018) );
  AOI22S U4163 ( .A1(\denoise/second_col_r[5][5] ), .A2(n1826), .B1(
        \denoise/second_col_b[5][5] ), .B2(n2841), .O(n3017) );
  AOI22S U4164 ( .A1(\denoise/second_col_r[3][5] ), .A2(n1905), .B1(
        \denoise/second_col_g[3][5] ), .B2(n1836), .O(n3015) );
  AOI22S U4165 ( .A1(\denoise/second_col_g[4][5] ), .A2(n2937), .B1(
        \denoise/second_col_g[0][5] ), .B2(n1838), .O(n3014) );
  AOI22S U4166 ( .A1(\denoise/second_col_b[1][5] ), .A2(n2939), .B1(
        \denoise/second_col_b[0][5] ), .B2(n1841), .O(n3013) );
  INV1S U4167 ( .I(\denoise/second_col_r[1][5] ), .O(n3011) );
  MOAI1S U4168 ( .A1(n3011), .A2(n1818), .B1(\denoise/second_col_g[1][5] ), 
        .B2(n1959), .O(n3012) );
  AN4B1S U4169 ( .I1(n3015), .I2(n3014), .I3(n3013), .B1(n3012), .O(n3016) );
  ND3 U4170 ( .I1(n3018), .I2(n3017), .I3(n3016), .O(n3019) );
  AO112 U4171 ( .C1(\denoise/second_col_r[0][5] ), .C2(n1890), .A1(n3020), 
        .B1(n3019), .O(n1402) );
  INV1S U4172 ( .I(n3021), .O(n3087) );
  AOI22S U4173 ( .A1(\denoise/second_col_g[2][6] ), .A2(n1894), .B1(n3087), 
        .B2(\denoise/pos8 [6]), .O(n3024) );
  AOI22S U4174 ( .A1(\denoise/second_col_r[2][6] ), .A2(n1896), .B1(
        \denoise/second_col_b[2][6] ), .B2(n1829), .O(n3023) );
  AOI22S U4175 ( .A1(\denoise/second_col_r[4][6] ), .A2(n1898), .B1(
        \denoise/second_col_b[3][6] ), .B2(n3143), .O(n3022) );
  ND3 U4176 ( .I1(n3024), .I2(n3023), .I3(n3022), .O(n3034) );
  AOI22S U4177 ( .A1(\denoise/second_col_g[5][6] ), .A2(n1900), .B1(
        \denoise/second_col_b[4][6] ), .B2(n1833), .O(n3032) );
  AOI22S U4178 ( .A1(\denoise/second_col_r[5][6] ), .A2(n1826), .B1(
        \denoise/second_col_b[5][6] ), .B2(n1908), .O(n3031) );
  AOI22S U4179 ( .A1(\denoise/second_col_r[3][6] ), .A2(n1904), .B1(
        \denoise/second_col_g[3][6] ), .B2(n2935), .O(n3029) );
  AOI22S U4180 ( .A1(\denoise/second_col_g[4][6] ), .A2(n1903), .B1(
        \denoise/second_col_g[0][6] ), .B2(n1839), .O(n3028) );
  AOI22S U4181 ( .A1(\denoise/second_col_b[1][6] ), .A2(n1906), .B1(
        \denoise/second_col_b[0][6] ), .B2(n1842), .O(n3027) );
  INV1S U4182 ( .I(\denoise/second_col_r[1][6] ), .O(n3025) );
  MOAI1S U4183 ( .A1(n3025), .A2(n1820), .B1(\denoise/second_col_g[1][6] ), 
        .B2(n1957), .O(n3026) );
  AN4B1S U4184 ( .I1(n3029), .I2(n3028), .I3(n3027), .B1(n3026), .O(n3030) );
  ND3 U4185 ( .I1(n3032), .I2(n3031), .I3(n3030), .O(n3033) );
  AO112 U4186 ( .C1(\denoise/second_col_r[0][6] ), .C2(n1889), .A1(n3034), 
        .B1(n3033), .O(n1401) );
  AOI22S U4187 ( .A1(\denoise/second_col_g[2][7] ), .A2(n2919), .B1(n3087), 
        .B2(\denoise/pos8 [7]), .O(n3037) );
  AOI22S U4188 ( .A1(\denoise/second_col_r[2][7] ), .A2(n1897), .B1(n1828), 
        .B2(\denoise/second_col_b[2][7] ), .O(n3036) );
  AOI22S U4189 ( .A1(\denoise/second_col_r[4][7] ), .A2(n1899), .B1(n1830), 
        .B2(\denoise/second_col_b[3][7] ), .O(n3035) );
  ND3 U4190 ( .I1(n3037), .I2(n3036), .I3(n3035), .O(n3047) );
  AOI22S U4191 ( .A1(\denoise/second_col_g[5][7] ), .A2(n1901), .B1(n1832), 
        .B2(\denoise/second_col_b[4][7] ), .O(n3045) );
  AOI22S U4192 ( .A1(\denoise/second_col_r[5][7] ), .A2(n1825), .B1(n2841), 
        .B2(\denoise/second_col_b[5][7] ), .O(n3044) );
  AOI22S U4193 ( .A1(\denoise/second_col_r[3][7] ), .A2(n1905), .B1(
        \denoise/second_col_g[3][7] ), .B2(n1835), .O(n3042) );
  AOI22S U4194 ( .A1(\denoise/second_col_g[4][7] ), .A2(n1902), .B1(
        \denoise/second_col_g[0][7] ), .B2(n2938), .O(n3041) );
  AOI22S U4195 ( .A1(n1841), .A2(\denoise/second_col_b[0][7] ), .B1(n1907), 
        .B2(\denoise/second_col_b[1][7] ), .O(n3040) );
  INV1S U4196 ( .I(\denoise/second_col_r[1][7] ), .O(n3038) );
  MOAI1S U4197 ( .A1(n3038), .A2(n1819), .B1(\denoise/second_col_g[1][7] ), 
        .B2(n1959), .O(n3039) );
  AN4B1S U4198 ( .I1(n3042), .I2(n3041), .I3(n3040), .B1(n3039), .O(n3043) );
  ND3 U4199 ( .I1(n3045), .I2(n3044), .I3(n3043), .O(n3046) );
  AO112 U4200 ( .C1(\denoise/second_col_r[0][7] ), .C2(n2918), .A1(n3047), 
        .B1(n3046), .O(n1400) );
  AOI22S U4201 ( .A1(\denoise/first_col_g[2][0] ), .A2(n1895), .B1(n3087), 
        .B2(\denoise/pos7 [0]), .O(n3050) );
  AOI22S U4202 ( .A1(\denoise/first_col_r[2][0] ), .A2(n1897), .B1(
        \denoise/first_col_b[2][0] ), .B2(n1828), .O(n3049) );
  AOI22S U4203 ( .A1(\denoise/first_col_r[4][0] ), .A2(n1899), .B1(
        \denoise/first_col_b[3][0] ), .B2(n1830), .O(n3048) );
  ND3 U4204 ( .I1(n3050), .I2(n3049), .I3(n3048), .O(n3060) );
  AOI22S U4205 ( .A1(\denoise/first_col_g[5][0] ), .A2(n1901), .B1(
        \denoise/first_col_b[4][0] ), .B2(n1832), .O(n3058) );
  AOI22S U4206 ( .A1(\denoise/first_col_r[5][0] ), .A2(n1826), .B1(
        \denoise/first_col_b[5][0] ), .B2(n1909), .O(n3057) );
  AOI22S U4207 ( .A1(\denoise/first_col_r[3][0] ), .A2(n1905), .B1(
        \denoise/first_col_g[3][0] ), .B2(n1835), .O(n3055) );
  AOI22S U4208 ( .A1(\denoise/first_col_g[0][0] ), .A2(n1839), .B1(
        \denoise/first_col_g[4][0] ), .B2(n1902), .O(n3054) );
  AOI22S U4209 ( .A1(\denoise/first_col_b[0][0] ), .A2(n2941), .B1(
        \denoise/first_col_b[1][0] ), .B2(n1906), .O(n3053) );
  INV1S U4210 ( .I(\denoise/first_col_r[1][0] ), .O(n3051) );
  MOAI1S U4211 ( .A1(n3051), .A2(n1820), .B1(\denoise/first_col_g[1][0] ), 
        .B2(n1958), .O(n3052) );
  AN4B1S U4212 ( .I1(n3055), .I2(n3054), .I3(n3053), .B1(n3052), .O(n3056) );
  ND3 U4213 ( .I1(n3058), .I2(n3057), .I3(n3056), .O(n3059) );
  AO112 U4214 ( .C1(\denoise/first_col_r[0][0] ), .C2(n1890), .A1(n3060), .B1(
        n3059), .O(n1393) );
  AOI22S U4215 ( .A1(\denoise/first_col_g[2][1] ), .A2(n1894), .B1(n3087), 
        .B2(\denoise/pos7 [1]), .O(n3063) );
  AOI22S U4216 ( .A1(\denoise/first_col_r[2][1] ), .A2(n1897), .B1(
        \denoise/first_col_b[2][1] ), .B2(n1828), .O(n3062) );
  AOI22S U4217 ( .A1(\denoise/first_col_r[4][1] ), .A2(n1899), .B1(
        \denoise/first_col_b[3][1] ), .B2(n1830), .O(n3061) );
  ND3 U4218 ( .I1(n3063), .I2(n3062), .I3(n3061), .O(n3073) );
  AOI22S U4219 ( .A1(\denoise/first_col_g[5][1] ), .A2(n1901), .B1(
        \denoise/first_col_b[4][1] ), .B2(n1832), .O(n3071) );
  AOI22S U4220 ( .A1(\denoise/first_col_r[5][1] ), .A2(n1826), .B1(
        \denoise/first_col_b[5][1] ), .B2(n2841), .O(n3070) );
  AOI22S U4221 ( .A1(\denoise/first_col_r[3][1] ), .A2(n1905), .B1(
        \denoise/first_col_g[3][1] ), .B2(n1835), .O(n3068) );
  AOI22S U4222 ( .A1(\denoise/first_col_g[0][1] ), .A2(n1839), .B1(
        \denoise/first_col_g[4][1] ), .B2(n1903), .O(n3067) );
  AOI22S U4223 ( .A1(\denoise/first_col_b[0][1] ), .A2(n2941), .B1(
        \denoise/first_col_b[1][1] ), .B2(n1907), .O(n3066) );
  INV1S U4224 ( .I(\denoise/first_col_r[1][1] ), .O(n3064) );
  MOAI1S U4225 ( .A1(n3064), .A2(n1818), .B1(\denoise/first_col_g[1][1] ), 
        .B2(n1959), .O(n3065) );
  AN4B1S U4226 ( .I1(n3068), .I2(n3067), .I3(n3066), .B1(n3065), .O(n3069) );
  ND3 U4227 ( .I1(n3071), .I2(n3070), .I3(n3069), .O(n3072) );
  AO112 U4228 ( .C1(\denoise/first_col_r[0][1] ), .C2(n1889), .A1(n3073), .B1(
        n3072), .O(n1392) );
  AOI22S U4229 ( .A1(\denoise/first_col_g[2][2] ), .A2(n2919), .B1(n3087), 
        .B2(\denoise/pos7 [2]), .O(n3076) );
  AOI22S U4230 ( .A1(\denoise/first_col_r[2][2] ), .A2(n1896), .B1(
        \denoise/first_col_b[2][2] ), .B2(n1829), .O(n3075) );
  AOI22S U4231 ( .A1(\denoise/first_col_r[4][2] ), .A2(n1898), .B1(
        \denoise/first_col_b[3][2] ), .B2(n2925), .O(n3074) );
  ND3 U4232 ( .I1(n3076), .I2(n3075), .I3(n3074), .O(n3086) );
  AOI22S U4233 ( .A1(\denoise/first_col_g[5][2] ), .A2(n1900), .B1(
        \denoise/first_col_b[4][2] ), .B2(n1833), .O(n3084) );
  AOI22S U4234 ( .A1(\denoise/first_col_r[5][2] ), .A2(n1825), .B1(
        \denoise/first_col_b[5][2] ), .B2(n1908), .O(n3083) );
  AOI22S U4235 ( .A1(\denoise/first_col_r[3][2] ), .A2(n1904), .B1(
        \denoise/first_col_g[3][2] ), .B2(n1836), .O(n3081) );
  AOI22S U4236 ( .A1(\denoise/first_col_g[0][2] ), .A2(n2938), .B1(
        \denoise/first_col_g[4][2] ), .B2(n1903), .O(n3080) );
  AOI22S U4237 ( .A1(\denoise/first_col_b[0][2] ), .A2(n1841), .B1(
        \denoise/first_col_b[1][2] ), .B2(n2939), .O(n3079) );
  INV1S U4238 ( .I(\denoise/first_col_r[1][2] ), .O(n3077) );
  MOAI1S U4239 ( .A1(n3077), .A2(n1818), .B1(\denoise/first_col_g[1][2] ), 
        .B2(n1957), .O(n3078) );
  AN4B1S U4240 ( .I1(n3081), .I2(n3080), .I3(n3079), .B1(n3078), .O(n3082) );
  ND3 U4241 ( .I1(n3084), .I2(n3083), .I3(n3082), .O(n3085) );
  AO112 U4242 ( .C1(\denoise/first_col_r[0][2] ), .C2(n2918), .A1(n3086), .B1(
        n3085), .O(n1391) );
  AOI22S U4243 ( .A1(\denoise/first_col_g[2][3] ), .A2(n1895), .B1(n3087), 
        .B2(\denoise/pos7 [3]), .O(n3090) );
  AOI22S U4244 ( .A1(\denoise/first_col_r[2][3] ), .A2(n2920), .B1(
        \denoise/first_col_b[2][3] ), .B2(n2922), .O(n3089) );
  AOI22S U4245 ( .A1(\denoise/first_col_r[4][3] ), .A2(n2924), .B1(
        \denoise/first_col_b[3][3] ), .B2(n3143), .O(n3088) );
  ND3 U4246 ( .I1(n3090), .I2(n3089), .I3(n3088), .O(n3100) );
  AOI22S U4247 ( .A1(\denoise/first_col_g[5][3] ), .A2(n2929), .B1(
        \denoise/first_col_b[4][3] ), .B2(n2930), .O(n3098) );
  AOI22S U4248 ( .A1(\denoise/first_col_r[5][3] ), .A2(n2932), .B1(
        \denoise/first_col_b[5][3] ), .B2(n1909), .O(n3097) );
  AOI22S U4249 ( .A1(\denoise/first_col_r[3][3] ), .A2(n2933), .B1(
        \denoise/first_col_g[3][3] ), .B2(n2935), .O(n3095) );
  AOI22S U4250 ( .A1(\denoise/first_col_g[0][3] ), .A2(n1838), .B1(
        \denoise/first_col_g[4][3] ), .B2(n1902), .O(n3094) );
  AOI22S U4251 ( .A1(\denoise/first_col_b[0][3] ), .A2(n1842), .B1(
        \denoise/first_col_b[1][3] ), .B2(n1906), .O(n3093) );
  INV1S U4252 ( .I(\denoise/first_col_r[1][3] ), .O(n3091) );
  MOAI1S U4253 ( .A1(n3091), .A2(n1819), .B1(\denoise/first_col_g[1][3] ), 
        .B2(n1958), .O(n3092) );
  AN4B1S U4254 ( .I1(n3095), .I2(n3094), .I3(n3093), .B1(n3092), .O(n3096) );
  ND3 U4255 ( .I1(n3098), .I2(n3097), .I3(n3096), .O(n3099) );
  AO112 U4256 ( .C1(\denoise/first_col_r[0][3] ), .C2(n1890), .A1(n3100), .B1(
        n3099), .O(n1390) );
  AOI22S U4257 ( .A1(\denoise/first_col_g[2][4] ), .A2(n1894), .B1(n3140), 
        .B2(\denoise/pos7 [4]), .O(n3103) );
  AOI22S U4258 ( .A1(\denoise/first_col_r[2][4] ), .A2(n1897), .B1(
        \denoise/first_col_b[2][4] ), .B2(n1829), .O(n3102) );
  AOI22S U4259 ( .A1(\denoise/first_col_r[4][4] ), .A2(n1899), .B1(
        \denoise/first_col_b[3][4] ), .B2(n2925), .O(n3101) );
  ND3 U4260 ( .I1(n3103), .I2(n3102), .I3(n3101), .O(n3113) );
  AOI22S U4261 ( .A1(\denoise/first_col_g[5][4] ), .A2(n1901), .B1(
        \denoise/first_col_b[4][4] ), .B2(n1833), .O(n3111) );
  AOI22S U4262 ( .A1(\denoise/first_col_r[5][4] ), .A2(n1825), .B1(
        \denoise/first_col_b[5][4] ), .B2(n2841), .O(n3110) );
  AOI22S U4263 ( .A1(\denoise/first_col_r[3][4] ), .A2(n1905), .B1(
        \denoise/first_col_g[3][4] ), .B2(n1836), .O(n3108) );
  AOI22S U4264 ( .A1(\denoise/first_col_g[0][4] ), .A2(n1838), .B1(
        \denoise/first_col_g[4][4] ), .B2(n2937), .O(n3107) );
  AOI22S U4265 ( .A1(\denoise/first_col_b[0][4] ), .A2(n1842), .B1(
        \denoise/first_col_b[1][4] ), .B2(n1907), .O(n3106) );
  INV1S U4266 ( .I(\denoise/first_col_r[1][4] ), .O(n3104) );
  MOAI1S U4267 ( .A1(n3104), .A2(n1819), .B1(\denoise/first_col_g[1][4] ), 
        .B2(n1959), .O(n3105) );
  AN4B1S U4268 ( .I1(n3108), .I2(n3107), .I3(n3106), .B1(n3105), .O(n3109) );
  ND3 U4269 ( .I1(n3111), .I2(n3110), .I3(n3109), .O(n3112) );
  AO112 U4270 ( .C1(\denoise/first_col_r[0][4] ), .C2(n1889), .A1(n3113), .B1(
        n3112), .O(n1389) );
  AOI22S U4271 ( .A1(\denoise/first_col_g[2][5] ), .A2(n1895), .B1(n3140), 
        .B2(\denoise/pos7 [5]), .O(n3116) );
  AOI22S U4272 ( .A1(\denoise/first_col_r[2][5] ), .A2(n1896), .B1(
        \denoise/first_col_b[2][5] ), .B2(n1828), .O(n3115) );
  AOI22S U4273 ( .A1(\denoise/first_col_r[4][5] ), .A2(n1898), .B1(
        \denoise/first_col_b[3][5] ), .B2(n1830), .O(n3114) );
  ND3 U4274 ( .I1(n3116), .I2(n3115), .I3(n3114), .O(n3126) );
  AOI22S U4275 ( .A1(\denoise/first_col_g[5][5] ), .A2(n1900), .B1(
        \denoise/first_col_b[4][5] ), .B2(n1832), .O(n3124) );
  AOI22S U4276 ( .A1(\denoise/first_col_r[5][5] ), .A2(n1826), .B1(
        \denoise/first_col_b[5][5] ), .B2(n1908), .O(n3123) );
  AOI22S U4277 ( .A1(\denoise/first_col_r[3][5] ), .A2(n1904), .B1(
        \denoise/first_col_g[3][5] ), .B2(n1835), .O(n3121) );
  AOI22S U4278 ( .A1(\denoise/first_col_g[0][5] ), .A2(n1839), .B1(
        \denoise/first_col_g[4][5] ), .B2(n1903), .O(n3120) );
  AOI22S U4279 ( .A1(\denoise/first_col_b[0][5] ), .A2(n2941), .B1(
        \denoise/first_col_b[1][5] ), .B2(n1907), .O(n3119) );
  INV1S U4280 ( .I(\denoise/first_col_r[1][5] ), .O(n3117) );
  MOAI1S U4281 ( .A1(n3117), .A2(n1820), .B1(\denoise/first_col_g[1][5] ), 
        .B2(n1957), .O(n3118) );
  AN4B1S U4282 ( .I1(n3121), .I2(n3120), .I3(n3119), .B1(n3118), .O(n3122) );
  ND3 U4283 ( .I1(n3124), .I2(n3123), .I3(n3122), .O(n3125) );
  AO112 U4284 ( .C1(\denoise/first_col_r[0][5] ), .C2(n1890), .A1(n3126), .B1(
        n3125), .O(n1388) );
  AOI22S U4285 ( .A1(\denoise/first_col_g[2][6] ), .A2(n1895), .B1(n3140), 
        .B2(\denoise/pos7 [6]), .O(n3129) );
  AOI22S U4286 ( .A1(\denoise/first_col_r[2][6] ), .A2(n2920), .B1(
        \denoise/first_col_b[2][6] ), .B2(n1829), .O(n3128) );
  AOI22S U4287 ( .A1(\denoise/first_col_r[4][6] ), .A2(n2924), .B1(
        \denoise/first_col_b[3][6] ), .B2(n2925), .O(n3127) );
  ND3 U4288 ( .I1(n3129), .I2(n3128), .I3(n3127), .O(n3139) );
  AOI22S U4289 ( .A1(\denoise/first_col_g[5][6] ), .A2(n2929), .B1(
        \denoise/first_col_b[4][6] ), .B2(n1833), .O(n3137) );
  AOI22S U4290 ( .A1(\denoise/first_col_r[5][6] ), .A2(n1825), .B1(
        \denoise/first_col_b[5][6] ), .B2(n1909), .O(n3136) );
  AOI22S U4291 ( .A1(\denoise/first_col_r[3][6] ), .A2(n2933), .B1(
        \denoise/first_col_g[3][6] ), .B2(n1836), .O(n3134) );
  AOI22S U4292 ( .A1(\denoise/first_col_g[0][6] ), .A2(n2938), .B1(
        \denoise/first_col_g[4][6] ), .B2(n1902), .O(n3133) );
  AOI22S U4293 ( .A1(\denoise/first_col_b[0][6] ), .A2(n1841), .B1(
        \denoise/first_col_b[1][6] ), .B2(n1906), .O(n3132) );
  INV1S U4294 ( .I(\denoise/first_col_r[1][6] ), .O(n3130) );
  MOAI1S U4295 ( .A1(n3130), .A2(n1818), .B1(\denoise/first_col_g[1][6] ), 
        .B2(n1958), .O(n3131) );
  AN4B1S U4296 ( .I1(n3134), .I2(n3133), .I3(n3132), .B1(n3131), .O(n3135) );
  ND3 U4297 ( .I1(n3137), .I2(n3136), .I3(n3135), .O(n3138) );
  AO112 U4298 ( .C1(\denoise/first_col_r[0][6] ), .C2(n1890), .A1(n3139), .B1(
        n3138), .O(n1387) );
  AOI22S U4299 ( .A1(\denoise/first_col_g[2][7] ), .A2(n1894), .B1(n3140), 
        .B2(\denoise/pos7 [7]), .O(n3147) );
  AOI22S U4300 ( .A1(\denoise/first_col_r[2][7] ), .A2(n1896), .B1(n2922), 
        .B2(\denoise/first_col_b[2][7] ), .O(n3146) );
  AOI22S U4301 ( .A1(\denoise/first_col_r[4][7] ), .A2(n1898), .B1(n3143), 
        .B2(\denoise/first_col_b[3][7] ), .O(n3145) );
  ND3 U4302 ( .I1(n3147), .I2(n3146), .I3(n3145), .O(n3163) );
  AOI22S U4303 ( .A1(\denoise/first_col_g[5][7] ), .A2(n1900), .B1(n2930), 
        .B2(\denoise/first_col_b[4][7] ), .O(n3161) );
  AOI22S U4304 ( .A1(\denoise/first_col_r[5][7] ), .A2(n2932), .B1(n1908), 
        .B2(\denoise/first_col_b[5][7] ), .O(n3160) );
  AOI22S U4305 ( .A1(\denoise/first_col_r[3][7] ), .A2(n1904), .B1(
        \denoise/first_col_g[3][7] ), .B2(n2935), .O(n3158) );
  AOI22S U4306 ( .A1(\denoise/first_col_g[0][7] ), .A2(n1838), .B1(
        \denoise/first_col_g[4][7] ), .B2(n2937), .O(n3157) );
  AOI22S U4307 ( .A1(n1842), .A2(\denoise/first_col_b[0][7] ), .B1(n2939), 
        .B2(\denoise/first_col_b[1][7] ), .O(n3156) );
  INV1S U4308 ( .I(\denoise/first_col_r[1][7] ), .O(n3154) );
  MOAI1S U4309 ( .A1(n3154), .A2(n1820), .B1(\denoise/first_col_g[1][7] ), 
        .B2(n1957), .O(n3155) );
  AN4B1S U4310 ( .I1(n3158), .I2(n3157), .I3(n3156), .B1(n3155), .O(n3159) );
  ND3 U4311 ( .I1(n3161), .I2(n3160), .I3(n3159), .O(n3162) );
  AO112 U4312 ( .C1(\denoise/first_col_r[0][7] ), .C2(n1889), .A1(n3163), .B1(
        n3162), .O(n1386) );
  INV1S U4313 ( .I(\denoise/new_sum6 [0]), .O(n3165) );
  MOAI1S U4314 ( .A1(n3185), .A2(n3165), .B1(n3173), .B2(\denoise/sum6_r [0]), 
        .O(n1383) );
  MOAI1S U4315 ( .A1(n3187), .A2(n3165), .B1(n3175), .B2(\denoise/sum6_g [0]), 
        .O(n1381) );
  MOAI1S U4316 ( .A1(n3190), .A2(n3165), .B1(n3188), .B2(\denoise/sum6_b [0]), 
        .O(n1379) );
  INV1S U4317 ( .I(\denoise/new_sum6 [3]), .O(n3166) );
  MOAI1S U4318 ( .A1(n3174), .A2(n3166), .B1(n3168), .B2(\denoise/sum6_r [3]), 
        .O(n1361) );
  MOAI1S U4319 ( .A1(n3176), .A2(n3166), .B1(n3169), .B2(\denoise/sum6_g [3]), 
        .O(n1359) );
  MOAI1S U4320 ( .A1(n3179), .A2(n3166), .B1(n3170), .B2(\denoise/sum6_b [3]), 
        .O(n1357) );
  INV1S U4321 ( .I(\denoise/new_sum6 [4]), .O(n3167) );
  MOAI1S U4322 ( .A1(n3174), .A2(n3167), .B1(n3168), .B2(\denoise/sum6_r [4]), 
        .O(n1353) );
  MOAI1S U4323 ( .A1(n3176), .A2(n3167), .B1(n3169), .B2(\denoise/sum6_g [4]), 
        .O(n1351) );
  MOAI1S U4324 ( .A1(n3179), .A2(n3167), .B1(n3170), .B2(\denoise/sum6_b [4]), 
        .O(n1349) );
  INV1S U4325 ( .I(\denoise/new_sum6 [5]), .O(n3171) );
  MOAI1S U4326 ( .A1(n3180), .A2(n3171), .B1(n3168), .B2(\denoise/sum6_r [5]), 
        .O(n1345) );
  MOAI1S U4327 ( .A1(n3181), .A2(n3171), .B1(n3169), .B2(\denoise/sum6_g [5]), 
        .O(n1343) );
  MOAI1S U4328 ( .A1(n3183), .A2(n3171), .B1(n3170), .B2(\denoise/sum6_b [5]), 
        .O(n1341) );
  INV1S U4329 ( .I(\denoise/new_sum6 [6]), .O(n3172) );
  MOAI1S U4330 ( .A1(n3184), .A2(n3172), .B1(n3173), .B2(\denoise/sum6_r [6]), 
        .O(n1337) );
  MOAI1S U4331 ( .A1(n3186), .A2(n3172), .B1(n3175), .B2(\denoise/sum6_g [6]), 
        .O(n1335) );
  MOAI1S U4332 ( .A1(n3188), .A2(n3172), .B1(n3177), .B2(\denoise/sum6_b [6]), 
        .O(n1333) );
  INV1S U4333 ( .I(\denoise/new_sum6 [7]), .O(n3178) );
  MOAI1S U4334 ( .A1(n3174), .A2(n3178), .B1(n3173), .B2(\denoise/sum6_r [7]), 
        .O(n1329) );
  MOAI1S U4335 ( .A1(n3176), .A2(n3178), .B1(n3175), .B2(\denoise/sum6_g [7]), 
        .O(n1327) );
  MOAI1S U4336 ( .A1(n3179), .A2(n3178), .B1(n3177), .B2(\denoise/sum6_b [7]), 
        .O(n1325) );
  INV1S U4337 ( .I(\denoise/new_sum6 [8]), .O(n3182) );
  MOAI1S U4338 ( .A1(n3180), .A2(n3182), .B1(n3184), .B2(\denoise/sum6_r [8]), 
        .O(n1321) );
  MOAI1S U4339 ( .A1(n3181), .A2(n3182), .B1(n3186), .B2(\denoise/sum6_g [8]), 
        .O(n1319) );
  MOAI1S U4340 ( .A1(n3183), .A2(n3182), .B1(n3188), .B2(\denoise/sum6_b [8]), 
        .O(n1317) );
  INV1S U4341 ( .I(\denoise/new_sum6 [9]), .O(n3189) );
  MOAI1S U4342 ( .A1(n3185), .A2(n3189), .B1(n3184), .B2(\denoise/sum6_r [9]), 
        .O(n1313) );
  MOAI1S U4343 ( .A1(n3187), .A2(n3189), .B1(n3186), .B2(\denoise/sum6_g [9]), 
        .O(n1311) );
  MOAI1S U4344 ( .A1(n3190), .A2(n3189), .B1(n3188), .B2(\denoise/sum6_b [9]), 
        .O(n1309) );
  INV1S U4345 ( .I(\mean/color_r [0]), .O(n3298) );
  INV1S U4346 ( .I(\mean/color_r [1]), .O(n3243) );
  INV1S U4347 ( .I(n3229), .O(n3226) );
  MOAI1S U4348 ( .A1(\mean/sum_r [0]), .A2(n3191), .B1(\mean/sum_r [0]), .B2(
        n3191), .O(n1305) );
  INV1S U4349 ( .I(\mean/value_r [1]), .O(n3303) );
  ND2S U4350 ( .I1(n3303), .I2(n3195), .O(n3193) );
  ND3 U4351 ( .I1(n3226), .I2(n3193), .I3(n3192), .O(n3194) );
  MOAI1S U4352 ( .A1(\mean/sum_r [1]), .A2(n3194), .B1(\mean/sum_r [1]), .B2(
        n3194), .O(n1304) );
  INV1S U4353 ( .I(\mean/value_r [2]), .O(n3308) );
  INV1S U4354 ( .I(n3195), .O(n3196) );
  MAO222 U4355 ( .A1(\mean/value_r [1]), .B1(n3196), .C1(\mean/sum_r [1]), .O(
        n3199) );
  MOAI1S U4356 ( .A1(n3308), .A2(n3199), .B1(n3308), .B2(n3199), .O(n3197) );
  MOAI1S U4357 ( .A1(\mean/sum_r [2]), .A2(n3198), .B1(\mean/sum_r [2]), .B2(
        n3198), .O(n1303) );
  INV1S U4358 ( .I(\mean/value_r [3]), .O(n3312) );
  MAO222 U4359 ( .A1(\mean/value_r [2]), .B1(\mean/sum_r [2]), .C1(n3199), .O(
        n3202) );
  MOAI1S U4360 ( .A1(n3312), .A2(n3202), .B1(n3312), .B2(n3202), .O(n3200) );
  MOAI1S U4361 ( .A1(\mean/sum_r [3]), .A2(n3201), .B1(\mean/sum_r [3]), .B2(
        n3201), .O(n1302) );
  INV1S U4362 ( .I(\mean/value_r [4]), .O(n3316) );
  MAO222 U4363 ( .A1(\mean/value_r [3]), .B1(\mean/sum_r [3]), .C1(n3202), .O(
        n3205) );
  MOAI1S U4364 ( .A1(n3316), .A2(n3205), .B1(n3316), .B2(n3205), .O(n3203) );
  MOAI1S U4365 ( .A1(\mean/sum_r [4]), .A2(n3204), .B1(\mean/sum_r [4]), .B2(
        n3204), .O(n1301) );
  INV1S U4366 ( .I(\mean/value_r [5]), .O(n3320) );
  MAO222 U4367 ( .A1(\mean/value_r [4]), .B1(\mean/sum_r [4]), .C1(n3205), .O(
        n3208) );
  MOAI1S U4368 ( .A1(n3320), .A2(n3208), .B1(n3320), .B2(n3208), .O(n3206) );
  MOAI1S U4369 ( .A1(\mean/sum_r [5]), .A2(n3207), .B1(\mean/sum_r [5]), .B2(
        n3207), .O(n1300) );
  INV1S U4370 ( .I(\mean/value_r [6]), .O(n3324) );
  MAO222 U4371 ( .A1(\mean/value_r [5]), .B1(\mean/sum_r [5]), .C1(n3208), .O(
        n3211) );
  MOAI1S U4372 ( .A1(n3324), .A2(n3211), .B1(n3324), .B2(n3211), .O(n3209) );
  MOAI1S U4373 ( .A1(\mean/sum_r [6]), .A2(n3210), .B1(\mean/sum_r [6]), .B2(
        n3210), .O(n1299) );
  INV1S U4374 ( .I(\mean/value_r [7]), .O(n3328) );
  MAO222 U4375 ( .A1(\mean/value_r [6]), .B1(\mean/sum_r [6]), .C1(n3211), .O(
        n3214) );
  MOAI1S U4376 ( .A1(n3328), .A2(n3214), .B1(n3328), .B2(n3214), .O(n3212) );
  MOAI1S U4377 ( .A1(\mean/sum_r [7]), .A2(n3213), .B1(\mean/sum_r [7]), .B2(
        n3213), .O(n1298) );
  MAO222 U4378 ( .A1(\mean/value_r [7]), .B1(\mean/sum_r [7]), .C1(n3214), .O(
        n3217) );
  MOAI1S U4379 ( .A1(\mean/sum_r [8]), .A2(n3215), .B1(\mean/sum_r [8]), .B2(
        n3215), .O(n1297) );
  ND3 U4380 ( .I1(\mean/sum_r [8]), .I2(n1880), .I3(n3217), .O(n3216) );
  MOAI1S U4381 ( .A1(\mean/sum_r [9]), .A2(n3216), .B1(\mean/sum_r [9]), .B2(
        n3216), .O(n1296) );
  MOAI1S U4382 ( .A1(\mean/sum_r [10]), .A2(n3218), .B1(\mean/sum_r [10]), 
        .B2(n3218), .O(n1295) );
  ND3 U4383 ( .I1(n3220), .I2(\mean/sum_r [10]), .I3(n1879), .O(n3219) );
  MOAI1S U4384 ( .A1(\mean/sum_r [11]), .A2(n3219), .B1(\mean/sum_r [11]), 
        .B2(n3219), .O(n1294) );
  ND3 U4385 ( .I1(n3220), .I2(\mean/sum_r [11]), .I3(\mean/sum_r [10]), .O(
        n3224) );
  NR2 U4386 ( .I1(n3224), .I2(n3229), .O(n3221) );
  OA12 U4387 ( .B1(\mean/sum_r [12]), .B2(n3221), .A1(n3222), .O(n1293) );
  MOAI1S U4388 ( .A1(\mean/sum_r [13]), .A2(n3222), .B1(\mean/sum_r [13]), 
        .B2(n3222), .O(n1292) );
  NR2 U4389 ( .I1(n3224), .I2(n3223), .O(n3228) );
  MOAI1S U4390 ( .A1(\mean/sum_r [14]), .A2(n3225), .B1(\mean/sum_r [14]), 
        .B2(n3225), .O(n1291) );
  MOAI1S U4391 ( .A1(\mean/sum_r [15]), .A2(n3227), .B1(\mean/sum_r [15]), 
        .B2(n3227), .O(n1290) );
  NR2 U4392 ( .I1(n3230), .I2(n3229), .O(n3231) );
  OA12 U4393 ( .B1(\mean/sum_r [16]), .B2(n3231), .A1(n3232), .O(n1289) );
  MOAI1S U4394 ( .A1(\mean/sum_r [17]), .A2(n3232), .B1(\mean/sum_r [17]), 
        .B2(n3232), .O(n1288) );
  AN2B1S U4395 ( .I1(\mean/sum_r [17]), .B1(n3232), .O(n3233) );
  OA12 U4396 ( .B1(n3233), .B2(\mean/sum_r [18]), .A1(n3234), .O(n1287) );
  MOAI1S U4397 ( .A1(\mean/sum_r [19]), .A2(n3234), .B1(\mean/sum_r [19]), 
        .B2(n3234), .O(n1286) );
  AN2B1S U4398 ( .I1(\mean/sum_r [19]), .B1(n3234), .O(n3235) );
  OA12 U4399 ( .B1(n3235), .B2(\mean/r_mean_tmp [0]), .A1(n3236), .O(n1285) );
  MOAI1S U4400 ( .A1(\mean/r_mean_tmp [1]), .A2(n3236), .B1(
        \mean/r_mean_tmp [1]), .B2(n3236), .O(n1284) );
  AN2B1S U4401 ( .I1(\mean/r_mean_tmp [1]), .B1(n3236), .O(n3237) );
  OA12 U4402 ( .B1(n3237), .B2(\mean/r_mean_tmp [2]), .A1(n3238), .O(n1283) );
  MOAI1S U4403 ( .A1(\mean/r_mean_tmp [3]), .A2(n3238), .B1(
        \mean/r_mean_tmp [3]), .B2(n3238), .O(n1282) );
  AN2B1S U4404 ( .I1(\mean/r_mean_tmp [3]), .B1(n3238), .O(n3239) );
  OA12 U4405 ( .B1(n3239), .B2(\mean/r_mean_tmp [4]), .A1(n3240), .O(n1281) );
  MOAI1S U4406 ( .A1(\mean/r_mean_tmp [5]), .A2(n3240), .B1(
        \mean/r_mean_tmp [5]), .B2(n3240), .O(n1280) );
  AN2B1S U4407 ( .I1(\mean/r_mean_tmp [5]), .B1(n3240), .O(n3241) );
  OA12 U4408 ( .B1(n3241), .B2(\mean/r_mean_tmp [6]), .A1(n3242), .O(n1279) );
  MOAI1S U4409 ( .A1(\mean/r_mean_tmp [7]), .A2(n3242), .B1(
        \mean/r_mean_tmp [7]), .B2(n3242), .O(n1278) );
  INV1S U4410 ( .I(n3282), .O(n3279) );
  MOAI1S U4411 ( .A1(\mean/sum_g [0]), .A2(n3244), .B1(\mean/sum_g [0]), .B2(
        n3244), .O(n1277) );
  ND2S U4412 ( .I1(n3303), .I2(n3248), .O(n3246) );
  ND3 U4413 ( .I1(n3279), .I2(n3246), .I3(n3245), .O(n3247) );
  MOAI1S U4414 ( .A1(\mean/sum_g [1]), .A2(n3247), .B1(\mean/sum_g [1]), .B2(
        n3247), .O(n1276) );
  INV1S U4415 ( .I(n3248), .O(n3249) );
  MAO222 U4416 ( .A1(n1852), .B1(n3249), .C1(\mean/sum_g [1]), .O(n3252) );
  MOAI1S U4417 ( .A1(n3308), .A2(n3252), .B1(n3308), .B2(n3252), .O(n3250) );
  MOAI1S U4418 ( .A1(\mean/sum_g [2]), .A2(n3251), .B1(\mean/sum_g [2]), .B2(
        n3251), .O(n1275) );
  MAO222 U4419 ( .A1(\mean/value_r [2]), .B1(\mean/sum_g [2]), .C1(n3252), .O(
        n3255) );
  MOAI1S U4420 ( .A1(n3312), .A2(n3255), .B1(n3312), .B2(n3255), .O(n3253) );
  MOAI1S U4421 ( .A1(\mean/sum_g [3]), .A2(n3254), .B1(\mean/sum_g [3]), .B2(
        n3254), .O(n1274) );
  MAO222 U4422 ( .A1(\mean/value_r [3]), .B1(\mean/sum_g [3]), .C1(n3255), .O(
        n3258) );
  MOAI1S U4423 ( .A1(n3316), .A2(n3258), .B1(n3316), .B2(n3258), .O(n3256) );
  MOAI1S U4424 ( .A1(\mean/sum_g [4]), .A2(n3257), .B1(\mean/sum_g [4]), .B2(
        n3257), .O(n1273) );
  MAO222 U4425 ( .A1(\mean/value_r [4]), .B1(\mean/sum_g [4]), .C1(n3258), .O(
        n3261) );
  MOAI1S U4426 ( .A1(n3320), .A2(n3261), .B1(n3320), .B2(n3261), .O(n3259) );
  MOAI1S U4427 ( .A1(\mean/sum_g [5]), .A2(n3260), .B1(\mean/sum_g [5]), .B2(
        n3260), .O(n1272) );
  MAO222 U4428 ( .A1(\mean/value_r [5]), .B1(\mean/sum_g [5]), .C1(n3261), .O(
        n3264) );
  MOAI1S U4429 ( .A1(n3324), .A2(n3264), .B1(n3324), .B2(n3264), .O(n3262) );
  MOAI1S U4430 ( .A1(\mean/sum_g [6]), .A2(n3263), .B1(\mean/sum_g [6]), .B2(
        n3263), .O(n1271) );
  MAO222 U4431 ( .A1(\mean/value_r [6]), .B1(\mean/sum_g [6]), .C1(n3264), .O(
        n3267) );
  MOAI1S U4432 ( .A1(n3328), .A2(n3267), .B1(n3328), .B2(n3267), .O(n3265) );
  MOAI1S U4433 ( .A1(\mean/sum_g [7]), .A2(n3266), .B1(\mean/sum_g [7]), .B2(
        n3266), .O(n1270) );
  MAO222 U4434 ( .A1(\mean/value_r [7]), .B1(\mean/sum_g [7]), .C1(n3267), .O(
        n3270) );
  MOAI1S U4435 ( .A1(\mean/sum_g [8]), .A2(n3268), .B1(\mean/sum_g [8]), .B2(
        n3268), .O(n1269) );
  ND3 U4436 ( .I1(\mean/sum_g [8]), .I2(n1882), .I3(n3270), .O(n3269) );
  MOAI1S U4437 ( .A1(\mean/sum_g [9]), .A2(n3269), .B1(\mean/sum_g [9]), .B2(
        n3269), .O(n1268) );
  MOAI1S U4438 ( .A1(\mean/sum_g [10]), .A2(n3271), .B1(\mean/sum_g [10]), 
        .B2(n3271), .O(n1267) );
  ND3 U4439 ( .I1(n3273), .I2(\mean/sum_g [10]), .I3(n1881), .O(n3272) );
  MOAI1S U4440 ( .A1(\mean/sum_g [11]), .A2(n3272), .B1(\mean/sum_g [11]), 
        .B2(n3272), .O(n1266) );
  ND3 U4441 ( .I1(n3273), .I2(\mean/sum_g [11]), .I3(\mean/sum_g [10]), .O(
        n3277) );
  NR2 U4442 ( .I1(n3277), .I2(n3282), .O(n3274) );
  OA12 U4443 ( .B1(\mean/sum_g [12]), .B2(n3274), .A1(n3275), .O(n1265) );
  MOAI1S U4444 ( .A1(\mean/sum_g [13]), .A2(n3275), .B1(\mean/sum_g [13]), 
        .B2(n3275), .O(n1264) );
  NR2 U4445 ( .I1(n3277), .I2(n3276), .O(n3281) );
  MOAI1S U4446 ( .A1(\mean/sum_g [14]), .A2(n3278), .B1(\mean/sum_g [14]), 
        .B2(n3278), .O(n1263) );
  MOAI1S U4447 ( .A1(\mean/sum_g [15]), .A2(n3280), .B1(\mean/sum_g [15]), 
        .B2(n3280), .O(n1262) );
  NR2 U4448 ( .I1(n3283), .I2(n3282), .O(n3284) );
  OA12 U4449 ( .B1(\mean/sum_g [16]), .B2(n3284), .A1(n3285), .O(n1261) );
  MOAI1S U4450 ( .A1(\mean/sum_g [17]), .A2(n3285), .B1(\mean/sum_g [17]), 
        .B2(n3285), .O(n1260) );
  AN2B1S U4451 ( .I1(\mean/sum_g [17]), .B1(n3285), .O(n3286) );
  OA12 U4452 ( .B1(n3286), .B2(\mean/sum_g [18]), .A1(n3287), .O(n1259) );
  MOAI1S U4453 ( .A1(\mean/sum_g [19]), .A2(n3287), .B1(\mean/sum_g [19]), 
        .B2(n3287), .O(n1258) );
  AN2B1S U4454 ( .I1(\mean/sum_g [19]), .B1(n3287), .O(n3288) );
  OA12 U4455 ( .B1(n3288), .B2(\mean/g_mean_tmp [0]), .A1(n3289), .O(n1257) );
  MOAI1S U4456 ( .A1(\mean/g_mean_tmp [1]), .A2(n3289), .B1(
        \mean/g_mean_tmp [1]), .B2(n3289), .O(n1256) );
  AN2B1S U4457 ( .I1(\mean/g_mean_tmp [1]), .B1(n3289), .O(n3290) );
  OA12 U4458 ( .B1(n3290), .B2(\mean/g_mean_tmp [2]), .A1(n3291), .O(n1255) );
  MOAI1S U4459 ( .A1(\mean/g_mean_tmp [3]), .A2(n3291), .B1(
        \mean/g_mean_tmp [3]), .B2(n3291), .O(n1254) );
  AN2B1S U4460 ( .I1(\mean/g_mean_tmp [3]), .B1(n3291), .O(n3292) );
  OA12 U4461 ( .B1(n3292), .B2(\mean/g_mean_tmp [4]), .A1(n3293), .O(n1253) );
  MOAI1S U4462 ( .A1(\mean/g_mean_tmp [5]), .A2(n3293), .B1(
        \mean/g_mean_tmp [5]), .B2(n3293), .O(n1252) );
  AN2B1S U4463 ( .I1(\mean/g_mean_tmp [5]), .B1(n3293), .O(n3294) );
  OA12 U4464 ( .B1(n3294), .B2(\mean/g_mean_tmp [6]), .A1(n3295), .O(n1251) );
  MOAI1S U4465 ( .A1(\mean/g_mean_tmp [7]), .A2(n3295), .B1(
        \mean/g_mean_tmp [7]), .B2(n3295), .O(n1250) );
  INV1S U4466 ( .I(n3302), .O(n3296) );
  MAO222 U4467 ( .A1(\mean/value_r [1]), .B1(n3296), .C1(\mean/sum_b [1]), .O(
        n3307) );
  MAO222 U4468 ( .A1(\mean/value_r [2]), .B1(\mean/sum_b [2]), .C1(n3307), .O(
        n3311) );
  MAO222 U4469 ( .A1(\mean/value_r [3]), .B1(\mean/sum_b [3]), .C1(n3311), .O(
        n3315) );
  MAO222 U4470 ( .A1(\mean/value_r [4]), .B1(\mean/sum_b [4]), .C1(n3315), .O(
        n3319) );
  MAO222 U4471 ( .A1(\mean/value_r [5]), .B1(\mean/sum_b [5]), .C1(n3319), .O(
        n3323) );
  MAO222 U4472 ( .A1(\mean/value_r [6]), .B1(\mean/sum_b [6]), .C1(n3323), .O(
        n3327) );
  MAO222 U4473 ( .A1(\mean/value_r [7]), .B1(\mean/sum_b [7]), .C1(n3327), .O(
        n3332) );
  ND3 U4474 ( .I1(n3335), .I2(\mean/sum_b [11]), .I3(\mean/sum_b [10]), .O(
        n3338) );
  NR2 U4475 ( .I1(n3338), .I2(n3297), .O(n3343) );
  NR2 U4476 ( .I1(n3299), .I2(n3337), .O(n3345) );
  AN2B1S U4477 ( .I1(\mean/sum_b [17]), .B1(n3346), .O(n3347) );
  AN2B1S U4478 ( .I1(\mean/sum_b [19]), .B1(n3348), .O(n3349) );
  AN2B1S U4479 ( .I1(\mean/b_mean_tmp [1]), .B1(n3350), .O(n3351) );
  AN2B1S U4480 ( .I1(\mean/b_mean_tmp [3]), .B1(n3352), .O(n3353) );
  AN2B1S U4481 ( .I1(\mean/b_mean_tmp [5]), .B1(n3354), .O(n3300) );
  OA12 U4482 ( .B1(n3300), .B2(\mean/b_mean_tmp [6]), .A1(n3355), .O(n1249) );
  INV1S U4483 ( .I(n3337), .O(n3342) );
  MOAI1S U4484 ( .A1(\mean/sum_b [0]), .A2(n3301), .B1(\mean/sum_b [0]), .B2(
        n3301), .O(n1248) );
  ND2S U4485 ( .I1(n3303), .I2(n3302), .O(n3305) );
  ND3 U4486 ( .I1(n3342), .I2(n3305), .I3(n3304), .O(n3306) );
  MOAI1S U4487 ( .A1(\mean/sum_b [1]), .A2(n3306), .B1(\mean/sum_b [1]), .B2(
        n3306), .O(n1247) );
  MOAI1S U4488 ( .A1(n3308), .A2(n3307), .B1(n3308), .B2(n3307), .O(n3309) );
  MOAI1S U4489 ( .A1(\mean/sum_b [2]), .A2(n3310), .B1(\mean/sum_b [2]), .B2(
        n3310), .O(n1246) );
  MOAI1S U4490 ( .A1(n3312), .A2(n3311), .B1(n3312), .B2(n3311), .O(n3313) );
  MOAI1S U4491 ( .A1(\mean/sum_b [3]), .A2(n3314), .B1(\mean/sum_b [3]), .B2(
        n3314), .O(n1245) );
  MOAI1S U4492 ( .A1(n3316), .A2(n3315), .B1(n3316), .B2(n3315), .O(n3317) );
  MOAI1S U4493 ( .A1(\mean/sum_b [4]), .A2(n3318), .B1(\mean/sum_b [4]), .B2(
        n3318), .O(n1244) );
  MOAI1S U4494 ( .A1(n3320), .A2(n3319), .B1(n3320), .B2(n3319), .O(n3321) );
  MOAI1S U4495 ( .A1(\mean/sum_b [5]), .A2(n3322), .B1(\mean/sum_b [5]), .B2(
        n3322), .O(n1243) );
  MOAI1S U4496 ( .A1(n3324), .A2(n3323), .B1(n3324), .B2(n3323), .O(n3325) );
  MOAI1S U4497 ( .A1(\mean/sum_b [6]), .A2(n3326), .B1(\mean/sum_b [6]), .B2(
        n3326), .O(n1242) );
  MOAI1S U4498 ( .A1(n3328), .A2(n3327), .B1(n3328), .B2(n3327), .O(n3329) );
  MOAI1S U4499 ( .A1(\mean/sum_b [7]), .A2(n3330), .B1(\mean/sum_b [7]), .B2(
        n3330), .O(n1241) );
  MOAI1S U4500 ( .A1(\mean/sum_b [8]), .A2(n3331), .B1(\mean/sum_b [8]), .B2(
        n3331), .O(n1240) );
  ND3 U4501 ( .I1(\mean/sum_b [8]), .I2(n1884), .I3(n3332), .O(n3333) );
  MOAI1S U4502 ( .A1(\mean/sum_b [9]), .A2(n3333), .B1(\mean/sum_b [9]), .B2(
        n3333), .O(n1239) );
  MOAI1S U4503 ( .A1(\mean/sum_b [10]), .A2(n3334), .B1(\mean/sum_b [10]), 
        .B2(n3334), .O(n1238) );
  ND3 U4504 ( .I1(n3335), .I2(\mean/sum_b [10]), .I3(n1883), .O(n3336) );
  MOAI1S U4505 ( .A1(\mean/sum_b [11]), .A2(n3336), .B1(\mean/sum_b [11]), 
        .B2(n3336), .O(n1237) );
  NR2 U4506 ( .I1(n3338), .I2(n3337), .O(n3339) );
  OA12 U4507 ( .B1(\mean/sum_b [12]), .B2(n3339), .A1(n3340), .O(n1236) );
  MOAI1S U4508 ( .A1(\mean/sum_b [13]), .A2(n3340), .B1(\mean/sum_b [13]), 
        .B2(n3340), .O(n1235) );
  MOAI1S U4509 ( .A1(\mean/sum_b [14]), .A2(n3341), .B1(\mean/sum_b [14]), 
        .B2(n3341), .O(n1234) );
  MOAI1S U4510 ( .A1(\mean/sum_b [15]), .A2(n3344), .B1(\mean/sum_b [15]), 
        .B2(n3344), .O(n1233) );
  OA12 U4511 ( .B1(\mean/sum_b [16]), .B2(n3345), .A1(n3346), .O(n1232) );
  MOAI1S U4512 ( .A1(\mean/sum_b [17]), .A2(n3346), .B1(\mean/sum_b [17]), 
        .B2(n3346), .O(n1231) );
  OA12 U4513 ( .B1(n3347), .B2(\mean/sum_b [18]), .A1(n3348), .O(n1230) );
  MOAI1S U4514 ( .A1(\mean/sum_b [19]), .A2(n3348), .B1(\mean/sum_b [19]), 
        .B2(n3348), .O(n1229) );
  OA12 U4515 ( .B1(n3349), .B2(\mean/b_mean_tmp [0]), .A1(n3350), .O(n1228) );
  MOAI1S U4516 ( .A1(\mean/b_mean_tmp [1]), .A2(n3350), .B1(
        \mean/b_mean_tmp [1]), .B2(n3350), .O(n1227) );
  OA12 U4517 ( .B1(n3351), .B2(\mean/b_mean_tmp [2]), .A1(n3352), .O(n1226) );
  MOAI1S U4518 ( .A1(\mean/b_mean_tmp [3]), .A2(n3352), .B1(
        \mean/b_mean_tmp [3]), .B2(n3352), .O(n1225) );
  OA12 U4519 ( .B1(n3353), .B2(\mean/b_mean_tmp [4]), .A1(n3354), .O(n1224) );
  MOAI1S U4520 ( .A1(\mean/b_mean_tmp [5]), .A2(n3354), .B1(
        \mean/b_mean_tmp [5]), .B2(n3354), .O(n1223) );
  MOAI1S U4521 ( .A1(\mean/b_mean_tmp [7]), .A2(n3355), .B1(
        \mean/b_mean_tmp [7]), .B2(n3355), .O(n1222) );
  MOAI1S U4522 ( .A1(\gain/N325 ), .A2(n3356), .B1(n1863), .B2(n3356), .O(
        n1221) );
  MOAI1S U4523 ( .A1(n1866), .A2(n3357), .B1(n1866), .B2(n3357), .O(n1219) );
  AO12 U4524 ( .B1(\gain/r_mean_r [15]), .B2(n1813), .A1(n3358), .O(n1218) );
  MOAI1S U4525 ( .A1(n3360), .A2(n3359), .B1(\gain/r_mean_r [0]), .B2(n3361), 
        .O(n3371) );
  AOI22S U4526 ( .A1(\gain/r_mean_r [6]), .A2(n3362), .B1(n1749), .B2(n3361), 
        .O(n3363) );
  MOAI1S U4527 ( .A1(\gain/N303 ), .A2(n3371), .B1(\gain/N303 ), .B2(n3363), 
        .O(n3364) );
  OA12 U4528 ( .B1(\gain/N325 ), .B2(n3365), .A1(n3364), .O(n3366) );
  OAI222S U4529 ( .A1(n1891), .A2(n3473), .B1(n3367), .B2(n3366), .C1(n3477), 
        .C2(n1733), .O(n1217) );
  AO222 U4530 ( .A1(n1814), .A2(\gain/r_mean_r [11]), .B1(n3368), .B2(n3373), 
        .C1(n3550), .C2(\gain/r_mean_r [12]), .O(n1214) );
  NR2 U4531 ( .I1(n3498), .I2(n3369), .O(n3370) );
  OR2 U4532 ( .I1(n3371), .I2(n3370), .O(n3372) );
  AO222 U4533 ( .A1(n3389), .A2(\gain/r_mean_r [11]), .B1(n3373), .B2(n3372), 
        .C1(\gain/r_mean_r [10]), .C2(n1814), .O(n1213) );
  NR2 U4534 ( .I1(n1751), .I2(n1779), .O(n3383) );
  BUF1 U4535 ( .I(n3374), .O(n3382) );
  AO222 U4536 ( .A1(n1812), .A2(\gain/r_mean_r [7]), .B1(n3375), .B2(n3383), 
        .C1(\gain/r_mean_r [8]), .C2(n3382), .O(n1210) );
  AO222 U4537 ( .A1(n1813), .A2(\gain/r_mean_r [6]), .B1(n3376), .B2(n1776), 
        .C1(\gain/r_mean_r [7]), .C2(n3382), .O(n1209) );
  AO222 U4538 ( .A1(n1814), .A2(\gain/r_mean_r [5]), .B1(n3377), .B2(n3383), 
        .C1(\gain/r_mean_r [6]), .C2(n3389), .O(n1208) );
  AO222 U4539 ( .A1(n1812), .A2(\gain/r_mean_r [4]), .B1(n3378), .B2(n1776), 
        .C1(n3382), .C2(\gain/r_mean_r [5]), .O(n1207) );
  AO222 U4540 ( .A1(n1813), .A2(\gain/r_mean_r [3]), .B1(n3379), .B2(n3383), 
        .C1(n1749), .C2(n3389), .O(n1206) );
  AO222 U4541 ( .A1(n1814), .A2(\gain/r_mean_r [2]), .B1(n3380), .B2(n1776), 
        .C1(n3382), .C2(\gain/r_mean_r [3]), .O(n1205) );
  AO222 U4542 ( .A1(n1812), .A2(\gain/r_mean_r [1]), .B1(n3381), .B2(n1776), 
        .C1(n3382), .C2(\gain/r_mean_r [2]), .O(n1204) );
  AO222 U4543 ( .A1(n1813), .A2(\gain/r_mean_r [0]), .B1(n3384), .B2(n1776), 
        .C1(\gain/r_mean_r [1]), .C2(n3382), .O(n1203) );
  INV1S U4544 ( .I(\gain/counter_R_r [1]), .O(n3387) );
  AN2 U4545 ( .I1(n3385), .I2(n1727), .O(n3391) );
  OAI222S U4546 ( .A1(n3388), .A2(n3584), .B1(n3387), .B2(n3391), .C1(n3390), 
        .C2(n3386), .O(n1200) );
  MOAI1S U4547 ( .A1(\gain/counter_R_r [2]), .A2(n3393), .B1(
        \gain/counter_R_r [2]), .B2(n3392), .O(n3394) );
  AO13S U4548 ( .B1(n1866), .B2(n3396), .B3(n3395), .A1(n3394), .O(n1199) );
  MOAI1S U4549 ( .A1(n1867), .A2(n3397), .B1(n1867), .B2(n3397), .O(n1197) );
  MOAI1S U4550 ( .A1(n1869), .A2(n3400), .B1(n1869), .B2(n3400), .O(n1195) );
  AO12 U4551 ( .B1(\gain/g_mean_r [15]), .B2(n1874), .A1(n3401), .O(n1194) );
  INV1S U4552 ( .I(n3402), .O(n3411) );
  MOAI1S U4553 ( .A1(n3404), .A2(n3403), .B1(\gain/g_mean_r [0]), .B2(n3405), 
        .O(n3416) );
  AOI22S U4554 ( .A1(\gain/g_mean_r [6]), .A2(n3406), .B1(n1747), .B2(n3405), 
        .O(n3407) );
  MOAI1S U4555 ( .A1(n1869), .A2(n3416), .B1(\gain/N456 ), .B2(n3407), .O(
        n3408) );
  OA12 U4556 ( .B1(\gain/N478 ), .B2(n3409), .A1(n3408), .O(n3410) );
  OAI222S U4557 ( .A1(n3421), .A2(n3441), .B1(n3411), .B2(n3410), .C1(n3445), 
        .C2(n1873), .O(n1193) );
  OAI222S U4558 ( .A1(n3421), .A2(n3413), .B1(n3419), .B2(n3412), .C1(n3420), 
        .C2(n1873), .O(n1190) );
  NR2 U4559 ( .I1(n3460), .I2(n3414), .O(n3415) );
  NR2 U4560 ( .I1(n3416), .I2(n3415), .O(n3418) );
  OAI222S U4561 ( .A1(n3421), .A2(n3420), .B1(n3419), .B2(n3418), .C1(n3417), 
        .C2(n1873), .O(n1189) );
  INV1S U4562 ( .I(n3449), .O(n3452) );
  NR2 U4563 ( .I1(\gain/valid_r ), .I2(n1766), .O(n3431) );
  AO222 U4564 ( .A1(n1875), .A2(\gain/g_mean_r [7]), .B1(n3422), .B2(n1777), 
        .C1(\gain/g_mean_r [8]), .C2(n3539), .O(n1186) );
  AO222 U4565 ( .A1(n1875), .A2(\gain/g_mean_r [6]), .B1(n3423), .B2(n1777), 
        .C1(\gain/g_mean_r [7]), .C2(n3539), .O(n1185) );
  INV1S U4566 ( .I(n3424), .O(n3430) );
  AO222 U4567 ( .A1(n1874), .A2(\gain/g_mean_r [5]), .B1(n3425), .B2(n3431), 
        .C1(n3430), .C2(\gain/g_mean_r [6]), .O(n1184) );
  AO222 U4568 ( .A1(n1875), .A2(\gain/g_mean_r [4]), .B1(n3426), .B2(n1777), 
        .C1(\gain/g_mean_r [5]), .C2(n3430), .O(n1183) );
  AO222 U4569 ( .A1(n3433), .A2(\gain/g_mean_r [3]), .B1(n3427), .B2(n3431), 
        .C1(n1747), .C2(n3430), .O(n1182) );
  AO222 U4570 ( .A1(n1874), .A2(\gain/g_mean_r [2]), .B1(n3428), .B2(n1777), 
        .C1(n3430), .C2(\gain/g_mean_r [3]), .O(n1181) );
  AO222 U4571 ( .A1(n1875), .A2(\gain/g_mean_r [1]), .B1(n3429), .B2(n3431), 
        .C1(n3430), .C2(\gain/g_mean_r [2]), .O(n1180) );
  AO222 U4572 ( .A1(n1874), .A2(\gain/g_mean_r [0]), .B1(n3432), .B2(n1777), 
        .C1(\gain/g_mean_r [1]), .C2(n3430), .O(n1179) );
  OAI222S U4573 ( .A1(n3438), .A2(n3588), .B1(n3437), .B2(n3436), .C1(n3435), 
        .C2(n3434), .O(n1176) );
  INV1S U4574 ( .I(\gain/G_r [12]), .O(\intadd_2/B[8] ) );
  INV1S U4575 ( .I(\gain/G_r [10]), .O(\intadd_2/B[6] ) );
  MOAI1S U4576 ( .A1(n3439), .A2(\intadd_2/n1 ), .B1(\gain/G_r [14]), .B2(
        n3445), .O(n3440) );
  AOI13HS U4577 ( .B1(n3442), .B2(n3441), .B3(n3440), .A1(n1795), .O(n3444) );
  MOAI1S U4578 ( .A1(n3444), .A2(n3443), .B1(\gain/K_mean_r [15]), .B2(n3449), 
        .O(n1173) );
  ND2S U4579 ( .I1(\gain/G_r [14]), .I2(n3445), .O(n3446) );
  MOAI1S U4580 ( .A1(\intadd_2/n1 ), .A2(n3448), .B1(\intadd_2/n1 ), .B2(n3448), .O(n3451) );
  AOI22S U4581 ( .A1(n3449), .A2(\gain/K_mean_r [14]), .B1(\gain/G_r [14]), 
        .B2(n1796), .O(n3450) );
  OAI12HS U4582 ( .B1(n1877), .B2(n3451), .A1(n3450), .O(n1172) );
  INV1S U4583 ( .I(\gain/K_mean_r [13]), .O(n3484) );
  OAI222S U4584 ( .A1(n3484), .A2(n1766), .B1(n1877), .B2(\intadd_2/SUM[9] ), 
        .C1(\intadd_2/B[9] ), .C2(n1737), .O(n1171) );
  INV1S U4585 ( .I(\gain/K_mean_r [12]), .O(n3485) );
  OAI222S U4586 ( .A1(n3485), .A2(n1766), .B1(n1878), .B2(\intadd_2/SUM[8] ), 
        .C1(\intadd_2/B[8] ), .C2(n3466), .O(n1170) );
  INV1S U4587 ( .I(\gain/K_mean_r [11]), .O(n3486) );
  OAI222S U4588 ( .A1(n3486), .A2(n3452), .B1(n1876), .B2(\intadd_2/SUM[7] ), 
        .C1(\intadd_2/B[7] ), .C2(n1737), .O(n1169) );
  INV1S U4589 ( .I(\gain/K_mean_r [10]), .O(n3487) );
  OAI222S U4590 ( .A1(n3487), .A2(n1766), .B1(n1877), .B2(\intadd_2/SUM[6] ), 
        .C1(\intadd_2/B[6] ), .C2(n3466), .O(n1168) );
  INV1S U4591 ( .I(\gain/K_mean_r [9]), .O(n3488) );
  OAI222S U4592 ( .A1(n3488), .A2(n1766), .B1(n1878), .B2(\intadd_2/SUM[5] ), 
        .C1(\intadd_2/B[5] ), .C2(n1737), .O(n1167) );
  INV1S U4593 ( .I(\gain/K_mean_r [8]), .O(n3489) );
  OAI222S U4594 ( .A1(n3489), .A2(n3452), .B1(n1876), .B2(\intadd_2/SUM[4] ), 
        .C1(\intadd_2/B[4] ), .C2(n3466), .O(n1166) );
  ND2S U4595 ( .I1(\gain/G_r [3]), .I2(n3453), .O(n3455) );
  ND2S U4596 ( .I1(n3455), .I2(n3454), .O(n3456) );
  MOAI1S U4597 ( .A1(n3457), .A2(n3456), .B1(n3457), .B2(n3456), .O(n3458) );
  MOAI1S U4598 ( .A1(n1737), .A2(n3459), .B1(n3469), .B2(n3458), .O(n1161) );
  ND2S U4599 ( .I1(\gain/G_r [1]), .I2(n3460), .O(n3462) );
  ND2S U4600 ( .I1(n3462), .I2(n3461), .O(n3463) );
  MOAI1S U4601 ( .A1(n3470), .A2(n3463), .B1(n3470), .B2(n3463), .O(n3464) );
  MOAI1S U4602 ( .A1(n3466), .A2(n3465), .B1(n3469), .B2(n3464), .O(n1159) );
  OAI12HS U4603 ( .B1(n1748), .B2(n3467), .A1(n3466), .O(n3468) );
  MOAI1S U4604 ( .A1(n3470), .A2(n1876), .B1(\gain/G_r [0]), .B2(n3468), .O(
        n1158) );
  INV1S U4605 ( .I(\gain/R_r [12]), .O(\intadd_1/B[8] ) );
  INV1S U4606 ( .I(\gain/R_r [10]), .O(\intadd_1/B[6] ) );
  MOAI1S U4607 ( .A1(n3471), .A2(\intadd_1/n1 ), .B1(\gain/R_r [14]), .B2(
        n3477), .O(n3472) );
  AOI13HS U4608 ( .B1(n3474), .B2(n3473), .B3(n3472), .A1(n1797), .O(n3476) );
  MOAI1S U4609 ( .A1(n3476), .A2(n3475), .B1(\gain/K_mean_r [15]), .B2(n3481), 
        .O(n1157) );
  ND2S U4610 ( .I1(\gain/R_r [14]), .I2(n3477), .O(n3478) );
  MOAI1S U4611 ( .A1(\intadd_1/n1 ), .A2(n3480), .B1(\intadd_1/n1 ), .B2(n3480), .O(n3483) );
  AOI22S U4612 ( .A1(n3481), .A2(\gain/K_mean_r [14]), .B1(\gain/R_r [14]), 
        .B2(n1798), .O(n3482) );
  OAI12HS U4613 ( .B1(n1808), .B2(n3483), .A1(n3482), .O(n1156) );
  OAI222S U4614 ( .A1(n3484), .A2(n1779), .B1(n1808), .B2(\intadd_1/SUM[9] ), 
        .C1(\intadd_1/B[9] ), .C2(n1736), .O(n1155) );
  OAI222S U4615 ( .A1(n3485), .A2(n1778), .B1(n1807), .B2(\intadd_1/SUM[8] ), 
        .C1(\intadd_1/B[8] ), .C2(n2457), .O(n1154) );
  OAI222S U4616 ( .A1(n3486), .A2(n1778), .B1(n1807), .B2(\intadd_1/SUM[7] ), 
        .C1(\intadd_1/B[7] ), .C2(n1736), .O(n1153) );
  OAI222S U4617 ( .A1(n3487), .A2(n1779), .B1(n1808), .B2(\intadd_1/SUM[6] ), 
        .C1(\intadd_1/B[6] ), .C2(n2457), .O(n1152) );
  OAI222S U4618 ( .A1(n3488), .A2(n1779), .B1(n3490), .B2(\intadd_1/SUM[5] ), 
        .C1(\intadd_1/B[5] ), .C2(n1736), .O(n1151) );
  OAI222S U4619 ( .A1(n3489), .A2(n1778), .B1(n1807), .B2(\intadd_1/SUM[4] ), 
        .C1(\intadd_1/B[4] ), .C2(n2457), .O(n1150) );
  ND2S U4620 ( .I1(\gain/R_r [3]), .I2(n3491), .O(n3493) );
  ND2S U4621 ( .I1(n3493), .I2(n3492), .O(n3494) );
  MOAI1S U4622 ( .A1(n3495), .A2(n3494), .B1(n3495), .B2(n3494), .O(n3496) );
  MOAI1S U4623 ( .A1(n1736), .A2(n3497), .B1(n1806), .B2(n3496), .O(n1145) );
  ND2S U4624 ( .I1(\gain/R_r [1]), .I2(n3498), .O(n3500) );
  ND2S U4625 ( .I1(n3500), .I2(n3499), .O(n3501) );
  MOAI1S U4626 ( .A1(n3502), .A2(n3501), .B1(n3502), .B2(n3501), .O(n3503) );
  MOAI1S U4627 ( .A1(n2457), .A2(n3504), .B1(n1806), .B2(n3503), .O(n1143) );
  BUF1 U4628 ( .I(n3505), .O(n3523) );
  AO222 U4629 ( .A1(n1804), .A2(\gain/b_mean_r [0]), .B1(n1911), .B2(n3506), 
        .C1(\gain/b_mean_r [1]), .C2(n3523), .O(n1139) );
  OAI12HS U4630 ( .B1(n1738), .B2(n3563), .A1(n1756), .O(n1138) );
  INV1S U4631 ( .I(n3507), .O(n3516) );
  OAI222S U4632 ( .A1(n1887), .A2(n3509), .B1(n3516), .B2(n3508), .C1(n3517), 
        .C2(n1738), .O(n1134) );
  NR2 U4633 ( .I1(n3511), .I2(n3510), .O(n3512) );
  NR2 U4634 ( .I1(n3513), .I2(n3512), .O(n3515) );
  OAI222S U4635 ( .A1(n1888), .A2(n3517), .B1(n3516), .B2(n3515), .C1(n3514), 
        .C2(n1738), .O(n1133) );
  AO222 U4636 ( .A1(n1805), .A2(\gain/b_mean_r [7]), .B1(n1912), .B2(n3518), 
        .C1(\gain/b_mean_r [8]), .C2(n3523), .O(n1130) );
  AO222 U4637 ( .A1(n1803), .A2(\gain/b_mean_r [6]), .B1(n1910), .B2(n3519), 
        .C1(\gain/b_mean_r [7]), .C2(n3523), .O(n1129) );
  AO222 U4638 ( .A1(n1804), .A2(\gain/b_mean_r [5]), .B1(n1911), .B2(n3520), 
        .C1(\gain/b_mean_r [6]), .C2(n3523), .O(n1128) );
  AO222 U4639 ( .A1(n1805), .A2(\gain/b_mean_r [4]), .B1(n3521), .B2(n1911), 
        .C1(n3573), .C2(\gain/b_mean_r [5]), .O(n1127) );
  AO222 U4640 ( .A1(n1803), .A2(\gain/b_mean_r [3]), .B1(n1912), .B2(n3522), 
        .C1(n1745), .C2(n3523), .O(n1126) );
  AO222 U4641 ( .A1(n1804), .A2(\gain/b_mean_r [2]), .B1(n3524), .B2(n1912), 
        .C1(n3523), .C2(\gain/b_mean_r [3]), .O(n1125) );
  AO222 U4642 ( .A1(n1805), .A2(\gain/b_mean_r [1]), .B1(n3526), .B2(n1910), 
        .C1(n3573), .C2(\gain/b_mean_r [2]), .O(n1124) );
  MOAI1S U4643 ( .A1(n1870), .A2(n3528), .B1(n1870), .B2(n3528), .O(n1123) );
  OR2B1S U4644 ( .I1(n3528), .B1(n3527), .O(n3529) );
  MOAI1S U4645 ( .A1(n1868), .A2(n3529), .B1(n1868), .B2(n3529), .O(n1121) );
  MOAI1S U4646 ( .A1(n3591), .A2(n1756), .B1(n3530), .B2(\gain/counter_B_r [0]), .O(n3531) );
  OR2 U4647 ( .I1(n3532), .I2(n3531), .O(n1120) );
  OAI222S U4648 ( .A1(n3537), .A2(n3590), .B1(n3536), .B2(n3535), .C1(n3534), 
        .C2(n3533), .O(n1119) );
  OA12 U4649 ( .B1(n3545), .B2(\gain/K_G_tmp [0]), .A1(n3538), .O(n1117) );
  MUX2 U4650 ( .A(\gain/K_G_tmp [1]), .B(\gain/K_G_tmp [0]), .S(n3539), .O(
        n1116) );
  MUX2 U4651 ( .A(\gain/K_G_tmp [2]), .B(\gain/K_G_tmp [1]), .S(n3539), .O(
        n1115) );
  MUX2 U4652 ( .A(\gain/K_G_tmp [3]), .B(\gain/K_G_tmp [2]), .S(n3539), .O(
        n1114) );
  MOAI1S U4653 ( .A1(n3545), .A2(n3540), .B1(n3543), .B2(\gain/K_G_tmp [3]), 
        .O(n1113) );
  MOAI1S U4654 ( .A1(n3545), .A2(n3541), .B1(n3543), .B2(\gain/K_G_tmp [5]), 
        .O(n1111) );
  MOAI1S U4655 ( .A1(n3545), .A2(n3542), .B1(n3543), .B2(\gain/K_G_tmp [7]), 
        .O(n1109) );
  MOAI1S U4656 ( .A1(n3545), .A2(n3544), .B1(n3543), .B2(\gain/K_G_tmp [9]), 
        .O(n1107) );
  OA12 U4657 ( .B1(n3550), .B2(\gain/K_R_tmp [0]), .A1(n3546), .O(n1105) );
  MOAI1S U4658 ( .A1(n1891), .A2(n3547), .B1(n1891), .B2(\gain/K_R_tmp [2]), 
        .O(n1103) );
  MOAI1S U4659 ( .A1(n1892), .A2(n3548), .B1(n1892), .B2(\gain/K_R_tmp [4]), 
        .O(n1101) );
  MOAI1S U4660 ( .A1(n1893), .A2(n3549), .B1(n1893), .B2(\gain/K_R_tmp [6]), 
        .O(n1099) );
  AO22 U4661 ( .A1(n1893), .A2(\gain/K_R_tmp [7]), .B1(n3550), .B2(
        \gain/K_R_tmp [6]), .O(n1098) );
  MOAI1S U4662 ( .A1(n1891), .A2(n3551), .B1(n1891), .B2(\gain/K_R_tmp [9]), 
        .O(n1096) );
  MOAI1S U4663 ( .A1(n1892), .A2(n3552), .B1(n1892), .B2(\gain/K_R_tmp [11]), 
        .O(n1094) );
  MOAI1S U4664 ( .A1(n3555), .A2(\intadd_0/n1 ), .B1(\gain/B_r [14]), .B2(
        n3554), .O(n3557) );
  AOI13HS U4665 ( .B1(n3558), .B2(n3563), .B3(n3557), .A1(n3556), .O(n3561) );
  INV1S U4666 ( .I(\gain/K_mean_r [15]), .O(n3560) );
  OAI222S U4667 ( .A1(n1763), .A2(n3563), .B1(n3562), .B2(n3561), .C1(n3560), 
        .C2(n3559), .O(n1093) );
  OAI222S U4668 ( .A1(n1763), .A2(n3564), .B1(n1809), .B2(\intadd_0/SUM[3] ), 
        .C1(\intadd_0/B[3] ), .C2(n1871), .O(n1085) );
  OAI222S U4669 ( .A1(n1763), .A2(n3565), .B1(n1810), .B2(\intadd_0/SUM[2] ), 
        .C1(\intadd_0/B[2] ), .C2(n1872), .O(n1084) );
  OAI222S U4670 ( .A1(n3525), .A2(n3566), .B1(n1811), .B2(\intadd_0/SUM[1] ), 
        .C1(\intadd_0/B[1] ), .C2(n1871), .O(n1083) );
  OAI222S U4671 ( .A1(n1763), .A2(n1744), .B1(n1809), .B2(\intadd_0/SUM[0] ), 
        .C1(\intadd_0/B[0] ), .C2(n1872), .O(n1082) );
  OA12 U4672 ( .B1(\gain/b_mean_r [0]), .B2(n1810), .A1(n1872), .O(n3569) );
  OAI222S U4673 ( .A1(n1810), .A2(n3571), .B1(n3570), .B2(n3569), .C1(n3568), 
        .C2(n1763), .O(n1078) );
  OA12 U4674 ( .B1(n3573), .B2(\gain/K_B_tmp [0]), .A1(n3572), .O(n1077) );
  MUX2 U4675 ( .A(\gain/K_B_tmp [1]), .B(\gain/K_B_tmp [0]), .S(n3574), .O(
        n1076) );
  MUX2 U4676 ( .A(\gain/K_B_tmp [2]), .B(\gain/K_B_tmp [1]), .S(n3574), .O(
        n1075) );
  MUX2 U4677 ( .A(\gain/K_B_tmp [3]), .B(\gain/K_B_tmp [2]), .S(n3574), .O(
        n1074) );
  MOAI1S U4678 ( .A1(n1888), .A2(n3575), .B1(n3579), .B2(\gain/K_B_tmp [5]), 
        .O(n1072) );
  MOAI1S U4679 ( .A1(n3579), .A2(n3576), .B1(n1887), .B2(\gain/K_B_tmp [7]), 
        .O(n1070) );
  MOAI1S U4680 ( .A1(n1887), .A2(n3577), .B1(n1888), .B2(\gain/K_B_tmp [9]), 
        .O(n1068) );
  MOAI1S U4681 ( .A1(n1888), .A2(n3578), .B1(n3579), .B2(\gain/K_B_tmp [11]), 
        .O(n1066) );
  MOAI1S U4682 ( .A1(\denoise/valid_in_reg ), .A2(n3581), .B1(
        \denoise/valid_in_reg ), .B2(n1948), .O(n1064) );
  MOAI1S U4683 ( .A1(n1769), .A2(n3582), .B1(n1769), .B2(n1843), .O(n1063) );
endmodule

module CHIP (i_clk_i,               
            i_rst_n_i,
            i_pixel_in_i,
            i_valid_in_i,
            i_color_in_i,
            i_last_col_in_i,
            i_last_pic_in_i,
            i_mode_in_i,
            o_pixel_out_o,
            o_valid_out_o,
            o_color_out_o,
            o_last_col_out_o,
            o_last_pic_out_o,
            o_finish_operation_o
);



input					i_clk_i;
input					i_rst_n_i;
input  [7:0]	        i_pixel_in_i;
input					i_valid_in_i;
input  [1:0]            i_color_in_i;
input					i_last_col_in_i;
input					i_last_pic_in_i;
input  [2:0]	        i_mode_in_i;
output [7:0]		    o_pixel_out_o;
output			        o_valid_out_o;
output [1:0]	        o_color_out_o;
output					o_last_col_out_o;
output					o_last_pic_out_o;
output					o_finish_operation_o;
 

  
  
  wire n_logic0,n_logic1;
  
wire					i_clk;
wire					i_rst_n;
wire[7:0]               i_pixel_in;
wire 	                i_valid_in;
wire[1:0]               i_color_in;
wire 	                i_last_col_in;
wire 	                i_last_pic_in;
wire[2:0]	            i_mode_in;
wire[7:0]		        o_pixel_out;
wire 	 	            o_valid_out;
wire[1:0]	            o_color_out;
wire						o_last_col_out;
wire						o_last_pic_out;
wire						o_finish_operation;
top top(
    .clk(i_clk),
    .rst_n(i_rst_n),
    .pixel_in(i_pixel_in),
    .valid_in(i_valid_in),
    .color_in(i_color_in),
    .last_col_in(i_last_col_in),
    .last_pic_in(i_last_pic_in),
    .mode_in(i_mode_in),
    .pixel_out(o_pixel_out),
    .valid_out(o_valid_out),
    .color_out(o_color_out),
    .last_col_out(o_last_col_out),
    .last_pic_out(o_last_pic_out),
    .finish_operation(o_finish_operation)
);
  TIE0 ipad_n_logic0(.O(n_logic0));
  TIE1 ipad_n_logic1(.O(n_logic1));
  XMD ipad_clk_i        (.O(i_clk), .I(i_clk_i), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_rst_n_i      (.O(i_rst_n), .I(i_rst_n_i), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_0    (.O(i_pixel_in[0]), .I(i_pixel_in_i[0]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_1    (.O(i_pixel_in[1]), .I(i_pixel_in_i[1]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_2    (.O(i_pixel_in[2]), .I(i_pixel_in_i[2]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_3    (.O(i_pixel_in[3]), .I(i_pixel_in_i[3]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_4    (.O(i_pixel_in[4]), .I(i_pixel_in_i[4]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_5    (.O(i_pixel_in[5]), .I(i_pixel_in_i[5]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_6    (.O(i_pixel_in[6]), .I(i_pixel_in_i[6]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_pixel_i_7    (.O(i_pixel_in[7]), .I(i_pixel_in_i[7]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_valid_i      (.O(i_valid_in), .I(i_valid_in_i), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_color_i_0    (.O(i_color_in[0]), .I(i_color_in_i[0]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_color_i_1    (.O(i_color_in[1]), .I(i_color_in_i[1]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_last_col     (.O(i_last_col_in), .I(i_last_col_in_i), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_last_pic     (.O(i_last_pic_in), .I(i_last_pic_in_i), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_mode_i_0     (.O(i_mode_in[0]), .I(i_mode_in_i[0]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_mode_i_1     (.O(i_mode_in[1]), .I(i_mode_in_i[1]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  XMD ipad_mode_i_2     (.O(i_mode_in[2]), .I(i_mode_in_i[2]), .PU(n_logic0), .PD(n_logic0), .SMT(n_logic0));
  
  
  YA2GSD ipad_pixel_o_0  (.O(o_pixel_out_o[0]), .I(o_pixel_out[0]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_1  (.O(o_pixel_out_o[1]), .I(o_pixel_out[1]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_2  (.O(o_pixel_out_o[2]), .I(o_pixel_out[2]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_3  (.O(o_pixel_out_o[3]), .I(o_pixel_out[3]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_4  (.O(o_pixel_out_o[4]), .I(o_pixel_out[4]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_5  (.O(o_pixel_out_o[5]), .I(o_pixel_out[5]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_6  (.O(o_pixel_out_o[6]), .I(o_pixel_out[6]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_pixel_o_7  (.O(o_pixel_out_o[7]), .I(o_pixel_out[7]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_valid_o    (.O(o_valid_out_o), .I(o_valid_out), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_color_o_0  (.O(o_color_out_o[0]), .I(o_color_out[0]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_color_o_1  (.O(o_color_out_o[1]), .I(o_color_out[1]), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_last_col_o (.O(o_last_col_out_o), .I(o_last_col_out), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_last_pic_o (.O(o_last_pic_out_o), .I(o_last_pic_out), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  YA2GSD ipad_finish_operation_o (.O(o_finish_operation_o), .I(o_finish_operation), .E(n_logic1), .E2(n_logic0), .E4(n_logic0), .E8(n_logic0), .SR(n_logic0));
  
endmodule

