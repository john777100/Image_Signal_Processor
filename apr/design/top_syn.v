/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Fri May 29 00:54:54 2020
/////////////////////////////////////////////////////////////


module demosaic ( clk, rst_n, valid, data_in, end_col, end_pic, RGB_valid, 
        RGB_data, color, col_last, pic_last );
  input [7:0] data_in;
  output [7:0] RGB_data;
  output [1:0] color;
  input clk, rst_n, valid, end_col, end_pic;
  output RGB_valid, col_last, pic_last;
  wire   \col1_r[0][0] , \col1_r[1][0] , \col1_r[4][1] , \col2_r[4][7] ,
         \col2_r[4][6] , \col2_r[4][5] , \col2_r[4][4] , \col2_r[4][3] ,
         \col2_r[4][2] , \col2_r[4][1] , \col2_r[4][0] , \col3_r[0][1] ,
         \col3_r[0][0] , \col3_r[1][1] , \col3_r[1][0] , col_last_buf_r,
         pic_last_buf_r, end_col_r, end_pic_r, valid_r, RGB_valid_w, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180,
         n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190,
         n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200,
         n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210,
         n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220,
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230,
         n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240,
         n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250,
         n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260,
         n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270,
         n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280,
         n1281, n1282, n1283, n1284, \intadd_7/CI , \intadd_7/SUM[6] ,
         \intadd_7/SUM[5] , \intadd_7/SUM[4] , \intadd_7/SUM[3] ,
         \intadd_7/SUM[2] , \intadd_7/SUM[1] , \intadd_7/SUM[0] ,
         \intadd_7/n7 , \intadd_7/n6 , \intadd_7/n5 , \intadd_7/n4 ,
         \intadd_7/n3 , \intadd_7/n2 , \intadd_7/n1 , \intadd_8/CI ,
         \intadd_8/SUM[6] , \intadd_8/SUM[5] , \intadd_8/SUM[4] ,
         \intadd_8/SUM[3] , \intadd_8/SUM[2] , \intadd_8/SUM[1] ,
         \intadd_8/SUM[0] , \intadd_8/n7 , \intadd_8/n6 , \intadd_8/n5 ,
         \intadd_8/n4 , \intadd_8/n3 , \intadd_8/n2 , \intadd_8/n1 ,
         \intadd_9/A[5] , \intadd_9/A[4] , \intadd_9/A[3] , \intadd_9/A[2] ,
         \intadd_9/A[1] , \intadd_9/A[0] , \intadd_9/B[5] , \intadd_9/B[4] ,
         \intadd_9/B[3] , \intadd_9/B[2] , \intadd_9/B[1] , \intadd_9/B[0] ,
         \intadd_9/CI , \intadd_9/SUM[5] , \intadd_9/SUM[4] ,
         \intadd_9/SUM[3] , \intadd_9/SUM[2] , \intadd_9/SUM[1] ,
         \intadd_9/SUM[0] , \intadd_9/n6 , \intadd_9/n5 , \intadd_9/n4 ,
         \intadd_9/n3 , \intadd_9/n2 , \intadd_9/n1 , n1, n2, n3, n4, n5, n6,
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
         n513, n514, n515, n516, n517, n518, n519, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n780, n781;
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

  DFFRX1 end_col_r_reg ( .D(end_col), .CK(clk), .RN(n777), .Q(end_col_r), .QN(
        n620) );
  DFFRX1 end_pic_r_reg ( .D(end_pic), .CK(clk), .RN(rst_n), .Q(end_pic_r) );
  DFFRX1 \state_r_reg[3]  ( .D(state_w[3]), .CK(clk), .RN(rst_n), .Q(
        state_r[3]), .QN(n692) );
  DFFRX1 \counter_r_reg[1]  ( .D(n1279), .CK(clk), .RN(rst_n), .Q(counter_r[1]), .QN(n619) );
  DFFRX1 \logic_state_r_reg[2]  ( .D(n1284), .CK(clk), .RN(n780), .Q(
        logic_state_r[2]), .QN(n722) );
  DFFRX1 \logic_state_r_reg[0]  ( .D(n1282), .CK(clk), .RN(n780), .Q(
        logic_state_r[0]), .QN(n635) );
  DFFRX1 \logic_state_r_reg[1]  ( .D(n1283), .CK(clk), .RN(n780), .Q(
        logic_state_r[1]), .QN(n16) );
  DFFRX1 col_last_buf_r_reg ( .D(n1093), .CK(clk), .RN(n780), .Q(
        col_last_buf_r) );
  DFFRX1 col_last_r_reg ( .D(n1092), .CK(clk), .RN(n780), .Q(col_last) );
  DFFRX1 pic_last_buf_r_reg ( .D(n1044), .CK(clk), .RN(n780), .Q(
        pic_last_buf_r) );
  DFFRX1 pic_last_r_reg ( .D(n1043), .CK(clk), .RN(n780), .Q(pic_last) );
  DFFRX1 \col3_r_reg[0][7]  ( .D(n1278), .CK(clk), .RN(rst_n), .QN(n740) );
  DFFRX1 \col3_r_reg[0][6]  ( .D(n1277), .CK(clk), .RN(rst_n), .QN(n739) );
  DFFRX1 \col3_r_reg[0][5]  ( .D(n1276), .CK(clk), .RN(rst_n), .QN(n738) );
  DFFRX1 \col3_r_reg[0][4]  ( .D(n1275), .CK(clk), .RN(rst_n), .QN(n737) );
  DFFRX1 \col3_r_reg[0][3]  ( .D(n1274), .CK(clk), .RN(n4), .QN(n736) );
  DFFRX1 \col3_r_reg[0][2]  ( .D(n1273), .CK(clk), .RN(n4), .QN(n735) );
  DFFRX1 \col3_r_reg[0][1]  ( .D(n1272), .CK(clk), .RN(n4), .Q(\col3_r[0][1] ), 
        .QN(n754) );
  DFFRX1 \col3_r_reg[0][0]  ( .D(n1271), .CK(clk), .RN(n4), .Q(\col3_r[0][0] ), 
        .QN(n711) );
  DFFRX1 \col3_r_reg[1][7]  ( .D(n1270), .CK(clk), .RN(n4), .QN(n675) );
  DFFRX1 \col3_r_reg[1][6]  ( .D(n1269), .CK(clk), .RN(n4), .QN(n672) );
  DFFRX1 \col3_r_reg[1][5]  ( .D(n1268), .CK(clk), .RN(n4), .QN(n669) );
  DFFRX1 \col3_r_reg[1][4]  ( .D(n1267), .CK(clk), .RN(n4), .QN(n666) );
  DFFRX1 \col3_r_reg[1][3]  ( .D(n1266), .CK(clk), .RN(n778), .QN(n596) );
  DFFRX1 \col3_r_reg[1][2]  ( .D(n1265), .CK(clk), .RN(rst_n), .QN(n639) );
  DFFRX1 \col3_r_reg[1][1]  ( .D(n1264), .CK(clk), .RN(rst_n), .Q(
        \col3_r[1][1] ), .QN(n713) );
  DFFRX1 \col3_r_reg[1][0]  ( .D(n1263), .CK(clk), .RN(rst_n), .Q(
        \col3_r[1][0] ), .QN(n714) );
  DFFRX1 \col3_r_reg[2][7]  ( .D(n1262), .CK(clk), .RN(rst_n), .QN(n745) );
  DFFRX1 \col3_r_reg[2][6]  ( .D(n1261), .CK(clk), .RN(rst_n), .QN(n744) );
  DFFRX1 \col3_r_reg[2][5]  ( .D(n1260), .CK(clk), .RN(rst_n), .QN(n743) );
  DFFRX1 \col3_r_reg[2][4]  ( .D(n1259), .CK(clk), .RN(rst_n), .QN(n742) );
  DFFRX1 \col3_r_reg[2][3]  ( .D(n1258), .CK(clk), .RN(rst_n), .QN(n642) );
  DFFRX1 \col3_r_reg[2][2]  ( .D(n1257), .CK(clk), .RN(rst_n), .QN(n703) );
  DFFRX1 \col3_r_reg[2][1]  ( .D(n1256), .CK(clk), .RN(rst_n), .QN(n592) );
  DFFRX1 \col3_r_reg[2][0]  ( .D(n1255), .CK(clk), .RN(rst_n), .QN(n584) );
  DFFRX1 \col3_r_reg[3][7]  ( .D(n1254), .CK(clk), .RN(n4), .QN(n753) );
  DFFRX1 \col3_r_reg[3][6]  ( .D(n1253), .CK(clk), .RN(n4), .QN(n752) );
  DFFRX1 \col3_r_reg[3][5]  ( .D(n1252), .CK(clk), .RN(n781), .QN(n751) );
  DFFRX1 \col3_r_reg[3][4]  ( .D(n1251), .CK(clk), .RN(n4), .QN(n750) );
  DFFRX1 \col3_r_reg[3][3]  ( .D(n1250), .CK(clk), .RN(n4), .QN(n710) );
  DFFRX1 \col3_r_reg[3][2]  ( .D(n1249), .CK(clk), .RN(n4), .QN(n709) );
  DFFRX1 \col3_r_reg[3][1]  ( .D(n1248), .CK(clk), .RN(n4), .QN(n630) );
  DFFRX1 \col3_r_reg[3][0]  ( .D(n1247), .CK(clk), .RN(n4), .QN(n693) );
  DFFRX1 \col3_r_reg[4][7]  ( .D(n1246), .CK(clk), .RN(n781), .QN(n677) );
  DFFRX1 \col3_r_reg[4][6]  ( .D(n1245), .CK(clk), .RN(n4), .QN(n674) );
  DFFRX1 \col3_r_reg[4][5]  ( .D(n1244), .CK(clk), .RN(n4), .QN(n671) );
  DFFRX1 \col3_r_reg[4][4]  ( .D(n1243), .CK(clk), .RN(n781), .QN(n668) );
  DFFRX1 \col3_r_reg[4][3]  ( .D(n1242), .CK(clk), .RN(n4), .QN(n643) );
  DFFRX1 \col3_r_reg[4][2]  ( .D(n1241), .CK(clk), .RN(n4), .QN(n641) );
  DFFRX1 \col3_r_reg[4][1]  ( .D(n1240), .CK(clk), .RN(n4), .QN(n705) );
  DFFRX1 \col3_r_reg[4][0]  ( .D(n1239), .CK(clk), .RN(n4), .QN(n623) );
  DFFRX1 \col3_r_reg[5][7]  ( .D(n1238), .CK(clk), .RN(n4), .QN(n676) );
  DFFRX1 \col3_r_reg[5][6]  ( .D(n1237), .CK(clk), .RN(n781), .QN(n673) );
  DFFRX1 \col3_r_reg[5][5]  ( .D(n1236), .CK(clk), .RN(n4), .QN(n670) );
  DFFRX1 \col3_r_reg[5][4]  ( .D(n1235), .CK(clk), .RN(n4), .QN(n667) );
  DFFRX1 \col3_r_reg[5][3]  ( .D(n1234), .CK(clk), .RN(n4), .QN(n704) );
  DFFRX1 \col3_r_reg[5][2]  ( .D(n1233), .CK(clk), .RN(n4), .QN(n640) );
  DFFRX1 \col3_r_reg[5][1]  ( .D(n1232), .CK(clk), .RN(n4), .QN(n636) );
  DFFRX1 \col3_r_reg[5][0]  ( .D(n1231), .CK(clk), .RN(n4), .QN(n621) );
  DFFRX1 \col3_r_reg[6][7]  ( .D(n1230), .CK(clk), .RN(n781), .QN(n758) );
  DFFRX1 \col3_r_reg[6][6]  ( .D(n1229), .CK(clk), .RN(n781), .QN(n755) );
  DFFRX1 \col3_r_reg[6][5]  ( .D(n1228), .CK(clk), .RN(n781), .QN(n756) );
  DFFRX1 \col3_r_reg[6][4]  ( .D(n1227), .CK(clk), .RN(n781), .QN(n757) );
  DFFRX1 \col3_r_reg[6][3]  ( .D(n1226), .CK(clk), .RN(n780), .QN(n648) );
  DFFRX1 \col3_r_reg[6][2]  ( .D(n1225), .CK(clk), .RN(rst_n), .QN(n715) );
  DFFRX1 \col3_r_reg[6][1]  ( .D(n1224), .CK(clk), .RN(rst_n), .QN(n716) );
  DFFRX1 \col3_r_reg[6][0]  ( .D(n1223), .CK(clk), .RN(rst_n), .QN(n717) );
  DFFRX1 \col2_r_reg[0][7]  ( .D(n1222), .CK(clk), .RN(rst_n), .QN(n602) );
  DFFRX1 \col1_r_reg[0][7]  ( .D(n1221), .CK(clk), .RN(n780), .QN(n665) );
  DFFRX1 \col2_r_reg[0][6]  ( .D(n1220), .CK(clk), .RN(n780), .QN(n605) );
  DFFRX1 \col1_r_reg[0][6]  ( .D(n1219), .CK(clk), .RN(n780), .QN(n664) );
  DFFRX1 \col2_r_reg[0][5]  ( .D(n1218), .CK(clk), .RN(n4), .QN(n604) );
  DFFRX1 \col1_r_reg[0][5]  ( .D(n1217), .CK(clk), .RN(n4), .QN(n663) );
  DFFRX1 \col2_r_reg[0][4]  ( .D(n1216), .CK(clk), .RN(n781), .QN(n603) );
  DFFRX1 \col1_r_reg[0][4]  ( .D(n1215), .CK(clk), .RN(n4), .QN(n662) );
  DFFRX1 \col2_r_reg[0][3]  ( .D(n1214), .CK(clk), .RN(n781), .QN(n657) );
  DFFRX1 \col1_r_reg[0][3]  ( .D(n1213), .CK(clk), .RN(n781), .QN(n741) );
  DFFRX1 \col2_r_reg[0][2]  ( .D(n1212), .CK(clk), .RN(n781), .QN(n590) );
  DFFRX1 \col1_r_reg[0][2]  ( .D(n1211), .CK(clk), .RN(n781), .QN(n638) );
  DFFRX1 \col2_r_reg[0][1]  ( .D(n1210), .CK(clk), .RN(n781), .QN(n629) );
  DFFRX1 \col1_r_reg[0][1]  ( .D(n1209), .CK(clk), .RN(n781), .QN(n708) );
  DFFRX1 \col2_r_reg[0][0]  ( .D(n1208), .CK(clk), .RN(n781), .QN(n628) );
  DFFRX1 \col1_r_reg[0][0]  ( .D(n1207), .CK(clk), .RN(n781), .Q(
        \col1_r[0][0] ), .QN(n712) );
  DFFRX1 \col2_r_reg[1][7]  ( .D(n1206), .CK(clk), .RN(n781), .QN(n729) );
  DFFRX1 \col1_r_reg[1][7]  ( .D(n1205), .CK(clk), .RN(n4), .QN(n681) );
  DFFRX1 \col2_r_reg[1][6]  ( .D(n1204), .CK(clk), .RN(n4), .QN(n732) );
  DFFRX1 \col1_r_reg[1][6]  ( .D(n1203), .CK(clk), .RN(n781), .QN(n680) );
  DFFRX1 \col2_r_reg[1][5]  ( .D(n1202), .CK(clk), .RN(n781), .QN(n731) );
  DFFRX1 \col1_r_reg[1][5]  ( .D(n1201), .CK(clk), .RN(n781), .QN(n679) );
  DFFRX1 \col2_r_reg[1][4]  ( .D(n1200), .CK(clk), .RN(n781), .QN(n730) );
  DFFRX1 \col1_r_reg[1][4]  ( .D(n1199), .CK(clk), .RN(n781), .QN(n678) );
  DFFRX1 \col2_r_reg[1][3]  ( .D(n1198), .CK(clk), .RN(n781), .QN(n700) );
  DFFRX1 \col1_r_reg[1][3]  ( .D(n1197), .CK(clk), .RN(n781), .QN(n646) );
  DFFRX1 \col2_r_reg[1][2]  ( .D(n1196), .CK(clk), .RN(n4), .QN(n699) );
  DFFRX1 \col1_r_reg[1][2]  ( .D(n1195), .CK(clk), .RN(n4), .QN(n645) );
  DFFRX1 \col2_r_reg[1][1]  ( .D(n1194), .CK(clk), .RN(n780), .QN(n589) );
  DFFRX1 \col1_r_reg[1][1]  ( .D(n1193), .CK(clk), .RN(n780), .QN(n579) );
  DFFRX1 \col2_r_reg[1][0]  ( .D(n1192), .CK(clk), .RN(n780), .QN(n588) );
  DFFRX1 \col1_r_reg[1][0]  ( .D(n1191), .CK(clk), .RN(n780), .Q(
        \col1_r[1][0] ), .QN(n650) );
  DFFRX1 \col2_r_reg[2][7]  ( .D(n1190), .CK(clk), .RN(n4), .QN(n601) );
  DFFRX1 \col1_r_reg[2][7]  ( .D(n1189), .CK(clk), .RN(n4), .QN(n583) );
  DFFRX1 \col2_r_reg[2][6]  ( .D(n1188), .CK(clk), .RN(n4), .QN(n600) );
  DFFRX1 \col1_r_reg[2][6]  ( .D(n1187), .CK(clk), .RN(n781), .QN(n582) );
  DFFRX1 \col2_r_reg[2][5]  ( .D(n1186), .CK(clk), .RN(n4), .QN(n599) );
  DFFRX1 \col1_r_reg[2][5]  ( .D(n1185), .CK(clk), .RN(n4), .QN(n581) );
  DFFRX1 \col2_r_reg[2][4]  ( .D(n1184), .CK(clk), .RN(n4), .QN(n598) );
  DFFRX1 \col1_r_reg[2][4]  ( .D(n1183), .CK(clk), .RN(n4), .QN(n580) );
  DFFRX1 \col2_r_reg[2][3]  ( .D(n1182), .CK(clk), .RN(n781), .QN(n587) );
  DFFRX1 \col1_r_reg[2][3]  ( .D(n1181), .CK(clk), .RN(n777), .QN(n702) );
  DFFRX1 \col2_r_reg[2][2]  ( .D(n1180), .CK(clk), .RN(rst_n), .QN(n586) );
  DFFRX1 \col1_r_reg[2][2]  ( .D(n1179), .CK(clk), .RN(n777), .QN(n578) );
  DFFRX1 \col2_r_reg[2][1]  ( .D(n1178), .CK(clk), .RN(rst_n), .QN(n576) );
  DFFRX1 \col1_r_reg[2][1]  ( .D(n1177), .CK(clk), .RN(rst_n), .QN(n593) );
  DFFRX1 \col2_r_reg[2][0]  ( .D(n1176), .CK(clk), .RN(rst_n), .QN(n575) );
  DFFRX1 \col1_r_reg[2][0]  ( .D(n1175), .CK(clk), .RN(rst_n), .QN(n585) );
  DFFRX1 \col2_r_reg[3][7]  ( .D(n1174), .CK(clk), .RN(rst_n), .QN(n656) );
  DFFRX1 \col1_r_reg[3][7]  ( .D(n1173), .CK(clk), .RN(rst_n), .QN(n617) );
  DFFRX1 \col2_r_reg[3][6]  ( .D(n1172), .CK(clk), .RN(rst_n), .QN(n655) );
  DFFRX1 \col1_r_reg[3][6]  ( .D(n1171), .CK(clk), .RN(rst_n), .QN(n616) );
  DFFRX1 \col2_r_reg[3][5]  ( .D(n1170), .CK(clk), .RN(n4), .QN(n654) );
  DFFRX1 \col1_r_reg[3][5]  ( .D(n1169), .CK(clk), .RN(n4), .QN(n615) );
  DFFRX1 \col2_r_reg[3][4]  ( .D(n1168), .CK(clk), .RN(n4), .QN(n653) );
  DFFRX1 \col1_r_reg[3][4]  ( .D(n1167), .CK(clk), .RN(n4), .QN(n614) );
  DFFRX1 \col2_r_reg[3][3]  ( .D(n1166), .CK(clk), .RN(rst_n), .QN(n627) );
  DFFRX1 \col1_r_reg[3][3]  ( .D(n1165), .CK(clk), .RN(rst_n), .QN(n707) );
  DFFRX1 \col2_r_reg[3][2]  ( .D(n1164), .CK(clk), .RN(n778), .QN(n626) );
  DFFRX1 \col1_r_reg[3][2]  ( .D(n1163), .CK(clk), .RN(n781), .QN(n597) );
  DFFRX1 \col2_r_reg[3][1]  ( .D(n1162), .CK(clk), .RN(n777), .QN(n698) );
  DFFRX1 \col1_r_reg[3][1]  ( .D(n1161), .CK(clk), .RN(rst_n), .QN(n644) );
  DFFRX1 \col2_r_reg[3][0]  ( .D(n1160), .CK(clk), .RN(rst_n), .QN(n625) );
  DFFRX1 \col1_r_reg[3][0]  ( .D(n1159), .CK(clk), .RN(n778), .QN(n694) );
  DFFRX1 \col2_r_reg[4][7]  ( .D(n1158), .CK(clk), .RN(n780), .Q(
        \col2_r[4][7] ), .QN(n609) );
  DFFRX1 \col1_r_reg[4][7]  ( .D(n1157), .CK(clk), .RN(n780), .QN(n749) );
  DFFRX1 \col2_r_reg[4][6]  ( .D(n1156), .CK(clk), .RN(n780), .Q(
        \col2_r[4][6] ), .QN(n608) );
  DFFRX1 \col1_r_reg[4][6]  ( .D(n1155), .CK(clk), .RN(n780), .QN(n748) );
  DFFRX1 \col2_r_reg[4][5]  ( .D(n1154), .CK(clk), .RN(n4), .Q(\col2_r[4][5] ), 
        .QN(n607) );
  DFFRX1 \col1_r_reg[4][5]  ( .D(n1153), .CK(clk), .RN(n4), .QN(n747) );
  DFFRX1 \col2_r_reg[4][4]  ( .D(n1152), .CK(clk), .RN(n4), .Q(\col2_r[4][4] ), 
        .QN(n606) );
  DFFRX1 \col1_r_reg[4][4]  ( .D(n1151), .CK(clk), .RN(n4), .QN(n746) );
  DFFRX1 \col2_r_reg[4][3]  ( .D(n1150), .CK(clk), .RN(n4), .Q(\col2_r[4][3] ), 
        .QN(n733) );
  DFFRX1 \col1_r_reg[4][3]  ( .D(n1149), .CK(clk), .RN(n4), .QN(n647) );
  DFFRX1 \col2_r_reg[4][2]  ( .D(n1148), .CK(clk), .RN(n4), .Q(\col2_r[4][2] ), 
        .QN(n591) );
  DFFRX1 \col1_r_reg[4][2]  ( .D(n1147), .CK(clk), .RN(n4), .QN(n706) );
  DFFRX1 \col2_r_reg[4][1]  ( .D(n1146), .CK(clk), .RN(rst_n), .Q(
        \col2_r[4][1] ), .QN(n632) );
  DFFRX1 \col1_r_reg[4][1]  ( .D(n1145), .CK(clk), .RN(rst_n), .Q(
        \col1_r[4][1] ), .QN(n718) );
  DFFRX1 \col2_r_reg[4][0]  ( .D(n1144), .CK(clk), .RN(n778), .Q(
        \col2_r[4][0] ), .QN(n701) );
  DFFRX1 \col1_r_reg[4][0]  ( .D(n1143), .CK(clk), .RN(n780), .QN(n624) );
  DFFRX1 \col2_r_reg[5][7]  ( .D(n1142), .CK(clk), .RN(n780), .QN(n728) );
  DFFRX1 \col1_r_reg[5][7]  ( .D(n1141), .CK(clk), .RN(n780), .QN(n613) );
  DFFRX1 \col2_r_reg[5][6]  ( .D(n1140), .CK(clk), .RN(n780), .QN(n727) );
  DFFRX1 \col1_r_reg[5][6]  ( .D(n1139), .CK(clk), .RN(n780), .QN(n612) );
  DFFRX1 \col2_r_reg[5][5]  ( .D(n1138), .CK(clk), .RN(n780), .QN(n726) );
  DFFRX1 \col1_r_reg[5][5]  ( .D(n1137), .CK(clk), .RN(n780), .QN(n611) );
  DFFRX1 \col2_r_reg[5][4]  ( .D(n1136), .CK(clk), .RN(n780), .QN(n725) );
  DFFRX1 \col1_r_reg[5][4]  ( .D(n1135), .CK(clk), .RN(n780), .QN(n610) );
  DFFRX1 \col2_r_reg[5][3]  ( .D(n1134), .CK(clk), .RN(n4), .QN(n577) );
  DFFRX1 \col1_r_reg[5][3]  ( .D(n1133), .CK(clk), .RN(n781), .QN(n595) );
  DFFRX1 \col2_r_reg[5][2]  ( .D(n1132), .CK(clk), .RN(n781), .QN(n697) );
  DFFRX1 \col1_r_reg[5][2]  ( .D(n1131), .CK(clk), .RN(n4), .QN(n594) );
  DFFRX1 \col2_r_reg[5][1]  ( .D(n1130), .CK(clk), .RN(n780), .QN(n696) );
  DFFRX1 \col1_r_reg[5][1]  ( .D(n1129), .CK(clk), .RN(n780), .QN(n637) );
  DFFRX1 \col2_r_reg[5][0]  ( .D(n1128), .CK(clk), .RN(n780), .QN(n695) );
  DFFRX1 \col1_r_reg[5][0]  ( .D(n1127), .CK(clk), .RN(n780), .QN(n622) );
  DFFRX1 \col2_r_reg[6][7]  ( .D(n1126), .CK(clk), .RN(n780), .QN(n661) );
  DFFRX1 \col1_r_reg[6][7]  ( .D(n1125), .CK(clk), .RN(n780), .QN(n759) );
  DFFRX1 \col2_r_reg[6][6]  ( .D(n1124), .CK(clk), .RN(n780), .QN(n660) );
  DFFRX1 \col1_r_reg[6][6]  ( .D(n1123), .CK(clk), .RN(n780), .QN(n760) );
  DFFRX1 \col2_r_reg[6][5]  ( .D(n1122), .CK(clk), .RN(n4), .QN(n659) );
  DFFRX1 \col1_r_reg[6][5]  ( .D(n1121), .CK(clk), .RN(n4), .QN(n761) );
  DFFRX1 \col2_r_reg[6][4]  ( .D(n1120), .CK(clk), .RN(n4), .QN(n658) );
  DFFRX1 \col1_r_reg[6][4]  ( .D(n1119), .CK(clk), .RN(n4), .QN(n762) );
  DFFRX1 \col2_r_reg[6][3]  ( .D(n1118), .CK(clk), .RN(n4), .QN(n734) );
  DFFRX1 \col1_r_reg[6][3]  ( .D(n1117), .CK(clk), .RN(n4), .QN(n649) );
  DFFRX1 \col2_r_reg[6][2]  ( .D(n1116), .CK(clk), .RN(n4), .QN(n634) );
  DFFRX1 \col1_r_reg[6][2]  ( .D(n1115), .CK(clk), .RN(n4), .QN(n719) );
  DFFRX1 \col2_r_reg[6][1]  ( .D(n1114), .CK(clk), .RN(n4), .QN(n633) );
  DFFRX1 \col1_r_reg[6][1]  ( .D(n1113), .CK(clk), .RN(n781), .QN(n720) );
  DFFRX1 \col2_r_reg[6][0]  ( .D(n1112), .CK(clk), .RN(n4), .QN(n631) );
  DFFRX1 \col1_r_reg[6][0]  ( .D(n1111), .CK(clk), .RN(n4), .QN(n721) );
  DFFRX1 \col2_r_reg[7][7]  ( .D(n1110), .CK(clk), .RN(n4), .QN(n687) );
  DFFRX1 \col1_r_reg[7][7]  ( .D(n1109), .CK(clk), .RN(n4), .QN(n775) );
  DFFRX1 \col2_r_reg[7][6]  ( .D(n1108), .CK(clk), .RN(n4), .QN(n682) );
  DFFRX1 \col1_r_reg[7][6]  ( .D(n1107), .CK(clk), .RN(n4), .QN(n776) );
  DFFRX1 \col2_r_reg[7][5]  ( .D(n1106), .CK(clk), .RN(rst_n), .QN(n683) );
  DFFRX1 \col1_r_reg[7][5]  ( .D(n1105), .CK(clk), .RN(n777), .QN(n763) );
  DFFRX1 \col2_r_reg[7][4]  ( .D(n1104), .CK(clk), .RN(rst_n), .QN(n684) );
  DFFRX1 \col1_r_reg[7][4]  ( .D(n1103), .CK(clk), .RN(n777), .QN(n764) );
  DFFRX1 \col2_r_reg[7][3]  ( .D(n1102), .CK(clk), .RN(rst_n), .QN(n685) );
  DFFRX1 \col1_r_reg[7][3]  ( .D(n1101), .CK(clk), .RN(n777), .QN(n765) );
  DFFRX1 \col2_r_reg[7][2]  ( .D(n1100), .CK(clk), .RN(rst_n), .QN(n686) );
  DFFRX1 \col1_r_reg[7][2]  ( .D(n1099), .CK(clk), .RN(n777), .QN(n766) );
  DFFRX1 \col2_r_reg[7][1]  ( .D(n1098), .CK(clk), .RN(n780), .QN(n651) );
  DFFRX1 \col1_r_reg[7][1]  ( .D(n1097), .CK(clk), .RN(n780), .QN(n723) );
  DFFRX1 \col2_r_reg[7][0]  ( .D(n1096), .CK(clk), .RN(n780), .QN(n652) );
  DFFRX1 \col1_r_reg[7][0]  ( .D(n1095), .CK(clk), .RN(n780), .QN(n724) );
  DFFRX1 \up_sum_r_reg[8]  ( .D(n1046), .CK(clk), .RN(n4), .Q(up_sum_r[8]) );
  DFFRX1 \up_sum_r_reg[7]  ( .D(n1047), .CK(clk), .RN(n4), .Q(up_sum_r[7]) );
  DFFRX1 \up_sum_r_reg[6]  ( .D(n1048), .CK(clk), .RN(n4), .Q(up_sum_r[6]) );
  DFFRX1 \up_sum_r_reg[5]  ( .D(n1049), .CK(clk), .RN(n4), .Q(up_sum_r[5]) );
  DFFRX1 \up_sum_r_reg[4]  ( .D(n1050), .CK(clk), .RN(n4), .Q(up_sum_r[4]) );
  DFFRX1 \up_sum_r_reg[3]  ( .D(n1051), .CK(clk), .RN(n4), .Q(up_sum_r[3]) );
  DFFRX1 \up_sum_r_reg[2]  ( .D(n1052), .CK(clk), .RN(n4), .Q(up_sum_r[2]) );
  DFFRX1 \up_sum_r_reg[1]  ( .D(n1053), .CK(clk), .RN(n4), .Q(up_sum_r[1]) );
  DFFRX1 \up_sum_r_reg[0]  ( .D(n1054), .CK(clk), .RN(n781), .Q(up_sum_r[0])
         );
  DFFRX1 \down_sum_r_reg[8]  ( .D(n1056), .CK(clk), .RN(n781), .Q(
        down_sum_r[8]) );
  DFFRX1 \down_sum_r_reg[7]  ( .D(n1057), .CK(clk), .RN(n781), .Q(
        down_sum_r[7]) );
  DFFRX1 \down_sum_r_reg[6]  ( .D(n1058), .CK(clk), .RN(n781), .Q(
        down_sum_r[6]) );
  DFFRX1 \down_sum_r_reg[5]  ( .D(n1059), .CK(clk), .RN(n778), .Q(
        down_sum_r[5]) );
  DFFRX1 \down_sum_r_reg[4]  ( .D(n1060), .CK(clk), .RN(n778), .Q(
        down_sum_r[4]) );
  DFFRX1 \down_sum_r_reg[3]  ( .D(n1061), .CK(clk), .RN(n778), .Q(
        down_sum_r[3]) );
  DFFRX1 \down_sum_r_reg[2]  ( .D(n1062), .CK(clk), .RN(n778), .Q(
        down_sum_r[2]) );
  DFFRX1 \down_sum_r_reg[1]  ( .D(n1063), .CK(clk), .RN(n778), .Q(
        down_sum_r[1]) );
  DFFRX1 \down_sum_r_reg[0]  ( .D(n1064), .CK(clk), .RN(n778), .Q(
        down_sum_r[0]) );
  DFFRX1 \hor_sum_r_reg[8]  ( .D(n1066), .CK(clk), .RN(n778), .Q(hor_sum_r[8])
         );
  DFFRX1 \hor_sum_r_reg[7]  ( .D(n1067), .CK(clk), .RN(n778), .Q(hor_sum_r[7])
         );
  DFFRX1 \hor_sum_r_reg[6]  ( .D(n1068), .CK(clk), .RN(rst_n), .Q(hor_sum_r[6]) );
  DFFRX1 \hor_sum_r_reg[5]  ( .D(n1069), .CK(clk), .RN(n777), .Q(hor_sum_r[5])
         );
  DFFRX1 \hor_sum_r_reg[4]  ( .D(n1070), .CK(clk), .RN(rst_n), .Q(hor_sum_r[4]) );
  DFFRX1 \hor_sum_r_reg[3]  ( .D(n1071), .CK(clk), .RN(n777), .Q(hor_sum_r[3])
         );
  DFFRX1 \hor_sum_r_reg[2]  ( .D(n1072), .CK(clk), .RN(n781), .Q(hor_sum_r[2])
         );
  DFFRX1 \hor_sum_r_reg[1]  ( .D(n1073), .CK(clk), .RN(n781), .Q(hor_sum_r[1])
         );
  DFFRX1 \hor_sum_r_reg[0]  ( .D(n1074), .CK(clk), .RN(n781), .Q(hor_sum_r[0])
         );
  DFFRX1 \ver_sum_r_reg[8]  ( .D(n1076), .CK(clk), .RN(n781), .Q(ver_sum_r[8])
         );
  DFFRX1 \ver_sum_r_reg[7]  ( .D(n1077), .CK(clk), .RN(n781), .Q(ver_sum_r[7])
         );
  DFFRX1 \ver_sum_r_reg[6]  ( .D(n1078), .CK(clk), .RN(n781), .Q(ver_sum_r[6])
         );
  DFFRX1 \ver_sum_r_reg[5]  ( .D(n1079), .CK(clk), .RN(n781), .Q(ver_sum_r[5])
         );
  DFFRX1 \ver_sum_r_reg[4]  ( .D(n1080), .CK(clk), .RN(n781), .Q(ver_sum_r[4])
         );
  DFFRX1 \ver_sum_r_reg[3]  ( .D(n1081), .CK(clk), .RN(n777), .Q(ver_sum_r[3])
         );
  DFFRX1 \ver_sum_r_reg[2]  ( .D(n1082), .CK(clk), .RN(n777), .Q(ver_sum_r[2])
         );
  DFFRX1 \ver_sum_r_reg[1]  ( .D(n1083), .CK(clk), .RN(n777), .Q(ver_sum_r[1])
         );
  DFFRX1 \ver_sum_r_reg[0]  ( .D(n1084), .CK(clk), .RN(n777), .Q(ver_sum_r[0])
         );
  DFFRX1 \cen_r_reg[7]  ( .D(n1085), .CK(clk), .RN(rst_n), .Q(cen_r[7]), .QN(
        n767) );
  DFFRX1 \cen_r_reg[6]  ( .D(n1086), .CK(clk), .RN(rst_n), .Q(cen_r[6]), .QN(
        n768) );
  DFFRX1 \cen_r_reg[5]  ( .D(n1087), .CK(clk), .RN(rst_n), .Q(cen_r[5]), .QN(
        n769) );
  DFFRX1 \cen_r_reg[4]  ( .D(n1088), .CK(clk), .RN(rst_n), .Q(cen_r[4]), .QN(
        n770) );
  DFFRX1 \cen_r_reg[3]  ( .D(n1089), .CK(clk), .RN(rst_n), .Q(cen_r[3]), .QN(
        n771) );
  DFFRX1 \cen_r_reg[2]  ( .D(n1090), .CK(clk), .RN(rst_n), .Q(cen_r[2]), .QN(
        n772) );
  DFFRX1 \cen_r_reg[1]  ( .D(n1091), .CK(clk), .RN(rst_n), .Q(cen_r[1]), .QN(
        n773) );
  DFFRX1 \cen_r_reg[0]  ( .D(n1094), .CK(clk), .RN(rst_n), .Q(cen_r[0]), .QN(
        n774) );
  DFFRX1 RGB_valid_r_reg ( .D(RGB_valid_w), .CK(clk), .RN(n778), .Q(RGB_valid)
         );
  DFFRX1 \G_data_r_reg[7]  ( .D(n1042), .CK(clk), .RN(n778), .Q(G_data_r[7])
         );
  DFFRX1 \G_data_r_reg[6]  ( .D(n1041), .CK(clk), .RN(n778), .Q(G_data_r[6])
         );
  DFFRX1 \G_data_r_reg[5]  ( .D(n1040), .CK(clk), .RN(n778), .Q(G_data_r[5])
         );
  DFFRX1 \G_data_r_reg[4]  ( .D(n1039), .CK(clk), .RN(n777), .Q(G_data_r[4])
         );
  DFFRX1 \G_data_r_reg[3]  ( .D(n1038), .CK(clk), .RN(n777), .Q(G_data_r[3])
         );
  DFFRX1 \G_data_r_reg[2]  ( .D(n1037), .CK(clk), .RN(n777), .Q(G_data_r[2])
         );
  DFFRX1 \G_data_r_reg[1]  ( .D(n1036), .CK(clk), .RN(n777), .Q(G_data_r[1])
         );
  DFFRX1 \G_data_r_reg[0]  ( .D(n1035), .CK(clk), .RN(n777), .Q(G_data_r[0])
         );
  DFFRX1 \B_data_r_reg[7]  ( .D(n1034), .CK(clk), .RN(n777), .Q(B_data_r[7])
         );
  DFFRX1 \B_data_r_reg[6]  ( .D(n1033), .CK(clk), .RN(n777), .Q(B_data_r[6])
         );
  DFFRX1 \B_data_r_reg[5]  ( .D(n1032), .CK(clk), .RN(n777), .Q(B_data_r[5])
         );
  DFFRX1 \B_data_r_reg[4]  ( .D(n1031), .CK(clk), .RN(n4), .Q(B_data_r[4]) );
  DFFRX1 \B_data_r_reg[3]  ( .D(n1030), .CK(clk), .RN(n4), .Q(B_data_r[3]) );
  DFFRX1 \B_data_r_reg[2]  ( .D(n1029), .CK(clk), .RN(n4), .Q(B_data_r[2]) );
  DFFRX1 \B_data_r_reg[1]  ( .D(n1028), .CK(clk), .RN(n4), .Q(B_data_r[1]) );
  DFFRX1 \B_data_r_reg[0]  ( .D(n1027), .CK(clk), .RN(n4), .Q(B_data_r[0]) );
  DFFRX1 \color_r_reg[1]  ( .D(n1026), .CK(clk), .RN(n4), .Q(color[1]) );
  DFFRX1 \color_r_reg[0]  ( .D(n1025), .CK(clk), .RN(n4), .Q(color[0]) );
  DFFRX1 \state_r_reg[0]  ( .D(n1024), .CK(clk), .RN(n4), .Q(n618), .QN(
        state_r[0]) );
  DFFRX1 \RGB_data_r_reg[7]  ( .D(n1023), .CK(clk), .RN(n4), .Q(RGB_data[7])
         );
  DFFRX1 \RGB_data_r_reg[6]  ( .D(n1022), .CK(clk), .RN(n4), .Q(RGB_data[6])
         );
  DFFRX1 \RGB_data_r_reg[5]  ( .D(n1021), .CK(clk), .RN(n4), .Q(RGB_data[5])
         );
  DFFRX1 \RGB_data_r_reg[4]  ( .D(n1020), .CK(clk), .RN(n4), .Q(RGB_data[4])
         );
  DFFRX1 \RGB_data_r_reg[3]  ( .D(n1019), .CK(clk), .RN(rst_n), .Q(RGB_data[3]) );
  DFFRX1 \RGB_data_r_reg[2]  ( .D(n1018), .CK(clk), .RN(rst_n), .Q(RGB_data[2]) );
  DFFRX1 \RGB_data_r_reg[1]  ( .D(n1017), .CK(clk), .RN(rst_n), .Q(RGB_data[1]) );
  DFFRX1 \RGB_data_r_reg[0]  ( .D(n1016), .CK(clk), .RN(rst_n), .Q(RGB_data[0]) );
  ADDFX1 \intadd_7/U8  ( .A(down_sum_r[2]), .B(up_sum_r[2]), .CI(\intadd_7/CI ), .CO(\intadd_7/n7 ), .S(\intadd_7/SUM[0] ) );
  ADDFX1 \intadd_7/U7  ( .A(down_sum_r[3]), .B(up_sum_r[3]), .CI(\intadd_7/n7 ), .CO(\intadd_7/n6 ), .S(\intadd_7/SUM[1] ) );
  ADDFX1 \intadd_7/U6  ( .A(down_sum_r[4]), .B(up_sum_r[4]), .CI(\intadd_7/n6 ), .CO(\intadd_7/n5 ), .S(\intadd_7/SUM[2] ) );
  ADDFX1 \intadd_7/U5  ( .A(down_sum_r[5]), .B(up_sum_r[5]), .CI(\intadd_7/n5 ), .CO(\intadd_7/n4 ), .S(\intadd_7/SUM[3] ) );
  ADDFX1 \intadd_7/U4  ( .A(down_sum_r[6]), .B(up_sum_r[6]), .CI(\intadd_7/n4 ), .CO(\intadd_7/n3 ), .S(\intadd_7/SUM[4] ) );
  ADDFX1 \intadd_7/U3  ( .A(down_sum_r[7]), .B(up_sum_r[7]), .CI(\intadd_7/n3 ), .CO(\intadd_7/n2 ), .S(\intadd_7/SUM[5] ) );
  ADDFX1 \intadd_7/U2  ( .A(down_sum_r[8]), .B(up_sum_r[8]), .CI(\intadd_7/n2 ), .CO(\intadd_7/n1 ), .S(\intadd_7/SUM[6] ) );
  ADDFX1 \intadd_8/U8  ( .A(ver_sum_r[2]), .B(hor_sum_r[2]), .CI(\intadd_8/CI ), .CO(\intadd_8/n7 ), .S(\intadd_8/SUM[0] ) );
  ADDFX1 \intadd_8/U7  ( .A(ver_sum_r[3]), .B(hor_sum_r[3]), .CI(\intadd_8/n7 ), .CO(\intadd_8/n6 ), .S(\intadd_8/SUM[1] ) );
  ADDFX1 \intadd_8/U3  ( .A(ver_sum_r[7]), .B(hor_sum_r[7]), .CI(\intadd_8/n3 ), .CO(\intadd_8/n2 ), .S(\intadd_8/SUM[5] ) );
  ADDFX1 \intadd_8/U2  ( .A(ver_sum_r[8]), .B(hor_sum_r[8]), .CI(\intadd_8/n2 ), .CO(\intadd_8/n1 ), .S(\intadd_8/SUM[6] ) );
  ADDFX1 \intadd_8/U6  ( .A(ver_sum_r[4]), .B(hor_sum_r[4]), .CI(\intadd_8/n6 ), .CO(\intadd_8/n5 ), .S(\intadd_8/SUM[2] ) );
  ADDFX1 \intadd_8/U5  ( .A(ver_sum_r[5]), .B(hor_sum_r[5]), .CI(\intadd_8/n5 ), .CO(\intadd_8/n4 ), .S(\intadd_8/SUM[3] ) );
  ADDFX1 \intadd_8/U4  ( .A(ver_sum_r[6]), .B(hor_sum_r[6]), .CI(\intadd_8/n4 ), .CO(\intadd_8/n3 ), .S(\intadd_8/SUM[4] ) );
  ADDFX1 \intadd_9/U3  ( .A(\intadd_9/A[4] ), .B(\intadd_9/B[4] ), .CI(
        \intadd_9/n3 ), .CO(\intadd_9/n2 ), .S(\intadd_9/SUM[4] ) );
  ADDFX1 \intadd_9/U6  ( .A(\intadd_9/A[1] ), .B(\intadd_9/B[1] ), .CI(
        \intadd_9/n6 ), .CO(\intadd_9/n5 ), .S(\intadd_9/SUM[1] ) );
  ADDFX1 \intadd_9/U7  ( .A(\intadd_9/A[0] ), .B(\intadd_9/B[0] ), .CI(
        \intadd_9/CI ), .CO(\intadd_9/n6 ), .S(\intadd_9/SUM[0] ) );
  ADDFX1 \intadd_9/U2  ( .A(\intadd_9/A[5] ), .B(\intadd_9/B[5] ), .CI(
        \intadd_9/n2 ), .CO(\intadd_9/n1 ), .S(\intadd_9/SUM[5] ) );
  ADDFX1 \intadd_9/U4  ( .A(\intadd_9/A[3] ), .B(\intadd_9/B[3] ), .CI(
        \intadd_9/n4 ), .CO(\intadd_9/n3 ), .S(\intadd_9/SUM[3] ) );
  ADDFX1 \intadd_9/U5  ( .A(\intadd_9/A[2] ), .B(\intadd_9/B[2] ), .CI(
        \intadd_9/n5 ), .CO(\intadd_9/n4 ), .S(\intadd_9/SUM[2] ) );
  DFFRX2 \state_r_reg[1]  ( .D(state_w[1]), .CK(clk), .RN(n780), .Q(state_r[1]), .QN(n691) );
  DFFRX2 valid_r_reg ( .D(valid), .CK(clk), .RN(n780), .Q(valid_r), .QN(n688)
         );
  DFFRX2 \counter_r_reg[0]  ( .D(n1281), .CK(clk), .RN(rst_n), .Q(counter_r[0]), .QN(n689) );
  DFFRX2 \counter_r_reg[2]  ( .D(n1280), .CK(clk), .RN(rst_n), .Q(counter_r[2]), .QN(n574) );
  DFFRX1 \state_r_reg[2]  ( .D(state_w[2]), .CK(clk), .RN(rst_n), .Q(
        state_r[2]), .QN(n690) );
  DFFRX1 \data_in_r_reg[0]  ( .D(data_in[0]), .CK(clk), .RN(n780), .Q(
        pixel9[0]) );
  DFFRX1 \data_in_r_reg[1]  ( .D(data_in[1]), .CK(clk), .RN(n778), .Q(
        pixel9[1]) );
  DFFRX1 \data_in_r_reg[2]  ( .D(data_in[2]), .CK(clk), .RN(rst_n), .Q(
        pixel9[2]) );
  DFFRX1 \data_in_r_reg[3]  ( .D(data_in[3]), .CK(clk), .RN(rst_n), .Q(
        pixel9[3]) );
  DFFRX1 \data_in_r_reg[4]  ( .D(data_in[4]), .CK(clk), .RN(n777), .Q(
        pixel9[4]) );
  DFFRX1 \data_in_r_reg[5]  ( .D(data_in[5]), .CK(clk), .RN(n780), .Q(
        pixel9[5]) );
  DFFRX1 \data_in_r_reg[6]  ( .D(data_in[6]), .CK(clk), .RN(n780), .Q(
        pixel9[6]) );
  DFFRX1 \data_in_r_reg[7]  ( .D(data_in[7]), .CK(clk), .RN(n780), .Q(
        pixel9[7]) );
  CLKBUFX8 U3 ( .A(rst_n), .Y(n781) );
  OAI31X1 U4 ( .A0(state_r[0]), .A1(state_r[1]), .A2(n181), .B0(n186), .Y(n202) );
  AOI2BB2X1 U5 ( .B0(n541), .B1(\col1_r[1][0] ), .A0N(n540), .A1N(n694), .Y(
        n534) );
  INVX12 U6 ( .A(n569), .Y(n17) );
  INVX12 U7 ( .A(n545), .Y(n30) );
  INVXL U8 ( .A(n223), .Y(n24) );
  AO22X4 U9 ( .A0(n72), .A1(B_data_r[1]), .B0(n73), .B1(\intadd_7/SUM[1] ), 
        .Y(n87) );
  AOI2BB2X2 U10 ( .B0(n553), .B1(n551), .A0N(n553), .A1N(n551), .Y(n552) );
  AO22X4 U11 ( .A0(valid_r), .A1(n184), .B0(state_r[2]), .B1(n183), .Y(
        state_w[2]) );
  AO21X4 U12 ( .A0(color[1]), .A1(n559), .B0(n72), .Y(n1026) );
  AO22X4 U13 ( .A0(n295), .A1(n294), .B0(ver_sum_r[0]), .B1(n407), .Y(n1084)
         );
  AO22X4 U14 ( .A0(n295), .A1(n408), .B0(hor_sum_r[2]), .B1(n407), .Y(n1072)
         );
  AO22X4 U15 ( .A0(n295), .A1(n530), .B0(down_sum_r[8]), .B1(n407), .Y(n1056)
         );
  AO22X4 U16 ( .A0(pic_last_buf_r), .A1(n558), .B0(pic_last), .B1(n557), .Y(
        n1043) );
  CLKBUFX8 U17 ( .A(n177), .Y(n5) );
  CLKBUFX8 U18 ( .A(n177), .Y(n1) );
  INVX4 U19 ( .A(n248), .Y(n295) );
  INVX6 U20 ( .A(n286), .Y(n407) );
  CLKBUFX8 U21 ( .A(n546), .Y(n6) );
  INVX4 U22 ( .A(n541), .Y(n546) );
  INVX6 U23 ( .A(n32), .Y(n2) );
  INVX8 U24 ( .A(n31), .Y(n3) );
  BUFX16 U25 ( .A(n781), .Y(n4) );
  AO22X1 U26 ( .A0(n295), .A1(n472), .B0(hor_sum_r[8]), .B1(n407), .Y(n1066)
         );
  AO22X1 U27 ( .A0(n295), .A1(n375), .B0(ver_sum_r[8]), .B1(n407), .Y(n1076)
         );
  AO22X1 U28 ( .A0(n295), .A1(n468), .B0(hor_sum_r[7]), .B1(n407), .Y(n1067)
         );
  AO22X1 U29 ( .A0(n295), .A1(n371), .B0(ver_sum_r[7]), .B1(n407), .Y(n1077)
         );
  AO22X1 U30 ( .A0(n295), .A1(n456), .B0(hor_sum_r[6]), .B1(n407), .Y(n1068)
         );
  AO22X1 U31 ( .A0(n295), .A1(n527), .B0(down_sum_r[7]), .B1(n407), .Y(n1057)
         );
  AO22X1 U32 ( .A0(n295), .A1(n360), .B0(ver_sum_r[6]), .B1(n407), .Y(n1078)
         );
  AO22X1 U33 ( .A0(n295), .A1(n349), .B0(ver_sum_r[5]), .B1(n407), .Y(n1079)
         );
  AO22X1 U34 ( .A0(n295), .A1(n444), .B0(hor_sum_r[5]), .B1(n407), .Y(n1069)
         );
  AO22X1 U35 ( .A0(n295), .A1(n519), .B0(down_sum_r[6]), .B1(n407), .Y(n1058)
         );
  AO22X1 U36 ( .A0(n295), .A1(n512), .B0(down_sum_r[5]), .B1(n407), .Y(n1059)
         );
  AO22X1 U37 ( .A0(n295), .A1(n432), .B0(hor_sum_r[4]), .B1(n407), .Y(n1070)
         );
  AO22X1 U38 ( .A0(n295), .A1(n338), .B0(ver_sum_r[4]), .B1(n407), .Y(n1080)
         );
  AO22X1 U39 ( .A0(n295), .A1(n505), .B0(down_sum_r[4]), .B1(n407), .Y(n1060)
         );
  AO22X1 U40 ( .A0(n295), .A1(n420), .B0(hor_sum_r[3]), .B1(n407), .Y(n1071)
         );
  AO22X1 U41 ( .A0(n295), .A1(n327), .B0(ver_sum_r[3]), .B1(n407), .Y(n1081)
         );
  AO22X1 U42 ( .A0(n295), .A1(n316), .B0(ver_sum_r[2]), .B1(n407), .Y(n1082)
         );
  AO22X1 U43 ( .A0(n295), .A1(n497), .B0(down_sum_r[3]), .B1(n407), .Y(n1061)
         );
  AO22X1 U44 ( .A0(n295), .A1(n490), .B0(down_sum_r[2]), .B1(n407), .Y(n1062)
         );
  AO22X1 U45 ( .A0(n72), .A1(B_data_r[6]), .B0(n73), .B1(\intadd_7/SUM[6] ), 
        .Y(n125) );
  AO22X1 U46 ( .A0(ver_sum_r[1]), .A1(n407), .B0(n295), .B1(n305), .Y(n1083)
         );
  AO22X1 U47 ( .A0(hor_sum_r[1]), .A1(n407), .B0(n295), .B1(n395), .Y(n1073)
         );
  AO22X1 U48 ( .A0(n72), .A1(B_data_r[7]), .B0(n73), .B1(\intadd_7/n1 ), .Y(
        n129) );
  AO22X1 U49 ( .A0(n295), .A1(n384), .B0(hor_sum_r[0]), .B1(n407), .Y(n1074)
         );
  AO22X1 U50 ( .A0(down_sum_r[1]), .A1(n407), .B0(n295), .B1(n483), .Y(n1063)
         );
  AO22X1 U51 ( .A0(n72), .A1(B_data_r[5]), .B0(n73), .B1(\intadd_7/SUM[5] ), 
        .Y(n95) );
  AOI2BB2X1 U52 ( .B0(n556), .B1(n554), .A0N(n556), .A1N(n554), .Y(n551) );
  AO22X1 U53 ( .A0(n72), .A1(B_data_r[4]), .B0(n73), .B1(\intadd_7/SUM[4] ), 
        .Y(n91) );
  AO22X1 U54 ( .A0(n295), .A1(n477), .B0(down_sum_r[0]), .B1(n407), .Y(n1064)
         );
  AO22X1 U55 ( .A0(n72), .A1(B_data_r[3]), .B0(n73), .B1(\intadd_7/SUM[3] ), 
        .Y(n83) );
  AO22X1 U56 ( .A0(n295), .A1(end_pic_r), .B0(pic_last_buf_r), .B1(n407), .Y(
        n1044) );
  AO22X1 U57 ( .A0(n72), .A1(B_data_r[2]), .B0(n73), .B1(\intadd_7/SUM[2] ), 
        .Y(n74) );
  AO22X1 U58 ( .A0(col_last_buf_r), .A1(n558), .B0(col_last), .B1(n557), .Y(
        n1092) );
  AO22X1 U59 ( .A0(ver_sum_r[5]), .A1(n69), .B0(hor_sum_r[5]), .B1(n71), .Y(
        n92) );
  AO22X1 U60 ( .A0(ver_sum_r[4]), .A1(n69), .B0(hor_sum_r[4]), .B1(n71), .Y(
        n84) );
  AO22X1 U61 ( .A0(ver_sum_r[6]), .A1(n69), .B0(hor_sum_r[6]), .B1(n71), .Y(
        n96) );
  AO22X1 U62 ( .A0(ver_sum_r[1]), .A1(n69), .B0(hor_sum_r[1]), .B1(n71), .Y(
        n80) );
  AO22X1 U63 ( .A0(n72), .A1(B_data_r[0]), .B0(n73), .B1(\intadd_7/SUM[0] ), 
        .Y(n79) );
  NOR2X1 U64 ( .A(n209), .B(n688), .Y(n14) );
  AO22X1 U65 ( .A0(ver_sum_r[2]), .A1(n69), .B0(hor_sum_r[2]), .B1(n71), .Y(
        n88) );
  AO22X1 U66 ( .A0(ver_sum_r[3]), .A1(n69), .B0(hor_sum_r[3]), .B1(n71), .Y(
        n75) );
  OA21XL U67 ( .A0(n209), .A1(n620), .B0(n210), .Y(n51) );
  NOR3X1 U68 ( .A(state_r[1]), .B(n618), .C(n181), .Y(n22) );
  AO22X1 U69 ( .A0(ver_sum_r[8]), .A1(n69), .B0(hor_sum_r[8]), .B1(n71), .Y(
        n130) );
  AO22X1 U70 ( .A0(ver_sum_r[7]), .A1(n69), .B0(hor_sum_r[7]), .B1(n71), .Y(
        n126) );
  NAND2X4 U71 ( .A(valid_r), .B(n247), .Y(n248) );
  BUFX12 U72 ( .A(n134), .Y(n547) );
  NAND2X1 U73 ( .A(n250), .B(n560), .Y(n247) );
  AND3X4 U74 ( .A(counter_r[2]), .B(counter_r[1]), .C(n689), .Y(n32) );
  NOR3X2 U75 ( .A(logic_state_r[2]), .B(logic_state_r[1]), .C(n635), .Y(n73)
         );
  AND3X2 U76 ( .A(counter_r[0]), .B(n574), .C(n619), .Y(n31) );
  CLKBUFX8 U77 ( .A(rst_n), .Y(n780) );
  INVX2 U78 ( .A(n10), .Y(n11) );
  INVX2 U79 ( .A(n237), .Y(n238) );
  AO21X2 U80 ( .A0(up_sum_r[0]), .A1(n407), .B0(n539), .Y(n1054) );
  INVX2 U81 ( .A(n214), .Y(n215) );
  NAND2X4 U82 ( .A(n27), .B(n26), .Y(n177) );
  INVX2 U83 ( .A(n212), .Y(n213) );
  INVX2 U84 ( .A(n221), .Y(n222) );
  INVX2 U85 ( .A(n224), .Y(n225) );
  INVX2 U86 ( .A(n218), .Y(n219) );
  INVX2 U87 ( .A(n227), .Y(n228) );
  INVX2 U88 ( .A(n216), .Y(n217) );
  NOR2X1 U89 ( .A(n209), .B(n25), .Y(n27) );
  NAND2X1 U90 ( .A(n51), .B(n50), .Y(n53) );
  AO22X1 U91 ( .A0(valid_r), .A1(n191), .B0(n566), .B1(n190), .Y(state_w[3])
         );
  NOR2X1 U92 ( .A(end_col_r), .B(n17), .Y(n26) );
  INVX2 U93 ( .A(n13), .Y(n226) );
  NAND2X2 U94 ( .A(n133), .B(n99), .Y(n100) );
  INVX1 U95 ( .A(n61), .Y(n52) );
  NOR2X1 U96 ( .A(n14), .B(n15), .Y(n13) );
  AOI2BB2X1 U97 ( .B0(n541), .B1(\col3_r[1][1] ), .A0N(n540), .A1N(n630), .Y(
        n542) );
  AOI2BB2X1 U98 ( .B0(n541), .B1(\col3_r[1][0] ), .A0N(n540), .A1N(n693), .Y(
        n531) );
  NAND2BX1 U99 ( .AN(n563), .B(n562), .Y(n1025) );
  NOR2X4 U100 ( .A(n635), .B(n70), .Y(n69) );
  NOR2X4 U101 ( .A(logic_state_r[0]), .B(n70), .Y(n71) );
  BUFX12 U102 ( .A(n24), .Y(n540) );
  INVX2 U103 ( .A(n73), .Y(n99) );
  NAND2X4 U104 ( .A(n28), .B(n574), .Y(n29) );
  INVX2 U105 ( .A(n250), .Y(n72) );
  OAI21X2 U106 ( .A0(n16), .A1(n561), .B0(n560), .Y(n67) );
  INVX2 U107 ( .A(n185), .Y(n564) );
  NOR3X2 U108 ( .A(logic_state_r[0]), .B(logic_state_r[1]), .C(n722), .Y(n65)
         );
  NAND2X1 U109 ( .A(state_r[1]), .B(n618), .Y(n192) );
  NOR2X2 U110 ( .A(logic_state_r[2]), .B(n16), .Y(n68) );
  AOI211XL U111 ( .A0(n32), .A1(\col2_r[4][3] ), .B0(n318), .C0(n317), .Y(n319) );
  NOR3XL U112 ( .A(n398), .B(n397), .C(n396), .Y(n399) );
  NOR3XL U113 ( .A(n411), .B(n410), .C(n409), .Y(n412) );
  NOR3XL U114 ( .A(n423), .B(n422), .C(n421), .Y(n424) );
  NOR3XL U115 ( .A(n435), .B(n434), .C(n433), .Y(n436) );
  BUFX2 U116 ( .A(n22), .Y(n49) );
  AOI211XL U117 ( .A0(n32), .A1(\col2_r[4][5] ), .B0(n340), .C0(n339), .Y(n341) );
  AOI211XL U118 ( .A0(n32), .A1(\col2_r[4][6] ), .B0(n351), .C0(n350), .Y(n352) );
  NOR3XL U119 ( .A(n402), .B(n401), .C(n400), .Y(n403) );
  NOR3XL U120 ( .A(n415), .B(n414), .C(n413), .Y(n416) );
  NOR3XL U121 ( .A(n427), .B(n426), .C(n425), .Y(n428) );
  NOR3XL U122 ( .A(n439), .B(n438), .C(n437), .Y(n440) );
  NOR3XL U123 ( .A(n451), .B(n450), .C(n449), .Y(n452) );
  NOR3XL U124 ( .A(n459), .B(n458), .C(n457), .Y(n460) );
  NOR3XL U125 ( .A(n146), .B(n145), .C(n144), .Y(\intadd_9/A[1] ) );
  NOR3XL U126 ( .A(n143), .B(n142), .C(n141), .Y(\intadd_9/B[1] ) );
  NOR3XL U127 ( .A(n152), .B(n151), .C(n150), .Y(\intadd_9/A[2] ) );
  NOR3XL U128 ( .A(n149), .B(n148), .C(n147), .Y(\intadd_9/B[2] ) );
  NOR3XL U129 ( .A(n158), .B(n157), .C(n156), .Y(\intadd_9/A[3] ) );
  NOR3XL U130 ( .A(n155), .B(n154), .C(n153), .Y(\intadd_9/B[3] ) );
  NOR3XL U131 ( .A(n161), .B(n160), .C(n159), .Y(\intadd_9/B[4] ) );
  BUFX2 U132 ( .A(state_r[3]), .Y(n566) );
  NOR2X1 U133 ( .A(state_r[2]), .B(n566), .Y(n23) );
  XNOR2X1 U134 ( .A(n574), .B(n205), .Y(n203) );
  NOR2X2 U135 ( .A(n618), .B(n691), .Y(n185) );
  NAND2X2 U136 ( .A(n211), .B(n62), .Y(n54) );
  NAND2X2 U137 ( .A(n211), .B(n48), .Y(n44) );
  INVXL U138 ( .A(n38), .Y(n10) );
  NAND2XL U139 ( .A(n223), .B(n48), .Y(n38) );
  NAND2X2 U140 ( .A(n545), .B(n48), .Y(n40) );
  NAND2X2 U141 ( .A(n48), .B(n31), .Y(n42) );
  NAND2X2 U142 ( .A(n541), .B(n48), .Y(n34) );
  NAND2X2 U143 ( .A(n569), .B(n48), .Y(n241) );
  INVX4 U144 ( .A(pixel9[0]), .Y(n240) );
  INVX4 U145 ( .A(pixel9[1]), .Y(n236) );
  INVX4 U146 ( .A(pixel9[4]), .Y(n233) );
  INVX4 U147 ( .A(pixel9[5]), .Y(n232) );
  INVX4 U148 ( .A(pixel9[6]), .Y(n231) );
  INVX4 U149 ( .A(pixel9[3]), .Y(n234) );
  INVX4 U150 ( .A(pixel9[2]), .Y(n235) );
  INVX4 U151 ( .A(pixel9[7]), .Y(n230) );
  BUFX2 U152 ( .A(n45), .Y(n12) );
  NAND2XL U153 ( .A(n220), .B(n48), .Y(n45) );
  NAND2X2 U154 ( .A(n32), .B(n48), .Y(n36) );
  NOR2BX2 U155 ( .AN(n49), .B(n25), .Y(n48) );
  AOI22X1 U156 ( .A0(valid_r), .A1(n201), .B0(n200), .B1(n564), .Y(n204) );
  NAND2X2 U157 ( .A(n62), .B(n31), .Y(n64) );
  NAND2X2 U158 ( .A(n223), .B(n62), .Y(n57) );
  NAND2X2 U159 ( .A(n220), .B(n62), .Y(n174) );
  NAND2X2 U160 ( .A(n545), .B(n62), .Y(n179) );
  NAND2X2 U161 ( .A(n541), .B(n62), .Y(n59) );
  NAND2X2 U162 ( .A(n32), .B(n62), .Y(n176) );
  NOR2X2 U163 ( .A(n53), .B(n52), .Y(n62) );
  NOR2XL U164 ( .A(n210), .B(n688), .Y(n15) );
  NAND2X2 U165 ( .A(n32), .B(n226), .Y(n227) );
  NAND2X2 U166 ( .A(n223), .B(n226), .Y(n224) );
  NAND2X2 U167 ( .A(n220), .B(n226), .Y(n221) );
  NAND2X2 U168 ( .A(n541), .B(n226), .Y(n218) );
  NAND2X2 U169 ( .A(n545), .B(n226), .Y(n216) );
  NAND2X2 U170 ( .A(n31), .B(n226), .Y(n214) );
  NAND2X2 U171 ( .A(n211), .B(n226), .Y(n212) );
  NOR2X2 U172 ( .A(n17), .B(n47), .Y(n239) );
  AOI211XL U173 ( .A0(n32), .A1(\col2_r[4][1] ), .B0(n297), .C0(n296), .Y(n298) );
  AOI211XL U174 ( .A0(n32), .A1(\col2_r[4][4] ), .B0(n329), .C0(n328), .Y(n330) );
  AOI211XL U175 ( .A0(n32), .A1(\col2_r[4][7] ), .B0(n362), .C0(n361), .Y(n363) );
  NOR3XL U176 ( .A(n447), .B(n446), .C(n445), .Y(n448) );
  INVXL U177 ( .A(n65), .Y(n66) );
  NOR2XL U178 ( .A(n628), .B(n3), .Y(n246) );
  NOR2XL U179 ( .A(n603), .B(n3), .Y(n269) );
  NOR2XL U180 ( .A(n602), .B(n3), .Y(n284) );
  OR4X2 U181 ( .A(n367), .B(n366), .C(n365), .D(n364), .Y(n373) );
  OR4X2 U182 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(n482) );
  AOI211XL U183 ( .A0(RGB_data[2]), .A1(n67), .B0(n75), .C0(n74), .Y(n78) );
  AOI22XL U184 ( .A0(n65), .A1(\intadd_7/SUM[6] ), .B0(ver_sum_r[7]), .B1(n71), 
        .Y(n110) );
  NOR4XL U185 ( .A(n254), .B(n253), .C(n252), .D(n251), .Y(n255) );
  OAI211XL U186 ( .A0(n774), .A1(n133), .B0(n82), .C0(n81), .Y(n1016) );
  OAI211XL U187 ( .A0(n771), .A1(n99), .B0(n124), .C0(n123), .Y(n1030) );
  CLKBUFX3 U188 ( .A(rst_n), .Y(n778) );
  OAI2BB2XL U189 ( .B0(\intadd_9/n1 ), .B1(n248), .A0N(up_sum_r[8]), .A1N(n407), .Y(n1046) );
  OAI2BB2XL U190 ( .B0(n620), .B1(n248), .A0N(col_last_buf_r), .A1N(n407), .Y(
        n1093) );
  NOR2X1 U191 ( .A(state_r[2]), .B(n692), .Y(n195) );
  NOR2XL U192 ( .A(n618), .B(n566), .Y(n18) );
  NAND2X1 U193 ( .A(counter_r[0]), .B(counter_r[1]), .Y(n205) );
  NOR2X1 U194 ( .A(n574), .B(n205), .Y(n569) );
  NOR2XL U195 ( .A(n26), .B(n688), .Y(n182) );
  OAI21XL U196 ( .A0(n195), .A1(n18), .B0(n182), .Y(n19) );
  NOR2XL U197 ( .A(n569), .B(end_col_r), .Y(n198) );
  INVX1 U198 ( .A(n198), .Y(n188) );
  NAND2XL U199 ( .A(valid_r), .B(n195), .Y(n194) );
  NOR2XL U200 ( .A(n188), .B(n194), .Y(n200) );
  AOI22XL U201 ( .A0(state_r[1]), .A1(n19), .B0(n200), .B1(n192), .Y(n21) );
  NAND4XL U202 ( .A(state_r[0]), .B(n569), .C(valid_r), .D(n23), .Y(n20) );
  OAI211XL U203 ( .A0(state_r[2]), .A1(n564), .B0(n21), .C0(n20), .Y(
        state_w[1]) );
  NOR3X1 U204 ( .A(counter_r[1]), .B(n689), .C(n574), .Y(n223) );
  CLKINVX1 U205 ( .A(n23), .Y(n181) );
  NOR2X1 U206 ( .A(n566), .B(n690), .Y(n571) );
  OAI22X1 U207 ( .A0(n185), .A1(n195), .B0(n564), .B1(n571), .Y(n209) );
  OAI22X1 U208 ( .A0(n185), .A1(n571), .B0(n564), .B1(n23), .Y(n210) );
  NOR2X2 U209 ( .A(n181), .B(n192), .Y(n61) );
  NAND3X1 U210 ( .A(n51), .B(valid_r), .C(n52), .Y(n25) );
  NOR3X4 U211 ( .A(n209), .B(n188), .C(n25), .Y(n60) );
  OAI21XL U212 ( .A0(n185), .A1(state_r[2]), .B0(n566), .Y(n186) );
  OR2X2 U213 ( .A(n25), .B(n202), .Y(n47) );
  AOI211X2 U214 ( .A0(n49), .A1(n540), .B0(n60), .C0(n47), .Y(n37) );
  OAI222XL U215 ( .A0(n11), .A1(n233), .B0(n610), .B1(n37), .C0(n5), .C1(n725), 
        .Y(n1135) );
  OAI222XL U216 ( .A0(n11), .A1(n240), .B0(n622), .B1(n37), .C0(n5), .C1(n695), 
        .Y(n1127) );
  NOR3X1 U217 ( .A(counter_r[0]), .B(counter_r[1]), .C(n574), .Y(n220) );
  CLKINVX1 U218 ( .A(n220), .Y(n134) );
  AOI211X2 U219 ( .A0(n49), .A1(n547), .B0(n60), .C0(n47), .Y(n46) );
  OAI222XL U220 ( .A0(n12), .A1(n236), .B0(n718), .B1(n46), .C0(n5), .C1(n632), 
        .Y(n1145) );
  OAI222XL U221 ( .A0(n12), .A1(n232), .B0(n747), .B1(n46), .C0(n5), .C1(n607), 
        .Y(n1153) );
  NOR2XL U222 ( .A(counter_r[0]), .B(counter_r[1]), .Y(n28) );
  INVX1 U223 ( .A(n29), .Y(n211) );
  AOI211X2 U224 ( .A0(n49), .A1(n29), .B0(n60), .C0(n47), .Y(n43) );
  OAI222XL U225 ( .A0(n44), .A1(n230), .B0(n665), .B1(n43), .C0(n602), .C1(n5), 
        .Y(n1221) );
  OAI222XL U226 ( .A0(n231), .A1(n44), .B0(n664), .B1(n43), .C0(n605), .C1(n5), 
        .Y(n1219) );
  OAI222XL U227 ( .A0(n233), .A1(n44), .B0(n662), .B1(n43), .C0(n603), .C1(n5), 
        .Y(n1215) );
  OAI222XL U228 ( .A0(n234), .A1(n44), .B0(n741), .B1(n43), .C0(n657), .C1(n5), 
        .Y(n1213) );
  OAI222XL U229 ( .A0(n232), .A1(n44), .B0(n663), .B1(n43), .C0(n604), .C1(n5), 
        .Y(n1217) );
  OAI222XL U230 ( .A0(n235), .A1(n44), .B0(n638), .B1(n43), .C0(n590), .C1(n5), 
        .Y(n1211) );
  NOR3X2 U231 ( .A(counter_r[2]), .B(counter_r[0]), .C(n619), .Y(n545) );
  AOI211X2 U232 ( .A0(n49), .A1(n30), .B0(n60), .C0(n47), .Y(n39) );
  OAI222XL U233 ( .A0(n601), .A1(n5), .B0(n583), .B1(n39), .C0(n230), .C1(n40), 
        .Y(n1189) );
  AOI211X2 U234 ( .A0(n49), .A1(n3), .B0(n60), .C0(n47), .Y(n41) );
  OAI222XL U235 ( .A0(n729), .A1(n5), .B0(n681), .B1(n41), .C0(n230), .C1(n42), 
        .Y(n1205) );
  NOR2X2 U236 ( .A(counter_r[2]), .B(n205), .Y(n541) );
  AOI211X2 U237 ( .A0(n49), .A1(n6), .B0(n60), .C0(n47), .Y(n33) );
  OAI222XL U238 ( .A0(n656), .A1(n5), .B0(n617), .B1(n33), .C0(n230), .C1(n34), 
        .Y(n1173) );
  OAI222XL U239 ( .A0(n728), .A1(n5), .B0(n613), .B1(n37), .C0(n230), .C1(n11), 
        .Y(n1141) );
  INVX3 U240 ( .A(n32), .Y(n498) );
  AOI211X2 U241 ( .A0(n49), .A1(n498), .B0(n60), .C0(n47), .Y(n35) );
  OAI222XL U242 ( .A0(n661), .A1(n5), .B0(n759), .B1(n35), .C0(n230), .C1(n36), 
        .Y(n1125) );
  OAI222XL U243 ( .A0(n34), .A1(n234), .B0(n707), .B1(n33), .C0(n5), .C1(n627), 
        .Y(n1165) );
  OAI222XL U244 ( .A0(n40), .A1(n236), .B0(n593), .B1(n39), .C0(n5), .C1(n576), 
        .Y(n1177) );
  OAI222XL U245 ( .A0(n12), .A1(n240), .B0(n624), .B1(n46), .C0(n5), .C1(n701), 
        .Y(n1143) );
  OAI222XL U246 ( .A0(n34), .A1(n233), .B0(n614), .B1(n33), .C0(n5), .C1(n653), 
        .Y(n1167) );
  OAI222XL U247 ( .A0(n11), .A1(n234), .B0(n595), .B1(n37), .C0(n5), .C1(n577), 
        .Y(n1133) );
  OAI222XL U248 ( .A0(n40), .A1(n234), .B0(n702), .B1(n39), .C0(n5), .C1(n587), 
        .Y(n1181) );
  OAI222XL U249 ( .A0(n12), .A1(n233), .B0(n746), .B1(n46), .C0(n5), .C1(n606), 
        .Y(n1151) );
  OAI222XL U250 ( .A0(n34), .A1(n232), .B0(n615), .B1(n33), .C0(n5), .C1(n654), 
        .Y(n1169) );
  OAI222XL U251 ( .A0(n34), .A1(n235), .B0(n597), .B1(n33), .C0(n5), .C1(n626), 
        .Y(n1163) );
  OAI222XL U252 ( .A0(n40), .A1(n240), .B0(n585), .B1(n39), .C0(n5), .C1(n575), 
        .Y(n1175) );
  OAI222XL U253 ( .A0(n34), .A1(n231), .B0(n616), .B1(n33), .C0(n5), .C1(n655), 
        .Y(n1171) );
  OAI222XL U254 ( .A0(n40), .A1(n235), .B0(n578), .B1(n39), .C0(n5), .C1(n586), 
        .Y(n1179) );
  OAI222XL U255 ( .A0(n12), .A1(n231), .B0(n748), .B1(n46), .C0(n5), .C1(n608), 
        .Y(n1155) );
  OAI222XL U256 ( .A0(n34), .A1(n236), .B0(n644), .B1(n33), .C0(n5), .C1(n698), 
        .Y(n1161) );
  OAI222XL U257 ( .A0(n34), .A1(n240), .B0(n694), .B1(n33), .C0(n5), .C1(n625), 
        .Y(n1159) );
  OAI222XL U258 ( .A0(n36), .A1(n232), .B0(n761), .B1(n35), .C0(n1), .C1(n659), 
        .Y(n1121) );
  OAI222XL U259 ( .A0(n12), .A1(n234), .B0(n647), .B1(n46), .C0(n1), .C1(n733), 
        .Y(n1149) );
  OAI222XL U260 ( .A0(n36), .A1(n236), .B0(n720), .B1(n35), .C0(n1), .C1(n633), 
        .Y(n1113) );
  OAI222XL U261 ( .A0(n11), .A1(n231), .B0(n612), .B1(n37), .C0(n1), .C1(n727), 
        .Y(n1139) );
  OAI222XL U262 ( .A0(n11), .A1(n235), .B0(n594), .B1(n37), .C0(n1), .C1(n697), 
        .Y(n1131) );
  OAI222XL U263 ( .A0(n36), .A1(n233), .B0(n762), .B1(n35), .C0(n1), .C1(n658), 
        .Y(n1119) );
  OAI222XL U264 ( .A0(n36), .A1(n231), .B0(n760), .B1(n35), .C0(n1), .C1(n660), 
        .Y(n1123) );
  OAI222XL U265 ( .A0(n36), .A1(n240), .B0(n721), .B1(n35), .C0(n1), .C1(n631), 
        .Y(n1111) );
  OAI222XL U266 ( .A0(n36), .A1(n235), .B0(n719), .B1(n35), .C0(n1), .C1(n634), 
        .Y(n1115) );
  OAI222XL U267 ( .A0(n36), .A1(n234), .B0(n649), .B1(n35), .C0(n1), .C1(n734), 
        .Y(n1117) );
  OAI222XL U268 ( .A0(n12), .A1(n235), .B0(n706), .B1(n46), .C0(n1), .C1(n591), 
        .Y(n1147) );
  OAI222XL U269 ( .A0(n11), .A1(n232), .B0(n611), .B1(n37), .C0(n1), .C1(n726), 
        .Y(n1137) );
  OAI222XL U270 ( .A0(n11), .A1(n236), .B0(n637), .B1(n37), .C0(n1), .C1(n696), 
        .Y(n1129) );
  OAI222XL U271 ( .A0(n42), .A1(n233), .B0(n678), .B1(n41), .C0(n1), .C1(n730), 
        .Y(n1199) );
  OAI222XL U272 ( .A0(n42), .A1(n235), .B0(n645), .B1(n41), .C0(n1), .C1(n699), 
        .Y(n1195) );
  OAI222XL U273 ( .A0(n42), .A1(n236), .B0(n579), .B1(n41), .C0(n1), .C1(n589), 
        .Y(n1193) );
  OAI222XL U274 ( .A0(n40), .A1(n231), .B0(n582), .B1(n39), .C0(n1), .C1(n600), 
        .Y(n1187) );
  OAI222XL U275 ( .A0(n42), .A1(n234), .B0(n646), .B1(n41), .C0(n1), .C1(n700), 
        .Y(n1197) );
  OAI222XL U276 ( .A0(n42), .A1(n232), .B0(n679), .B1(n41), .C0(n1), .C1(n731), 
        .Y(n1201) );
  OAI222XL U277 ( .A0(n40), .A1(n232), .B0(n581), .B1(n39), .C0(n1), .C1(n599), 
        .Y(n1185) );
  OAI222XL U278 ( .A0(n42), .A1(n240), .B0(n650), .B1(n41), .C0(n1), .C1(n588), 
        .Y(n1191) );
  OAI222XL U279 ( .A0(n40), .A1(n233), .B0(n580), .B1(n39), .C0(n1), .C1(n598), 
        .Y(n1183) );
  OAI222XL U280 ( .A0(n42), .A1(n231), .B0(n680), .B1(n41), .C0(n1), .C1(n732), 
        .Y(n1203) );
  OAI222XL U281 ( .A0(n236), .A1(n44), .B0(n708), .B1(n43), .C0(n1), .C1(n629), 
        .Y(n1209) );
  OAI222XL U282 ( .A0(n240), .A1(n44), .B0(n712), .B1(n43), .C0(n1), .C1(n628), 
        .Y(n1207) );
  OAI222XL U283 ( .A0(n609), .A1(n1), .B0(n749), .B1(n46), .C0(n230), .C1(n12), 
        .Y(n1157) );
  OAI222XL U284 ( .A0(n687), .A1(n5), .B0(n775), .B1(n239), .C0(n230), .C1(
        n241), .Y(n1109) );
  NOR2XL U285 ( .A(n49), .B(n688), .Y(n50) );
  OR2X2 U286 ( .A(n53), .B(n202), .Y(n229) );
  AOI211X2 U287 ( .A0(n61), .A1(n540), .B0(n60), .C0(n229), .Y(n56) );
  OAI222XL U288 ( .A0(n676), .A1(n177), .B0(n728), .B1(n56), .C0(n230), .C1(
        n57), .Y(n1142) );
  AOI211X2 U289 ( .A0(n61), .A1(n547), .B0(n60), .C0(n229), .Y(n173) );
  OAI222XL U290 ( .A0(n677), .A1(n177), .B0(n609), .B1(n173), .C0(n230), .C1(
        n174), .Y(n1158) );
  AOI211X2 U291 ( .A0(n61), .A1(n29), .B0(n60), .C0(n229), .Y(n55) );
  OAI222XL U292 ( .A0(n736), .A1(n5), .B0(n657), .B1(n55), .C0(n234), .C1(n54), 
        .Y(n1214) );
  OAI222XL U293 ( .A0(n735), .A1(n5), .B0(n590), .B1(n55), .C0(n235), .C1(n54), 
        .Y(n1212) );
  OAI222XL U294 ( .A0(n737), .A1(n5), .B0(n603), .B1(n55), .C0(n233), .C1(n54), 
        .Y(n1216) );
  OAI222XL U295 ( .A0(n738), .A1(n5), .B0(n604), .B1(n55), .C0(n232), .C1(n54), 
        .Y(n1218) );
  OAI222XL U296 ( .A0(n739), .A1(n1), .B0(n605), .B1(n55), .C0(n231), .C1(n54), 
        .Y(n1220) );
  AOI211X2 U297 ( .A0(n61), .A1(n30), .B0(n60), .C0(n229), .Y(n178) );
  OAI222XL U298 ( .A0(n745), .A1(n1), .B0(n601), .B1(n178), .C0(n230), .C1(
        n179), .Y(n1190) );
  AOI211X2 U299 ( .A0(n61), .A1(n546), .B0(n60), .C0(n229), .Y(n58) );
  OAI222XL U300 ( .A0(n753), .A1(n1), .B0(n656), .B1(n58), .C0(n230), .C1(n59), 
        .Y(n1174) );
  OAI222XL U301 ( .A0(n240), .A1(n54), .B0(n628), .B1(n55), .C0(n711), .C1(n1), 
        .Y(n1208) );
  OAI222XL U302 ( .A0(n236), .A1(n54), .B0(n629), .B1(n55), .C0(n754), .C1(n5), 
        .Y(n1210) );
  OAI222XL U303 ( .A0(n740), .A1(n1), .B0(n602), .B1(n55), .C0(n54), .C1(n230), 
        .Y(n1222) );
  OAI222XL U304 ( .A0(n174), .A1(n234), .B0(n733), .B1(n173), .C0(n5), .C1(
        n643), .Y(n1150) );
  AOI211X2 U305 ( .A0(n61), .A1(n498), .B0(n60), .C0(n229), .Y(n175) );
  OAI222XL U306 ( .A0(n176), .A1(n240), .B0(n631), .B1(n175), .C0(n1), .C1(
        n717), .Y(n1112) );
  OAI222XL U307 ( .A0(n174), .A1(n235), .B0(n591), .B1(n173), .C0(n177), .C1(
        n641), .Y(n1148) );
  OAI222XL U308 ( .A0(n174), .A1(n240), .B0(n701), .B1(n173), .C0(n623), .C1(
        n5), .Y(n1144) );
  OAI222XL U309 ( .A0(n57), .A1(n236), .B0(n696), .B1(n56), .C0(n636), .C1(n1), 
        .Y(n1130) );
  OAI222XL U310 ( .A0(n176), .A1(n234), .B0(n734), .B1(n175), .C0(n1), .C1(
        n648), .Y(n1118) );
  OAI222XL U311 ( .A0(n57), .A1(n233), .B0(n725), .B1(n56), .C0(n177), .C1(
        n667), .Y(n1136) );
  OAI222XL U312 ( .A0(n57), .A1(n232), .B0(n726), .B1(n56), .C0(n177), .C1(
        n670), .Y(n1138) );
  OAI222XL U313 ( .A0(n174), .A1(n236), .B0(n632), .B1(n173), .C0(n705), .C1(
        n1), .Y(n1146) );
  OAI222XL U314 ( .A0(n174), .A1(n232), .B0(n607), .B1(n173), .C0(n1), .C1(
        n671), .Y(n1154) );
  OAI222XL U315 ( .A0(n176), .A1(n233), .B0(n658), .B1(n175), .C0(n1), .C1(
        n757), .Y(n1120) );
  OAI222XL U316 ( .A0(n57), .A1(n240), .B0(n695), .B1(n56), .C0(n621), .C1(n1), 
        .Y(n1128) );
  OAI222XL U317 ( .A0(n57), .A1(n231), .B0(n727), .B1(n56), .C0(n177), .C1(
        n673), .Y(n1140) );
  OAI222XL U318 ( .A0(n174), .A1(n231), .B0(n608), .B1(n173), .C0(n177), .C1(
        n674), .Y(n1156) );
  OAI222XL U319 ( .A0(n176), .A1(n235), .B0(n634), .B1(n175), .C0(n5), .C1(
        n715), .Y(n1116) );
  OAI222XL U320 ( .A0(n57), .A1(n235), .B0(n697), .B1(n56), .C0(n177), .C1(
        n640), .Y(n1132) );
  OAI222XL U321 ( .A0(n176), .A1(n236), .B0(n633), .B1(n175), .C0(n5), .C1(
        n716), .Y(n1114) );
  OAI222XL U322 ( .A0(n57), .A1(n234), .B0(n577), .B1(n56), .C0(n177), .C1(
        n704), .Y(n1134) );
  OAI222XL U323 ( .A0(n179), .A1(n236), .B0(n576), .B1(n178), .C0(n592), .C1(
        n177), .Y(n1178) );
  OAI222XL U324 ( .A0(n179), .A1(n232), .B0(n599), .B1(n178), .C0(n1), .C1(
        n743), .Y(n1186) );
  OAI222XL U325 ( .A0(n179), .A1(n233), .B0(n598), .B1(n178), .C0(n5), .C1(
        n742), .Y(n1184) );
  OAI222XL U326 ( .A0(n179), .A1(n234), .B0(n587), .B1(n178), .C0(n177), .C1(
        n642), .Y(n1182) );
  OAI222XL U327 ( .A0(n179), .A1(n235), .B0(n586), .B1(n178), .C0(n177), .C1(
        n703), .Y(n1180) );
  OAI222XL U328 ( .A0(n179), .A1(n240), .B0(n575), .B1(n178), .C0(n584), .C1(
        n5), .Y(n1176) );
  OAI222XL U329 ( .A0(n59), .A1(n236), .B0(n698), .B1(n58), .C0(n630), .C1(n1), 
        .Y(n1162) );
  OAI222XL U330 ( .A0(n59), .A1(n240), .B0(n625), .B1(n58), .C0(n693), .C1(n5), 
        .Y(n1160) );
  OAI222XL U331 ( .A0(n59), .A1(n234), .B0(n627), .B1(n58), .C0(n1), .C1(n710), 
        .Y(n1166) );
  OAI222XL U332 ( .A0(n59), .A1(n235), .B0(n626), .B1(n58), .C0(n177), .C1(
        n709), .Y(n1164) );
  OAI222XL U333 ( .A0(n59), .A1(n233), .B0(n653), .B1(n58), .C0(n1), .C1(n750), 
        .Y(n1168) );
  OAI222XL U334 ( .A0(n59), .A1(n232), .B0(n654), .B1(n58), .C0(n177), .C1(
        n751), .Y(n1170) );
  OAI222XL U335 ( .A0(n59), .A1(n231), .B0(n655), .B1(n58), .C0(n5), .C1(n752), 
        .Y(n1172) );
  AOI211X2 U336 ( .A0(n61), .A1(n3), .B0(n60), .C0(n229), .Y(n63) );
  OAI222XL U337 ( .A0(n675), .A1(n1), .B0(n729), .B1(n63), .C0(n230), .C1(n64), 
        .Y(n1206) );
  OAI222XL U338 ( .A0(n64), .A1(n240), .B0(n588), .B1(n63), .C0(n714), .C1(n1), 
        .Y(n1192) );
  OAI222XL U339 ( .A0(n64), .A1(n235), .B0(n699), .B1(n63), .C0(n177), .C1(
        n639), .Y(n1196) );
  OAI222XL U340 ( .A0(n64), .A1(n231), .B0(n732), .B1(n63), .C0(n5), .C1(n672), 
        .Y(n1204) );
  OAI222XL U341 ( .A0(n64), .A1(n234), .B0(n700), .B1(n63), .C0(n177), .C1(
        n596), .Y(n1198) );
  OAI222XL U342 ( .A0(n64), .A1(n236), .B0(n589), .B1(n63), .C0(n713), .C1(n5), 
        .Y(n1194) );
  OAI222XL U343 ( .A0(n64), .A1(n233), .B0(n730), .B1(n63), .C0(n177), .C1(
        n666), .Y(n1200) );
  OAI222XL U344 ( .A0(n64), .A1(n232), .B0(n731), .B1(n63), .C0(n177), .C1(
        n669), .Y(n1202) );
  BUFX2 U345 ( .A(n66), .Y(n133) );
  NAND2X1 U346 ( .A(logic_state_r[0]), .B(logic_state_r[2]), .Y(n561) );
  NAND3X1 U347 ( .A(n635), .B(n722), .C(n16), .Y(n560) );
  INVXL U348 ( .A(n68), .Y(n70) );
  NAND3XL U349 ( .A(logic_state_r[2]), .B(logic_state_r[1]), .C(n635), .Y(n250) );
  NOR2XL U350 ( .A(logic_state_r[1]), .B(n561), .Y(n76) );
  BUFX2 U351 ( .A(n76), .Y(n563) );
  NAND2XL U352 ( .A(n563), .B(G_data_r[2]), .Y(n77) );
  OAI211XL U353 ( .A0(n772), .A1(n133), .B0(n78), .C0(n77), .Y(n1018) );
  AOI211XL U354 ( .A0(RGB_data[0]), .A1(n67), .B0(n80), .C0(n79), .Y(n82) );
  NAND2XL U355 ( .A(n563), .B(G_data_r[0]), .Y(n81) );
  AOI211XL U356 ( .A0(RGB_data[3]), .A1(n67), .B0(n84), .C0(n83), .Y(n86) );
  NAND2XL U357 ( .A(n563), .B(G_data_r[3]), .Y(n85) );
  OAI211XL U358 ( .A0(n771), .A1(n133), .B0(n86), .C0(n85), .Y(n1019) );
  AOI211XL U359 ( .A0(RGB_data[1]), .A1(n67), .B0(n88), .C0(n87), .Y(n90) );
  NAND2XL U360 ( .A(n563), .B(G_data_r[1]), .Y(n89) );
  OAI211XL U361 ( .A0(n773), .A1(n133), .B0(n90), .C0(n89), .Y(n1017) );
  AOI211XL U362 ( .A0(RGB_data[4]), .A1(n67), .B0(n92), .C0(n91), .Y(n94) );
  NAND2XL U363 ( .A(n563), .B(G_data_r[4]), .Y(n93) );
  OAI211XL U364 ( .A0(n770), .A1(n133), .B0(n94), .C0(n93), .Y(n1020) );
  AOI211XL U365 ( .A0(RGB_data[5]), .A1(n67), .B0(n96), .C0(n95), .Y(n98) );
  NAND2XL U366 ( .A(n563), .B(G_data_r[5]), .Y(n97) );
  OAI211XL U367 ( .A0(n769), .A1(n133), .B0(n98), .C0(n97), .Y(n1021) );
  NAND2BX4 U368 ( .AN(n247), .B(n561), .Y(n193) );
  AOI222XL U369 ( .A0(n193), .A1(G_data_r[7]), .B0(cen_r[7]), .B1(n68), .C0(
        n100), .C1(\intadd_8/n1 ), .Y(n101) );
  INVXL U370 ( .A(n101), .Y(n1042) );
  AOI222XL U371 ( .A0(n100), .A1(\intadd_8/SUM[6] ), .B0(cen_r[6]), .B1(n68), 
        .C0(n193), .C1(G_data_r[6]), .Y(n102) );
  INVXL U372 ( .A(n102), .Y(n1041) );
  AOI222XL U373 ( .A0(n100), .A1(\intadd_8/SUM[3] ), .B0(cen_r[3]), .B1(n68), 
        .C0(n193), .C1(G_data_r[3]), .Y(n103) );
  INVXL U374 ( .A(n103), .Y(n1038) );
  AOI222XL U375 ( .A0(n100), .A1(\intadd_8/SUM[4] ), .B0(cen_r[4]), .B1(n68), 
        .C0(n193), .C1(G_data_r[4]), .Y(n104) );
  INVXL U376 ( .A(n104), .Y(n1039) );
  AOI222XL U377 ( .A0(n100), .A1(\intadd_8/SUM[2] ), .B0(cen_r[2]), .B1(n68), 
        .C0(n193), .C1(G_data_r[2]), .Y(n105) );
  INVXL U378 ( .A(n105), .Y(n1037) );
  AOI222XL U379 ( .A0(n100), .A1(\intadd_8/SUM[5] ), .B0(cen_r[5]), .B1(n68), 
        .C0(n193), .C1(G_data_r[5]), .Y(n106) );
  INVXL U380 ( .A(n106), .Y(n1040) );
  AOI222XL U381 ( .A0(n100), .A1(\intadd_8/SUM[1] ), .B0(cen_r[1]), .B1(n68), 
        .C0(n193), .C1(G_data_r[1]), .Y(n107) );
  INVXL U382 ( .A(n107), .Y(n1036) );
  AOI222XL U383 ( .A0(n100), .A1(\intadd_8/SUM[0] ), .B0(cen_r[0]), .B1(n68), 
        .C0(n193), .C1(G_data_r[0]), .Y(n108) );
  INVXL U384 ( .A(n108), .Y(n1035) );
  AOI22XL U385 ( .A0(hor_sum_r[7]), .A1(n69), .B0(B_data_r[6]), .B1(n193), .Y(
        n109) );
  OAI211XL U386 ( .A0(n768), .A1(n99), .B0(n110), .C0(n109), .Y(n1033) );
  AOI22XL U387 ( .A0(n65), .A1(\intadd_7/SUM[4] ), .B0(ver_sum_r[5]), .B1(n71), 
        .Y(n112) );
  AOI22XL U388 ( .A0(hor_sum_r[5]), .A1(n69), .B0(B_data_r[4]), .B1(n193), .Y(
        n111) );
  OAI211XL U389 ( .A0(n770), .A1(n99), .B0(n112), .C0(n111), .Y(n1031) );
  AOI22XL U390 ( .A0(n65), .A1(\intadd_7/SUM[5] ), .B0(ver_sum_r[6]), .B1(n71), 
        .Y(n114) );
  AOI22XL U391 ( .A0(hor_sum_r[6]), .A1(n69), .B0(B_data_r[5]), .B1(n193), .Y(
        n113) );
  OAI211XL U392 ( .A0(n769), .A1(n99), .B0(n114), .C0(n113), .Y(n1032) );
  AOI22XL U393 ( .A0(n65), .A1(\intadd_7/SUM[0] ), .B0(ver_sum_r[1]), .B1(n71), 
        .Y(n116) );
  AOI22XL U394 ( .A0(hor_sum_r[1]), .A1(n69), .B0(B_data_r[0]), .B1(n193), .Y(
        n115) );
  OAI211XL U395 ( .A0(n774), .A1(n99), .B0(n116), .C0(n115), .Y(n1027) );
  AOI22XL U396 ( .A0(n65), .A1(\intadd_7/SUM[2] ), .B0(ver_sum_r[3]), .B1(n71), 
        .Y(n118) );
  AOI22XL U397 ( .A0(hor_sum_r[3]), .A1(n69), .B0(B_data_r[2]), .B1(n193), .Y(
        n117) );
  OAI211XL U398 ( .A0(n772), .A1(n99), .B0(n118), .C0(n117), .Y(n1029) );
  AOI22XL U399 ( .A0(n65), .A1(\intadd_7/n1 ), .B0(ver_sum_r[8]), .B1(n71), 
        .Y(n120) );
  AOI22XL U400 ( .A0(hor_sum_r[8]), .A1(n69), .B0(B_data_r[7]), .B1(n193), .Y(
        n119) );
  OAI211XL U401 ( .A0(n767), .A1(n99), .B0(n120), .C0(n119), .Y(n1034) );
  AOI22XL U402 ( .A0(n65), .A1(\intadd_7/SUM[1] ), .B0(ver_sum_r[2]), .B1(n71), 
        .Y(n122) );
  AOI22XL U403 ( .A0(hor_sum_r[2]), .A1(n69), .B0(B_data_r[1]), .B1(n193), .Y(
        n121) );
  OAI211XL U404 ( .A0(n773), .A1(n99), .B0(n122), .C0(n121), .Y(n1028) );
  AOI22XL U405 ( .A0(n65), .A1(\intadd_7/SUM[3] ), .B0(ver_sum_r[4]), .B1(n71), 
        .Y(n124) );
  AOI22XL U406 ( .A0(hor_sum_r[4]), .A1(n69), .B0(B_data_r[3]), .B1(n193), .Y(
        n123) );
  AOI211XL U407 ( .A0(RGB_data[6]), .A1(n67), .B0(n126), .C0(n125), .Y(n128)
         );
  NAND2XL U408 ( .A(n563), .B(G_data_r[6]), .Y(n127) );
  OAI211XL U409 ( .A0(n768), .A1(n133), .B0(n128), .C0(n127), .Y(n1022) );
  AOI211XL U410 ( .A0(RGB_data[7]), .A1(n67), .B0(n130), .C0(n129), .Y(n132)
         );
  NAND2XL U411 ( .A(n563), .B(G_data_r[7]), .Y(n131) );
  OAI211XL U412 ( .A0(n767), .A1(n133), .B0(n132), .C0(n131), .Y(n1023) );
  OAI22XL U413 ( .A0(n6), .A1(n639), .B0(n540), .B1(n709), .Y(n137) );
  OAI22XL U414 ( .A0(n17), .A1(n640), .B0(n547), .B1(n703), .Y(n136) );
  OAI22XL U415 ( .A0(n30), .A1(n735), .B0(n498), .B1(n641), .Y(n135) );
  NOR3XL U416 ( .A(n137), .B(n136), .C(n135), .Y(\intadd_9/CI ) );
  OAI22XL U417 ( .A0(n6), .A1(n645), .B0(n540), .B1(n597), .Y(n140) );
  OAI22XL U418 ( .A0(n17), .A1(n594), .B0(n547), .B1(n578), .Y(n139) );
  OAI22XL U419 ( .A0(n30), .A1(n638), .B0(n2), .B1(n706), .Y(n138) );
  NOR3XL U420 ( .A(n140), .B(n139), .C(n138), .Y(\intadd_9/B[0] ) );
  OAI22XL U421 ( .A0(n6), .A1(n596), .B0(n540), .B1(n710), .Y(n143) );
  OAI22XL U422 ( .A0(n17), .A1(n704), .B0(n547), .B1(n642), .Y(n142) );
  OAI22XL U423 ( .A0(n30), .A1(n736), .B0(n498), .B1(n643), .Y(n141) );
  OAI22XL U424 ( .A0(n6), .A1(n646), .B0(n540), .B1(n707), .Y(n146) );
  OAI22XL U425 ( .A0(n17), .A1(n595), .B0(n547), .B1(n702), .Y(n145) );
  OAI22XL U426 ( .A0(n30), .A1(n741), .B0(n498), .B1(n647), .Y(n144) );
  OAI22XL U427 ( .A0(n546), .A1(n666), .B0(n540), .B1(n750), .Y(n149) );
  OAI22XL U428 ( .A0(n17), .A1(n667), .B0(n547), .B1(n742), .Y(n148) );
  OAI22XL U429 ( .A0(n30), .A1(n737), .B0(n498), .B1(n668), .Y(n147) );
  OAI22XL U430 ( .A0(n546), .A1(n678), .B0(n540), .B1(n614), .Y(n152) );
  OAI22XL U431 ( .A0(n17), .A1(n610), .B0(n547), .B1(n580), .Y(n151) );
  OAI22XL U432 ( .A0(n30), .A1(n662), .B0(n498), .B1(n746), .Y(n150) );
  OAI22XL U433 ( .A0(n546), .A1(n669), .B0(n540), .B1(n751), .Y(n155) );
  OAI22XL U434 ( .A0(n17), .A1(n670), .B0(n547), .B1(n743), .Y(n154) );
  OAI22XL U435 ( .A0(n30), .A1(n738), .B0(n498), .B1(n671), .Y(n153) );
  OAI22XL U436 ( .A0(n546), .A1(n679), .B0(n540), .B1(n615), .Y(n158) );
  OAI22XL U437 ( .A0(n17), .A1(n611), .B0(n547), .B1(n581), .Y(n157) );
  OAI22XL U438 ( .A0(n30), .A1(n663), .B0(n498), .B1(n747), .Y(n156) );
  OAI22XL U439 ( .A0(n546), .A1(n672), .B0(n540), .B1(n752), .Y(n161) );
  OAI22XL U440 ( .A0(n17), .A1(n673), .B0(n547), .B1(n744), .Y(n160) );
  OAI22XL U441 ( .A0(n30), .A1(n739), .B0(n498), .B1(n674), .Y(n159) );
  OAI22XL U442 ( .A0(n546), .A1(n680), .B0(n540), .B1(n616), .Y(n164) );
  OAI22XL U443 ( .A0(n17), .A1(n612), .B0(n547), .B1(n582), .Y(n163) );
  OAI22XL U444 ( .A0(n30), .A1(n664), .B0(n498), .B1(n748), .Y(n162) );
  NOR3XL U445 ( .A(n164), .B(n163), .C(n162), .Y(\intadd_9/A[4] ) );
  OAI22XL U446 ( .A0(n546), .A1(n675), .B0(n540), .B1(n753), .Y(n167) );
  OAI22XL U447 ( .A0(n17), .A1(n676), .B0(n547), .B1(n745), .Y(n166) );
  OAI22XL U448 ( .A0(n30), .A1(n740), .B0(n498), .B1(n677), .Y(n165) );
  NOR3XL U449 ( .A(n167), .B(n166), .C(n165), .Y(\intadd_9/B[5] ) );
  OAI22XL U450 ( .A0(n546), .A1(n681), .B0(n540), .B1(n617), .Y(n170) );
  OAI22XL U451 ( .A0(n17), .A1(n613), .B0(n547), .B1(n583), .Y(n169) );
  OAI22XL U452 ( .A0(n30), .A1(n665), .B0(n498), .B1(n749), .Y(n168) );
  NOR3XL U453 ( .A(n170), .B(n169), .C(n168), .Y(\intadd_9/A[5] ) );
  OAI2BB1X1 U454 ( .A0N(n560), .A1N(RGB_valid), .B0(n67), .Y(RGB_valid_w) );
  OAI211XL U455 ( .A0(ver_sum_r[1]), .A1(hor_sum_r[1]), .B0(ver_sum_r[0]), 
        .C0(hor_sum_r[0]), .Y(n171) );
  OAI2BB1X1 U456 ( .A0N(hor_sum_r[1]), .A1N(ver_sum_r[1]), .B0(n171), .Y(
        \intadd_8/CI ) );
  OAI211XL U457 ( .A0(up_sum_r[1]), .A1(down_sum_r[1]), .B0(up_sum_r[0]), .C0(
        down_sum_r[0]), .Y(n172) );
  OAI2BB1X1 U458 ( .A0N(down_sum_r[1]), .A1N(up_sum_r[1]), .B0(n172), .Y(
        \intadd_7/CI ) );
  OAI222XL U459 ( .A0(n758), .A1(n177), .B0(n661), .B1(n175), .C0(n230), .C1(
        n176), .Y(n1126) );
  OAI222XL U460 ( .A0(n176), .A1(n231), .B0(n660), .B1(n175), .C0(n177), .C1(
        n755), .Y(n1124) );
  OAI222XL U461 ( .A0(n174), .A1(n233), .B0(n606), .B1(n173), .C0(n177), .C1(
        n668), .Y(n1152) );
  OAI222XL U462 ( .A0(n176), .A1(n232), .B0(n659), .B1(n175), .C0(n177), .C1(
        n756), .Y(n1122) );
  OAI222XL U463 ( .A0(n179), .A1(n231), .B0(n600), .B1(n178), .C0(n177), .C1(
        n744), .Y(n1188) );
  BUFX4 U464 ( .A(rst_n), .Y(n777) );
  NAND2XL U465 ( .A(state_r[0]), .B(n17), .Y(n565) );
  NAND4XL U466 ( .A(n566), .B(n691), .C(n620), .D(n565), .Y(n180) );
  OAI31XL U467 ( .A0(n181), .A1(n564), .A2(n3), .B0(n180), .Y(n184) );
  OAI211XL U468 ( .A0(n185), .A1(n31), .B0(n182), .C0(n692), .Y(n183) );
  OAI22XL U469 ( .A0(n185), .A1(n31), .B0(n564), .B1(n198), .Y(n187) );
  OAI21XL U470 ( .A0(n690), .A1(n187), .B0(n186), .Y(n191) );
  NOR2XL U471 ( .A(state_r[0]), .B(state_r[1]), .Y(n189) );
  OAI21XL U472 ( .A0(n189), .A1(n188), .B0(valid_r), .Y(n190) );
  OAI21XL U473 ( .A0(n194), .A1(n192), .B0(n247), .Y(n1284) );
  INVX1 U474 ( .A(n193), .Y(n558) );
  OAI31XL U475 ( .A0(state_r[1]), .A1(n194), .A2(n558), .B0(n561), .Y(n1283)
         );
  OAI221XL U476 ( .A0(state_r[1]), .A1(n195), .B0(n691), .B1(n571), .C0(
        state_r[0]), .Y(n197) );
  AOI21XL U477 ( .A0(logic_state_r[0]), .A1(logic_state_r[1]), .B0(n558), .Y(
        n196) );
  OAI31XL U478 ( .A0(n563), .A1(n197), .A2(n688), .B0(n196), .Y(n1282) );
  OAI32XL U479 ( .A0(n618), .A1(n198), .A2(n691), .B0(state_r[1]), .B1(
        state_r[0]), .Y(n199) );
  OAI21XL U480 ( .A0(n566), .A1(n199), .B0(n210), .Y(n201) );
  NOR2XL U481 ( .A(n688), .B(n202), .Y(n208) );
  OAI22XL U482 ( .A0(counter_r[0]), .A1(n204), .B0(n689), .B1(n208), .Y(n1281)
         );
  OAI22XL U483 ( .A0(n203), .A1(n204), .B0(n574), .B1(n208), .Y(n1280) );
  INVXL U484 ( .A(n204), .Y(n206) );
  OAI211XL U485 ( .A0(counter_r[0]), .A1(counter_r[1]), .B0(n206), .C0(n205), 
        .Y(n207) );
  OAI21XL U486 ( .A0(n208), .A1(n619), .B0(n207), .Y(n1279) );
  OAI22XL U487 ( .A0(n213), .A1(n740), .B0(n230), .B1(n212), .Y(n1278) );
  OAI22XL U488 ( .A0(n213), .A1(n739), .B0(n231), .B1(n212), .Y(n1277) );
  OAI22XL U489 ( .A0(n213), .A1(n738), .B0(n232), .B1(n212), .Y(n1276) );
  OAI22XL U490 ( .A0(n213), .A1(n737), .B0(n233), .B1(n212), .Y(n1275) );
  OAI22XL U491 ( .A0(n213), .A1(n736), .B0(n234), .B1(n212), .Y(n1274) );
  OAI22XL U492 ( .A0(n213), .A1(n735), .B0(n235), .B1(n212), .Y(n1273) );
  OAI22XL U493 ( .A0(n213), .A1(n754), .B0(n236), .B1(n212), .Y(n1272) );
  OAI22XL U494 ( .A0(n213), .A1(n711), .B0(n240), .B1(n212), .Y(n1271) );
  OAI22XL U495 ( .A0(n215), .A1(n675), .B0(n230), .B1(n214), .Y(n1270) );
  OAI22XL U496 ( .A0(n215), .A1(n672), .B0(n231), .B1(n214), .Y(n1269) );
  OAI22XL U497 ( .A0(n215), .A1(n669), .B0(n232), .B1(n214), .Y(n1268) );
  OAI22XL U498 ( .A0(n215), .A1(n666), .B0(n233), .B1(n214), .Y(n1267) );
  OAI22XL U499 ( .A0(n215), .A1(n596), .B0(n234), .B1(n214), .Y(n1266) );
  OAI22XL U500 ( .A0(n215), .A1(n639), .B0(n235), .B1(n214), .Y(n1265) );
  OAI22XL U501 ( .A0(n215), .A1(n713), .B0(n236), .B1(n214), .Y(n1264) );
  OAI22XL U502 ( .A0(n215), .A1(n714), .B0(n240), .B1(n214), .Y(n1263) );
  OAI22XL U503 ( .A0(n217), .A1(n745), .B0(n230), .B1(n216), .Y(n1262) );
  OAI22XL U504 ( .A0(n217), .A1(n744), .B0(n231), .B1(n216), .Y(n1261) );
  OAI22XL U505 ( .A0(n217), .A1(n743), .B0(n232), .B1(n216), .Y(n1260) );
  OAI22XL U506 ( .A0(n217), .A1(n742), .B0(n233), .B1(n216), .Y(n1259) );
  OAI22XL U507 ( .A0(n217), .A1(n642), .B0(n234), .B1(n216), .Y(n1258) );
  OAI22XL U508 ( .A0(n217), .A1(n703), .B0(n235), .B1(n216), .Y(n1257) );
  OAI22XL U509 ( .A0(n217), .A1(n592), .B0(n236), .B1(n216), .Y(n1256) );
  OAI22XL U510 ( .A0(n217), .A1(n584), .B0(n240), .B1(n216), .Y(n1255) );
  OAI22XL U511 ( .A0(n219), .A1(n753), .B0(n230), .B1(n218), .Y(n1254) );
  OAI22XL U512 ( .A0(n219), .A1(n752), .B0(n231), .B1(n218), .Y(n1253) );
  OAI22XL U513 ( .A0(n219), .A1(n751), .B0(n232), .B1(n218), .Y(n1252) );
  OAI22XL U514 ( .A0(n219), .A1(n750), .B0(n233), .B1(n218), .Y(n1251) );
  OAI22XL U515 ( .A0(n219), .A1(n710), .B0(n234), .B1(n218), .Y(n1250) );
  OAI22XL U516 ( .A0(n219), .A1(n709), .B0(n235), .B1(n218), .Y(n1249) );
  OAI22XL U517 ( .A0(n219), .A1(n630), .B0(n236), .B1(n218), .Y(n1248) );
  OAI22XL U518 ( .A0(n219), .A1(n693), .B0(n240), .B1(n218), .Y(n1247) );
  OAI22XL U519 ( .A0(n222), .A1(n677), .B0(n230), .B1(n221), .Y(n1246) );
  OAI22XL U520 ( .A0(n222), .A1(n674), .B0(n231), .B1(n221), .Y(n1245) );
  OAI22XL U521 ( .A0(n222), .A1(n671), .B0(n232), .B1(n221), .Y(n1244) );
  OAI22XL U522 ( .A0(n222), .A1(n668), .B0(n233), .B1(n221), .Y(n1243) );
  OAI22XL U523 ( .A0(n222), .A1(n643), .B0(n234), .B1(n221), .Y(n1242) );
  OAI22XL U524 ( .A0(n222), .A1(n641), .B0(n235), .B1(n221), .Y(n1241) );
  OAI22XL U525 ( .A0(n222), .A1(n705), .B0(n236), .B1(n221), .Y(n1240) );
  OAI22XL U526 ( .A0(n222), .A1(n623), .B0(n240), .B1(n221), .Y(n1239) );
  OAI22XL U527 ( .A0(n225), .A1(n676), .B0(n230), .B1(n224), .Y(n1238) );
  OAI22XL U528 ( .A0(n225), .A1(n673), .B0(n231), .B1(n224), .Y(n1237) );
  OAI22XL U529 ( .A0(n225), .A1(n670), .B0(n232), .B1(n224), .Y(n1236) );
  OAI22XL U530 ( .A0(n225), .A1(n667), .B0(n233), .B1(n224), .Y(n1235) );
  OAI22XL U531 ( .A0(n225), .A1(n704), .B0(n234), .B1(n224), .Y(n1234) );
  OAI22XL U532 ( .A0(n225), .A1(n640), .B0(n235), .B1(n224), .Y(n1233) );
  OAI22XL U533 ( .A0(n225), .A1(n636), .B0(n236), .B1(n224), .Y(n1232) );
  OAI22XL U534 ( .A0(n225), .A1(n621), .B0(n240), .B1(n224), .Y(n1231) );
  OAI22XL U535 ( .A0(n228), .A1(n758), .B0(n230), .B1(n227), .Y(n1230) );
  OAI22XL U536 ( .A0(n228), .A1(n755), .B0(n231), .B1(n227), .Y(n1229) );
  OAI22XL U537 ( .A0(n228), .A1(n756), .B0(n232), .B1(n227), .Y(n1228) );
  OAI22XL U538 ( .A0(n228), .A1(n757), .B0(n233), .B1(n227), .Y(n1227) );
  OAI22XL U539 ( .A0(n228), .A1(n648), .B0(n234), .B1(n227), .Y(n1226) );
  OAI22XL U540 ( .A0(n228), .A1(n715), .B0(n235), .B1(n227), .Y(n1225) );
  OAI22XL U541 ( .A0(n228), .A1(n716), .B0(n236), .B1(n227), .Y(n1224) );
  OAI22XL U542 ( .A0(n228), .A1(n717), .B0(n240), .B1(n227), .Y(n1223) );
  NOR2X2 U543 ( .A(n17), .B(n229), .Y(n237) );
  OAI22XL U544 ( .A0(n238), .A1(n230), .B0(n237), .B1(n687), .Y(n1110) );
  OAI22XL U545 ( .A0(n238), .A1(n231), .B0(n237), .B1(n682), .Y(n1108) );
  OAI222XL U546 ( .A0(n241), .A1(n231), .B0(n776), .B1(n239), .C0(n1), .C1(
        n682), .Y(n1107) );
  OAI22XL U547 ( .A0(n238), .A1(n232), .B0(n237), .B1(n683), .Y(n1106) );
  OAI222XL U548 ( .A0(n241), .A1(n232), .B0(n763), .B1(n239), .C0(n1), .C1(
        n683), .Y(n1105) );
  OAI22XL U549 ( .A0(n238), .A1(n233), .B0(n237), .B1(n684), .Y(n1104) );
  OAI222XL U550 ( .A0(n241), .A1(n233), .B0(n764), .B1(n239), .C0(n1), .C1(
        n684), .Y(n1103) );
  OAI22XL U551 ( .A0(n238), .A1(n234), .B0(n237), .B1(n685), .Y(n1102) );
  OAI222XL U552 ( .A0(n241), .A1(n234), .B0(n765), .B1(n239), .C0(n1), .C1(
        n685), .Y(n1101) );
  OAI22XL U553 ( .A0(n238), .A1(n235), .B0(n237), .B1(n686), .Y(n1100) );
  OAI222XL U554 ( .A0(n241), .A1(n235), .B0(n766), .B1(n239), .C0(n1), .C1(
        n686), .Y(n1099) );
  OAI22XL U555 ( .A0(n238), .A1(n236), .B0(n237), .B1(n651), .Y(n1098) );
  OAI222XL U556 ( .A0(n241), .A1(n236), .B0(n723), .B1(n239), .C0(n1), .C1(
        n651), .Y(n1097) );
  OAI22XL U557 ( .A0(n238), .A1(n240), .B0(n237), .B1(n652), .Y(n1096) );
  OAI222XL U558 ( .A0(n241), .A1(n240), .B0(n724), .B1(n239), .C0(n5), .C1(
        n652), .Y(n1095) );
  NOR4XL U559 ( .A(n68), .B(logic_state_r[0]), .C(n65), .D(n688), .Y(n242) );
  BUFX2 U560 ( .A(n242), .Y(n286) );
  OAI22XL U561 ( .A0(n540), .A1(n701), .B0(n547), .B1(n625), .Y(n245) );
  OAI22XL U562 ( .A0(n6), .A1(n575), .B0(n30), .B1(n588), .Y(n244) );
  OAI22XL U563 ( .A0(n17), .A1(n631), .B0(n2), .B1(n695), .Y(n243) );
  NOR4XL U564 ( .A(n246), .B(n245), .C(n244), .D(n243), .Y(n249) );
  OAI22XL U565 ( .A0(n286), .A1(n774), .B0(n249), .B1(n248), .Y(n1094) );
  NAND2XL U566 ( .A(n250), .B(n561), .Y(n557) );
  NOR2XL U567 ( .A(n629), .B(n3), .Y(n254) );
  OAI22XL U568 ( .A0(n540), .A1(n632), .B0(n547), .B1(n698), .Y(n253) );
  OAI22XL U569 ( .A0(n6), .A1(n576), .B0(n30), .B1(n589), .Y(n252) );
  OAI22XL U570 ( .A0(n17), .A1(n633), .B0(n2), .B1(n696), .Y(n251) );
  OAI22XL U571 ( .A0(n286), .A1(n773), .B0(n255), .B1(n248), .Y(n1091) );
  NOR2XL U572 ( .A(n590), .B(n3), .Y(n259) );
  OAI22XL U573 ( .A0(n540), .A1(n591), .B0(n547), .B1(n626), .Y(n258) );
  OAI22XL U574 ( .A0(n6), .A1(n586), .B0(n30), .B1(n699), .Y(n257) );
  OAI22XL U575 ( .A0(n17), .A1(n634), .B0(n2), .B1(n697), .Y(n256) );
  NOR4XL U576 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(n260) );
  OAI22XL U577 ( .A0(n286), .A1(n772), .B0(n260), .B1(n248), .Y(n1090) );
  NOR2XL U578 ( .A(n657), .B(n3), .Y(n264) );
  OAI22XL U579 ( .A0(n540), .A1(n733), .B0(n547), .B1(n627), .Y(n263) );
  OAI22XL U580 ( .A0(n6), .A1(n587), .B0(n30), .B1(n700), .Y(n262) );
  OAI22XL U581 ( .A0(n17), .A1(n734), .B0(n2), .B1(n577), .Y(n261) );
  NOR4XL U582 ( .A(n264), .B(n263), .C(n262), .D(n261), .Y(n265) );
  OAI22XL U583 ( .A0(n286), .A1(n771), .B0(n265), .B1(n248), .Y(n1089) );
  OAI22XL U584 ( .A0(n540), .A1(n606), .B0(n547), .B1(n653), .Y(n268) );
  OAI22XL U585 ( .A0(n6), .A1(n598), .B0(n30), .B1(n730), .Y(n267) );
  OAI22XL U586 ( .A0(n17), .A1(n658), .B0(n2), .B1(n725), .Y(n266) );
  NOR4XL U587 ( .A(n269), .B(n268), .C(n267), .D(n266), .Y(n270) );
  OAI22XL U588 ( .A0(n286), .A1(n770), .B0(n270), .B1(n248), .Y(n1088) );
  NOR2XL U589 ( .A(n604), .B(n3), .Y(n274) );
  OAI22XL U590 ( .A0(n540), .A1(n607), .B0(n547), .B1(n654), .Y(n273) );
  OAI22XL U591 ( .A0(n6), .A1(n599), .B0(n30), .B1(n731), .Y(n272) );
  OAI22XL U592 ( .A0(n17), .A1(n659), .B0(n2), .B1(n726), .Y(n271) );
  NOR4XL U593 ( .A(n274), .B(n273), .C(n272), .D(n271), .Y(n275) );
  OAI22XL U594 ( .A0(n286), .A1(n769), .B0(n275), .B1(n248), .Y(n1087) );
  NOR2XL U595 ( .A(n605), .B(n3), .Y(n279) );
  OAI22XL U596 ( .A0(n540), .A1(n608), .B0(n547), .B1(n655), .Y(n278) );
  OAI22XL U597 ( .A0(n6), .A1(n600), .B0(n30), .B1(n732), .Y(n277) );
  OAI22XL U598 ( .A0(n17), .A1(n660), .B0(n2), .B1(n727), .Y(n276) );
  NOR4XL U599 ( .A(n279), .B(n278), .C(n277), .D(n276), .Y(n280) );
  OAI22XL U600 ( .A0(n286), .A1(n768), .B0(n280), .B1(n248), .Y(n1086) );
  OAI22XL U601 ( .A0(n540), .A1(n609), .B0(n547), .B1(n656), .Y(n283) );
  OAI22XL U602 ( .A0(n6), .A1(n601), .B0(n30), .B1(n729), .Y(n282) );
  OAI22XL U603 ( .A0(n17), .A1(n661), .B0(n2), .B1(n728), .Y(n281) );
  NOR4XL U604 ( .A(n284), .B(n283), .C(n282), .D(n281), .Y(n285) );
  OAI22XL U605 ( .A0(n286), .A1(n767), .B0(n285), .B1(n248), .Y(n1085) );
  OAI22XL U606 ( .A0(n540), .A1(n695), .B0(n29), .B1(n628), .Y(n290) );
  OAI22XL U607 ( .A0(n6), .A1(n625), .B0(n547), .B1(n701), .Y(n289) );
  OAI22XL U608 ( .A0(n30), .A1(n575), .B0(n2), .B1(n631), .Y(n288) );
  OAI22XL U609 ( .A0(n17), .A1(n652), .B0(n3), .B1(n588), .Y(n287) );
  OR4X2 U610 ( .A(n290), .B(n289), .C(n288), .D(n287), .Y(n304) );
  OAI22XL U611 ( .A0(n6), .A1(n588), .B0(n540), .B1(n625), .Y(n292) );
  OAI22XL U612 ( .A0(n17), .A1(n695), .B0(n547), .B1(n575), .Y(n291) );
  AOI211XL U613 ( .A0(n32), .A1(\col2_r[4][0] ), .B0(n292), .C0(n291), .Y(n293) );
  OAI21XL U614 ( .A0(n30), .A1(n628), .B0(n293), .Y(n303) );
  OAI22XL U615 ( .A0(n6), .A1(n589), .B0(n540), .B1(n698), .Y(n297) );
  OAI22XL U616 ( .A0(n17), .A1(n696), .B0(n547), .B1(n576), .Y(n296) );
  OAI21XL U617 ( .A0(n30), .A1(n629), .B0(n298), .Y(n315) );
  OAI22XL U618 ( .A0(n540), .A1(n696), .B0(n29), .B1(n629), .Y(n302) );
  OAI22XL U619 ( .A0(n6), .A1(n698), .B0(n547), .B1(n632), .Y(n301) );
  OAI22XL U620 ( .A0(n30), .A1(n576), .B0(n2), .B1(n633), .Y(n300) );
  OAI22XL U621 ( .A0(n17), .A1(n651), .B0(n3), .B1(n589), .Y(n299) );
  OR4X2 U622 ( .A(n302), .B(n301), .C(n300), .D(n299), .Y(n314) );
  ADDHXL U623 ( .A(n304), .B(n303), .CO(n313), .S(n294) );
  OAI22XL U624 ( .A0(n6), .A1(n699), .B0(n540), .B1(n626), .Y(n307) );
  OAI22XL U625 ( .A0(n17), .A1(n697), .B0(n547), .B1(n586), .Y(n306) );
  AOI211XL U626 ( .A0(n32), .A1(\col2_r[4][2] ), .B0(n307), .C0(n306), .Y(n308) );
  OAI21XL U627 ( .A0(n30), .A1(n590), .B0(n308), .Y(n326) );
  OAI22XL U628 ( .A0(n540), .A1(n697), .B0(n29), .B1(n590), .Y(n312) );
  OAI22XL U629 ( .A0(n6), .A1(n626), .B0(n547), .B1(n591), .Y(n311) );
  OAI22XL U630 ( .A0(n30), .A1(n586), .B0(n2), .B1(n634), .Y(n310) );
  OAI22XL U631 ( .A0(n17), .A1(n686), .B0(n3), .B1(n699), .Y(n309) );
  OR4X2 U632 ( .A(n312), .B(n311), .C(n310), .D(n309), .Y(n325) );
  ADDFX1 U633 ( .A(n315), .B(n314), .CI(n313), .CO(n324), .S(n305) );
  OAI22XL U634 ( .A0(n6), .A1(n700), .B0(n540), .B1(n627), .Y(n318) );
  OAI22XL U635 ( .A0(n17), .A1(n577), .B0(n547), .B1(n587), .Y(n317) );
  OAI21XL U636 ( .A0(n30), .A1(n657), .B0(n319), .Y(n337) );
  OAI22XL U637 ( .A0(n540), .A1(n577), .B0(n29), .B1(n657), .Y(n323) );
  OAI22XL U638 ( .A0(n6), .A1(n627), .B0(n547), .B1(n733), .Y(n322) );
  OAI22XL U639 ( .A0(n30), .A1(n587), .B0(n2), .B1(n734), .Y(n321) );
  OAI22XL U640 ( .A0(n17), .A1(n685), .B0(n3), .B1(n700), .Y(n320) );
  OR4X2 U641 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(n336) );
  ADDFX1 U642 ( .A(n326), .B(n325), .CI(n324), .CO(n335), .S(n316) );
  OAI22XL U643 ( .A0(n546), .A1(n730), .B0(n540), .B1(n653), .Y(n329) );
  OAI22XL U644 ( .A0(n17), .A1(n725), .B0(n134), .B1(n598), .Y(n328) );
  OAI21XL U645 ( .A0(n30), .A1(n603), .B0(n330), .Y(n348) );
  OAI22XL U646 ( .A0(n540), .A1(n725), .B0(n29), .B1(n603), .Y(n334) );
  OAI22XL U647 ( .A0(n6), .A1(n653), .B0(n547), .B1(n606), .Y(n333) );
  OAI22XL U648 ( .A0(n30), .A1(n598), .B0(n2), .B1(n658), .Y(n332) );
  OAI22XL U649 ( .A0(n17), .A1(n684), .B0(n3), .B1(n730), .Y(n331) );
  OR4X2 U650 ( .A(n334), .B(n333), .C(n332), .D(n331), .Y(n347) );
  ADDFX1 U651 ( .A(n337), .B(n336), .CI(n335), .CO(n346), .S(n327) );
  OAI22XL U652 ( .A0(n546), .A1(n731), .B0(n540), .B1(n654), .Y(n340) );
  OAI22XL U653 ( .A0(n17), .A1(n726), .B0(n134), .B1(n599), .Y(n339) );
  OAI21XL U654 ( .A0(n30), .A1(n604), .B0(n341), .Y(n359) );
  OAI22XL U655 ( .A0(n540), .A1(n726), .B0(n29), .B1(n604), .Y(n345) );
  OAI22XL U656 ( .A0(n6), .A1(n654), .B0(n547), .B1(n607), .Y(n344) );
  OAI22XL U657 ( .A0(n30), .A1(n599), .B0(n498), .B1(n659), .Y(n343) );
  OAI22XL U658 ( .A0(n17), .A1(n683), .B0(n3), .B1(n731), .Y(n342) );
  OR4X2 U659 ( .A(n345), .B(n344), .C(n343), .D(n342), .Y(n358) );
  ADDFX1 U660 ( .A(n348), .B(n347), .CI(n346), .CO(n357), .S(n338) );
  OAI22XL U661 ( .A0(n546), .A1(n732), .B0(n540), .B1(n655), .Y(n351) );
  OAI22XL U662 ( .A0(n17), .A1(n727), .B0(n134), .B1(n600), .Y(n350) );
  OAI21XL U663 ( .A0(n30), .A1(n605), .B0(n352), .Y(n370) );
  OAI22XL U664 ( .A0(n540), .A1(n727), .B0(n29), .B1(n605), .Y(n356) );
  OAI22XL U665 ( .A0(n6), .A1(n655), .B0(n547), .B1(n608), .Y(n355) );
  OAI22XL U666 ( .A0(n30), .A1(n600), .B0(n2), .B1(n660), .Y(n354) );
  OAI22XL U667 ( .A0(n17), .A1(n682), .B0(n3), .B1(n732), .Y(n353) );
  OR4X2 U668 ( .A(n356), .B(n355), .C(n354), .D(n353), .Y(n369) );
  ADDFX1 U669 ( .A(n359), .B(n358), .CI(n357), .CO(n368), .S(n349) );
  OAI22XL U670 ( .A0(n546), .A1(n729), .B0(n540), .B1(n656), .Y(n362) );
  OAI22XL U671 ( .A0(n17), .A1(n728), .B0(n547), .B1(n601), .Y(n361) );
  OAI21XL U672 ( .A0(n30), .A1(n602), .B0(n363), .Y(n374) );
  OAI22XL U673 ( .A0(n540), .A1(n728), .B0(n602), .B1(n29), .Y(n367) );
  OAI22XL U674 ( .A0(n6), .A1(n656), .B0(n547), .B1(n609), .Y(n366) );
  OAI22XL U675 ( .A0(n30), .A1(n601), .B0(n498), .B1(n661), .Y(n365) );
  OAI22XL U676 ( .A0(n17), .A1(n687), .B0(n729), .B1(n3), .Y(n364) );
  ADDFX1 U677 ( .A(n370), .B(n369), .CI(n368), .CO(n372), .S(n360) );
  ADDFX1 U678 ( .A(n374), .B(n373), .CI(n372), .CO(n375), .S(n371) );
  OAI22XL U679 ( .A0(n540), .A1(n623), .B0(n547), .B1(n693), .Y(n378) );
  OAI22XL U680 ( .A0(n546), .A1(n584), .B0(n30), .B1(n714), .Y(n377) );
  OAI22XL U681 ( .A0(n17), .A1(n717), .B0(n2), .B1(n621), .Y(n376) );
  NOR3XL U682 ( .A(n378), .B(n377), .C(n376), .Y(n379) );
  OAI21XL U683 ( .A0(n711), .A1(n3), .B0(n379), .Y(n394) );
  OAI22XL U684 ( .A0(n540), .A1(n624), .B0(n547), .B1(n694), .Y(n382) );
  OAI22XL U685 ( .A0(n6), .A1(n585), .B0(n30), .B1(n650), .Y(n381) );
  OAI22XL U686 ( .A0(n17), .A1(n721), .B0(n498), .B1(n622), .Y(n380) );
  NOR3XL U687 ( .A(n382), .B(n381), .C(n380), .Y(n383) );
  OAI21XL U688 ( .A0(n712), .A1(n3), .B0(n383), .Y(n393) );
  OAI22XL U689 ( .A0(n540), .A1(n718), .B0(n547), .B1(n644), .Y(n387) );
  OAI22XL U690 ( .A0(n6), .A1(n593), .B0(n30), .B1(n579), .Y(n386) );
  OAI22XL U691 ( .A0(n17), .A1(n720), .B0(n2), .B1(n637), .Y(n385) );
  NOR3XL U692 ( .A(n387), .B(n386), .C(n385), .Y(n388) );
  OAI21XL U693 ( .A0(n708), .A1(n3), .B0(n388), .Y(n406) );
  OAI22XL U694 ( .A0(n705), .A1(n540), .B0(n630), .B1(n547), .Y(n391) );
  OAI22XL U695 ( .A0(n546), .A1(n592), .B0(n30), .B1(n713), .Y(n390) );
  OAI22XL U696 ( .A0(n17), .A1(n716), .B0(n2), .B1(n636), .Y(n389) );
  NOR3XL U697 ( .A(n391), .B(n390), .C(n389), .Y(n392) );
  OAI21XL U698 ( .A0(n754), .A1(n3), .B0(n392), .Y(n405) );
  ADDHXL U699 ( .A(n394), .B(n393), .CO(n404), .S(n384) );
  OAI22XL U700 ( .A0(n540), .A1(n706), .B0(n547), .B1(n597), .Y(n398) );
  OAI22XL U701 ( .A0(n6), .A1(n578), .B0(n30), .B1(n645), .Y(n397) );
  OAI22XL U702 ( .A0(n17), .A1(n719), .B0(n2), .B1(n594), .Y(n396) );
  OAI21XL U703 ( .A0(n638), .A1(n3), .B0(n399), .Y(n419) );
  OAI22XL U704 ( .A0(n540), .A1(n641), .B0(n547), .B1(n709), .Y(n402) );
  OAI22XL U705 ( .A0(n546), .A1(n703), .B0(n30), .B1(n639), .Y(n401) );
  OAI22XL U706 ( .A0(n17), .A1(n715), .B0(n2), .B1(n640), .Y(n400) );
  OAI21XL U707 ( .A0(n735), .A1(n3), .B0(n403), .Y(n418) );
  ADDFX1 U708 ( .A(n406), .B(n405), .CI(n404), .CO(n417), .S(n395) );
  OAI22XL U709 ( .A0(n540), .A1(n647), .B0(n547), .B1(n707), .Y(n411) );
  OAI22XL U710 ( .A0(n6), .A1(n702), .B0(n30), .B1(n646), .Y(n410) );
  OAI22XL U711 ( .A0(n17), .A1(n649), .B0(n2), .B1(n595), .Y(n409) );
  OAI21XL U712 ( .A0(n741), .A1(n3), .B0(n412), .Y(n431) );
  OAI22XL U713 ( .A0(n540), .A1(n643), .B0(n547), .B1(n710), .Y(n415) );
  OAI22XL U714 ( .A0(n546), .A1(n642), .B0(n30), .B1(n596), .Y(n414) );
  OAI22XL U715 ( .A0(n17), .A1(n648), .B0(n2), .B1(n704), .Y(n413) );
  OAI21XL U716 ( .A0(n736), .A1(n3), .B0(n416), .Y(n430) );
  ADDFX1 U717 ( .A(n419), .B(n418), .CI(n417), .CO(n429), .S(n408) );
  OAI22XL U718 ( .A0(n540), .A1(n746), .B0(n547), .B1(n614), .Y(n423) );
  OAI22XL U719 ( .A0(n6), .A1(n580), .B0(n30), .B1(n678), .Y(n422) );
  OAI22XL U720 ( .A0(n17), .A1(n762), .B0(n2), .B1(n610), .Y(n421) );
  OAI21XL U721 ( .A0(n662), .A1(n3), .B0(n424), .Y(n443) );
  OAI22XL U722 ( .A0(n540), .A1(n668), .B0(n134), .B1(n750), .Y(n427) );
  OAI22XL U723 ( .A0(n546), .A1(n742), .B0(n30), .B1(n666), .Y(n426) );
  OAI22XL U724 ( .A0(n17), .A1(n757), .B0(n2), .B1(n667), .Y(n425) );
  OAI21XL U725 ( .A0(n737), .A1(n3), .B0(n428), .Y(n442) );
  ADDFX1 U726 ( .A(n431), .B(n430), .CI(n429), .CO(n441), .S(n420) );
  OAI22XL U727 ( .A0(n540), .A1(n747), .B0(n547), .B1(n615), .Y(n435) );
  OAI22XL U728 ( .A0(n6), .A1(n581), .B0(n30), .B1(n679), .Y(n434) );
  OAI22XL U729 ( .A0(n17), .A1(n761), .B0(n2), .B1(n611), .Y(n433) );
  OAI21XL U730 ( .A0(n663), .A1(n3), .B0(n436), .Y(n455) );
  OAI22XL U731 ( .A0(n540), .A1(n671), .B0(n547), .B1(n751), .Y(n439) );
  OAI22XL U732 ( .A0(n546), .A1(n743), .B0(n30), .B1(n669), .Y(n438) );
  OAI22XL U733 ( .A0(n17), .A1(n756), .B0(n2), .B1(n670), .Y(n437) );
  OAI21XL U734 ( .A0(n738), .A1(n3), .B0(n440), .Y(n454) );
  ADDFX1 U735 ( .A(n443), .B(n442), .CI(n441), .CO(n453), .S(n432) );
  OAI22XL U736 ( .A0(n540), .A1(n748), .B0(n547), .B1(n616), .Y(n447) );
  OAI22XL U737 ( .A0(n6), .A1(n582), .B0(n30), .B1(n680), .Y(n446) );
  OAI22XL U738 ( .A0(n17), .A1(n760), .B0(n2), .B1(n612), .Y(n445) );
  OAI21XL U739 ( .A0(n664), .A1(n3), .B0(n448), .Y(n467) );
  OAI22XL U740 ( .A0(n540), .A1(n674), .B0(n134), .B1(n752), .Y(n451) );
  OAI22XL U741 ( .A0(n546), .A1(n744), .B0(n30), .B1(n672), .Y(n450) );
  OAI22XL U742 ( .A0(n17), .A1(n755), .B0(n2), .B1(n673), .Y(n449) );
  OAI21XL U743 ( .A0(n739), .A1(n3), .B0(n452), .Y(n466) );
  ADDFX1 U744 ( .A(n455), .B(n454), .CI(n453), .CO(n465), .S(n444) );
  OAI22XL U745 ( .A0(n540), .A1(n749), .B0(n547), .B1(n617), .Y(n459) );
  OAI22XL U746 ( .A0(n6), .A1(n583), .B0(n30), .B1(n681), .Y(n458) );
  OAI22XL U747 ( .A0(n17), .A1(n759), .B0(n2), .B1(n613), .Y(n457) );
  OAI21XL U748 ( .A0(n665), .A1(n3), .B0(n460), .Y(n471) );
  OAI22XL U749 ( .A0(n540), .A1(n677), .B0(n547), .B1(n753), .Y(n463) );
  OAI22XL U750 ( .A0(n546), .A1(n745), .B0(n30), .B1(n675), .Y(n462) );
  OAI22XL U751 ( .A0(n17), .A1(n758), .B0(n498), .B1(n676), .Y(n461) );
  NOR3XL U752 ( .A(n463), .B(n462), .C(n461), .Y(n464) );
  OAI21XL U753 ( .A0(n740), .A1(n3), .B0(n464), .Y(n470) );
  ADDFX1 U754 ( .A(n467), .B(n466), .CI(n465), .CO(n469), .S(n456) );
  ADDFX1 U755 ( .A(n471), .B(n470), .CI(n469), .CO(n472), .S(n468) );
  OAI22XL U756 ( .A0(n540), .A1(n622), .B0(n712), .B1(n29), .Y(n476) );
  OAI22XL U757 ( .A0(n6), .A1(n694), .B0(n547), .B1(n624), .Y(n475) );
  OAI22XL U758 ( .A0(n30), .A1(n585), .B0(n498), .B1(n721), .Y(n474) );
  OAI22XL U759 ( .A0(n17), .A1(n724), .B0(n650), .B1(n3), .Y(n473) );
  OAI22XL U760 ( .A0(n540), .A1(n637), .B0(n708), .B1(n29), .Y(n481) );
  OAI22XL U761 ( .A0(n6), .A1(n644), .B0(n547), .B1(n718), .Y(n480) );
  OAI22XL U762 ( .A0(n30), .A1(n593), .B0(n2), .B1(n720), .Y(n479) );
  OAI22XL U763 ( .A0(n17), .A1(n723), .B0(n579), .B1(n3), .Y(n478) );
  OR4X2 U764 ( .A(n481), .B(n480), .C(n479), .D(n478), .Y(n489) );
  ADDHXL U765 ( .A(pixel9[0]), .B(n482), .CO(n488), .S(n477) );
  OAI22XL U766 ( .A0(n540), .A1(n594), .B0(n29), .B1(n638), .Y(n487) );
  OAI22XL U767 ( .A0(n6), .A1(n597), .B0(n547), .B1(n706), .Y(n486) );
  OAI22XL U768 ( .A0(n30), .A1(n578), .B0(n498), .B1(n719), .Y(n485) );
  OAI22XL U769 ( .A0(n17), .A1(n766), .B0(n3), .B1(n645), .Y(n484) );
  OR4X2 U770 ( .A(n487), .B(n486), .C(n485), .D(n484), .Y(n496) );
  ADDFX1 U771 ( .A(n489), .B(pixel9[1]), .CI(n488), .CO(n495), .S(n483) );
  OAI22XL U772 ( .A0(n540), .A1(n595), .B0(n29), .B1(n741), .Y(n494) );
  OAI22XL U773 ( .A0(n6), .A1(n707), .B0(n547), .B1(n647), .Y(n493) );
  OAI22XL U774 ( .A0(n30), .A1(n702), .B0(n2), .B1(n649), .Y(n492) );
  OAI22XL U775 ( .A0(n17), .A1(n765), .B0(n3), .B1(n646), .Y(n491) );
  OR4X2 U776 ( .A(n494), .B(n493), .C(n492), .D(n491), .Y(n504) );
  ADDFX1 U777 ( .A(n496), .B(pixel9[2]), .CI(n495), .CO(n503), .S(n490) );
  OAI22XL U778 ( .A0(n540), .A1(n610), .B0(n29), .B1(n662), .Y(n502) );
  OAI22XL U779 ( .A0(n6), .A1(n614), .B0(n547), .B1(n746), .Y(n501) );
  OAI22XL U780 ( .A0(n30), .A1(n580), .B0(n498), .B1(n762), .Y(n500) );
  OAI22XL U781 ( .A0(n17), .A1(n764), .B0(n3), .B1(n678), .Y(n499) );
  OR4X2 U782 ( .A(n502), .B(n501), .C(n500), .D(n499), .Y(n511) );
  ADDFX1 U783 ( .A(n504), .B(pixel9[3]), .CI(n503), .CO(n510), .S(n497) );
  OAI22XL U784 ( .A0(n540), .A1(n611), .B0(n29), .B1(n663), .Y(n509) );
  OAI22XL U785 ( .A0(n6), .A1(n615), .B0(n547), .B1(n747), .Y(n508) );
  OAI22XL U786 ( .A0(n30), .A1(n581), .B0(n2), .B1(n761), .Y(n507) );
  OAI22XL U787 ( .A0(n17), .A1(n763), .B0(n3), .B1(n679), .Y(n506) );
  OR4X2 U788 ( .A(n509), .B(n508), .C(n507), .D(n506), .Y(n518) );
  ADDFX1 U789 ( .A(n511), .B(pixel9[4]), .CI(n510), .CO(n517), .S(n505) );
  OAI22XL U790 ( .A0(n540), .A1(n612), .B0(n29), .B1(n664), .Y(n516) );
  OAI22XL U791 ( .A0(n6), .A1(n616), .B0(n547), .B1(n748), .Y(n515) );
  OAI22XL U792 ( .A0(n30), .A1(n582), .B0(n2), .B1(n760), .Y(n514) );
  OAI22XL U793 ( .A0(n17), .A1(n776), .B0(n3), .B1(n680), .Y(n513) );
  OR4X2 U794 ( .A(n516), .B(n515), .C(n514), .D(n513), .Y(n526) );
  ADDFX1 U795 ( .A(n518), .B(pixel9[5]), .CI(n517), .CO(n525), .S(n512) );
  OAI22XL U796 ( .A0(n540), .A1(n613), .B0(n29), .B1(n665), .Y(n524) );
  OAI22XL U797 ( .A0(n546), .A1(n617), .B0(n547), .B1(n749), .Y(n523) );
  OAI22XL U798 ( .A0(n30), .A1(n583), .B0(n2), .B1(n759), .Y(n522) );
  OAI22XL U799 ( .A0(n17), .A1(n775), .B0(n3), .B1(n681), .Y(n521) );
  OR4X2 U800 ( .A(n524), .B(n523), .C(n522), .D(n521), .Y(n529) );
  ADDFX1 U801 ( .A(n526), .B(pixel9[6]), .CI(n525), .CO(n528), .S(n519) );
  ADDFX1 U802 ( .A(n529), .B(pixel9[7]), .CI(n528), .CO(n530), .S(n527) );
  OAI22XL U803 ( .A0(n17), .A1(n621), .B0(n547), .B1(n584), .Y(n533) );
  OAI21XL U804 ( .A0(n2), .A1(n623), .B0(n531), .Y(n532) );
  AOI211XL U805 ( .A0(n545), .A1(\col3_r[0][0] ), .B0(n533), .C0(n532), .Y(
        n538) );
  OAI22XL U806 ( .A0(n17), .A1(n622), .B0(n547), .B1(n585), .Y(n536) );
  OAI21XL U807 ( .A0(n2), .A1(n624), .B0(n534), .Y(n535) );
  AOI211XL U808 ( .A0(n545), .A1(\col1_r[0][0] ), .B0(n536), .C0(n535), .Y(
        n537) );
  NOR2X1 U809 ( .A(n538), .B(n537), .Y(n556) );
  AOI211XL U810 ( .A0(n538), .A1(n537), .B0(n556), .C0(n248), .Y(n539) );
  OAI22XL U811 ( .A0(n17), .A1(n636), .B0(n547), .B1(n592), .Y(n544) );
  OAI21XL U812 ( .A0(n2), .A1(n705), .B0(n542), .Y(n543) );
  AOI211X1 U813 ( .A0(n545), .A1(\col3_r[0][1] ), .B0(n544), .C0(n543), .Y(
        n553) );
  OAI22XL U814 ( .A0(n546), .A1(n579), .B0(n540), .B1(n644), .Y(n549) );
  OAI22XL U815 ( .A0(n17), .A1(n637), .B0(n547), .B1(n593), .Y(n548) );
  AOI211XL U816 ( .A0(n32), .A1(\col1_r[4][1] ), .B0(n549), .C0(n548), .Y(n550) );
  OAI21X1 U817 ( .A0(n30), .A1(n708), .B0(n550), .Y(n554) );
  OAI2BB2XL U818 ( .B0(n248), .B1(n552), .A0N(n407), .A1N(up_sum_r[1]), .Y(
        n1053) );
  INVXL U819 ( .A(n553), .Y(n555) );
  AOI222XL U820 ( .A0(n556), .A1(n555), .B0(n556), .B1(n554), .C0(n555), .C1(
        n554), .Y(\intadd_9/A[0] ) );
  OAI2BB2XL U821 ( .B0(\intadd_9/SUM[0] ), .B1(n248), .A0N(up_sum_r[2]), .A1N(
        n407), .Y(n1052) );
  OAI2BB2XL U822 ( .B0(\intadd_9/SUM[1] ), .B1(n248), .A0N(up_sum_r[3]), .A1N(
        n407), .Y(n1051) );
  OAI2BB2XL U823 ( .B0(\intadd_9/SUM[2] ), .B1(n248), .A0N(up_sum_r[4]), .A1N(
        n407), .Y(n1050) );
  OAI2BB2XL U824 ( .B0(\intadd_9/SUM[3] ), .B1(n248), .A0N(up_sum_r[5]), .A1N(
        n407), .Y(n1049) );
  OAI2BB2XL U825 ( .B0(\intadd_9/SUM[4] ), .B1(n248), .A0N(up_sum_r[6]), .A1N(
        n407), .Y(n1048) );
  OAI2BB2XL U826 ( .B0(\intadd_9/SUM[5] ), .B1(n248), .A0N(up_sum_r[7]), .A1N(
        n407), .Y(n1047) );
  OAI21XL U827 ( .A0(n16), .A1(n722), .B0(n560), .Y(n559) );
  OAI2BB1X1 U828 ( .A0N(n561), .A1N(n560), .B0(color[0]), .Y(n562) );
  NAND2XL U829 ( .A(n564), .B(n690), .Y(n568) );
  AOI32XL U830 ( .A0(state_r[0]), .A1(n566), .A2(n620), .B0(n565), .B1(n692), 
        .Y(n567) );
  AOI211XL U831 ( .A0(state_r[1]), .A1(n569), .B0(n568), .C0(n567), .Y(n570)
         );
  AOI31XL U832 ( .A0(state_r[1]), .A1(n571), .A2(n620), .B0(n570), .Y(n573) );
  OAI21XL U833 ( .A0(n688), .A1(state_r[2]), .B0(n618), .Y(n572) );
  OAI21XL U834 ( .A0(n573), .A1(n688), .B0(n572), .Y(n1024) );
endmodule


module gamma_122 ( clk, rst_n, pixel_in, valid_in, color_in, last_pic_in, 
        pixel_out, valid_out, color_out, last_pic_out );
  input [7:0] pixel_in;
  input [1:0] color_in;
  output [7:0] pixel_out;
  output [1:0] color_out;
  input clk, rst_n, valid_in, last_pic_in;
  output valid_out, last_pic_out;
  wire   n_valid_out_reg, n_last_pic_out_reg, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220;
  wire   [1:0] n_color_out_reg;
  wire   [7:0] pixel_in_reg;
  wire   [7:0] n_pixel_out_reg;

  DFFRX1 \pixel_in_reg_reg[7]  ( .D(pixel_in[7]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[7]), .QN(n5) );
  DFFRX1 \pixel_in_reg_reg[6]  ( .D(pixel_in[6]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[6]) );
  DFFRX1 \pixel_in_reg_reg[5]  ( .D(pixel_in[5]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[5]), .QN(n218) );
  DFFRX1 \pixel_in_reg_reg[3]  ( .D(pixel_in[3]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[3]), .QN(n219) );
  DFFRX1 \pixel_in_reg_reg[2]  ( .D(pixel_in[2]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[2]), .QN(n220) );
  DFFRX1 valid_in_reg_reg ( .D(valid_in), .CK(clk), .RN(rst_n), .Q(
        n_valid_out_reg) );
  DFFRX1 \color_in_reg_reg[1]  ( .D(color_in[1]), .CK(clk), .RN(rst_n), .Q(
        n_color_out_reg[1]) );
  DFFRX1 \color_out_reg_reg[1]  ( .D(n_color_out_reg[1]), .CK(clk), .RN(rst_n), 
        .Q(color_out[1]) );
  DFFRX1 \color_in_reg_reg[0]  ( .D(color_in[0]), .CK(clk), .RN(rst_n), .Q(
        n_color_out_reg[0]) );
  DFFRX1 \color_out_reg_reg[0]  ( .D(n_color_out_reg[0]), .CK(clk), .RN(rst_n), 
        .Q(color_out[0]) );
  DFFRX1 last_pic_in_reg_reg ( .D(last_pic_in), .CK(clk), .RN(rst_n), .Q(
        n_last_pic_out_reg) );
  DFFRX1 last_pic_out_reg_reg ( .D(n_last_pic_out_reg), .CK(clk), .RN(rst_n), 
        .Q(last_pic_out) );
  DFFRX1 \pixel_out_reg_reg[7]  ( .D(n_pixel_out_reg[7]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[7]) );
  DFFRX1 \pixel_out_reg_reg[6]  ( .D(n_pixel_out_reg[6]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[6]) );
  DFFRX1 \pixel_out_reg_reg[5]  ( .D(n_pixel_out_reg[5]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[5]) );
  DFFRX1 \pixel_out_reg_reg[4]  ( .D(n_pixel_out_reg[4]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[4]) );
  DFFRX1 \pixel_out_reg_reg[3]  ( .D(n_pixel_out_reg[3]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[3]) );
  DFFRX1 \pixel_out_reg_reg[2]  ( .D(n_pixel_out_reg[2]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[2]) );
  DFFRX1 \pixel_out_reg_reg[1]  ( .D(n_pixel_out_reg[1]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[1]) );
  DFFRX1 \pixel_out_reg_reg[0]  ( .D(n_pixel_out_reg[0]), .CK(clk), .RN(rst_n), 
        .Q(pixel_out[0]) );
  DFFRX1 valid_out_reg_reg ( .D(n_valid_out_reg), .CK(clk), .RN(rst_n), .Q(
        valid_out) );
  TLATX1 \n_pixel_out_reg_reg[0]  ( .G(n248), .D(n246), .Q(n_pixel_out_reg[0])
         );
  TLATX1 \n_pixel_out_reg_reg[4]  ( .G(n248), .D(n242), .Q(n_pixel_out_reg[4])
         );
  DFFRX2 \pixel_in_reg_reg[4]  ( .D(pixel_in[4]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[4]), .QN(n217) );
  DFFRX2 \pixel_in_reg_reg[0]  ( .D(pixel_in[0]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[0]) );
  DFFRX1 \pixel_in_reg_reg[1]  ( .D(pixel_in[1]), .CK(clk), .RN(rst_n), .Q(
        pixel_in_reg[1]) );
  TLATX1 \n_pixel_out_reg_reg[5]  ( .G(n248), .D(n241), .Q(n_pixel_out_reg[5])
         );
  TLATX1 \n_pixel_out_reg_reg[6]  ( .G(n248), .D(n240), .Q(n_pixel_out_reg[6])
         );
  TLATX1 \n_pixel_out_reg_reg[2]  ( .G(n248), .D(n244), .Q(n_pixel_out_reg[2])
         );
  TLATX1 \n_pixel_out_reg_reg[1]  ( .G(n248), .D(n245), .Q(n_pixel_out_reg[1])
         );
  TLATX1 \n_pixel_out_reg_reg[3]  ( .G(n248), .D(n243), .Q(n_pixel_out_reg[3])
         );
  TLATX1 \n_pixel_out_reg_reg[7]  ( .G(n248), .D(n247), .Q(n_pixel_out_reg[7])
         );
  AOI2BB2X1 U3 ( .B0(n182), .B1(n157), .A0N(n156), .A1N(n155), .Y(n161) );
  AOI2BB2X2 U4 ( .B0(pixel_in_reg[7]), .B1(n116), .A0N(n115), .A1N(n207), .Y(
        n122) );
  CLKINVX2 U5 ( .A(n78), .Y(n7) );
  NOR4BX1 U6 ( .AN(n111), .B(n110), .C(n109), .D(n165), .Y(n146) );
  INVX2 U7 ( .A(n168), .Y(n12) );
  INVX1 U8 ( .A(n94), .Y(n72) );
  NAND3BX1 U9 ( .AN(n204), .B(n137), .C(n47), .Y(n214) );
  AO21X2 U10 ( .A0(n168), .A1(n182), .B0(n144), .Y(n197) );
  AO21X2 U11 ( .A0(n127), .A1(n117), .B0(n134), .Y(n131) );
  OA21X2 U12 ( .A0(n57), .A1(n20), .B0(n72), .Y(n206) );
  AO21X2 U13 ( .A0(n28), .A1(n6), .B0(n119), .Y(n205) );
  INVX1 U14 ( .A(n4), .Y(n2) );
  INVX2 U15 ( .A(n145), .Y(n6) );
  AO21X2 U16 ( .A0(pixel_in_reg[1]), .A1(pixel_in_reg[0]), .B0(pixel_in_reg[2]), .Y(n28) );
  NAND3X2 U17 ( .A(n218), .B(n219), .C(pixel_in_reg[4]), .Y(n8) );
  INVXL U18 ( .A(n70), .Y(n4) );
  NAND2XL U19 ( .A(pixel_in_reg[0]), .B(n57), .Y(n70) );
  NOR2X1 U20 ( .A(pixel_in_reg[2]), .B(pixel_in_reg[1]), .Y(n79) );
  NAND2X2 U21 ( .A(pixel_in_reg[0]), .B(n136), .Y(n176) );
  NOR2X1 U22 ( .A(pixel_in_reg[0]), .B(n147), .Y(n73) );
  NAND2X2 U23 ( .A(pixel_in_reg[0]), .B(n79), .Y(n95) );
  NAND3X2 U24 ( .A(n218), .B(n217), .C(pixel_in_reg[3]), .Y(n94) );
  NOR2X2 U25 ( .A(n162), .B(pixel_in_reg[4]), .Y(n97) );
  NOR4BX1 U26 ( .AN(n112), .B(n149), .C(n37), .D(n36), .Y(n171) );
  OAI21X1 U27 ( .A0(n126), .A1(n73), .B0(n6), .Y(n112) );
  AOI2BB2X1 U28 ( .B0(n189), .B1(n85), .A0N(n84), .A1N(n202), .Y(n106) );
  NOR2X2 U29 ( .A(pixel_in_reg[0]), .B(n153), .Y(n167) );
  NAND2X2 U30 ( .A(n194), .B(n201), .Y(n248) );
  NAND2XL U31 ( .A(pixel_in_reg[5]), .B(pixel_in_reg[4]), .Y(n35) );
  NOR2XL U32 ( .A(n156), .B(n190), .Y(n90) );
  NAND4XL U33 ( .A(n101), .B(n173), .C(n33), .D(n47), .Y(n34) );
  NOR2XL U34 ( .A(n135), .B(n97), .Y(n113) );
  NAND2XL U35 ( .A(n72), .B(n98), .Y(n170) );
  NOR4XL U36 ( .A(n181), .B(n180), .C(n179), .D(n178), .Y(n184) );
  INVXL U37 ( .A(n19), .Y(n33) );
  AOI211XL U38 ( .A0(n136), .A1(n135), .B0(n134), .C0(n133), .Y(n138) );
  NOR2XL U39 ( .A(n192), .B(n155), .Y(n125) );
  NAND2XL U40 ( .A(n167), .B(n157), .Y(n65) );
  NAND2XL U41 ( .A(n52), .B(n158), .Y(n93) );
  NAND4XL U42 ( .A(n8), .B(n33), .C(n170), .D(n25), .Y(n49) );
  NAND2XL U43 ( .A(n182), .B(n127), .Y(n47) );
  OAI211XL U44 ( .A0(n167), .A1(n12), .B0(n24), .C0(n33), .Y(n27) );
  NAND3XL U45 ( .A(n93), .B(n54), .C(n53), .Y(n132) );
  AOI22XL U46 ( .A0(n189), .A1(n215), .B0(n187), .B1(n49), .Y(n50) );
  OAI211XL U47 ( .A0(pixel_in_reg[6]), .A1(n51), .B0(n50), .C0(n201), .Y(n240)
         );
  NAND3XL U48 ( .A(n122), .B(n121), .C(n120), .Y(n242) );
  NAND2X1 U49 ( .A(pixel_in_reg[7]), .B(pixel_in_reg[6]), .Y(n140) );
  INVXL U50 ( .A(n140), .Y(n194) );
  NAND3X1 U51 ( .A(n218), .B(n217), .C(n219), .Y(n145) );
  INVXL U52 ( .A(n79), .Y(n153) );
  INVX1 U53 ( .A(n167), .Y(n77) );
  NOR2X1 U54 ( .A(n77), .B(n94), .Y(n119) );
  NOR2XL U55 ( .A(n6), .B(n119), .Y(n14) );
  NAND2X1 U56 ( .A(n220), .B(pixel_in_reg[1]), .Y(n147) );
  INVX1 U57 ( .A(n147), .Y(n57) );
  NOR2X1 U58 ( .A(n220), .B(pixel_in_reg[1]), .Y(n159) );
  INVX1 U59 ( .A(n159), .Y(n192) );
  NOR2X1 U60 ( .A(pixel_in_reg[0]), .B(n192), .Y(n78) );
  NAND2XL U61 ( .A(n95), .B(n7), .Y(n20) );
  NAND2X1 U62 ( .A(pixel_in_reg[2]), .B(pixel_in_reg[1]), .Y(n108) );
  INVX1 U63 ( .A(n108), .Y(n136) );
  NOR2XL U64 ( .A(n94), .B(n176), .Y(n19) );
  NOR2X1 U65 ( .A(pixel_in_reg[0]), .B(n108), .Y(n52) );
  NAND2X1 U66 ( .A(n159), .B(pixel_in_reg[0]), .Y(n86) );
  INVX1 U67 ( .A(n86), .Y(n182) );
  NOR2XL U68 ( .A(n52), .B(n182), .Y(n191) );
  INVXL U69 ( .A(n191), .Y(n98) );
  NAND2X1 U70 ( .A(pixel_in_reg[4]), .B(pixel_in_reg[3]), .Y(n203) );
  NOR2XL U71 ( .A(pixel_in_reg[5]), .B(n203), .Y(n9) );
  BUFX2 U72 ( .A(n9), .Y(n127) );
  INVX1 U73 ( .A(n127), .Y(n155) );
  NOR2XL U74 ( .A(n155), .B(n28), .Y(n143) );
  INVXL U75 ( .A(n143), .Y(n25) );
  NOR2XL U76 ( .A(n206), .B(n49), .Y(n48) );
  NAND3XL U77 ( .A(n217), .B(n219), .C(pixel_in_reg[5]), .Y(n10) );
  BUFX2 U78 ( .A(n10), .Y(n69) );
  NAND2X1 U79 ( .A(pixel_in_reg[5]), .B(pixel_in_reg[3]), .Y(n162) );
  NAND3XL U80 ( .A(n219), .B(pixel_in_reg[4]), .C(pixel_in_reg[5]), .Y(n11) );
  BUFX2 U81 ( .A(n11), .Y(n190) );
  INVX1 U82 ( .A(n190), .Y(n157) );
  NOR2XL U83 ( .A(n97), .B(n157), .Y(n177) );
  NOR2X1 U84 ( .A(n218), .B(n203), .Y(n168) );
  OAI211XL U85 ( .A0(n69), .A1(n220), .B0(n177), .C0(n12), .Y(n116) );
  INVXL U86 ( .A(n116), .Y(n13) );
  AOI31XL U87 ( .A0(n14), .A1(n48), .A2(n13), .B0(n140), .Y(n209) );
  INVXL U88 ( .A(n209), .Y(n201) );
  INVXL U89 ( .A(n176), .Y(n96) );
  AOI222XL U90 ( .A0(n52), .A1(n72), .B0(n168), .B1(n167), .C0(n96), .C1(n157), 
        .Y(n56) );
  INVX1 U91 ( .A(n69), .Y(n158) );
  NOR2XL U92 ( .A(n77), .B(n155), .Y(n110) );
  OAI22X1 U93 ( .A0(n8), .A1(n95), .B0(n69), .B1(n86), .Y(n123) );
  AOI211XL U94 ( .A0(n158), .A1(n73), .B0(n110), .C0(n123), .Y(n15) );
  OAI211XL U95 ( .A0(n12), .A1(n2), .B0(n56), .C0(n15), .Y(n64) );
  OAI22XL U96 ( .A0(n191), .A1(n145), .B0(n8), .B1(n77), .Y(n124) );
  INVX1 U97 ( .A(n73), .Y(n185) );
  NAND2XL U98 ( .A(n97), .B(n182), .Y(n74) );
  OAI21XL U99 ( .A0(n185), .A1(n12), .B0(n74), .Y(n23) );
  INVX1 U100 ( .A(n97), .Y(n175) );
  NOR2XL U101 ( .A(n175), .B(n108), .Y(n39) );
  AOI211XL U102 ( .A0(n96), .A1(n6), .B0(n119), .C0(n39), .Y(n17) );
  INVX1 U103 ( .A(n95), .Y(n126) );
  OAI21XL U104 ( .A0(n126), .A1(n57), .B0(n127), .Y(n16) );
  NAND3XL U105 ( .A(n17), .B(n65), .C(n16), .Y(n165) );
  INVXL U106 ( .A(n165), .Y(n172) );
  NOR2XL U107 ( .A(n69), .B(n2), .Y(n118) );
  NOR2XL U108 ( .A(n8), .B(n176), .Y(n38) );
  AOI211XL U109 ( .A0(n126), .A1(n168), .B0(n118), .C0(n38), .Y(n18) );
  INVXL U110 ( .A(n18), .Y(n103) );
  AOI211XL U111 ( .A0(n158), .A1(n20), .B0(n19), .C0(n103), .Y(n21) );
  OAI211XL U112 ( .A0(n162), .A1(n7), .B0(n172), .C0(n21), .Y(n22) );
  NOR4XL U113 ( .A(n64), .B(n124), .C(n23), .D(n22), .Y(n46) );
  NAND2X1 U114 ( .A(pixel_in_reg[6]), .B(n5), .Y(n202) );
  OAI21XL U115 ( .A0(pixel_in_reg[2]), .A1(pixel_in_reg[1]), .B0(n97), .Y(n24)
         );
  OAI21XL U116 ( .A0(pixel_in_reg[4]), .A1(n219), .B0(n25), .Y(n26) );
  AOI22XL U117 ( .A0(pixel_in_reg[7]), .A1(n27), .B0(n194), .B1(n26), .Y(n45)
         );
  NOR2X1 U118 ( .A(pixel_in_reg[6]), .B(n5), .Y(n189) );
  NAND2XL U119 ( .A(n136), .B(n127), .Y(n66) );
  OAI211XL U120 ( .A0(n69), .A1(n28), .B0(n47), .C0(n66), .Y(n29) );
  NOR2XL U121 ( .A(n205), .B(n29), .Y(n139) );
  OAI211XL U122 ( .A0(n136), .A1(n8), .B0(n139), .C0(n65), .Y(n43) );
  NOR2X1 U123 ( .A(pixel_in_reg[7]), .B(pixel_in_reg[6]), .Y(n187) );
  INVX1 U124 ( .A(n8), .Y(n135) );
  NOR2XL U125 ( .A(n2), .B(n94), .Y(n30) );
  AOI211XL U126 ( .A0(n73), .A1(n135), .B0(n119), .C0(n30), .Y(n68) );
  OAI21XL U127 ( .A0(n157), .A1(n127), .B0(n167), .Y(n101) );
  OAI22XL U128 ( .A0(n108), .A1(n12), .B0(n69), .B1(n185), .Y(n32) );
  OAI22XL U129 ( .A0(n8), .A1(n2), .B0(n94), .B1(n7), .Y(n31) );
  AOI211XL U130 ( .A0(n6), .A1(n52), .B0(n32), .C0(n31), .Y(n173) );
  AOI211XL U131 ( .A0(n78), .A1(n6), .B0(n118), .C0(n34), .Y(n76) );
  OAI22X1 U132 ( .A0(n175), .A1(n153), .B0(n69), .B1(n176), .Y(n149) );
  OAI22XL U133 ( .A0(n203), .A1(n7), .B0(n86), .B1(n35), .Y(n37) );
  OAI22XL U134 ( .A0(n108), .A1(n190), .B0(n69), .B1(n95), .Y(n36) );
  INVX1 U135 ( .A(n52), .Y(n156) );
  NAND2XL U136 ( .A(n156), .B(n95), .Y(n40) );
  AOI211XL U137 ( .A0(n72), .A1(n40), .B0(n39), .C0(n38), .Y(n41) );
  NAND4XL U138 ( .A(n68), .B(n76), .C(n171), .D(n41), .Y(n42) );
  AOI22XL U139 ( .A0(n189), .A1(n43), .B0(n187), .B1(n42), .Y(n44) );
  OAI211XL U140 ( .A0(n46), .A1(n202), .B0(n45), .C0(n44), .Y(n244) );
  NAND3XL U141 ( .A(n177), .B(n69), .C(n66), .Y(n204) );
  INVXL U142 ( .A(n2), .Y(n117) );
  OAI21X1 U143 ( .A0(n117), .A1(n78), .B0(n127), .Y(n137) );
  INVXL U144 ( .A(n214), .Y(n51) );
  NAND2XL U145 ( .A(n48), .B(n12), .Y(n215) );
  OAI21XL U146 ( .A0(n135), .A1(n72), .B0(n57), .Y(n54) );
  OAI21XL U147 ( .A0(n6), .A1(n127), .B0(n73), .Y(n53) );
  NOR2XL U148 ( .A(n158), .B(n72), .Y(n193) );
  INVXL U149 ( .A(n113), .Y(n61) );
  OAI21XL U150 ( .A0(n6), .A1(n61), .B0(n136), .Y(n55) );
  OAI211XL U151 ( .A0(n193), .A1(n176), .B0(n56), .C0(n55), .Y(n196) );
  OAI22XL U152 ( .A0(n12), .A1(n176), .B0(n147), .B1(n190), .Y(n60) );
  NAND2XL U153 ( .A(n145), .B(n12), .Y(n133) );
  INVXL U154 ( .A(n133), .Y(n154) );
  NAND3XL U155 ( .A(pixel_in_reg[5]), .B(pixel_in_reg[4]), .C(n78), .Y(n58) );
  NAND2XL U156 ( .A(n97), .B(n57), .Y(n111) );
  OAI211XL U157 ( .A0(n154), .A1(n70), .B0(n58), .C0(n111), .Y(n59) );
  NOR4XL U158 ( .A(n132), .B(n196), .C(n60), .D(n59), .Y(n107) );
  OAI21XL U159 ( .A0(n6), .A1(n61), .B0(n159), .Y(n62) );
  OAI211XL U160 ( .A0(n108), .A1(n12), .B0(n62), .C0(n93), .Y(n144) );
  OAI22X1 U161 ( .A0(n175), .A1(n95), .B0(n190), .B1(n7), .Y(n181) );
  OAI211XL U162 ( .A0(n190), .A1(n2), .B0(n137), .C0(n112), .Y(n63) );
  NOR4XL U163 ( .A(n144), .B(n64), .C(n181), .D(n63), .Y(n67) );
  NAND4XL U164 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n85) );
  NOR2XL U165 ( .A(n69), .B(n77), .Y(n88) );
  OAI22XL U166 ( .A0(n217), .A1(n70), .B0(n8), .B1(n156), .Y(n71) );
  AOI211XL U167 ( .A0(n73), .A1(n72), .B0(n123), .C0(n71), .Y(n75) );
  NAND4BX1 U168 ( .AN(n88), .B(n76), .C(n75), .D(n74), .Y(n180) );
  OAI22XL U169 ( .A0(n219), .A1(n77), .B0(n8), .B1(n7), .Y(n83) );
  OAI22XL U170 ( .A0(n145), .A1(n185), .B0(n86), .B1(n94), .Y(n82) );
  OAI21XL U171 ( .A0(n79), .A1(n78), .B0(n168), .Y(n80) );
  OAI211XL U172 ( .A0(n190), .A1(n156), .B0(n111), .C0(n80), .Y(n81) );
  NOR4XL U173 ( .A(n180), .B(n83), .C(n82), .D(n81), .Y(n84) );
  OAI22XL U174 ( .A0(n12), .A1(n86), .B0(n190), .B1(n185), .Y(n104) );
  OAI21XL U175 ( .A0(pixel_in_reg[5]), .A1(pixel_in_reg[4]), .B0(n162), .Y(n89) );
  OAI22XL U176 ( .A0(n192), .A1(n94), .B0(n176), .B1(n155), .Y(n87) );
  AOI211XL U177 ( .A0(n117), .A1(n89), .B0(n88), .C0(n87), .Y(n92) );
  AOI211XL U178 ( .A0(n135), .A1(n98), .B0(n90), .C0(n181), .Y(n91) );
  NAND2XL U179 ( .A(n92), .B(n91), .Y(n166) );
  OAI21XL U180 ( .A0(n95), .A1(n94), .B0(n93), .Y(n179) );
  AOI211XL U181 ( .A0(n96), .A1(n133), .B0(n166), .C0(n179), .Y(n100) );
  OAI21XL U182 ( .A0(n167), .A1(n98), .B0(n97), .Y(n99) );
  NAND4XL U183 ( .A(n101), .B(n100), .C(n137), .D(n99), .Y(n102) );
  OAI31XL U184 ( .A0(n104), .A1(n103), .A2(n102), .B0(n187), .Y(n105) );
  OAI211XL U185 ( .A0(n107), .A1(n140), .B0(n106), .C0(n105), .Y(n246) );
  NOR2XL U186 ( .A(n190), .B(n167), .Y(n134) );
  NOR2XL U187 ( .A(n8), .B(n108), .Y(n109) );
  OAI211XL U188 ( .A0(n113), .A1(n192), .B0(n146), .C0(n112), .Y(n114) );
  NOR4XL U189 ( .A(n134), .B(n125), .C(n206), .D(n114), .Y(n115) );
  INVXL U190 ( .A(n187), .Y(n207) );
  INVXL U191 ( .A(n202), .Y(n212) );
  OAI21XL U192 ( .A0(n131), .A1(n215), .B0(n212), .Y(n121) );
  OAI31XL U193 ( .A0(n119), .A1(n6), .A2(n118), .B0(n189), .Y(n120) );
  INVXL U194 ( .A(n123), .Y(n129) );
  AOI211XL U195 ( .A0(n127), .A1(n126), .B0(n125), .C0(n124), .Y(n128) );
  OAI211XL U196 ( .A0(n193), .A1(n7), .B0(n129), .C0(n128), .Y(n130) );
  NOR4XL U197 ( .A(n132), .B(n149), .C(n131), .D(n130), .Y(n152) );
  INVXL U198 ( .A(n189), .Y(n216) );
  AOI31XL U199 ( .A0(n139), .A1(n138), .A2(n137), .B0(n216), .Y(n142) );
  AOI211XL U200 ( .A0(pixel_in_reg[3]), .A1(n218), .B0(n217), .C0(n140), .Y(
        n141) );
  AOI211XL U201 ( .A0(n143), .A1(pixel_in_reg[7]), .B0(n142), .C0(n141), .Y(
        n151) );
  OAI211XL U202 ( .A0(n8), .A1(n147), .B0(n146), .C0(n145), .Y(n148) );
  OAI31XL U203 ( .A0(n149), .A1(n197), .A2(n148), .B0(n212), .Y(n150) );
  OAI211XL U204 ( .A0(n152), .A1(n207), .B0(n151), .C0(n150), .Y(n243) );
  OAI22XL U205 ( .A0(n154), .A1(n7), .B0(n8), .B1(n153), .Y(n164) );
  NAND2XL U206 ( .A(n159), .B(n158), .Y(n160) );
  OAI211XL U207 ( .A0(n185), .A1(n162), .B0(n161), .C0(n160), .Y(n163) );
  NOR4XL U208 ( .A(n166), .B(n165), .C(n164), .D(n163), .Y(n200) );
  OAI21XL U209 ( .A0(n168), .A1(n217), .B0(n167), .Y(n169) );
  OAI211XL U210 ( .A0(n8), .A1(n192), .B0(n170), .C0(n169), .Y(n174) );
  NAND4BX1 U211 ( .AN(n174), .B(n173), .C(n172), .D(n171), .Y(n188) );
  OAI22XL U212 ( .A0(n177), .A1(n176), .B0(n175), .B1(n7), .Y(n178) );
  NAND2XL U213 ( .A(n6), .B(n182), .Y(n183) );
  OAI211XL U214 ( .A0(n185), .A1(n203), .B0(n184), .C0(n183), .Y(n186) );
  AOI22XL U215 ( .A0(n189), .A1(n188), .B0(n187), .B1(n186), .Y(n199) );
  OAI22XL U216 ( .A0(n193), .A1(n192), .B0(n191), .B1(n190), .Y(n195) );
  OAI31XL U217 ( .A0(n197), .A1(n196), .A2(n195), .B0(n194), .Y(n198) );
  OAI211XL U218 ( .A0(n200), .A1(n202), .B0(n199), .C0(n198), .Y(n245) );
  NAND4XL U219 ( .A(n216), .B(n12), .C(n202), .D(n201), .Y(n247) );
  OAI21XL U220 ( .A0(n220), .A1(n203), .B0(n218), .Y(n211) );
  NOR3XL U221 ( .A(n206), .B(n205), .C(n204), .Y(n208) );
  NOR2XL U222 ( .A(n208), .B(n207), .Y(n210) );
  AOI211XL U223 ( .A0(n212), .A1(n211), .B0(n210), .C0(n209), .Y(n213) );
  OAI31XL U224 ( .A0(n216), .A1(n215), .A2(n214), .B0(n213), .Y(n241) );
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
  wire   n3921, valid_in_dem, last_col_in_dem, last_col_in_reg,
         last_pic_in_dem, valid_in_den, valid_out_dem, last_col_in_den,
         last_col_out_dem, last_pic_in_den, last_pic_out_dem, valid_in_mean,
         valid_out_den, last_pic_in_mean, last_pic_out_den, valid_in_gain,
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
         \denoise/second_col_b[0][7] , \denoise/second_col_b[0][4] ,
         \denoise/second_col_b[0][2] , \denoise/second_col_b[0][1] ,
         \denoise/second_col_b[1][7] , \denoise/second_col_b[1][5] ,
         \denoise/second_col_b[1][3] , \denoise/second_col_b[1][2] ,
         \denoise/second_col_b[1][1] , \denoise/second_col_b[1][0] ,
         \denoise/second_col_b[2][7] , \denoise/second_col_b[2][6] ,
         \denoise/second_col_b[2][5] , \denoise/second_col_b[2][4] ,
         \denoise/second_col_b[2][3] , \denoise/second_col_b[2][1] ,
         \denoise/second_col_b[2][0] , \denoise/second_col_b[3][7] ,
         \denoise/second_col_b[3][6] , \denoise/second_col_b[3][5] ,
         \denoise/second_col_b[3][4] , \denoise/second_col_b[3][3] ,
         \denoise/second_col_b[3][2] , \denoise/second_col_b[3][0] ,
         \denoise/second_col_b[4][7] , \denoise/second_col_b[4][6] ,
         \denoise/second_col_b[4][5] , \denoise/second_col_b[4][4] ,
         \denoise/second_col_b[4][3] , \denoise/second_col_b[4][2] ,
         \denoise/second_col_b[4][1] , \denoise/second_col_b[4][0] ,
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
         \denoise/second_col_g[0][7] , \denoise/second_col_g[0][5] ,
         \denoise/second_col_g[1][7] , \denoise/second_col_g[1][6] ,
         \denoise/second_col_g[1][5] , \denoise/second_col_g[1][4] ,
         \denoise/second_col_g[1][3] , \denoise/second_col_g[1][2] ,
         \denoise/second_col_g[1][1] , \denoise/second_col_g[1][0] ,
         \denoise/second_col_g[2][7] , \denoise/second_col_g[2][6] ,
         \denoise/second_col_g[2][4] , \denoise/second_col_g[2][3] ,
         \denoise/second_col_g[2][2] , \denoise/second_col_g[2][1] ,
         \denoise/second_col_g[2][0] , \denoise/second_col_g[3][7] ,
         \denoise/second_col_g[3][5] , \denoise/second_col_g[3][4] ,
         \denoise/second_col_g[3][2] , \denoise/second_col_g[3][1] ,
         \denoise/second_col_g[3][0] , \denoise/second_col_g[4][7] ,
         \denoise/second_col_g[4][6] , \denoise/second_col_g[4][5] ,
         \denoise/second_col_g[4][4] , \denoise/second_col_g[4][3] ,
         \denoise/second_col_g[4][2] , \denoise/second_col_g[4][1] ,
         \denoise/second_col_g[4][0] , \denoise/second_col_g[5][7] ,
         \denoise/second_col_g[5][6] , \denoise/second_col_g[5][5] ,
         \denoise/second_col_g[5][4] , \denoise/second_col_g[5][3] ,
         \denoise/second_col_g[5][2] , \denoise/second_col_g[5][1] ,
         \denoise/second_col_g[5][0] , \denoise/first_col_r[0][7] ,
         \denoise/first_col_r[0][6] , \denoise/first_col_r[0][5] ,
         \denoise/first_col_r[0][4] , \denoise/first_col_r[0][3] ,
         \denoise/first_col_r[0][2] , \denoise/first_col_r[0][1] ,
         \denoise/first_col_r[0][0] , \denoise/first_col_r[1][7] ,
         \denoise/first_col_r[1][6] , \denoise/first_col_r[1][5] ,
         \denoise/first_col_r[1][4] , \denoise/first_col_r[1][3] ,
         \denoise/first_col_r[1][2] , \denoise/first_col_r[1][1] ,
         \denoise/first_col_r[1][0] , \denoise/first_col_r[2][7] ,
         \denoise/first_col_r[2][6] , \denoise/first_col_r[2][5] ,
         \denoise/first_col_r[2][4] , \denoise/first_col_r[2][3] ,
         \denoise/first_col_r[2][2] , \denoise/first_col_r[2][1] ,
         \denoise/first_col_r[2][0] , \denoise/first_col_r[3][7] ,
         \denoise/first_col_r[3][6] , \denoise/first_col_r[3][5] ,
         \denoise/first_col_r[3][4] , \denoise/first_col_r[3][3] ,
         \denoise/first_col_r[3][2] , \denoise/first_col_r[3][1] ,
         \denoise/first_col_r[3][0] , \denoise/first_col_r[4][7] ,
         \denoise/first_col_r[4][6] , \denoise/first_col_r[4][5] ,
         \denoise/first_col_r[4][4] , \denoise/first_col_r[4][3] ,
         \denoise/first_col_r[4][2] , \denoise/first_col_r[4][1] ,
         \denoise/first_col_r[4][0] , \denoise/first_col_r[5][7] ,
         \denoise/first_col_r[5][6] , \denoise/first_col_r[5][5] ,
         \denoise/first_col_r[5][4] , \denoise/first_col_r[5][3] ,
         \denoise/first_col_r[5][2] , \denoise/first_col_r[5][1] ,
         \denoise/first_col_r[5][0] , \denoise/second_col_r[0][7] ,
         \denoise/second_col_r[0][6] , \denoise/second_col_r[0][4] ,
         \denoise/second_col_r[0][2] , \denoise/second_col_r[0][1] ,
         \denoise/second_col_r[0][0] , \denoise/second_col_r[1][7] ,
         \denoise/second_col_r[1][3] , \denoise/second_col_r[1][2] ,
         \denoise/second_col_r[1][1] , \denoise/second_col_r[2][5] ,
         \denoise/second_col_r[2][3] , \denoise/second_col_r[2][2] ,
         \denoise/second_col_r[2][1] , \denoise/second_col_r[2][0] ,
         \denoise/second_col_r[3][7] , \denoise/second_col_r[3][6] ,
         \denoise/second_col_r[3][5] , \denoise/second_col_r[3][4] ,
         \denoise/second_col_r[4][7] , \denoise/second_col_r[4][6] ,
         \denoise/second_col_r[4][5] , \denoise/second_col_r[4][4] ,
         \denoise/second_col_r[4][3] , \denoise/second_col_r[4][2] ,
         \denoise/second_col_r[4][1] , \denoise/second_col_r[4][0] ,
         \denoise/second_col_r[5][7] , \denoise/second_col_r[5][6] ,
         \denoise/second_col_r[5][5] , \denoise/second_col_r[5][4] ,
         \denoise/second_col_r[5][3] , \denoise/second_col_r[5][2] ,
         \denoise/second_col_r[5][1] , \denoise/second_col_r[5][0] ,
         \denoise/valid_in_reg , \denoise/init_12_last_flag , \mean/valid_r ,
         \mean/last_r , \mean/finish_tmp , \gain/N865 , \gain/N648 ,
         \gain/N626 , \gain/MSB_B_r[1] , \gain/N478 , \gain/N456 ,
         \gain/finish_G_r , \gain/MSB_G_r[1] , \gain/N325 , \gain/N303 ,
         \gain/finish_R_r , \gain/MSB_R_r[1] , \gain/valid_r , \wb/last_tmp ,
         \C237/DATA2_0 , \C237/DATA2_1 , \C237/DATA2_2 , \C237/DATA2_3 ,
         \C237/DATA2_4 , \C237/DATA2_5 , \C237/DATA2_6 , \C237/DATA2_7 ,
         \C237/DATA2_8 , \C237/DATA2_9 , \C237/DATA2_10 , n1635, n1636, n1637,
         n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1647, n1648, n1649,
         n1650, n1651, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660,
         n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670,
         n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680,
         n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690,
         n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700,
         n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710,
         n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720,
         n1721, n1722, n1723, n1724, n1726, n1727, n1728, n1729, n1730, n1731,
         n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741,
         n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751,
         n1752, n1753, n1754, n1755, n1756, n1757, n1759, n1760, n1761, n1762,
         n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772,
         n1773, n1774, n1775, n1776, n1777, n1778, n1780, n1781, n1782, n1783,
         n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793,
         n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803,
         n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813,
         n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823,
         n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833,
         n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843,
         n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853,
         n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863,
         n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1873,
         n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883,
         n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893,
         n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903,
         n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913,
         n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923,
         n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933,
         n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943,
         n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953,
         n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963,
         n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973,
         n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983,
         n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993,
         n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003,
         n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013,
         n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023,
         n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033,
         n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043,
         n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053,
         n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063,
         n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073,
         n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083,
         n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093,
         n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103,
         n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113,
         n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123,
         n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133,
         n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2142, n2143,
         n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2153,
         n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163,
         n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173,
         n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183,
         n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193,
         n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203,
         n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213,
         n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223,
         n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233,
         n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243,
         n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253,
         n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263,
         n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273,
         n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283,
         n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291, n2292, n2293,
         n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301, n2302, n2303,
         n2304, \DP_OP_654J1_124_416/n147 , \DP_OP_654J1_124_416/n146 ,
         \DP_OP_654J1_124_416/n145 , \DP_OP_654J1_124_416/n144 ,
         \DP_OP_654J1_124_416/n143 , \DP_OP_654J1_124_416/n142 ,
         \DP_OP_654J1_124_416/n141 , \DP_OP_654J1_124_416/n140 ,
         \DP_OP_654J1_124_416/n139 , \DP_OP_654J1_124_416/n138 ,
         \DP_OP_654J1_124_416/n137 , \DP_OP_654J1_124_416/n136 ,
         \DP_OP_654J1_124_416/n135 , \DP_OP_654J1_124_416/n134 ,
         \DP_OP_654J1_124_416/n133 , \DP_OP_654J1_124_416/n132 ,
         \DP_OP_654J1_124_416/n131 , \DP_OP_654J1_124_416/n130 ,
         \DP_OP_654J1_124_416/n129 , \DP_OP_654J1_124_416/n128 ,
         \DP_OP_654J1_124_416/n127 , \DP_OP_654J1_124_416/n126 ,
         \DP_OP_654J1_124_416/n125 , \DP_OP_654J1_124_416/n124 ,
         \DP_OP_654J1_124_416/n123 , \DP_OP_654J1_124_416/n122 ,
         \DP_OP_654J1_124_416/n121 , \DP_OP_654J1_124_416/n120 ,
         \DP_OP_654J1_124_416/n119 , \DP_OP_654J1_124_416/n118 ,
         \DP_OP_654J1_124_416/n117 , \DP_OP_654J1_124_416/n116 ,
         \DP_OP_654J1_124_416/n115 , \DP_OP_654J1_124_416/n114 ,
         \DP_OP_654J1_124_416/n113 , \DP_OP_654J1_124_416/n112 ,
         \DP_OP_654J1_124_416/n111 , \DP_OP_654J1_124_416/n110 ,
         \DP_OP_654J1_124_416/n109 , \DP_OP_654J1_124_416/n108 ,
         \DP_OP_654J1_124_416/n107 , \DP_OP_654J1_124_416/n106 ,
         \DP_OP_654J1_124_416/n105 , \DP_OP_654J1_124_416/n104 ,
         \DP_OP_654J1_124_416/n103 , \DP_OP_654J1_124_416/n102 ,
         \DP_OP_654J1_124_416/n101 , \DP_OP_654J1_124_416/n100 ,
         \DP_OP_654J1_124_416/n99 , \DP_OP_654J1_124_416/n98 ,
         \DP_OP_654J1_124_416/n97 , \DP_OP_654J1_124_416/n96 ,
         \DP_OP_654J1_124_416/n95 , \DP_OP_654J1_124_416/n94 ,
         \DP_OP_654J1_124_416/n93 , \DP_OP_654J1_124_416/n92 ,
         \DP_OP_654J1_124_416/n91 , \DP_OP_654J1_124_416/n90 ,
         \DP_OP_654J1_124_416/n89 , \DP_OP_654J1_124_416/n88 ,
         \DP_OP_654J1_124_416/n87 , \DP_OP_654J1_124_416/n86 ,
         \DP_OP_654J1_124_416/n85 , \DP_OP_654J1_124_416/n84 ,
         \DP_OP_654J1_124_416/n83 , \DP_OP_654J1_124_416/n82 ,
         \DP_OP_654J1_124_416/n81 , \DP_OP_654J1_124_416/n80 ,
         \DP_OP_654J1_124_416/n79 , \DP_OP_654J1_124_416/n78 ,
         \DP_OP_654J1_124_416/n77 , \DP_OP_654J1_124_416/n76 ,
         \DP_OP_654J1_124_416/n75 , \DP_OP_654J1_124_416/n74 ,
         \DP_OP_654J1_124_416/n73 , \DP_OP_654J1_124_416/n72 ,
         \DP_OP_654J1_124_416/n71 , \DP_OP_654J1_124_416/n70 ,
         \DP_OP_654J1_124_416/n69 , \DP_OP_654J1_124_416/n68 ,
         \DP_OP_654J1_124_416/n67 , \DP_OP_654J1_124_416/n66 ,
         \DP_OP_654J1_124_416/n65 , \DP_OP_654J1_124_416/n64 ,
         \DP_OP_654J1_124_416/n63 , \DP_OP_654J1_124_416/n62 ,
         \DP_OP_654J1_124_416/n61 , \DP_OP_654J1_124_416/n60 ,
         \DP_OP_654J1_124_416/n59 , \DP_OP_654J1_124_416/n58 ,
         \DP_OP_654J1_124_416/n57 , \DP_OP_654J1_124_416/n56 ,
         \DP_OP_654J1_124_416/n55 , \DP_OP_654J1_124_416/n54 ,
         \DP_OP_654J1_124_416/n53 , \DP_OP_654J1_124_416/n52 ,
         \DP_OP_654J1_124_416/n51 , \DP_OP_654J1_124_416/n50 ,
         \DP_OP_654J1_124_416/n49 , \DP_OP_654J1_124_416/n48 ,
         \DP_OP_654J1_124_416/n47 , \DP_OP_654J1_124_416/n46 ,
         \DP_OP_654J1_124_416/n45 , \DP_OP_654J1_124_416/n44 ,
         \DP_OP_654J1_124_416/n43 , \DP_OP_654J1_124_416/n42 ,
         \DP_OP_654J1_124_416/n41 , \DP_OP_654J1_124_416/n40 ,
         \DP_OP_654J1_124_416/n39 , \DP_OP_654J1_124_416/n38 ,
         \DP_OP_654J1_124_416/n37 , \DP_OP_654J1_124_416/n36 ,
         \DP_OP_654J1_124_416/n35 , \DP_OP_654J1_124_416/n34 ,
         \DP_OP_654J1_124_416/n33 , \DP_OP_654J1_124_416/n32 ,
         \DP_OP_654J1_124_416/n31 , \DP_OP_654J1_124_416/n30 ,
         \DP_OP_654J1_124_416/n29 , \DP_OP_654J1_124_416/n28 ,
         \DP_OP_654J1_124_416/n27 , \DP_OP_654J1_124_416/n26 ,
         \DP_OP_654J1_124_416/n25 , \DP_OP_654J1_124_416/n24 ,
         \DP_OP_654J1_124_416/n23 , \DP_OP_654J1_124_416/n22 ,
         \DP_OP_654J1_124_416/n21 , \DP_OP_654J1_124_416/n20 ,
         \DP_OP_654J1_124_416/n19 , \DP_OP_654J1_124_416/n18 ,
         \DP_OP_654J1_124_416/n17 , \DP_OP_654J1_124_416/n16 ,
         \DP_OP_654J1_124_416/n15 , \DP_OP_654J1_124_416/n14 ,
         \DP_OP_654J1_124_416/n13 , \DP_OP_654J1_124_416/n12 ,
         \DP_OP_654J1_124_416/n11 , \DP_OP_654J1_124_416/n10 ,
         \DP_OP_654J1_124_416/n9 , \DP_OP_654J1_124_416/n8 ,
         \DP_OP_654J1_124_416/n7 , \DP_OP_654J1_124_416/n6 ,
         \DP_OP_654J1_124_416/n5 , \DP_OP_654J1_124_416/n4 ,
         \DP_OP_654J1_124_416/n3 , \DP_OP_654J1_124_416/n2 ,
         \DP_OP_654J1_124_416/n1 , \intadd_0/CI , \intadd_0/SUM[10] ,
         \intadd_0/SUM[9] , \intadd_0/SUM[8] , \intadd_0/SUM[7] ,
         \intadd_0/SUM[6] , \intadd_0/SUM[5] , \intadd_0/SUM[4] ,
         \intadd_0/SUM[3] , \intadd_0/SUM[2] , \intadd_0/SUM[1] ,
         \intadd_0/SUM[0] , \intadd_0/n11 , \intadd_0/n10 , \intadd_0/n9 ,
         \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 ,
         \intadd_1/A[8] , \intadd_1/A[3] , \intadd_1/A[2] , \intadd_1/A[1] ,
         \intadd_1/B[9] , \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] ,
         \intadd_1/B[4] , \intadd_1/n10 , \intadd_1/n9 , \intadd_1/n8 ,
         \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , \intadd_2/CI ,
         \intadd_2/SUM[8] , \intadd_2/SUM[7] , \intadd_2/SUM[6] ,
         \intadd_2/SUM[5] , \intadd_2/SUM[4] , \intadd_2/SUM[3] ,
         \intadd_2/SUM[2] , \intadd_2/SUM[1] , \intadd_2/SUM[0] ,
         \intadd_2/n9 , \intadd_2/n8 , \intadd_2/n7 , \intadd_2/n6 ,
         \intadd_2/n5 , \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 ,
         \intadd_2/n1 , \intadd_3/CI , \intadd_3/n8 , \intadd_3/n7 ,
         \intadd_3/n6 , \intadd_3/n5 , \intadd_3/n4 , \intadd_3/n3 ,
         \intadd_3/n2 , \intadd_3/n1 , \intadd_4/A[7] , \intadd_4/A[6] ,
         \intadd_4/A[5] , \intadd_4/A[4] , \intadd_4/A[3] , \intadd_4/A[2] ,
         \intadd_4/B[7] , \intadd_4/B[6] , \intadd_4/B[5] , \intadd_4/B[4] ,
         \intadd_4/B[3] , \intadd_4/B[2] , \intadd_4/B[1] , \intadd_4/n8 ,
         \intadd_4/n7 , \intadd_4/n6 , \intadd_4/n5 , \intadd_4/n4 ,
         \intadd_4/n3 , \intadd_4/n2 , \intadd_4/n1 , \intadd_5/CI ,
         \intadd_5/SUM[5] , \intadd_5/SUM[4] , \intadd_5/SUM[3] ,
         \intadd_5/SUM[2] , \intadd_5/SUM[1] , \intadd_5/SUM[0] ,
         \intadd_5/n6 , \intadd_5/n5 , \intadd_5/n4 , \intadd_5/n3 ,
         \intadd_5/n2 , \intadd_5/n1 , \intadd_6/CI , \intadd_6/SUM[3] ,
         \intadd_6/SUM[2] , \intadd_6/SUM[1] , \intadd_6/SUM[0] ,
         \intadd_6/n4 , \intadd_6/n3 , \intadd_6/n2 , \intadd_6/n1 , n2308,
         n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, n2318,
         n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, n2328,
         n2329, n2330, n2332, n2334, n2336, n2338, n2340, n2342, n2344, n2346,
         n2348, n2350, n2352, n2354, n2356, n2358, n2359, n2360, n2361, n2362,
         n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371, n2372,
         n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381, n2382,
         n2383, n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391, n2392,
         n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401, n2402,
         n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411, n2412,
         n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422,
         n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431, n2432,
         n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441, n2442,
         n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451, n2452,
         n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461, n2462,
         n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471, n2472,
         n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481, n2482,
         n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491, n2492,
         n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501, n2502,
         n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511, n2512,
         n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521, n2522,
         n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531, n2532,
         n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541, n2542,
         n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551, n2552,
         n2553, n2554, n2555, n2556, n2557, n2558, n2559, n2560, n2561, n2562,
         n2563, n2564, n2565, n2566, n2567, n2568, n2569, n2570, n2571, n2572,
         n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581, n2582,
         n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591, n2592,
         n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601, n2602,
         n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611, n2612,
         n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621, n2622,
         n2623, n2624, n2625, n2626, n2627, n2628, n2629, n2630, n2631, n2632,
         n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641, n2642,
         n2643, n2644, n2645, n2646, n2647, n2648, n2649, n2650, n2651, n2652,
         n2653, n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661, n2662,
         n2663, n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671, n2672,
         n2673, n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681, n2682,
         n2683, n2684, n2685, n2686, n2687, n2688, n2689, n2690, n2691, n2692,
         n2693, n2694, n2695, n2696, n2697, n2698, n2699, n2700, n2701, n2702,
         n2703, n2704, n2705, n2706, n2707, n2708, n2709, n2710, n2711, n2712,
         n2713, n2714, n2715, n2716, n2717, n2718, n2719, n2720, n2721, n2722,
         n2723, n2724, n2725, n2726, n2727, n2728, n2729, n2730, n2731, n2732,
         n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741, n2742,
         n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751, n2752,
         n2753, n2754, n2755, n2756, n2757, n2758, n2759, n2760, n2761, n2762,
         n2763, n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772,
         n2773, n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782,
         n2783, n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791, n2792,
         n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801, n2802,
         n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811, n2812,
         n2813, n2814, n2815, n2816, n2817, n2818, n2819, n2820, n2821, n2822,
         n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830, n2831, n2832,
         n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840, n2841, n2842,
         n2843, n2844, n2845, n2846, n2847, n2848, n2849, n2850, n2851, n2852,
         n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860, n2861, n2862,
         n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870, n2871, n2872,
         n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880, n2881, n2882,
         n2883, n2884, n2885, n2886, n2887, n2888, n2889, n2890, n2891, n2892,
         n2893, n2894, n2895, n2896, n2897, n2898, n2899, n2900, n2901, n2902,
         n2903, n2904, n2905, n2906, n2907, n2908, n2909, n2910, n2911, n2912,
         n2913, n2914, n2915, n2916, n2917, n2918, n2919, n2920, n2921, n2922,
         n2923, n2924, n2925, n2926, n2927, n2928, n2929, n2930, n2931, n2932,
         n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942,
         n2943, n2944, n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952,
         n2953, n2954, n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962,
         n2963, n2964, n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972,
         n2973, n2974, n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982,
         n2983, n2984, n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992,
         n2993, n2994, n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002,
         n3003, n3004, n3005, n3006, n3007, n3008, n3009, n3010, n3011, n3012,
         n3013, n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022,
         n3023, n3024, n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032,
         n3033, n3034, n3035, n3036, n3037, n3038, n3039, n3040, n3041, n3042,
         n3043, n3044, n3045, n3046, n3047, n3048, n3049, n3050, n3051, n3052,
         n3053, n3054, n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062,
         n3063, n3064, n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072,
         n3073, n3074, n3075, n3076, n3077, n3078, n3079, n3080, n3081, n3082,
         n3083, n3084, n3085, n3086, n3087, n3088, n3089, n3090, n3091, n3092,
         n3093, n3094, n3095, n3096, n3097, n3098, n3099, n3100, n3101, n3102,
         n3103, n3104, n3105, n3106, n3107, n3108, n3109, n3110, n3111, n3112,
         n3113, n3114, n3115, n3116, n3117, n3118, n3119, n3120, n3121, n3122,
         n3123, n3124, n3125, n3126, n3127, n3128, n3129, n3130, n3131, n3132,
         n3133, n3134, n3135, n3136, n3137, n3138, n3139, n3140, n3141, n3142,
         n3143, n3144, n3145, n3146, n3147, n3148, n3149, n3150, n3151, n3152,
         n3153, n3154, n3155, n3156, n3157, n3158, n3159, n3160, n3161, n3162,
         n3163, n3164, n3165, n3166, n3167, n3168, n3169, n3170, n3171, n3172,
         n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180, n3181, n3182,
         n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190, n3191, n3192,
         n3193, n3194, n3195, n3196, n3197, n3198, n3199, n3200, n3201, n3202,
         n3203, n3204, n3205, n3206, n3207, n3208, n3209, n3210, n3211, n3212,
         n3213, n3214, n3215, n3216, n3217, n3218, n3219, n3220, n3221, n3222,
         n3223, n3224, n3225, n3226, n3227, n3228, n3229, n3230, n3231, n3232,
         n3233, n3234, n3235, n3236, n3237, n3238, n3239, n3240, n3241, n3242,
         n3243, n3244, n3245, n3246, n3247, n3248, n3249, n3250, n3251, n3252,
         n3253, n3254, n3255, n3256, n3257, n3258, n3259, n3260, n3261, n3262,
         n3263, n3264, n3265, n3266, n3267, n3268, n3269, n3270, n3271, n3272,
         n3273, n3274, n3275, n3276, n3277, n3278, n3279, n3280, n3281, n3282,
         n3283, n3284, n3285, n3286, n3287, n3288, n3289, n3290, n3291, n3292,
         n3293, n3294, n3295, n3296, n3297, n3298, n3299, n3300, n3301, n3302,
         n3303, n3304, n3305, n3306, n3307, n3308, n3309, n3310, n3311, n3312,
         n3313, n3314, n3315, n3316, n3317, n3318, n3319, n3320, n3321, n3322,
         n3323, n3324, n3325, n3326, n3327, n3328, n3329, n3330, n3331, n3332,
         n3333, n3334, n3335, n3336, n3337, n3338, n3339, n3340, n3341, n3342,
         n3343, n3344, n3345, n3346, n3347, n3348, n3349, n3350, n3351, n3352,
         n3353, n3354, n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3362,
         n3363, n3364, n3365, n3366, n3367, n3368, n3369, n3370, n3371, n3372,
         n3373, n3374, n3375, n3376, n3377, n3378, n3379, n3380, n3381, n3382,
         n3383, n3384, n3385, n3386, n3387, n3388, n3389, n3390, n3391, n3392,
         n3393, n3394, n3395, n3396, n3397, n3398, n3399, n3400, n3401, n3402,
         n3403, n3404, n3405, n3406, n3407, n3408, n3409, n3410, n3411, n3412,
         n3413, n3414, n3415, n3416, n3417, n3418, n3419, n3420, n3421, n3422,
         n3423, n3424, n3425, n3426, n3427, n3428, n3429, n3430, n3431, n3432,
         n3433, n3434, n3435, n3436, n3437, n3438, n3439, n3440, n3441, n3442,
         n3443, n3444, n3445, n3446, n3447, n3448, n3449, n3450, n3451, n3452,
         n3453, n3454, n3455, n3456, n3457, n3458, n3459, n3460, n3461, n3462,
         n3463, n3464, n3465, n3466, n3467, n3468, n3469, n3470, n3471, n3472,
         n3473, n3474, n3475, n3476, n3477, n3478, n3479, n3480, n3481, n3482,
         n3483, n3484, n3485, n3486, n3487, n3488, n3489, n3490, n3491, n3492,
         n3493, n3494, n3495, n3496, n3497, n3498, n3499, n3500, n3501, n3502,
         n3503, n3504, n3505, n3506, n3507, n3508, n3509, n3510, n3511, n3512,
         n3513, n3514, n3515, n3516, n3517, n3518, n3519, n3520, n3521, n3522,
         n3523, n3524, n3525, n3526, n3527, n3528, n3529, n3530, n3531, n3532,
         n3533, n3534, n3535, n3536, n3537, n3538, n3539, n3540, n3541, n3542,
         n3543, n3544, n3545, n3546, n3547, n3548, n3549, n3550, n3551, n3552,
         n3553, n3554, n3555, n3556, n3557, n3558, n3559, n3560, n3561, n3562,
         n3563, n3564, n3565, n3566, n3567, n3568, n3569, n3570, n3571, n3572,
         n3573, n3574, n3575, n3576, n3577, n3578, n3579, n3580, n3581, n3582,
         n3583, n3584, n3585, n3586, n3587, n3588, n3589, n3590, n3591, n3592,
         n3593, n3594, n3595, n3596, n3597, n3598, n3599, n3600, n3601, n3602,
         n3603, n3604, n3605, n3606, n3607, n3608, n3609, n3610, n3611, n3612,
         n3613, n3614, n3615, n3616, n3617, n3618, n3619, n3620, n3621, n3622,
         n3623, n3624, n3625, n3626, n3627, n3628, n3629, n3630, n3631, n3632,
         n3633, n3634, n3635, n3636, n3637, n3638, n3639, n3640, n3641, n3642,
         n3643, n3644, n3645, n3646, n3647, n3648, n3649, n3650, n3651, n3652,
         n3653, n3654, n3655, n3656, n3657, n3658, n3659, n3660, n3661, n3662,
         n3663, n3664, n3665, n3666, n3667, n3668, n3669, n3670, n3671, n3672,
         n3673, n3674, n3675, n3676, n3677, n3678, n3679, n3680, n3681, n3682,
         n3683, n3684, n3685, n3686, n3687, n3688, n3689, n3690, n3691, n3692,
         n3693, n3694, n3695, n3696, n3697, n3698, n3699, n3700, n3701, n3702,
         n3703, n3704, n3705, n3706, n3707, n3708, n3709, n3710, n3711, n3712,
         n3713, n3714, n3715, n3716, n3717, n3718, n3719, n3720, n3721, n3722,
         n3723, n3724, n3725, n3726, n3727, n3728, n3729, n3730, n3731, n3732,
         n3733, n3734, n3735, n3736, n3737, n3738, n3739, n3740, n3741, n3742,
         n3743, n3744, n3745, n3746, n3747, n3748, n3749, n3750, n3751, n3752,
         n3753, n3754, n3755, n3756, n3757, n3758, n3759, n3760, n3761, n3762,
         n3763, n3764, n3765, n3766, n3767, n3768, n3769, n3770, n3771, n3772,
         n3773, n3774, n3775, n3776, n3777, n3778, n3779, n3780, n3781, n3782,
         n3783, n3784, n3785, n3786, n3787, n3788, n3789, n3790, n3791, n3792,
         n3793, n3794, n3795, n3796, n3797, n3798, n3799, n3800, n3801, n3802,
         n3803, n3804, n3805, n3806, n3807, n3808, n3809, n3810, n3811, n3812,
         n3813, n3814, n3815, n3816, n3817, n3818, n3819, n3820, n3821, n3822,
         n3823, n3824, n3825, n3826, n3827, n3828, n3829, n3830, n3831, n3832,
         n3833, n3834, n3835, n3836, n3837, n3838, n3839, n3840, n3841, n3842,
         n3843, n3844, n3845, n3846, n3847, n3848, n3849, n3850, n3851, n3852,
         n3853, n3854, n3855, n3856, n3857, n3858, n3859, n3860, n3861, n3862,
         n3863, n3864, n3865, n3866, n3867, n3868, n3869, n3870, n3871, n3872,
         n3873, n3874, n3875, n3876, n3877, n3878, n3879, n3880, n3881, n3882,
         n3883, n3884, n3885, n3886, n3887, n3888, n3889, n3890, n3891, n3892,
         n3893, n3894, n3895, n3896, n3897, n3898, n3899, n3900, n3901, n3902,
         n3903, n3904, n3905, n3906, n3907, n3908, n3909, n3910, n3911, n3912,
         n3913, n3914, n3915, n3916, n3917, n3918, n3919, n3920;
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

  demosaic demosaic ( .clk(clk), .rst_n(n3918), .valid(valid_in_dem), 
        .data_in(pixel_in_dem), .end_col(last_col_in_dem), .end_pic(
        last_pic_in_dem), .RGB_valid(valid_out_dem), .RGB_data(pixel_out_dem), 
        .color(color_out_dem), .col_last(last_col_out_dem), .pic_last(
        last_pic_out_dem) );
  gamma_122 gamma ( .clk(clk), .rst_n(n3919), .pixel_in(pixel_in_gamma), 
        .valid_in(valid_in_gamma), .color_in(color_in_gamma), .last_pic_in(
        last_pic_in_gamma), .pixel_out(pixel_out_gamma), .valid_out(
        valid_out_gamma), .color_out(color_out_gamma), .last_pic_out(
        last_pic_out_gamma) );
  DFFRX1 \pixel_in_reg_reg[7]  ( .D(pixel_in[7]), .CK(clk), .RN(n3918), .Q(
        pixel_in_wb[7]), .QN(n3876) );
  DFFRX1 \pixel_in_reg_reg[6]  ( .D(pixel_in[6]), .CK(clk), .RN(n3919), .Q(
        pixel_in_wb[6]), .QN(n3868) );
  DFFRX1 \pixel_in_reg_reg[5]  ( .D(pixel_in[5]), .CK(clk), .RN(n2621), .Q(
        pixel_in_wb[5]), .QN(n3867) );
  DFFRX1 \pixel_in_reg_reg[4]  ( .D(pixel_in[4]), .CK(clk), .RN(n2621), .Q(
        pixel_in_wb[4]) );
  DFFRX1 \pixel_in_reg_reg[3]  ( .D(pixel_in[3]), .CK(clk), .RN(n3919), .Q(
        pixel_in_wb[3]), .QN(n3877) );
  DFFRX1 \pixel_in_reg_reg[2]  ( .D(pixel_in[2]), .CK(clk), .RN(n3918), .Q(
        pixel_in_wb[2]), .QN(n3878) );
  DFFRX1 \pixel_in_reg_reg[1]  ( .D(pixel_in[1]), .CK(clk), .RN(n2621), .Q(
        pixel_in_wb[1]), .QN(n3866) );
  DFFRX1 \pixel_in_reg_reg[0]  ( .D(pixel_in[0]), .CK(clk), .RN(n2556), .Q(
        pixel_in_wb[0]), .QN(n3879) );
  DFFRX1 valid_in_reg_reg ( .D(valid_in), .CK(clk), .RN(n3919), .Q(
        valid_value_in_wb), .QN(n3813) );
  DFFRX1 last_col_in_reg_reg ( .D(last_col_in), .CK(clk), .RN(n3917), .Q(
        last_col_in_reg) );
  DFFRX1 last_pic_in_reg_reg ( .D(last_pic_in), .CK(clk), .RN(n2621), .Q(
        last_pic_in_wb) );
  DFFRX1 \mode_reg_reg[2]  ( .D(mode_in[2]), .CK(clk), .RN(n2621), .Q(
        mode_reg[2]), .QN(n3751) );
  DFFRX1 \mode_reg_reg[1]  ( .D(mode_in[1]), .CK(clk), .RN(n2556), .Q(
        mode_reg[1]), .QN(n3701) );
  DFFRX1 \mode_reg_reg[0]  ( .D(mode_in[0]), .CK(clk), .RN(n3919), .Q(
        mode_reg[0]), .QN(n3630) );
  DFFRX1 \denoise/new_sum6_reg[0]  ( .D(\denoise/n_new_sum6 [0]), .CK(clk), 
        .RN(n3914), .Q(\denoise/new_sum6 [0]) );
  DFFRX1 \denoise/new_sum6_reg[1]  ( .D(\denoise/n_new_sum6 [1]), .CK(clk), 
        .RN(n3918), .Q(\denoise/new_sum6 [1]) );
  DFFRX1 \denoise/new_sum6_reg[2]  ( .D(\denoise/n_new_sum6 [2]), .CK(clk), 
        .RN(n3918), .Q(\denoise/new_sum6 [2]) );
  DFFRX1 \denoise/new_sum6_reg[3]  ( .D(\denoise/n_new_sum6 [3]), .CK(clk), 
        .RN(n2556), .Q(\denoise/new_sum6 [3]) );
  DFFRX1 \denoise/new_sum6_reg[4]  ( .D(\denoise/n_new_sum6 [4]), .CK(clk), 
        .RN(n3918), .Q(\denoise/new_sum6 [4]) );
  DFFRX1 \denoise/new_sum6_reg[5]  ( .D(\denoise/n_new_sum6 [5]), .CK(clk), 
        .RN(n3911), .Q(\denoise/new_sum6 [5]) );
  DFFRX1 \denoise/new_sum6_reg[6]  ( .D(\denoise/n_new_sum6 [6]), .CK(clk), 
        .RN(n3919), .Q(\denoise/new_sum6 [6]) );
  DFFRX1 \denoise/new_sum6_reg[7]  ( .D(\denoise/n_new_sum6 [7]), .CK(clk), 
        .RN(n3913), .Q(\denoise/new_sum6 [7]) );
  DFFRX1 \denoise/new_sum6_reg[8]  ( .D(\denoise/n_new_sum6 [8]), .CK(clk), 
        .RN(n2556), .Q(\denoise/new_sum6 [8]) );
  DFFRX1 \denoise/new_sum6_reg[9]  ( .D(\denoise/n_new_sum6 [9]), .CK(clk), 
        .RN(n3919), .Q(\denoise/new_sum6 [9]) );
  DFFRX1 \denoise/sum9_reg[0]  ( .D(\denoise/n_sum9 [0]), .CK(clk), .RN(n3919), 
        .Q(\denoise/sum9 [0]) );
  DFFRX1 \denoise/sum9_reg[1]  ( .D(\denoise/n_sum9 [1]), .CK(clk), .RN(n3912), 
        .Q(\denoise/sum9 [1]), .QN(n3869) );
  DFFRX1 \denoise/sum9_reg[2]  ( .D(\denoise/n_sum9 [2]), .CK(clk), .RN(rst_n), 
        .Q(\denoise/sum9 [2]), .QN(n3812) );
  DFFRX1 \denoise/sum9_reg[3]  ( .D(\denoise/n_sum9 [3]), .CK(clk), .RN(n3910), 
        .Q(\denoise/sum9 [3]), .QN(n3811) );
  DFFRX1 \denoise/sum9_reg[4]  ( .D(\denoise/n_sum9 [4]), .CK(clk), .RN(n3918), 
        .Q(\denoise/sum9 [4]), .QN(n3770) );
  DFFRX1 \denoise/sum9_reg[5]  ( .D(\denoise/n_sum9 [5]), .CK(clk), .RN(n3911), 
        .Q(\denoise/sum9 [5]), .QN(n3752) );
  DFFRX1 \denoise/sum9_reg[6]  ( .D(\denoise/n_sum9 [6]), .CK(clk), .RN(n2556), 
        .Q(\denoise/sum9 [6]), .QN(n3732) );
  DFFRX1 \denoise/sum9_reg[7]  ( .D(\denoise/n_sum9 [7]), .CK(clk), .RN(n3913), 
        .Q(\denoise/sum9 [7]), .QN(n3718) );
  DFFRX1 \denoise/sum9_reg[8]  ( .D(\denoise/n_sum9 [8]), .CK(clk), .RN(n3918), 
        .Q(\denoise/sum9 [8]), .QN(n3714) );
  DFFRX1 \denoise/sum9_reg[9]  ( .D(\denoise/n_sum9 [9]), .CK(clk), .RN(n3919), 
        .Q(\denoise/sum9 [9]) );
  DFFRX1 \denoise/sum9_reg[10]  ( .D(\denoise/n_sum9 [10]), .CK(clk), .RN(
        n3919), .Q(\denoise/sum9 [10]) );
  DFFRX1 \denoise/sum9_reg[11]  ( .D(\denoise/n_sum9 [11]), .CK(clk), .RN(
        n3912), .Q(\denoise/sum9 [11]), .QN(n3707) );
  DFFRX1 \denoise/pixel_out_reg_reg[0]  ( .D(\denoise/n_pixel_out_reg [0]), 
        .CK(clk), .RN(n2621), .Q(pixel_out_den[0]) );
  DFFRX1 \denoise/pixel_out_reg_reg[1]  ( .D(\denoise/n_pixel_out_reg [1]), 
        .CK(clk), .RN(n3916), .Q(pixel_out_den[1]) );
  DFFRX1 \denoise/pixel_out_reg_reg[2]  ( .D(\denoise/n_pixel_out_reg [2]), 
        .CK(clk), .RN(n3915), .Q(pixel_out_den[2]) );
  DFFRX1 \denoise/pixel_out_reg_reg[3]  ( .D(\denoise/n_pixel_out_reg [3]), 
        .CK(clk), .RN(n3919), .Q(pixel_out_den[3]) );
  DFFRX1 \denoise/pixel_out_reg_reg[4]  ( .D(\denoise/n_pixel_out_reg [4]), 
        .CK(clk), .RN(n2556), .Q(pixel_out_den[4]) );
  DFFRX1 \denoise/pixel_out_reg_reg[5]  ( .D(\denoise/n_pixel_out_reg [5]), 
        .CK(clk), .RN(n3910), .Q(pixel_out_den[5]) );
  DFFRX1 \denoise/pixel_out_reg_reg[6]  ( .D(\denoise/n_pixel_out_reg [6]), 
        .CK(clk), .RN(n3918), .Q(pixel_out_den[6]) );
  DFFRX1 \denoise/pixel_out_reg_reg[7]  ( .D(\denoise/n_pixel_out_reg [7]), 
        .CK(clk), .RN(n3915), .Q(pixel_out_den[7]) );
  DFFRX1 \denoise/last_pic_in_reg_reg  ( .D(last_pic_in_den), .CK(clk), .RN(
        n2621), .Q(\denoise/n_last_pic_1 ) );
  DFFRX1 \denoise/last_pic_1_reg  ( .D(\denoise/n_last_pic_1 ), .CK(clk), .RN(
        n3915), .Q(\denoise/n_last_pic_2 ) );
  DFFRX1 \denoise/last_col_in_reg_reg  ( .D(last_col_in_den), .CK(clk), .RN(
        n2556), .Q(\denoise/n_last_col_1 ) );
  DFFRX1 \denoise/last_col_1_reg  ( .D(\denoise/n_last_col_1 ), .CK(clk), .RN(
        n3910), .Q(\denoise/n_last_col_2 ), .QN(n3870) );
  DFFRX1 \denoise/last_col_2_reg  ( .D(\denoise/n_last_col_2 ), .CK(clk), .RN(
        n3910), .Q(\denoise/n_last_col_out_reg ) );
  DFFRX1 \denoise/last_col_out_reg_reg  ( .D(\denoise/n_last_col_out_reg ), 
        .CK(clk), .RN(n3910), .Q(last_col_out_den) );
  DFFRX1 \denoise/valid_in_reg_reg  ( .D(valid_in_den), .CK(clk), .RN(n3910), 
        .Q(\denoise/valid_in_reg ), .QN(n3849) );
  DFFRX1 \denoise/state_0_reg[0]  ( .D(n2279), .CK(clk), .RN(n3910), .Q(
        \denoise/n_state_1 [0]) );
  DFFRX1 \denoise/state_1_reg[0]  ( .D(\denoise/n_state_1 [0]), .CK(clk), .RN(
        n3910), .Q(\denoise/n_state_2 [0]) );
  DFFRX1 \denoise/state_2_reg[0]  ( .D(\denoise/n_state_2 [0]), .CK(clk), .RN(
        n3910), .Q(\denoise/state_2 [0]) );
  DFFRX1 \denoise/init_12_last_flag_reg  ( .D(n2278), .CK(clk), .RN(n3910), 
        .Q(\denoise/init_12_last_flag ) );
  DFFRX1 \denoise/state_0_reg[1]  ( .D(n2280), .CK(clk), .RN(n3910), .Q(
        \denoise/n_state_1 [1]) );
  DFFRX1 \denoise/state_1_reg[1]  ( .D(\denoise/n_state_1 [1]), .CK(clk), .RN(
        n3910), .Q(\denoise/n_state_2 [1]) );
  DFFRX1 \denoise/state_2_reg[1]  ( .D(\denoise/n_state_2 [1]), .CK(clk), .RN(
        n3910), .Q(\denoise/state_2 [1]) );
  DFFRX1 \denoise/counter_0_reg[2]  ( .D(n2283), .CK(clk), .RN(n3910), .Q(
        \denoise/n_counter_1 [2]), .QN(n3757) );
  DFFRX1 \denoise/counter_1_reg[2]  ( .D(\denoise/n_counter_1 [2]), .CK(clk), 
        .RN(n3910), .Q(\denoise/counter_1 [2]), .QN(n3756) );
  DFFRX1 \denoise/counter_1_reg[0]  ( .D(\denoise/n_counter_1 [0]), .CK(clk), 
        .RN(n3910), .Q(\denoise/counter_1 [0]) );
  DFFRX1 \denoise/counter_0_reg[1]  ( .D(n2282), .CK(clk), .RN(n3910), .Q(
        \denoise/n_counter_1 [1]), .QN(n2377) );
  DFFRX1 \denoise/counter_1_reg[1]  ( .D(\denoise/n_counter_1 [1]), .CK(clk), 
        .RN(n3910), .Q(\denoise/counter_1 [1]), .QN(n3622) );
  DFFRX1 \denoise/color_1_reg[0]  ( .D(n2277), .CK(clk), .RN(n3910), .Q(
        \denoise/n_color_2 [0]), .QN(n2376) );
  DFFRX1 \denoise/color_1_reg[1]  ( .D(n2276), .CK(clk), .RN(n3910), .Q(
        \denoise/n_color_2 [1]), .QN(n2375) );
  DFFRX1 \denoise/pixel_in_reg_reg[0]  ( .D(pixel_in_den[0]), .CK(clk), .RN(
        n3910), .Q(\denoise/pixel_in_reg [0]) );
  DFFRX1 \denoise/pos9_reg[0]  ( .D(n2275), .CK(clk), .RN(n3910), .Q(
        \denoise/pos9 [0]) );
  DFFRX1 \denoise/second_col_r_reg[5][0]  ( .D(n2274), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[5][0] ), .QN(n3663) );
  DFFRX1 \denoise/second_col_r_reg[4][0]  ( .D(n2273), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[4][0] ), .QN(n3855) );
  DFFRX1 \denoise/second_col_r_reg[3][0]  ( .D(n2272), .CK(clk), .RN(n3910), 
        .QN(n3625) );
  DFFRX1 \denoise/second_col_r_reg[2][0]  ( .D(n2271), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[2][0] ), .QN(n3822) );
  DFFRX1 \denoise/second_col_r_reg[1][0]  ( .D(n2270), .CK(clk), .RN(n3910), 
        .QN(n3780) );
  DFFRX1 \denoise/second_col_r_reg[0][0]  ( .D(n2269), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[0][0] ) );
  DFFRX1 \denoise/first_col_r_reg[5][0]  ( .D(n2268), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[5][0] ) );
  DFFRX1 \denoise/first_col_r_reg[4][0]  ( .D(n2267), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[4][0] ) );
  DFFRX1 \denoise/first_col_r_reg[3][0]  ( .D(n2266), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[3][0] ) );
  DFFRX1 \denoise/first_col_r_reg[2][0]  ( .D(n2265), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[2][0] ) );
  DFFRX1 \denoise/first_col_r_reg[1][0]  ( .D(n2264), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[1][0] ) );
  DFFRX1 \denoise/first_col_r_reg[0][0]  ( .D(n2263), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_r[0][0] ) );
  DFFRX1 \denoise/second_col_g_reg[0][0]  ( .D(n2262), .CK(clk), .RN(n3910), 
        .QN(n3662) );
  DFFRX1 \denoise/second_col_g_reg[1][0]  ( .D(n2261), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_g[1][0] ) );
  DFFRX1 \denoise/second_col_g_reg[2][0]  ( .D(n2260), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_g[2][0] ), .QN(n3681) );
  DFFRX1 \denoise/second_col_g_reg[3][0]  ( .D(n2259), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_g[3][0] ) );
  DFFRX1 \denoise/second_col_g_reg[4][0]  ( .D(n2258), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_g[4][0] ) );
  DFFRX1 \denoise/second_col_g_reg[5][0]  ( .D(n2257), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_g[5][0] ), .QN(n3792) );
  DFFRX1 \denoise/first_col_g_reg[0][0]  ( .D(n2256), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[0][0] ) );
  DFFRX1 \denoise/first_col_g_reg[1][0]  ( .D(n2255), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[1][0] ) );
  DFFRX1 \denoise/first_col_g_reg[2][0]  ( .D(n2254), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[2][0] ) );
  DFFRX1 \denoise/first_col_g_reg[3][0]  ( .D(n2253), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[3][0] ) );
  DFFRX1 \denoise/first_col_g_reg[4][0]  ( .D(n2252), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[4][0] ) );
  DFFRX1 \denoise/first_col_g_reg[5][0]  ( .D(n2251), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_g[5][0] ) );
  DFFRX1 \denoise/second_col_b_reg[0][0]  ( .D(n2250), .CK(clk), .RN(n3910), 
        .QN(n3626) );
  DFFRX1 \denoise/second_col_b_reg[1][0]  ( .D(n2249), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_b[1][0] ), .QN(n3850) );
  DFFRX1 \denoise/second_col_b_reg[2][0]  ( .D(n2248), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_b[2][0] ), .QN(n3823) );
  DFFRX1 \denoise/second_col_b_reg[3][0]  ( .D(n2247), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_b[3][0] ) );
  DFFRX1 \denoise/second_col_b_reg[4][0]  ( .D(n2246), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_b[4][0] ) );
  DFFRX1 \denoise/second_col_b_reg[5][0]  ( .D(n2245), .CK(clk), .RN(n3910), 
        .QN(n3771) );
  DFFRX1 \denoise/first_col_b_reg[0][0]  ( .D(n2244), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[0][0] ) );
  DFFRX1 \denoise/first_col_b_reg[1][0]  ( .D(n2243), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[1][0] ) );
  DFFRX1 \denoise/first_col_b_reg[2][0]  ( .D(n2242), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[2][0] ) );
  DFFRX1 \denoise/first_col_b_reg[3][0]  ( .D(n2241), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[3][0] ) );
  DFFRX1 \denoise/first_col_b_reg[4][0]  ( .D(n2240), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[4][0] ) );
  DFFRX1 \denoise/first_col_b_reg[5][0]  ( .D(n2239), .CK(clk), .RN(n3910), 
        .Q(\denoise/first_col_b[5][0] ) );
  DFFRX1 \denoise/pos7_reg[0]  ( .D(n1971), .CK(clk), .RN(n3910), .Q(
        \denoise/pos7 [0]) );
  DFFRX1 \denoise/pos8_reg[0]  ( .D(n1985), .CK(clk), .RN(n3910), .Q(
        \denoise/pos8 [0]) );
  DFFRX1 \denoise/pixel_in_reg_reg[1]  ( .D(pixel_in_den[1]), .CK(clk), .RN(
        n3910), .Q(\denoise/pixel_in_reg [1]) );
  DFFRX1 \denoise/pos9_reg[1]  ( .D(n2238), .CK(clk), .RN(n3910), .Q(
        \denoise/pos9 [1]) );
  DFFRX1 \denoise/second_col_r_reg[5][1]  ( .D(n2237), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[5][1] ), .QN(n3664) );
  DFFRX1 \denoise/second_col_r_reg[4][1]  ( .D(n2236), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[4][1] ), .QN(n3856) );
  DFFRX1 \denoise/second_col_r_reg[3][1]  ( .D(n2235), .CK(clk), .RN(n3910), 
        .QN(n3781) );
  DFFRX1 \denoise/second_col_r_reg[2][1]  ( .D(n2234), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[2][1] ), .QN(n3840) );
  DFFRX1 \denoise/second_col_r_reg[1][1]  ( .D(n2233), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[1][1] ) );
  DFFRX1 \denoise/second_col_r_reg[0][1]  ( .D(n2232), .CK(clk), .RN(n3910), 
        .Q(\denoise/second_col_r[0][1] ) );
  DFFRX1 \denoise/first_col_r_reg[5][1]  ( .D(n2231), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[5][1] ) );
  DFFRX1 \denoise/first_col_r_reg[4][1]  ( .D(n2230), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[4][1] ) );
  DFFRX1 \denoise/first_col_r_reg[3][1]  ( .D(n2229), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[3][1] ) );
  DFFRX1 \denoise/first_col_r_reg[2][1]  ( .D(n2228), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[2][1] ) );
  DFFRX1 \denoise/first_col_r_reg[1][1]  ( .D(n2227), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[1][1] ) );
  DFFRX1 \denoise/first_col_r_reg[0][1]  ( .D(n2226), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[0][1] ) );
  DFFRX1 \denoise/second_col_g_reg[0][1]  ( .D(n2225), .CK(clk), .RN(n3911), 
        .QN(n3661) );
  DFFRX1 \denoise/second_col_g_reg[1][1]  ( .D(n2224), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[1][1] ) );
  DFFRX1 \denoise/second_col_g_reg[2][1]  ( .D(n2223), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[2][1] ), .QN(n3841) );
  DFFRX1 \denoise/second_col_g_reg[3][1]  ( .D(n2222), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[3][1] ) );
  DFFRX1 \denoise/second_col_g_reg[4][1]  ( .D(n2221), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[4][1] ) );
  DFFRX1 \denoise/second_col_g_reg[5][1]  ( .D(n2220), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[5][1] ), .QN(n3793) );
  DFFRX1 \denoise/first_col_g_reg[0][1]  ( .D(n2219), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[0][1] ) );
  DFFRX1 \denoise/first_col_g_reg[1][1]  ( .D(n2218), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[1][1] ) );
  DFFRX1 \denoise/first_col_g_reg[2][1]  ( .D(n2217), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[2][1] ) );
  DFFRX1 \denoise/first_col_g_reg[3][1]  ( .D(n2216), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[3][1] ) );
  DFFRX1 \denoise/first_col_g_reg[4][1]  ( .D(n2215), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[4][1] ) );
  DFFRX1 \denoise/first_col_g_reg[5][1]  ( .D(n2214), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[5][1] ) );
  DFFRX1 \denoise/second_col_b_reg[0][1]  ( .D(n2213), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[0][1] ) );
  DFFRX1 \denoise/second_col_b_reg[1][1]  ( .D(n2212), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[1][1] ) );
  DFFRX1 \denoise/second_col_b_reg[2][1]  ( .D(n2211), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[2][1] ) );
  DFFRX1 \denoise/second_col_b_reg[3][1]  ( .D(n2210), .CK(clk), .RN(n3911), 
        .QN(n3658) );
  DFFRX1 \denoise/second_col_b_reg[4][1]  ( .D(n2209), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[4][1] ) );
  DFFRX1 \denoise/second_col_b_reg[5][1]  ( .D(n2208), .CK(clk), .RN(n3911), 
        .QN(n3773) );
  DFFRX1 \denoise/first_col_b_reg[0][1]  ( .D(n2207), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[0][1] ) );
  DFFRX1 \denoise/first_col_b_reg[1][1]  ( .D(n2206), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[1][1] ) );
  DFFRX1 \denoise/first_col_b_reg[2][1]  ( .D(n2205), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[2][1] ) );
  DFFRX1 \denoise/first_col_b_reg[3][1]  ( .D(n2204), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[3][1] ) );
  DFFRX1 \denoise/first_col_b_reg[4][1]  ( .D(n2203), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[4][1] ) );
  DFFRX1 \denoise/first_col_b_reg[5][1]  ( .D(n2202), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[5][1] ) );
  DFFRX1 \denoise/pos7_reg[1]  ( .D(n1970), .CK(clk), .RN(n3911), .Q(
        \denoise/pos7 [1]), .QN(n3749) );
  DFFRX1 \denoise/pos8_reg[1]  ( .D(n1984), .CK(clk), .RN(n3911), .Q(
        \denoise/pos8 [1]), .QN(n3644) );
  DFFRX1 \denoise/pixel_in_reg_reg[2]  ( .D(pixel_in_den[2]), .CK(clk), .RN(
        n3911), .Q(\denoise/pixel_in_reg [2]) );
  DFFRX1 \denoise/pos9_reg[2]  ( .D(n2201), .CK(clk), .RN(n3911), .Q(
        \denoise/pos9 [2]) );
  DFFRX1 \denoise/second_col_r_reg[5][2]  ( .D(n2200), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_r[5][2] ), .QN(n3665) );
  DFFRX1 \denoise/second_col_r_reg[4][2]  ( .D(n2199), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_r[4][2] ), .QN(n3682) );
  DFFRX1 \denoise/second_col_r_reg[3][2]  ( .D(n2198), .CK(clk), .RN(n3911), 
        .QN(n3787) );
  DFFRX1 \denoise/second_col_r_reg[2][2]  ( .D(n2197), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_r[2][2] ), .QN(n3824) );
  DFFRX1 \denoise/second_col_r_reg[1][2]  ( .D(n2196), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_r[1][2] ), .QN(n3857) );
  DFFRX1 \denoise/second_col_r_reg[0][2]  ( .D(n2195), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_r[0][2] ) );
  DFFRX1 \denoise/first_col_r_reg[5][2]  ( .D(n2194), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[5][2] ) );
  DFFRX1 \denoise/first_col_r_reg[4][2]  ( .D(n2193), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[4][2] ) );
  DFFRX1 \denoise/first_col_r_reg[3][2]  ( .D(n2192), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[3][2] ) );
  DFFRX1 \denoise/first_col_r_reg[2][2]  ( .D(n2191), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[2][2] ) );
  DFFRX1 \denoise/first_col_r_reg[1][2]  ( .D(n2190), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[1][2] ) );
  DFFRX1 \denoise/first_col_r_reg[0][2]  ( .D(n2189), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_r[0][2] ) );
  DFFRX1 \denoise/second_col_g_reg[0][2]  ( .D(n2188), .CK(clk), .RN(n3911), 
        .QN(n3660) );
  DFFRX1 \denoise/second_col_g_reg[1][2]  ( .D(n2187), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[1][2] ) );
  DFFRX1 \denoise/second_col_g_reg[2][2]  ( .D(n2186), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[2][2] ), .QN(n3842) );
  DFFRX1 \denoise/second_col_g_reg[3][2]  ( .D(n2185), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[3][2] ) );
  DFFRX1 \denoise/second_col_g_reg[4][2]  ( .D(n2184), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[4][2] ) );
  DFFRX1 \denoise/second_col_g_reg[5][2]  ( .D(n2183), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_g[5][2] ), .QN(n3794) );
  DFFRX1 \denoise/first_col_g_reg[0][2]  ( .D(n2182), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[0][2] ) );
  DFFRX1 \denoise/first_col_g_reg[1][2]  ( .D(n2181), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[1][2] ) );
  DFFRX1 \denoise/first_col_g_reg[2][2]  ( .D(n2180), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[2][2] ) );
  DFFRX1 \denoise/first_col_g_reg[3][2]  ( .D(n2179), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[3][2] ) );
  DFFRX1 \denoise/first_col_g_reg[4][2]  ( .D(n2178), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[4][2] ) );
  DFFRX1 \denoise/first_col_g_reg[5][2]  ( .D(n2177), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_g[5][2] ) );
  DFFRX1 \denoise/second_col_b_reg[0][2]  ( .D(n2176), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[0][2] ), .QN(n3851) );
  DFFRX1 \denoise/second_col_b_reg[1][2]  ( .D(n2175), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[1][2] ) );
  DFFRX1 \denoise/second_col_b_reg[2][2]  ( .D(n2174), .CK(clk), .RN(n3911), 
        .QN(n3782) );
  DFFRX1 \denoise/second_col_b_reg[3][2]  ( .D(n2173), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[3][2] ), .QN(n3843) );
  DFFRX1 \denoise/second_col_b_reg[4][2]  ( .D(n2172), .CK(clk), .RN(n3911), 
        .Q(\denoise/second_col_b[4][2] ) );
  DFFRX1 \denoise/second_col_b_reg[5][2]  ( .D(n2171), .CK(clk), .RN(n3911), 
        .QN(n3617) );
  DFFRX1 \denoise/first_col_b_reg[0][2]  ( .D(n2170), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[0][2] ) );
  DFFRX1 \denoise/first_col_b_reg[1][2]  ( .D(n2169), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[1][2] ) );
  DFFRX1 \denoise/first_col_b_reg[2][2]  ( .D(n2168), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[2][2] ) );
  DFFRX1 \denoise/first_col_b_reg[3][2]  ( .D(n2167), .CK(clk), .RN(n3911), 
        .Q(\denoise/first_col_b[3][2] ) );
  DFFRX1 \denoise/first_col_b_reg[4][2]  ( .D(n2166), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[4][2] ) );
  DFFRX1 \denoise/first_col_b_reg[5][2]  ( .D(n2165), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[5][2] ) );
  DFFRX1 \denoise/pos7_reg[2]  ( .D(n1969), .CK(clk), .RN(n3912), .Q(
        \denoise/pos7 [2]) );
  DFFRX1 \denoise/pos8_reg[2]  ( .D(n1983), .CK(clk), .RN(n3912), .Q(
        \denoise/pos8 [2]) );
  DFFRX1 \denoise/pixel_in_reg_reg[3]  ( .D(pixel_in_den[3]), .CK(clk), .RN(
        n3912), .Q(\denoise/pixel_in_reg [3]) );
  DFFRX1 \denoise/pos9_reg[3]  ( .D(n2164), .CK(clk), .RN(n3912), .Q(
        \denoise/pos9 [3]) );
  DFFRX1 \denoise/second_col_r_reg[5][3]  ( .D(n2163), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[5][3] ), .QN(n3666) );
  DFFRX1 \denoise/second_col_r_reg[4][3]  ( .D(n2162), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[4][3] ) );
  DFFRX1 \denoise/second_col_r_reg[3][3]  ( .D(n2161), .CK(clk), .RN(n3912), 
        .QN(n3656) );
  DFFRX1 \denoise/second_col_r_reg[2][3]  ( .D(n2160), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[2][3] ), .QN(n3844) );
  DFFRX1 \denoise/second_col_r_reg[1][3]  ( .D(n2159), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[1][3] ) );
  DFFRX1 \denoise/second_col_r_reg[0][3]  ( .D(n2158), .CK(clk), .RN(n3912), 
        .QN(n3789) );
  DFFRX1 \denoise/first_col_r_reg[5][3]  ( .D(n2157), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[5][3] ) );
  DFFRX1 \denoise/first_col_r_reg[4][3]  ( .D(n2156), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[4][3] ) );
  DFFRX1 \denoise/first_col_r_reg[3][3]  ( .D(n2155), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[3][3] ) );
  DFFRX1 \denoise/first_col_r_reg[2][3]  ( .D(n2154), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[2][3] ) );
  DFFRX1 \denoise/first_col_r_reg[1][3]  ( .D(n2153), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[1][3] ) );
  DFFRX1 \denoise/first_col_r_reg[0][3]  ( .D(n2152), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[0][3] ) );
  DFFRX1 \denoise/second_col_g_reg[0][3]  ( .D(n2151), .CK(clk), .RN(n3912), 
        .QN(n3652) );
  DFFRX1 \denoise/second_col_g_reg[1][3]  ( .D(n2150), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[1][3] ) );
  DFFRX1 \denoise/second_col_g_reg[2][3]  ( .D(n2149), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[2][3] ), .QN(n3852) );
  DFFRX1 \denoise/second_col_g_reg[3][3]  ( .D(n2148), .CK(clk), .RN(n3912), 
        .QN(n3783) );
  DFFRX1 \denoise/second_col_g_reg[4][3]  ( .D(n2147), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[4][3] ) );
  DFFRX1 \denoise/second_col_g_reg[5][3]  ( .D(n2146), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[5][3] ), .QN(n3795) );
  DFFRX1 \denoise/first_col_g_reg[0][3]  ( .D(n2145), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[0][3] ) );
  DFFRX1 \denoise/first_col_g_reg[1][3]  ( .D(n2144), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[1][3] ) );
  DFFRX1 \denoise/first_col_g_reg[2][3]  ( .D(n2143), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[2][3] ) );
  DFFRX1 \denoise/first_col_g_reg[3][3]  ( .D(n2142), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[3][3] ) );
  DFFRX1 \denoise/first_col_g_reg[4][3]  ( .D(n2141), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[4][3] ) );
  DFFRX1 \denoise/first_col_g_reg[5][3]  ( .D(n2140), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[5][3] ) );
  DFFRX1 \denoise/second_col_b_reg[0][3]  ( .D(n2139), .CK(clk), .RN(n3912), 
        .QN(n3778) );
  DFFRX1 \denoise/second_col_b_reg[1][3]  ( .D(n2138), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_b[1][3] ) );
  DFFRX1 \denoise/second_col_b_reg[2][3]  ( .D(n2137), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_b[2][3] ) );
  DFFRX1 \denoise/second_col_b_reg[3][3]  ( .D(n2136), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_b[3][3] ), .QN(n3825) );
  DFFRX1 \denoise/second_col_b_reg[4][3]  ( .D(n2135), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_b[4][3] ) );
  DFFRX1 \denoise/second_col_b_reg[5][3]  ( .D(n2134), .CK(clk), .RN(n3912), 
        .QN(n3774) );
  DFFRX1 \denoise/first_col_b_reg[0][3]  ( .D(n2133), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[0][3] ) );
  DFFRX1 \denoise/first_col_b_reg[1][3]  ( .D(n2132), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[1][3] ) );
  DFFRX1 \denoise/first_col_b_reg[2][3]  ( .D(n2131), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[2][3] ) );
  DFFRX1 \denoise/first_col_b_reg[3][3]  ( .D(n2130), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[3][3] ) );
  DFFRX1 \denoise/first_col_b_reg[4][3]  ( .D(n2129), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[4][3] ) );
  DFFRX1 \denoise/first_col_b_reg[5][3]  ( .D(n2128), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_b[5][3] ) );
  DFFRX1 \denoise/pos7_reg[3]  ( .D(n1968), .CK(clk), .RN(n3912), .Q(
        \denoise/pos7 [3]) );
  DFFRX1 \denoise/pos8_reg[3]  ( .D(n1982), .CK(clk), .RN(n3912), .Q(
        \denoise/pos8 [3]) );
  DFFRX1 \denoise/pixel_in_reg_reg[4]  ( .D(pixel_in_den[4]), .CK(clk), .RN(
        n3912), .Q(\denoise/pixel_in_reg [4]) );
  DFFRX1 \denoise/pos9_reg[4]  ( .D(n2127), .CK(clk), .RN(n3912), .Q(
        \denoise/pos9 [4]) );
  DFFRX1 \denoise/second_col_r_reg[5][4]  ( .D(n2126), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[5][4] ), .QN(n3667) );
  DFFRX1 \denoise/second_col_r_reg[4][4]  ( .D(n2125), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[4][4] ) );
  DFFRX1 \denoise/second_col_r_reg[3][4]  ( .D(n2124), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[3][4] ), .QN(n3826) );
  DFFRX1 \denoise/second_col_r_reg[2][4]  ( .D(n2123), .CK(clk), .RN(n3912), 
        .QN(n3788) );
  DFFRX1 \denoise/second_col_r_reg[1][4]  ( .D(n2122), .CK(clk), .RN(n3912), 
        .QN(n3654) );
  DFFRX1 \denoise/second_col_r_reg[0][4]  ( .D(n2121), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_r[0][4] ), .QN(n3859) );
  DFFRX1 \denoise/first_col_r_reg[5][4]  ( .D(n2120), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[5][4] ) );
  DFFRX1 \denoise/first_col_r_reg[4][4]  ( .D(n2119), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[4][4] ) );
  DFFRX1 \denoise/first_col_r_reg[3][4]  ( .D(n2118), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[3][4] ) );
  DFFRX1 \denoise/first_col_r_reg[2][4]  ( .D(n2117), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[2][4] ) );
  DFFRX1 \denoise/first_col_r_reg[1][4]  ( .D(n2116), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[1][4] ) );
  DFFRX1 \denoise/first_col_r_reg[0][4]  ( .D(n2115), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_r[0][4] ) );
  DFFRX1 \denoise/second_col_g_reg[0][4]  ( .D(n2114), .CK(clk), .RN(n3912), 
        .QN(n3653) );
  DFFRX1 \denoise/second_col_g_reg[1][4]  ( .D(n2113), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[1][4] ), .QN(n3806) );
  DFFRX1 \denoise/second_col_g_reg[2][4]  ( .D(n2112), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[2][4] ) );
  DFFRX1 \denoise/second_col_g_reg[3][4]  ( .D(n2111), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[3][4] ), .QN(n3858) );
  DFFRX1 \denoise/second_col_g_reg[4][4]  ( .D(n2110), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[4][4] ) );
  DFFRX1 \denoise/second_col_g_reg[5][4]  ( .D(n2109), .CK(clk), .RN(n3912), 
        .Q(\denoise/second_col_g[5][4] ), .QN(n3796) );
  DFFRX1 \denoise/first_col_g_reg[0][4]  ( .D(n2108), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[0][4] ) );
  DFFRX1 \denoise/first_col_g_reg[1][4]  ( .D(n2107), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[1][4] ) );
  DFFRX1 \denoise/first_col_g_reg[2][4]  ( .D(n2106), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[2][4] ) );
  DFFRX1 \denoise/first_col_g_reg[3][4]  ( .D(n2105), .CK(clk), .RN(n3912), 
        .Q(\denoise/first_col_g[3][4] ) );
  DFFRX1 \denoise/first_col_g_reg[4][4]  ( .D(n2104), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[4][4] ) );
  DFFRX1 \denoise/first_col_g_reg[5][4]  ( .D(n2103), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[5][4] ) );
  DFFRX1 \denoise/second_col_b_reg[0][4]  ( .D(n2102), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[0][4] ), .QN(n3860) );
  DFFRX1 \denoise/second_col_b_reg[1][4]  ( .D(n2101), .CK(clk), .RN(n3919), 
        .QN(n3659) );
  DFFRX1 \denoise/second_col_b_reg[2][4]  ( .D(n2100), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[2][4] ), .QN(n3853) );
  DFFRX1 \denoise/second_col_b_reg[3][4]  ( .D(n2099), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[3][4] ), .QN(n3804) );
  DFFRX1 \denoise/second_col_b_reg[4][4]  ( .D(n2098), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[4][4] ) );
  DFFRX1 \denoise/second_col_b_reg[5][4]  ( .D(n2097), .CK(clk), .RN(n3919), 
        .QN(n3623) );
  DFFRX1 \denoise/first_col_b_reg[0][4]  ( .D(n2096), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[0][4] ) );
  DFFRX1 \denoise/first_col_b_reg[1][4]  ( .D(n2095), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[1][4] ) );
  DFFRX1 \denoise/first_col_b_reg[2][4]  ( .D(n2094), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[2][4] ) );
  DFFRX1 \denoise/first_col_b_reg[3][4]  ( .D(n2093), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[3][4] ) );
  DFFRX1 \denoise/first_col_b_reg[4][4]  ( .D(n2092), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[4][4] ) );
  DFFRX1 \denoise/first_col_b_reg[5][4]  ( .D(n2091), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[5][4] ) );
  DFFRX1 \denoise/pos7_reg[4]  ( .D(n1967), .CK(clk), .RN(n3919), .Q(
        \denoise/pos7 [4]) );
  DFFRX1 \denoise/pos8_reg[4]  ( .D(n1981), .CK(clk), .RN(n3919), .Q(
        \denoise/pos8 [4]) );
  DFFRX1 \denoise/pixel_in_reg_reg[5]  ( .D(pixel_in_den[5]), .CK(clk), .RN(
        n3919), .Q(\denoise/pixel_in_reg [5]) );
  DFFRX1 \denoise/second_col_r_reg[5][5]  ( .D(n2089), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[5][5] ), .QN(n3797) );
  DFFRX1 \denoise/second_col_r_reg[4][5]  ( .D(n2088), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[4][5] ) );
  DFFRX1 \denoise/second_col_r_reg[3][5]  ( .D(n2087), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[3][5] ) );
  DFFRX1 \denoise/second_col_r_reg[2][5]  ( .D(n2086), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[2][5] ) );
  DFFRX1 \denoise/second_col_r_reg[1][5]  ( .D(n2085), .CK(clk), .RN(n3919), 
        .QN(n3657) );
  DFFRX1 \denoise/second_col_r_reg[0][5]  ( .D(n2084), .CK(clk), .RN(n3919), 
        .QN(n3784) );
  DFFRX1 \denoise/first_col_r_reg[5][5]  ( .D(n2083), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[5][5] ) );
  DFFRX1 \denoise/first_col_r_reg[4][5]  ( .D(n2082), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[4][5] ) );
  DFFRX1 \denoise/first_col_r_reg[3][5]  ( .D(n2081), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[3][5] ) );
  DFFRX1 \denoise/first_col_r_reg[2][5]  ( .D(n2080), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[2][5] ) );
  DFFRX1 \denoise/first_col_r_reg[1][5]  ( .D(n2079), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[1][5] ) );
  DFFRX1 \denoise/first_col_r_reg[0][5]  ( .D(n2078), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[0][5] ) );
  DFFRX1 \denoise/second_col_g_reg[0][5]  ( .D(n2077), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_g[0][5] ), .QN(n3854) );
  DFFRX1 \denoise/second_col_g_reg[1][5]  ( .D(n2076), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_g[1][5] ) );
  DFFRX1 \denoise/second_col_g_reg[2][5]  ( .D(n2075), .CK(clk), .RN(n3919), 
        .QN(n3790) );
  DFFRX1 \denoise/second_col_g_reg[3][5]  ( .D(n2074), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_g[3][5] ), .QN(n3861) );
  DFFRX1 \denoise/second_col_g_reg[4][5]  ( .D(n2073), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_g[4][5] ) );
  DFFRX1 \denoise/second_col_g_reg[5][5]  ( .D(n2072), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_g[5][5] ), .QN(n3798) );
  DFFRX1 \denoise/first_col_g_reg[0][5]  ( .D(n2071), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[0][5] ) );
  DFFRX1 \denoise/first_col_g_reg[1][5]  ( .D(n2070), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[1][5] ) );
  DFFRX1 \denoise/first_col_g_reg[2][5]  ( .D(n2069), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[2][5] ) );
  DFFRX1 \denoise/first_col_g_reg[3][5]  ( .D(n2068), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[3][5] ) );
  DFFRX1 \denoise/first_col_g_reg[4][5]  ( .D(n2067), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[4][5] ) );
  DFFRX1 \denoise/first_col_g_reg[5][5]  ( .D(n2066), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_g[5][5] ) );
  DFFRX1 \denoise/second_col_b_reg[0][5]  ( .D(n2065), .CK(clk), .RN(n3919), 
        .QN(n3627) );
  DFFRX1 \denoise/second_col_b_reg[1][5]  ( .D(n2064), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[1][5] ) );
  DFFRX1 \denoise/second_col_b_reg[2][5]  ( .D(n2063), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[2][5] ) );
  DFFRX1 \denoise/second_col_b_reg[3][5]  ( .D(n2062), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[3][5] ), .QN(n3827) );
  DFFRX1 \denoise/second_col_b_reg[4][5]  ( .D(n2061), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_b[4][5] ) );
  DFFRX1 \denoise/second_col_b_reg[5][5]  ( .D(n2060), .CK(clk), .RN(n3919), 
        .QN(n3651) );
  DFFRX1 \denoise/first_col_b_reg[0][5]  ( .D(n2059), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[0][5] ) );
  DFFRX1 \denoise/first_col_b_reg[1][5]  ( .D(n2058), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[1][5] ) );
  DFFRX1 \denoise/first_col_b_reg[2][5]  ( .D(n2057), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[2][5] ) );
  DFFRX1 \denoise/first_col_b_reg[3][5]  ( .D(n2056), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[3][5] ) );
  DFFRX1 \denoise/first_col_b_reg[4][5]  ( .D(n2055), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[4][5] ) );
  DFFRX1 \denoise/first_col_b_reg[5][5]  ( .D(n2054), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_b[5][5] ) );
  DFFRX1 \denoise/pos7_reg[5]  ( .D(n1966), .CK(clk), .RN(n3919), .Q(
        \denoise/pos7 [5]) );
  DFFRX1 \denoise/pos8_reg[5]  ( .D(n1980), .CK(clk), .RN(n3919), .Q(
        \denoise/pos8 [5]) );
  DFFRX1 \denoise/pixel_in_reg_reg[6]  ( .D(pixel_in_den[6]), .CK(clk), .RN(
        n3919), .Q(\denoise/pixel_in_reg [6]) );
  DFFRX1 \denoise/pos9_reg[6]  ( .D(n2053), .CK(clk), .RN(n3919), .Q(
        \denoise/pos9 [6]) );
  DFFRX1 \denoise/second_col_r_reg[5][6]  ( .D(n2052), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[5][6] ), .QN(n3799) );
  DFFRX1 \denoise/second_col_r_reg[4][6]  ( .D(n2051), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[4][6] ) );
  DFFRX1 \denoise/second_col_r_reg[3][6]  ( .D(n2050), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[3][6] ), .QN(n3846) );
  DFFRX1 \denoise/second_col_r_reg[2][6]  ( .D(n2049), .CK(clk), .RN(n3919), 
        .QN(n3785) );
  DFFRX1 \denoise/second_col_r_reg[1][6]  ( .D(n2048), .CK(clk), .RN(n3919), 
        .QN(n3777) );
  DFFRX1 \denoise/second_col_r_reg[0][6]  ( .D(n2047), .CK(clk), .RN(n3919), 
        .Q(\denoise/second_col_r[0][6] ) );
  DFFRX1 \denoise/first_col_r_reg[5][6]  ( .D(n2046), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[5][6] ) );
  DFFRX1 \denoise/first_col_r_reg[4][6]  ( .D(n2045), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[4][6] ) );
  DFFRX1 \denoise/first_col_r_reg[3][6]  ( .D(n2044), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[3][6] ) );
  DFFRX1 \denoise/first_col_r_reg[2][6]  ( .D(n2043), .CK(clk), .RN(n3919), 
        .Q(\denoise/first_col_r[2][6] ) );
  DFFRX1 \denoise/first_col_r_reg[1][6]  ( .D(n2042), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[1][6] ) );
  DFFRX1 \denoise/first_col_r_reg[0][6]  ( .D(n2041), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[0][6] ) );
  DFFRX1 \denoise/second_col_g_reg[0][6]  ( .D(n2040), .CK(clk), .RN(n3913), 
        .QN(n3779) );
  DFFRX1 \denoise/second_col_g_reg[1][6]  ( .D(n2039), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[1][6] ) );
  DFFRX1 \denoise/second_col_g_reg[2][6]  ( .D(n2038), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[2][6] ), .QN(n3845) );
  DFFRX1 \denoise/second_col_g_reg[3][6]  ( .D(n2037), .CK(clk), .RN(n3913), 
        .QN(n3655) );
  DFFRX1 \denoise/second_col_g_reg[4][6]  ( .D(n2036), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[4][6] ) );
  DFFRX1 \denoise/second_col_g_reg[5][6]  ( .D(n2035), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[5][6] ), .QN(n3800) );
  DFFRX1 \denoise/first_col_g_reg[0][6]  ( .D(n2034), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[0][6] ) );
  DFFRX1 \denoise/first_col_g_reg[1][6]  ( .D(n2033), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[1][6] ) );
  DFFRX1 \denoise/first_col_g_reg[2][6]  ( .D(n2032), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[2][6] ) );
  DFFRX1 \denoise/first_col_g_reg[3][6]  ( .D(n2031), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[3][6] ) );
  DFFRX1 \denoise/first_col_g_reg[4][6]  ( .D(n2030), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[4][6] ) );
  DFFRX1 \denoise/first_col_g_reg[5][6]  ( .D(n2029), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[5][6] ) );
  DFFRX1 \denoise/second_col_b_reg[0][6]  ( .D(n2028), .CK(clk), .RN(n3913), 
        .QN(n3624) );
  DFFRX1 \denoise/second_col_b_reg[1][6]  ( .D(n2027), .CK(clk), .RN(n3913), 
        .QN(n3791) );
  DFFRX1 \denoise/second_col_b_reg[2][6]  ( .D(n2026), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[2][6] ) );
  DFFRX1 \denoise/second_col_b_reg[3][6]  ( .D(n2025), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[3][6] ), .QN(n3828) );
  DFFRX1 \denoise/second_col_b_reg[4][6]  ( .D(n2024), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[4][6] ) );
  DFFRX1 \denoise/second_col_b_reg[5][6]  ( .D(n2023), .CK(clk), .RN(n3913), 
        .QN(n3775) );
  DFFRX1 \denoise/first_col_b_reg[0][6]  ( .D(n2022), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[0][6] ) );
  DFFRX1 \denoise/first_col_b_reg[1][6]  ( .D(n2021), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[1][6] ) );
  DFFRX1 \denoise/first_col_b_reg[2][6]  ( .D(n2020), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[2][6] ) );
  DFFRX1 \denoise/first_col_b_reg[3][6]  ( .D(n2019), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[3][6] ) );
  DFFRX1 \denoise/first_col_b_reg[4][6]  ( .D(n2018), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[4][6] ) );
  DFFRX1 \denoise/first_col_b_reg[5][6]  ( .D(n2017), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[5][6] ) );
  DFFRX1 \denoise/pos7_reg[6]  ( .D(n1965), .CK(clk), .RN(n3913), .Q(
        \denoise/pos7 [6]) );
  DFFRX1 \denoise/pos8_reg[6]  ( .D(n1979), .CK(clk), .RN(n3913), .Q(
        \denoise/pos8 [6]) );
  DFFRX1 \denoise/pixel_in_reg_reg[7]  ( .D(pixel_in_den[7]), .CK(clk), .RN(
        n3913), .Q(\denoise/pixel_in_reg [7]) );
  DFFRX1 \denoise/second_col_r_reg[5][7]  ( .D(n2015), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_r[5][7] ), .QN(n3801) );
  DFFRX1 \denoise/second_col_r_reg[4][7]  ( .D(n2014), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_r[4][7] ) );
  DFFRX1 \denoise/second_col_r_reg[3][7]  ( .D(n2013), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_r[3][7] ), .QN(n3829) );
  DFFRX1 \denoise/second_col_r_reg[2][7]  ( .D(n2012), .CK(clk), .RN(n3913), 
        .QN(n3786) );
  DFFRX1 \denoise/second_col_r_reg[1][7]  ( .D(n2011), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_r[1][7] ) );
  DFFRX1 \denoise/second_col_r_reg[0][7]  ( .D(n2010), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_r[0][7] ) );
  DFFRX1 \denoise/first_col_r_reg[5][7]  ( .D(n2009), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[5][7] ) );
  DFFRX1 \denoise/first_col_r_reg[4][7]  ( .D(n2008), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[4][7] ) );
  DFFRX1 \denoise/first_col_r_reg[3][7]  ( .D(n2007), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[3][7] ) );
  DFFRX1 \denoise/first_col_r_reg[2][7]  ( .D(n2006), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[2][7] ) );
  DFFRX1 \denoise/first_col_r_reg[1][7]  ( .D(n2005), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[1][7] ) );
  DFFRX1 \denoise/first_col_r_reg[0][7]  ( .D(n2004), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_r[0][7] ) );
  DFFRX1 \denoise/second_col_g_reg[0][7]  ( .D(n2003), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[0][7] ), .QN(n3807) );
  DFFRX1 \denoise/second_col_g_reg[1][7]  ( .D(n2002), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[1][7] ) );
  DFFRX1 \denoise/second_col_g_reg[2][7]  ( .D(n2001), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[2][7] ) );
  DFFRX1 \denoise/second_col_g_reg[3][7]  ( .D(n2000), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[3][7] ), .QN(n3847) );
  DFFRX1 \denoise/second_col_g_reg[4][7]  ( .D(n1999), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[4][7] ) );
  DFFRX1 \denoise/second_col_g_reg[5][7]  ( .D(n1998), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_g[5][7] ), .QN(n3802) );
  DFFRX1 \denoise/first_col_g_reg[0][7]  ( .D(n1997), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[0][7] ) );
  DFFRX1 \denoise/first_col_g_reg[1][7]  ( .D(n1996), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[1][7] ) );
  DFFRX1 \denoise/first_col_g_reg[2][7]  ( .D(n1995), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[2][7] ) );
  DFFRX1 \denoise/first_col_g_reg[3][7]  ( .D(n1994), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[3][7] ) );
  DFFRX1 \denoise/first_col_g_reg[4][7]  ( .D(n1993), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[4][7] ) );
  DFFRX1 \denoise/first_col_g_reg[5][7]  ( .D(n1992), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_g[5][7] ) );
  DFFRX1 \denoise/second_col_b_reg[0][7]  ( .D(n1991), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[0][7] ), .QN(n3808) );
  DFFRX1 \denoise/second_col_b_reg[1][7]  ( .D(n1990), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[1][7] ) );
  DFFRX1 \denoise/second_col_b_reg[2][7]  ( .D(n1989), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[2][7] ) );
  DFFRX1 \denoise/second_col_b_reg[3][7]  ( .D(n1988), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[3][7] ) );
  DFFRX1 \denoise/second_col_b_reg[4][7]  ( .D(n1987), .CK(clk), .RN(n3913), 
        .Q(\denoise/second_col_b[4][7] ) );
  DFFRX1 \denoise/second_col_b_reg[5][7]  ( .D(n1986), .CK(clk), .RN(n3913), 
        .QN(n3772) );
  DFFRX1 \denoise/pos8_reg[7]  ( .D(n1978), .CK(clk), .RN(n3913), .Q(
        \denoise/pos8 [7]) );
  DFFRX1 \denoise/first_col_b_reg[0][7]  ( .D(n1977), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[0][7] ) );
  DFFRX1 \denoise/first_col_b_reg[1][7]  ( .D(n1976), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[1][7] ) );
  DFFRX1 \denoise/first_col_b_reg[2][7]  ( .D(n1975), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[2][7] ) );
  DFFRX1 \denoise/first_col_b_reg[3][7]  ( .D(n1974), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[3][7] ) );
  DFFRX1 \denoise/first_col_b_reg[4][7]  ( .D(n1973), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[4][7] ) );
  DFFRX1 \denoise/first_col_b_reg[5][7]  ( .D(n1972), .CK(clk), .RN(n3913), 
        .Q(\denoise/first_col_b[5][7] ) );
  DFFRX1 \denoise/pos7_reg[7]  ( .D(n1964), .CK(clk), .RN(n3913), .Q(
        \denoise/pos7 [7]) );
  DFFRX1 \denoise/color_out_reg_reg[0]  ( .D(\denoise/n_color_out_reg [0]), 
        .CK(clk), .RN(n2556), .Q(color_out_den[0]) );
  DFFRX1 \denoise/color_out_reg_reg[1]  ( .D(\denoise/n_color_out_reg [1]), 
        .CK(clk), .RN(n2556), .Q(color_out_den[1]) );
  DFFRX1 \denoise/valid_out_reg_reg  ( .D(\denoise/n_valid_out_reg ), .CK(clk), 
        .RN(n2556), .Q(valid_out_den) );
  DFFRX1 \denoise/sum6_r_reg[0]  ( .D(n1961), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [0]) );
  DFFRX1 \denoise/sum3_r_reg[0]  ( .D(n1960), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [0]) );
  DFFRX1 \denoise/sum6_r_reg[1]  ( .D(n1955), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [1]) );
  DFFRX1 \denoise/sum3_r_reg[1]  ( .D(n1954), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [1]) );
  DFFRX1 \denoise/sum6_r_reg[2]  ( .D(n1947), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [2]) );
  DFFRX1 \denoise/sum3_r_reg[2]  ( .D(n1946), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [2]) );
  DFFRX1 \denoise/sum6_r_reg[3]  ( .D(n1939), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [3]) );
  DFFRX1 \denoise/sum3_r_reg[3]  ( .D(n1938), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [3]) );
  DFFRX1 \denoise/sum6_r_reg[4]  ( .D(n1931), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [4]) );
  DFFRX1 \denoise/sum3_r_reg[4]  ( .D(n1930), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [4]) );
  DFFRX1 \denoise/sum6_r_reg[5]  ( .D(n1923), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [5]) );
  DFFRX1 \denoise/sum3_r_reg[5]  ( .D(n1922), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [5]) );
  DFFRX1 \denoise/sum6_r_reg[6]  ( .D(n1915), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [6]) );
  DFFRX1 \denoise/sum3_r_reg[6]  ( .D(n1914), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [6]) );
  DFFRX1 \denoise/sum6_r_reg[7]  ( .D(n1907), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [7]) );
  DFFRX1 \denoise/sum3_r_reg[7]  ( .D(n1906), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [7]) );
  DFFRX1 \denoise/sum6_r_reg[8]  ( .D(n1899), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [8]) );
  DFFRX1 \denoise/sum3_r_reg[8]  ( .D(n1898), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [8]) );
  DFFRX1 \denoise/sum6_r_reg[9]  ( .D(n1891), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_r [9]) );
  DFFRX1 \denoise/sum3_r_reg[9]  ( .D(n1890), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_r [9]) );
  DFFRX1 \denoise/sum6_g_reg[0]  ( .D(n1959), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [0]) );
  DFFRX1 \denoise/sum3_g_reg[0]  ( .D(n1958), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [0]) );
  DFFRX1 \denoise/sum6_g_reg[1]  ( .D(n1953), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [1]) );
  DFFRX1 \denoise/sum3_g_reg[1]  ( .D(n1952), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [1]) );
  DFFRX1 \denoise/sum6_g_reg[2]  ( .D(n1945), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [2]) );
  DFFRX1 \denoise/sum3_g_reg[2]  ( .D(n1944), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [2]) );
  DFFRX1 \denoise/sum6_g_reg[3]  ( .D(n1937), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [3]) );
  DFFRX1 \denoise/sum3_g_reg[3]  ( .D(n1936), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [3]) );
  DFFRX1 \denoise/sum6_g_reg[4]  ( .D(n1929), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [4]) );
  DFFRX1 \denoise/sum3_g_reg[4]  ( .D(n1928), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [4]) );
  DFFRX1 \denoise/sum6_g_reg[5]  ( .D(n1921), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [5]) );
  DFFRX1 \denoise/sum3_g_reg[5]  ( .D(n1920), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [5]) );
  DFFRX1 \denoise/sum6_g_reg[6]  ( .D(n1913), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [6]) );
  DFFRX1 \denoise/sum3_g_reg[6]  ( .D(n1912), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [6]) );
  DFFRX1 \denoise/sum6_g_reg[7]  ( .D(n1905), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [7]) );
  DFFRX1 \denoise/sum3_g_reg[7]  ( .D(n1904), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [7]) );
  DFFRX1 \denoise/sum6_g_reg[8]  ( .D(n1897), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [8]) );
  DFFRX1 \denoise/sum3_g_reg[8]  ( .D(n1896), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [8]) );
  DFFRX1 \denoise/sum6_g_reg[9]  ( .D(n1889), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6_g [9]) );
  DFFRX1 \denoise/sum3_g_reg[9]  ( .D(n1888), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_g [9]) );
  DFFRX1 \denoise/sum6_b_reg[0]  ( .D(n1957), .CK(clk), .RN(n2556), .QN(n3668)
         );
  DFFRX1 \denoise/sum3_b_reg[0]  ( .D(n1963), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [0]) );
  DFFRX1 \denoise/sum3_reg[0]  ( .D(n1962), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [0]) );
  DFFRX1 \denoise/sum6_reg[0]  ( .D(n1956), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [0]) );
  DFFRX1 \denoise/sum6_b_reg[1]  ( .D(n1951), .CK(clk), .RN(n2556), .QN(n3669)
         );
  DFFRX1 \denoise/sum6_reg[1]  ( .D(n1948), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [1]) );
  DFFRX1 \denoise/sum3_b_reg[1]  ( .D(n1950), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [1]) );
  DFFRX1 \denoise/sum3_reg[1]  ( .D(n1949), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [1]), .QN(n3759) );
  DFFRX1 \denoise/sum6_b_reg[2]  ( .D(n1943), .CK(clk), .RN(n2556), .QN(n3670)
         );
  DFFRX1 \denoise/sum6_reg[2]  ( .D(n1940), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [2]) );
  DFFRX1 \denoise/sum3_b_reg[2]  ( .D(n1942), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [2]) );
  DFFRX1 \denoise/sum3_reg[2]  ( .D(n1941), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [2]) );
  DFFRX1 \denoise/sum6_b_reg[3]  ( .D(n1935), .CK(clk), .RN(n2556), .QN(n3671)
         );
  DFFRX1 \denoise/sum6_reg[3]  ( .D(n1932), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [3]) );
  DFFRX1 \denoise/sum3_b_reg[3]  ( .D(n1934), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [3]) );
  DFFRX1 \denoise/sum3_reg[3]  ( .D(n1933), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [3]) );
  DFFRX1 \denoise/sum6_b_reg[4]  ( .D(n1927), .CK(clk), .RN(n2556), .QN(n3672)
         );
  DFFRX1 \denoise/sum6_reg[4]  ( .D(n1924), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [4]) );
  DFFRX1 \denoise/sum3_b_reg[4]  ( .D(n1926), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [4]) );
  DFFRX1 \denoise/sum3_reg[4]  ( .D(n1925), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [4]) );
  DFFRX1 \denoise/sum6_b_reg[5]  ( .D(n1919), .CK(clk), .RN(n2556), .QN(n3673)
         );
  DFFRX1 \denoise/sum6_reg[5]  ( .D(n1916), .CK(clk), .RN(n2556), .Q(
        \denoise/sum6 [5]) );
  DFFRX1 \denoise/sum3_b_reg[5]  ( .D(n1918), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3_b [5]) );
  DFFRX1 \denoise/sum3_reg[5]  ( .D(n1917), .CK(clk), .RN(n2556), .Q(
        \denoise/sum3 [5]) );
  DFFRX1 \denoise/sum6_b_reg[6]  ( .D(n1911), .CK(clk), .RN(n2556), .QN(n3674)
         );
  DFFRX1 \denoise/sum6_reg[6]  ( .D(n1908), .CK(clk), .RN(n2621), .Q(
        \denoise/sum6 [6]) );
  DFFRX1 \denoise/sum3_b_reg[6]  ( .D(n1910), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3_b [6]) );
  DFFRX1 \denoise/sum3_reg[6]  ( .D(n1909), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3 [6]) );
  DFFRX1 \denoise/sum6_b_reg[7]  ( .D(n1903), .CK(clk), .RN(n2621), .QN(n3675)
         );
  DFFRX1 \denoise/sum6_reg[7]  ( .D(n1900), .CK(clk), .RN(n2621), .Q(
        \denoise/sum6 [7]) );
  DFFRX1 \denoise/sum3_b_reg[7]  ( .D(n1902), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3_b [7]) );
  DFFRX1 \denoise/sum3_reg[7]  ( .D(n1901), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3 [7]) );
  DFFRX1 \denoise/sum6_b_reg[8]  ( .D(n1895), .CK(clk), .RN(n2621), .QN(n3676)
         );
  DFFRX1 \denoise/sum6_reg[8]  ( .D(n1892), .CK(clk), .RN(n2621), .Q(
        \denoise/sum6 [8]) );
  DFFRX1 \denoise/sum3_b_reg[8]  ( .D(n1894), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3_b [8]) );
  DFFRX1 \denoise/sum3_reg[8]  ( .D(n1893), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3 [8]) );
  DFFRX1 \denoise/sum6_b_reg[9]  ( .D(n1887), .CK(clk), .RN(n2621), .QN(n3677)
         );
  DFFRX1 \denoise/sum6_reg[9]  ( .D(n1884), .CK(clk), .RN(n2621), .Q(
        \denoise/sum6 [9]) );
  DFFRX1 \denoise/sum3_b_reg[9]  ( .D(n1886), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3_b [9]) );
  DFFRX1 \denoise/sum3_reg[9]  ( .D(n1885), .CK(clk), .RN(n2621), .Q(
        \denoise/sum3 [9]) );
  DFFRX1 \denoise/last_pic_2_reg  ( .D(\denoise/n_last_pic_2 ), .CK(clk), .RN(
        n2621), .Q(\denoise/n_last_pic_out_reg ) );
  DFFRX1 \denoise/last_pic_out_reg_reg  ( .D(\denoise/n_last_pic_out_reg ), 
        .CK(clk), .RN(n2621), .Q(last_pic_out_den) );
  DFFRX1 \mean/last_state_r_reg[1]  ( .D(\mean/last_state_w [1]), .CK(clk), 
        .RN(n2621), .Q(\mean/last_state_r [1]), .QN(n3819) );
  DFFRX1 \mean/last_state_r_reg[0]  ( .D(\mean/last_state_w [0]), .CK(clk), 
        .RN(n2621), .Q(\mean/last_state_r [0]), .QN(n3678) );
  DFFRX1 \mean/value_r_reg[0]  ( .D(pixel_in_mean[0]), .CK(clk), .RN(n2621), 
        .Q(\mean/value_r [0]), .QN(n3814) );
  DFFRX1 \mean/value_r_reg[1]  ( .D(pixel_in_mean[1]), .CK(clk), .RN(n2621), 
        .QN(n3700) );
  DFFRX1 \mean/value_r_reg[2]  ( .D(pixel_in_mean[2]), .CK(clk), .RN(n2621), 
        .QN(n3698) );
  DFFRX1 \mean/value_r_reg[3]  ( .D(pixel_in_mean[3]), .CK(clk), .RN(n2621), 
        .QN(n3703) );
  DFFRX1 \mean/value_r_reg[4]  ( .D(pixel_in_mean[4]), .CK(clk), .RN(n2621), 
        .Q(\mean/value_r [4]), .QN(n3704) );
  DFFRX1 \mean/value_r_reg[5]  ( .D(pixel_in_mean[5]), .CK(clk), .RN(n2621), 
        .Q(\mean/value_r [5]), .QN(n3710) );
  DFFRX1 \mean/value_r_reg[6]  ( .D(pixel_in_mean[6]), .CK(clk), .RN(n2621), 
        .Q(\mean/value_r [6]), .QN(n3709) );
  DFFRX1 \mean/value_r_reg[7]  ( .D(pixel_in_mean[7]), .CK(clk), .RN(n2621), 
        .QN(n3708) );
  DFFRX1 \mean/valid_r_reg  ( .D(valid_in_mean), .CK(clk), .RN(n2621), .Q(
        \mean/valid_r ) );
  DFFRX1 \mean/valid_tmp_reg  ( .D(\mean/valid_r ), .CK(clk), .RN(n2621), .Q(
        valid_out_mean) );
  DFFRX1 \mean/last_r_reg  ( .D(last_pic_in_mean), .CK(clk), .RN(n2621), .Q(
        \mean/last_r ) );
  DFFRX1 \mean/last_tmp_reg  ( .D(\mean/last_r ), .CK(clk), .RN(n2621), .Q(
        last_pic_out_mean) );
  DFFRX1 \mean/color_r_reg[0]  ( .D(color_in_mean[0]), .CK(clk), .RN(n2621), 
        .Q(\mean/color_r [0]), .QN(n3711) );
  DFFRX1 \mean/color_tmp_reg[0]  ( .D(\mean/color_r [0]), .CK(clk), .RN(n2621), 
        .Q(color_out_mean[0]) );
  DFFRX1 \mean/color_r_reg[1]  ( .D(color_in_mean[1]), .CK(clk), .RN(n2621), 
        .Q(\mean/color_r [1]) );
  DFFRX1 \mean/color_tmp_reg[1]  ( .D(\mean/color_r [1]), .CK(clk), .RN(n2621), 
        .Q(color_out_mean[1]) );
  DFFRX1 \mean/sum_r_reg[0]  ( .D(n1883), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [0]) );
  DFFRX1 \mean/sum_r_reg[1]  ( .D(n1882), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [1]) );
  DFFRX1 \mean/sum_r_reg[2]  ( .D(n1881), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [2]) );
  DFFRX1 \mean/sum_r_reg[3]  ( .D(n1880), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [3]) );
  DFFRX1 \mean/sum_r_reg[4]  ( .D(n1879), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [4]), .QN(n3706) );
  DFFRX1 \mean/sum_r_reg[5]  ( .D(n1878), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [5]), .QN(n3713) );
  DFFRX1 \mean/sum_r_reg[6]  ( .D(n1877), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [6]) );
  DFFRX1 \mean/sum_r_reg[7]  ( .D(n1876), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [7]) );
  DFFRX1 \mean/sum_r_reg[8]  ( .D(n1875), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [8]) );
  DFFRX1 \mean/sum_r_reg[9]  ( .D(n1874), .CK(clk), .RN(n2621), .QN(n3717) );
  DFFRX1 \mean/sum_r_reg[10]  ( .D(n1873), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [10]) );
  DFFRX1 \mean/sum_r_reg[11]  ( .D(n1872), .CK(clk), .RN(n2621), .QN(n3729) );
  DFFRX1 \mean/sum_r_reg[12]  ( .D(n1871), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [12]) );
  DFFRX1 \mean/sum_r_reg[13]  ( .D(n1870), .CK(clk), .RN(n2621), .QN(n3750) );
  DFFRX1 \mean/sum_r_reg[14]  ( .D(n1869), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [14]) );
  DFFRX1 \mean/sum_r_reg[15]  ( .D(n1868), .CK(clk), .RN(n2621), .QN(n3761) );
  DFFRX1 \mean/sum_r_reg[16]  ( .D(n1867), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [16]) );
  DFFRX1 \mean/sum_r_reg[17]  ( .D(n1866), .CK(clk), .RN(n2621), .QN(n3762) );
  DFFRX1 \mean/sum_r_reg[18]  ( .D(n1865), .CK(clk), .RN(n2621), .Q(
        \mean/sum_r [18]) );
  DFFRX1 \mean/sum_r_reg[19]  ( .D(n1864), .CK(clk), .RN(n2621), .QN(n3763) );
  DFFRX1 \mean/sum_r_reg[20]  ( .D(n1863), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [0]) );
  DFFRX1 \mean/r_mean_o_reg[0]  ( .D(\mean/r_mean_tmp [0]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[0]) );
  DFFRX1 \mean/sum_r_reg[21]  ( .D(n1862), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [1]), .QN(n3810) );
  DFFRX1 \mean/r_mean_o_reg[1]  ( .D(\mean/r_mean_tmp [1]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[1]) );
  DFFRX1 \mean/sum_r_reg[22]  ( .D(n1861), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [2]) );
  DFFRX1 \mean/r_mean_o_reg[2]  ( .D(\mean/r_mean_tmp [2]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[2]) );
  DFFRX1 \mean/sum_r_reg[23]  ( .D(n1860), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [3]), .QN(n3834) );
  DFFRX1 \mean/r_mean_o_reg[3]  ( .D(\mean/r_mean_tmp [3]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[3]) );
  DFFRX1 \mean/sum_r_reg[24]  ( .D(n1859), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [4]) );
  DFFRX1 \mean/r_mean_o_reg[4]  ( .D(\mean/r_mean_tmp [4]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[4]) );
  DFFRX1 \mean/sum_r_reg[25]  ( .D(n1858), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [5]), .QN(n3831) );
  DFFRX1 \mean/r_mean_o_reg[5]  ( .D(\mean/r_mean_tmp [5]), .CK(clk), .RN(
        n2621), .Q(r_mean_out_mean[5]) );
  DFFRX1 \mean/sum_r_reg[26]  ( .D(n1857), .CK(clk), .RN(n2621), .Q(
        \mean/r_mean_tmp [6]) );
  DFFRX1 \mean/r_mean_o_reg[6]  ( .D(\mean/r_mean_tmp [6]), .CK(clk), .RN(
        n3914), .Q(r_mean_out_mean[6]) );
  DFFRX1 \mean/sum_r_reg[27]  ( .D(n1856), .CK(clk), .RN(n3914), .Q(
        \mean/r_mean_tmp [7]) );
  DFFRX1 \mean/r_mean_o_reg[7]  ( .D(\mean/r_mean_tmp [7]), .CK(clk), .RN(
        n3914), .Q(r_mean_out_mean[7]) );
  DFFRX1 \mean/sum_g_reg[0]  ( .D(n1855), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [0]) );
  DFFRX1 \mean/sum_g_reg[1]  ( .D(n1854), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [1]) );
  DFFRX1 \mean/sum_g_reg[2]  ( .D(n1853), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [2]) );
  DFFRX1 \mean/sum_g_reg[3]  ( .D(n1852), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [3]) );
  DFFRX1 \mean/sum_g_reg[4]  ( .D(n1851), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [4]) );
  DFFRX1 \mean/sum_g_reg[5]  ( .D(n1850), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [5]) );
  DFFRX1 \mean/sum_g_reg[6]  ( .D(n1849), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [6]) );
  DFFRX1 \mean/sum_g_reg[7]  ( .D(n1848), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [7]) );
  DFFRX1 \mean/sum_g_reg[8]  ( .D(n1847), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [8]) );
  DFFRX1 \mean/sum_g_reg[9]  ( .D(n1846), .CK(clk), .RN(n3914), .QN(n3731) );
  DFFRX1 \mean/sum_g_reg[10]  ( .D(n1845), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [10]) );
  DFFRX1 \mean/sum_g_reg[11]  ( .D(n1844), .CK(clk), .RN(n3914), .QN(n3741) );
  DFFRX1 \mean/sum_g_reg[12]  ( .D(n1843), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [12]) );
  DFFRX1 \mean/sum_g_reg[13]  ( .D(n1842), .CK(clk), .RN(n3914), .QN(n3742) );
  DFFRX1 \mean/sum_g_reg[14]  ( .D(n1841), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [14]) );
  DFFRX1 \mean/sum_g_reg[15]  ( .D(n1840), .CK(clk), .RN(n3914), .QN(n3764) );
  DFFRX1 \mean/sum_g_reg[16]  ( .D(n1839), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [16]) );
  DFFRX1 \mean/sum_g_reg[17]  ( .D(n1838), .CK(clk), .RN(n3914), .QN(n3760) );
  DFFRX1 \mean/sum_g_reg[18]  ( .D(n1837), .CK(clk), .RN(n3914), .Q(
        \mean/sum_g [18]) );
  DFFRX1 \mean/sum_g_reg[19]  ( .D(n1836), .CK(clk), .RN(n3914), .QN(n3809) );
  DFFRX1 \mean/sum_g_reg[20]  ( .D(n1835), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [0]) );
  DFFRX1 \mean/sum_g_reg[21]  ( .D(n1834), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [1]), .QN(n3835) );
  DFFRX1 \mean/sum_g_reg[22]  ( .D(n1833), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [2]) );
  DFFRX1 \mean/sum_g_reg[23]  ( .D(n1832), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [3]), .QN(n3836) );
  DFFRX1 \mean/sum_g_reg[24]  ( .D(n1831), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [4]) );
  DFFRX1 \mean/sum_g_reg[25]  ( .D(n1830), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [5]), .QN(n3832) );
  DFFRX1 \mean/sum_g_reg[26]  ( .D(n1829), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [6]) );
  DFFRX1 \mean/sum_g_reg[27]  ( .D(n1828), .CK(clk), .RN(n3914), .Q(
        \mean/g_mean_tmp [7]) );
  DFFRX1 \mean/sum_b_reg[26]  ( .D(n1827), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [6]) );
  DFFRX1 \mean/sum_b_reg[0]  ( .D(n1826), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [0]) );
  DFFRX1 \mean/sum_b_reg[1]  ( .D(n1825), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [1]) );
  DFFRX1 \mean/sum_b_reg[2]  ( .D(n1824), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [2]) );
  DFFRX1 \mean/sum_b_reg[3]  ( .D(n1823), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [3]) );
  DFFRX1 \mean/sum_b_reg[4]  ( .D(n1822), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [4]) );
  DFFRX1 \mean/sum_b_reg[5]  ( .D(n1821), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [5]) );
  DFFRX1 \mean/sum_b_reg[6]  ( .D(n1820), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [6]) );
  DFFRX1 \mean/sum_b_reg[7]  ( .D(n1819), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [7]) );
  DFFRX1 \mean/sum_b_reg[8]  ( .D(n1818), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [8]) );
  DFFRX1 \mean/sum_b_reg[9]  ( .D(n1817), .CK(clk), .RN(n3914), .QN(n3743) );
  DFFRX1 \mean/sum_b_reg[10]  ( .D(n1816), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [10]) );
  DFFRX1 \mean/sum_b_reg[11]  ( .D(n1815), .CK(clk), .RN(n3914), .QN(n3744) );
  DFFRX1 \mean/sum_b_reg[12]  ( .D(n1814), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [12]) );
  DFFRX1 \mean/sum_b_reg[13]  ( .D(n1813), .CK(clk), .RN(n3914), .QN(n3765) );
  DFFRX1 \mean/sum_b_reg[14]  ( .D(n1812), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [14]) );
  DFFRX1 \mean/sum_b_reg[15]  ( .D(n1811), .CK(clk), .RN(n3914), .QN(n3768) );
  DFFRX1 \mean/sum_b_reg[16]  ( .D(n1810), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [16]) );
  DFFRX1 \mean/sum_b_reg[17]  ( .D(n1809), .CK(clk), .RN(n3914), .QN(n3805) );
  DFFRX1 \mean/sum_b_reg[18]  ( .D(n1808), .CK(clk), .RN(n3914), .Q(
        \mean/sum_b [18]) );
  DFFRX1 \mean/sum_b_reg[19]  ( .D(n1807), .CK(clk), .RN(n3914), .QN(n3803) );
  DFFRX1 \mean/sum_b_reg[20]  ( .D(n1806), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [0]) );
  DFFRX1 \mean/sum_b_reg[21]  ( .D(n1805), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [1]), .QN(n3837) );
  DFFRX1 \mean/sum_b_reg[22]  ( .D(n1804), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [2]) );
  DFFRX1 \mean/sum_b_reg[23]  ( .D(n1803), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [3]), .QN(n3838) );
  DFFRX1 \mean/sum_b_reg[24]  ( .D(n1802), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [4]) );
  DFFRX1 \mean/sum_b_reg[25]  ( .D(n1801), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [5]), .QN(n3833) );
  DFFRX1 \mean/sum_b_reg[27]  ( .D(n1800), .CK(clk), .RN(n3914), .Q(
        \mean/b_mean_tmp [7]) );
  DFFRX1 \mean/finish_tmp_reg  ( .D(n2296), .CK(clk), .RN(n3914), .Q(
        \mean/finish_tmp ) );
  DFFRX1 \mean/finish_o_reg  ( .D(\mean/finish_tmp ), .CK(clk), .RN(n3914), 
        .QN(n3628) );
  DFFRX1 \mean/b_mean_o_reg[0]  ( .D(\mean/b_mean_tmp [0]), .CK(clk), .RN(
        n3914), .QN(n3699) );
  DFFRX1 \mean/b_mean_o_reg[1]  ( .D(\mean/b_mean_tmp [1]), .CK(clk), .RN(
        n3914), .Q(b_mean_out_mean[1]) );
  DFFRX1 \mean/b_mean_o_reg[2]  ( .D(\mean/b_mean_tmp [2]), .CK(clk), .RN(
        n3914), .Q(b_mean_out_mean[2]), .QN(n3875) );
  DFFRX1 \mean/b_mean_o_reg[3]  ( .D(\mean/b_mean_tmp [3]), .CK(clk), .RN(
        n3914), .QN(n3705) );
  DFFRX1 \mean/b_mean_o_reg[4]  ( .D(\mean/b_mean_tmp [4]), .CK(clk), .RN(
        n3914), .Q(b_mean_out_mean[4]) );
  DFFRX1 \mean/b_mean_o_reg[5]  ( .D(\mean/b_mean_tmp [5]), .CK(clk), .RN(
        n3914), .Q(b_mean_out_mean[5]) );
  DFFRX1 \mean/b_mean_o_reg[6]  ( .D(\mean/b_mean_tmp [6]), .CK(clk), .RN(
        n3914), .Q(b_mean_out_mean[6]) );
  DFFRX1 \mean/b_mean_o_reg[7]  ( .D(\mean/b_mean_tmp [7]), .CK(clk), .RN(
        n3915), .QN(n3712) );
  DFFRX1 \mean/g_mean_o_reg[0]  ( .D(\mean/g_mean_tmp [0]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[0]) );
  DFFRX1 \mean/g_mean_o_reg[1]  ( .D(\mean/g_mean_tmp [1]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[1]) );
  DFFRX1 \mean/g_mean_o_reg[2]  ( .D(\mean/g_mean_tmp [2]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[2]) );
  DFFRX1 \mean/g_mean_o_reg[3]  ( .D(\mean/g_mean_tmp [3]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[3]) );
  DFFRX1 \mean/g_mean_o_reg[4]  ( .D(\mean/g_mean_tmp [4]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[4]), .QN(n3909) );
  DFFRX1 \mean/g_mean_o_reg[5]  ( .D(\mean/g_mean_tmp [5]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[5]) );
  DFFRX1 \mean/g_mean_o_reg[6]  ( .D(\mean/g_mean_tmp [6]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[6]) );
  DFFRX1 \mean/g_mean_o_reg[7]  ( .D(\mean/g_mean_tmp [7]), .CK(clk), .RN(
        n3915), .Q(g_mean_out_mean[7]) );
  DFFRX1 \gain/valid_r_reg  ( .D(valid_in_gain), .CK(clk), .RN(n3915), .Q(
        \gain/valid_r ), .QN(n2378) );
  DFFRX1 \gain/r_mean_r_reg[0]  ( .D(n1784), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [0]), .QN(n3631) );
  DFFRX1 \gain/r_mean_r_reg[12]  ( .D(n1796), .CK(clk), .RN(n3915), .QN(n3641)
         );
  DFFRX1 \gain/r_mean_r_reg[11]  ( .D(n1795), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [11]), .QN(n3746) );
  DFFRX1 \gain/r_mean_r_reg[10]  ( .D(n1794), .CK(clk), .RN(n3915), .QN(n3737)
         );
  DFFRX1 \gain/r_mean_r_reg[9]  ( .D(n1793), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [9]), .QN(n3739) );
  DFFRX1 \gain/r_mean_r_reg[8]  ( .D(n1792), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [8]), .QN(n3730) );
  DFFRX1 \gain/r_mean_r_reg[7]  ( .D(n1791), .CK(clk), .RN(n3915), .QN(n3639)
         );
  DFFRX1 \gain/counter_R_r_reg[3]  ( .D(n1783), .CK(clk), .RN(n3915), .Q(
        \gain/counter_R_r [3]) );
  DFFRX1 \gain/state_R_r_reg[0]  ( .D(n2304), .CK(clk), .RN(n3915), .Q(
        \gain/state_R_r [0]) );
  DFFRX1 \gain/state_R_r_reg[1]  ( .D(n2303), .CK(clk), .RN(n3915), .Q(
        \gain/state_R_r [1]), .QN(n3738) );
  DFFRX1 \gain/finish_R_r_reg  ( .D(n2302), .CK(clk), .RN(n3915), .Q(
        \gain/finish_R_r ) );
  DFFRX1 \gain/r_mean_r_reg[15]  ( .D(n1799), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [15]), .QN(n3758) );
  DFFRX1 \gain/r_mean_r_reg[6]  ( .D(n1790), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [6]), .QN(n3724) );
  DFFRX1 \gain/r_mean_r_reg[5]  ( .D(n1789), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [5]), .QN(n3638) );
  DFFRX1 \gain/r_mean_r_reg[4]  ( .D(n1788), .CK(clk), .RN(n3915), .QN(n3618)
         );
  DFFRX1 \gain/r_mean_r_reg[3]  ( .D(n1787), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [3]), .QN(n3716) );
  DFFRX1 \gain/r_mean_r_reg[2]  ( .D(n1786), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [2]), .QN(n3632) );
  DFFRX1 \gain/r_mean_r_reg[1]  ( .D(n1785), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [1]), .QN(n3715) );
  DFFRX1 \gain/R_r_reg[7]  ( .D(n1733), .CK(clk), .RN(n3915), .Q(\gain/R_r [7]) );
  DFFRX1 \gain/R_r_reg[6]  ( .D(n1732), .CK(clk), .RN(n3915), .Q(\gain/R_r [6]) );
  DFFRX1 \gain/R_r_reg[5]  ( .D(n1731), .CK(clk), .RN(n3915), .Q(\gain/R_r [5]) );
  DFFRX1 \gain/R_r_reg[4]  ( .D(n1730), .CK(clk), .RN(n3915), .Q(\gain/R_r [4]) );
  DFFRX1 \gain/R_r_reg[3]  ( .D(n1729), .CK(clk), .RN(n3915), .Q(\gain/R_r [3]) );
  DFFRX1 \gain/R_r_reg[2]  ( .D(n1728), .CK(clk), .RN(n3915), .Q(\gain/R_r [2]) );
  DFFRX1 \gain/R_r_reg[1]  ( .D(n1727), .CK(clk), .RN(n3915), .Q(\gain/R_r [1]) );
  DFFRX1 \gain/R_r_reg[0]  ( .D(n1726), .CK(clk), .RN(n3915), .Q(\gain/R_r [0]) );
  DFFRX1 \gain/counter_R_r_reg[0]  ( .D(n1782), .CK(clk), .RN(n3915), .Q(
        \gain/counter_R_r [0]), .QN(n3815) );
  DFFRX1 \gain/counter_R_r_reg[1]  ( .D(n1781), .CK(clk), .RN(n3915), .Q(
        \gain/counter_R_r [1]) );
  DFFRX1 \gain/counter_R_r_reg[2]  ( .D(n1780), .CK(clk), .RN(n3915), .Q(
        \gain/counter_R_r [2]) );
  DFFRX1 \gain/r_mean_r_reg[14]  ( .D(n1798), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [14]), .QN(n3645) );
  DFFRX1 \gain/r_mean_r_reg[13]  ( .D(n1797), .CK(clk), .RN(n3915), .Q(
        \gain/r_mean_r [13]) );
  DFFRX1 \gain/g_mean_r_reg[0]  ( .D(n1763), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [0]), .QN(n3612) );
  DFFRX1 \gain/g_mean_r_reg[12]  ( .D(n1775), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [12]), .QN(n3848) );
  DFFRX1 \gain/g_mean_r_reg[11]  ( .D(n1774), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [11]), .QN(n3679) );
  DFFRX1 \gain/g_mean_r_reg[9]  ( .D(n1772), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [9]), .QN(n3740) );
  DFFRX1 \gain/g_mean_r_reg[8]  ( .D(n1771), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [8]), .QN(n3745) );
  DFFRX1 \gain/g_mean_r_reg[7]  ( .D(n1770), .CK(clk), .RN(n3915), .QN(n3642)
         );
  DFFRX1 \gain/counter_G_r_reg[3]  ( .D(n1762), .CK(clk), .RN(n3915), .Q(
        \gain/counter_G_r [3]) );
  DFFRX1 \gain/state_G_r_reg[0]  ( .D(n2300), .CK(clk), .RN(n3915), .Q(
        \gain/state_G_r [0]), .QN(n3767) );
  DFFRX1 \gain/state_G_r_reg[1]  ( .D(n2299), .CK(clk), .RN(n3915), .Q(
        \gain/state_G_r [1]) );
  DFFRX1 \gain/g_mean_r_reg[15]  ( .D(n1778), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [15]), .QN(n3755) );
  DFFRX1 \gain/g_mean_r_reg[6]  ( .D(n1769), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [6]), .QN(n3726) );
  DFFRX1 \gain/g_mean_r_reg[5]  ( .D(n1768), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [5]), .QN(n3616) );
  DFFRX1 \gain/g_mean_r_reg[4]  ( .D(n1767), .CK(clk), .RN(n3915), .QN(n3637)
         );
  DFFRX1 \gain/g_mean_r_reg[3]  ( .D(n1766), .CK(clk), .RN(n3915), .QN(n3615)
         );
  DFFRX1 \gain/g_mean_r_reg[2]  ( .D(n1765), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [2]), .QN(n3728) );
  DFFRX1 \gain/g_mean_r_reg[1]  ( .D(n1764), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [1]), .QN(n3633) );
  DFFRX1 \gain/G_r_reg[7]  ( .D(n1749), .CK(clk), .RN(n3915), .Q(\gain/G_r [7]) );
  DFFRX1 \gain/G_r_reg[6]  ( .D(n1748), .CK(clk), .RN(n3915), .Q(\gain/G_r [6]) );
  DFFRX1 \gain/G_r_reg[5]  ( .D(n1747), .CK(clk), .RN(n3915), .Q(\gain/G_r [5]) );
  DFFRX1 \gain/G_r_reg[4]  ( .D(n1746), .CK(clk), .RN(n3915), .Q(\gain/G_r [4]) );
  DFFRX1 \gain/G_r_reg[3]  ( .D(n1745), .CK(clk), .RN(n3915), .Q(\gain/G_r [3]) );
  DFFRX1 \gain/G_r_reg[2]  ( .D(n1744), .CK(clk), .RN(n3915), .Q(\gain/G_r [2]) );
  DFFRX1 \gain/G_r_reg[1]  ( .D(n1743), .CK(clk), .RN(n3915), .Q(\gain/G_r [1]) );
  DFFRX1 \gain/G_r_reg[0]  ( .D(n1742), .CK(clk), .RN(n3915), .Q(\gain/G_r [0]) );
  DFFRX1 \gain/counter_G_r_reg[0]  ( .D(n1761), .CK(clk), .RN(n3916), .Q(
        \gain/counter_G_r [0]) );
  DFFRX1 \gain/counter_G_r_reg[1]  ( .D(n1760), .CK(clk), .RN(n3916), .Q(
        \gain/counter_G_r [1]), .QN(n3820) );
  DFFRX1 \gain/counter_G_r_reg[2]  ( .D(n1759), .CK(clk), .RN(n3916), .Q(
        \gain/counter_G_r [2]) );
  DFFRX1 \gain/g_mean_r_reg[14]  ( .D(n1777), .CK(clk), .RN(n3916), .Q(
        \gain/g_mean_r [14]), .QN(n3862) );
  DFFRX1 \gain/g_mean_r_reg[13]  ( .D(n1776), .CK(clk), .RN(n3916), .Q(
        \gain/g_mean_r [13]) );
  DFFRX1 \gain/K_mean_r_reg[8]  ( .D(n3702), .CK(clk), .RN(n3916), .Q(
        \gain/K_mean_r [8]) );
  DFFRX1 \gain/G_r_reg[8]  ( .D(n1750), .CK(clk), .RN(n3916), .Q(\gain/G_r [8]) );
  DFFRX1 \gain/R_r_reg[8]  ( .D(n1734), .CK(clk), .RN(n3916), .Q(\gain/R_r [8]) );
  DFFRX1 \gain/K_mean_r_reg[9]  ( .D(\gain/K_mean_w [1]), .CK(clk), .RN(n3916), 
        .Q(\gain/K_mean_r [9]) );
  DFFRX1 \gain/G_r_reg[9]  ( .D(n1751), .CK(clk), .RN(n3916), .Q(\gain/G_r [9]) );
  DFFRX1 \gain/R_r_reg[9]  ( .D(n1735), .CK(clk), .RN(n3916), .Q(\gain/R_r [9]) );
  DFFRX1 \gain/G_r_reg[10]  ( .D(n1752), .CK(clk), .RN(n3916), .Q(
        \gain/G_r [10]), .QN(n3736) );
  DFFRX1 \gain/R_r_reg[10]  ( .D(n1736), .CK(clk), .RN(n3916), .Q(
        \gain/R_r [10]) );
  DFFRX1 \gain/G_r_reg[11]  ( .D(n1753), .CK(clk), .RN(n3916), .QN(n3649) );
  DFFRX1 \gain/R_r_reg[11]  ( .D(n1737), .CK(clk), .RN(n3916), .Q(
        \gain/R_r [11]) );
  DFFRX1 \gain/K_mean_r_reg[12]  ( .D(\gain/K_mean_w [4]), .CK(clk), .RN(n3916), .QN(n3817) );
  DFFRX1 \gain/G_r_reg[12]  ( .D(n1754), .CK(clk), .RN(n3916), .QN(n3648) );
  DFFRX1 \gain/R_r_reg[12]  ( .D(n1738), .CK(clk), .RN(n3916), .Q(
        \gain/R_r [12]) );
  DFFRX1 \gain/G_r_reg[13]  ( .D(n1755), .CK(clk), .RN(n3916), .QN(n3647) );
  DFFRX1 \gain/R_r_reg[13]  ( .D(n1739), .CK(clk), .RN(n3916), .QN(n3650) );
  DFFRX1 \gain/G_r_reg[14]  ( .D(n1756), .CK(clk), .RN(n3916), .QN(n3646) );
  DFFRX1 \gain/R_r_reg[14]  ( .D(n1740), .CK(clk), .RN(n3916), .Q(
        \gain/R_r [14]), .QN(n3769) );
  DFFRX1 \gain/G_r_reg[15]  ( .D(n1757), .CK(clk), .RN(n3916), .Q(
        \gain/G_r [15]) );
  DFFRX1 \gain/R_r_reg[15]  ( .D(n1741), .CK(clk), .RN(n3916), .Q(
        \gain/R_r [15]) );
  DFFRX1 \gain/finish_G_r_reg  ( .D(n2301), .CK(clk), .RN(n3916), .Q(
        \gain/finish_G_r ) );
  DFFRX1 \gain/valid_gain_o_reg  ( .D(\gain/N865 ), .CK(clk), .RN(n3916), .Q(
        valid_out_gain), .QN(n3864) );
  DFFRX1 \gain/state_B_r_reg[0]  ( .D(n2298), .CK(clk), .RN(n3916), .Q(
        \gain/state_B_r [0]) );
  DFFRX1 \gain/b_mean_r_reg[1]  ( .D(n1708), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [1]), .QN(n3614) );
  DFFRX1 \gain/b_mean_r_reg[12]  ( .D(n1719), .CK(clk), .RN(n3916), .QN(n3640)
         );
  DFFRX1 \gain/b_mean_r_reg[11]  ( .D(n1718), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [11]), .QN(n3839) );
  DFFRX1 \gain/b_mean_r_reg[10]  ( .D(n1717), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [10]) );
  DFFRX1 \gain/b_mean_r_reg[9]  ( .D(n1716), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [9]), .QN(n3734) );
  DFFRX1 \gain/b_mean_r_reg[8]  ( .D(n1715), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [8]) );
  DFFRX1 \gain/b_mean_r_reg[7]  ( .D(n1714), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [7]), .QN(n3635) );
  DFFRX1 \gain/state_B_r_reg[1]  ( .D(n2297), .CK(clk), .RN(n3916), .Q(
        \gain/state_B_r [1]), .QN(n3735) );
  DFFRX1 \gain/b_mean_r_reg[0]  ( .D(n1723), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [0]), .QN(n3727) );
  DFFRX1 \gain/b_mean_r_reg[6]  ( .D(n1713), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [6]), .QN(n3725) );
  DFFRX1 \gain/b_mean_r_reg[5]  ( .D(n1712), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [5]), .QN(n3636) );
  DFFRX1 \gain/b_mean_r_reg[4]  ( .D(n1711), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [4]), .QN(n3613) );
  DFFRX1 \gain/b_mean_r_reg[3]  ( .D(n1710), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [3]), .QN(n3619) );
  DFFRX1 \gain/b_mean_r_reg[2]  ( .D(n1709), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [2]), .QN(n2362) );
  DFFRX1 \gain/b_mean_r_reg[15]  ( .D(n1722), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [15]), .QN(n3753) );
  DFFRX1 \gain/b_mean_r_reg[14]  ( .D(n1721), .CK(clk), .RN(n3916), .QN(n3733)
         );
  DFFRX1 \gain/b_mean_r_reg[13]  ( .D(n1720), .CK(clk), .RN(n3916), .Q(
        \gain/b_mean_r [13]), .QN(n3872) );
  DFFRX1 \gain/counter_B_r_reg[3]  ( .D(n1724), .CK(clk), .RN(n3916), .Q(
        \gain/counter_B_r [3]) );
  DFFRX1 \gain/counter_B_r_reg[0]  ( .D(n1707), .CK(clk), .RN(n3916), .Q(
        \gain/counter_B_r [0]), .QN(n3873) );
  DFFRX1 \gain/counter_B_r_reg[1]  ( .D(n1706), .CK(clk), .RN(n3916), .Q(
        \gain/counter_B_r [1]) );
  DFFRX1 \gain/counter_B_r_reg[2]  ( .D(n1705), .CK(clk), .RN(n3916), .Q(
        \gain/counter_B_r [2]) );
  DFFRX1 \gain/K_B_tmp_reg[0]  ( .D(n1664), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [0]) );
  DFFRX1 \gain/K_B_tmp_reg[1]  ( .D(n1663), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [1]) );
  DFFRX1 \gain/K_B_tmp_reg[2]  ( .D(n1662), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [2]) );
  DFFRX1 \gain/K_B_tmp_reg[3]  ( .D(n1661), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [3]), .QN(n3904) );
  DFFRX1 \gain/K_B_tmp_reg[4]  ( .D(n1660), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [4]), .QN(n3689) );
  DFFRX1 \gain/K_B_o_reg[4]  ( .D(\gain/K_B_tmp [4]), .CK(clk), .RN(n3916), 
        .Q(k_b_out_gain[4]) );
  DFFRX1 \gain/K_B_tmp_reg[5]  ( .D(n1659), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [5]), .QN(n3893) );
  DFFRX1 \gain/K_B_o_reg[5]  ( .D(\gain/K_B_tmp [5]), .CK(clk), .RN(n3916), 
        .Q(k_b_out_gain[5]) );
  DFFRX1 \gain/K_B_tmp_reg[6]  ( .D(n1658), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [6]), .QN(n3690) );
  DFFRX1 \gain/K_B_o_reg[6]  ( .D(\gain/K_B_tmp [6]), .CK(clk), .RN(n3916), 
        .Q(k_b_out_gain[6]) );
  DFFRX1 \gain/K_B_tmp_reg[7]  ( .D(n1657), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [7]), .QN(n3894) );
  DFFRX1 \gain/K_B_o_reg[7]  ( .D(\gain/K_B_tmp [7]), .CK(clk), .RN(n3916), 
        .Q(k_b_out_gain[7]) );
  DFFRX1 \gain/K_B_tmp_reg[8]  ( .D(n1656), .CK(clk), .RN(n3916), .Q(
        \gain/K_B_tmp [8]), .QN(n3691) );
  DFFRX1 \gain/K_B_o_reg[8]  ( .D(\gain/K_B_tmp [8]), .CK(clk), .RN(n3916), 
        .Q(k_b_out_gain[8]) );
  DFFRX1 \gain/K_B_tmp_reg[9]  ( .D(n1655), .CK(clk), .RN(n3917), .Q(
        \gain/K_B_tmp [9]), .QN(n3895) );
  DFFRX1 \gain/K_B_o_reg[9]  ( .D(\gain/K_B_tmp [9]), .CK(clk), .RN(n3917), 
        .Q(k_b_out_gain[9]) );
  DFFRX1 \gain/K_B_tmp_reg[10]  ( .D(n1654), .CK(clk), .RN(n3917), .Q(
        \gain/K_B_tmp [10]), .QN(n3692) );
  DFFRX1 \gain/K_B_o_reg[10]  ( .D(\gain/K_B_tmp [10]), .CK(clk), .RN(n3917), 
        .Q(k_b_out_gain[10]) );
  DFFRX1 \gain/K_B_tmp_reg[11]  ( .D(n1653), .CK(clk), .RN(n3917), .Q(
        \gain/K_B_tmp [11]), .QN(n3907) );
  DFFRX1 \gain/K_B_o_reg[11]  ( .D(\gain/K_B_tmp [11]), .CK(clk), .RN(n3917), 
        .Q(k_b_out_gain[11]) );
  DFFRX1 \gain/K_G_tmp_reg[0]  ( .D(n1704), .CK(clk), .RN(n3917), .QN(n3830)
         );
  DFFRX1 \gain/K_G_tmp_reg[1]  ( .D(n1703), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [1]) );
  DFFRX1 \gain/K_G_tmp_reg[2]  ( .D(n1702), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [2]) );
  DFFRX1 \gain/K_G_tmp_reg[3]  ( .D(n1701), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [3]), .QN(n3906) );
  DFFRX1 \gain/K_G_tmp_reg[4]  ( .D(n1700), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [4]), .QN(n3694) );
  DFFRX1 \gain/K_G_o_reg[4]  ( .D(\gain/K_G_tmp [4]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[4]) );
  DFFRX1 \gain/K_G_tmp_reg[5]  ( .D(n1699), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [5]), .QN(n3898) );
  DFFRX1 \gain/K_G_o_reg[5]  ( .D(\gain/K_G_tmp [5]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[5]) );
  DFFRX1 \gain/K_G_tmp_reg[6]  ( .D(n1698), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [6]), .QN(n3695) );
  DFFRX1 \gain/K_G_o_reg[6]  ( .D(\gain/K_G_tmp [6]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[6]) );
  DFFRX1 \gain/K_G_tmp_reg[7]  ( .D(n1697), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [7]), .QN(n3899) );
  DFFRX1 \gain/K_G_o_reg[7]  ( .D(\gain/K_G_tmp [7]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[7]) );
  DFFRX1 \gain/K_G_tmp_reg[8]  ( .D(n1696), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [8]), .QN(n3696) );
  DFFRX1 \gain/K_G_o_reg[8]  ( .D(\gain/K_G_tmp [8]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[8]) );
  DFFRX1 \gain/K_G_tmp_reg[9]  ( .D(n1695), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [9]), .QN(n3900) );
  DFFRX1 \gain/K_G_o_reg[9]  ( .D(\gain/K_G_tmp [9]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[9]) );
  DFFRX1 \gain/K_G_tmp_reg[10]  ( .D(n1694), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [10]), .QN(n3697) );
  DFFRX1 \gain/K_G_o_reg[10]  ( .D(\gain/K_G_tmp [10]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[10]) );
  DFFRX1 \gain/K_G_tmp_reg[11]  ( .D(n1693), .CK(clk), .RN(n3917), .Q(
        \gain/K_G_tmp [11]), .QN(n3905) );
  DFFRX1 \gain/K_G_o_reg[11]  ( .D(\gain/K_G_tmp [11]), .CK(clk), .RN(n3917), 
        .Q(k_g_out_gain[11]) );
  DFFRX1 \gain/K_R_tmp_reg[0]  ( .D(n1692), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [0]), .QN(n3865) );
  DFFRX1 \gain/K_R_o_reg[0]  ( .D(\gain/K_R_tmp [0]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[0]) );
  DFFRX1 \gain/K_R_tmp_reg[1]  ( .D(n1691), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [1]), .QN(n3683) );
  DFFRX1 \gain/K_R_o_reg[1]  ( .D(\gain/K_R_tmp [1]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[1]) );
  DFFRX1 \gain/K_R_tmp_reg[2]  ( .D(n1690), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [2]), .QN(n3863) );
  DFFRX1 \gain/K_R_o_reg[2]  ( .D(\gain/K_R_tmp [2]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[2]) );
  DFFRX1 \gain/K_R_tmp_reg[3]  ( .D(n1689), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [3]), .QN(n3629) );
  DFFRX1 \gain/K_R_o_reg[3]  ( .D(\gain/K_R_tmp [3]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[3]) );
  DFFRX1 \gain/K_R_tmp_reg[4]  ( .D(n1688), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [4]), .QN(n3687) );
  DFFRX1 \gain/K_R_o_reg[4]  ( .D(\gain/K_R_tmp [4]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[4]) );
  DFFRX1 \gain/K_R_tmp_reg[5]  ( .D(n1687), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [5]), .QN(n3892) );
  DFFRX1 \gain/K_R_o_reg[5]  ( .D(\gain/K_R_tmp [5]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[5]) );
  DFFRX1 \gain/K_R_tmp_reg[6]  ( .D(n1686), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [6]), .QN(n3688) );
  DFFRX1 \gain/K_R_o_reg[6]  ( .D(\gain/K_R_tmp [6]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[6]), .QN(n3908) );
  DFFRX1 \gain/K_R_tmp_reg[7]  ( .D(n1685), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [7]), .QN(n3896) );
  DFFRX1 \gain/K_R_o_reg[7]  ( .D(\gain/K_R_tmp [7]), .CK(clk), .RN(n3917), 
        .QN(n3684) );
  DFFRX1 \gain/K_R_tmp_reg[8]  ( .D(n1684), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [8]), .QN(n3693) );
  DFFRX1 \gain/K_R_o_reg[8]  ( .D(\gain/K_R_tmp [8]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[8]) );
  DFFRX1 \gain/K_R_tmp_reg[9]  ( .D(n1683), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [9]), .QN(n3897) );
  DFFRX1 \gain/K_R_o_reg[9]  ( .D(\gain/K_R_tmp [9]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[9]) );
  DFFRX1 \gain/K_R_tmp_reg[10]  ( .D(n1682), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [10]), .QN(n3685) );
  DFFRX1 \gain/K_R_o_reg[10]  ( .D(\gain/K_R_tmp [10]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[10]) );
  DFFRX1 \gain/K_R_tmp_reg[11]  ( .D(n1681), .CK(clk), .RN(n3917), .Q(
        \gain/K_R_tmp [11]) );
  DFFRX1 \gain/K_R_o_reg[11]  ( .D(\gain/K_R_tmp [11]), .CK(clk), .RN(n3917), 
        .Q(k_r_out_gain[11]) );
  DFFRX1 \gain/B_r_reg[0]  ( .D(n1665), .CK(clk), .RN(n3917), .Q(\gain/B_r [0]) );
  DFFRX1 \gain/B_r_reg[1]  ( .D(n1666), .CK(clk), .RN(n3917), .Q(\gain/B_r [1]) );
  DFFRX1 \gain/B_r_reg[2]  ( .D(n1667), .CK(clk), .RN(n3917), .Q(\gain/B_r [2]) );
  DFFRX1 \gain/B_r_reg[3]  ( .D(n1668), .CK(clk), .RN(n3917), .Q(\gain/B_r [3]) );
  DFFRX1 \gain/B_r_reg[4]  ( .D(n1669), .CK(clk), .RN(n3917), .Q(\gain/B_r [4]) );
  DFFRX1 \gain/B_r_reg[5]  ( .D(n1670), .CK(clk), .RN(n3917), .Q(\gain/B_r [5]) );
  DFFRX1 \gain/B_r_reg[6]  ( .D(n1671), .CK(clk), .RN(n3917), .Q(\gain/B_r [6]) );
  DFFRX1 \gain/B_r_reg[7]  ( .D(n1672), .CK(clk), .RN(n3917), .Q(\gain/B_r [7]), .QN(n3723) );
  DFFRX1 \gain/B_r_reg[8]  ( .D(n1673), .CK(clk), .RN(n3917), .QN(n3748) );
  DFFRX1 \gain/B_r_reg[9]  ( .D(n1674), .CK(clk), .RN(n3917), .Q(\gain/B_r [9]) );
  DFFRX1 \gain/B_r_reg[10]  ( .D(n1675), .CK(clk), .RN(n3917), .QN(n3747) );
  DFFRX1 \gain/B_r_reg[11]  ( .D(n1676), .CK(clk), .RN(n3917), .QN(n3766) );
  DFFRX1 \gain/B_r_reg[12]  ( .D(n1677), .CK(clk), .RN(n3917), .Q(
        \gain/B_r [12]) );
  DFFRX1 \gain/B_r_reg[13]  ( .D(n1678), .CK(clk), .RN(n3917), .QN(n3754) );
  DFFRX1 \gain/B_r_reg[14]  ( .D(n1679), .CK(clk), .RN(n3917), .Q(
        \gain/B_r [14]) );
  DFFRX1 \gain/B_r_reg[15]  ( .D(n1680), .CK(clk), .RN(n3917), .Q(
        \gain/B_r [15]) );
  DFFRX1 \wb/K_B_r_reg[0]  ( .D(n3885), .CK(clk), .RN(n3917), .Q(\wb/K_B_r [0]) );
  DFFRX1 \wb/K_B_r_reg[1]  ( .D(n3891), .CK(clk), .RN(n3917), .Q(\wb/K_B_r [1]) );
  DFFRX1 \wb/K_B_r_reg[2]  ( .D(k_b_in_wb[6]), .CK(clk), .RN(n3918), .Q(
        \wb/K_B_r [2]) );
  DFFRX1 \wb/K_B_r_reg[3]  ( .D(k_b_in_wb[7]), .CK(clk), .RN(n3918), .Q(
        \wb/K_B_r [3]) );
  DFFRX1 \wb/K_B_r_reg[4]  ( .D(n3890), .CK(clk), .RN(n3918), .Q(\wb/K_B_r [4]) );
  DFFRX1 \wb/K_B_r_reg[5]  ( .D(k_b_in_wb[9]), .CK(clk), .RN(n3918), .Q(
        \wb/K_B_r [5]) );
  DFFRX1 \wb/K_B_r_reg[6]  ( .D(k_b_in_wb[10]), .CK(clk), .RN(n3918), .Q(
        \wb/K_B_r [6]) );
  DFFRX1 \wb/K_B_r_reg[7]  ( .D(k_b_in_wb[11]), .CK(clk), .RN(n3918), .Q(
        \wb/K_B_r [7]) );
  DFFRX1 \wb/K_G_r_reg[0]  ( .D(n3884), .CK(clk), .RN(n3918), .Q(\wb/K_G_r [0]) );
  DFFRX1 \wb/K_G_r_reg[1]  ( .D(n3889), .CK(clk), .RN(n3918), .Q(\wb/K_G_r [1]) );
  DFFRX1 \wb/K_G_r_reg[2]  ( .D(k_g_in_wb[6]), .CK(clk), .RN(n3918), .Q(
        \wb/K_G_r [2]) );
  DFFRX1 \wb/K_G_r_reg[3]  ( .D(n3888), .CK(clk), .RN(n3918), .Q(\wb/K_G_r [3]) );
  DFFRX1 \wb/K_G_r_reg[4]  ( .D(k_g_in_wb[8]), .CK(clk), .RN(n3918), .Q(
        \wb/K_G_r [4]) );
  DFFRX1 \wb/K_G_r_reg[5]  ( .D(k_g_in_wb[9]), .CK(clk), .RN(n3918), .Q(
        \wb/K_G_r [5]) );
  DFFRX1 \wb/K_G_r_reg[6]  ( .D(k_g_in_wb[10]), .CK(clk), .RN(n3918), .Q(
        \wb/K_G_r [6]) );
  DFFRX1 \wb/K_G_r_reg[7]  ( .D(k_g_in_wb[11]), .CK(clk), .RN(n3918), .Q(
        \wb/K_G_r [7]) );
  DFFRX1 \wb/K_R_r_reg[0]  ( .D(n3883), .CK(clk), .RN(n3918), .Q(\wb/K_R_r [0]) );
  DFFRX1 \wb/K_R_r_reg[1]  ( .D(n3886), .CK(clk), .RN(n3918), .Q(\wb/K_R_r [1]) );
  DFFRX1 \wb/K_R_r_reg[2]  ( .D(k_r_in_wb[6]), .CK(clk), .RN(n3918), .Q(
        \wb/K_R_r [2]) );
  DFFRX1 \wb/K_R_r_reg[3]  ( .D(k_r_in_wb[7]), .CK(clk), .RN(n3918), .Q(
        \wb/K_R_r [3]) );
  DFFRX1 \wb/K_R_r_reg[4]  ( .D(n3887), .CK(clk), .RN(n3918), .Q(\wb/K_R_r [4]) );
  DFFRX1 \wb/K_R_r_reg[5]  ( .D(k_r_in_wb[9]), .CK(clk), .RN(n3918), .Q(
        \wb/K_R_r [5]) );
  DFFRX1 \wb/K_R_r_reg[6]  ( .D(k_r_in_wb[10]), .CK(clk), .RN(n3918), .Q(
        \wb/K_R_r [6]) );
  DFFRX1 \wb/K_R_r_reg[7]  ( .D(k_r_in_wb[11]), .CK(clk), .RN(n3918), .Q(
        \wb/K_R_r [7]) );
  DFFRX1 \wb/value_r_reg[0]  ( .D(pixel_in_wb[0]), .CK(clk), .RN(n3918), .QN(
        n3722) );
  DFFRX1 \wb/value_r_reg[1]  ( .D(pixel_in_wb[1]), .CK(clk), .RN(n3918), .Q(
        n2317) );
  DFFRX1 \wb/value_r_reg[2]  ( .D(pixel_in_wb[2]), .CK(clk), .RN(n3918), .Q(
        n2316) );
  DFFRX1 \wb/value_r_reg[3]  ( .D(pixel_in_wb[3]), .CK(clk), .RN(n3918), .Q(
        n2315) );
  DFFRX1 \wb/value_r_reg[4]  ( .D(pixel_in_wb[4]), .CK(clk), .RN(n3918), .Q(
        \wb/value_r [4]) );
  DFFRX1 \wb/value_r_reg[5]  ( .D(pixel_in_wb[5]), .CK(clk), .RN(n3918), .Q(
        \wb/value_r [5]) );
  DFFRX1 \wb/value_r_reg[6]  ( .D(pixel_in_wb[6]), .CK(clk), .RN(n3918), .Q(
        \wb/value_r [6]) );
  DFFRX1 \wb/value_r_reg[7]  ( .D(pixel_in_wb[7]), .CK(clk), .RN(n2621), .Q(
        \wb/value_r [7]) );
  DFFRX1 \wb/valid_gain_r_reg  ( .D(valid_gain_in_wb), .CK(clk), .RN(n3918), 
        .QN(n3880) );
  DFFRX1 \wb/valid_value_r_reg  ( .D(valid_value_in_wb), .CK(clk), .RN(n3918), 
        .QN(n3686) );
  DFFRX1 \wb/color_r_reg[0]  ( .D(color_in_wb[0]), .CK(clk), .RN(n2621), .Q(
        \wb/color_r [0]), .QN(n3719) );
  DFFRX1 \wb/color_tmp_reg[0]  ( .D(\wb/color_r [0]), .CK(clk), .RN(n3918), 
        .Q(color_out_wb[0]) );
  DFFRX1 \wb/color_r_reg[1]  ( .D(color_in_wb[1]), .CK(clk), .RN(n2621), .Q(
        \wb/color_r [1]), .QN(n3720) );
  DFFRX1 \wb/color_tmp_reg[1]  ( .D(\wb/color_r [1]), .CK(clk), .RN(n3918), 
        .Q(color_out_wb[1]) );
  DFFRX1 \wb/last_tmp_reg  ( .D(last_pic_in_wb), .CK(clk), .RN(n2621), .Q(
        \wb/last_tmp ) );
  DFFRX1 \wb/last_o_reg  ( .D(\wb/last_tmp ), .CK(clk), .RN(n3918), .Q(
        last_pic_out_wb) );
  DFFRX1 \wb/value_o_reg[0]  ( .D(\wb/value_tmp_2 [0]), .CK(clk), .RN(n2621), 
        .Q(pixel_out_wb[0]) );
  DFFRX1 \wb/value_o_reg[1]  ( .D(\wb/value_tmp_2 [1]), .CK(clk), .RN(n3918), 
        .QN(n3903) );
  DFFRX1 \wb/value_o_reg[2]  ( .D(\wb/value_tmp_2 [2]), .CK(clk), .RN(n2621), 
        .Q(pixel_out_wb[2]) );
  DFFRX1 \wb/value_o_reg[3]  ( .D(\wb/value_tmp_2 [3]), .CK(clk), .RN(n3918), 
        .Q(pixel_out_wb[3]), .QN(n3881) );
  DFFRX1 \wb/value_o_reg[4]  ( .D(\wb/value_tmp_2 [4]), .CK(clk), .RN(n2556), 
        .QN(n3871) );
  DFFRX1 \wb/value_o_reg[5]  ( .D(\wb/value_tmp_2 [5]), .CK(clk), .RN(n2556), 
        .QN(n3902) );
  DFFRX1 \wb/value_o_reg[6]  ( .D(\wb/value_tmp_2 [6]), .CK(clk), .RN(n2621), 
        .QN(n3901) );
  DFFRX1 \wb/value_o_reg[7]  ( .D(\wb/value_tmp_2 [7]), .CK(clk), .RN(n3919), 
        .Q(pixel_out_wb[7]), .QN(n3882) );
  DFFRX1 \wb/valid_o_reg  ( .D(n3920), .CK(clk), .RN(n3918), .Q(
        valid_value_out_wb) );
  DFFRX1 \color_in_reg_reg[1]  ( .D(n1648), .CK(clk), .RN(n3918), .QN(
        color_in_wb[1]) );
  DFFRX1 \color_in_reg_reg[0]  ( .D(n1647), .CK(clk), .RN(n2621), .QN(
        color_in_wb[0]) );
  DFFRX1 \denoise/color_2_reg[0]  ( .D(n2376), .CK(clk), .RN(n2556), .QN(
        \denoise/color_2 [0]) );
  DFFRX1 \denoise/color_2_reg[1]  ( .D(n2375), .CK(clk), .RN(n2556), .Q(n3821), 
        .QN(\denoise/color_2 [1]) );
  DFFRX1 \gain/MSB_R_r_reg[1]  ( .D(n1644), .CK(clk), .RN(n3919), .QN(
        \gain/MSB_R_r[1] ) );
  DFFRX1 \gain/MSB_R_r_reg[2]  ( .D(n1643), .CK(clk), .RN(n2621), .QN(
        \gain/N303 ) );
  DFFRX1 \gain/MSB_G_r_reg[1]  ( .D(n1642), .CK(clk), .RN(n3918), .QN(
        \gain/MSB_G_r[1] ) );
  DFFRX1 \gain/MSB_G_r_reg[2]  ( .D(n1641), .CK(clk), .RN(n2556), .Q(n3776), 
        .QN(\gain/N456 ) );
  DFFRX1 \gain/MSB_B_r_reg[0]  ( .D(n1649), .CK(clk), .RN(n3916), .Q(n3620), 
        .QN(\gain/N648 ) );
  DFFRX1 \gain/MSB_B_r_reg[1]  ( .D(n1640), .CK(clk), .RN(n2621), .QN(
        \gain/MSB_B_r[1] ) );
  DFFRX1 \gain/MSB_B_r_reg[2]  ( .D(n1639), .CK(clk), .RN(n3919), .Q(n3680), 
        .QN(\gain/N626 ) );
  DFFRX1 \denoise/valid_count_0_reg[0]  ( .D(n1636), .CK(clk), .RN(n3918), .Q(
        \denoise/valid_count_0 [0]), .QN(n3621) );
  ADDHXL \DP_OP_654J1_124_416/U43  ( .A(\DP_OP_654J1_124_416/n146 ), .B(
        \DP_OP_654J1_124_416/n139 ), .CO(\DP_OP_654J1_124_416/n83 ), .S(
        \DP_OP_654J1_124_416/n84 ) );
  ADDHXL \DP_OP_654J1_124_416/U42  ( .A(\DP_OP_654J1_124_416/n131 ), .B(
        \DP_OP_654J1_124_416/n124 ), .CO(\DP_OP_654J1_124_416/n81 ), .S(
        \DP_OP_654J1_124_416/n82 ) );
  ADDHXL \DP_OP_654J1_124_416/U35  ( .A(\DP_OP_654J1_124_416/n107 ), .B(
        \DP_OP_654J1_124_416/n100 ), .CO(\DP_OP_654J1_124_416/n65 ), .S(
        \DP_OP_654J1_124_416/n66 ) );
  ADDHXL \DP_OP_654J1_124_416/U28  ( .A(\DP_OP_654J1_124_416/n98 ), .B(
        \DP_OP_654J1_124_416/n91 ), .CO(\DP_OP_654J1_124_416/n47 ), .S(
        \DP_OP_654J1_124_416/n48 ) );
  DFFRX1 \gain/K_mean_r_reg[11]  ( .D(\gain/K_mean_w [3]), .CK(clk), .RN(n3916), .Q(\gain/K_mean_r [11]), .QN(n3874) );
  DFFRX1 \gain/K_mean_r_reg[10]  ( .D(\gain/K_mean_w [2]), .CK(clk), .RN(n3916), .Q(\gain/K_mean_r [10]) );
  DFFRX1 \gain/K_mean_r_reg[14]  ( .D(\gain/K_mean_w [6]), .CK(clk), .RN(n3916), .QN(n3816) );
  DFFRX1 \gain/K_mean_r_reg[13]  ( .D(\gain/K_mean_w [5]), .CK(clk), .RN(n3916), .QN(n3818) );
  DFFRX1 \gain/K_mean_r_reg[15]  ( .D(\gain/K_mean_w [7]), .CK(clk), .RN(n3916), .Q(\gain/K_mean_r [15]) );
  DFFRX1 finish_reg_reg ( .D(n2286), .CK(clk), .RN(n2556), .QN(n2336) );
  DFFRX1 \pixel_out_reg_reg[0]  ( .D(n2287), .CK(clk), .RN(n2621), .QN(n2338)
         );
  DFFRX1 \pixel_out_reg_reg[1]  ( .D(n2288), .CK(clk), .RN(n3919), .QN(n2340)
         );
  ADDFX1 \DP_OP_654J1_124_416/U14  ( .A(\DP_OP_654J1_124_416/n14 ), .B(
        \DP_OP_654J1_124_416/n132 ), .CI(\DP_OP_654J1_124_416/n84 ), .CO(
        \DP_OP_654J1_124_416/n13 ) );
  ADDFX1 \DP_OP_654J1_124_416/U13  ( .A(\DP_OP_654J1_124_416/n80 ), .B(
        \DP_OP_654J1_124_416/n82 ), .CI(\DP_OP_654J1_124_416/n13 ), .CO(
        \DP_OP_654J1_124_416/n12 ) );
  ADDFX1 \intadd_5/U7  ( .A(n3614), .B(\gain/B_r [1]), .CI(\intadd_5/CI ), 
        .CO(\intadd_5/n6 ), .S(\intadd_5/SUM[0] ) );
  ADDFX1 \DP_OP_654J1_124_416/U16  ( .A(\DP_OP_654J1_124_416/n86 ), .B(
        \DP_OP_654J1_124_416/n93 ), .CI(\DP_OP_654J1_124_416/n17 ), .CO(
        \DP_OP_654J1_124_416/n15 ), .S(\DP_OP_654J1_124_416/n16 ) );
  ADDFX1 \DP_OP_654J1_124_416/U41  ( .A(\DP_OP_654J1_124_416/n138 ), .B(
        \DP_OP_654J1_124_416/n145 ), .CI(\DP_OP_654J1_124_416/n83 ), .CO(
        \DP_OP_654J1_124_416/n79 ), .S(\DP_OP_654J1_124_416/n80 ) );
  ADDFX1 \DP_OP_654J1_124_416/U12  ( .A(\DP_OP_654J1_124_416/n76 ), .B(
        \DP_OP_654J1_124_416/n79 ), .CI(\DP_OP_654J1_124_416/n12 ), .CO(
        \DP_OP_654J1_124_416/n11 ), .S(\C237/DATA2_0 ) );
  ADDFX1 \DP_OP_654J1_124_416/U11  ( .A(\DP_OP_654J1_124_416/n69 ), .B(
        \DP_OP_654J1_124_416/n75 ), .CI(\DP_OP_654J1_124_416/n11 ), .CO(
        \DP_OP_654J1_124_416/n10 ), .S(\C237/DATA2_1 ) );
  ADDFX1 \DP_OP_654J1_124_416/U10  ( .A(\DP_OP_654J1_124_416/n61 ), .B(
        \DP_OP_654J1_124_416/n68 ), .CI(\DP_OP_654J1_124_416/n10 ), .CO(
        \DP_OP_654J1_124_416/n9 ), .S(\C237/DATA2_2 ) );
  ADDFX1 \DP_OP_654J1_124_416/U9  ( .A(\DP_OP_654J1_124_416/n51 ), .B(
        \DP_OP_654J1_124_416/n60 ), .CI(\DP_OP_654J1_124_416/n9 ), .CO(
        \DP_OP_654J1_124_416/n8 ), .S(\C237/DATA2_3 ) );
  ADDFX1 \DP_OP_654J1_124_416/U8  ( .A(\DP_OP_654J1_124_416/n41 ), .B(
        \DP_OP_654J1_124_416/n50 ), .CI(\DP_OP_654J1_124_416/n8 ), .CO(
        \DP_OP_654J1_124_416/n7 ), .S(\C237/DATA2_4 ) );
  ADDFX1 \DP_OP_654J1_124_416/U7  ( .A(\DP_OP_654J1_124_416/n33 ), .B(
        \DP_OP_654J1_124_416/n40 ), .CI(\DP_OP_654J1_124_416/n7 ), .CO(
        \DP_OP_654J1_124_416/n6 ), .S(\C237/DATA2_5 ) );
  ADDHXL \DP_OP_654J1_124_416/U40  ( .A(\DP_OP_654J1_124_416/n123 ), .B(
        \DP_OP_654J1_124_416/n116 ), .CO(\DP_OP_654J1_124_416/n77 ), .S(
        \DP_OP_654J1_124_416/n78 ) );
  ADDHXL \DP_OP_654J1_124_416/U38  ( .A(\DP_OP_654J1_124_416/n115 ), .B(
        \DP_OP_654J1_124_416/n108 ), .CO(\DP_OP_654J1_124_416/n72 ), .S(
        \DP_OP_654J1_124_416/n73 ) );
  ADDHXL \DP_OP_654J1_124_416/U32  ( .A(\DP_OP_654J1_124_416/n99 ), .B(
        \DP_OP_654J1_124_416/n92 ), .CO(\DP_OP_654J1_124_416/n57 ), .S(
        \DP_OP_654J1_124_416/n58 ) );
  ADDFX1 \intadd_3/U9  ( .A(\denoise/sum3 [2]), .B(\denoise/sum6 [2]), .CI(
        \intadd_3/CI ), .CO(\intadd_3/n8 ), .S(\intadd_1/A[2] ) );
  ADDFX1 \intadd_1/U11  ( .A(\denoise/sum6 [0]), .B(\denoise/sum3 [0]), .CI(
        \denoise/n_new_sum6 [0]), .CO(\intadd_1/n10 ), .S(\denoise/n_sum9 [0])
         );
  ADDFX1 \intadd_3/U8  ( .A(\denoise/sum3 [3]), .B(\denoise/sum6 [3]), .CI(
        \intadd_3/n8 ), .CO(\intadd_3/n7 ), .S(\intadd_1/A[3] ) );
  ADDFX1 \intadd_1/U4  ( .A(\denoise/n_new_sum6 [7]), .B(\intadd_1/B[7] ), 
        .CI(\intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\denoise/n_sum9 [7]) );
  ADDFX1 \intadd_1/U5  ( .A(\denoise/n_new_sum6 [6]), .B(\intadd_1/B[6] ), 
        .CI(\intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\denoise/n_sum9 [6]) );
  ADDFX1 \intadd_1/U6  ( .A(\denoise/n_new_sum6 [5]), .B(\intadd_1/B[5] ), 
        .CI(\intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\denoise/n_sum9 [5]) );
  ADDFX1 \intadd_1/U7  ( .A(\denoise/n_new_sum6 [4]), .B(\intadd_1/B[4] ), 
        .CI(\intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\denoise/n_sum9 [4]) );
  ADDFX1 \intadd_1/U8  ( .A(\intadd_1/A[3] ), .B(\denoise/n_new_sum6 [3]), 
        .CI(\intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\denoise/n_sum9 [3]) );
  ADDFX1 \intadd_1/U9  ( .A(\intadd_1/A[2] ), .B(\denoise/n_new_sum6 [2]), 
        .CI(\intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\denoise/n_sum9 [2]) );
  ADDFX1 \intadd_1/U10  ( .A(\intadd_1/A[1] ), .B(\denoise/n_new_sum6 [1]), 
        .CI(\intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\denoise/n_sum9 [1]) );
  ADDFX1 \DP_OP_654J1_124_416/U37  ( .A(\DP_OP_654J1_124_416/n122 ), .B(
        \DP_OP_654J1_124_416/n143 ), .CI(\DP_OP_654J1_124_416/n129 ), .CO(
        \DP_OP_654J1_124_416/n70 ), .S(\DP_OP_654J1_124_416/n71 ) );
  ADDFX1 \DP_OP_654J1_124_416/U31  ( .A(\DP_OP_654J1_124_416/n106 ), .B(
        \DP_OP_654J1_124_416/n141 ), .CI(\DP_OP_654J1_124_416/n113 ), .CO(
        \DP_OP_654J1_124_416/n55 ), .S(\DP_OP_654J1_124_416/n56 ) );
  ADDFX1 \DP_OP_654J1_124_416/U27  ( .A(\DP_OP_654J1_124_416/n133 ), .B(
        \DP_OP_654J1_124_416/n112 ), .CI(\DP_OP_654J1_124_416/n126 ), .CO(
        \DP_OP_654J1_124_416/n45 ), .S(\DP_OP_654J1_124_416/n46 ) );
  ADDFX1 \DP_OP_654J1_124_416/U24  ( .A(\DP_OP_654J1_124_416/n90 ), .B(
        \DP_OP_654J1_124_416/n125 ), .CI(\DP_OP_654J1_124_416/n97 ), .CO(
        \DP_OP_654J1_124_416/n37 ), .S(\DP_OP_654J1_124_416/n38 ) );
  ADDFX1 \DP_OP_654J1_124_416/U19  ( .A(\DP_OP_654J1_124_416/n102 ), .B(
        \DP_OP_654J1_124_416/n109 ), .CI(\DP_OP_654J1_124_416/n88 ), .CO(
        \DP_OP_654J1_124_416/n23 ), .S(\DP_OP_654J1_124_416/n24 ) );
  ADDFX1 \intadd_4/U9  ( .A(\denoise/pos9 [0]), .B(\denoise/pos7 [0]), .CI(
        \denoise/pos8 [0]), .CO(\intadd_4/n8 ), .S(\denoise/n_new_sum6 [0]) );
  ADDFX1 \intadd_4/U8  ( .A(\denoise/pos9 [1]), .B(\intadd_4/B[1] ), .CI(
        \intadd_4/n8 ), .CO(\intadd_4/n7 ), .S(\denoise/n_new_sum6 [1]) );
  ADDFX1 \intadd_3/U3  ( .A(\denoise/sum3 [8]), .B(\denoise/sum6 [8]), .CI(
        \intadd_3/n3 ), .CO(\intadd_3/n2 ), .S(\intadd_1/A[8] ) );
  ADDFX1 \intadd_3/U4  ( .A(\denoise/sum3 [7]), .B(\denoise/sum6 [7]), .CI(
        \intadd_3/n4 ), .CO(\intadd_3/n3 ), .S(\intadd_1/B[7] ) );
  ADDFX1 \intadd_3/U5  ( .A(\denoise/sum3 [6]), .B(\denoise/sum6 [6]), .CI(
        \intadd_3/n5 ), .CO(\intadd_3/n4 ), .S(\intadd_1/B[6] ) );
  ADDFX1 \intadd_4/U4  ( .A(\intadd_4/A[5] ), .B(\intadd_4/B[5] ), .CI(
        \intadd_4/n4 ), .CO(\intadd_4/n3 ), .S(\denoise/n_new_sum6 [5]) );
  ADDFX1 \intadd_3/U6  ( .A(\denoise/sum3 [5]), .B(\denoise/sum6 [5]), .CI(
        \intadd_3/n6 ), .CO(\intadd_3/n5 ), .S(\intadd_1/B[5] ) );
  ADDFX1 \intadd_4/U5  ( .A(\intadd_4/A[4] ), .B(\intadd_4/B[4] ), .CI(
        \intadd_4/n5 ), .CO(\intadd_4/n4 ), .S(\denoise/n_new_sum6 [4]) );
  ADDFX1 \intadd_3/U7  ( .A(\denoise/sum3 [4]), .B(\denoise/sum6 [4]), .CI(
        \intadd_3/n7 ), .CO(\intadd_3/n6 ), .S(\intadd_1/B[4] ) );
  ADDFX1 \intadd_4/U6  ( .A(\intadd_4/A[3] ), .B(\intadd_4/B[3] ), .CI(
        \intadd_4/n6 ), .CO(\intadd_4/n5 ), .S(\denoise/n_new_sum6 [3]) );
  ADDFX1 \intadd_1/U3  ( .A(\intadd_1/A[8] ), .B(\denoise/n_new_sum6 [8]), 
        .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\denoise/n_sum9 [8]) );
  ADDFX1 \DP_OP_654J1_124_416/U2  ( .A(\DP_OP_654J1_124_416/n15 ), .B(
        \DP_OP_654J1_124_416/n85 ), .CI(\DP_OP_654J1_124_416/n2 ), .CO(
        \DP_OP_654J1_124_416/n1 ), .S(\C237/DATA2_10 ) );
  ADDFX1 \intadd_4/U7  ( .A(\intadd_4/A[2] ), .B(\intadd_4/B[2] ), .CI(
        \intadd_4/n7 ), .CO(\intadd_4/n6 ), .S(\denoise/n_new_sum6 [2]) );
  ADDFX1 \intadd_4/U3  ( .A(\intadd_4/A[6] ), .B(\intadd_4/B[6] ), .CI(
        \intadd_4/n3 ), .CO(\intadd_4/n2 ), .S(\denoise/n_new_sum6 [6]) );
  ADDFX1 \intadd_3/U2  ( .A(\denoise/sum3 [9]), .B(\denoise/sum6 [9]), .CI(
        \intadd_3/n2 ), .CO(\intadd_3/n1 ), .S(\intadd_1/B[9] ) );
  ADDFX1 \intadd_1/U2  ( .A(\denoise/n_new_sum6 [9]), .B(\intadd_1/B[9] ), 
        .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\denoise/n_sum9 [9]) );
  ADDFX1 \intadd_5/U6  ( .A(n2362), .B(\gain/B_r [2]), .CI(\intadd_5/n6 ), 
        .CO(\intadd_5/n5 ), .S(\intadd_5/SUM[1] ) );
  ADDFX1 \DP_OP_654J1_124_416/U3  ( .A(\DP_OP_654J1_124_416/n18 ), .B(
        \DP_OP_654J1_124_416/n16 ), .CI(\DP_OP_654J1_124_416/n3 ), .CO(
        \DP_OP_654J1_124_416/n2 ), .S(\C237/DATA2_9 ) );
  ADDFX1 \DP_OP_654J1_124_416/U6  ( .A(\DP_OP_654J1_124_416/n27 ), .B(
        \DP_OP_654J1_124_416/n32 ), .CI(\DP_OP_654J1_124_416/n6 ), .CO(
        \DP_OP_654J1_124_416/n5 ), .S(\C237/DATA2_6 ) );
  ADDFX1 \intadd_4/U2  ( .A(\intadd_4/A[7] ), .B(\intadd_4/B[7] ), .CI(
        \intadd_4/n2 ), .CO(\intadd_4/n1 ), .S(\denoise/n_new_sum6 [7]) );
  ADDFX1 \intadd_5/U5  ( .A(n3619), .B(\gain/B_r [3]), .CI(\intadd_5/n5 ), 
        .CO(\intadd_5/n4 ), .S(\intadd_5/SUM[2] ) );
  ADDFX1 \DP_OP_654J1_124_416/U4  ( .A(\DP_OP_654J1_124_416/n21 ), .B(
        \DP_OP_654J1_124_416/n19 ), .CI(\DP_OP_654J1_124_416/n4 ), .CO(
        \DP_OP_654J1_124_416/n3 ), .S(\C237/DATA2_8 ) );
  ADDFX1 \DP_OP_654J1_124_416/U5  ( .A(\DP_OP_654J1_124_416/n22 ), .B(
        \DP_OP_654J1_124_416/n26 ), .CI(\DP_OP_654J1_124_416/n5 ), .CO(
        \DP_OP_654J1_124_416/n4 ), .S(\C237/DATA2_7 ) );
  ADDFX1 \intadd_5/U3  ( .A(n3636), .B(\gain/B_r [5]), .CI(\intadd_5/n3 ), 
        .CO(\intadd_5/n2 ), .S(\intadd_5/SUM[4] ) );
  ADDFX1 \intadd_5/U4  ( .A(n3613), .B(\gain/B_r [4]), .CI(\intadd_5/n4 ), 
        .CO(\intadd_5/n3 ), .S(\intadd_5/SUM[3] ) );
  ADDFX1 \intadd_2/U3  ( .A(n3745), .B(\gain/G_r [8]), .CI(\intadd_2/n3 ), 
        .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[7] ) );
  ADDFX1 \intadd_6/U5  ( .A(\gain/g_mean_r [11]), .B(n3649), .CI(\intadd_6/CI ), .CO(\intadd_6/n4 ), .S(\intadd_6/SUM[0] ) );
  ADDFX1 \intadd_6/U3  ( .A(\gain/g_mean_r [13]), .B(n3647), .CI(\intadd_6/n3 ), .CO(\intadd_6/n2 ), .S(\intadd_6/SUM[2] ) );
  ADDFX1 \intadd_6/U4  ( .A(\gain/g_mean_r [12]), .B(n3648), .CI(\intadd_6/n4 ), .CO(\intadd_6/n3 ), .S(\intadd_6/SUM[1] ) );
  ADDFX1 \intadd_2/U9  ( .A(n3728), .B(\gain/G_r [2]), .CI(\intadd_2/n9 ), 
        .CO(\intadd_2/n8 ), .S(\intadd_2/SUM[1] ) );
  ADDFX1 \intadd_2/U6  ( .A(n3616), .B(\gain/G_r [5]), .CI(\intadd_2/n6 ), 
        .CO(\intadd_2/n5 ), .S(\intadd_2/SUM[4] ) );
  ADDFX1 \intadd_2/U10  ( .A(n3633), .B(\gain/G_r [1]), .CI(\intadd_2/CI ), 
        .CO(\intadd_2/n9 ), .S(\intadd_2/SUM[0] ) );
  ADDFX1 \intadd_2/U7  ( .A(n3637), .B(\gain/G_r [4]), .CI(\intadd_2/n7 ), 
        .CO(\intadd_2/n6 ), .S(\intadd_2/SUM[3] ) );
  ADDFX1 \intadd_2/U4  ( .A(n3642), .B(\gain/G_r [7]), .CI(\intadd_2/n4 ), 
        .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[6] ) );
  ADDFX1 \intadd_2/U8  ( .A(n3615), .B(\gain/G_r [3]), .CI(\intadd_2/n8 ), 
        .CO(\intadd_2/n7 ), .S(\intadd_2/SUM[2] ) );
  ADDFX1 \intadd_2/U5  ( .A(n3726), .B(\gain/G_r [6]), .CI(\intadd_2/n5 ), 
        .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[5] ) );
  ADDFX1 \intadd_0/U5  ( .A(n3730), .B(\gain/R_r [8]), .CI(\intadd_0/n5 ), 
        .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[7] ) );
  ADDFX1 \intadd_0/U4  ( .A(n3739), .B(\gain/R_r [9]), .CI(\intadd_0/n4 ), 
        .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[8] ) );
  ADDFX1 \intadd_0/U3  ( .A(n3737), .B(\gain/R_r [10]), .CI(\intadd_0/n3 ), 
        .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[9] ) );
  ADDFX1 \intadd_0/U10  ( .A(n3716), .B(\gain/R_r [3]), .CI(\intadd_0/n10 ), 
        .CO(\intadd_0/n9 ), .S(\intadd_0/SUM[2] ) );
  ADDFX1 \intadd_0/U9  ( .A(n3618), .B(\gain/R_r [4]), .CI(\intadd_0/n9 ), 
        .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[3] ) );
  ADDFX1 \intadd_0/U8  ( .A(n3638), .B(\gain/R_r [5]), .CI(\intadd_0/n8 ), 
        .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[4] ) );
  ADDFX1 \intadd_0/U6  ( .A(n3639), .B(\gain/R_r [7]), .CI(\intadd_0/n6 ), 
        .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[6] ) );
  ADDFX1 \intadd_0/U11  ( .A(n3632), .B(\gain/R_r [2]), .CI(\intadd_0/n11 ), 
        .CO(\intadd_0/n10 ), .S(\intadd_0/SUM[1] ) );
  ADDFX1 \intadd_0/U12  ( .A(n3715), .B(\gain/R_r [1]), .CI(\intadd_0/CI ), 
        .CO(\intadd_0/n11 ), .S(\intadd_0/SUM[0] ) );
  ADDFX1 \intadd_0/U7  ( .A(n3724), .B(\gain/R_r [6]), .CI(\intadd_0/n7 ), 
        .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[5] ) );
  ADDFX1 \intadd_5/U2  ( .A(n3725), .B(\gain/B_r [6]), .CI(\intadd_5/n2 ), 
        .CO(\intadd_5/n1 ), .S(\intadd_5/SUM[5] ) );
  ADDFX1 \intadd_2/U2  ( .A(n3740), .B(\gain/G_r [9]), .CI(\intadd_2/n2 ), 
        .CO(\intadd_2/n1 ), .S(\intadd_2/SUM[8] ) );
  CMPR42X2 \DP_OP_654J1_124_416/U18  ( .A(\DP_OP_654J1_124_416/n95 ), .B(
        \DP_OP_654J1_124_416/n28 ), .C(\DP_OP_654J1_124_416/n24 ), .D(
        \DP_OP_654J1_124_416/n29 ), .ICI(\DP_OP_654J1_124_416/n25 ), .S(
        \DP_OP_654J1_124_416/n22 ), .ICO(\DP_OP_654J1_124_416/n20 ), .CO(
        \DP_OP_654J1_124_416/n21 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U17  ( .A(\DP_OP_654J1_124_416/n101 ), .B(
        \DP_OP_654J1_124_416/n87 ), .C(\DP_OP_654J1_124_416/n94 ), .D(
        \DP_OP_654J1_124_416/n23 ), .ICI(\DP_OP_654J1_124_416/n20 ), .S(
        \DP_OP_654J1_124_416/n19 ), .ICO(\DP_OP_654J1_124_416/n17 ), .CO(
        \DP_OP_654J1_124_416/n18 ) );
  DFFRX2 \denoise/pos9_reg[7]  ( .D(n2016), .CK(clk), .RN(n3913), .Q(
        \denoise/pos9 [7]), .QN(n2329) );
  DFFRX2 \gain/MSB_R_r_reg[0]  ( .D(n1651), .CK(clk), .RN(n3919), .Q(n3611), 
        .QN(\gain/N325 ) );
  DFFRX2 \denoise/counter_0_reg[0]  ( .D(n2281), .CK(clk), .RN(n3910), .Q(
        \denoise/n_counter_1 [0]), .QN(n3634) );
  DFFRX2 \denoise/pos9_reg[5]  ( .D(n2090), .CK(clk), .RN(n3919), .Q(
        \denoise/pos9 [5]), .QN(n2318) );
  DFFRX2 \gain/MSB_G_r_reg[0]  ( .D(n1650), .CK(clk), .RN(n3919), .Q(n3721), 
        .QN(\gain/N478 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U39  ( .A(\DP_OP_654J1_124_416/n144 ), .B(
        \DP_OP_654J1_124_416/n130 ), .C(\DP_OP_654J1_124_416/n137 ), .D(
        \DP_OP_654J1_124_416/n81 ), .ICI(\DP_OP_654J1_124_416/n78 ), .S(
        \DP_OP_654J1_124_416/n76 ), .ICO(\DP_OP_654J1_124_416/n74 ), .CO(
        \DP_OP_654J1_124_416/n75 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U25  ( .A(\DP_OP_654J1_124_416/n46 ), .B(
        \DP_OP_654J1_124_416/n48 ), .C(\DP_OP_654J1_124_416/n53 ), .D(
        \DP_OP_654J1_124_416/n44 ), .ICI(\DP_OP_654J1_124_416/n49 ), .S(
        \DP_OP_654J1_124_416/n41 ), .ICO(\DP_OP_654J1_124_416/n39 ), .CO(
        \DP_OP_654J1_124_416/n40 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U22  ( .A(\DP_OP_654J1_124_416/n38 ), .B(
        \DP_OP_654J1_124_416/n42 ), .C(\DP_OP_654J1_124_416/n36 ), .D(
        \DP_OP_654J1_124_416/n43 ), .ICI(\DP_OP_654J1_124_416/n39 ), .S(
        \DP_OP_654J1_124_416/n33 ), .ICO(\DP_OP_654J1_124_416/n31 ), .CO(
        \DP_OP_654J1_124_416/n32 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U20  ( .A(\DP_OP_654J1_124_416/n96 ), .B(
        \DP_OP_654J1_124_416/n34 ), .C(\DP_OP_654J1_124_416/n30 ), .D(
        \DP_OP_654J1_124_416/n35 ), .ICI(\DP_OP_654J1_124_416/n31 ), .S(
        \DP_OP_654J1_124_416/n27 ), .ICO(\DP_OP_654J1_124_416/n25 ), .CO(
        \DP_OP_654J1_124_416/n26 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U34  ( .A(\DP_OP_654J1_124_416/n142 ), .B(
        \DP_OP_654J1_124_416/n114 ), .C(\DP_OP_654J1_124_416/n121 ), .D(
        \DP_OP_654J1_124_416/n128 ), .ICI(\DP_OP_654J1_124_416/n70 ), .S(
        \DP_OP_654J1_124_416/n64 ), .ICO(\DP_OP_654J1_124_416/n62 ), .CO(
        \DP_OP_654J1_124_416/n63 ) );
  CMPR42X2 \DP_OP_654J1_124_416/U30  ( .A(\DP_OP_654J1_124_416/n120 ), .B(
        \DP_OP_654J1_124_416/n134 ), .C(\DP_OP_654J1_124_416/n127 ), .D(
        \DP_OP_654J1_124_416/n65 ), .ICI(\DP_OP_654J1_124_416/n62 ), .S(
        \DP_OP_654J1_124_416/n54 ), .ICO(\DP_OP_654J1_124_416/n52 ), .CO(
        \DP_OP_654J1_124_416/n53 ) );
  AND2X2 \DP_OP_654J1_124_416/U15  ( .A(\DP_OP_654J1_124_416/n140 ), .B(
        \DP_OP_654J1_124_416/n147 ), .Y(\DP_OP_654J1_124_416/n14 ) );
  CMPR42X1 \DP_OP_654J1_124_416/U36  ( .A(\DP_OP_654J1_124_416/n136 ), .B(
        \DP_OP_654J1_124_416/n77 ), .C(\DP_OP_654J1_124_416/n74 ), .D(
        \DP_OP_654J1_124_416/n71 ), .ICI(\DP_OP_654J1_124_416/n73 ), .S(
        \DP_OP_654J1_124_416/n69 ), .ICO(\DP_OP_654J1_124_416/n67 ), .CO(
        \DP_OP_654J1_124_416/n68 ) );
  CMPR42X1 \DP_OP_654J1_124_416/U26  ( .A(\DP_OP_654J1_124_416/n119 ), .B(
        \DP_OP_654J1_124_416/n105 ), .C(\DP_OP_654J1_124_416/n57 ), .D(
        \DP_OP_654J1_124_416/n52 ), .ICI(\DP_OP_654J1_124_416/n55 ), .S(
        \DP_OP_654J1_124_416/n44 ), .ICO(\DP_OP_654J1_124_416/n42 ), .CO(
        \DP_OP_654J1_124_416/n43 ) );
  ADDFX2 \intadd_0/U2  ( .A(n3746), .B(\gain/R_r [11]), .CI(\intadd_0/n2 ), 
        .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[10] ) );
  ADDFX1 \intadd_6/U2  ( .A(\gain/g_mean_r [14]), .B(n3646), .CI(\intadd_6/n2 ), .CO(\intadd_6/n1 ), .S(\intadd_6/SUM[3] ) );
  DFFRX1 \gain/g_mean_r_reg[10]  ( .D(n1773), .CK(clk), .RN(n3915), .Q(
        \gain/g_mean_r [10]) );
  CMPR42X1 \DP_OP_654J1_124_416/U33  ( .A(\DP_OP_654J1_124_416/n135 ), .B(
        \DP_OP_654J1_124_416/n72 ), .C(\DP_OP_654J1_124_416/n66 ), .D(
        \DP_OP_654J1_124_416/n67 ), .ICI(\DP_OP_654J1_124_416/n64 ), .S(
        \DP_OP_654J1_124_416/n61 ), .ICO(\DP_OP_654J1_124_416/n59 ), .CO(
        \DP_OP_654J1_124_416/n60 ) );
  CMPR42X1 \DP_OP_654J1_124_416/U29  ( .A(\DP_OP_654J1_124_416/n56 ), .B(
        \DP_OP_654J1_124_416/n58 ), .C(\DP_OP_654J1_124_416/n63 ), .D(
        \DP_OP_654J1_124_416/n59 ), .ICI(\DP_OP_654J1_124_416/n54 ), .S(
        \DP_OP_654J1_124_416/n51 ), .ICO(\DP_OP_654J1_124_416/n49 ), .CO(
        \DP_OP_654J1_124_416/n50 ) );
  CMPR42X1 \DP_OP_654J1_124_416/U23  ( .A(\DP_OP_654J1_124_416/n104 ), .B(
        \DP_OP_654J1_124_416/n118 ), .C(\DP_OP_654J1_124_416/n111 ), .D(
        \DP_OP_654J1_124_416/n47 ), .ICI(\DP_OP_654J1_124_416/n45 ), .S(
        \DP_OP_654J1_124_416/n36 ), .ICO(\DP_OP_654J1_124_416/n34 ), .CO(
        \DP_OP_654J1_124_416/n35 ) );
  DFFRX1 \denoise/valid_count_0_reg[1]  ( .D(n1635), .CK(clk), .RN(n2621), .Q(
        \denoise/valid_count_0 [1]), .QN(n3643) );
  CMPR42X1 \DP_OP_654J1_124_416/U21  ( .A(\DP_OP_654J1_124_416/n103 ), .B(
        \DP_OP_654J1_124_416/n89 ), .C(\DP_OP_654J1_124_416/n117 ), .D(
        \DP_OP_654J1_124_416/n110 ), .ICI(\DP_OP_654J1_124_416/n37 ), .S(
        \DP_OP_654J1_124_416/n30 ), .ICO(\DP_OP_654J1_124_416/n28 ), .CO(
        \DP_OP_654J1_124_416/n29 ) );
  DFFRX1 last_col_out_reg_reg ( .D(n2285), .CK(clk), .RN(n3910), .QN(n2334) );
  DFFRX1 \color_out_reg_reg[1]  ( .D(n1637), .CK(clk), .RN(n2556), .Q(n2332)
         );
  DFFRX1 last_pic_out_reg_reg ( .D(n2284), .CK(clk), .RN(n2556), .Q(n3921), 
        .QN(n2356) );
  DFFRX1 \color_out_reg_reg[0]  ( .D(n1638), .CK(clk), .RN(n2556), .Q(n2330)
         );
  DFFRX1 \pixel_out_reg_reg[5]  ( .D(n2292), .CK(clk), .RN(n2556), .QN(n2348)
         );
  DFFRX1 \pixel_out_reg_reg[7]  ( .D(n2294), .CK(clk), .RN(n2621), .QN(n2352)
         );
  DFFRX1 \pixel_out_reg_reg[3]  ( .D(n2290), .CK(clk), .RN(n2556), .QN(n2344)
         );
  DFFRX1 \pixel_out_reg_reg[2]  ( .D(n2289), .CK(clk), .RN(n2621), .QN(n2342)
         );
  DFFRX1 valid_out_reg_reg ( .D(n2295), .CK(clk), .RN(n2556), .QN(n2354) );
  DFFRX1 \pixel_out_reg_reg[4]  ( .D(n2291), .CK(clk), .RN(n3919), .QN(n2346)
         );
  DFFRX1 \pixel_out_reg_reg[6]  ( .D(n2293), .CK(clk), .RN(n3918), .QN(n2350)
         );
  AO22X2 U2396 ( .A0(n3585), .A1(\gain/K_B_tmp [1]), .B0(n2560), .B1(
        \gain/K_B_tmp [2]), .Y(n1662) );
  OA21X2 U2397 ( .A0(n3592), .A1(n3721), .B0(n3595), .Y(n1650) );
  NOR2BX2 U2398 ( .AN(n2660), .B(n3605), .Y(n3143) );
  AOI2BB2X1 U2399 ( .B0(\gain/g_mean_r [13]), .B1(n3103), .A0N(n3848), .A1N(
        n3518), .Y(n3505) );
  AOI2BB2X1 U2400 ( .B0(\denoise/second_col_g[5][3] ), .B1(n2980), .A0N(n3844), 
        .A1N(n2883), .Y(n2782) );
  AOI2BB2X1 U2401 ( .B0(\gain/counter_R_r [1]), .B1(n3489), .A0N(n2328), .A1N(
        n3488), .Y(n3490) );
  AO22X2 U2402 ( .A0(n3606), .A1(color_out_wb[0]), .B0(n3605), .B1(
        color_out_dem[0]), .Y(n3607) );
  AOI2BB2X1 U2403 ( .B0(n3017), .B1(\gain/b_mean_r [10]), .A0N(n3053), .A1N(
        n3580), .Y(n3055) );
  CLKBUFX3 U2404 ( .A(n3186), .Y(n3320) );
  AOI2BB2X1 U2405 ( .B0(n3192), .B1(\denoise/second_col_g[1][3] ), .A0N(n3326), 
        .A1N(n3652), .Y(n3246) );
  AOI2BB2X1 U2406 ( .B0(\denoise/second_col_g[5][1] ), .B1(n2980), .A0N(n3773), 
        .A1N(n2527), .Y(n2885) );
  OR2X1 U2407 ( .A(n2670), .B(n2669), .Y(n2686) );
  OAI21X1 U2408 ( .A0(n2426), .A1(n2425), .B0(n2312), .Y(
        \denoise/n_pixel_out_reg [1]) );
  CLKBUFX3 U2409 ( .A(n2747), .Y(n2983) );
  CLKBUFX3 U2410 ( .A(n3172), .Y(n3326) );
  OR2X1 U2411 ( .A(n3024), .B(\gain/state_G_r [0]), .Y(n3539) );
  AO22X2 U2412 ( .A0(\denoise/first_col_r[2][7] ), .A1(n2748), .B0(n2742), 
        .B1(\denoise/first_col_b[3][7] ), .Y(n2944) );
  AO22X2 U2413 ( .A0(\denoise/first_col_r[3][0] ), .A1(n2829), .B0(
        \denoise/first_col_b[5][0] ), .B1(n2526), .Y(n2989) );
  NOR2BX1 U2414 ( .AN(n2587), .B(n2585), .Y(n3592) );
  CLKBUFX3 U2415 ( .A(n2751), .Y(n2986) );
  CLKBUFX3 U2416 ( .A(n2745), .Y(n2987) );
  CLKBUFX3 U2417 ( .A(n2749), .Y(n2980) );
  CLKBUFX3 U2418 ( .A(n2743), .Y(n2979) );
  CLKBUFX3 U2419 ( .A(n2636), .Y(n3142) );
  OAI21X1 U2420 ( .A0(n2493), .A1(n2498), .B0(n2358), .Y(\gain/K_mean_w [2])
         );
  OAI2BB2XL U2421 ( .B0(n3068), .B1(n3071), .A0N(n3733), .A1N(\gain/B_r [14]), 
        .Y(n3080) );
  NOR2X1 U2422 ( .A(n3809), .B(n3418), .Y(n3421) );
  MXI2X1 U2423 ( .A(n2484), .B(n2483), .S0(\gain/K_mean_w [4]), .Y(n2308) );
  NOR2X1 U2424 ( .A(n3416), .B(n3760), .Y(n3419) );
  NOR2X1 U2425 ( .A(n3764), .B(n3414), .Y(n3417) );
  CLKMX2X4 U2426 ( .A(n2400), .B(n2399), .S0(\denoise/n_pixel_out_reg [5]), 
        .Y(n2409) );
  NOR2X1 U2427 ( .A(n3742), .B(n3412), .Y(n3415) );
  NOR2X1 U2428 ( .A(n3410), .B(n3741), .Y(n3413) );
  OAI21X1 U2429 ( .A0(n2391), .A1(n2390), .B0(n2313), .Y(
        \denoise/n_pixel_out_reg [6]) );
  NOR2X1 U2430 ( .A(n3408), .B(n3731), .Y(n3411) );
  AOI222XL U2431 ( .A0(\mean/value_r [6]), .A1(\mean/sum_r [6]), .B0(
        \mean/value_r [6]), .B1(n3360), .C0(\mean/sum_r [6]), .C1(n3360), .Y(
        n2554) );
  OAI21XL U2432 ( .A0(\mean/sum_g [6]), .A1(n3402), .B0(n3403), .Y(n2525) );
  OAI21XL U2433 ( .A0(\mean/sum_g [5]), .A1(n3398), .B0(n3399), .Y(n2524) );
  OAI21XL U2434 ( .A0(\mean/sum_b [4]), .A1(n3438), .B0(n3439), .Y(n2515) );
  OAI21XL U2435 ( .A0(\mean/sum_g [4]), .A1(n3395), .B0(n3396), .Y(n2523) );
  OAI21XL U2436 ( .A0(\mean/sum_g [3]), .A1(n3392), .B0(n3393), .Y(n2522) );
  OAI21XL U2437 ( .A0(\mean/sum_r [2]), .A1(n3346), .B0(n3347), .Y(n2551) );
  OAI21XL U2438 ( .A0(\mean/sum_g [2]), .A1(n3389), .B0(n3390), .Y(n2521) );
  OAI21XL U2439 ( .A0(\mean/sum_b [2]), .A1(n3432), .B0(n3433), .Y(n2513) );
  OAI21XL U2440 ( .A0(\mean/sum_g [1]), .A1(n3386), .B0(n3387), .Y(n2520) );
  OAI21XL U2441 ( .A0(\mean/sum_b [1]), .A1(n3429), .B0(n3430), .Y(n2512) );
  INVXL U2442 ( .A(n2579), .Y(n2435) );
  INVXL U2443 ( .A(n2610), .Y(n2439) );
  AOI2BB2X2 U2444 ( .B0(\intadd_5/n1 ), .B1(n3028), .A0N(n3723), .A1N(
        \gain/b_mean_r [7]), .Y(n3048) );
  OAI21XL U2445 ( .A0(\mean/sum_b [3]), .A1(n3435), .B0(n3436), .Y(n2514) );
  AOI2BB2X2 U2446 ( .B0(n2942), .B1(\denoise/pos8 [7]), .A0N(n3847), .A1N(
        n2830), .Y(n2801) );
  AOI2BB2X2 U2447 ( .B0(n3191), .B1(\denoise/second_col_b[3][6] ), .A0N(n3326), 
        .A1N(n3624), .Y(n3294) );
  AOI2BB2X2 U2448 ( .B0(n3324), .B1(\denoise/second_col_b[2][4] ), .A0N(n3288), 
        .A1N(n3804), .Y(n3268) );
  AO22X4 U2449 ( .A0(r_mean_out_mean[2]), .A1(n2726), .B0(pixel_out_den[2]), 
        .B1(n2637), .Y(n2722) );
  AO22X4 U2450 ( .A0(b_mean_out_mean[5]), .A1(n2706), .B0(pixel_out_den[5]), 
        .B1(n2637), .Y(n2698) );
  NOR2X2 U2451 ( .A(n2560), .B(n3584), .Y(n3033) );
  OA21X4 U2452 ( .A0(n2613), .A1(n2612), .B0(n3549), .Y(n2619) );
  MX2X6 U2453 ( .A(n2486), .B(n2490), .S0(\gain/K_mean_w [3]), .Y(n2500) );
  OAI21XL U2454 ( .A0(\mean/sum_b [6]), .A1(n3444), .B0(n3445), .Y(n2518) );
  NAND2XL U2455 ( .A(n3709), .B(n2524), .Y(n3403) );
  NAND2XL U2456 ( .A(\mean/value_r [5]), .B(n2553), .Y(n3356) );
  AO22X4 U2457 ( .A0(\denoise/second_col_r[0][6] ), .A1(n2786), .B0(
        \denoise/second_col_g[1][6] ), .B1(n2983), .Y(n2791) );
  AO22X4 U2458 ( .A0(\denoise/first_col_r[4][6] ), .A1(n2988), .B0(
        \denoise/first_col_r[3][6] ), .B1(n2829), .Y(n2934) );
  AO22X4 U2459 ( .A0(\denoise/first_col_g[5][5] ), .A1(n2980), .B0(
        \denoise/first_col_b[0][5] ), .B1(n2762), .Y(n2921) );
  AO22X4 U2460 ( .A0(\denoise/first_col_b[1][4] ), .A1(n2763), .B0(
        \denoise/first_col_b[4][4] ), .B1(n2987), .Y(n2962) );
  AO22X4 U2461 ( .A0(\denoise/second_col_b[1][3] ), .A1(n2763), .B0(
        \denoise/second_col_g[1][3] ), .B1(n2983), .Y(n2772) );
  AO22X4 U2462 ( .A0(\denoise/second_col_r[0][2] ), .A1(n2786), .B0(
        \denoise/second_col_g[1][2] ), .B1(n2983), .Y(n2855) );
  INVXL U2463 ( .A(n2451), .Y(n2452) );
  INVXL U2464 ( .A(n2486), .Y(n2490) );
  AOI2BB2X2 U2465 ( .B0(\intadd_0/n1 ), .B1(n3550), .A0N(\intadd_0/n1 ), .A1N(
        n3550), .Y(n3553) );
  INVXL U2466 ( .A(n3107), .Y(n3108) );
  NAND2XL U2467 ( .A(g_mean_out_mean[3]), .B(n3137), .Y(n2590) );
  NAND2XL U2468 ( .A(r_mean_out_mean[7]), .B(n3137), .Y(n2609) );
  NAND2XL U2469 ( .A(n3459), .B(\mean/sum_b [16]), .Y(n3458) );
  NAND2XL U2470 ( .A(n3419), .B(\mean/sum_g [18]), .Y(n3418) );
  NOR2XL U2471 ( .A(n3763), .B(n3375), .Y(n3378) );
  INVXL U2472 ( .A(n2410), .Y(n2404) );
  AOI2BB2X2 U2473 ( .B0(n3598), .B1(n3597), .A0N(n3596), .A1N(n3595), .Y(n1641) );
  AO22X4 U2474 ( .A0(\gain/b_mean_r [0]), .A1(n3583), .B0(\gain/B_r [0]), .B1(
        n3582), .Y(n1665) );
  AO22X4 U2475 ( .A0(n3103), .A1(\gain/K_G_tmp [2]), .B0(n2562), .B1(
        \gain/K_G_tmp [3]), .Y(n1701) );
  AO21X4 U2476 ( .A0(n3113), .A1(n3112), .B0(n3111), .Y(n3702) );
  AO22X4 U2477 ( .A0(n3083), .A1(\intadd_0/SUM[0] ), .B0(n2617), .B1(
        \gain/R_r [1]), .Y(n1727) );
  AOI2BB2X2 U2478 ( .B0(n3469), .B1(\mean/b_mean_tmp [7]), .A0N(n3469), .A1N(
        \mean/b_mean_tmp [7]), .Y(n1800) );
  OA21X4 U2479 ( .A0(n3457), .A1(\mean/sum_b [14]), .B0(n3456), .Y(n1812) );
  AOI2BB2X2 U2480 ( .B0(n3468), .B1(\mean/b_mean_tmp [6]), .A0N(n3468), .A1N(
        \mean/b_mean_tmp [6]), .Y(n1827) );
  OA21X4 U2481 ( .A0(n3413), .A1(\mean/sum_g [12]), .B0(n3412), .Y(n1843) );
  AOI2BB2X2 U2482 ( .B0(n3383), .B1(\mean/r_mean_tmp [6]), .A0N(n3383), .A1N(
        \mean/r_mean_tmp [6]), .Y(n1857) );
  OA21X4 U2483 ( .A0(n3368), .A1(\mean/sum_r [10]), .B0(n3367), .Y(n1873) );
  AOI2BB2X2 U2484 ( .B0(n3140), .B1(n3813), .A0N(n3140), .A1N(valid_out_den), 
        .Y(valid_in_mean) );
  AO22X4 U2485 ( .A0(n3339), .A1(\denoise/sum6_g [9]), .B0(n3338), .B1(
        \denoise/sum3_g [9]), .Y(n1888) );
  AO22X4 U2486 ( .A0(n3339), .A1(\denoise/new_sum6 [5]), .B0(n3338), .B1(
        \denoise/sum6_g [5]), .Y(n1921) );
  AO22X4 U2487 ( .A0(n3337), .A1(\denoise/sum6_r [7]), .B0(n3336), .B1(
        \denoise/sum3_r [7]), .Y(n1906) );
  AO22X4 U2488 ( .A0(n3337), .A1(\denoise/new_sum6 [0]), .B0(n3336), .B1(
        \denoise/sum6_r [0]), .Y(n1961) );
  AO22X4 U2489 ( .A0(n3330), .A1(\denoise/pos9 [7]), .B0(n3200), .B1(
        \denoise/second_col_b[1][7] ), .Y(n1990) );
  AOI2BB2X2 U2490 ( .B0(n3311), .B1(n3310), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][7] ), .Y(n2004) );
  AOI2BB2X2 U2491 ( .B0(n3334), .B1(n3298), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][6] ), .Y(n2017) );
  AOI2BB2X2 U2492 ( .B0(n3318), .B1(n3292), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][6] ), .Y(n2032) );
  AO22X4 U2493 ( .A0(n3311), .A1(\denoise/pos9 [6]), .B0(n3175), .B1(
        \denoise/second_col_r[0][6] ), .Y(n2047) );
  AOI2BB2X2 U2494 ( .B0(n3329), .B1(n3283), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][5] ), .Y(n2059) );
  AO22X4 U2495 ( .A0(n3180), .A1(\denoise/pos9 [5]), .B0(n3181), .B1(
        \denoise/second_col_g[1][5] ), .Y(n2076) );
  AOI2BB2X2 U2496 ( .B0(n3142), .B1(n3867), .A0N(n3142), .A1N(pixel_out_dem[5]), .Y(pixel_in_den[5]) );
  AOI2BB2X2 U2497 ( .B0(n3322), .B1(n3265), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][4] ), .Y(n2103) );
  AOI2BB2X2 U2498 ( .B0(n3308), .B1(n3261), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][4] ), .Y(n2117) );
  AOI2BB2X2 U2499 ( .B0(n3205), .B1(n3254), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][3] ), .Y(n2129) );
  AOI2BB2X2 U2500 ( .B0(n3180), .B1(n3249), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][3] ), .Y(n2144) );
  AO22X4 U2501 ( .A0(n3306), .A1(\denoise/pos9 [3]), .B0(n3299), .B1(
        \denoise/second_col_r[4][3] ), .Y(n2162) );
  AO22X4 U2502 ( .A0(n3330), .A1(\denoise/pos9 [2]), .B0(n3200), .B1(
        \denoise/second_col_b[1][2] ), .Y(n2175) );
  AOI2BB2X2 U2503 ( .B0(n3311), .B1(n3232), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][2] ), .Y(n2189) );
  AOI2BB2X2 U2504 ( .B0(n2942), .B1(n3237), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [2]), .Y(n2201) );
  AO22X4 U2505 ( .A0(n3329), .A1(\denoise/pos9 [1]), .B0(n3198), .B1(
        \denoise/second_col_b[0][1] ), .Y(n2213) );
  AOI2BB2X2 U2506 ( .B0(n3308), .B1(n3219), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][1] ), .Y(n2228) );
  AOI2BB2X2 U2507 ( .B0(n3205), .B1(n3215), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][0] ), .Y(n2240) );
  AOI2BB2X2 U2508 ( .B0(n3180), .B1(n3196), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][0] ), .Y(n2255) );
  AOI2BB2X2 U2509 ( .B0(n2942), .B1(n3211), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [0]), .Y(n2275) );
  AO22X4 U2510 ( .A0(n3142), .A1(last_col_in_reg), .B0(n3141), .B1(
        last_col_out_dem), .Y(last_col_in_den) );
  MXI2X2 U2511 ( .A(n2403), .B(n2397), .S0(\denoise/n_pixel_out_reg [5]), .Y(
        n2309) );
  MXI2X2 U2512 ( .A(n2410), .B(n2404), .S0(\denoise/n_pixel_out_reg [4]), .Y(
        n2310) );
  MXI2X2 U2513 ( .A(n2417), .B(n2416), .S0(\denoise/n_pixel_out_reg [3]), .Y(
        n2311) );
  MXI2X2 U2514 ( .A(n2424), .B(n2418), .S0(\denoise/n_pixel_out_reg [2]), .Y(
        n2312) );
  MXI2X2 U2515 ( .A(n2389), .B(n2383), .S0(\denoise/n_pixel_out_reg [7]), .Y(
        n2313) );
  NOR2X2 U2516 ( .A(n3466), .B(n3833), .Y(n3468) );
  NOR2X2 U2517 ( .A(n3424), .B(n3832), .Y(n3426) );
  NOR2X2 U2518 ( .A(n3381), .B(n3831), .Y(n3383) );
  NOR2X2 U2519 ( .A(n3422), .B(n3836), .Y(n3425) );
  NOR2X1 U2520 ( .A(n3462), .B(n3837), .Y(n3465) );
  NOR2X2 U2521 ( .A(n3420), .B(n3835), .Y(n3423) );
  CLKINVX1 U2522 ( .A(n2492), .Y(n2485) );
  NOR2X1 U2523 ( .A(n3460), .B(n3803), .Y(n3463) );
  CLKMX2X4 U2524 ( .A(n2478), .B(n2482), .S0(\gain/K_mean_w [4]), .Y(n2492) );
  NOR2X1 U2525 ( .A(n3805), .B(n3458), .Y(n3461) );
  CLKINVX1 U2526 ( .A(n2484), .Y(n2477) );
  NOR2X1 U2527 ( .A(n3762), .B(n3373), .Y(n3376) );
  NOR2X1 U2528 ( .A(n2482), .B(n2484), .Y(n2483) );
  NOR2X1 U2529 ( .A(n3768), .B(n3456), .Y(n3459) );
  CLKMX2X4 U2530 ( .A(n2470), .B(n2474), .S0(\gain/K_mean_w [5]), .Y(n2484) );
  INVXL U2531 ( .A(n3079), .Y(n1666) );
  INVXL U2532 ( .A(n3077), .Y(n1671) );
  INVXL U2533 ( .A(n3074), .Y(n1669) );
  INVXL U2534 ( .A(n3076), .Y(n1667) );
  INVXL U2535 ( .A(n3078), .Y(n1670) );
  INVXL U2536 ( .A(n3075), .Y(n1668) );
  NOR2X1 U2537 ( .A(n3761), .B(n3371), .Y(n3374) );
  NOR2X1 U2538 ( .A(n3765), .B(n3454), .Y(n3457) );
  NOR2X1 U2539 ( .A(n3369), .B(n3750), .Y(n3372) );
  NOR2X1 U2540 ( .A(n3744), .B(n3452), .Y(n3455) );
  NOR2X1 U2541 ( .A(n3729), .B(n3367), .Y(n3370) );
  NOR2X1 U2542 ( .A(n3743), .B(n3450), .Y(n3453) );
  NOR2X1 U2543 ( .A(n3365), .B(n3717), .Y(n3368) );
  OAI21X1 U2544 ( .A0(n3355), .A1(n3713), .B0(n3356), .Y(n3360) );
  ADDFX2 U2545 ( .A(n2473), .B(n2472), .CI(n2471), .CO(n2463), .S(n2478) );
  OA21XL U2546 ( .A0(n2378), .A1(n3551), .B0(n3588), .Y(n2690) );
  ADDFX2 U2547 ( .A(n2435), .B(n2434), .CI(n2433), .CO(n2456), .S(n2465) );
  ADDFX2 U2548 ( .A(n2432), .B(n2431), .CI(n2430), .CO(n2447), .S(n2457) );
  ADDFX2 U2549 ( .A(n3019), .B(n2429), .CI(n2428), .CO(n2450), .S(n2448) );
  INVX1 U2550 ( .A(n2602), .Y(n2436) );
  NOR2X1 U2551 ( .A(r_mean_out_mean[4]), .B(n3138), .Y(n2602) );
  NOR2X1 U2552 ( .A(n2379), .B(n3707), .Y(n2382) );
  INVX8 U2553 ( .A(n2887), .Y(n2942) );
  AOI2BB2X1 U2554 ( .B0(n3427), .B1(\mean/g_mean_tmp [7]), .A0N(n3427), .A1N(
        \mean/g_mean_tmp [7]), .Y(n1828) );
  AOI2BB2X1 U2555 ( .B0(n3426), .B1(\mean/g_mean_tmp [6]), .A0N(n3426), .A1N(
        \mean/g_mean_tmp [6]), .Y(n1829) );
  AOI2BB2X1 U2556 ( .B0(n3384), .B1(\mean/r_mean_tmp [7]), .A0N(n3384), .A1N(
        \mean/r_mean_tmp [7]), .Y(n1856) );
  OA21XL U2557 ( .A0(n3467), .A1(\mean/b_mean_tmp [4]), .B0(n3466), .Y(n1802)
         );
  OA21XL U2558 ( .A0(n3425), .A1(\mean/g_mean_tmp [4]), .B0(n3424), .Y(n1831)
         );
  OA21XL U2559 ( .A0(n3382), .A1(\mean/r_mean_tmp [4]), .B0(n3381), .Y(n1859)
         );
  NAND2X1 U2560 ( .A(n3425), .B(\mean/g_mean_tmp [4]), .Y(n3424) );
  NAND2X1 U2561 ( .A(n3467), .B(\mean/b_mean_tmp [4]), .Y(n3466) );
  CLKMX2X2 U2562 ( .A(n2494), .B(n2498), .S0(\gain/K_mean_w [2]), .Y(n3110) );
  MXI2X1 U2563 ( .A(n2500), .B(n2499), .S0(\gain/K_mean_w [2]), .Y(n2360) );
  NAND2X1 U2564 ( .A(n3382), .B(\mean/r_mean_tmp [4]), .Y(n3381) );
  OA21XL U2565 ( .A0(n3423), .A1(\mean/g_mean_tmp [2]), .B0(n3422), .Y(n1833)
         );
  OA21XL U2566 ( .A0(n3465), .A1(\mean/b_mean_tmp [2]), .B0(n3464), .Y(n1804)
         );
  OA21XL U2567 ( .A0(n3380), .A1(\mean/r_mean_tmp [2]), .B0(n3379), .Y(n1861)
         );
  CLKINVX1 U2568 ( .A(n2500), .Y(n2493) );
  MXI2X1 U2569 ( .A(n2492), .B(n2491), .S0(\gain/K_mean_w [3]), .Y(n2358) );
  OA21XL U2570 ( .A0(n3463), .A1(\mean/b_mean_tmp [0]), .B0(n3462), .Y(n1806)
         );
  OA21XL U2571 ( .A0(n3378), .A1(\mean/r_mean_tmp [0]), .B0(n3377), .Y(n1863)
         );
  OAI21X1 U2572 ( .A0(n2485), .A1(n2490), .B0(n2308), .Y(\gain/K_mean_w [3])
         );
  OA21XL U2573 ( .A0(n3419), .A1(\mean/sum_g [18]), .B0(n3418), .Y(n1837) );
  NAND2X1 U2574 ( .A(n2373), .B(n3101), .Y(\denoise/n_pixel_out_reg [0]) );
  MXI2X1 U2575 ( .A(n3093), .B(n2425), .S0(\denoise/n_pixel_out_reg [1]), .Y(
        n2373) );
  MXI2X1 U2576 ( .A(n2476), .B(n2475), .S0(\gain/K_mean_w [5]), .Y(n2359) );
  INVX1 U2577 ( .A(n3093), .Y(n2425) );
  OAI21X1 U2578 ( .A0(n2469), .A1(n2474), .B0(n2361), .Y(\gain/K_mean_w [5])
         );
  AOI2BB2X1 U2579 ( .B0(n3060), .B1(\gain/B_r [14]), .A0N(n3067), .A1N(n3816), 
        .Y(n3073) );
  AO22X1 U2580 ( .A0(n3083), .A1(\intadd_0/SUM[5] ), .B0(n2617), .B1(
        \gain/R_r [6]), .Y(n1732) );
  AO22X1 U2581 ( .A0(n3083), .A1(\intadd_0/SUM[3] ), .B0(n2617), .B1(
        \gain/R_r [4]), .Y(n1730) );
  AO22X1 U2582 ( .A0(n3083), .A1(\intadd_0/SUM[6] ), .B0(n2617), .B1(
        \gain/R_r [7]), .Y(n1733) );
  AO22X1 U2583 ( .A0(n3083), .A1(\intadd_0/SUM[4] ), .B0(n2617), .B1(
        \gain/R_r [5]), .Y(n1731) );
  AOI2BB2X1 U2584 ( .B0(\gain/B_r [7]), .B1(n3060), .A0N(n3635), .A1N(n2571), 
        .Y(n3578) );
  CLKMX2X2 U2585 ( .A(n2423), .B(n2371), .S0(\denoise/n_pixel_out_reg [2]), 
        .Y(n3093) );
  CLKMX2X2 U2586 ( .A(\denoise/sum9 [2]), .B(n3812), .S0(
        \denoise/n_pixel_out_reg [2]), .Y(n3095) );
  AOI2BB2X1 U2587 ( .B0(n3060), .B1(\gain/B_r [12]), .A0N(n3067), .A1N(n3817), 
        .Y(n3066) );
  AO22X1 U2588 ( .A0(n3083), .A1(\intadd_0/SUM[1] ), .B0(n2617), .B1(
        \gain/R_r [2]), .Y(n1728) );
  AO22X1 U2589 ( .A0(n3083), .A1(\intadd_0/SUM[2] ), .B0(n2617), .B1(
        \gain/R_r [3]), .Y(n1729) );
  CLKMX2X2 U2590 ( .A(n2421), .B(n2420), .S0(\denoise/n_pixel_out_reg [2]), 
        .Y(n3097) );
  CLKMX2X2 U2591 ( .A(n2462), .B(n2466), .S0(\gain/K_mean_w [6]), .Y(n2476) );
  MXI2X1 U2592 ( .A(n2468), .B(n2467), .S0(\gain/K_mean_w [6]), .Y(n2361) );
  AOI2BB2X1 U2593 ( .B0(\gain/R_r [14]), .B1(n2617), .A0N(n3816), .A1N(n3551), 
        .Y(n3547) );
  AO22X1 U2594 ( .A0(n3023), .A1(\gain/G_r [1]), .B0(n3025), .B1(
        \intadd_2/SUM[0] ), .Y(n1743) );
  AO22X1 U2595 ( .A0(n3023), .A1(\gain/G_r [7]), .B0(n3025), .B1(
        \intadd_2/SUM[6] ), .Y(n1749) );
  AO22X1 U2596 ( .A0(n3023), .A1(\gain/G_r [3]), .B0(n3025), .B1(
        \intadd_2/SUM[2] ), .Y(n1745) );
  AO22X1 U2597 ( .A0(n3023), .A1(\gain/G_r [2]), .B0(n3025), .B1(
        \intadd_2/SUM[1] ), .Y(n1744) );
  AOI2BB2X1 U2598 ( .B0(n2617), .B1(\gain/R_r [12]), .A0N(n3817), .A1N(n3551), 
        .Y(n3552) );
  AO22X1 U2599 ( .A0(n3023), .A1(\gain/G_r [6]), .B0(n3025), .B1(
        \intadd_2/SUM[5] ), .Y(n1748) );
  AO22X1 U2600 ( .A0(n3023), .A1(\gain/G_r [4]), .B0(n3025), .B1(
        \intadd_2/SUM[3] ), .Y(n1746) );
  AO22X1 U2601 ( .A0(n3023), .A1(\gain/G_r [5]), .B0(n3025), .B1(
        \intadd_2/SUM[4] ), .Y(n1747) );
  INVX3 U2602 ( .A(n3534), .Y(n3023) );
  OAI21X1 U2603 ( .A0(n2461), .A1(n2466), .B0(n2374), .Y(\gain/K_mean_w [6])
         );
  CLKMX2X2 U2604 ( .A(n2413), .B(n2412), .S0(\denoise/n_pixel_out_reg [3]), 
        .Y(n2423) );
  CLKMX2X2 U2605 ( .A(n2415), .B(n2370), .S0(\denoise/n_pixel_out_reg [3]), 
        .Y(n2424) );
  CLKMX2X2 U2606 ( .A(\denoise/sum9 [3]), .B(n3811), .S0(
        \denoise/n_pixel_out_reg [3]), .Y(n2421) );
  OA21XL U2607 ( .A0(\gain/B_r [15]), .A1(n3753), .B0(n3080), .Y(n3031) );
  CLKMX2X2 U2608 ( .A(n2454), .B(n2458), .S0(\gain/K_mean_w [7]), .Y(n2468) );
  MXI2X1 U2609 ( .A(n2460), .B(n2459), .S0(\gain/K_mean_w [7]), .Y(n2374) );
  OAI21X1 U2610 ( .A0(n2453), .A1(n2458), .B0(n2452), .Y(\gain/K_mean_w [7])
         );
  AOI2BB2X1 U2611 ( .B0(n3032), .B1(n3035), .A0N(n3754), .A1N(
        \gain/b_mean_r [13]), .Y(n3071) );
  CLKMX2X2 U2612 ( .A(n2407), .B(n2406), .S0(\denoise/n_pixel_out_reg [4]), 
        .Y(n2415) );
  CLKMX2X2 U2613 ( .A(n2409), .B(n2369), .S0(\denoise/n_pixel_out_reg [4]), 
        .Y(n2417) );
  CLKMX2X2 U2614 ( .A(\denoise/sum9 [4]), .B(n3770), .S0(
        \denoise/n_pixel_out_reg [4]), .Y(n2413) );
  AOI2BB1X2 U2615 ( .A0N(\intadd_1/n1 ), .A1N(\intadd_3/n1 ), .B0(
        \denoise/n_sum9 [11]), .Y(\denoise/n_sum9 [10]) );
  AOI2BB2X1 U2616 ( .B0(\mean/sum_g [6]), .B1(n3404), .A0N(\mean/sum_g [6]), 
        .A1N(n3404), .Y(n1849) );
  AOI2BB2X1 U2617 ( .B0(\mean/sum_b [6]), .B1(n3446), .A0N(\mean/sum_b [6]), 
        .A1N(n3446), .Y(n1820) );
  AOI211XL U2618 ( .A0(\mean/value_r [6]), .A1(n3360), .B0(n3359), .C0(n3358), 
        .Y(n3361) );
  ADDFX2 U2619 ( .A(\gain/b_mean_r [11]), .B(n3766), .CI(n3056), .CO(n3064), 
        .S(n3057) );
  AOI2BB2X1 U2620 ( .B0(\mean/sum_b [5]), .B1(n3443), .A0N(\mean/sum_b [5]), 
        .A1N(n3443), .Y(n1821) );
  CLKMX2X2 U2621 ( .A(\denoise/sum9 [5]), .B(n3752), .S0(
        \denoise/n_pixel_out_reg [5]), .Y(n2407) );
  AOI2BB2X1 U2622 ( .B0(\mean/sum_g [5]), .B1(n3400), .A0N(\mean/sum_g [5]), 
        .A1N(n3400), .Y(n1850) );
  CLKMX2X2 U2623 ( .A(n2402), .B(n2368), .S0(\denoise/n_pixel_out_reg [5]), 
        .Y(n2410) );
  NOR2X1 U2624 ( .A(n3709), .B(n2516), .Y(n3444) );
  NOR2X1 U2625 ( .A(n3709), .B(n2524), .Y(n3402) );
  NAND2X1 U2626 ( .A(n3709), .B(n2516), .Y(n3445) );
  AOI2BB1X2 U2627 ( .A0N(\intadd_4/n1 ), .A1N(n3132), .B0(
        \denoise/n_new_sum6 [9]), .Y(\denoise/n_new_sum6 [8]) );
  AOI2BB2X1 U2628 ( .B0(\intadd_2/n1 ), .B1(n3533), .A0N(\intadd_2/n1 ), .A1N(
        n3533), .Y(n3537) );
  ADDFX2 U2629 ( .A(n2465), .B(n2464), .CI(n2463), .CO(n2455), .S(n2470) );
  AOI2BB2X1 U2630 ( .B0(\mean/sum_b [4]), .B1(n3440), .A0N(\mean/sum_b [4]), 
        .A1N(n3440), .Y(n1822) );
  NOR2X1 U2631 ( .A(n3710), .B(n2515), .Y(n3441) );
  NOR2X1 U2632 ( .A(\mean/value_r [5]), .B(n2553), .Y(n3355) );
  NOR2X1 U2633 ( .A(n3710), .B(n2523), .Y(n3398) );
  INVX1 U2634 ( .A(n3090), .Y(n3029) );
  AOI2BB2X1 U2635 ( .B0(\mean/sum_g [4]), .B1(n3397), .A0N(\mean/sum_g [4]), 
        .A1N(n3397), .Y(n1851) );
  AOI2BB1X2 U2636 ( .A0N(n3558), .A1N(\gain/counter_B_r [3]), .B0(n3557), .Y(
        n1724) );
  MXI2X1 U2637 ( .A(n2396), .B(n2390), .S0(\denoise/n_pixel_out_reg [6]), .Y(
        n2367) );
  CLKMX2X2 U2638 ( .A(n2395), .B(n2366), .S0(\denoise/n_pixel_out_reg [6]), 
        .Y(n2403) );
  CLKMX2X2 U2639 ( .A(\denoise/sum9 [6]), .B(n3732), .S0(
        \denoise/n_pixel_out_reg [6]), .Y(n2400) );
  CLKMX2X2 U2640 ( .A(n2393), .B(n2392), .S0(\denoise/n_pixel_out_reg [6]), 
        .Y(n2402) );
  ADDFX2 U2641 ( .A(\gain/b_mean_r [8]), .B(n3748), .CI(n3048), .CO(n3090), 
        .S(n3049) );
  AOI2BB1X2 U2642 ( .A0N(n3529), .A1N(\gain/counter_G_r [3]), .B0(n3522), .Y(
        n1762) );
  AOI2BB2X1 U2643 ( .B0(n3591), .B1(n3590), .A0N(n3591), .A1N(n3590), .Y(n1643) );
  AOI2BB1X2 U2644 ( .A0N(n3487), .A1N(\gain/counter_R_r [3]), .B0(n3486), .Y(
        n1783) );
  AO22X1 U2645 ( .A0(\gain/counter_G_r [1]), .A1(n3523), .B0(n3820), .B1(n3525), .Y(n3524) );
  AO22X1 U2646 ( .A0(n3311), .A1(\denoise/pos9 [7]), .B0(n3175), .B1(
        \denoise/second_col_r[0][7] ), .Y(n2010) );
  AO22X1 U2647 ( .A0(n3311), .A1(\denoise/pos9 [1]), .B0(n3175), .B1(
        \denoise/second_col_r[0][1] ), .Y(n2232) );
  NOR2X1 U2648 ( .A(n3704), .B(n2522), .Y(n3395) );
  AOI2BB2X1 U2649 ( .B0(\mean/sum_g [3]), .B1(n3394), .A0N(\mean/sum_g [3]), 
        .A1N(n3394), .Y(n1852) );
  OA21XL U2650 ( .A0(n3470), .A1(n3611), .B0(n3586), .Y(n1651) );
  AOI2BB2X1 U2651 ( .B0(n3320), .B1(n3249), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][3] ), .Y(n2141) );
  NOR2X1 U2652 ( .A(n3704), .B(n2514), .Y(n3438) );
  AOI21X1 U2653 ( .A0(\gain/valid_r ), .A1(n3535), .B0(n3592), .Y(n2691) );
  AOI2BB2X1 U2654 ( .B0(\mean/sum_b [3]), .B1(n3437), .A0N(\mean/sum_b [3]), 
        .A1N(n3437), .Y(n1823) );
  AOI2BB2X1 U2655 ( .B0(n3205), .B1(n3298), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][6] ), .Y(n2018) );
  AOI2BB2X1 U2656 ( .B0(\mean/sum_r [3]), .B1(n3351), .A0N(\mean/sum_r [3]), 
        .A1N(n3351), .Y(n1880) );
  AOI2BB2X1 U2657 ( .B0(n3320), .B1(n3265), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][4] ), .Y(n2104) );
  AO22X1 U2658 ( .A0(n3311), .A1(\denoise/pos9 [2]), .B0(n3175), .B1(
        \denoise/second_col_r[0][2] ), .Y(n2195) );
  AOI2BB2X1 U2659 ( .B0(n3320), .B1(n3196), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][0] ), .Y(n2252) );
  INVX1 U2660 ( .A(n2396), .Y(n2390) );
  AOI2BB2X1 U2661 ( .B0(n3205), .B1(n3283), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][5] ), .Y(n2055) );
  AO22X1 U2662 ( .A0(n3318), .A1(\denoise/pos9 [7]), .B0(n3183), .B1(
        \denoise/second_col_g[2][7] ), .Y(n2001) );
  AO22X1 U2663 ( .A0(n3318), .A1(\denoise/pos9 [4]), .B0(n3183), .B1(
        \denoise/second_col_g[2][4] ), .Y(n2112) );
  AOI2BB2X1 U2664 ( .B0(n3320), .B1(n3223), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][1] ), .Y(n2215) );
  AOI2BB2X1 U2665 ( .B0(n3320), .B1(n3292), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][6] ), .Y(n2030) );
  AO22X1 U2666 ( .A0(n3308), .A1(\denoise/pos9 [5]), .B0(n3168), .B1(
        \denoise/second_col_r[2][5] ), .Y(n2086) );
  AOI2BB2X1 U2667 ( .B0(n3205), .B1(n3228), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][1] ), .Y(n2203) );
  AOI2BB2X1 U2668 ( .B0(n3320), .B1(n3321), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][7] ), .Y(n1993) );
  AOI2BB2X1 U2669 ( .B0(n3205), .B1(n3241), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][2] ), .Y(n2166) );
  AOI2BB2X1 U2670 ( .B0(n3320), .B1(n3236), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][2] ), .Y(n2178) );
  AOI2BB2X1 U2671 ( .B0(n3320), .B1(n3279), .A0N(n3320), .A1N(
        \denoise/first_col_g[4][5] ), .Y(n2067) );
  AO22X1 U2672 ( .A0(n3331), .A1(\denoise/pos9 [3]), .B0(n3202), .B1(
        \denoise/second_col_b[2][3] ), .Y(n2137) );
  AOI2BB2X1 U2673 ( .B0(n3205), .B1(n3333), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][7] ), .Y(n1973) );
  AO22X1 U2674 ( .A0(n3331), .A1(\denoise/pos9 [5]), .B0(n3202), .B1(
        \denoise/second_col_b[2][5] ), .Y(n2063) );
  AO22X1 U2675 ( .A0(n3319), .A1(\denoise/pos9 [2]), .B0(n3185), .B1(
        \denoise/second_col_g[3][2] ), .Y(n2185) );
  AO22X1 U2676 ( .A0(n3309), .A1(\denoise/pos9 [1]), .B0(n3257), .B1(
        \denoise/second_col_r[1][1] ), .Y(n2233) );
  AOI2BB2X1 U2677 ( .B0(\mean/sum_b [2]), .B1(n3434), .A0N(\mean/sum_b [2]), 
        .A1N(n3434), .Y(n1824) );
  AOI2BB2X1 U2678 ( .B0(\denoise/second_col_b[4][1] ), .B1(n2987), .A0N(n3841), 
        .A1N(n2884), .Y(n2900) );
  AO22X1 U2679 ( .A0(n3306), .A1(\denoise/pos9 [5]), .B0(n3299), .B1(
        \denoise/second_col_r[4][5] ), .Y(n2088) );
  AOI2BB2X1 U2680 ( .B0(\mean/sum_r [2]), .B1(n3348), .A0N(\mean/sum_r [2]), 
        .A1N(n3348), .Y(n1881) );
  NOR2X1 U2681 ( .A(n3703), .B(n2551), .Y(n3349) );
  AOI2BB2X1 U2682 ( .B0(\mean/sum_g [2]), .B1(n3391), .A0N(\mean/sum_g [2]), 
        .A1N(n3391), .Y(n1853) );
  AO22X1 U2683 ( .A0(n3319), .A1(\denoise/pos9 [0]), .B0(n3185), .B1(
        \denoise/second_col_g[3][0] ), .Y(n2259) );
  AO22X1 U2684 ( .A0(n3306), .A1(\denoise/pos9 [6]), .B0(n3299), .B1(
        \denoise/second_col_r[4][6] ), .Y(n2051) );
  AO22X1 U2685 ( .A0(n3330), .A1(\denoise/pos9 [3]), .B0(n3200), .B1(
        \denoise/second_col_b[1][3] ), .Y(n2138) );
  AOI2BB2X1 U2686 ( .B0(n3205), .B1(n3271), .A0N(n3205), .A1N(
        \denoise/first_col_b[4][4] ), .Y(n2092) );
  AO22X1 U2687 ( .A0(n3306), .A1(\denoise/pos9 [4]), .B0(n3299), .B1(
        \denoise/second_col_r[4][4] ), .Y(n2125) );
  AO22X1 U2688 ( .A0(n3306), .A1(\denoise/pos9 [7]), .B0(n3299), .B1(
        \denoise/second_col_r[4][7] ), .Y(n2014) );
  CLKMX2X2 U2689 ( .A(n2386), .B(n2385), .S0(\denoise/n_pixel_out_reg [7]), 
        .Y(n2395) );
  CLKMX2X2 U2690 ( .A(\denoise/sum9 [7]), .B(n3718), .S0(
        \denoise/n_pixel_out_reg [7]), .Y(n2393) );
  AO22X1 U2691 ( .A0(n3309), .A1(\denoise/pos9 [7]), .B0(n3257), .B1(
        \denoise/second_col_r[1][7] ), .Y(n2011) );
  AO22X1 U2692 ( .A0(n3330), .A1(\denoise/pos9 [5]), .B0(n3200), .B1(
        \denoise/second_col_b[1][5] ), .Y(n2064) );
  CLKMX2X2 U2693 ( .A(n2388), .B(n2365), .S0(\denoise/n_pixel_out_reg [7]), 
        .Y(n2396) );
  AO22X1 U2694 ( .A0(n3332), .A1(\denoise/pos9 [0]), .B0(n3266), .B1(
        \denoise/second_col_b[3][0] ), .Y(n2247) );
  AO22X1 U2695 ( .A0(\denoise/second_col_b[2][5] ), .A1(n2981), .B0(
        \denoise/second_col_g[5][5] ), .B1(n2980), .Y(n2839) );
  INVX1 U2696 ( .A(n2590), .Y(n2440) );
  INVX1 U2697 ( .A(n2607), .Y(n2433) );
  AO22X1 U2698 ( .A0(\denoise/first_col_g[1][0] ), .A1(n2983), .B0(
        \denoise/first_col_g[2][0] ), .B1(n2982), .Y(n2996) );
  AO22X1 U2699 ( .A0(r_mean_out_mean[0]), .A1(n2726), .B0(pixel_out_den[0]), 
        .B1(n2637), .Y(n2718) );
  AO22X1 U2700 ( .A0(\denoise/first_col_g[2][2] ), .A1(n2982), .B0(
        \denoise/first_col_b[3][2] ), .B1(n2742), .Y(n2903) );
  AO22X1 U2701 ( .A0(\denoise/first_col_g[4][5] ), .A1(n2979), .B0(
        \denoise/first_col_b[4][5] ), .B1(n2987), .Y(n2922) );
  AO22X1 U2702 ( .A0(\denoise/first_col_b[2][0] ), .A1(n2981), .B0(
        \denoise/first_col_b[3][0] ), .B1(n2742), .Y(n2997) );
  AO22X1 U2703 ( .A0(\denoise/second_col_g[2][7] ), .A1(n2982), .B0(
        \denoise/second_col_g[5][7] ), .B1(n2980), .Y(n2799) );
  AO22X1 U2704 ( .A0(\denoise/first_col_r[5][5] ), .A1(n2986), .B0(
        \denoise/first_col_b[3][5] ), .B1(n2742), .Y(n2915) );
  AO22X1 U2705 ( .A0(\denoise/first_col_g[2][5] ), .A1(n2982), .B0(
        \denoise/first_col_g[3][5] ), .B1(n2811), .Y(n2914) );
  AO22X1 U2706 ( .A0(n3180), .A1(\denoise/pos9 [0]), .B0(n3181), .B1(
        \denoise/second_col_g[1][0] ), .Y(n2261) );
  NOR2XL U2707 ( .A(n3326), .B(n3207), .Y(n3197) );
  AO22X1 U2708 ( .A0(n3180), .A1(\denoise/pos9 [7]), .B0(n3181), .B1(
        \denoise/second_col_g[1][7] ), .Y(n2002) );
  AOI2BB2X1 U2709 ( .B0(n2742), .B1(\denoise/second_col_b[3][7] ), .A0N(n2527), 
        .A1N(n3772), .Y(n2808) );
  AO22X1 U2710 ( .A0(\denoise/second_col_b[3][0] ), .A1(n2742), .B0(
        \denoise/second_col_r[5][0] ), .B1(n2986), .Y(n2812) );
  AO22X1 U2711 ( .A0(\denoise/first_col_r[3][3] ), .A1(n2829), .B0(
        \denoise/first_col_b[3][3] ), .B1(n2742), .Y(n2967) );
  AO22X1 U2712 ( .A0(\denoise/first_col_g[2][3] ), .A1(n2982), .B0(
        \denoise/first_col_g[3][3] ), .B1(n2811), .Y(n2968) );
  AO22X1 U2713 ( .A0(n3135), .A1(n3921), .B0(n3136), .B1(last_pic_out_wb), .Y(
        last_pic_in_gamma) );
  AO22X1 U2714 ( .A0(\denoise/first_col_r[4][2] ), .A1(n2988), .B0(
        \denoise/first_col_r[3][2] ), .B1(n2829), .Y(n2910) );
  AO22X1 U2715 ( .A0(\denoise/second_col_r[4][5] ), .A1(n2988), .B0(
        \denoise/second_col_g[4][5] ), .B1(n2979), .Y(n2833) );
  AO22X1 U2716 ( .A0(b_mean_out_mean[4]), .A1(n2706), .B0(pixel_out_den[4]), 
        .B1(n2637), .Y(n2694) );
  AO22X1 U2717 ( .A0(r_mean_out_mean[7]), .A1(n2726), .B0(pixel_out_den[7]), 
        .B1(n2637), .Y(n2727) );
  AO22X1 U2718 ( .A0(\denoise/first_col_g[3][1] ), .A1(n2811), .B0(
        \denoise/first_col_g[4][1] ), .B1(n2979), .Y(n2874) );
  AO22X1 U2719 ( .A0(\denoise/first_col_r[0][6] ), .A1(n2786), .B0(
        \denoise/first_col_g[4][6] ), .B1(n2979), .Y(n2933) );
  AO22X1 U2720 ( .A0(\denoise/first_col_r[4][7] ), .A1(n2988), .B0(
        \denoise/first_col_r[0][7] ), .B1(n2786), .Y(n2950) );
  AO22X1 U2721 ( .A0(\denoise/first_col_r[4][1] ), .A1(n2988), .B0(
        \denoise/first_col_r[3][1] ), .B1(n2829), .Y(n2878) );
  AO22X1 U2722 ( .A0(\denoise/first_col_r[2][1] ), .A1(n2748), .B0(
        \denoise/first_col_g[0][1] ), .B1(n2985), .Y(n2877) );
  AO22X1 U2723 ( .A0(r_mean_out_mean[6]), .A1(n2726), .B0(b_mean_out_mean[6]), 
        .B1(n2706), .Y(n2707) );
  AO22X1 U2724 ( .A0(\denoise/first_col_r[1][1] ), .A1(n2984), .B0(
        \denoise/first_col_b[0][1] ), .B1(n2762), .Y(n2876) );
  AO22X1 U2725 ( .A0(\denoise/first_col_g[1][1] ), .A1(n2983), .B0(
        \denoise/first_col_b[1][1] ), .B1(n2763), .Y(n2875) );
  NOR2XL U2726 ( .A(n3173), .B(n3326), .Y(n3174) );
  AO22X1 U2727 ( .A0(r_mean_out_mean[3]), .A1(n2726), .B0(pixel_out_den[3]), 
        .B1(n2637), .Y(n2713) );
  AOI2BB2X1 U2728 ( .B0(\denoise/second_col_g[5][6] ), .B1(n2980), .A0N(n3775), 
        .A1N(n2527), .Y(n2788) );
  AO22X1 U2729 ( .A0(n3136), .A1(color_out_wb[1]), .B0(n3135), .B1(
        color_in_wb[1]), .Y(color_in_gamma[1]) );
  AO22X1 U2730 ( .A0(n3135), .A1(color_in_wb[0]), .B0(n3136), .B1(
        color_out_wb[0]), .Y(color_in_gamma[0]) );
  AO22X1 U2731 ( .A0(r_mean_out_mean[1]), .A1(n2726), .B0(b_mean_out_mean[1]), 
        .B1(n2706), .Y(n2702) );
  AO22X1 U2732 ( .A0(\denoise/first_col_r[2][6] ), .A1(n2748), .B0(
        \denoise/first_col_g[2][6] ), .B1(n2982), .Y(n2927) );
  AO22X1 U2733 ( .A0(\denoise/first_col_r[5][6] ), .A1(n2986), .B0(
        \denoise/first_col_b[3][6] ), .B1(n2742), .Y(n2926) );
  AO22X1 U2734 ( .A0(\denoise/first_col_g[2][4] ), .A1(n2982), .B0(
        \denoise/first_col_g[5][4] ), .B1(n2980), .Y(n2955) );
  AO22X1 U2735 ( .A0(\denoise/first_col_r[3][4] ), .A1(n2829), .B0(
        \denoise/first_col_g[4][4] ), .B1(n2979), .Y(n2956) );
  NAND2X1 U2736 ( .A(n2550), .B(n3698), .Y(n3347) );
  AO22X1 U2737 ( .A0(n3142), .A1(pixel_in_wb[0]), .B0(n3141), .B1(
        pixel_out_dem[0]), .Y(pixel_in_den[0]) );
  AOI2BB2X1 U2738 ( .B0(n3191), .B1(\denoise/second_col_r[3][4] ), .A0N(n3295), 
        .A1N(n3654), .Y(n3258) );
  INVX2 U2739 ( .A(n3203), .Y(n3266) );
  AOI2BB2X1 U2740 ( .B0(\mean/sum_g [1]), .B1(n3388), .A0N(\mean/sum_g [1]), 
        .A1N(n3388), .Y(n1854) );
  AO22X1 U2741 ( .A0(\denoise/first_col_r[5][7] ), .A1(n2986), .B0(n2987), 
        .B1(\denoise/first_col_b[4][7] ), .Y(n2943) );
  AOI2BB2X1 U2742 ( .B0(\denoise/second_col_r[5][3] ), .B1(n2986), .A0N(n3774), 
        .A1N(n2527), .Y(n2783) );
  AOI2BB2X1 U2743 ( .B0(n3191), .B1(\denoise/second_col_r[3][6] ), .A0N(n3295), 
        .A1N(n3777), .Y(n3284) );
  AO22X1 U2744 ( .A0(n3142), .A1(pixel_in_wb[4]), .B0(n3141), .B1(
        pixel_out_dem[4]), .Y(pixel_in_den[4]) );
  AO22X1 U2745 ( .A0(n3142), .A1(pixel_in_wb[2]), .B0(n3141), .B1(
        pixel_out_dem[2]), .Y(pixel_in_den[2]) );
  NOR2X1 U2746 ( .A(n3698), .B(n2520), .Y(n3389) );
  AO22X1 U2747 ( .A0(\denoise/first_col_r[4][0] ), .A1(n2988), .B0(
        \denoise/first_col_b[4][0] ), .B1(n2987), .Y(n2990) );
  OA21XL U2748 ( .A0(n3563), .A1(n3620), .B0(n3562), .Y(n3565) );
  AOI2BB2X1 U2749 ( .B0(\mean/sum_r [1]), .B1(n3345), .A0N(\mean/sum_r [1]), 
        .A1N(n3345), .Y(n1882) );
  AOI2BB2X1 U2750 ( .B0(\gain/b_mean_r [13]), .B1(n3017), .A0N(n3067), .A1N(
        n3818), .Y(n3038) );
  NAND2X1 U2751 ( .A(r_mean_out_mean[5]), .B(n3137), .Y(n2607) );
  AO22X1 U2752 ( .A0(\denoise/first_col_r[4][3] ), .A1(n2988), .B0(
        \denoise/first_col_b[0][3] ), .B1(n2762), .Y(n2974) );
  AO22X1 U2753 ( .A0(\denoise/first_col_r[5][3] ), .A1(n2986), .B0(
        \denoise/first_col_b[2][3] ), .B1(n2981), .Y(n2975) );
  NAND2X1 U2754 ( .A(r_mean_out_mean[6]), .B(n3137), .Y(n2608) );
  INVX2 U2755 ( .A(n3170), .Y(n3257) );
  AO22X1 U2756 ( .A0(n3142), .A1(pixel_in_wb[7]), .B0(n3141), .B1(
        pixel_out_dem[7]), .Y(pixel_in_den[7]) );
  AO22X1 U2757 ( .A0(\denoise/first_col_r[2][2] ), .A1(n2748), .B0(
        \denoise/first_col_g[3][2] ), .B1(n2811), .Y(n2902) );
  AOI2BB2X1 U2758 ( .B0(n2942), .B1(\denoise/pos8 [2]), .A0N(n3843), .A1N(
        n2889), .Y(n2850) );
  AO22X1 U2759 ( .A0(n3337), .A1(\denoise/sum6_r [6]), .B0(n3336), .B1(
        \denoise/sum3_r [6]), .Y(n1914) );
  AO22X1 U2760 ( .A0(n3337), .A1(\denoise/new_sum6 [2]), .B0(n3336), .B1(
        \denoise/sum6_r [2]), .Y(n1947) );
  AO22X1 U2761 ( .A0(n3585), .A1(\gain/K_B_tmp [0]), .B0(n2560), .B1(
        \gain/K_B_tmp [1]), .Y(n1663) );
  NOR2BX1 U2762 ( .AN(\gain/counter_B_r [2]), .B(n2688), .Y(n3558) );
  AO22X1 U2763 ( .A0(n3337), .A1(\denoise/new_sum6 [7]), .B0(n3336), .B1(
        \denoise/sum6_r [7]), .Y(n1907) );
  AO22X1 U2764 ( .A0(n3142), .A1(last_pic_in_wb), .B0(n3141), .B1(
        last_pic_out_dem), .Y(last_pic_in_den) );
  AOI2BB1X2 U2765 ( .A0N(n2527), .A1N(\denoise/n_counter_1 [1]), .B0(
        \denoise/init_12_last_flag ), .Y(n2528) );
  AO22X1 U2766 ( .A0(n3337), .A1(\denoise/sum6_r [1]), .B0(n3336), .B1(
        \denoise/sum3_r [1]), .Y(n1954) );
  AO22X1 U2767 ( .A0(n3337), .A1(\denoise/sum6_r [9]), .B0(n3336), .B1(
        \denoise/sum3_r [9]), .Y(n1890) );
  AO22X1 U2768 ( .A0(n3585), .A1(\gain/K_B_tmp [2]), .B0(n2560), .B1(
        \gain/K_B_tmp [3]), .Y(n1661) );
  NOR2BX1 U2769 ( .AN(last_pic_in_wb), .B(n3143), .Y(last_pic_in_dem) );
  NOR2BX1 U2770 ( .AN(last_col_in_reg), .B(n3143), .Y(last_col_in_dem) );
  NOR2BX1 U2771 ( .AN(pixel_in_wb[0]), .B(n3143), .Y(pixel_in_dem[0]) );
  NOR2BX1 U2772 ( .AN(pixel_in_wb[2]), .B(n3143), .Y(pixel_in_dem[2]) );
  NOR2BX1 U2773 ( .AN(pixel_in_wb[3]), .B(n3143), .Y(pixel_in_dem[3]) );
  AO22X1 U2774 ( .A0(n3337), .A1(\denoise/new_sum6 [9]), .B0(n3336), .B1(
        \denoise/sum6_r [9]), .Y(n1891) );
  AO22X1 U2775 ( .A0(n3337), .A1(\denoise/new_sum6 [8]), .B0(n3336), .B1(
        \denoise/sum6_r [8]), .Y(n1899) );
  NOR2BX1 U2776 ( .AN(pixel_in_wb[4]), .B(n3143), .Y(pixel_in_dem[4]) );
  NOR2BX1 U2777 ( .AN(pixel_in_wb[7]), .B(n3143), .Y(pixel_in_dem[7]) );
  AO22X1 U2778 ( .A0(n3337), .A1(\denoise/sum6_r [0]), .B0(n3336), .B1(
        \denoise/sum3_r [0]), .Y(n1960) );
  AO22X1 U2779 ( .A0(n3337), .A1(\denoise/sum6_r [8]), .B0(n3336), .B1(
        \denoise/sum3_r [8]), .Y(n1898) );
  AO22X1 U2780 ( .A0(n3337), .A1(\denoise/new_sum6 [1]), .B0(n3336), .B1(
        \denoise/sum6_r [1]), .Y(n1955) );
  AO22X1 U2781 ( .A0(\denoise/second_col_b[1][5] ), .A1(n2763), .B0(
        \denoise/second_col_r[5][5] ), .B1(n2986), .Y(n2838) );
  AO22X1 U2782 ( .A0(n3337), .A1(\denoise/new_sum6 [5]), .B0(n3336), .B1(
        \denoise/sum6_r [5]), .Y(n1923) );
  AOI2BB2X1 U2783 ( .B0(\mean/sum_b [1]), .B1(n3431), .A0N(\mean/sum_b [1]), 
        .A1N(n3431), .Y(n1825) );
  AO22X1 U2784 ( .A0(n3337), .A1(\denoise/sum6_r [3]), .B0(n3336), .B1(
        \denoise/sum3_r [3]), .Y(n1938) );
  AO22X1 U2785 ( .A0(n3337), .A1(\denoise/sum6_r [4]), .B0(n3336), .B1(
        \denoise/sum3_r [4]), .Y(n1930) );
  AO22X1 U2786 ( .A0(n3337), .A1(\denoise/new_sum6 [3]), .B0(n3336), .B1(
        \denoise/sum6_r [3]), .Y(n1939) );
  AO22X1 U2787 ( .A0(n3337), .A1(\denoise/new_sum6 [4]), .B0(n3336), .B1(
        \denoise/sum6_r [4]), .Y(n1931) );
  AO22X1 U2788 ( .A0(n3142), .A1(pixel_in_wb[3]), .B0(n3141), .B1(
        pixel_out_dem[3]), .Y(pixel_in_den[3]) );
  AO22X1 U2789 ( .A0(\denoise/first_col_r[2][4] ), .A1(n2748), .B0(
        \denoise/first_col_g[3][4] ), .B1(n2811), .Y(n2963) );
  AO22X1 U2790 ( .A0(n3337), .A1(\denoise/sum6_r [2]), .B0(n3336), .B1(
        \denoise/sum3_r [2]), .Y(n1946) );
  AO22X1 U2791 ( .A0(n3337), .A1(\denoise/sum6_r [5]), .B0(n3336), .B1(
        \denoise/sum3_r [5]), .Y(n1922) );
  AO22X1 U2792 ( .A0(\denoise/first_col_g[3][7] ), .A1(n2811), .B0(n2526), 
        .B1(\denoise/first_col_b[5][7] ), .Y(n2951) );
  AO22X1 U2793 ( .A0(n3633), .A1(n3593), .B0(\gain/N478 ), .B1(n3504), .Y(
        n3506) );
  AO22X1 U2794 ( .A0(n3337), .A1(\denoise/new_sum6 [6]), .B0(n3336), .B1(
        \denoise/sum6_r [6]), .Y(n1915) );
  AOI2BB2X1 U2795 ( .B0(n3191), .B1(\denoise/second_col_r[3][5] ), .A0N(n3295), 
        .A1N(n3657), .Y(n3272) );
  AO22X1 U2796 ( .A0(n3140), .A1(pixel_in_wb[0]), .B0(n3139), .B1(
        pixel_out_den[0]), .Y(pixel_in_mean[0]) );
  CLKMX2X2 U2797 ( .A(\denoise/sum9 [9]), .B(n2380), .S0(n2382), .Y(n2388) );
  AO22X1 U2798 ( .A0(n3138), .A1(k_r_out_gain[1]), .B0(n3605), .B1(
        pixel_out_dem[1]), .Y(n2703) );
  OA21XL U2799 ( .A0(n3615), .A1(n3502), .B0(n3501), .Y(n3491) );
  CLKMX2X2 U2800 ( .A(\denoise/sum9 [8]), .B(n3714), .S0(n2382), .Y(n2386) );
  INVX3 U2801 ( .A(n3336), .Y(n3337) );
  AOI21X1 U2802 ( .A0(\mean/sum_r [1]), .A1(n3344), .B0(n3343), .Y(n2550) );
  MXI2X1 U2803 ( .A(\denoise/sum9 [11]), .B(n3707), .S0(n2382), .Y(n2364) );
  AO22X1 U2804 ( .A0(\denoise/first_col_b[0][2] ), .A1(n2762), .B0(
        \denoise/first_col_b[5][2] ), .B1(n2526), .Y(n2909) );
  AO22X1 U2805 ( .A0(n3140), .A1(pixel_in_wb[2]), .B0(n3139), .B1(
        pixel_out_den[2]), .Y(pixel_in_mean[2]) );
  AO22X1 U2806 ( .A0(n3140), .A1(pixel_in_wb[3]), .B0(n3139), .B1(
        pixel_out_den[3]), .Y(pixel_in_mean[3]) );
  AO22X1 U2807 ( .A0(n3138), .A1(k_r_out_gain[5]), .B0(n3605), .B1(
        pixel_out_dem[5]), .Y(n2699) );
  AO22X1 U2808 ( .A0(n3138), .A1(k_r_out_gain[6]), .B0(n3605), .B1(
        pixel_out_dem[6]), .Y(n2708) );
  AO22X1 U2809 ( .A0(n3138), .A1(k_r_out_gain[2]), .B0(n3605), .B1(
        pixel_out_dem[2]), .Y(n2723) );
  CLKMX2X2 U2810 ( .A(\denoise/sum9 [10]), .B(n2363), .S0(n2382), .Y(n2389) );
  AO22X1 U2811 ( .A0(n3140), .A1(pixel_in_wb[4]), .B0(n3139), .B1(
        pixel_out_den[4]), .Y(pixel_in_mean[4]) );
  AO22X1 U2812 ( .A0(n3339), .A1(\denoise/new_sum6 [0]), .B0(n3338), .B1(
        \denoise/sum6_g [0]), .Y(n1959) );
  AO22X1 U2813 ( .A0(n3339), .A1(\denoise/sum6_g [0]), .B0(n3338), .B1(
        \denoise/sum3_g [0]), .Y(n1958) );
  AO22X1 U2814 ( .A0(n3339), .A1(\denoise/new_sum6 [1]), .B0(n3338), .B1(
        \denoise/sum6_g [1]), .Y(n1953) );
  NOR2X1 U2815 ( .A(n3705), .B(n3138), .Y(n3021) );
  AO22X1 U2816 ( .A0(n3140), .A1(color_in_wb[1]), .B0(n3139), .B1(
        color_out_den[1]), .Y(color_in_mean[1]) );
  AO22X1 U2817 ( .A0(n3140), .A1(pixel_in_wb[7]), .B0(n3139), .B1(
        pixel_out_den[7]), .Y(pixel_in_mean[7]) );
  INVX3 U2818 ( .A(n3288), .Y(n3191) );
  AO22X1 U2819 ( .A0(n3339), .A1(\denoise/sum6_g [1]), .B0(n3338), .B1(
        \denoise/sum3_g [1]), .Y(n1952) );
  AO22X1 U2820 ( .A0(n3339), .A1(\denoise/new_sum6 [2]), .B0(n3338), .B1(
        \denoise/sum6_g [2]), .Y(n1945) );
  AO22X1 U2821 ( .A0(n3339), .A1(\denoise/sum6_g [2]), .B0(n3338), .B1(
        \denoise/sum3_g [2]), .Y(n1944) );
  AO22X1 U2822 ( .A0(n3339), .A1(\denoise/new_sum6 [3]), .B0(n3338), .B1(
        \denoise/sum6_g [3]), .Y(n1937) );
  NOR2BX1 U2823 ( .AN(\gain/counter_R_r [2]), .B(n2689), .Y(n3487) );
  AO22X1 U2824 ( .A0(n3339), .A1(\denoise/sum6_g [3]), .B0(n3338), .B1(
        \denoise/sum3_g [3]), .Y(n1936) );
  NOR3XL U2825 ( .A(\denoise/counter_1 [1]), .B(n2314), .C(n3173), .Y(n3256)
         );
  AO22X1 U2826 ( .A0(n3339), .A1(\denoise/new_sum6 [4]), .B0(n3338), .B1(
        \denoise/sum6_g [4]), .Y(n1929) );
  AO22X1 U2827 ( .A0(n3339), .A1(\denoise/new_sum6 [9]), .B0(n3338), .B1(
        \denoise/sum6_g [9]), .Y(n1889) );
  AND2X2 U2828 ( .A(n2301), .B(n2302), .Y(\gain/N865 ) );
  AO22X1 U2829 ( .A0(n3339), .A1(\denoise/sum6_g [4]), .B0(n3338), .B1(
        \denoise/sum3_g [4]), .Y(n1928) );
  AO22X1 U2830 ( .A0(n3339), .A1(\denoise/sum6_g [5]), .B0(n3338), .B1(
        \denoise/sum3_g [5]), .Y(n1920) );
  AO22X1 U2831 ( .A0(n3339), .A1(\denoise/new_sum6 [6]), .B0(n3338), .B1(
        \denoise/sum6_g [6]), .Y(n1913) );
  AO22X1 U2832 ( .A0(n3339), .A1(\denoise/sum6_g [8]), .B0(n3338), .B1(
        \denoise/sum3_g [8]), .Y(n1896) );
  AO22X1 U2833 ( .A0(n3140), .A1(color_in_wb[0]), .B0(n3139), .B1(
        color_out_den[0]), .Y(color_in_mean[0]) );
  AO22X1 U2834 ( .A0(n3339), .A1(\denoise/sum6_g [6]), .B0(n3338), .B1(
        \denoise/sum3_g [6]), .Y(n1912) );
  AO22X1 U2835 ( .A0(n3339), .A1(\denoise/new_sum6 [7]), .B0(n3338), .B1(
        \denoise/sum6_g [7]), .Y(n1905) );
  AO22X1 U2836 ( .A0(n3339), .A1(\denoise/sum6_g [7]), .B0(n3338), .B1(
        \denoise/sum3_g [7]), .Y(n1904) );
  AO22X1 U2837 ( .A0(n3339), .A1(\denoise/new_sum6 [8]), .B0(n3338), .B1(
        \denoise/sum6_g [8]), .Y(n1897) );
  INVX3 U2838 ( .A(n3295), .Y(n3192) );
  AO22X1 U2839 ( .A0(n3103), .A1(\gain/K_G_tmp [1]), .B0(n2562), .B1(
        \gain/K_G_tmp [2]), .Y(n1702) );
  INVX3 U2840 ( .A(n2562), .Y(n3103) );
  INVX3 U2841 ( .A(n3139), .Y(n3140) );
  INVX4 U2842 ( .A(n2597), .Y(n3119) );
  NOR2X1 U2843 ( .A(n3700), .B(n2549), .Y(n3343) );
  NAND2X1 U2844 ( .A(n3700), .B(n2549), .Y(n3344) );
  INVX3 U2845 ( .A(n3338), .Y(n3339) );
  AOI2BB1X2 U2846 ( .A0N(\denoise/sum3 [1]), .A1N(\denoise/sum6 [1]), .B0(
        \intadd_3/CI ), .Y(\intadd_1/A[1] ) );
  OA21XL U2847 ( .A0(\gain/b_mean_r [13]), .A1(n3754), .B0(n3032), .Y(n3036)
         );
  NOR3XL U2848 ( .A(\denoise/counter_1 [2]), .B(\denoise/counter_1 [0]), .C(
        n3622), .Y(n3166) );
  NOR2X4 U2849 ( .A(\denoise/counter_1 [0]), .B(n3756), .Y(n3323) );
  NOR2X4 U2850 ( .A(n3621), .B(\denoise/valid_count_0 [1]), .Y(n2504) );
  NOR2BX1 U2851 ( .AN(\denoise/state_2 [0]), .B(\denoise/color_2 [0]), .Y(
        n3335) );
  NAND2X1 U2852 ( .A(\mean/value_r [0]), .B(\mean/sum_r [0]), .Y(n2549) );
  NOR2X4 U2853 ( .A(\gain/state_R_r [0]), .B(n3738), .Y(n2597) );
  NOR2BX1 U2854 ( .AN(\gain/B_r [9]), .B(\gain/b_mean_r [9]), .Y(n3030) );
  AOI2BB2X1 U2855 ( .B0(n3635), .B1(n3723), .A0N(n3635), .A1N(n3723), .Y(n3577) );
  NOR2BX1 U2856 ( .AN(\denoise/sum6 [1]), .B(n3759), .Y(\intadd_3/CI ) );
  NOR2X1 U2857 ( .A(\gain/B_r [14]), .B(n3733), .Y(n3068) );
  NOR2X1 U2858 ( .A(\gain/B_r [12]), .B(n3640), .Y(n3061) );
  BUFX20 U2859 ( .A(rst_n), .Y(n3919) );
  BUFX20 U2860 ( .A(rst_n), .Y(n3918) );
  AOI21X1 U2861 ( .A0(n3424), .A1(n3832), .B0(n3426), .Y(n1830) );
  AND2X2 U2862 ( .A(n3426), .B(\mean/g_mean_tmp [6]), .Y(n3427) );
  AOI21X1 U2863 ( .A0(n3466), .A1(n3833), .B0(n3468), .Y(n1801) );
  AND2X2 U2864 ( .A(n3468), .B(\mean/b_mean_tmp [6]), .Y(n3469) );
  AND2X2 U2865 ( .A(n3383), .B(\mean/r_mean_tmp [6]), .Y(n3384) );
  INVX1 U2866 ( .A(n3110), .Y(n2501) );
  AOI21X1 U2867 ( .A0(n3381), .A1(n3831), .B0(n3383), .Y(n1858) );
  NAND2X1 U2868 ( .A(n3465), .B(\mean/b_mean_tmp [2]), .Y(n3464) );
  NAND2X1 U2869 ( .A(n3423), .B(\mean/g_mean_tmp [2]), .Y(n3422) );
  OA21XL U2870 ( .A0(n3421), .A1(\mean/g_mean_tmp [0]), .B0(n3420), .Y(n1835)
         );
  NAND2X1 U2871 ( .A(n3421), .B(\mean/g_mean_tmp [0]), .Y(n3420) );
  NAND2X1 U2872 ( .A(n3463), .B(\mean/b_mean_tmp [0]), .Y(n3462) );
  NAND2X1 U2873 ( .A(n3380), .B(\mean/r_mean_tmp [2]), .Y(n3379) );
  NAND2X1 U2874 ( .A(n3461), .B(\mean/sum_b [18]), .Y(n3460) );
  NAND2X1 U2875 ( .A(n3378), .B(\mean/r_mean_tmp [0]), .Y(n3377) );
  OA21XL U2876 ( .A0(n3459), .A1(\mean/sum_b [16]), .B0(n3458), .Y(n1810) );
  OA21XL U2877 ( .A0(n3376), .A1(\mean/sum_r [18]), .B0(n3375), .Y(n1865) );
  NAND2X2 U2878 ( .A(n3417), .B(\mean/sum_g [16]), .Y(n3416) );
  NAND2X1 U2879 ( .A(n3376), .B(\mean/sum_r [18]), .Y(n3375) );
  CLKMX2X2 U2880 ( .A(\denoise/sum9 [1]), .B(n3869), .S0(
        \denoise/n_pixel_out_reg [1]), .Y(n3100) );
  CLKMX2X2 U2881 ( .A(n3095), .B(n3094), .S0(\denoise/n_pixel_out_reg [1]), 
        .Y(n3099) );
  OA21XL U2882 ( .A0(n3374), .A1(\mean/sum_r [16]), .B0(n3373), .Y(n1867) );
  OA21XL U2883 ( .A0(n3415), .A1(\mean/sum_g [14]), .B0(n3414), .Y(n1841) );
  CLKMX2X2 U2884 ( .A(n3097), .B(n2372), .S0(\denoise/n_pixel_out_reg [1]), 
        .Y(n3098) );
  OAI2BB2XL U2885 ( .B0(n3576), .B1(\intadd_0/CI ), .A0N(\gain/R_r [0]), .A1N(
        n3555), .Y(n1726) );
  NAND2X1 U2886 ( .A(n3415), .B(\mean/sum_g [14]), .Y(n3414) );
  NAND2X1 U2887 ( .A(n3374), .B(\mean/sum_r [16]), .Y(n3373) );
  NAND2X1 U2888 ( .A(n3457), .B(\mean/sum_b [14]), .Y(n3456) );
  OA21XL U2889 ( .A0(n3372), .A1(\mean/sum_r [14]), .B0(n3371), .Y(n1869) );
  OA21XL U2890 ( .A0(n3455), .A1(\mean/sum_b [12]), .B0(n3454), .Y(n1814) );
  NOR3X1 U2891 ( .A(n3097), .B(n3095), .C(\denoise/sum9 [1]), .Y(n2426) );
  AOI2BB2X1 U2892 ( .B0(n3017), .B1(\gain/b_mean_r [8]), .A0N(n3049), .A1N(
        n3580), .Y(n3051) );
  AOI2BB2X1 U2893 ( .B0(n3559), .B1(\gain/K_mean_r [11]), .A0N(n3057), .A1N(
        n3580), .Y(n3059) );
  INVX1 U2894 ( .A(n2617), .Y(n3554) );
  NAND2X1 U2895 ( .A(n3455), .B(\mean/sum_b [12]), .Y(n3454) );
  NAND2X1 U2896 ( .A(n3372), .B(\mean/sum_r [14]), .Y(n3371) );
  INVX1 U2897 ( .A(n2476), .Y(n2469) );
  NAND2X1 U2898 ( .A(n3413), .B(\mean/sum_g [12]), .Y(n3412) );
  OA21XL U2899 ( .A0(n3453), .A1(\mean/sum_b [10]), .B0(n3452), .Y(n1816) );
  INVX3 U2900 ( .A(n3576), .Y(n3083) );
  OA21XL U2901 ( .A0(n3370), .A1(\mean/sum_r [12]), .B0(n3369), .Y(n1871) );
  INVX2 U2902 ( .A(n3581), .Y(n3060) );
  OA21XL U2903 ( .A0(n3411), .A1(\mean/sum_g [10]), .B0(n3410), .Y(n1845) );
  NOR3X1 U2904 ( .A(n2423), .B(n2421), .C(\denoise/sum9 [2]), .Y(n2419) );
  NOR2X4 U2905 ( .A(n3541), .B(n2618), .Y(n2617) );
  AOI2BB2X1 U2906 ( .B0(\gain/K_mean_r [10]), .B1(n3535), .A0N(n3534), .A1N(
        n3736), .Y(n3536) );
  NAND2X1 U2907 ( .A(n3370), .B(\mean/sum_r [12]), .Y(n3369) );
  AOI2BB1X1 U2908 ( .A0N(n3585), .A1N(\gain/K_B_tmp [0]), .B0(n3584), .Y(n1664) );
  NAND2X1 U2909 ( .A(n3453), .B(\mean/sum_b [10]), .Y(n3452) );
  NAND2X1 U2910 ( .A(n3411), .B(\mean/sum_g [10]), .Y(n3410) );
  INVX1 U2911 ( .A(n2424), .Y(n2418) );
  NOR4X1 U2912 ( .A(\C237/DATA2_10 ), .B(\DP_OP_654J1_124_416/n1 ), .C(
        \C237/DATA2_8 ), .D(\C237/DATA2_9 ), .Y(n3039) );
  OA21XL U2913 ( .A0(n3451), .A1(\mean/sum_b [8]), .B0(n3450), .Y(n1818) );
  AOI211X1 U2914 ( .A0(n3544), .A1(n3543), .B0(\gain/state_R_r [0]), .C0(n2616), .Y(n2618) );
  OA21XL U2915 ( .A0(n3409), .A1(\mean/sum_g [8]), .B0(n3408), .Y(n1847) );
  INVX1 U2916 ( .A(n2468), .Y(n2461) );
  NOR2X2 U2917 ( .A(n3024), .B(n2562), .Y(n3025) );
  NAND2X1 U2918 ( .A(n3451), .B(\mean/sum_b [8]), .Y(n3450) );
  NAND2X1 U2919 ( .A(n3409), .B(\mean/sum_g [8]), .Y(n3408) );
  NAND2X1 U2920 ( .A(n3368), .B(\mean/sum_r [10]), .Y(n3367) );
  NOR3X1 U2921 ( .A(n2415), .B(n2413), .C(\denoise/sum9 [3]), .Y(n2411) );
  OAI2BB2XL U2922 ( .B0(\gain/G_r [15]), .B1(n3755), .A0N(\intadd_6/n1 ), 
        .A1N(n3532), .Y(n3024) );
  OA21XL U2923 ( .A0(n3366), .A1(\mean/sum_r [8]), .B0(n3365), .Y(n1875) );
  AOI2BB2X1 U2924 ( .B0(n3546), .B1(n3545), .A0N(n3546), .A1N(n3545), .Y(n3548) );
  INVX1 U2925 ( .A(n2417), .Y(n2416) );
  AOI2BB1X2 U2926 ( .A0N(\mean/sum_b [7]), .A1N(n3449), .B0(n3448), .Y(n3451)
         );
  AOI2BB1X2 U2927 ( .A0N(\mean/sum_g [7]), .A1N(n3407), .B0(n3406), .Y(n3409)
         );
  INVX1 U2928 ( .A(n3546), .Y(n2614) );
  INVX1 U2929 ( .A(n2460), .Y(n2453) );
  ADDFX2 U2930 ( .A(\gain/r_mean_r [13]), .B(n3650), .CI(n2619), .CO(n3546), 
        .S(n2620) );
  AO21X2 U2931 ( .A0(n3708), .A1(n2525), .B0(n3401), .Y(n3406) );
  AO21X2 U2932 ( .A0(n3708), .A1(n2518), .B0(n2517), .Y(n3448) );
  NAND2X1 U2933 ( .A(n3366), .B(\mean/sum_r [8]), .Y(n3365) );
  AND2X2 U2934 ( .A(\intadd_1/n1 ), .B(\intadd_3/n1 ), .Y(\denoise/n_sum9 [11]) );
  AOI2BB2X1 U2935 ( .B0(\mean/sum_r [6]), .B1(n3361), .A0N(\mean/sum_r [6]), 
        .A1N(n3361), .Y(n1877) );
  AOI2BB1X2 U2936 ( .A0N(\mean/sum_r [7]), .A1N(n3364), .B0(n3363), .Y(n3366)
         );
  NOR3X1 U2937 ( .A(n2409), .B(n2407), .C(\denoise/sum9 [4]), .Y(n2405) );
  INVX1 U2938 ( .A(\intadd_0/n1 ), .Y(n2612) );
  ADDFX2 U2939 ( .A(n2448), .B(n2447), .CI(n2446), .CO(n2449), .S(n2454) );
  AO21X2 U2940 ( .A0(n3708), .A1(n2554), .B0(n3359), .Y(n3363) );
  AOI2BB2X1 U2941 ( .B0(\mean/sum_r [5]), .B1(n3357), .A0N(\mean/sum_r [5]), 
        .A1N(n3357), .Y(n1878) );
  AOI2BB2X1 U2942 ( .B0(n2597), .B1(\gain/r_mean_r [15]), .A0N(n3645), .A1N(
        n2601), .Y(n3014) );
  OAI21X1 U2943 ( .A0(\mean/sum_b [5]), .A1(n3441), .B0(n3442), .Y(n2516) );
  ADDFX2 U2944 ( .A(n2457), .B(n2456), .CI(n2455), .CO(n2446), .S(n2462) );
  AOI2BB2X1 U2945 ( .B0(\gain/b_mean_r [8]), .B1(n3571), .A0N(n2560), .A1N(
        n3734), .Y(n3572) );
  AOI2BB2X1 U2946 ( .B0(\gain/b_mean_r [10]), .B1(n3571), .A0N(n2560), .A1N(
        n3839), .Y(n3564) );
  AOI2BB2X1 U2947 ( .B0(\gain/r_mean_r [13]), .B1(n2597), .A0N(n3641), .A1N(
        n2601), .Y(n3474) );
  AOI2BB2X1 U2948 ( .B0(\intadd_2/n1 ), .B1(n3530), .A0N(n3736), .A1N(
        \gain/g_mean_r [10]), .Y(\intadd_6/CI ) );
  NAND2X1 U2949 ( .A(n3710), .B(n2515), .Y(n3442) );
  AOI2BB2X1 U2950 ( .B0(n3585), .B1(\gain/b_mean_r [10]), .A0N(n3734), .A1N(
        n3568), .Y(n3569) );
  AOI2BB2X1 U2951 ( .B0(\gain/g_mean_r [8]), .B1(n3513), .A0N(n3740), .A1N(
        n2562), .Y(n3514) );
  INVX1 U2952 ( .A(n2478), .Y(n2482) );
  AOI2BB2X1 U2953 ( .B0(\gain/g_mean_r [10]), .B1(n3513), .A0N(n3679), .A1N(
        n2562), .Y(n3509) );
  NAND2X1 U2954 ( .A(n3710), .B(n2523), .Y(n3399) );
  AOI2BB2X1 U2955 ( .B0(\mean/sum_r [4]), .B1(n3354), .A0N(\mean/sum_r [4]), 
        .A1N(n3354), .Y(n1879) );
  INVX1 U2956 ( .A(n2403), .Y(n2397) );
  AND2X2 U2957 ( .A(\intadd_4/n1 ), .B(n3132), .Y(\denoise/n_new_sum6 [9]) );
  AOI2BB2X1 U2958 ( .B0(\gain/r_mean_r [9]), .B1(n3479), .A0N(n3737), .A1N(
        n3119), .Y(n3477) );
  NOR3X1 U2959 ( .A(n2402), .B(n2400), .C(\denoise/sum9 [5]), .Y(n2398) );
  AOI2BB2X1 U2960 ( .B0(\gain/r_mean_r [13]), .B1(n3479), .A0N(n3645), .A1N(
        n3119), .Y(n2847) );
  AOI2BB2X1 U2961 ( .B0(\gain/r_mean_r [8]), .B1(n3479), .A0N(n3739), .A1N(
        n3119), .Y(n3480) );
  AOI2BB2X1 U2962 ( .B0(n2866), .B1(n2824), .A0N(n2560), .A1N(n3733), .Y(n2828) );
  INVX2 U2963 ( .A(n3479), .Y(n2601) );
  NAND2BX1 U2964 ( .AN(n2297), .B(\gain/counter_B_r [1]), .Y(n2735) );
  AOI2BB2X1 U2965 ( .B0(n3317), .B1(n3292), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][6] ), .Y(n2034) );
  AOI2BB2X1 U2966 ( .B0(n3311), .B1(n3275), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][5] ), .Y(n2078) );
  AOI2BB2X1 U2967 ( .B0(n3317), .B1(n3279), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][5] ), .Y(n2071) );
  AOI2BB2X1 U2968 ( .B0(n3329), .B1(n3254), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][3] ), .Y(n2133) );
  AOI2BB2X1 U2969 ( .B0(n3602), .B1(n3601), .A0N(n3602), .A1N(n3601), .Y(n1639) );
  AOI2BB2X1 U2970 ( .B0(n3311), .B1(n3287), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][6] ), .Y(n2041) );
  AOI2BB2X1 U2971 ( .B0(n3329), .B1(n3241), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][2] ), .Y(n2170) );
  AOI2BB2X1 U2972 ( .B0(n3311), .B1(n3261), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][4] ), .Y(n2115) );
  AOI2BB2X1 U2973 ( .B0(n3329), .B1(n3228), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][1] ), .Y(n2207) );
  AOI2BB2X1 U2974 ( .B0(n3317), .B1(n3265), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][4] ), .Y(n2108) );
  AOI2BB2X1 U2975 ( .B0(n3329), .B1(n3271), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][4] ), .Y(n2096) );
  NAND2X1 U2976 ( .A(n3704), .B(n2522), .Y(n3396) );
  INVX1 U2977 ( .A(n2494), .Y(n2498) );
  AOI2BB2X1 U2978 ( .B0(n3329), .B1(n3215), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][0] ), .Y(n2244) );
  AOI2BB2X1 U2979 ( .B0(n3317), .B1(n3196), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][0] ), .Y(n2256) );
  OAI21X1 U2980 ( .A0(n3352), .A1(n3706), .B0(n3353), .Y(n2553) );
  AOI2BB2X1 U2981 ( .B0(n3329), .B1(n3298), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][6] ), .Y(n2022) );
  NAND2X1 U2982 ( .A(n3704), .B(n2514), .Y(n3439) );
  AOI2BB2X1 U2983 ( .B0(n3317), .B1(n3321), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][7] ), .Y(n1997) );
  AOI2BB2X1 U2984 ( .B0(n3311), .B1(n3245), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][3] ), .Y(n2152) );
  AOI2BB2X1 U2985 ( .B0(n3317), .B1(n3236), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][2] ), .Y(n2182) );
  AOI2BB2X1 U2986 ( .B0(n3317), .B1(n3249), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][3] ), .Y(n2145) );
  AOI2BB2X1 U2987 ( .B0(n3311), .B1(n3179), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][0] ), .Y(n2263) );
  AOI2BB2X1 U2988 ( .B0(n3311), .B1(n3219), .A0N(n3311), .A1N(
        \denoise/first_col_r[0][1] ), .Y(n2226) );
  AOI2BB2X1 U2989 ( .B0(n3317), .B1(n3223), .A0N(n3317), .A1N(
        \denoise/first_col_g[0][1] ), .Y(n2219) );
  AOI2BB2X1 U2990 ( .B0(n3329), .B1(n3333), .A0N(n3329), .A1N(
        \denoise/first_col_b[0][7] ), .Y(n1977) );
  AOI2BB2X1 U2991 ( .B0(n3322), .B1(n3223), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][1] ), .Y(n2214) );
  AOI2BB2X1 U2992 ( .B0(n3319), .B1(n3223), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][1] ), .Y(n2216) );
  AOI2BB2X1 U2993 ( .B0(n3319), .B1(n3236), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][2] ), .Y(n2179) );
  AOI2BB2X1 U2994 ( .B0(n3305), .B1(n3287), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][6] ), .Y(n2046) );
  AOI2BB2X1 U2995 ( .B0(n3318), .B1(n3223), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][1] ), .Y(n2217) );
  AOI2BB2X1 U2996 ( .B0(n3307), .B1(n3287), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][6] ), .Y(n2044) );
  AOI2BB2X1 U2997 ( .B0(n3330), .B1(n3228), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][1] ), .Y(n2206) );
  AOI2BB2X1 U2998 ( .B0(n3305), .B1(n3261), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][4] ), .Y(n2120) );
  AOI2BB2X1 U2999 ( .B0(n3306), .B1(n3261), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][4] ), .Y(n2119) );
  AOI2BB2X1 U3000 ( .B0(n3331), .B1(n3228), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][1] ), .Y(n2205) );
  AOI2BB2X1 U3001 ( .B0(n3309), .B1(n3275), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][5] ), .Y(n2079) );
  AOI2BB2X1 U3002 ( .B0(n3307), .B1(n3261), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][4] ), .Y(n2118) );
  AOI2BB2X1 U3003 ( .B0(n3332), .B1(n3228), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][1] ), .Y(n2204) );
  AOI2BB2X1 U3004 ( .B0(n3309), .B1(n3261), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][4] ), .Y(n2116) );
  AOI2BB2X1 U3005 ( .B0(n3308), .B1(n3275), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][5] ), .Y(n2080) );
  AOI2BB2X1 U3006 ( .B0(n3334), .B1(n3228), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][1] ), .Y(n2202) );
  AOI2BB2X1 U3007 ( .B0(n3307), .B1(n3275), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][5] ), .Y(n2081) );
  AOI2BB2X1 U3008 ( .B0(n3318), .B1(n3249), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][3] ), .Y(n2143) );
  AOI2BB2X1 U3009 ( .B0(n3332), .B1(n3298), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][6] ), .Y(n2019) );
  AOI2BB2X1 U3010 ( .B0(n3587), .B1(n3586), .A0N(n3589), .A1N(n3588), .Y(n1644) );
  AOI2BB2X1 U3011 ( .B0(n3319), .B1(n3249), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][3] ), .Y(n2142) );
  AOI2BB2X1 U3012 ( .B0(\intadd_5/n1 ), .B1(n3577), .A0N(\intadd_5/n1 ), .A1N(
        n3577), .Y(n3579) );
  AOI2BB2X1 U3013 ( .B0(n3319), .B1(n3279), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][5] ), .Y(n2068) );
  AOI2BB2X1 U3014 ( .B0(n3331), .B1(n3298), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][6] ), .Y(n2020) );
  AOI2BB2X1 U3015 ( .B0(n3330), .B1(n3298), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][6] ), .Y(n2021) );
  AOI2BB2X1 U3016 ( .B0(n3305), .B1(n3310), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][7] ), .Y(n2009) );
  AOI2BB2X1 U3017 ( .B0(n3308), .B1(n3179), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][0] ), .Y(n2265) );
  AOI2BB2X1 U3018 ( .B0(n3307), .B1(n3310), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][7] ), .Y(n2007) );
  AOI2BB2X1 U3019 ( .B0(n3322), .B1(n3249), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][3] ), .Y(n2140) );
  AOI2BB2X1 U3020 ( .B0(n3308), .B1(n3310), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][7] ), .Y(n2006) );
  AOI2BB2X1 U3021 ( .B0(n3309), .B1(n3310), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][7] ), .Y(n2005) );
  AOI2BB2X1 U3022 ( .B0(n3599), .B1(n3600), .A0N(n3599), .A1N(n3600), .Y(n1640) );
  AOI2BB2X1 U3023 ( .B0(n3308), .B1(n3245), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][3] ), .Y(n2154) );
  AOI2BB2X1 U3024 ( .B0(n3318), .B1(n3279), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][5] ), .Y(n2069) );
  AOI2BB2X1 U3025 ( .B0(n3180), .B1(n3321), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][7] ), .Y(n1996) );
  AOI2BB2X1 U3026 ( .B0(n3318), .B1(n3321), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][7] ), .Y(n1995) );
  AOI2BB2X1 U3027 ( .B0(n3319), .B1(n3321), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][7] ), .Y(n1994) );
  AOI2BB2X1 U3028 ( .B0(n3180), .B1(n3236), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][2] ), .Y(n2181) );
  AOI2BB2X1 U3029 ( .B0(n3322), .B1(n3279), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][5] ), .Y(n2066) );
  AOI2BB2X1 U3030 ( .B0(n3330), .B1(n3254), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][3] ), .Y(n2132) );
  AOI2BB2X1 U3031 ( .B0(n3180), .B1(n3279), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][5] ), .Y(n2070) );
  AOI2BB2X1 U3032 ( .B0(n3331), .B1(n3254), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][3] ), .Y(n2131) );
  AOI2BB2X1 U3033 ( .B0(n3330), .B1(n3333), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][7] ), .Y(n1976) );
  AOI2BB2X1 U3034 ( .B0(n3331), .B1(n3333), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][7] ), .Y(n1975) );
  AOI2BB2X1 U3035 ( .B0(n3332), .B1(n3254), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][3] ), .Y(n2130) );
  AOI2BB2X1 U3036 ( .B0(n3332), .B1(n3333), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][7] ), .Y(n1974) );
  AOI2BB2X1 U3037 ( .B0(n3309), .B1(n3287), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][6] ), .Y(n2042) );
  AOI2BB2X1 U3038 ( .B0(n3334), .B1(n3254), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][3] ), .Y(n2128) );
  AOI2BB2X1 U3039 ( .B0(n3334), .B1(n3333), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][7] ), .Y(n1972) );
  AOI2BB2X1 U3040 ( .B0(n3318), .B1(n3236), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][2] ), .Y(n2180) );
  AOI2BB2X1 U3041 ( .B0(n3308), .B1(n3287), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][6] ), .Y(n2043) );
  AOI2BB2X1 U3042 ( .B0(n3180), .B1(n3223), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][1] ), .Y(n2218) );
  AOI2BB2X1 U3043 ( .B0(n3322), .B1(n3321), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][7] ), .Y(n1992) );
  AOI2BB2X1 U3044 ( .B0(n3322), .B1(n3196), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][0] ), .Y(n2251) );
  AOI2BB2X1 U3045 ( .B0(n3334), .B1(n3215), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][0] ), .Y(n2239) );
  AOI2BB2X1 U3046 ( .B0(n3331), .B1(n3283), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][5] ), .Y(n2057) );
  AOI2BB2X1 U3047 ( .B0(n3330), .B1(n3215), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][0] ), .Y(n2243) );
  AOI2BB2X1 U3048 ( .B0(n3332), .B1(n3241), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][2] ), .Y(n2167) );
  AOI2BB2X1 U3049 ( .B0(n3334), .B1(n3241), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][2] ), .Y(n2165) );
  AOI2BB2X1 U3050 ( .B0(n3332), .B1(n3283), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][5] ), .Y(n2056) );
  AOI2BB2X1 U3051 ( .B0(n3331), .B1(n3215), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][0] ), .Y(n2242) );
  AOI2BB2X1 U3052 ( .B0(n3319), .B1(n3196), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][0] ), .Y(n2253) );
  AOI2BB2X1 U3053 ( .B0(n3331), .B1(n3241), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][2] ), .Y(n2168) );
  AOI2BB2X1 U3054 ( .B0(n3330), .B1(n3283), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][5] ), .Y(n2058) );
  AOI2BB2X1 U3055 ( .B0(n3305), .B1(n3275), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][5] ), .Y(n2083) );
  AOI2BB2X1 U3056 ( .B0(n3306), .B1(n3275), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][5] ), .Y(n2082) );
  NOR2X1 U3057 ( .A(\mean/value_r [4]), .B(n2552), .Y(n3352) );
  AOI2BB2X1 U3058 ( .B0(n3332), .B1(n3215), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][0] ), .Y(n2241) );
  AOI2BB2X1 U3059 ( .B0(n3330), .B1(n3241), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][2] ), .Y(n2169) );
  NAND2X1 U3060 ( .A(\mean/value_r [4]), .B(n2552), .Y(n3353) );
  AOI2BB2X1 U3061 ( .B0(n3318), .B1(n3265), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][4] ), .Y(n2106) );
  AOI2BB2X1 U3062 ( .B0(n3319), .B1(n3265), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][4] ), .Y(n2105) );
  AOI2BB2X1 U3063 ( .B0(n3308), .B1(n3232), .A0N(n3308), .A1N(
        \denoise/first_col_r[2][2] ), .Y(n2191) );
  AOI2BB2X1 U3064 ( .B0(n3322), .B1(n3236), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][2] ), .Y(n2177) );
  AOI2BB2X1 U3065 ( .B0(n3318), .B1(n3196), .A0N(n3318), .A1N(
        \denoise/first_col_g[2][0] ), .Y(n2254) );
  AOI2BB2X1 U3066 ( .B0(n3334), .B1(n3283), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][5] ), .Y(n2054) );
  AOI2BB2X1 U3067 ( .B0(n3180), .B1(n3265), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][4] ), .Y(n2107) );
  NAND2X2 U3068 ( .A(n2587), .B(n2585), .Y(n2568) );
  AO21X2 U3069 ( .A0(\mean/sum_r [3]), .A1(n3350), .B0(n3349), .Y(n2552) );
  AOI2BB2X1 U3070 ( .B0(n3332), .B1(n3271), .A0N(n3332), .A1N(
        \denoise/first_col_b[3][4] ), .Y(n2093) );
  AOI2BB2X1 U3071 ( .B0(n3330), .B1(n3271), .A0N(n3330), .A1N(
        \denoise/first_col_b[1][4] ), .Y(n2095) );
  NOR3X1 U3072 ( .A(n2395), .B(n2393), .C(\denoise/sum9 [6]), .Y(n2391) );
  AOI2BB2X1 U3073 ( .B0(n3305), .B1(n3219), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][1] ), .Y(n2231) );
  AOI2BB2X1 U3074 ( .B0(n3309), .B1(n3245), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][3] ), .Y(n2153) );
  AOI2BB2X1 U3075 ( .B0(n3309), .B1(n3179), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][0] ), .Y(n2264) );
  NAND2X1 U3076 ( .A(n3703), .B(n2513), .Y(n3436) );
  INVX1 U3077 ( .A(n3470), .Y(n3588) );
  AOI2BB2X1 U3078 ( .B0(n3309), .B1(n3232), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][2] ), .Y(n2190) );
  AOI2BB2X1 U3079 ( .B0(\denoise/second_col_g[4][6] ), .B1(n2979), .A0N(n3845), 
        .A1N(n2884), .Y(n2795) );
  AOI2BB2X1 U3080 ( .B0(n3307), .B1(n3232), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][2] ), .Y(n2192) );
  NAND2X1 U3081 ( .A(n3703), .B(n2521), .Y(n3393) );
  AOI2BB2X1 U3082 ( .B0(n3305), .B1(n3232), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][2] ), .Y(n2194) );
  AOI2BB2X1 U3083 ( .B0(n3305), .B1(n3179), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][0] ), .Y(n2268) );
  AOI2BB2X1 U3084 ( .B0(n3307), .B1(n3179), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][0] ), .Y(n2266) );
  AOI2BB2X1 U3085 ( .B0(n3322), .B1(n3292), .A0N(n3322), .A1N(
        \denoise/first_col_g[5][6] ), .Y(n2029) );
  AOI2BB2X1 U3086 ( .B0(n3307), .B1(n3245), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][3] ), .Y(n2155) );
  AOI2BB2X1 U3087 ( .B0(\denoise/second_col_g[5][2] ), .B1(n2980), .A0N(n3842), 
        .A1N(n2884), .Y(n2861) );
  AOI2BB2X1 U3088 ( .B0(n3305), .B1(n3245), .A0N(n3305), .A1N(
        \denoise/first_col_r[5][3] ), .Y(n2157) );
  INVX1 U3089 ( .A(n3560), .Y(n2326) );
  AOI2BB2X1 U3090 ( .B0(n3309), .B1(n3219), .A0N(n3309), .A1N(
        \denoise/first_col_r[1][1] ), .Y(n2227) );
  NAND2BX1 U3091 ( .AN(n3153), .B(n3158), .Y(n3156) );
  AOI2BB2X1 U3092 ( .B0(n3306), .B1(n3245), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][3] ), .Y(n2156) );
  AOI2BB2X1 U3093 ( .B0(n3307), .B1(n3219), .A0N(n3307), .A1N(
        \denoise/first_col_r[3][1] ), .Y(n2229) );
  AOI2BB2X1 U3094 ( .B0(n3319), .B1(n3292), .A0N(n3319), .A1N(
        \denoise/first_col_g[3][6] ), .Y(n2031) );
  AOI2BB2X1 U3095 ( .B0(n3180), .B1(n3292), .A0N(n3180), .A1N(
        \denoise/first_col_g[1][6] ), .Y(n2033) );
  NAND2X1 U3096 ( .A(n3703), .B(n2551), .Y(n3350) );
  AOI2BB2X1 U3097 ( .B0(n3306), .B1(n3232), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][2] ), .Y(n2193) );
  NAND2BX1 U3098 ( .AN(n3161), .B(\denoise/n_state_1 [0]), .Y(n3153) );
  AOI2BB2X1 U3099 ( .B0(n3306), .B1(n3219), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][1] ), .Y(n2230) );
  INVX2 U3100 ( .A(n3331), .Y(n3202) );
  INVX2 U3101 ( .A(n2889), .Y(n2742) );
  INVX2 U3102 ( .A(n3197), .Y(n3198) );
  AOI2BB2X1 U3103 ( .B0(n3334), .B1(n3271), .A0N(n3334), .A1N(
        \denoise/first_col_b[5][4] ), .Y(n2091) );
  INVX2 U3104 ( .A(n3313), .Y(n3312) );
  AOI2BB2X1 U3105 ( .B0(n3306), .B1(n3179), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][0] ), .Y(n2267) );
  INVX2 U3106 ( .A(n3174), .Y(n3175) );
  AOI2BB2X1 U3107 ( .B0(n3331), .B1(n3271), .A0N(n3331), .A1N(
        \denoise/first_col_b[2][4] ), .Y(n2094) );
  NAND2BX1 U3108 ( .AN(n2588), .B(n2587), .Y(n3527) );
  AOI2BB2X1 U3109 ( .B0(n2942), .B1(n3224), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [1]), .Y(n2238) );
  INVX2 U3110 ( .A(n3182), .Y(n3183) );
  INVX2 U3111 ( .A(n3180), .Y(n3181) );
  INVX2 U3112 ( .A(n2835), .Y(n2786) );
  AO22X1 U3113 ( .A0(n3473), .A1(\gain/N325 ), .B0(n3590), .B1(n3482), .Y(
        n3475) );
  INVX3 U3114 ( .A(n3205), .Y(n3206) );
  INVX2 U3115 ( .A(n2526), .Y(n2527) );
  NAND2X1 U3116 ( .A(n3698), .B(n2520), .Y(n3390) );
  INVX3 U3117 ( .A(n3320), .Y(n3187) );
  AOI2BB2X1 U3118 ( .B0(n2942), .B1(n3293), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [6]), .Y(n2053) );
  AOI2BB2X1 U3119 ( .B0(n2942), .B1(n3250), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [3]), .Y(n2164) );
  INVX1 U3120 ( .A(n2608), .Y(n2430) );
  INVX1 U3121 ( .A(n2591), .Y(n2431) );
  INVX1 U3122 ( .A(n2578), .Y(n2432) );
  INVX2 U3123 ( .A(n2888), .Y(n2829) );
  AOI2BB2X1 U3124 ( .B0(n2942), .B1(n2329), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [7]), .Y(n2016) );
  INVX1 U3125 ( .A(n2609), .Y(n2428) );
  INVX1 U3126 ( .A(n2594), .Y(n2429) );
  AOI2BB2X1 U3127 ( .B0(\denoise/second_col_b[2][6] ), .B1(n2981), .A0N(n3846), 
        .A1N(n2888), .Y(n2787) );
  INVX1 U3128 ( .A(n2592), .Y(n2437) );
  AOI2BB2X1 U3129 ( .B0(n3103), .B1(n3830), .A0N(n3103), .A1N(
        \gain/K_G_tmp [1]), .Y(n1703) );
  AOI2BB2X1 U3130 ( .B0(n3191), .B1(\denoise/second_col_g[3][4] ), .A0N(n3326), 
        .A1N(n3653), .Y(n3262) );
  AOI2BB2X1 U3131 ( .B0(n2942), .B1(n3267), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [4]), .Y(n2127) );
  INVX2 U3132 ( .A(n3167), .Y(n3168) );
  INVX1 U3133 ( .A(n2580), .Y(n2438) );
  INVX1 U3134 ( .A(n3516), .Y(n2434) );
  NAND2X1 U3135 ( .A(b_mean_out_mean[5]), .B(n3137), .Y(n2579) );
  INVX2 U3136 ( .A(n3136), .Y(n3135) );
  NOR3X1 U3137 ( .A(n2388), .B(n2386), .C(\denoise/sum9 [7]), .Y(n2384) );
  NAND2X1 U3138 ( .A(n3698), .B(n2512), .Y(n3433) );
  NAND2X1 U3139 ( .A(b_mean_out_mean[6]), .B(n3137), .Y(n2578) );
  NOR2X1 U3140 ( .A(n3698), .B(n2512), .Y(n3432) );
  INVX2 U3141 ( .A(n3162), .Y(n3299) );
  INVX1 U3142 ( .A(n2389), .Y(n2383) );
  INVX2 U3143 ( .A(n3189), .Y(n3190) );
  NAND2X1 U3144 ( .A(g_mean_out_mean[4]), .B(n3137), .Y(n2592) );
  NAND2X1 U3145 ( .A(g_mean_out_mean[6]), .B(n3137), .Y(n2591) );
  NAND2X1 U3146 ( .A(g_mean_out_mean[7]), .B(n3137), .Y(n2594) );
  INVX3 U3147 ( .A(n3341), .Y(n3340) );
  INVX2 U3148 ( .A(n3256), .Y(n3255) );
  NOR2X1 U3149 ( .A(n2550), .B(n3698), .Y(n3346) );
  INVX2 U3150 ( .A(n3164), .Y(n3165) );
  BUFX2 U3151 ( .A(n2757), .Y(n2981) );
  INVX2 U3152 ( .A(n3184), .Y(n3185) );
  INVX2 U3153 ( .A(n3199), .Y(n3200) );
  NAND2X2 U3154 ( .A(n3141), .B(n2660), .Y(n2637) );
  INVX2 U3155 ( .A(n2830), .Y(n2811) );
  INVX3 U3156 ( .A(n2571), .Y(n3017) );
  CLKINVX1 U3157 ( .A(n3067), .Y(n3559) );
  INVX2 U3158 ( .A(n3142), .Y(n3141) );
  NOR2X2 U3159 ( .A(n2502), .B(n3144), .Y(n2526) );
  INVX4 U3160 ( .A(n3585), .Y(n2560) );
  INVX2 U3161 ( .A(n2502), .Y(n2503) );
  AOI2BB2X1 U3162 ( .B0(n3142), .B1(n3813), .A0N(n3142), .A1N(valid_out_dem), 
        .Y(valid_in_den) );
  AOI2BB2X1 U3163 ( .B0(n3324), .B1(\denoise/second_col_r[2][3] ), .A0N(n3288), 
        .A1N(n3656), .Y(n3242) );
  AOI2BB2X1 U3164 ( .B0(n3142), .B1(n3866), .A0N(n3142), .A1N(pixel_out_dem[1]), .Y(pixel_in_den[1]) );
  NOR2X2 U3165 ( .A(n2502), .B(n2761), .Y(n2762) );
  NOR2X4 U3166 ( .A(n2502), .B(n3155), .Y(n2763) );
  BUFX2 U3167 ( .A(n2741), .Y(n2988) );
  NOR2X1 U3168 ( .A(g_mean_out_mean[5]), .B(n3138), .Y(n3516) );
  AOI2BB2X1 U3169 ( .B0(n3140), .B1(n3868), .A0N(n3140), .A1N(pixel_out_den[6]), .Y(pixel_in_mean[6]) );
  AOI2BB2X1 U3170 ( .B0(n3140), .B1(n3867), .A0N(n3140), .A1N(pixel_out_den[5]), .Y(pixel_in_mean[5]) );
  AOI2BB2X1 U3171 ( .B0(n3140), .B1(n3866), .A0N(n3140), .A1N(pixel_out_den[1]), .Y(pixel_in_mean[1]) );
  NOR2X1 U3172 ( .A(n3712), .B(n3138), .Y(n3019) );
  NOR2X1 U3173 ( .A(b_mean_out_mean[4]), .B(n3138), .Y(n2580) );
  INVX2 U3174 ( .A(n3209), .Y(n3210) );
  BUFX2 U3175 ( .A(n3123), .Y(n3136) );
  NOR2X4 U3176 ( .A(n3204), .B(n3207), .Y(n3205) );
  AOI2BB2X1 U3177 ( .B0(n3324), .B1(\denoise/second_col_g[2][6] ), .A0N(n3288), 
        .A1N(n3655), .Y(n3289) );
  INVX2 U3178 ( .A(n3040), .Y(n3122) );
  INVX3 U3179 ( .A(n3114), .Y(n2622) );
  AOI2BB2X1 U3180 ( .B0(n3142), .B1(n3868), .A0N(n3142), .A1N(pixel_out_dem[6]), .Y(pixel_in_den[6]) );
  AOI2BB2X1 U3181 ( .B0(n3324), .B1(\denoise/second_col_r[2][0] ), .A0N(n3288), 
        .A1N(n3625), .Y(n3176) );
  NOR2X4 U3182 ( .A(n3295), .B(n3188), .Y(n3180) );
  INVX2 U3183 ( .A(n3324), .Y(n3301) );
  AO21X2 U3184 ( .A0(\gain/B_r [14]), .A1(n3733), .B0(n3068), .Y(n3070) );
  NAND2X4 U3185 ( .A(n3821), .B(n3335), .Y(n3336) );
  NAND2X1 U3186 ( .A(n3700), .B(n2519), .Y(n3387) );
  AOI2BB1X2 U3187 ( .A0N(\denoise/pos8 [1]), .A1N(\denoise/pos7 [1]), .B0(
        \intadd_4/A[2] ), .Y(\intadd_4/B[1] ) );
  NOR2X1 U3188 ( .A(n3700), .B(n2519), .Y(n3386) );
  NOR2X2 U3189 ( .A(n2756), .B(n3609), .Y(n2748) );
  AO21X2 U3190 ( .A0(\gain/B_r [12]), .A1(n3640), .B0(n3061), .Y(n3063) );
  INVX2 U3191 ( .A(n3502), .Y(n3594) );
  NAND2X1 U3192 ( .A(n3323), .B(n3622), .Y(n3204) );
  INVX2 U3193 ( .A(n3587), .Y(n2328) );
  BUFX2 U3194 ( .A(n2558), .Y(n3605) );
  NAND2X1 U3195 ( .A(n3700), .B(n2511), .Y(n3430) );
  INVX4 U3196 ( .A(n3609), .Y(n2505) );
  NAND2X2 U3197 ( .A(n2572), .B(n2378), .Y(n2571) );
  NAND2BX1 U3198 ( .AN(\gain/finish_R_r ), .B(n3133), .Y(n2302) );
  NAND2X4 U3199 ( .A(n3335), .B(\denoise/color_2 [1]), .Y(n3341) );
  INVX2 U3200 ( .A(n2863), .Y(n3599) );
  NAND2X4 U3201 ( .A(n3621), .B(\denoise/valid_count_0 [1]), .Y(n2502) );
  NAND2X1 U3202 ( .A(\mean/value_r [0]), .B(\mean/sum_b [0]), .Y(n2511) );
  NAND3X2 U3203 ( .A(n3711), .B(\mean/valid_r ), .C(\mean/color_r [1]), .Y(
        n2517) );
  NAND2X1 U3204 ( .A(\mean/value_r [0]), .B(\mean/sum_g [0]), .Y(n2519) );
  BUFX4 U3205 ( .A(n3208), .Y(n2314) );
  NOR3X1 U3206 ( .A(\denoise/sum9 [10]), .B(\denoise/sum9 [9]), .C(
        \denoise/sum9 [8]), .Y(n2379) );
  NAND3X4 U3207 ( .A(\denoise/state_2 [0]), .B(\denoise/color_2 [0]), .C(n3821), .Y(n3338) );
  NAND2X4 U3208 ( .A(n3767), .B(\gain/state_G_r [1]), .Y(n2562) );
  NOR2BX1 U3209 ( .AN(\gain/counter_R_r [1]), .B(n3815), .Y(n2681) );
  NAND2BX1 U3210 ( .AN(\gain/B_r [0]), .B(\gain/b_mean_r [0]), .Y(
        \intadd_5/CI ) );
  AND2X2 U3211 ( .A(mode_reg[0]), .B(mode_reg[2]), .Y(n3604) );
  INVX2 U3212 ( .A(\wb/value_r [6]), .Y(n2320) );
  INVX2 U3213 ( .A(\wb/value_r [5]), .Y(n2321) );
  INVX2 U3214 ( .A(\wb/value_r [7]), .Y(n2319) );
  INVX2 U3215 ( .A(n2317), .Y(n2325) );
  INVX2 U3216 ( .A(\gain/N303 ), .Y(n3590) );
  INVX2 U3217 ( .A(n2315), .Y(n2323) );
  INVX2 U3218 ( .A(n2316), .Y(n2324) );
  INVX2 U3219 ( .A(\wb/value_r [4]), .Y(n2322) );
  AOI2BB2X1 U3220 ( .B0(n3611), .B1(\gain/r_mean_r [0]), .A0N(n3611), .A1N(
        n3715), .Y(n3478) );
  NOR3X1 U3221 ( .A(n3701), .B(n3630), .C(mode_reg[2]), .Y(n2427) );
  AOI2BB2X1 U3222 ( .B0(\gain/g_mean_r [10]), .B1(\gain/G_r [10]), .A0N(
        \gain/g_mean_r [10]), .A1N(\gain/G_r [10]), .Y(n3533) );
  AND2X2 U3223 ( .A(\gain/state_G_r [1]), .B(\gain/state_G_r [0]), .Y(n2586)
         );
  AOI2BB2X1 U3224 ( .B0(\gain/B_r [9]), .B1(\gain/b_mean_r [9]), .A0N(
        \gain/B_r [9]), .A1N(\gain/b_mean_r [9]), .Y(n3089) );
  BUFX16 U3225 ( .A(rst_n), .Y(n2621) );
  BUFX16 U3226 ( .A(rst_n), .Y(n2556) );
  CLKMX2X2 U3227 ( .A(n3110), .B(n3109), .S0(\gain/K_mean_w [1]), .Y(n3111) );
  CLKMX2X2 U3228 ( .A(n3107), .B(n3108), .S0(\gain/K_mean_w [1]), .Y(n3112) );
  OA21XL U3229 ( .A0(n3461), .A1(\mean/sum_b [18]), .B0(n3460), .Y(n1808) );
  OA21XL U3230 ( .A0(n3417), .A1(\mean/sum_g [16]), .B0(n3416), .Y(n1839) );
  NOR2X1 U3231 ( .A(n3700), .B(n2511), .Y(n3429) );
  NOR2X1 U3232 ( .A(n3703), .B(n2513), .Y(n3435) );
  NOR2X1 U3233 ( .A(n3703), .B(n2521), .Y(n3392) );
  NOR2XL U3234 ( .A(n3699), .B(n3138), .Y(n3104) );
  XNOR2X1 U3235 ( .A(\denoise/sum9 [9]), .B(\denoise/sum9 [8]), .Y(n2380) );
  INVXL U3236 ( .A(n2593), .Y(n3106) );
  INVXL U3237 ( .A(n2604), .Y(n3105) );
  ADDFX1 U3238 ( .A(n2497), .B(n2496), .CI(n2495), .CO(n2487), .S(n3107) );
  INVXL U3239 ( .A(n2584), .Y(n2496) );
  NOR2XL U3240 ( .A(n2393), .B(\denoise/sum9 [6]), .Y(n2394) );
  NOR2XL U3241 ( .A(n2407), .B(\denoise/sum9 [4]), .Y(n2408) );
  NOR2XL U3242 ( .A(n2421), .B(\denoise/sum9 [2]), .Y(n2422) );
  OAI21X1 U3243 ( .A0(n2501), .A1(n3108), .B0(n2360), .Y(\gain/K_mean_w [1])
         );
  OAI21X2 U3244 ( .A0(n2411), .A1(n2416), .B0(n2310), .Y(
        \denoise/n_pixel_out_reg [3]) );
  INVXL U3245 ( .A(n2603), .Y(n2441) );
  INVXL U3246 ( .A(n2581), .Y(n2443) );
  INVXL U3247 ( .A(n3517), .Y(n2442) );
  NAND2XL U3248 ( .A(\gain/b_mean_r [13]), .B(n3754), .Y(n3032) );
  ADDFX1 U3249 ( .A(n2481), .B(n2480), .CI(n2479), .CO(n2471), .S(n2486) );
  INVXL U3250 ( .A(n3483), .Y(n2444) );
  INVXL U3251 ( .A(n3519), .Y(n2445) );
  ADDFX1 U3252 ( .A(n2489), .B(n2488), .CI(n2487), .CO(n2479), .S(n2494) );
  BUFX2 U3253 ( .A(n3171), .Y(n3304) );
  INVXL U3254 ( .A(n3304), .Y(n3172) );
  OAI2BB2X1 U3255 ( .B0(n3061), .B1(n3064), .A0N(n3640), .A1N(\gain/B_r [12]), 
        .Y(n3035) );
  OAI22XL U3256 ( .A0(n3030), .A1(n3029), .B0(\gain/B_r [9]), .B1(n3734), .Y(
        n3052) );
  NAND2XL U3257 ( .A(\gain/b_mean_r [7]), .B(n3723), .Y(n3028) );
  NOR2XL U3258 ( .A(b_mean_out_mean[2]), .B(n3138), .Y(n2581) );
  NOR2XL U3259 ( .A(b_mean_out_mean[1]), .B(n3138), .Y(n2584) );
  NOR2XL U3260 ( .A(\gain/R_r [12]), .B(n3641), .Y(n2613) );
  NAND2XL U3261 ( .A(\gain/R_r [12]), .B(n3641), .Y(n3549) );
  NOR2XL U3262 ( .A(g_mean_out_mean[1]), .B(n3138), .Y(n3519) );
  NOR2XL U3263 ( .A(g_mean_out_mean[2]), .B(n3138), .Y(n3517) );
  NAND2XL U3264 ( .A(g_mean_out_mean[0]), .B(n3137), .Y(n2593) );
  NOR2XL U3265 ( .A(r_mean_out_mean[1]), .B(n3138), .Y(n3483) );
  NOR2XL U3266 ( .A(r_mean_out_mean[2]), .B(n3138), .Y(n2603) );
  NAND2XL U3267 ( .A(r_mean_out_mean[3]), .B(n3137), .Y(n2610) );
  INVXL U3268 ( .A(n2598), .Y(n2606) );
  NAND2XL U3269 ( .A(r_mean_out_mean[0]), .B(n3137), .Y(n2604) );
  INVX3 U3270 ( .A(n3138), .Y(n3137) );
  BUFX4 U3271 ( .A(n2427), .Y(n3138) );
  NOR2XL U3272 ( .A(n2386), .B(\denoise/sum9 [7]), .Y(n2387) );
  NOR2XL U3273 ( .A(n2400), .B(\denoise/sum9 [5]), .Y(n2401) );
  NOR2XL U3274 ( .A(n2413), .B(\denoise/sum9 [3]), .Y(n2414) );
  NOR2XL U3275 ( .A(n3095), .B(\denoise/sum9 [1]), .Y(n3096) );
  NAND2XL U3276 ( .A(n3121), .B(n3047), .Y(\wb/value_tmp_2 [3]) );
  NAND2XL U3277 ( .A(n3121), .B(n3043), .Y(\wb/value_tmp_2 [2]) );
  NAND2XL U3278 ( .A(n3121), .B(n3045), .Y(\wb/value_tmp_2 [1]) );
  NAND2XL U3279 ( .A(n3121), .B(n3044), .Y(\wb/value_tmp_2 [0]) );
  OAI211XL U3280 ( .A0(n2571), .A1(n3753), .B0(n3082), .C0(n3081), .Y(n1680)
         );
  OAI211XL U3281 ( .A0(n2571), .A1(n3733), .B0(n3073), .C0(n3072), .Y(n1679)
         );
  OAI211XL U3282 ( .A0(n3036), .A1(n3035), .B0(n3033), .C0(n3034), .Y(n3037)
         );
  OAI211XL U3283 ( .A0(n2571), .A1(n3640), .B0(n3066), .C0(n3065), .Y(n1677)
         );
  OAI211XL U3284 ( .A0(n3064), .A1(n3063), .B0(n3033), .C0(n3062), .Y(n3065)
         );
  OAI211XL U3285 ( .A0(n3734), .A1(n2571), .B0(n3092), .C0(n3091), .Y(n1674)
         );
  OAI211XL U3286 ( .A0(n3090), .A1(n3089), .B0(n3033), .C0(n3088), .Y(n3091)
         );
  AOI222XL U3287 ( .A0(n3060), .A1(\gain/B_r [6]), .B0(n3017), .B1(
        \gain/b_mean_r [6]), .C0(\intadd_5/SUM[5] ), .C1(n3033), .Y(n3077) );
  AOI222XL U3288 ( .A0(n3060), .A1(\gain/B_r [5]), .B0(n3017), .B1(
        \gain/b_mean_r [5]), .C0(\intadd_5/SUM[4] ), .C1(n3033), .Y(n3078) );
  AOI222XL U3289 ( .A0(n3060), .A1(\gain/B_r [4]), .B0(n3017), .B1(
        \gain/b_mean_r [4]), .C0(\intadd_5/SUM[3] ), .C1(n3033), .Y(n3074) );
  AOI222XL U3290 ( .A0(n3060), .A1(\gain/B_r [3]), .B0(n3017), .B1(
        \gain/b_mean_r [3]), .C0(\intadd_5/SUM[2] ), .C1(n3033), .Y(n3075) );
  AOI222XL U3291 ( .A0(n3060), .A1(\gain/B_r [2]), .B0(n3017), .B1(
        \gain/b_mean_r [2]), .C0(\intadd_5/SUM[1] ), .C1(n3033), .Y(n3076) );
  AOI222XL U3292 ( .A0(n3060), .A1(\gain/B_r [1]), .B0(n3017), .B1(
        \gain/b_mean_r [1]), .C0(\intadd_5/SUM[0] ), .C1(n3033), .Y(n3079) );
  OAI31XL U3293 ( .A0(n3119), .A1(n3544), .A2(n3543), .B0(n3542), .Y(n1741) );
  INVXL U3294 ( .A(n3086), .Y(n1737) );
  AOI222XL U3295 ( .A0(\gain/K_mean_r [11]), .A1(n3541), .B0(n3083), .B1(
        \intadd_0/SUM[10] ), .C0(n2617), .C1(\gain/R_r [11]), .Y(n3086) );
  INVXL U3296 ( .A(n3084), .Y(n1736) );
  INVXL U3297 ( .A(n3085), .Y(n1735) );
  INVXL U3298 ( .A(n3027), .Y(n1751) );
  INVXL U3299 ( .A(n3087), .Y(n1734) );
  AOI222XL U3300 ( .A0(\gain/K_mean_r [8]), .A1(n3541), .B0(n3083), .B1(
        \intadd_0/SUM[7] ), .C0(n2617), .C1(\gain/R_r [8]), .Y(n3087) );
  INVXL U3301 ( .A(n3026), .Y(n1750) );
  NOR2XL U3302 ( .A(n3108), .B(n3110), .Y(n3109) );
  OAI21X2 U3303 ( .A0(n2405), .A1(n2404), .B0(n2309), .Y(
        \denoise/n_pixel_out_reg [4]) );
  OAI21X2 U3304 ( .A0(n2419), .A1(n2418), .B0(n2311), .Y(
        \denoise/n_pixel_out_reg [2]) );
  OAI31XL U3305 ( .A0(n3100), .A1(\denoise/sum9 [0]), .A2(n3099), .B0(n3098), 
        .Y(n3101) );
  CLKINVX1 U3306 ( .A(n2326), .Y(n2327) );
  AOI222X2 U3307 ( .A0(n2510), .A1(\wb/K_G_r [0]), .B0(n2509), .B1(
        \wb/K_B_r [0]), .C0(n2508), .C1(\wb/K_R_r [0]), .Y(n3117) );
  NOR2BX1 U3308 ( .AN(n2680), .B(n2679), .Y(n3471) );
  AOI222X2 U3309 ( .A0(n2510), .A1(\wb/K_G_r [2]), .B0(n2509), .B1(
        \wb/K_B_r [2]), .C0(n2508), .C1(\wb/K_R_r [2]), .Y(n3115) );
  AOI222X2 U3310 ( .A0(n2510), .A1(\wb/K_G_r [4]), .B0(n2509), .B1(
        \wb/K_B_r [4]), .C0(n2508), .C1(\wb/K_R_r [4]), .Y(n2611) );
  AOI222X2 U3311 ( .A0(n2510), .A1(\wb/K_G_r [7]), .B0(n2509), .B1(
        \wb/K_B_r [7]), .C0(n2508), .C1(\wb/K_R_r [7]), .Y(n2596) );
  AOI222X2 U3312 ( .A0(n2510), .A1(\wb/K_G_r [6]), .B0(n2509), .B1(
        \wb/K_B_r [6]), .C0(n2508), .C1(\wb/K_R_r [6]), .Y(n2555) );
  AOI222X2 U3313 ( .A0(n2510), .A1(\wb/K_G_r [1]), .B0(n2509), .B1(
        \wb/K_B_r [1]), .C0(n2508), .C1(\wb/K_R_r [1]), .Y(n3116) );
  AOI222X2 U3314 ( .A0(n2510), .A1(\wb/K_G_r [3]), .B0(n2509), .B1(
        \wb/K_B_r [3]), .C0(n2508), .C1(\wb/K_R_r [3]), .Y(n2595) );
  NAND3XL U3315 ( .A(\gain/state_B_r [0]), .B(n3735), .C(n2669), .Y(n3560) );
  NAND2X1 U3316 ( .A(\denoise/valid_count_0 [1]), .B(
        \denoise/valid_count_0 [0]), .Y(n2887) );
  AOI2BB2X1 U3317 ( .B0(\denoise/second_col_g[4][1] ), .B1(n2979), .A0N(n3840), 
        .A1N(n2883), .Y(n2901) );
  AOI22XL U3318 ( .A0(\gain/K_mean_r [9]), .A1(n3559), .B0(\gain/B_r [9]), 
        .B1(n3060), .Y(n3092) );
  AOI22XL U3319 ( .A0(\gain/B_r [15]), .A1(n3060), .B0(n3559), .B1(
        \gain/K_mean_r [15]), .Y(n3082) );
  NAND2XL U3320 ( .A(\gain/g_mean_r [10]), .B(n3736), .Y(n3530) );
  AOI2BB2X1 U3321 ( .B0(n2942), .B1(n2318), .A0N(n2942), .A1N(
        \denoise/pixel_in_reg [5]), .Y(n2090) );
  AO22X1 U3322 ( .A0(n3319), .A1(\denoise/pos9 [1]), .B0(n3185), .B1(
        \denoise/second_col_g[3][1] ), .Y(n2222) );
  AOI2BB2X1 U3323 ( .B0(n3306), .B1(n3310), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][7] ), .Y(n2008) );
  AOI2BB2X1 U3324 ( .B0(n3306), .B1(n3287), .A0N(n3306), .A1N(
        \denoise/first_col_r[4][6] ), .Y(n2045) );
  NOR2X2 U3325 ( .A(n3634), .B(n2377), .Y(n3150) );
  OAI211XL U3326 ( .A0(n3581), .A1(n3766), .B0(n3059), .C0(n3058), .Y(n1676)
         );
  OAI211XL U3327 ( .A0(n3581), .A1(n3747), .B0(n3055), .C0(n3054), .Y(n1675)
         );
  OAI211XL U3328 ( .A0(n3581), .A1(n3748), .B0(n3051), .C0(n3050), .Y(n1673)
         );
  OAI211XL U3329 ( .A0(n3581), .A1(n3754), .B0(n3038), .C0(n3037), .Y(n1678)
         );
  NAND2X2 U3330 ( .A(n3535), .B(n2378), .Y(n3520) );
  AOI222XL U3331 ( .A0(\gain/K_mean_r [8]), .A1(n3535), .B0(n3023), .B1(
        \gain/G_r [8]), .C0(n3025), .C1(\intadd_2/SUM[7] ), .Y(n3026) );
  AOI222XL U3332 ( .A0(\gain/K_mean_r [9]), .A1(n3535), .B0(n3023), .B1(
        \gain/G_r [9]), .C0(n3025), .C1(\intadd_2/SUM[8] ), .Y(n3027) );
  NOR2X2 U3333 ( .A(\gain/state_G_r [1]), .B(\gain/state_G_r [0]), .Y(n3535)
         );
  NAND2X2 U3334 ( .A(n3541), .B(n2378), .Y(n3484) );
  AOI222XL U3335 ( .A0(\gain/K_mean_r [10]), .A1(n3541), .B0(n3083), .B1(
        \intadd_0/SUM[9] ), .C0(n2617), .C1(\gain/R_r [10]), .Y(n3084) );
  AOI222XL U3336 ( .A0(\gain/K_mean_r [9]), .A1(n3541), .B0(n3083), .B1(
        \intadd_0/SUM[8] ), .C0(n2617), .C1(\gain/R_r [9]), .Y(n3085) );
  NOR2X2 U3337 ( .A(\gain/state_R_r [1]), .B(\gain/state_R_r [0]), .Y(n3541)
         );
  AOI222X2 U3338 ( .A0(n2510), .A1(\wb/K_G_r [5]), .B0(n2509), .B1(
        \wb/K_B_r [5]), .C0(n2508), .C1(\wb/K_R_r [5]), .Y(n2570) );
  INVX12 U3339 ( .A(n2330), .Y(color_out[0]) );
  INVX12 U3340 ( .A(n2332), .Y(color_out[1]) );
  INVX12 U3341 ( .A(n2334), .Y(last_col_out) );
  INVX12 U3342 ( .A(n2336), .Y(finish_operation) );
  INVX12 U3343 ( .A(n2338), .Y(pixel_out[0]) );
  INVX12 U3344 ( .A(n2340), .Y(pixel_out[1]) );
  INVX12 U3345 ( .A(n2342), .Y(pixel_out[2]) );
  INVX12 U3346 ( .A(n2344), .Y(pixel_out[3]) );
  INVX12 U3347 ( .A(n2346), .Y(pixel_out[4]) );
  INVX12 U3348 ( .A(n2348), .Y(pixel_out[5]) );
  INVX12 U3349 ( .A(n2350), .Y(pixel_out[6]) );
  INVX12 U3350 ( .A(n2352), .Y(pixel_out[7]) );
  INVX12 U3351 ( .A(n2354), .Y(valid_out) );
  INVX12 U3352 ( .A(n2356), .Y(last_pic_out) );
  XOR2X1 U3353 ( .A(\denoise/sum9 [10]), .B(n2381), .Y(n2363) );
  XOR2X1 U3354 ( .A(n2388), .B(n2387), .Y(n2365) );
  XOR2X1 U3355 ( .A(n2395), .B(n2394), .Y(n2366) );
  XOR2X1 U3356 ( .A(n2402), .B(n2401), .Y(n2368) );
  XOR2X1 U3357 ( .A(n2409), .B(n2408), .Y(n2369) );
  XOR2X1 U3358 ( .A(n2415), .B(n2414), .Y(n2370) );
  XOR2X1 U3359 ( .A(n2423), .B(n2422), .Y(n2371) );
  XOR2X1 U3360 ( .A(n3097), .B(n3096), .Y(n2372) );
  INVXL U3361 ( .A(n2761), .Y(n2759) );
  NAND3XL U3362 ( .A(n3604), .B(color_out_gamma[1]), .C(last_pic_out_gamma), 
        .Y(n2662) );
  AOI221XL U3363 ( .A0(n2823), .A1(n3636), .B0(n3620), .B1(n3613), .C0(n2863), 
        .Y(n2576) );
  AOI22XL U3364 ( .A0(\denoise/first_col_r[1][7] ), .A1(n2984), .B0(
        \denoise/first_col_g[0][7] ), .B1(n2985), .Y(n2948) );
  AOI22XL U3365 ( .A0(\denoise/first_col_g[0][6] ), .A1(n2985), .B0(
        \denoise/first_col_b[0][6] ), .B1(n2762), .Y(n2930) );
  AOI211XL U3366 ( .A0(\denoise/first_col_g[0][4] ), .A1(n2985), .B0(n2956), 
        .C0(n2955), .Y(n2957) );
  AOI22XL U3367 ( .A0(\denoise/first_col_g[0][2] ), .A1(n2985), .B0(
        \denoise/first_col_b[1][2] ), .B1(n2763), .Y(n2907) );
  NOR2XL U3368 ( .A(n3173), .B(n3288), .Y(n3164) );
  INVXL U3369 ( .A(n2825), .Y(n2868) );
  NOR3XL U3370 ( .A(\gain/N478 ), .B(n3491), .C(n3527), .Y(n3498) );
  BUFX2 U3371 ( .A(n2750), .Y(n2982) );
  NOR2XL U3372 ( .A(n3791), .B(n2814), .Y(n2785) );
  OAI2BB2XL U3373 ( .B0(n3827), .B1(n2889), .A0N(\denoise/second_col_b[4][5] ), 
        .A1N(n2987), .Y(n2834) );
  OAI211XL U3374 ( .A0(n2883), .A1(n3788), .B0(n2753), .C0(n2752), .Y(n2754)
         );
  OAI2BB2XL U3375 ( .B0(n2314), .B1(n3667), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][4] ), .Y(n3260) );
  OAI2BB2XL U3376 ( .B0(n2314), .B1(n3774), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][3] ), .Y(n3253) );
  OAI2BB2XL U3377 ( .B0(n2314), .B1(n3617), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][2] ), .Y(n3240) );
  NOR2XL U3378 ( .A(n3173), .B(n3204), .Y(n3162) );
  OAI2BB2XL U3379 ( .B0(n2314), .B1(n3792), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][0] ), .Y(n3195) );
  NAND2XL U3380 ( .A(n3136), .B(pixel_out_wb[0]), .Y(n3131) );
  AOI22XL U3381 ( .A0(n3604), .A1(pixel_out_gamma[7]), .B0(n3605), .B1(
        pixel_out_dem[7]), .Y(n2731) );
  AOI211XL U3382 ( .A0(g_mean_out_mean[0]), .A1(n2729), .B0(n2719), .C0(n2718), 
        .Y(n2720) );
  BUFX2 U3383 ( .A(\gain/N648 ), .Y(n2823) );
  NAND2XL U3384 ( .A(n2622), .B(k_g_out_gain[11]), .Y(n2629) );
  OAI211XL U3385 ( .A0(n3071), .A1(n3070), .B0(n3033), .C0(n3069), .Y(n3072)
         );
  AOI22XL U3386 ( .A0(n2868), .A1(n2867), .B0(n2866), .B1(n2865), .Y(n2870) );
  NOR2XL U3387 ( .A(\gain/b_mean_r [1]), .B(n2823), .Y(n3566) );
  OAI22XL U3388 ( .A0(\gain/R_r [14]), .A1(n3645), .B0(n2615), .B1(n2614), .Y(
        n3543) );
  NOR2XL U3389 ( .A(\gain/counter_G_r [0]), .B(n3103), .Y(n2569) );
  AOI222XL U3390 ( .A0(n3594), .A1(\gain/g_mean_r [0]), .B0(n3508), .B1(
        \gain/g_mean_r [2]), .C0(n3721), .C1(\gain/g_mean_r [1]), .Y(n3510) );
  NAND2XL U3391 ( .A(n3488), .B(n3485), .Y(n3486) );
  NAND2XL U3392 ( .A(n2504), .B(\denoise/sum6_g [9]), .Y(n2531) );
  NAND2XL U3393 ( .A(n2942), .B(\denoise/sum6 [5]), .Y(n2543) );
  NOR4XL U3394 ( .A(n2792), .B(n2791), .C(n2790), .D(n2789), .Y(n2793) );
  NOR3XL U3395 ( .A(n2922), .B(n2921), .C(n2920), .Y(n2923) );
  NOR4XL U3396 ( .A(n2878), .B(n2877), .C(n2876), .D(n2875), .Y(n2879) );
  AOI211XL U3397 ( .A0(\denoise/second_col_r[0][0] ), .A1(n2786), .B0(n2813), 
        .C0(n2812), .Y(n2820) );
  OAI211XL U3398 ( .A0(n2622), .A1(n3902), .B0(n2701), .C0(n2700), .Y(n2292)
         );
  INVXL U3399 ( .A(color_in[1]), .Y(n1648) );
  NOR2XL U3400 ( .A(n3114), .B(n3684), .Y(k_r_in_wb[7]) );
  INVXL U3401 ( .A(n2635), .Y(k_b_in_wb[7]) );
  OAI211XL U3402 ( .A0(n2327), .A1(n3599), .B0(n2735), .C0(n2734), .Y(n1706)
         );
  OAI31XL U3403 ( .A0(n3570), .A1(n3599), .A2(n3573), .B0(n3569), .Y(n1716) );
  OAI21X1 U3404 ( .A0(n2477), .A1(n2482), .B0(n2359), .Y(\gain/K_mean_w [4])
         );
  NAND2XL U3405 ( .A(n2568), .B(n2562), .Y(n2299) );
  OAI211XL U3406 ( .A0(\gain/counter_R_r [2]), .A1(n2689), .B0(n3481), .C0(
        n2683), .Y(n1780) );
  OAI31XL U3407 ( .A0(n3449), .A1(\mean/sum_b [7]), .A2(n3448), .B0(n3447), 
        .Y(n1819) );
  OAI31XL U3408 ( .A0(n3407), .A1(\mean/sum_g [7]), .A2(n3406), .B0(n3405), 
        .Y(n1848) );
  OAI31XL U3409 ( .A0(n3364), .A1(\mean/sum_r [7]), .A2(n3363), .B0(n3362), 
        .Y(n1876) );
  OAI32XL U3410 ( .A0(n3678), .A1(\mean/last_state_r [1]), .A2(
        last_pic_in_mean), .B0(n3134), .B1(\mean/last_state_r [0]), .Y(
        \mean/last_state_w [0]) );
  NAND2XL U3411 ( .A(n2646), .B(n2645), .Y(n1893) );
  OAI2BB2XL U3412 ( .B0(n3340), .B1(n3673), .A0N(n3340), .A1N(
        \denoise/new_sum6 [5]), .Y(n1919) );
  OAI2BB2XL U3413 ( .B0(n3341), .B1(n3669), .A0N(n3341), .A1N(
        \denoise/sum3_b [1]), .Y(n1950) );
  NAND2XL U3414 ( .A(\denoise/n_color_out_reg [0]), .B(
        \denoise/n_color_out_reg [1]), .Y(\denoise/n_valid_out_reg ) );
  OAI2BB2XL U3415 ( .B0(n3206), .B1(n2329), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][7] ), .Y(n1987) );
  NAND4XL U3416 ( .A(n2796), .B(n2795), .C(n2794), .D(n2793), .Y(n1979) );
  OAI2BB2XL U3417 ( .B0(n3187), .B1(n3293), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][6] ), .Y(n2036) );
  NAND4XL U3418 ( .A(n2843), .B(n2842), .C(n2841), .D(n2840), .Y(n1980) );
  OAI2BB2XL U3419 ( .B0(n3206), .B1(n2318), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][5] ), .Y(n2061) );
  OAI2BB2XL U3420 ( .B0(n3187), .B1(n2318), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][5] ), .Y(n2073) );
  OAI2BB2XL U3421 ( .B0(n3165), .B1(n2318), .A0N(n3165), .A1N(
        \denoise/second_col_r[3][5] ), .Y(n2087) );
  OAI2BB2XL U3422 ( .B0(n3206), .B1(n3267), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][4] ), .Y(n2098) );
  NAND4XL U3423 ( .A(n2783), .B(n2782), .C(n2781), .D(n2780), .Y(n1982) );
  OAI2BB2XL U3424 ( .B0(n3187), .B1(n3250), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][3] ), .Y(n2147) );
  OAI2BB2XL U3425 ( .B0(n3257), .B1(n3250), .A0N(n3257), .A1N(
        \denoise/second_col_r[1][3] ), .Y(n2159) );
  OAI2BB2XL U3426 ( .B0(n3187), .B1(n3237), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][2] ), .Y(n2184) );
  NAND3XL U3427 ( .A(n2901), .B(n2900), .C(n2899), .Y(n1984) );
  OAI2BB2XL U3428 ( .B0(n3206), .B1(n3224), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][1] ), .Y(n2209) );
  OAI2BB2XL U3429 ( .B0(n3187), .B1(n3224), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][1] ), .Y(n2221) );
  NAND4XL U3430 ( .A(n2822), .B(n2821), .C(n2820), .D(n2819), .Y(n1985) );
  OAI2BB2XL U3431 ( .B0(n3187), .B1(n3211), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][0] ), .Y(n2258) );
  OAI2BB2XL U3432 ( .B0(n3175), .B1(n3211), .A0N(n3175), .A1N(
        \denoise/second_col_r[0][0] ), .Y(n2269) );
  OAI2BB2XL U3433 ( .B0(n3634), .B1(n3151), .A0N(n3634), .A1N(n3151), .Y(n2281) );
  OAI21X2 U3434 ( .A0(n2398), .A1(n2397), .B0(n2367), .Y(
        \denoise/n_pixel_out_reg [5]) );
  NOR2XL U3435 ( .A(\denoise/sum9 [9]), .B(\denoise/sum9 [8]), .Y(n2381) );
  OAI21X2 U3436 ( .A0(n2384), .A1(n2383), .B0(n2364), .Y(
        \denoise/n_pixel_out_reg [7]) );
  XNOR2X1 U3437 ( .A(n2386), .B(\denoise/sum9 [7]), .Y(n2385) );
  XNOR2X1 U3438 ( .A(n2393), .B(\denoise/sum9 [6]), .Y(n2392) );
  XNOR2X1 U3439 ( .A(n2400), .B(\denoise/sum9 [5]), .Y(n2399) );
  XNOR2X1 U3440 ( .A(n2407), .B(\denoise/sum9 [4]), .Y(n2406) );
  XNOR2X1 U3441 ( .A(n2413), .B(\denoise/sum9 [3]), .Y(n2412) );
  XNOR2X1 U3442 ( .A(n2421), .B(\denoise/sum9 [2]), .Y(n2420) );
  ADDFX1 U3443 ( .A(n2438), .B(n2437), .CI(n2436), .CO(n2464), .S(n2473) );
  ADDFX1 U3444 ( .A(n3021), .B(n2440), .CI(n2439), .CO(n2472), .S(n2481) );
  ADDFX1 U3445 ( .A(n2443), .B(n2442), .CI(n2441), .CO(n2480), .S(n2489) );
  ADDHXL U3446 ( .A(n2445), .B(n2444), .CO(n2488), .S(n2495) );
  CLKINVX1 U3447 ( .A(n2454), .Y(n2458) );
  ADDHX1 U3448 ( .A(n2450), .B(n2449), .CO(n2451), .S(n2460) );
  CLKINVX1 U3449 ( .A(n2462), .Y(n2466) );
  NOR2X1 U3450 ( .A(n2458), .B(n2460), .Y(n2459) );
  CLKINVX1 U3451 ( .A(n2470), .Y(n2474) );
  NOR2X1 U3452 ( .A(n2466), .B(n2468), .Y(n2467) );
  NOR2X1 U3453 ( .A(n2474), .B(n2476), .Y(n2475) );
  NOR2X1 U3454 ( .A(n2490), .B(n2492), .Y(n2491) );
  NOR2X1 U3455 ( .A(n2498), .B(n2500), .Y(n2499) );
  NOR2X2 U3456 ( .A(n3719), .B(\wb/color_r [1]), .Y(n2510) );
  NOR2X2 U3457 ( .A(n3720), .B(\wb/color_r [0]), .Y(n2509) );
  NOR2X2 U3458 ( .A(\wb/color_r [0]), .B(\wb/color_r [1]), .Y(n2508) );
  NOR2XL U3459 ( .A(n2321), .B(n3117), .Y(\DP_OP_654J1_124_416/n143 ) );
  NOR2XL U3460 ( .A(n2320), .B(n3115), .Y(\DP_OP_654J1_124_416/n126 ) );
  NOR2XL U3461 ( .A(n2322), .B(n2611), .Y(\DP_OP_654J1_124_416/n112 ) );
  NOR2XL U3462 ( .A(n2320), .B(n2596), .Y(\DP_OP_654J1_124_416/n86 ) );
  AOI22XL U3463 ( .A0(n2503), .A1(\denoise/sum3_b [1]), .B0(n2504), .B1(
        \denoise/sum3_g [1]), .Y(n2507) );
  NAND2X1 U3464 ( .A(n3643), .B(n3621), .Y(n3609) );
  NAND2XL U3465 ( .A(n2505), .B(\denoise/sum3_r [1]), .Y(n2506) );
  OAI211XL U3466 ( .A0(n2887), .A1(n3759), .B0(n2507), .C0(n2506), .Y(n1949)
         );
  NOR2XL U3467 ( .A(n3644), .B(n3749), .Y(\intadd_4/A[2] ) );
  NOR2XL U3468 ( .A(n2322), .B(n2596), .Y(\DP_OP_654J1_124_416/n88 ) );
  NOR2XL U3469 ( .A(n2319), .B(n2611), .Y(\DP_OP_654J1_124_416/n109 ) );
  NOR2XL U3470 ( .A(n2320), .B(n2570), .Y(\DP_OP_654J1_124_416/n102 ) );
  NOR2XL U3471 ( .A(n2321), .B(n2570), .Y(\DP_OP_654J1_124_416/n103 ) );
  NOR2XL U3472 ( .A(n2323), .B(n2555), .Y(\DP_OP_654J1_124_416/n97 ) );
  NOR2XL U3473 ( .A(n2319), .B(n3115), .Y(\DP_OP_654J1_124_416/n125 ) );
  NOR2XL U3474 ( .A(n2324), .B(n2596), .Y(\DP_OP_654J1_124_416/n90 ) );
  NOR2XL U3475 ( .A(n2321), .B(n2611), .Y(\DP_OP_654J1_124_416/n111 ) );
  NOR2XL U3476 ( .A(n2324), .B(n2555), .Y(\DP_OP_654J1_124_416/n98 ) );
  NOR2XL U3477 ( .A(n2319), .B(n3116), .Y(\DP_OP_654J1_124_416/n133 ) );
  NOR2XL U3478 ( .A(n2321), .B(n2595), .Y(\DP_OP_654J1_124_416/n119 ) );
  NOR2XL U3479 ( .A(n2321), .B(n3116), .Y(\DP_OP_654J1_124_416/n135 ) );
  NOR2XL U3480 ( .A(n2321), .B(n3115), .Y(\DP_OP_654J1_124_416/n127 ) );
  NOR2XL U3481 ( .A(n2323), .B(n2611), .Y(\DP_OP_654J1_124_416/n113 ) );
  NOR2XL U3482 ( .A(n2319), .B(n3117), .Y(\DP_OP_654J1_124_416/n141 ) );
  NOR2XL U3483 ( .A(n2324), .B(n2570), .Y(\DP_OP_654J1_124_416/n106 ) );
  NOR2XL U3484 ( .A(n3722), .B(n2596), .Y(\DP_OP_654J1_124_416/n92 ) );
  NOR2XL U3485 ( .A(n3722), .B(n2555), .Y(\DP_OP_654J1_124_416/n100 ) );
  NOR2XL U3486 ( .A(n3722), .B(n2570), .Y(\DP_OP_654J1_124_416/n108 ) );
  NOR2XL U3487 ( .A(n2323), .B(n3115), .Y(\DP_OP_654J1_124_416/n129 ) );
  NOR2XL U3488 ( .A(n2324), .B(n2595), .Y(\DP_OP_654J1_124_416/n122 ) );
  NOR2XL U3489 ( .A(n3722), .B(n2611), .Y(\DP_OP_654J1_124_416/n116 ) );
  NOR2XL U3490 ( .A(n2325), .B(n2595), .Y(\DP_OP_654J1_124_416/n123 ) );
  NOR2XL U3491 ( .A(n3880), .B(n3686), .Y(n3920) );
  NOR2XL U3492 ( .A(n3722), .B(n2595), .Y(\DP_OP_654J1_124_416/n124 ) );
  NOR2XL U3493 ( .A(n2319), .B(n2596), .Y(\DP_OP_654J1_124_416/n85 ) );
  NOR2XL U3494 ( .A(n2319), .B(n2555), .Y(\DP_OP_654J1_124_416/n93 ) );
  NOR2X1 U3495 ( .A(n3708), .B(n2518), .Y(n3449) );
  NOR2X1 U3496 ( .A(n3464), .B(n3838), .Y(n3467) );
  NOR2X1 U3497 ( .A(n3708), .B(n2525), .Y(n3407) );
  NAND3BX2 U3498 ( .AN(\mean/color_r [1]), .B(\mean/valid_r ), .C(
        \mean/color_r [0]), .Y(n3401) );
  NAND2X1 U3499 ( .A(\denoise/n_counter_1 [0]), .B(\denoise/n_counter_1 [2]), 
        .Y(n3144) );
  NOR3XL U3500 ( .A(\denoise/n_state_1 [1]), .B(\denoise/n_state_1 [0]), .C(
        n2528), .Y(n2278) );
  AOI22XL U3501 ( .A0(n2505), .A1(\denoise/sum6_r [2]), .B0(n2942), .B1(
        \denoise/sum6 [2]), .Y(n2530) );
  NAND2XL U3502 ( .A(n2504), .B(\denoise/sum6_g [2]), .Y(n2529) );
  OAI211XL U3503 ( .A0(n3670), .A1(n2502), .B0(n2530), .C0(n2529), .Y(n1940)
         );
  AOI22XL U3504 ( .A0(n2505), .A1(\denoise/sum6_r [9]), .B0(n2942), .B1(
        \denoise/sum6 [9]), .Y(n2532) );
  OAI211XL U3505 ( .A0(n3677), .A1(n2502), .B0(n2532), .C0(n2531), .Y(n1884)
         );
  AOI22XL U3506 ( .A0(n2504), .A1(\denoise/sum6_g [4]), .B0(n2942), .B1(
        \denoise/sum6 [4]), .Y(n2534) );
  NAND2XL U3507 ( .A(n2505), .B(\denoise/sum6_r [4]), .Y(n2533) );
  OAI211XL U3508 ( .A0(n3672), .A1(n2502), .B0(n2534), .C0(n2533), .Y(n1924)
         );
  AOI22XL U3509 ( .A0(n2504), .A1(\denoise/sum6_g [6]), .B0(n2942), .B1(
        \denoise/sum6 [6]), .Y(n2536) );
  NAND2XL U3510 ( .A(n2505), .B(\denoise/sum6_r [6]), .Y(n2535) );
  OAI211XL U3511 ( .A0(n3674), .A1(n2502), .B0(n2536), .C0(n2535), .Y(n1908)
         );
  AOI22XL U3512 ( .A0(n2505), .A1(\denoise/sum6_r [8]), .B0(n2942), .B1(
        \denoise/sum6 [8]), .Y(n2538) );
  NAND2XL U3513 ( .A(n2504), .B(\denoise/sum6_g [8]), .Y(n2537) );
  OAI211XL U3514 ( .A0(n3676), .A1(n2502), .B0(n2538), .C0(n2537), .Y(n1892)
         );
  AOI22XL U3515 ( .A0(n2505), .A1(\denoise/sum6_r [7]), .B0(n2504), .B1(
        \denoise/sum6_g [7]), .Y(n2540) );
  NAND2XL U3516 ( .A(n2942), .B(\denoise/sum6 [7]), .Y(n2539) );
  OAI211XL U3517 ( .A0(n3675), .A1(n2502), .B0(n2540), .C0(n2539), .Y(n1900)
         );
  AOI22XL U3518 ( .A0(n2505), .A1(\denoise/sum6_r [3]), .B0(n2504), .B1(
        \denoise/sum6_g [3]), .Y(n2542) );
  NAND2XL U3519 ( .A(n2942), .B(\denoise/sum6 [3]), .Y(n2541) );
  OAI211XL U3520 ( .A0(n3671), .A1(n2502), .B0(n2542), .C0(n2541), .Y(n1932)
         );
  AOI22XL U3521 ( .A0(n2505), .A1(\denoise/sum6_r [5]), .B0(n2504), .B1(
        \denoise/sum6_g [5]), .Y(n2544) );
  OAI211XL U3522 ( .A0(n3673), .A1(n2502), .B0(n2544), .C0(n2543), .Y(n1916)
         );
  AOI22XL U3523 ( .A0(n2505), .A1(\denoise/sum6_r [1]), .B0(n2942), .B1(
        \denoise/sum6 [1]), .Y(n2546) );
  NAND2XL U3524 ( .A(n2504), .B(\denoise/sum6_g [1]), .Y(n2545) );
  OAI211XL U3525 ( .A0(n3669), .A1(n2502), .B0(n2546), .C0(n2545), .Y(n1948)
         );
  AOI22XL U3526 ( .A0(n2505), .A1(\denoise/sum6_r [0]), .B0(n2942), .B1(
        \denoise/sum6 [0]), .Y(n2548) );
  NAND2XL U3527 ( .A(n2504), .B(\denoise/sum6_g [0]), .Y(n2547) );
  OAI211XL U3528 ( .A0(n3668), .A1(n2502), .B0(n2548), .C0(n2547), .Y(n1956)
         );
  ADDFX1 U3529 ( .A(\denoise/pos7 [2]), .B(\denoise/pos8 [2]), .CI(
        \denoise/pos9 [2]), .CO(\intadd_4/A[3] ), .S(\intadd_4/B[2] ) );
  ADDFX1 U3530 ( .A(\denoise/pos7 [3]), .B(\denoise/pos8 [3]), .CI(
        \denoise/pos9 [3]), .CO(\intadd_4/A[4] ), .S(\intadd_4/B[3] ) );
  ADDFX1 U3531 ( .A(\denoise/pos7 [4]), .B(\denoise/pos8 [4]), .CI(
        \denoise/pos9 [4]), .CO(\intadd_4/A[5] ), .S(\intadd_4/B[4] ) );
  ADDFX1 U3532 ( .A(\denoise/pos7 [5]), .B(\denoise/pos8 [5]), .CI(
        \denoise/pos9 [5]), .CO(\intadd_4/A[6] ), .S(\intadd_4/B[5] ) );
  ADDFX1 U3533 ( .A(\denoise/pos7 [6]), .B(\denoise/pos8 [6]), .CI(
        \denoise/pos9 [6]), .CO(\intadd_4/A[7] ), .S(\intadd_4/B[6] ) );
  NOR2XL U3534 ( .A(n2320), .B(n2555), .Y(\DP_OP_654J1_124_416/n94 ) );
  NOR2XL U3535 ( .A(n2321), .B(n2596), .Y(\DP_OP_654J1_124_416/n87 ) );
  NOR2XL U3536 ( .A(n2321), .B(n2555), .Y(\DP_OP_654J1_124_416/n95 ) );
  NOR2XL U3537 ( .A(n2322), .B(n2555), .Y(\DP_OP_654J1_124_416/n96 ) );
  NOR2XL U3538 ( .A(n2320), .B(n2611), .Y(\DP_OP_654J1_124_416/n110 ) );
  NOR2XL U3539 ( .A(n2320), .B(n2595), .Y(\DP_OP_654J1_124_416/n118 ) );
  NOR2XL U3540 ( .A(n2322), .B(n2570), .Y(\DP_OP_654J1_124_416/n104 ) );
  NOR2XL U3541 ( .A(n2325), .B(n2596), .Y(\DP_OP_654J1_124_416/n91 ) );
  NOR2XL U3542 ( .A(n2323), .B(n2570), .Y(\DP_OP_654J1_124_416/n105 ) );
  NOR2X1 U3543 ( .A(n2554), .B(n3708), .Y(n3364) );
  NAND3BX2 U3544 ( .AN(\mean/color_r [1]), .B(n3711), .C(\mean/valid_r ), .Y(
        n3359) );
  AOI21XL U3545 ( .A0(n3365), .A1(n3717), .B0(n3368), .Y(n1874) );
  NOR2XL U3546 ( .A(n2322), .B(n2595), .Y(\DP_OP_654J1_124_416/n120 ) );
  NOR2XL U3547 ( .A(n2325), .B(n2555), .Y(\DP_OP_654J1_124_416/n99 ) );
  NOR2XL U3548 ( .A(n2320), .B(n3116), .Y(\DP_OP_654J1_124_416/n134 ) );
  NOR2XL U3549 ( .A(n2322), .B(n3115), .Y(\DP_OP_654J1_124_416/n128 ) );
  NOR2XL U3550 ( .A(n2323), .B(n2595), .Y(\DP_OP_654J1_124_416/n121 ) );
  NOR2XL U3551 ( .A(n2320), .B(n3117), .Y(\DP_OP_654J1_124_416/n142 ) );
  NOR2XL U3552 ( .A(n2325), .B(n2570), .Y(\DP_OP_654J1_124_416/n107 ) );
  AOI21XL U3553 ( .A0(n3450), .A1(n3743), .B0(n3453), .Y(n1817) );
  NOR2XL U3554 ( .A(n2325), .B(n2611), .Y(\DP_OP_654J1_124_416/n115 ) );
  NOR2XL U3555 ( .A(n2322), .B(n3116), .Y(\DP_OP_654J1_124_416/n136 ) );
  NOR2XL U3556 ( .A(n2322), .B(n3117), .Y(\DP_OP_654J1_124_416/n144 ) );
  NOR2XL U3557 ( .A(n2323), .B(n3116), .Y(\DP_OP_654J1_124_416/n137 ) );
  AOI21XL U3558 ( .A0(n3367), .A1(n3729), .B0(n3370), .Y(n1872) );
  NOR2XL U3559 ( .A(n2324), .B(n3115), .Y(\DP_OP_654J1_124_416/n130 ) );
  NOR2XL U3560 ( .A(n2325), .B(n3115), .Y(\DP_OP_654J1_124_416/n131 ) );
  AOI21XL U3561 ( .A0(n3452), .A1(n3744), .B0(n3455), .Y(n1815) );
  AOI21XL U3562 ( .A0(n3408), .A1(n3731), .B0(n3411), .Y(n1846) );
  AOI21XL U3563 ( .A0(n3454), .A1(n3765), .B0(n3457), .Y(n1813) );
  AOI21XL U3564 ( .A0(n3410), .A1(n3741), .B0(n3413), .Y(n1844) );
  AOI21XL U3565 ( .A0(n3369), .A1(n3750), .B0(n3372), .Y(n1870) );
  AOI21XL U3566 ( .A0(n3412), .A1(n3742), .B0(n3415), .Y(n1842) );
  AOI21XL U3567 ( .A0(n3371), .A1(n3761), .B0(n3374), .Y(n1868) );
  AOI21XL U3568 ( .A0(n3456), .A1(n3768), .B0(n3459), .Y(n1811) );
  AOI21XL U3569 ( .A0(n3414), .A1(n3764), .B0(n3417), .Y(n1840) );
  AOI21XL U3570 ( .A0(n3373), .A1(n3762), .B0(n3376), .Y(n1866) );
  AOI21XL U3571 ( .A0(n3458), .A1(n3805), .B0(n3461), .Y(n1809) );
  AOI21XL U3572 ( .A0(n3416), .A1(n3760), .B0(n3419), .Y(n1838) );
  AOI21XL U3573 ( .A0(n3375), .A1(n3763), .B0(n3378), .Y(n1864) );
  AOI21XL U3574 ( .A0(n3460), .A1(n3803), .B0(n3463), .Y(n1807) );
  AOI21XL U3575 ( .A0(n3462), .A1(n3837), .B0(n3465), .Y(n1805) );
  AOI21XL U3576 ( .A0(n3418), .A1(n3809), .B0(n3421), .Y(n1836) );
  AOI21XL U3577 ( .A0(n3464), .A1(n3838), .B0(n3467), .Y(n1803) );
  NOR2X1 U3578 ( .A(n3377), .B(n3810), .Y(n3380) );
  AOI21XL U3579 ( .A0(n3377), .A1(n3810), .B0(n3380), .Y(n1862) );
  AOI21XL U3580 ( .A0(n3420), .A1(n3835), .B0(n3423), .Y(n1834) );
  NOR2X1 U3581 ( .A(n3379), .B(n3834), .Y(n3382) );
  AOI21XL U3582 ( .A0(n3379), .A1(n3834), .B0(n3382), .Y(n1860) );
  AOI21XL U3583 ( .A0(n3422), .A1(n3836), .B0(n3425), .Y(n1832) );
  OR2X2 U3584 ( .A(n2586), .B(\gain/finish_G_r ), .Y(n2301) );
  NOR2XL U3585 ( .A(mode_reg[0]), .B(n3751), .Y(n2557) );
  NAND2XL U3586 ( .A(mode_reg[1]), .B(n2557), .Y(n2660) );
  NOR3XL U3587 ( .A(mode_reg[1]), .B(mode_reg[2]), .C(mode_reg[0]), .Y(n2558)
         );
  NOR2XL U3588 ( .A(n3143), .B(n3868), .Y(pixel_in_dem[6]) );
  NOR2XL U3589 ( .A(n3143), .B(n3866), .Y(pixel_in_dem[1]) );
  NOR2XL U3590 ( .A(n3143), .B(n3867), .Y(pixel_in_dem[5]) );
  NOR2XL U3591 ( .A(n3143), .B(n3813), .Y(valid_in_dem) );
  NOR2XL U3592 ( .A(\gain/state_B_r [0]), .B(n3735), .Y(n2559) );
  BUFX4 U3593 ( .A(n2559), .Y(n3585) );
  OAI22XL U3594 ( .A0(n2560), .A1(n3692), .B0(n3585), .B1(n3907), .Y(n1653) );
  OAI22XL U3595 ( .A0(n2560), .A1(n3904), .B0(n3585), .B1(n3689), .Y(n1660) );
  NAND3X2 U3596 ( .A(n3751), .B(n3630), .C(mode_reg[1]), .Y(n3139) );
  AOI22XL U3597 ( .A0(n3140), .A1(last_pic_in_wb), .B0(n3139), .B1(
        last_pic_out_den), .Y(n3134) );
  INVXL U3598 ( .A(n3134), .Y(last_pic_in_mean) );
  NAND2XL U3599 ( .A(\mean/last_state_r [0]), .B(last_pic_in_mean), .Y(n2561)
         );
  OAI22XL U3600 ( .A0(\mean/last_state_r [1]), .A1(n2561), .B0(n3819), .B1(
        \mean/last_state_r [0]), .Y(\mean/last_state_w [1]) );
  NAND2XL U3601 ( .A(\denoise/counter_1 [2]), .B(\denoise/counter_1 [0]), .Y(
        n3208) );
  NAND2X1 U3602 ( .A(n2376), .B(n2375), .Y(n3173) );
  INVX4 U3603 ( .A(n3255), .Y(n3305) );
  INVX3 U3604 ( .A(\denoise/pos9 [2]), .Y(n3237) );
  OAI22XL U3605 ( .A0(n3305), .A1(n3665), .B0(n3255), .B1(n3237), .Y(n2200) );
  INVX3 U3606 ( .A(\denoise/pos9 [3]), .Y(n3250) );
  OAI22XL U3607 ( .A0(n3305), .A1(n3666), .B0(n3255), .B1(n3250), .Y(n2163) );
  OAI22XL U3608 ( .A0(n3305), .A1(n3797), .B0(n3255), .B1(n2318), .Y(n2089) );
  INVX3 U3609 ( .A(\denoise/pos9 [0]), .Y(n3211) );
  OAI22XL U3610 ( .A0(n3305), .A1(n3663), .B0(n3255), .B1(n3211), .Y(n2274) );
  INVX3 U3611 ( .A(\denoise/pos9 [1]), .Y(n3224) );
  OAI22XL U3612 ( .A0(n3305), .A1(n3664), .B0(n3255), .B1(n3224), .Y(n2237) );
  OAI22XL U3613 ( .A0(n3305), .A1(n3801), .B0(n3255), .B1(n2329), .Y(n2015) );
  INVX3 U3614 ( .A(\denoise/pos9 [6]), .Y(n3293) );
  OAI22XL U3615 ( .A0(n3305), .A1(n3799), .B0(n3255), .B1(n3293), .Y(n2052) );
  NOR2X1 U3616 ( .A(\gain/state_G_r [1]), .B(n3767), .Y(n2587) );
  BUFX2 U3617 ( .A(\gain/N456 ), .Y(n3598) );
  BUFX2 U3618 ( .A(\gain/MSB_G_r[1] ), .Y(n3502) );
  NAND2X1 U3619 ( .A(n3721), .B(n3502), .Y(n3500) );
  INVXL U3620 ( .A(n3500), .Y(n2564) );
  OAI22XL U3621 ( .A0(\gain/N478 ), .A1(\gain/g_mean_r [0]), .B0(n3721), .B1(
        \gain/g_mean_r [1]), .Y(n3512) );
  OAI22XL U3622 ( .A0(n3502), .A1(n3512), .B0(n3594), .B1(n3615), .Y(n2563) );
  OAI22XL U3623 ( .A0(n2564), .A1(n2563), .B0(n3500), .B1(\gain/g_mean_r [2]), 
        .Y(n2589) );
  AOI221XL U3624 ( .A0(n3502), .A1(n3642), .B0(n3594), .B1(n3616), .C0(n3721), 
        .Y(n2567) );
  NOR2X1 U3625 ( .A(n3502), .B(\gain/N478 ), .Y(n3593) );
  INVXL U3626 ( .A(n3593), .Y(n2565) );
  OAI22XL U3627 ( .A0(n3726), .A1(n3500), .B0(n2565), .B1(n3637), .Y(n2566) );
  OAI21XL U3628 ( .A0(n2567), .A1(n2566), .B0(n3598), .Y(n2588) );
  OAI21XL U3629 ( .A0(n3598), .A1(n2589), .B0(n2588), .Y(n2585) );
  NAND2X1 U3630 ( .A(n3103), .B(\gain/counter_G_r [0]), .Y(n3525) );
  NAND2XL U3631 ( .A(n2568), .B(n3525), .Y(n3523) );
  INVXL U3632 ( .A(n2568), .Y(n2939) );
  NAND2XL U3633 ( .A(\gain/N478 ), .B(n2939), .Y(n3495) );
  OAI21XL U3634 ( .A0(n2569), .A1(n3523), .B0(n3495), .Y(n1761) );
  NOR2XL U3635 ( .A(n2319), .B(n2570), .Y(\DP_OP_654J1_124_416/n101 ) );
  NOR2XL U3636 ( .A(\gain/state_B_r [1]), .B(\gain/state_B_r [0]), .Y(n2572)
         );
  NAND2X1 U3637 ( .A(\gain/valid_r ), .B(n2572), .Y(n3067) );
  BUFX2 U3638 ( .A(\gain/N626 ), .Y(n3602) );
  OAI22XL U3639 ( .A0(n2823), .A1(n3727), .B0(n3620), .B1(n3614), .Y(n3567) );
  BUFX2 U3640 ( .A(\gain/MSB_B_r[1] ), .Y(n2863) );
  NAND2X1 U3641 ( .A(n2823), .B(n2863), .Y(n3574) );
  INVXL U3642 ( .A(n3574), .Y(n2574) );
  NOR2XL U3643 ( .A(n2362), .B(n3599), .Y(n2573) );
  AOI222XL U3644 ( .A0(n3567), .A1(n3599), .B0(n2574), .B1(\gain/b_mean_r [3]), 
        .C0(n3620), .C1(n2573), .Y(n2583) );
  NAND2XL U3645 ( .A(n2863), .B(n3620), .Y(n3562) );
  OAI22XL U3646 ( .A0(n3635), .A1(n3574), .B0(n3725), .B1(n3562), .Y(n2575) );
  OAI21XL U3647 ( .A0(n2576), .A1(n2575), .B0(n3602), .Y(n2582) );
  OAI21XL U3648 ( .A0(n3602), .A1(n2583), .B0(n2582), .Y(n2669) );
  OAI21XL U3649 ( .A0(\gain/state_B_r [0]), .A1(n3559), .B0(n2327), .Y(n2577)
         );
  BUFX2 U3650 ( .A(n2577), .Y(n3568) );
  OAI222XL U3651 ( .A0(n2578), .A1(n2571), .B0(n3635), .B1(n2560), .C0(n3568), 
        .C1(n3725), .Y(n1713) );
  OAI222XL U3652 ( .A0(n2579), .A1(n2571), .B0(n3725), .B1(n2560), .C0(n3568), 
        .C1(n3636), .Y(n1712) );
  OAI222XL U3653 ( .A0(n3568), .A1(n3613), .B0(n2571), .B1(n2580), .C0(n2560), 
        .C1(n3636), .Y(n1711) );
  OAI222XL U3654 ( .A0(n3568), .A1(n2362), .B0(n2571), .B1(n2581), .C0(n2560), 
        .C1(n3619), .Y(n1709) );
  NAND2XL U3655 ( .A(\gain/state_B_r [0]), .B(n3735), .Y(n2670) );
  OR2X2 U3656 ( .A(n2670), .B(n2582), .Y(n3573) );
  OAI222XL U3657 ( .A0(n3568), .A1(n3839), .B0(n3573), .B1(n2583), .C0(n2560), 
        .C1(n3640), .Y(n1718) );
  OAI222XL U3658 ( .A0(n3568), .A1(n3614), .B0(n2571), .B1(n2584), .C0(n2560), 
        .C1(n2362), .Y(n1708) );
  NAND2XL U3659 ( .A(n2560), .B(n2327), .Y(n2297) );
  NAND2XL U3660 ( .A(n2823), .B(n2326), .Y(n2825) );
  OAI221XL U3661 ( .A0(\gain/counter_B_r [0]), .A1(n2560), .B0(n3873), .B1(
        n2297), .C0(n2825), .Y(n1707) );
  NOR2BX4 U3662 ( .AN(n2691), .B(n2586), .Y(n3518) );
  OAI222XL U3663 ( .A0(n2562), .A1(n3848), .B0(n3679), .B1(n3518), .C0(n3527), 
        .C1(n2589), .Y(n1774) );
  OAI222XL U3664 ( .A0(n2590), .A1(n3520), .B0(n3615), .B1(n3518), .C0(n3637), 
        .C1(n2562), .Y(n1766) );
  OAI222XL U3665 ( .A0(n2591), .A1(n3520), .B0(n3726), .B1(n3518), .C0(n3642), 
        .C1(n2562), .Y(n1769) );
  OAI222XL U3666 ( .A0(n2592), .A1(n3520), .B0(n3637), .B1(n3518), .C0(n3616), 
        .C1(n2562), .Y(n1767) );
  OAI222XL U3667 ( .A0(n2593), .A1(n3520), .B0(n3612), .B1(n3518), .C0(n3633), 
        .C1(n2562), .Y(n1763) );
  OAI222XL U3668 ( .A0(n2594), .A1(n3520), .B0(n3642), .B1(n3518), .C0(n3745), 
        .C1(n2562), .Y(n1770) );
  NOR2XL U3669 ( .A(n2319), .B(n2595), .Y(\DP_OP_654J1_124_416/n117 ) );
  NOR2XL U3670 ( .A(n2323), .B(n2596), .Y(\DP_OP_654J1_124_416/n89 ) );
  INVX1 U3671 ( .A(n3541), .Y(n3551) );
  NAND2XL U3672 ( .A(\gain/state_R_r [0]), .B(n3738), .Y(n2679) );
  BUFX2 U3673 ( .A(\gain/MSB_R_r[1] ), .Y(n3587) );
  NAND2XL U3674 ( .A(n3611), .B(n3587), .Y(n3472) );
  NAND2X1 U3675 ( .A(n3587), .B(\gain/N325 ), .Y(n3482) );
  OAI222XL U3676 ( .A0(n3478), .A1(n3587), .B0(n3632), .B1(n3472), .C0(n3716), 
        .C1(n3482), .Y(n2598) );
  OAI22XL U3677 ( .A0(n3482), .A1(n3639), .B0(n3472), .B1(n3724), .Y(n2600) );
  AOI221XL U3678 ( .A0(\gain/N325 ), .A1(n3638), .B0(n3611), .B1(n3618), .C0(
        n3587), .Y(n2599) );
  OAI21XL U3679 ( .A0(n2600), .A1(n2599), .B0(\gain/N303 ), .Y(n2605) );
  OAI21XL U3680 ( .A0(\gain/N303 ), .A1(n2606), .B0(n2605), .Y(n2680) );
  NOR2X1 U3681 ( .A(n2679), .B(n2680), .Y(n3470) );
  NAND2XL U3682 ( .A(\gain/state_R_r [1]), .B(\gain/state_R_r [0]), .Y(n3133)
         );
  NAND2X1 U3683 ( .A(n2690), .B(n3133), .Y(n3479) );
  OAI222XL U3684 ( .A0(n3119), .A1(n3638), .B0(n3484), .B1(n2602), .C0(n3618), 
        .C1(n2601), .Y(n1788) );
  OAI222XL U3685 ( .A0(n3119), .A1(n3716), .B0(n3484), .B1(n2603), .C0(n3632), 
        .C1(n2601), .Y(n1786) );
  OAI222XL U3686 ( .A0(n2604), .A1(n3484), .B0(n3631), .B1(n2601), .C0(n3715), 
        .C1(n3119), .Y(n1784) );
  NOR2XL U3687 ( .A(n2679), .B(n2605), .Y(n3003) );
  INVX1 U3688 ( .A(n3003), .Y(n3481) );
  OAI222XL U3689 ( .A0(n3119), .A1(n3641), .B0(n3746), .B1(n2601), .C0(n3481), 
        .C1(n2606), .Y(n1795) );
  OAI222XL U3690 ( .A0(n2607), .A1(n3484), .B0(n3638), .B1(n2601), .C0(n3724), 
        .C1(n3119), .Y(n1789) );
  OAI222XL U3691 ( .A0(n2608), .A1(n3484), .B0(n3724), .B1(n2601), .C0(n3639), 
        .C1(n3119), .Y(n1790) );
  OAI222XL U3692 ( .A0(n2609), .A1(n3484), .B0(n3639), .B1(n2601), .C0(n3730), 
        .C1(n3119), .Y(n1791) );
  OAI222XL U3693 ( .A0(n2610), .A1(n3484), .B0(n3716), .B1(n2601), .C0(n3618), 
        .C1(n3119), .Y(n1787) );
  NOR2XL U3694 ( .A(n2324), .B(n2611), .Y(\DP_OP_654J1_124_416/n114 ) );
  NAND2XL U3695 ( .A(\gain/R_r [15]), .B(n3758), .Y(n3544) );
  NOR2XL U3696 ( .A(\gain/r_mean_r [14]), .B(n3769), .Y(n2615) );
  NOR2XL U3697 ( .A(\gain/R_r [15]), .B(n3758), .Y(n2616) );
  NAND2X1 U3698 ( .A(\gain/state_R_r [1]), .B(n2618), .Y(n3576) );
  OAI222XL U3699 ( .A0(n3650), .A1(n3554), .B0(n3576), .B1(n2620), .C0(n3818), 
        .C1(n3551), .Y(n1739) );
  OR2X2 U3700 ( .A(\gain/R_r [0]), .B(n3631), .Y(\intadd_0/CI ) );
  BUFX12 U3701 ( .A(n3918), .Y(n3914) );
  BUFX12 U3702 ( .A(n2556), .Y(n3917) );
  BUFX12 U3703 ( .A(n3919), .Y(n3915) );
  BUFX12 U3704 ( .A(n2621), .Y(n3911) );
  BUFX12 U3705 ( .A(n2556), .Y(n3913) );
  BUFX12 U3706 ( .A(rst_n), .Y(n3912) );
  BUFX12 U3707 ( .A(n3918), .Y(n3910) );
  BUFX12 U3708 ( .A(n3918), .Y(n3916) );
  INVXL U3709 ( .A(color_in[0]), .Y(n1647) );
  NAND2XL U3710 ( .A(n3335), .B(\denoise/state_2 [1]), .Y(
        \denoise/n_color_out_reg [0]) );
  NAND3XL U3711 ( .A(\denoise/state_2 [0]), .B(\denoise/state_2 [1]), .C(n3821), .Y(\denoise/n_color_out_reg [1]) );
  NOR3X2 U3712 ( .A(n3751), .B(mode_reg[1]), .C(mode_reg[0]), .Y(n3606) );
  BUFX2 U3713 ( .A(n3606), .Y(n3114) );
  NOR2XL U3714 ( .A(n3114), .B(n3908), .Y(k_r_in_wb[6]) );
  NAND2XL U3715 ( .A(n2622), .B(k_g_out_gain[9]), .Y(n2623) );
  INVXL U3716 ( .A(n2623), .Y(k_g_in_wb[9]) );
  NAND2XL U3717 ( .A(n2622), .B(k_r_out_gain[11]), .Y(n2624) );
  INVXL U3718 ( .A(n2624), .Y(k_r_in_wb[11]) );
  NAND2XL U3719 ( .A(n2622), .B(k_g_out_gain[10]), .Y(n2625) );
  INVXL U3720 ( .A(n2625), .Y(k_g_in_wb[10]) );
  NAND2XL U3721 ( .A(n2622), .B(k_g_out_gain[8]), .Y(n2626) );
  INVXL U3722 ( .A(n2626), .Y(k_g_in_wb[8]) );
  NAND2XL U3723 ( .A(n2622), .B(k_r_out_gain[10]), .Y(n2627) );
  INVXL U3724 ( .A(n2627), .Y(k_r_in_wb[10]) );
  NAND2XL U3725 ( .A(n2622), .B(k_r_out_gain[9]), .Y(n2628) );
  INVXL U3726 ( .A(n2628), .Y(k_r_in_wb[9]) );
  INVXL U3727 ( .A(n2629), .Y(k_g_in_wb[11]) );
  NAND2XL U3728 ( .A(n2622), .B(k_b_out_gain[9]), .Y(n2630) );
  INVXL U3729 ( .A(n2630), .Y(k_b_in_wb[9]) );
  NAND2XL U3730 ( .A(n2622), .B(k_g_out_gain[6]), .Y(n2631) );
  INVXL U3731 ( .A(n2631), .Y(k_g_in_wb[6]) );
  NAND2XL U3732 ( .A(n2622), .B(k_b_out_gain[10]), .Y(n2632) );
  INVXL U3733 ( .A(n2632), .Y(k_b_in_wb[10]) );
  NAND2XL U3734 ( .A(n2622), .B(k_b_out_gain[11]), .Y(n2633) );
  INVXL U3735 ( .A(n2633), .Y(k_b_in_wb[11]) );
  NAND2XL U3736 ( .A(n2622), .B(k_b_out_gain[6]), .Y(n2634) );
  INVXL U3737 ( .A(n2634), .Y(k_b_in_wb[6]) );
  NAND2XL U3738 ( .A(n2622), .B(k_b_out_gain[7]), .Y(n2635) );
  AOI22XL U3739 ( .A0(n3140), .A1(last_pic_out_mean), .B0(n3604), .B1(
        last_pic_out_gamma), .Y(n2640) );
  NOR3XL U3740 ( .A(n3630), .B(mode_reg[1]), .C(mode_reg[2]), .Y(n2636) );
  AOI22XL U3741 ( .A0(last_pic_out_den), .A1(n2637), .B0(n3605), .B1(
        last_pic_out_dem), .Y(n2639) );
  NAND2XL U3742 ( .A(n3606), .B(last_pic_out_wb), .Y(n2638) );
  NAND3XL U3743 ( .A(n2640), .B(n2639), .C(n2638), .Y(n2284) );
  AOI22XL U3744 ( .A0(n2505), .A1(\denoise/sum3_r [5]), .B0(n2942), .B1(
        \denoise/sum3 [5]), .Y(n2642) );
  AOI22XL U3745 ( .A0(n2503), .A1(\denoise/sum3_b [5]), .B0(n2504), .B1(
        \denoise/sum3_g [5]), .Y(n2641) );
  NAND2XL U3746 ( .A(n2642), .B(n2641), .Y(n1917) );
  AOI22XL U3747 ( .A0(n2503), .A1(\denoise/sum3_b [6]), .B0(n2942), .B1(
        \denoise/sum3 [6]), .Y(n2644) );
  AOI22XL U3748 ( .A0(n2505), .A1(\denoise/sum3_r [6]), .B0(n2504), .B1(
        \denoise/sum3_g [6]), .Y(n2643) );
  NAND2XL U3749 ( .A(n2644), .B(n2643), .Y(n1909) );
  AOI22XL U3750 ( .A0(n2503), .A1(\denoise/sum3_b [8]), .B0(n2942), .B1(
        \denoise/sum3 [8]), .Y(n2646) );
  AOI22XL U3751 ( .A0(n2505), .A1(\denoise/sum3_r [8]), .B0(n2504), .B1(
        \denoise/sum3_g [8]), .Y(n2645) );
  AOI22XL U3752 ( .A0(n2503), .A1(\denoise/sum3_b [7]), .B0(n2942), .B1(
        \denoise/sum3 [7]), .Y(n2648) );
  AOI22XL U3753 ( .A0(n2505), .A1(\denoise/sum3_r [7]), .B0(n2504), .B1(
        \denoise/sum3_g [7]), .Y(n2647) );
  NAND2XL U3754 ( .A(n2648), .B(n2647), .Y(n1901) );
  AOI22XL U3755 ( .A0(n2505), .A1(\denoise/sum3_r [4]), .B0(n2942), .B1(
        \denoise/sum3 [4]), .Y(n2650) );
  AOI22XL U3756 ( .A0(n2503), .A1(\denoise/sum3_b [4]), .B0(n2504), .B1(
        \denoise/sum3_g [4]), .Y(n2649) );
  NAND2XL U3757 ( .A(n2650), .B(n2649), .Y(n1925) );
  AOI22XL U3758 ( .A0(n2505), .A1(\denoise/sum3_r [3]), .B0(n2942), .B1(
        \denoise/sum3 [3]), .Y(n2652) );
  AOI22XL U3759 ( .A0(n2503), .A1(\denoise/sum3_b [3]), .B0(n2504), .B1(
        \denoise/sum3_g [3]), .Y(n2651) );
  NAND2XL U3760 ( .A(n2652), .B(n2651), .Y(n1933) );
  AOI22XL U3761 ( .A0(n2503), .A1(\denoise/sum3_b [9]), .B0(n2504), .B1(
        \denoise/sum3_g [9]), .Y(n2654) );
  AOI22XL U3762 ( .A0(n2505), .A1(\denoise/sum3_r [9]), .B0(n2942), .B1(
        \denoise/sum3 [9]), .Y(n2653) );
  NAND2XL U3763 ( .A(n2654), .B(n2653), .Y(n1885) );
  AOI22XL U3764 ( .A0(n2505), .A1(\denoise/sum3_r [2]), .B0(n2504), .B1(
        \denoise/sum3_g [2]), .Y(n2656) );
  AOI22XL U3765 ( .A0(n2503), .A1(\denoise/sum3_b [2]), .B0(n2942), .B1(
        \denoise/sum3 [2]), .Y(n2655) );
  NAND2XL U3766 ( .A(n2656), .B(n2655), .Y(n1941) );
  AOI22XL U3767 ( .A0(n3140), .A1(valid_out_mean), .B0(n3114), .B1(
        valid_value_out_wb), .Y(n2659) );
  AOI22XL U3768 ( .A0(valid_out_dem), .A1(n3605), .B0(valid_out_den), .B1(
        n2637), .Y(n2658) );
  NAND2XL U3769 ( .A(n3138), .B(valid_out_gain), .Y(n2666) );
  NAND2XL U3770 ( .A(n3604), .B(valid_out_gamma), .Y(n2657) );
  NAND4XL U3771 ( .A(n2659), .B(n2658), .C(n2666), .D(n2657), .Y(n2295) );
  NAND3XL U3772 ( .A(n3142), .B(color_out_den[1]), .C(last_col_out_den), .Y(
        n2668) );
  NAND2XL U3773 ( .A(n3605), .B(last_col_out_dem), .Y(n3102) );
  NOR2XL U3774 ( .A(color_out_dem[0]), .B(n3102), .Y(n2665) );
  OAI22XL U3775 ( .A0(n3139), .A1(n3628), .B0(n2660), .B1(n3864), .Y(n2664) );
  NAND3XL U3776 ( .A(n3114), .B(color_out_wb[1]), .C(last_pic_out_wb), .Y(
        n2661) );
  OAI22XL U3777 ( .A0(color_out_gamma[0]), .A1(n2662), .B0(color_out_wb[0]), 
        .B1(n2661), .Y(n2663) );
  AOI211XL U3778 ( .A0(color_out_dem[1]), .A1(n2665), .B0(n2664), .C0(n2663), 
        .Y(n2667) );
  OAI211XL U3779 ( .A0(color_out_den[0]), .A1(n2668), .B0(n2667), .C0(n2666), 
        .Y(n2286) );
  NAND3XL U3780 ( .A(n3585), .B(\gain/counter_B_r [1]), .C(
        \gain/counter_B_r [0]), .Y(n2688) );
  NAND2XL U3781 ( .A(n3558), .B(\gain/counter_B_r [3]), .Y(n3556) );
  NAND3XL U3782 ( .A(n3067), .B(n2686), .C(n3556), .Y(n2298) );
  NAND2X1 U3783 ( .A(n3140), .B(color_out_mean[1]), .Y(n2732) );
  NAND2XL U3784 ( .A(n3605), .B(color_out_dem[1]), .Y(n2673) );
  NAND2XL U3785 ( .A(n3604), .B(color_out_gamma[1]), .Y(n2672) );
  NAND2XL U3786 ( .A(n3114), .B(color_out_wb[1]), .Y(n2671) );
  NAND4XL U3787 ( .A(n2732), .B(n2673), .C(n2672), .D(n2671), .Y(n2674) );
  INVXL U3788 ( .A(n2674), .Y(n2675) );
  OAI2BB1X1 U3789 ( .A0N(color_out_den[1]), .A1N(n2637), .B0(n2675), .Y(n2676)
         );
  INVXL U3790 ( .A(n2676), .Y(n1637) );
  AOI22XL U3791 ( .A0(n2505), .A1(\denoise/sum3_r [0]), .B0(n2504), .B1(
        \denoise/sum3_g [0]), .Y(n2678) );
  AOI22XL U3792 ( .A0(n2503), .A1(\denoise/sum3_b [0]), .B0(n2942), .B1(
        \denoise/sum3 [0]), .Y(n2677) );
  NAND2XL U3793 ( .A(n2678), .B(n2677), .Y(n1962) );
  NAND3XL U3794 ( .A(n2597), .B(\gain/counter_R_r [1]), .C(
        \gain/counter_R_r [0]), .Y(n2689) );
  NOR2XL U3795 ( .A(n3471), .B(n2597), .Y(n2684) );
  NOR2XL U3796 ( .A(n2681), .B(n3119), .Y(n2682) );
  OAI21XL U3797 ( .A0(n2684), .A1(n2682), .B0(\gain/counter_R_r [2]), .Y(n2683) );
  INVXL U3798 ( .A(n2684), .Y(n2303) );
  NAND2XL U3799 ( .A(\gain/N325 ), .B(n3471), .Y(n3009) );
  NAND2XL U3800 ( .A(n2597), .B(n3815), .Y(n2685) );
  OAI211XL U3801 ( .A0(n2303), .A1(n3815), .B0(n3009), .C0(n2685), .Y(n1782)
         );
  NOR2X1 U3802 ( .A(n2686), .B(n2823), .Y(n3600) );
  AOI21XL U3803 ( .A0(n2686), .A1(n2823), .B0(n3600), .Y(n1649) );
  NAND3XL U3804 ( .A(n2688), .B(\gain/counter_B_r [2]), .C(n2327), .Y(n2687)
         );
  OAI211XL U3805 ( .A0(n2688), .A1(\gain/counter_B_r [2]), .B0(n3573), .C0(
        n2687), .Y(n1705) );
  NAND2XL U3806 ( .A(n3487), .B(\gain/counter_R_r [3]), .Y(n3485) );
  NAND2XL U3807 ( .A(n3485), .B(n2690), .Y(n2304) );
  NOR3BX1 U3808 ( .AN(\gain/counter_G_r [2]), .B(n3525), .C(n3820), .Y(n3529)
         );
  NAND2XL U3809 ( .A(n3529), .B(\gain/counter_G_r [3]), .Y(n3521) );
  NAND2XL U3810 ( .A(n3521), .B(n2691), .Y(n2300) );
  NAND2XL U3811 ( .A(n3592), .B(n3721), .Y(n3595) );
  AOI22XL U3812 ( .A0(n3502), .A1(n3595), .B0(n3593), .B1(n3592), .Y(n1642) );
  NAND2XL U3813 ( .A(n3140), .B(color_out_mean[0]), .Y(n3603) );
  NOR2X2 U3814 ( .A(color_out_mean[1]), .B(n3603), .Y(n2729) );
  INVXL U3815 ( .A(n2729), .Y(n2697) );
  NOR3X2 U3816 ( .A(color_out_mean[1]), .B(color_out_mean[0]), .C(n3139), .Y(
        n2726) );
  AOI22XL U3817 ( .A0(r_mean_out_mean[4]), .A1(n2726), .B0(n3604), .B1(
        pixel_out_gamma[4]), .Y(n2696) );
  INVX1 U3818 ( .A(n2732), .Y(n2706) );
  INVXL U3819 ( .A(n3605), .Y(n2712) );
  INVXL U3820 ( .A(pixel_out_dem[4]), .Y(n2692) );
  OAI22XL U3821 ( .A0(n2622), .A1(n3871), .B0(n2712), .B1(n2692), .Y(n2693) );
  AOI211XL U3822 ( .A0(n3138), .A1(k_r_out_gain[4]), .B0(n2694), .C0(n2693), 
        .Y(n2695) );
  OAI211XL U3823 ( .A0(n2697), .A1(n3909), .B0(n2696), .C0(n2695), .Y(n2291)
         );
  AOI211XL U3824 ( .A0(g_mean_out_mean[5]), .A1(n2729), .B0(n2699), .C0(n2698), 
        .Y(n2701) );
  AOI22XL U3825 ( .A0(r_mean_out_mean[5]), .A1(n2726), .B0(n3604), .B1(
        pixel_out_gamma[5]), .Y(n2700) );
  AOI22XL U3826 ( .A0(pixel_out_gamma[1]), .A1(n3604), .B0(pixel_out_den[1]), 
        .B1(n2637), .Y(n2705) );
  AOI211XL U3827 ( .A0(g_mean_out_mean[1]), .A1(n2729), .B0(n2703), .C0(n2702), 
        .Y(n2704) );
  OAI211XL U3828 ( .A0(n2622), .A1(n3903), .B0(n2705), .C0(n2704), .Y(n2288)
         );
  AOI22XL U3829 ( .A0(pixel_out_gamma[6]), .A1(n3604), .B0(pixel_out_den[6]), 
        .B1(n2637), .Y(n2710) );
  AOI211XL U3830 ( .A0(g_mean_out_mean[6]), .A1(n2729), .B0(n2708), .C0(n2707), 
        .Y(n2709) );
  OAI211XL U3831 ( .A0(n2622), .A1(n3901), .B0(n2710), .C0(n2709), .Y(n2293)
         );
  AOI22XL U3832 ( .A0(n3138), .A1(k_r_out_gain[3]), .B0(n3604), .B1(
        pixel_out_gamma[3]), .Y(n2716) );
  INVXL U3833 ( .A(pixel_out_dem[3]), .Y(n2711) );
  OAI22XL U3834 ( .A0(n2622), .A1(n3881), .B0(n2712), .B1(n2711), .Y(n2714) );
  AOI211XL U3835 ( .A0(g_mean_out_mean[3]), .A1(n2729), .B0(n2714), .C0(n2713), 
        .Y(n2715) );
  OAI211XL U3836 ( .A0(n3705), .A1(n2732), .B0(n2716), .C0(n2715), .Y(n2290)
         );
  AOI22XL U3837 ( .A0(n3604), .A1(pixel_out_gamma[0]), .B0(n3605), .B1(
        pixel_out_dem[0]), .Y(n2721) );
  AOI22XL U3838 ( .A0(n3138), .A1(k_r_out_gain[0]), .B0(n3114), .B1(
        pixel_out_wb[0]), .Y(n2717) );
  INVXL U3839 ( .A(n2717), .Y(n2719) );
  OAI211XL U3840 ( .A0(n3699), .A1(n2732), .B0(n2721), .C0(n2720), .Y(n2287)
         );
  AOI22XL U3841 ( .A0(n3606), .A1(pixel_out_wb[2]), .B0(n3604), .B1(
        pixel_out_gamma[2]), .Y(n2725) );
  AOI211XL U3842 ( .A0(g_mean_out_mean[2]), .A1(n2729), .B0(n2723), .C0(n2722), 
        .Y(n2724) );
  OAI211XL U3843 ( .A0(n3875), .A1(n2732), .B0(n2725), .C0(n2724), .Y(n2289)
         );
  OAI22XL U3844 ( .A0(n3137), .A1(n3684), .B0(n2622), .B1(n3882), .Y(n2728) );
  AOI211XL U3845 ( .A0(g_mean_out_mean[7]), .A1(n2729), .B0(n2728), .C0(n2727), 
        .Y(n2730) );
  OAI211XL U3846 ( .A0(n3712), .A1(n2732), .B0(n2731), .C0(n2730), .Y(n2294)
         );
  NAND2XL U3847 ( .A(\gain/counter_B_r [1]), .B(\gain/counter_B_r [0]), .Y(
        n2733) );
  OAI211XL U3848 ( .A0(\gain/counter_B_r [1]), .A1(\gain/counter_B_r [0]), 
        .B0(n3585), .C0(n2733), .Y(n2734) );
  NAND2XL U3849 ( .A(n3585), .B(\gain/b_mean_r [13]), .Y(n2740) );
  NAND2XL U3850 ( .A(n3602), .B(n2863), .Y(n2826) );
  INVXL U3851 ( .A(n2826), .Y(n2736) );
  AOI222XL U3852 ( .A0(n2362), .A1(n3599), .B0(n3613), .B1(n2736), .C0(n3680), 
        .C1(n3727), .Y(n2824) );
  OAI21XL U3853 ( .A0(\gain/b_mean_r [3]), .A1(n3599), .B0(n3602), .Y(n2737)
         );
  AOI22XL U3854 ( .A0(n3566), .A1(n3562), .B0(n3574), .B1(n2737), .Y(n2738) );
  OAI211XL U3855 ( .A0(n2824), .A1(n3620), .B0(n2326), .C0(n2738), .Y(n2739)
         );
  OAI211XL U3856 ( .A0(n3568), .A1(n3640), .B0(n2740), .C0(n2739), .Y(n1719)
         );
  NAND2XL U3857 ( .A(\denoise/n_counter_1 [2]), .B(n3634), .Y(n2744) );
  NOR2XL U3858 ( .A(n2744), .B(n3609), .Y(n2741) );
  NAND2X1 U3859 ( .A(n2503), .B(n3150), .Y(n2889) );
  AOI22XL U3860 ( .A0(\denoise/second_col_r[4][4] ), .A1(n2988), .B0(
        \denoise/second_col_b[3][4] ), .B1(n2742), .Y(n2771) );
  INVX1 U3861 ( .A(n2504), .Y(n3610) );
  NOR2XL U3862 ( .A(n2744), .B(n3610), .Y(n2743) );
  NOR2XL U3863 ( .A(n2502), .B(n2744), .Y(n2745) );
  AOI22XL U3864 ( .A0(\denoise/second_col_g[4][4] ), .A1(n2979), .B0(
        \denoise/second_col_b[4][4] ), .B1(n2987), .Y(n2770) );
  NOR2XL U3865 ( .A(\denoise/n_counter_1 [1]), .B(\denoise/n_counter_1 [2]), 
        .Y(n2746) );
  NAND2X1 U3866 ( .A(\denoise/n_counter_1 [0]), .B(n2746), .Y(n3155) );
  NOR2XL U3867 ( .A(n3610), .B(n3155), .Y(n2747) );
  NAND2X2 U3868 ( .A(n2505), .B(n3150), .Y(n2888) );
  OAI2BB2XL U3869 ( .B0(n3826), .B1(n2888), .A0N(n2942), .A1N(
        \denoise/pos8 [4]), .Y(n2755) );
  NAND2XL U3870 ( .A(\denoise/n_counter_1 [1]), .B(n3634), .Y(n2756) );
  INVX1 U3871 ( .A(n2748), .Y(n2883) );
  NOR2XL U3872 ( .A(n3610), .B(n3144), .Y(n2749) );
  NOR2XL U3873 ( .A(n2756), .B(n3610), .Y(n2750) );
  AOI22XL U3874 ( .A0(\denoise/second_col_g[5][4] ), .A1(n2980), .B0(
        \denoise/second_col_g[2][4] ), .B1(n2982), .Y(n2753) );
  NOR2XL U3875 ( .A(n3609), .B(n3144), .Y(n2751) );
  NAND2XL U3876 ( .A(\denoise/second_col_r[5][4] ), .B(n2986), .Y(n2752) );
  AOI211XL U3877 ( .A0(\denoise/second_col_g[1][4] ), .A1(n2983), .B0(n2755), 
        .C0(n2754), .Y(n2769) );
  NOR2XL U3878 ( .A(n2502), .B(n2756), .Y(n2757) );
  INVXL U3879 ( .A(n2981), .Y(n2848) );
  OAI22XL U3880 ( .A0(n3623), .A1(n2527), .B0(n3853), .B1(n2848), .Y(n2767) );
  NAND2X1 U3881 ( .A(n2504), .B(n3150), .Y(n2830) );
  NAND3XL U3882 ( .A(n3634), .B(n2377), .C(n3757), .Y(n2761) );
  NOR2XL U3883 ( .A(n3610), .B(n2761), .Y(n2758) );
  BUFX2 U3884 ( .A(n2758), .Y(n2985) );
  INVX1 U3885 ( .A(n2985), .Y(n2886) );
  OAI22XL U3886 ( .A0(n3858), .A1(n2830), .B0(n3653), .B1(n2886), .Y(n2766) );
  NAND2X1 U3887 ( .A(n2505), .B(n2759), .Y(n2835) );
  NOR2XL U3888 ( .A(n3609), .B(n3155), .Y(n2760) );
  BUFX2 U3889 ( .A(n2760), .Y(n2984) );
  INVX1 U3890 ( .A(n2984), .Y(n2853) );
  OAI22XL U3891 ( .A0(n3859), .A1(n2835), .B0(n3654), .B1(n2853), .Y(n2765) );
  INVX1 U3892 ( .A(n2762), .Y(n2854) );
  INVXL U3893 ( .A(n2763), .Y(n2814) );
  OAI22XL U3894 ( .A0(n3860), .A1(n2854), .B0(n3659), .B1(n2814), .Y(n2764) );
  NOR4XL U3895 ( .A(n2767), .B(n2766), .C(n2765), .D(n2764), .Y(n2768) );
  NAND4XL U3896 ( .A(n2771), .B(n2770), .C(n2769), .D(n2768), .Y(n1981) );
  NOR2XL U3897 ( .A(n3789), .B(n2835), .Y(n2773) );
  AOI211XL U3898 ( .A0(n2984), .A1(\denoise/second_col_r[1][3] ), .B0(n2773), 
        .C0(n2772), .Y(n2781) );
  INVX1 U3899 ( .A(n2982), .Y(n2884) );
  OAI22XL U3900 ( .A0(n3656), .A1(n2888), .B0(n3852), .B1(n2884), .Y(n2779) );
  OAI22XL U3901 ( .A0(n3783), .A1(n2830), .B0(n3652), .B1(n2886), .Y(n2778) );
  OAI2BB2XL U3902 ( .B0(n3825), .B1(n2889), .A0N(n2942), .A1N(
        \denoise/pos8 [3]), .Y(n2777) );
  AOI22XL U3903 ( .A0(\denoise/second_col_g[4][3] ), .A1(n2979), .B0(
        \denoise/second_col_r[4][3] ), .B1(n2988), .Y(n2775) );
  AOI22XL U3904 ( .A0(\denoise/second_col_b[4][3] ), .A1(n2987), .B0(
        \denoise/second_col_b[2][3] ), .B1(n2981), .Y(n2774) );
  OAI211XL U3905 ( .A0(n3778), .A1(n2854), .B0(n2775), .C0(n2774), .Y(n2776)
         );
  NOR4XL U3906 ( .A(n2779), .B(n2778), .C(n2777), .D(n2776), .Y(n2780) );
  AOI22XL U3907 ( .A0(\denoise/second_col_r[5][6] ), .A1(n2986), .B0(
        \denoise/second_col_r[4][6] ), .B1(n2988), .Y(n2796) );
  OAI22XL U3908 ( .A0(n3785), .A1(n2883), .B0(n3655), .B1(n2830), .Y(n2784) );
  AOI211XL U3909 ( .A0(n2987), .A1(\denoise/second_col_b[4][6] ), .B0(n2785), 
        .C0(n2784), .Y(n2794) );
  OAI22XL U3910 ( .A0(n3777), .A1(n2853), .B0(n3624), .B1(n2854), .Y(n2792) );
  OAI2BB2XL U3911 ( .B0(n3828), .B1(n2889), .A0N(n2942), .A1N(
        \denoise/pos8 [6]), .Y(n2790) );
  OAI211XL U3912 ( .A0(n3779), .A1(n2886), .B0(n2788), .C0(n2787), .Y(n2789)
         );
  AOI22XL U3913 ( .A0(n2981), .A1(\denoise/second_col_b[2][7] ), .B0(
        \denoise/second_col_r[0][7] ), .B1(n2786), .Y(n2807) );
  AOI22XL U3914 ( .A0(\denoise/second_col_g[4][7] ), .A1(n2979), .B0(
        \denoise/second_col_r[4][7] ), .B1(n2988), .Y(n2797) );
  OAI21XL U3915 ( .A0(n3786), .A1(n2883), .B0(n2797), .Y(n2805) );
  AOI22XL U3916 ( .A0(\denoise/second_col_r[1][7] ), .A1(n2984), .B0(n2762), 
        .B1(\denoise/second_col_b[0][7] ), .Y(n2803) );
  AOI22XL U3917 ( .A0(\denoise/second_col_g[1][7] ), .A1(n2983), .B0(n2763), 
        .B1(\denoise/second_col_b[1][7] ), .Y(n2802) );
  OAI2BB2XL U3918 ( .B0(n3829), .B1(n2888), .A0N(n2987), .A1N(
        \denoise/second_col_b[4][7] ), .Y(n2798) );
  AOI211XL U3919 ( .A0(\denoise/second_col_g[0][7] ), .A1(n2985), .B0(n2799), 
        .C0(n2798), .Y(n2800) );
  NAND4XL U3920 ( .A(n2803), .B(n2802), .C(n2801), .D(n2800), .Y(n2804) );
  AOI211XL U3921 ( .A0(\denoise/second_col_r[5][7] ), .A1(n2986), .B0(n2805), 
        .C0(n2804), .Y(n2806) );
  NAND3XL U3922 ( .A(n2808), .B(n2807), .C(n2806), .Y(n1978) );
  NOR2XL U3923 ( .A(n3662), .B(n2886), .Y(n2810) );
  OAI22XL U3924 ( .A0(n3780), .A1(n2853), .B0(n3626), .B1(n2854), .Y(n2809) );
  AOI211XL U3925 ( .A0(\denoise/second_col_g[1][0] ), .A1(n2983), .B0(n2810), 
        .C0(n2809), .Y(n2822) );
  AOI22XL U3926 ( .A0(n2942), .A1(\denoise/pos8 [0]), .B0(
        \denoise/second_col_g[3][0] ), .B1(n2811), .Y(n2821) );
  OAI2BB2XL U3927 ( .B0(n3822), .B1(n2883), .A0N(\denoise/second_col_g[5][0] ), 
        .A1N(n2980), .Y(n2813) );
  INVXL U3928 ( .A(n2988), .Y(n2890) );
  OAI22XL U3929 ( .A0(n3855), .A1(n2890), .B0(n3681), .B1(n2884), .Y(n2818) );
  OAI2BB2XL U3930 ( .B0(n3823), .B1(n2848), .A0N(\denoise/second_col_b[4][0] ), 
        .A1N(n2987), .Y(n2817) );
  OAI2BB2XL U3931 ( .B0(n3771), .B1(n2527), .A0N(\denoise/second_col_g[4][0] ), 
        .A1N(n2979), .Y(n2816) );
  OAI22XL U3932 ( .A0(n3625), .A1(n2888), .B0(n3850), .B1(n2814), .Y(n2815) );
  NOR4XL U3933 ( .A(n2818), .B(n2817), .C(n2816), .D(n2815), .Y(n2819) );
  AOI211XL U3934 ( .A0(n3680), .A1(n3599), .B0(n2823), .C0(n2327), .Y(n2866)
         );
  OAI222XL U3935 ( .A0(n2826), .A1(n3636), .B0(n3614), .B1(n3602), .C0(n3619), 
        .C1(n2863), .Y(n2865) );
  OAI211XL U3936 ( .A0(n3602), .A1(n2863), .B0(n2868), .C0(n2865), .Y(n2827)
         );
  OAI211XL U3937 ( .A0(n3568), .A1(n3872), .B0(n2828), .C0(n2827), .Y(n1720)
         );
  NOR2XL U3938 ( .A(n3790), .B(n2884), .Y(n2832) );
  OAI22XL U3939 ( .A0(n3861), .A1(n2830), .B0(n3651), .B1(n2527), .Y(n2831) );
  AOI211XL U3940 ( .A0(n2829), .A1(\denoise/second_col_r[3][5] ), .B0(n2832), 
        .C0(n2831), .Y(n2843) );
  AOI22XL U3941 ( .A0(n2942), .A1(\denoise/pos8 [5]), .B0(
        \denoise/second_col_r[2][5] ), .B1(n2748), .Y(n2842) );
  AOI211XL U3942 ( .A0(\denoise/second_col_g[1][5] ), .A1(n2983), .B0(n2834), 
        .C0(n2833), .Y(n2841) );
  OAI22XL U3943 ( .A0(n3784), .A1(n2835), .B0(n3627), .B1(n2854), .Y(n2837) );
  OAI22XL U3944 ( .A0(n3657), .A1(n2853), .B0(n3854), .B1(n2886), .Y(n2836) );
  NOR4XL U3945 ( .A(n2839), .B(n2838), .C(n2837), .D(n2836), .Y(n2840) );
  NAND2XL U3946 ( .A(\gain/r_mean_r [0]), .B(n3590), .Y(n3008) );
  OAI21XL U3947 ( .A0(n3618), .A1(n3590), .B0(n3008), .Y(n2844) );
  OAI22XL U3948 ( .A0(n3587), .A1(\gain/r_mean_r [2]), .B0(n2328), .B1(n2844), 
        .Y(n3473) );
  OAI211XL U3949 ( .A0(\gain/N303 ), .A1(n3587), .B0(n3471), .C0(n3611), .Y(
        n3015) );
  NOR2XL U3950 ( .A(n3590), .B(n2328), .Y(n3007) );
  NOR2XL U3951 ( .A(n2328), .B(n3715), .Y(n3004) );
  AOI222XL U3952 ( .A0(n2328), .A1(\gain/r_mean_r [3]), .B0(\gain/r_mean_r [5]), .B1(n3007), .C0(n3590), .C1(n3004), .Y(n3016) );
  AOI211XL U3953 ( .A0(n3590), .A1(n2328), .B0(n3009), .C0(n3016), .Y(n2845)
         );
  INVXL U3954 ( .A(n2845), .Y(n2846) );
  OAI211XL U3955 ( .A0(n3473), .A1(n3015), .B0(n2847), .C0(n2846), .Y(n1797)
         );
  AOI22XL U3956 ( .A0(\denoise/second_col_r[5][2] ), .A1(n2986), .B0(
        \denoise/second_col_g[3][2] ), .B1(n2811), .Y(n2862) );
  OAI22XL U3957 ( .A0(n3782), .A1(n2848), .B0(n3617), .B1(n2527), .Y(n2852) );
  NAND2XL U3958 ( .A(\denoise/second_col_g[4][2] ), .B(n2979), .Y(n2849) );
  OAI211XL U3959 ( .A0(n2888), .A1(n3787), .B0(n2850), .C0(n2849), .Y(n2851)
         );
  AOI211XL U3960 ( .A0(\denoise/second_col_b[1][2] ), .A1(n2763), .B0(n2852), 
        .C0(n2851), .Y(n2860) );
  OAI2BB2XL U3961 ( .B0(n3824), .B1(n2883), .A0N(\denoise/second_col_b[4][2] ), 
        .A1N(n2987), .Y(n2858) );
  OAI22XL U3962 ( .A0(n3857), .A1(n2853), .B0(n3682), .B1(n2890), .Y(n2857) );
  OAI22XL U3963 ( .A0(n3660), .A1(n2886), .B0(n3851), .B1(n2854), .Y(n2856) );
  NOR4XL U3964 ( .A(n2858), .B(n2857), .C(n2856), .D(n2855), .Y(n2859) );
  NAND4XL U3965 ( .A(n2862), .B(n2861), .C(n2860), .D(n2859), .Y(n1983) );
  OAI22XL U3966 ( .A0(n2863), .A1(\gain/b_mean_r [0]), .B0(n3599), .B1(
        \gain/b_mean_r [2]), .Y(n3563) );
  OAI221XL U3967 ( .A0(n2863), .A1(\gain/b_mean_r [4]), .B0(n3599), .B1(
        \gain/b_mean_r [6]), .C0(n3602), .Y(n2864) );
  OAI21XL U3968 ( .A0(n3602), .A1(n3563), .B0(n2864), .Y(n2867) );
  NAND2XL U3969 ( .A(n3585), .B(\gain/b_mean_r [15]), .Y(n2869) );
  OAI211XL U3970 ( .A0(n3733), .A1(n3568), .B0(n2870), .C0(n2869), .Y(n1721)
         );
  AOI22XL U3971 ( .A0(\denoise/first_col_r[5][1] ), .A1(n2986), .B0(
        \denoise/first_col_b[2][1] ), .B1(n2981), .Y(n2882) );
  AOI22XL U3972 ( .A0(\denoise/first_col_g[5][1] ), .A1(n2980), .B0(
        \denoise/first_col_b[5][1] ), .B1(n2526), .Y(n2881) );
  AOI22XL U3973 ( .A0(\denoise/first_col_g[2][1] ), .A1(n2982), .B0(
        \denoise/first_col_b[4][1] ), .B1(n2987), .Y(n2872) );
  NAND2XL U3974 ( .A(\denoise/first_col_b[3][1] ), .B(n2742), .Y(n2871) );
  OAI211XL U3975 ( .A0(n2887), .A1(n3749), .B0(n2872), .C0(n2871), .Y(n2873)
         );
  AOI211XL U3976 ( .A0(\denoise/first_col_r[0][1] ), .A1(n2786), .B0(n2874), 
        .C0(n2873), .Y(n2880) );
  NAND4XL U3977 ( .A(n2882), .B(n2881), .C(n2880), .D(n2879), .Y(n1970) );
  OAI21XL U3978 ( .A0(n3661), .A1(n2886), .B0(n2885), .Y(n2898) );
  AOI22XL U3979 ( .A0(\denoise/second_col_g[1][1] ), .A1(n2983), .B0(
        \denoise/second_col_b[0][1] ), .B1(n2762), .Y(n2896) );
  AOI22XL U3980 ( .A0(\denoise/second_col_b[1][1] ), .A1(n2763), .B0(
        \denoise/second_col_r[1][1] ), .B1(n2984), .Y(n2895) );
  AOI22XL U3981 ( .A0(\denoise/second_col_b[2][1] ), .A1(n2981), .B0(
        \denoise/second_col_g[3][1] ), .B1(n2811), .Y(n2894) );
  OAI22XL U3982 ( .A0(n3781), .A1(n2888), .B0(n2887), .B1(n3644), .Y(n2892) );
  OAI22XL U3983 ( .A0(n3856), .A1(n2890), .B0(n3658), .B1(n2889), .Y(n2891) );
  AOI211XL U3984 ( .A0(\denoise/second_col_r[0][1] ), .A1(n2786), .B0(n2892), 
        .C0(n2891), .Y(n2893) );
  NAND4XL U3985 ( .A(n2896), .B(n2895), .C(n2894), .D(n2893), .Y(n2897) );
  AOI211XL U3986 ( .A0(\denoise/second_col_r[5][1] ), .A1(n2986), .B0(n2898), 
        .C0(n2897), .Y(n2899) );
  AOI22XL U3987 ( .A0(\denoise/first_col_r[5][2] ), .A1(n2986), .B0(
        \denoise/first_col_g[5][2] ), .B1(n2980), .Y(n2913) );
  AOI22XL U3988 ( .A0(\denoise/first_col_b[2][2] ), .A1(n2981), .B0(
        \denoise/first_col_b[4][2] ), .B1(n2987), .Y(n2912) );
  AOI22XL U3989 ( .A0(\denoise/first_col_r[0][2] ), .A1(n2786), .B0(
        \denoise/first_col_g[1][2] ), .B1(n2983), .Y(n2906) );
  AOI22XL U3990 ( .A0(\denoise/first_col_g[4][2] ), .A1(n2979), .B0(n2942), 
        .B1(\denoise/pos7 [2]), .Y(n2905) );
  AOI211XL U3991 ( .A0(\denoise/first_col_r[1][2] ), .A1(n2984), .B0(n2903), 
        .C0(n2902), .Y(n2904) );
  NAND4XL U3992 ( .A(n2907), .B(n2906), .C(n2905), .D(n2904), .Y(n2908) );
  NOR3XL U3993 ( .A(n2910), .B(n2909), .C(n2908), .Y(n2911) );
  NAND3XL U3994 ( .A(n2913), .B(n2912), .C(n2911), .Y(n1969) );
  AOI22XL U3995 ( .A0(\denoise/first_col_r[4][5] ), .A1(n2988), .B0(
        \denoise/first_col_r[3][5] ), .B1(n2829), .Y(n2925) );
  AOI22XL U3996 ( .A0(\denoise/first_col_r[2][5] ), .A1(n2748), .B0(
        \denoise/first_col_b[2][5] ), .B1(n2981), .Y(n2924) );
  AOI22XL U3997 ( .A0(\denoise/first_col_g[0][5] ), .A1(n2985), .B0(
        \denoise/first_col_g[1][5] ), .B1(n2983), .Y(n2919) );
  AOI22XL U3998 ( .A0(\denoise/first_col_r[1][5] ), .A1(n2984), .B0(
        \denoise/first_col_r[0][5] ), .B1(n2786), .Y(n2918) );
  AOI22XL U3999 ( .A0(\denoise/first_col_b[5][5] ), .A1(n2526), .B0(n2942), 
        .B1(\denoise/pos7 [5]), .Y(n2917) );
  AOI211XL U4000 ( .A0(\denoise/first_col_b[1][5] ), .A1(n2763), .B0(n2915), 
        .C0(n2914), .Y(n2916) );
  NAND4XL U4001 ( .A(n2919), .B(n2918), .C(n2917), .D(n2916), .Y(n2920) );
  NAND3XL U4002 ( .A(n2925), .B(n2924), .C(n2923), .Y(n1966) );
  AOI22XL U4003 ( .A0(\denoise/first_col_g[3][6] ), .A1(n2811), .B0(
        \denoise/first_col_b[5][6] ), .B1(n2526), .Y(n2937) );
  AOI22XL U4004 ( .A0(\denoise/first_col_b[2][6] ), .A1(n2981), .B0(
        \denoise/first_col_b[4][6] ), .B1(n2987), .Y(n2936) );
  AOI22XL U4005 ( .A0(\denoise/first_col_r[1][6] ), .A1(n2984), .B0(
        \denoise/first_col_g[1][6] ), .B1(n2983), .Y(n2931) );
  AOI22XL U4006 ( .A0(\denoise/first_col_g[5][6] ), .A1(n2980), .B0(n2942), 
        .B1(\denoise/pos7 [6]), .Y(n2929) );
  AOI211XL U4007 ( .A0(\denoise/first_col_b[1][6] ), .A1(n2763), .B0(n2927), 
        .C0(n2926), .Y(n2928) );
  NAND4XL U4008 ( .A(n2931), .B(n2930), .C(n2929), .D(n2928), .Y(n2932) );
  NOR3XL U4009 ( .A(n2934), .B(n2933), .C(n2932), .Y(n2935) );
  NAND3XL U4010 ( .A(n2937), .B(n2936), .C(n2935), .Y(n1965) );
  INVX1 U4011 ( .A(n3518), .Y(n3513) );
  NAND2XL U4012 ( .A(\gain/g_mean_r [13]), .B(n3513), .Y(n2941) );
  OAI22XL U4013 ( .A0(n3598), .A1(n3612), .B0(n3776), .B1(n3637), .Y(n3494) );
  OAI22XL U4014 ( .A0(n3502), .A1(\gain/g_mean_r [2]), .B0(n3594), .B1(n3494), 
        .Y(n3504) );
  OAI221XL U4015 ( .A0(n3598), .A1(\gain/g_mean_r [1]), .B0(n3776), .B1(
        \gain/g_mean_r [5]), .C0(n3502), .Y(n3501) );
  OAI22XL U4016 ( .A0(\gain/N478 ), .A1(n3504), .B0(n3721), .B1(n3491), .Y(
        n2938) );
  OAI211XL U4017 ( .A0(n3598), .A1(n3502), .B0(n2939), .C0(n2938), .Y(n2940)
         );
  OAI211XL U4018 ( .A0(n2562), .A1(n3862), .B0(n2941), .C0(n2940), .Y(n1776)
         );
  AOI22XL U4019 ( .A0(\denoise/first_col_g[4][7] ), .A1(n2979), .B0(n2981), 
        .B1(\denoise/first_col_b[2][7] ), .Y(n2954) );
  AOI22XL U4020 ( .A0(\denoise/first_col_g[2][7] ), .A1(n2982), .B0(
        \denoise/first_col_g[5][7] ), .B1(n2980), .Y(n2953) );
  AOI22XL U4021 ( .A0(n2763), .A1(\denoise/first_col_b[1][7] ), .B0(n2762), 
        .B1(\denoise/first_col_b[0][7] ), .Y(n2947) );
  AOI22XL U4022 ( .A0(\denoise/first_col_r[3][7] ), .A1(n2829), .B0(n2942), 
        .B1(\denoise/pos7 [7]), .Y(n2946) );
  AOI211XL U4023 ( .A0(\denoise/first_col_g[1][7] ), .A1(n2983), .B0(n2944), 
        .C0(n2943), .Y(n2945) );
  NAND4XL U4024 ( .A(n2948), .B(n2947), .C(n2946), .D(n2945), .Y(n2949) );
  NOR3XL U4025 ( .A(n2951), .B(n2950), .C(n2949), .Y(n2952) );
  NAND3XL U4026 ( .A(n2954), .B(n2953), .C(n2952), .Y(n1964) );
  AOI22XL U4027 ( .A0(\denoise/first_col_b[2][4] ), .A1(n2981), .B0(
        \denoise/first_col_b[3][4] ), .B1(n2742), .Y(n2966) );
  AOI22XL U4028 ( .A0(\denoise/first_col_r[5][4] ), .A1(n2986), .B0(
        \denoise/first_col_r[4][4] ), .B1(n2988), .Y(n2965) );
  AOI22XL U4029 ( .A0(\denoise/first_col_r[1][4] ), .A1(n2984), .B0(
        \denoise/first_col_r[0][4] ), .B1(n2786), .Y(n2960) );
  AOI22XL U4030 ( .A0(\denoise/first_col_g[1][4] ), .A1(n2983), .B0(
        \denoise/first_col_b[0][4] ), .B1(n2762), .Y(n2959) );
  AOI22XL U4031 ( .A0(\denoise/first_col_b[5][4] ), .A1(n2526), .B0(n2942), 
        .B1(\denoise/pos7 [4]), .Y(n2958) );
  NAND4XL U4032 ( .A(n2960), .B(n2959), .C(n2958), .D(n2957), .Y(n2961) );
  NOR3XL U4033 ( .A(n2963), .B(n2962), .C(n2961), .Y(n2964) );
  NAND3XL U4034 ( .A(n2966), .B(n2965), .C(n2964), .Y(n1967) );
  AOI22XL U4035 ( .A0(\denoise/first_col_g[5][3] ), .A1(n2980), .B0(
        \denoise/first_col_b[4][3] ), .B1(n2987), .Y(n2978) );
  AOI22XL U4036 ( .A0(\denoise/first_col_r[2][3] ), .A1(n2748), .B0(
        \denoise/first_col_b[5][3] ), .B1(n2526), .Y(n2977) );
  AOI22XL U4037 ( .A0(\denoise/first_col_g[0][3] ), .A1(n2985), .B0(
        \denoise/first_col_b[1][3] ), .B1(n2763), .Y(n2972) );
  AOI22XL U4038 ( .A0(\denoise/first_col_r[1][3] ), .A1(n2984), .B0(
        \denoise/first_col_r[0][3] ), .B1(n2786), .Y(n2971) );
  AOI22XL U4039 ( .A0(\denoise/first_col_g[4][3] ), .A1(n2979), .B0(n2942), 
        .B1(\denoise/pos7 [3]), .Y(n2970) );
  AOI211XL U4040 ( .A0(\denoise/first_col_g[1][3] ), .A1(n2983), .B0(n2968), 
        .C0(n2967), .Y(n2969) );
  NAND4XL U4041 ( .A(n2972), .B(n2971), .C(n2970), .D(n2969), .Y(n2973) );
  NOR3XL U4042 ( .A(n2975), .B(n2974), .C(n2973), .Y(n2976) );
  NAND3XL U4043 ( .A(n2978), .B(n2977), .C(n2976), .Y(n1968) );
  AOI22XL U4044 ( .A0(\denoise/first_col_g[3][0] ), .A1(n2811), .B0(
        \denoise/first_col_g[4][0] ), .B1(n2979), .Y(n3000) );
  AOI22XL U4045 ( .A0(\denoise/first_col_r[2][0] ), .A1(n2748), .B0(
        \denoise/first_col_g[5][0] ), .B1(n2980), .Y(n2999) );
  AOI22XL U4046 ( .A0(\denoise/first_col_r[1][0] ), .A1(n2984), .B0(
        \denoise/first_col_b[0][0] ), .B1(n2762), .Y(n2994) );
  AOI22XL U4047 ( .A0(\denoise/first_col_r[0][0] ), .A1(n2786), .B0(
        \denoise/first_col_g[0][0] ), .B1(n2985), .Y(n2993) );
  AOI22XL U4048 ( .A0(\denoise/first_col_r[5][0] ), .A1(n2986), .B0(n2942), 
        .B1(\denoise/pos7 [0]), .Y(n2992) );
  AOI211XL U4049 ( .A0(\denoise/first_col_b[1][0] ), .A1(n2763), .B0(n2990), 
        .C0(n2989), .Y(n2991) );
  NAND4XL U4050 ( .A(n2994), .B(n2993), .C(n2992), .D(n2991), .Y(n2995) );
  NOR3XL U4051 ( .A(n2997), .B(n2996), .C(n2995), .Y(n2998) );
  NAND3XL U4052 ( .A(n3000), .B(n2999), .C(n2998), .Y(n1971) );
  NAND2XL U4053 ( .A(n2597), .B(\gain/r_mean_r [11]), .Y(n3006) );
  NAND2XL U4054 ( .A(n3587), .B(\gain/r_mean_r [2]), .Y(n3001) );
  OAI211XL U4055 ( .A0(n3587), .A1(n3631), .B0(\gain/N325 ), .C0(n3001), .Y(
        n3002) );
  OAI211XL U4056 ( .A0(\gain/N325 ), .A1(n3004), .B0(n3003), .C0(n3002), .Y(
        n3005) );
  OAI211XL U4057 ( .A0(n2601), .A1(n3737), .B0(n3006), .C0(n3005), .Y(n1794)
         );
  OAI33XL U4058 ( .A0(\gain/N303 ), .A1(n2328), .A2(n3632), .B0(n3590), .B1(
        n3618), .B2(n3587), .Y(n3012) );
  OAI2BB2XL U4059 ( .B0(n3587), .B1(n3008), .A0N(n3007), .A1N(
        \gain/r_mean_r [6]), .Y(n3011) );
  INVXL U4060 ( .A(n3009), .Y(n3010) );
  OAI21XL U4061 ( .A0(n3012), .A1(n3011), .B0(n3010), .Y(n3013) );
  OAI211XL U4062 ( .A0(n3016), .A1(n3015), .B0(n3014), .C0(n3013), .Y(n1798)
         );
  INVX1 U4063 ( .A(n3568), .Y(n3571) );
  AOI222XL U4064 ( .A0(n3104), .A1(n3017), .B0(n3571), .B1(\gain/b_mean_r [0]), 
        .C0(n3585), .C1(\gain/b_mean_r [1]), .Y(n3018) );
  INVXL U4065 ( .A(n3018), .Y(n1723) );
  AOI222XL U4066 ( .A0(n3019), .A1(n3017), .B0(\gain/b_mean_r [8]), .B1(n3585), 
        .C0(n3571), .C1(\gain/b_mean_r [7]), .Y(n3020) );
  INVXL U4067 ( .A(n3020), .Y(n1714) );
  AOI222XL U4068 ( .A0(n3021), .A1(n3017), .B0(\gain/b_mean_r [4]), .B1(n3585), 
        .C0(n3571), .C1(\gain/b_mean_r [3]), .Y(n3022) );
  INVXL U4069 ( .A(n3022), .Y(n1710) );
  INVX1 U4070 ( .A(n3535), .Y(n3538) );
  NAND2XL U4071 ( .A(\gain/G_r [15]), .B(n3755), .Y(n3532) );
  NAND2X1 U4072 ( .A(n3538), .B(n3539), .Y(n3534) );
  AOI211X1 U4073 ( .A0(n3753), .A1(\gain/B_r [15]), .B0(n2560), .C0(n3031), 
        .Y(n3584) );
  NOR2X1 U4074 ( .A(\gain/state_B_r [0]), .B(n3584), .Y(n3581) );
  NAND2XL U4075 ( .A(n3036), .B(n3035), .Y(n3034) );
  NAND2XL U4076 ( .A(\wb/color_r [0]), .B(\wb/color_r [1]), .Y(n3041) );
  NAND2XL U4077 ( .A(n3041), .B(n3920), .Y(n3040) );
  OR2X2 U4078 ( .A(n3039), .B(n3040), .Y(n3121) );
  INVXL U4079 ( .A(n3920), .Y(n3042) );
  NOR2X1 U4080 ( .A(n3042), .B(n3041), .Y(n3046) );
  AOI22XL U4081 ( .A0(\C237/DATA2_2 ), .A1(n3122), .B0(n3046), .B1(
        \wb/value_r [6]), .Y(n3043) );
  AOI22XL U4082 ( .A0(\C237/DATA2_0 ), .A1(n3122), .B0(n3046), .B1(
        \wb/value_r [4]), .Y(n3044) );
  AOI22XL U4083 ( .A0(\C237/DATA2_1 ), .A1(n3122), .B0(n3046), .B1(
        \wb/value_r [5]), .Y(n3045) );
  AOI22XL U4084 ( .A0(\C237/DATA2_3 ), .A1(n3122), .B0(n3046), .B1(
        \wb/value_r [7]), .Y(n3047) );
  CLKINVX1 U4085 ( .A(n3033), .Y(n3580) );
  NAND2XL U4086 ( .A(n3559), .B(\gain/K_mean_r [8]), .Y(n3050) );
  ADDFX1 U4087 ( .A(\gain/b_mean_r [10]), .B(n3747), .CI(n3052), .CO(n3056), 
        .S(n3053) );
  NAND2XL U4088 ( .A(n3559), .B(\gain/K_mean_r [10]), .Y(n3054) );
  NAND2XL U4089 ( .A(n3017), .B(\gain/b_mean_r [11]), .Y(n3058) );
  NAND2XL U4090 ( .A(n3064), .B(n3063), .Y(n3062) );
  NAND2XL U4091 ( .A(n3071), .B(n3070), .Y(n3069) );
  NAND4XL U4092 ( .A(\gain/B_r [15]), .B(n3585), .C(n3753), .D(n3080), .Y(
        n3081) );
  NAND2XL U4093 ( .A(n3090), .B(n3089), .Y(n3088) );
  XNOR2X1 U4094 ( .A(n3095), .B(\denoise/sum9 [1]), .Y(n3094) );
  OAI22XL U4095 ( .A0(n2597), .A1(n3685), .B0(n3119), .B1(n3897), .Y(n1682) );
  OAI2BB1X1 U4096 ( .A0N(last_col_out_den), .A1N(n2637), .B0(n3102), .Y(n2285)
         );
  OAI22XL U4097 ( .A0(n2597), .A1(n3896), .B0(n3119), .B1(n3688), .Y(n1685) );
  OAI22XL U4098 ( .A0(n2597), .A1(n3897), .B0(n3119), .B1(n3693), .Y(n1683) );
  OAI22XL U4099 ( .A0(n2597), .A1(n3892), .B0(n3119), .B1(n3687), .Y(n1687) );
  OAI22XL U4100 ( .A0(n2597), .A1(n3693), .B0(n3119), .B1(n3896), .Y(n1684) );
  OAI22XL U4101 ( .A0(n2597), .A1(n3688), .B0(n3119), .B1(n3892), .Y(n1686) );
  OAI22XL U4102 ( .A0(n2597), .A1(n3687), .B0(n3119), .B1(n3629), .Y(n1688) );
  OAI22XL U4103 ( .A0(n3103), .A1(n3697), .B0(n2562), .B1(n3900), .Y(n1694) );
  OAI22XL U4104 ( .A0(n3103), .A1(n3900), .B0(n2562), .B1(n3696), .Y(n1695) );
  OAI22XL U4105 ( .A0(n3103), .A1(n3898), .B0(n2562), .B1(n3694), .Y(n1699) );
  OAI22XL U4106 ( .A0(n3103), .A1(n3899), .B0(n2562), .B1(n3695), .Y(n1697) );
  OAI22XL U4107 ( .A0(n3103), .A1(n3695), .B0(n2562), .B1(n3898), .Y(n1698) );
  OAI22XL U4108 ( .A0(n3103), .A1(n3696), .B0(n2562), .B1(n3899), .Y(n1696) );
  OAI22XL U4109 ( .A0(n3103), .A1(n3694), .B0(n2562), .B1(n3906), .Y(n1700) );
  OAI22XL U4110 ( .A0(n3103), .A1(n3905), .B0(n2562), .B1(n3697), .Y(n1693) );
  OAI22XL U4111 ( .A0(n2560), .A1(n3690), .B0(n3585), .B1(n3894), .Y(n1657) );
  OAI22XL U4112 ( .A0(n2560), .A1(n3894), .B0(n3585), .B1(n3691), .Y(n1656) );
  OAI22XL U4113 ( .A0(n2560), .A1(n3689), .B0(n3585), .B1(n3893), .Y(n1659) );
  OAI22XL U4114 ( .A0(n2560), .A1(n3893), .B0(n3585), .B1(n3690), .Y(n1658) );
  OAI22XL U4115 ( .A0(n2560), .A1(n3895), .B0(n3585), .B1(n3692), .Y(n1654) );
  OAI22XL U4116 ( .A0(n2560), .A1(n3691), .B0(n3585), .B1(n3895), .Y(n1655) );
  ADDFX1 U4117 ( .A(n3106), .B(n3105), .CI(n3104), .CO(n2497), .S(n3113) );
  OR2X2 U4118 ( .A(n3606), .B(k_r_out_gain[4]), .Y(n3883) );
  OR2X2 U4119 ( .A(n3606), .B(k_g_out_gain[4]), .Y(n3884) );
  OR2X2 U4120 ( .A(n3606), .B(k_b_out_gain[4]), .Y(n3885) );
  OR2X2 U4121 ( .A(n3114), .B(k_r_out_gain[5]), .Y(n3886) );
  OR2X2 U4122 ( .A(n3114), .B(k_r_out_gain[8]), .Y(n3887) );
  OR2X2 U4123 ( .A(n3114), .B(k_g_out_gain[7]), .Y(n3888) );
  OR2X2 U4124 ( .A(n3114), .B(k_g_out_gain[5]), .Y(n3889) );
  OR2X2 U4125 ( .A(n3114), .B(k_b_out_gain[8]), .Y(n3890) );
  OR2X2 U4126 ( .A(n3114), .B(k_b_out_gain[5]), .Y(n3891) );
  NOR2XL U4127 ( .A(n3722), .B(n3115), .Y(\DP_OP_654J1_124_416/n132 ) );
  NOR2XL U4128 ( .A(n2324), .B(n3116), .Y(\DP_OP_654J1_124_416/n138 ) );
  NOR2XL U4129 ( .A(n2325), .B(n3116), .Y(\DP_OP_654J1_124_416/n139 ) );
  NOR2XL U4130 ( .A(n3722), .B(n3116), .Y(\DP_OP_654J1_124_416/n140 ) );
  NOR2XL U4131 ( .A(n2323), .B(n3117), .Y(\DP_OP_654J1_124_416/n145 ) );
  NOR2XL U4132 ( .A(n2324), .B(n3117), .Y(\DP_OP_654J1_124_416/n146 ) );
  NOR2XL U4133 ( .A(n2325), .B(n3117), .Y(\DP_OP_654J1_124_416/n147 ) );
  NAND2XL U4134 ( .A(n3606), .B(last_col_in), .Y(n3118) );
  OAI21XL U4135 ( .A0(n3864), .A1(n3606), .B0(n3118), .Y(valid_gain_in_wb) );
  NAND2XL U4136 ( .A(n3119), .B(\gain/K_R_tmp [11]), .Y(n3120) );
  OAI21XL U4137 ( .A0(n3119), .A1(n3685), .B0(n3120), .Y(n1681) );
  OAI2BB1X1 U4138 ( .A0N(n3122), .A1N(\C237/DATA2_7 ), .B0(n3121), .Y(
        \wb/value_tmp_2 [7]) );
  OAI2BB1X1 U4139 ( .A0N(n3122), .A1N(\C237/DATA2_4 ), .B0(n3121), .Y(
        \wb/value_tmp_2 [4]) );
  OAI2BB1X1 U4140 ( .A0N(n3122), .A1N(\C237/DATA2_5 ), .B0(n3121), .Y(
        \wb/value_tmp_2 [5]) );
  OAI2BB1X1 U4141 ( .A0N(n3122), .A1N(\C237/DATA2_6 ), .B0(n3121), .Y(
        \wb/value_tmp_2 [6]) );
  NAND2XL U4142 ( .A(n3604), .B(n3701), .Y(n3123) );
  NAND2XL U4143 ( .A(n3136), .B(pixel_out_wb[7]), .Y(n3124) );
  OAI21XL U4144 ( .A0(n3136), .A1(n3876), .B0(n3124), .Y(pixel_in_gamma[7]) );
  NAND2XL U4145 ( .A(n3135), .B(pixel_in_wb[6]), .Y(n3125) );
  OAI21XL U4146 ( .A0(n3135), .A1(n3901), .B0(n3125), .Y(pixel_in_gamma[6]) );
  NAND2XL U4147 ( .A(n3135), .B(pixel_in_wb[5]), .Y(n3126) );
  OAI21XL U4148 ( .A0(n3135), .A1(n3902), .B0(n3126), .Y(pixel_in_gamma[5]) );
  NAND2XL U4149 ( .A(n3135), .B(pixel_in_wb[4]), .Y(n3127) );
  OAI21XL U4150 ( .A0(n3135), .A1(n3871), .B0(n3127), .Y(pixel_in_gamma[4]) );
  NAND2XL U4151 ( .A(n3136), .B(pixel_out_wb[3]), .Y(n3128) );
  OAI21XL U4152 ( .A0(n3136), .A1(n3877), .B0(n3128), .Y(pixel_in_gamma[3]) );
  NAND2XL U4153 ( .A(n3136), .B(pixel_out_wb[2]), .Y(n3129) );
  OAI21XL U4154 ( .A0(n3136), .A1(n3878), .B0(n3129), .Y(pixel_in_gamma[2]) );
  NAND2XL U4155 ( .A(n3135), .B(pixel_in_wb[1]), .Y(n3130) );
  OAI21XL U4156 ( .A0(n3135), .A1(n3903), .B0(n3130), .Y(pixel_in_gamma[1]) );
  OAI21XL U4157 ( .A0(n3136), .A1(n3879), .B0(n3131), .Y(pixel_in_gamma[0]) );
  ADDFX1 U4158 ( .A(\denoise/pos7 [7]), .B(\denoise/pos8 [7]), .CI(
        \denoise/pos9 [7]), .CO(n3132), .S(\intadd_4/B[7] ) );
  OAI2BB2XL U4159 ( .B0(n3136), .B1(n3813), .A0N(n3136), .A1N(
        valid_value_out_wb), .Y(valid_in_gamma) );
  OAI22XL U4160 ( .A0(n3138), .A1(n3628), .B0(n3137), .B1(n3813), .Y(
        valid_in_gain) );
  AOI222XL U4161 ( .A0(n3819), .A1(n3678), .B0(n3819), .B1(n3628), .C0(n3678), 
        .C1(n3628), .Y(n2296) );
  NAND2X1 U4162 ( .A(n2503), .B(\denoise/valid_in_reg ), .Y(n3161) );
  OAI21X1 U4163 ( .A0(\denoise/n_state_1 [1]), .A1(n3161), .B0(n3153), .Y(
        n3151) );
  INVXL U4164 ( .A(n3150), .Y(n3145) );
  NOR2X1 U4165 ( .A(\denoise/n_counter_1 [1]), .B(n3144), .Y(n3157) );
  NAND2XL U4166 ( .A(\denoise/n_state_1 [1]), .B(n3157), .Y(n3158) );
  OAI21XL U4167 ( .A0(\denoise/n_state_1 [1]), .A1(n3157), .B0(n3156), .Y(
        n3147) );
  OAI221XL U4168 ( .A0(n3150), .A1(\denoise/n_counter_1 [2]), .B0(n3145), .B1(
        n3757), .C0(n3147), .Y(n3146) );
  OAI22XL U4169 ( .A0(n3757), .A1(n3151), .B0(n3161), .B1(n3146), .Y(n2283) );
  NOR2XL U4170 ( .A(n3634), .B(n3161), .Y(n3148) );
  OAI21XL U4171 ( .A0(n3148), .A1(\denoise/n_counter_1 [1]), .B0(n3147), .Y(
        n3149) );
  OAI22XL U4172 ( .A0(n2377), .A1(n3151), .B0(n3150), .B1(n3149), .Y(n2282) );
  INVXL U4173 ( .A(n3157), .Y(n3152) );
  OAI21XL U4174 ( .A0(n3153), .A1(n3152), .B0(\denoise/n_state_1 [1]), .Y(
        n3154) );
  OAI21XL U4175 ( .A0(n3156), .A1(n3155), .B0(n3154), .Y(n2280) );
  NAND2XL U4176 ( .A(n3157), .B(\denoise/init_12_last_flag ), .Y(n3160) );
  OAI31XL U4177 ( .A0(n3161), .A1(n3158), .A2(n3870), .B0(
        \denoise/n_state_1 [0]), .Y(n3159) );
  OAI31XL U4178 ( .A0(\denoise/n_state_1 [1]), .A1(n3161), .A2(n3160), .B0(
        n3159), .Y(n2279) );
  OAI211XL U4179 ( .A0(n3621), .A1(n2376), .B0(\denoise/valid_in_reg ), .C0(
        n3610), .Y(n2277) );
  OAI211XL U4180 ( .A0(n3643), .A1(n2375), .B0(\denoise/valid_in_reg ), .C0(
        n2502), .Y(n2276) );
  INVX4 U4181 ( .A(n3299), .Y(n3306) );
  OAI22XL U4182 ( .A0(n3306), .A1(n3855), .B0(n3299), .B1(n3211), .Y(n2273) );
  NAND3XL U4183 ( .A(n3756), .B(\denoise/counter_1 [1]), .C(
        \denoise/counter_1 [0]), .Y(n3163) );
  BUFX2 U4184 ( .A(n3163), .Y(n3288) );
  INVX4 U4185 ( .A(n3165), .Y(n3307) );
  OAI22XL U4186 ( .A0(n3307), .A1(n3625), .B0(n3165), .B1(n3211), .Y(n2272) );
  BUFX4 U4187 ( .A(n3166), .Y(n3324) );
  NOR2XL U4188 ( .A(n3173), .B(n3301), .Y(n3167) );
  INVX4 U4189 ( .A(n3168), .Y(n3308) );
  OAI22XL U4190 ( .A0(n3308), .A1(n3822), .B0(n3168), .B1(n3211), .Y(n2271) );
  NAND3XL U4191 ( .A(\denoise/counter_1 [0]), .B(n3622), .C(n3756), .Y(n3169)
         );
  BUFX2 U4192 ( .A(n3169), .Y(n3295) );
  NOR2XL U4193 ( .A(n3173), .B(n3295), .Y(n3170) );
  INVX4 U4194 ( .A(n3257), .Y(n3309) );
  OAI22XL U4195 ( .A0(n3309), .A1(n3780), .B0(n3257), .B1(n3211), .Y(n2270) );
  NOR3XL U4196 ( .A(\denoise/counter_1 [1]), .B(\denoise/counter_1 [2]), .C(
        \denoise/counter_1 [0]), .Y(n3171) );
  OAI2BB2XL U4197 ( .B0(n2314), .B1(n3663), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][0] ), .Y(n3178) );
  OAI21XL U4198 ( .A0(n3295), .A1(n3780), .B0(n3176), .Y(n3177) );
  AOI211X2 U4199 ( .A0(n3304), .A1(\denoise/second_col_r[0][0] ), .B0(n3178), 
        .C0(n3177), .Y(n3179) );
  INVX4 U4200 ( .A(n3175), .Y(n3311) );
  NAND2X1 U4201 ( .A(\denoise/n_color_2 [0]), .B(n2375), .Y(n3188) );
  NOR2X1 U4202 ( .A(n3326), .B(n3188), .Y(n3313) );
  INVX4 U4203 ( .A(n3312), .Y(n3317) );
  OAI22XL U4204 ( .A0(n3317), .A1(n3662), .B0(n3312), .B1(n3211), .Y(n2262) );
  NOR2XL U4205 ( .A(n3301), .B(n3188), .Y(n3182) );
  INVX4 U4206 ( .A(n3183), .Y(n3318) );
  OAI22XL U4207 ( .A0(n3318), .A1(n3681), .B0(n3183), .B1(n3211), .Y(n2260) );
  NOR2XL U4208 ( .A(n3288), .B(n3188), .Y(n3184) );
  INVX4 U4209 ( .A(n3185), .Y(n3319) );
  NOR2XL U4210 ( .A(n3204), .B(n3188), .Y(n3186) );
  NOR3XL U4211 ( .A(\denoise/counter_1 [1]), .B(n2314), .C(n3188), .Y(n3189)
         );
  INVX4 U4212 ( .A(n3190), .Y(n3322) );
  OAI22XL U4213 ( .A0(n3322), .A1(n3792), .B0(n3190), .B1(n3211), .Y(n2257) );
  AOI22XL U4214 ( .A0(n3192), .A1(\denoise/second_col_g[1][0] ), .B0(n3324), 
        .B1(\denoise/second_col_g[2][0] ), .Y(n3193) );
  OAI21XL U4215 ( .A0(n3326), .A1(n3662), .B0(n3193), .Y(n3194) );
  AOI211X2 U4216 ( .A0(n3191), .A1(\denoise/second_col_g[3][0] ), .B0(n3195), 
        .C0(n3194), .Y(n3196) );
  NAND2X1 U4217 ( .A(\denoise/n_color_2 [1]), .B(n2376), .Y(n3207) );
  INVX4 U4218 ( .A(n3198), .Y(n3329) );
  OAI22XL U4219 ( .A0(n3329), .A1(n3626), .B0(n3198), .B1(n3211), .Y(n2250) );
  NOR2XL U4220 ( .A(n3295), .B(n3207), .Y(n3199) );
  INVX4 U4221 ( .A(n3200), .Y(n3330) );
  OAI22XL U4222 ( .A0(n3330), .A1(n3850), .B0(n3200), .B1(n3211), .Y(n2249) );
  NOR2XL U4223 ( .A(n3301), .B(n3207), .Y(n3201) );
  BUFX4 U4224 ( .A(n3201), .Y(n3331) );
  OAI22XL U4225 ( .A0(n3331), .A1(n3823), .B0(n3202), .B1(n3211), .Y(n2248) );
  NOR2XL U4226 ( .A(n3288), .B(n3207), .Y(n3203) );
  INVX4 U4227 ( .A(n3266), .Y(n3332) );
  OAI2BB2XL U4228 ( .B0(n3206), .B1(n3211), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][0] ), .Y(n2246) );
  NOR3XL U4229 ( .A(\denoise/counter_1 [1]), .B(n3208), .C(n3207), .Y(n3209)
         );
  INVX4 U4230 ( .A(n3210), .Y(n3334) );
  OAI22XL U4231 ( .A0(n3334), .A1(n3771), .B0(n3210), .B1(n3211), .Y(n2245) );
  OAI2BB2XL U4232 ( .B0(n2314), .B1(n3771), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][0] ), .Y(n3214) );
  AOI22XL U4233 ( .A0(n3191), .A1(\denoise/second_col_b[3][0] ), .B0(n3324), 
        .B1(\denoise/second_col_b[2][0] ), .Y(n3212) );
  OAI21XL U4234 ( .A0(n3326), .A1(n3626), .B0(n3212), .Y(n3213) );
  AOI211X2 U4235 ( .A0(n3192), .A1(\denoise/second_col_b[1][0] ), .B0(n3214), 
        .C0(n3213), .Y(n3215) );
  OAI22XL U4236 ( .A0(n3306), .A1(n3856), .B0(n3299), .B1(n3224), .Y(n2236) );
  OAI22XL U4237 ( .A0(n3307), .A1(n3781), .B0(n3165), .B1(n3224), .Y(n2235) );
  OAI22XL U4238 ( .A0(n3308), .A1(n3840), .B0(n3168), .B1(n3224), .Y(n2234) );
  OAI2BB2XL U4239 ( .B0(n2314), .B1(n3664), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][1] ), .Y(n3218) );
  AOI22XL U4240 ( .A0(n3304), .A1(\denoise/second_col_r[0][1] ), .B0(n3324), 
        .B1(\denoise/second_col_r[2][1] ), .Y(n3216) );
  OAI21XL U4241 ( .A0(n3288), .A1(n3781), .B0(n3216), .Y(n3217) );
  AOI211X2 U4242 ( .A0(n3192), .A1(\denoise/second_col_r[1][1] ), .B0(n3218), 
        .C0(n3217), .Y(n3219) );
  OAI22XL U4243 ( .A0(n3313), .A1(n3661), .B0(n3312), .B1(n3224), .Y(n2225) );
  OAI2BB2XL U4244 ( .B0(n3181), .B1(n3224), .A0N(n3181), .A1N(
        \denoise/second_col_g[1][1] ), .Y(n2224) );
  OAI22XL U4245 ( .A0(n3318), .A1(n3841), .B0(n3183), .B1(n3224), .Y(n2223) );
  OAI22XL U4246 ( .A0(n3322), .A1(n3793), .B0(n3190), .B1(n3224), .Y(n2220) );
  OAI2BB2XL U4247 ( .B0(n2314), .B1(n3793), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][1] ), .Y(n3222) );
  AOI22XL U4248 ( .A0(n3191), .A1(\denoise/second_col_g[3][1] ), .B0(n3324), 
        .B1(\denoise/second_col_g[2][1] ), .Y(n3220) );
  OAI21XL U4249 ( .A0(n3326), .A1(n3661), .B0(n3220), .Y(n3221) );
  AOI211X2 U4250 ( .A0(n3192), .A1(\denoise/second_col_g[1][1] ), .B0(n3222), 
        .C0(n3221), .Y(n3223) );
  OAI2BB2XL U4251 ( .B0(n3200), .B1(n3224), .A0N(n3200), .A1N(
        \denoise/second_col_b[1][1] ), .Y(n2212) );
  OAI2BB2XL U4252 ( .B0(n3202), .B1(n3224), .A0N(n3202), .A1N(
        \denoise/second_col_b[2][1] ), .Y(n2211) );
  OAI22XL U4253 ( .A0(n3332), .A1(n3658), .B0(n3266), .B1(n3224), .Y(n2210) );
  OAI22XL U4254 ( .A0(n3334), .A1(n3773), .B0(n3210), .B1(n3224), .Y(n2208) );
  OAI2BB2XL U4255 ( .B0(n2314), .B1(n3773), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][1] ), .Y(n3227) );
  AOI22XL U4256 ( .A0(n3192), .A1(\denoise/second_col_b[1][1] ), .B0(n3304), 
        .B1(\denoise/second_col_b[0][1] ), .Y(n3225) );
  OAI21XL U4257 ( .A0(n3288), .A1(n3658), .B0(n3225), .Y(n3226) );
  AOI211X2 U4258 ( .A0(n3324), .A1(\denoise/second_col_b[2][1] ), .B0(n3227), 
        .C0(n3226), .Y(n3228) );
  OAI22XL U4259 ( .A0(n3306), .A1(n3682), .B0(n3299), .B1(n3237), .Y(n2199) );
  OAI22XL U4260 ( .A0(n3307), .A1(n3787), .B0(n3165), .B1(n3237), .Y(n2198) );
  OAI22XL U4261 ( .A0(n3308), .A1(n3824), .B0(n3168), .B1(n3237), .Y(n2197) );
  OAI22XL U4262 ( .A0(n3309), .A1(n3857), .B0(n3257), .B1(n3237), .Y(n2196) );
  OAI2BB2XL U4263 ( .B0(n2314), .B1(n3665), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][2] ), .Y(n3231) );
  AOI22XL U4264 ( .A0(n3304), .A1(\denoise/second_col_r[0][2] ), .B0(n3324), 
        .B1(\denoise/second_col_r[2][2] ), .Y(n3229) );
  OAI21XL U4265 ( .A0(n3288), .A1(n3787), .B0(n3229), .Y(n3230) );
  AOI211X2 U4266 ( .A0(n3192), .A1(\denoise/second_col_r[1][2] ), .B0(n3231), 
        .C0(n3230), .Y(n3232) );
  OAI22XL U4267 ( .A0(n3317), .A1(n3660), .B0(n3312), .B1(n3237), .Y(n2188) );
  OAI2BB2XL U4268 ( .B0(n3181), .B1(n3237), .A0N(n3181), .A1N(
        \denoise/second_col_g[1][2] ), .Y(n2187) );
  OAI22XL U4269 ( .A0(n3318), .A1(n3842), .B0(n3183), .B1(n3237), .Y(n2186) );
  OAI22XL U4270 ( .A0(n3322), .A1(n3794), .B0(n3190), .B1(n3237), .Y(n2183) );
  OAI2BB2XL U4271 ( .B0(n2314), .B1(n3794), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][2] ), .Y(n3235) );
  AOI22XL U4272 ( .A0(n3191), .A1(\denoise/second_col_g[3][2] ), .B0(n3324), 
        .B1(\denoise/second_col_g[2][2] ), .Y(n3233) );
  OAI21XL U4273 ( .A0(n3326), .A1(n3660), .B0(n3233), .Y(n3234) );
  AOI211X2 U4274 ( .A0(n3192), .A1(\denoise/second_col_g[1][2] ), .B0(n3235), 
        .C0(n3234), .Y(n3236) );
  OAI22XL U4275 ( .A0(n3329), .A1(n3851), .B0(n3198), .B1(n3237), .Y(n2176) );
  OAI22XL U4276 ( .A0(n3331), .A1(n3782), .B0(n3202), .B1(n3237), .Y(n2174) );
  OAI22XL U4277 ( .A0(n3332), .A1(n3843), .B0(n3266), .B1(n3237), .Y(n2173) );
  OAI2BB2XL U4278 ( .B0(n3206), .B1(n3237), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][2] ), .Y(n2172) );
  OAI22XL U4279 ( .A0(n3334), .A1(n3617), .B0(n3210), .B1(n3237), .Y(n2171) );
  AOI22XL U4280 ( .A0(n3192), .A1(\denoise/second_col_b[1][2] ), .B0(n3191), 
        .B1(\denoise/second_col_b[3][2] ), .Y(n3238) );
  OAI21XL U4281 ( .A0(n3301), .A1(n3782), .B0(n3238), .Y(n3239) );
  AOI211X2 U4282 ( .A0(n3304), .A1(\denoise/second_col_b[0][2] ), .B0(n3240), 
        .C0(n3239), .Y(n3241) );
  OAI22XL U4283 ( .A0(n3307), .A1(n3656), .B0(n3165), .B1(n3250), .Y(n2161) );
  OAI22XL U4284 ( .A0(n3308), .A1(n3844), .B0(n3168), .B1(n3250), .Y(n2160) );
  OAI22XL U4285 ( .A0(n3311), .A1(n3789), .B0(n3175), .B1(n3250), .Y(n2158) );
  OAI2BB2XL U4286 ( .B0(n2314), .B1(n3666), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][3] ), .Y(n3244) );
  OAI21XL U4287 ( .A0(n3326), .A1(n3789), .B0(n3242), .Y(n3243) );
  AOI211X2 U4288 ( .A0(n3192), .A1(\denoise/second_col_r[1][3] ), .B0(n3244), 
        .C0(n3243), .Y(n3245) );
  OAI22XL U4289 ( .A0(n3317), .A1(n3652), .B0(n3312), .B1(n3250), .Y(n2151) );
  OAI2BB2XL U4290 ( .B0(n3181), .B1(n3250), .A0N(n3181), .A1N(
        \denoise/second_col_g[1][3] ), .Y(n2150) );
  OAI22XL U4291 ( .A0(n3318), .A1(n3852), .B0(n3183), .B1(n3250), .Y(n2149) );
  OAI22XL U4292 ( .A0(n3319), .A1(n3783), .B0(n3185), .B1(n3250), .Y(n2148) );
  OAI22XL U4293 ( .A0(n3322), .A1(n3795), .B0(n3190), .B1(n3250), .Y(n2146) );
  OAI2BB2XL U4294 ( .B0(n2314), .B1(n3795), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][3] ), .Y(n3248) );
  OAI21XL U4295 ( .A0(n3288), .A1(n3783), .B0(n3246), .Y(n3247) );
  AOI211X2 U4296 ( .A0(n3324), .A1(\denoise/second_col_g[2][3] ), .B0(n3248), 
        .C0(n3247), .Y(n3249) );
  OAI22XL U4297 ( .A0(n3329), .A1(n3778), .B0(n3198), .B1(n3250), .Y(n2139) );
  OAI22XL U4298 ( .A0(n3332), .A1(n3825), .B0(n3266), .B1(n3250), .Y(n2136) );
  OAI2BB2XL U4299 ( .B0(n3206), .B1(n3250), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][3] ), .Y(n2135) );
  OAI22XL U4300 ( .A0(n3334), .A1(n3774), .B0(n3210), .B1(n3250), .Y(n2134) );
  AOI22XL U4301 ( .A0(n3192), .A1(\denoise/second_col_b[1][3] ), .B0(n3191), 
        .B1(\denoise/second_col_b[3][3] ), .Y(n3251) );
  OAI21XL U4302 ( .A0(n3326), .A1(n3778), .B0(n3251), .Y(n3252) );
  AOI211X2 U4303 ( .A0(n3324), .A1(\denoise/second_col_b[2][3] ), .B0(n3253), 
        .C0(n3252), .Y(n3254) );
  INVX3 U4304 ( .A(\denoise/pos9 [4]), .Y(n3267) );
  OAI22XL U4305 ( .A0(n3256), .A1(n3667), .B0(n3255), .B1(n3267), .Y(n2126) );
  OAI22XL U4306 ( .A0(n3307), .A1(n3826), .B0(n3165), .B1(n3267), .Y(n2124) );
  OAI22XL U4307 ( .A0(n3308), .A1(n3788), .B0(n3168), .B1(n3267), .Y(n2123) );
  OAI22XL U4308 ( .A0(n3309), .A1(n3654), .B0(n3257), .B1(n3267), .Y(n2122) );
  OAI22XL U4309 ( .A0(n3311), .A1(n3859), .B0(n3175), .B1(n3267), .Y(n2121) );
  OAI21XL U4310 ( .A0(n3301), .A1(n3788), .B0(n3258), .Y(n3259) );
  AOI211X2 U4311 ( .A0(n3304), .A1(\denoise/second_col_r[0][4] ), .B0(n3260), 
        .C0(n3259), .Y(n3261) );
  OAI22XL U4312 ( .A0(n3317), .A1(n3653), .B0(n3312), .B1(n3267), .Y(n2114) );
  OAI22XL U4313 ( .A0(n3180), .A1(n3806), .B0(n3181), .B1(n3267), .Y(n2113) );
  OAI22XL U4314 ( .A0(n3319), .A1(n3858), .B0(n3185), .B1(n3267), .Y(n2111) );
  OAI2BB2XL U4315 ( .B0(n3187), .B1(n3267), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][4] ), .Y(n2110) );
  OAI22XL U4316 ( .A0(n3322), .A1(n3796), .B0(n3190), .B1(n3267), .Y(n2109) );
  OAI2BB2XL U4317 ( .B0(n2314), .B1(n3796), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][4] ), .Y(n3264) );
  OAI21XL U4318 ( .A0(n3295), .A1(n3806), .B0(n3262), .Y(n3263) );
  AOI211X2 U4319 ( .A0(n3324), .A1(\denoise/second_col_g[2][4] ), .B0(n3264), 
        .C0(n3263), .Y(n3265) );
  OAI22XL U4320 ( .A0(n3329), .A1(n3860), .B0(n3198), .B1(n3267), .Y(n2102) );
  OAI22XL U4321 ( .A0(n3330), .A1(n3659), .B0(n3200), .B1(n3267), .Y(n2101) );
  OAI22XL U4322 ( .A0(n3331), .A1(n3853), .B0(n3202), .B1(n3267), .Y(n2100) );
  OAI22XL U4323 ( .A0(n3332), .A1(n3804), .B0(n3266), .B1(n3267), .Y(n2099) );
  OAI22XL U4324 ( .A0(n3334), .A1(n3623), .B0(n3210), .B1(n3267), .Y(n2097) );
  OAI2BB2XL U4325 ( .B0(n2314), .B1(n3623), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][4] ), .Y(n3270) );
  OAI21XL U4326 ( .A0(n3295), .A1(n3659), .B0(n3268), .Y(n3269) );
  AOI211X2 U4327 ( .A0(n3304), .A1(\denoise/second_col_b[0][4] ), .B0(n3270), 
        .C0(n3269), .Y(n3271) );
  OAI22XL U4328 ( .A0(n3309), .A1(n3657), .B0(n3257), .B1(n2318), .Y(n2085) );
  OAI22XL U4329 ( .A0(n3311), .A1(n3784), .B0(n3175), .B1(n2318), .Y(n2084) );
  OAI2BB2XL U4330 ( .B0(n2314), .B1(n3797), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][5] ), .Y(n3274) );
  OAI21XL U4331 ( .A0(n3326), .A1(n3784), .B0(n3272), .Y(n3273) );
  AOI211X2 U4332 ( .A0(n3324), .A1(\denoise/second_col_r[2][5] ), .B0(n3274), 
        .C0(n3273), .Y(n3275) );
  OAI22XL U4333 ( .A0(n3317), .A1(n3854), .B0(n3312), .B1(n2318), .Y(n2077) );
  OAI22XL U4334 ( .A0(n3318), .A1(n3790), .B0(n3183), .B1(n2318), .Y(n2075) );
  OAI22XL U4335 ( .A0(n3319), .A1(n3861), .B0(n3185), .B1(n2318), .Y(n2074) );
  OAI22XL U4336 ( .A0(n3322), .A1(n3798), .B0(n3190), .B1(n2318), .Y(n2072) );
  OAI2BB2XL U4337 ( .B0(n2314), .B1(n3798), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][5] ), .Y(n3278) );
  AOI22XL U4338 ( .A0(n3192), .A1(\denoise/second_col_g[1][5] ), .B0(n3191), 
        .B1(\denoise/second_col_g[3][5] ), .Y(n3276) );
  OAI21XL U4339 ( .A0(n3301), .A1(n3790), .B0(n3276), .Y(n3277) );
  AOI211X2 U4340 ( .A0(n3304), .A1(\denoise/second_col_g[0][5] ), .B0(n3278), 
        .C0(n3277), .Y(n3279) );
  OAI22XL U4341 ( .A0(n3329), .A1(n3627), .B0(n3198), .B1(n2318), .Y(n2065) );
  OAI22XL U4342 ( .A0(n3332), .A1(n3827), .B0(n3266), .B1(n2318), .Y(n2062) );
  OAI22XL U4343 ( .A0(n3334), .A1(n3651), .B0(n3210), .B1(n2318), .Y(n2060) );
  OAI2BB2XL U4344 ( .B0(n2314), .B1(n3651), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][5] ), .Y(n3282) );
  AOI22XL U4345 ( .A0(n3192), .A1(\denoise/second_col_b[1][5] ), .B0(n3191), 
        .B1(\denoise/second_col_b[3][5] ), .Y(n3280) );
  OAI21XL U4346 ( .A0(n3326), .A1(n3627), .B0(n3280), .Y(n3281) );
  AOI211X2 U4347 ( .A0(n3324), .A1(\denoise/second_col_b[2][5] ), .B0(n3282), 
        .C0(n3281), .Y(n3283) );
  OAI22XL U4348 ( .A0(n3307), .A1(n3846), .B0(n3165), .B1(n3293), .Y(n2050) );
  OAI22XL U4349 ( .A0(n3308), .A1(n3785), .B0(n3168), .B1(n3293), .Y(n2049) );
  OAI22XL U4350 ( .A0(n3309), .A1(n3777), .B0(n3257), .B1(n3293), .Y(n2048) );
  OAI2BB2XL U4351 ( .B0(n2314), .B1(n3799), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][6] ), .Y(n3286) );
  OAI21XL U4352 ( .A0(n3301), .A1(n3785), .B0(n3284), .Y(n3285) );
  AOI211X2 U4353 ( .A0(n3304), .A1(\denoise/second_col_r[0][6] ), .B0(n3286), 
        .C0(n3285), .Y(n3287) );
  OAI22XL U4354 ( .A0(n3317), .A1(n3779), .B0(n3312), .B1(n3293), .Y(n2040) );
  OAI2BB2XL U4355 ( .B0(n3181), .B1(n3293), .A0N(n3181), .A1N(
        \denoise/second_col_g[1][6] ), .Y(n2039) );
  OAI22XL U4356 ( .A0(n3318), .A1(n3845), .B0(n3183), .B1(n3293), .Y(n2038) );
  OAI22XL U4357 ( .A0(n3319), .A1(n3655), .B0(n3185), .B1(n3293), .Y(n2037) );
  OAI22XL U4358 ( .A0(n3322), .A1(n3800), .B0(n3190), .B1(n3293), .Y(n2035) );
  OAI2BB2XL U4359 ( .B0(n2314), .B1(n3800), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][6] ), .Y(n3291) );
  OAI21XL U4360 ( .A0(n3326), .A1(n3779), .B0(n3289), .Y(n3290) );
  AOI211X2 U4361 ( .A0(n3192), .A1(\denoise/second_col_g[1][6] ), .B0(n3291), 
        .C0(n3290), .Y(n3292) );
  OAI22XL U4362 ( .A0(n3329), .A1(n3624), .B0(n3198), .B1(n3293), .Y(n2028) );
  OAI22XL U4363 ( .A0(n3330), .A1(n3791), .B0(n3200), .B1(n3293), .Y(n2027) );
  OAI2BB2XL U4364 ( .B0(n3202), .B1(n3293), .A0N(n3202), .A1N(
        \denoise/second_col_b[2][6] ), .Y(n2026) );
  OAI22XL U4365 ( .A0(n3332), .A1(n3828), .B0(n3266), .B1(n3293), .Y(n2025) );
  OAI2BB2XL U4366 ( .B0(n3206), .B1(n3293), .A0N(n3206), .A1N(
        \denoise/second_col_b[4][6] ), .Y(n2024) );
  OAI22XL U4367 ( .A0(n3334), .A1(n3775), .B0(n3210), .B1(n3293), .Y(n2023) );
  OAI2BB2XL U4368 ( .B0(n2314), .B1(n3775), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][6] ), .Y(n3297) );
  OAI21XL U4369 ( .A0(n3295), .A1(n3791), .B0(n3294), .Y(n3296) );
  AOI211X2 U4370 ( .A0(n3324), .A1(\denoise/second_col_b[2][6] ), .B0(n3297), 
        .C0(n3296), .Y(n3298) );
  OAI22XL U4371 ( .A0(n3307), .A1(n3829), .B0(n3165), .B1(n2329), .Y(n2013) );
  OAI22XL U4372 ( .A0(n3308), .A1(n3786), .B0(n3168), .B1(n2329), .Y(n2012) );
  OAI2BB2XL U4373 ( .B0(n2314), .B1(n3801), .A0N(n3323), .A1N(
        \denoise/second_col_r[4][7] ), .Y(n3303) );
  AOI22XL U4374 ( .A0(n3192), .A1(\denoise/second_col_r[1][7] ), .B0(n3191), 
        .B1(\denoise/second_col_r[3][7] ), .Y(n3300) );
  OAI21XL U4375 ( .A0(n3301), .A1(n3786), .B0(n3300), .Y(n3302) );
  AOI211X2 U4376 ( .A0(n3304), .A1(\denoise/second_col_r[0][7] ), .B0(n3303), 
        .C0(n3302), .Y(n3310) );
  OAI22XL U4377 ( .A0(n3313), .A1(n3807), .B0(n3312), .B1(n2329), .Y(n2003) );
  OAI22XL U4378 ( .A0(n3319), .A1(n3847), .B0(n3185), .B1(n2329), .Y(n2000) );
  OAI2BB2XL U4379 ( .B0(n3187), .B1(n2329), .A0N(n3187), .A1N(
        \denoise/second_col_g[4][7] ), .Y(n1999) );
  OAI22XL U4380 ( .A0(n3322), .A1(n3802), .B0(n3190), .B1(n2329), .Y(n1998) );
  OAI2BB2XL U4381 ( .B0(n2314), .B1(n3802), .A0N(n3323), .A1N(
        \denoise/second_col_g[4][7] ), .Y(n3316) );
  AOI22XL U4382 ( .A0(n3192), .A1(\denoise/second_col_g[1][7] ), .B0(n3191), 
        .B1(\denoise/second_col_g[3][7] ), .Y(n3314) );
  OAI21XL U4383 ( .A0(n3326), .A1(n3807), .B0(n3314), .Y(n3315) );
  AOI211X2 U4384 ( .A0(n3324), .A1(\denoise/second_col_g[2][7] ), .B0(n3316), 
        .C0(n3315), .Y(n3321) );
  OAI22XL U4385 ( .A0(n3329), .A1(n3808), .B0(n3198), .B1(n2329), .Y(n1991) );
  OAI2BB2XL U4386 ( .B0(n3202), .B1(n2329), .A0N(n3202), .A1N(
        \denoise/second_col_b[2][7] ), .Y(n1989) );
  OAI2BB2XL U4387 ( .B0(n3266), .B1(n2329), .A0N(n3266), .A1N(
        \denoise/second_col_b[3][7] ), .Y(n1988) );
  OAI22XL U4388 ( .A0(n3334), .A1(n3772), .B0(n3210), .B1(n2329), .Y(n1986) );
  OAI2BB2XL U4389 ( .B0(n2314), .B1(n3772), .A0N(n3323), .A1N(
        \denoise/second_col_b[4][7] ), .Y(n3328) );
  AOI22XL U4390 ( .A0(n3324), .A1(\denoise/second_col_b[2][7] ), .B0(n3192), 
        .B1(\denoise/second_col_b[1][7] ), .Y(n3325) );
  OAI21XL U4391 ( .A0(n3326), .A1(n3808), .B0(n3325), .Y(n3327) );
  AOI211X2 U4392 ( .A0(n3191), .A1(\denoise/second_col_b[3][7] ), .B0(n3328), 
        .C0(n3327), .Y(n3333) );
  OAI2BB2XL U4393 ( .B0(n3341), .B1(n3668), .A0N(n3341), .A1N(
        \denoise/sum3_b [0]), .Y(n1963) );
  OAI2BB2XL U4394 ( .B0(n3340), .B1(n3668), .A0N(n3340), .A1N(
        \denoise/new_sum6 [0]), .Y(n1957) );
  OAI2BB2XL U4395 ( .B0(n3340), .B1(n3669), .A0N(n3340), .A1N(
        \denoise/new_sum6 [1]), .Y(n1951) );
  OAI2BB2XL U4396 ( .B0(n3340), .B1(n3670), .A0N(n3340), .A1N(
        \denoise/new_sum6 [2]), .Y(n1943) );
  OAI2BB2XL U4397 ( .B0(n3341), .B1(n3670), .A0N(n3341), .A1N(
        \denoise/sum3_b [2]), .Y(n1942) );
  OAI2BB2XL U4398 ( .B0(n3340), .B1(n3671), .A0N(n3340), .A1N(
        \denoise/new_sum6 [3]), .Y(n1935) );
  OAI2BB2XL U4399 ( .B0(n3341), .B1(n3671), .A0N(n3341), .A1N(
        \denoise/sum3_b [3]), .Y(n1934) );
  OAI2BB2XL U4400 ( .B0(n3340), .B1(n3672), .A0N(n3340), .A1N(
        \denoise/new_sum6 [4]), .Y(n1927) );
  OAI2BB2XL U4401 ( .B0(n3341), .B1(n3672), .A0N(n3341), .A1N(
        \denoise/sum3_b [4]), .Y(n1926) );
  OAI2BB2XL U4402 ( .B0(n3341), .B1(n3673), .A0N(n3341), .A1N(
        \denoise/sum3_b [5]), .Y(n1918) );
  OAI2BB2XL U4403 ( .B0(n3340), .B1(n3674), .A0N(n3340), .A1N(
        \denoise/new_sum6 [6]), .Y(n1911) );
  OAI2BB2XL U4404 ( .B0(n3341), .B1(n3674), .A0N(n3341), .A1N(
        \denoise/sum3_b [6]), .Y(n1910) );
  OAI2BB2XL U4405 ( .B0(n3340), .B1(n3675), .A0N(n3340), .A1N(
        \denoise/new_sum6 [7]), .Y(n1903) );
  OAI2BB2XL U4406 ( .B0(n3341), .B1(n3675), .A0N(n3341), .A1N(
        \denoise/sum3_b [7]), .Y(n1902) );
  OAI2BB2XL U4407 ( .B0(n3340), .B1(n3676), .A0N(n3340), .A1N(
        \denoise/new_sum6 [8]), .Y(n1895) );
  OAI2BB2XL U4408 ( .B0(n3341), .B1(n3676), .A0N(n3341), .A1N(
        \denoise/sum3_b [8]), .Y(n1894) );
  OAI2BB2XL U4409 ( .B0(n3340), .B1(n3677), .A0N(n3340), .A1N(
        \denoise/new_sum6 [9]), .Y(n1887) );
  OAI2BB2XL U4410 ( .B0(n3341), .B1(n3677), .A0N(n3341), .A1N(
        \denoise/sum3_b [9]), .Y(n1886) );
  OAI21XL U4411 ( .A0(n3814), .A1(n3359), .B0(\mean/sum_r [0]), .Y(n3342) );
  OAI31XL U4412 ( .A0(n3814), .A1(\mean/sum_r [0]), .A2(n3359), .B0(n3342), 
        .Y(n1883) );
  NOR3BX1 U4413 ( .AN(n3344), .B(n3343), .C(n3359), .Y(n3345) );
  NOR3BX1 U4414 ( .AN(n3347), .B(n3346), .C(n3359), .Y(n3348) );
  NOR3BX1 U4415 ( .AN(n3350), .B(n3349), .C(n3359), .Y(n3351) );
  NOR3BX1 U4416 ( .AN(n3353), .B(n3352), .C(n3359), .Y(n3354) );
  NOR3BX1 U4417 ( .AN(n3356), .B(n3355), .C(n3359), .Y(n3357) );
  NOR2XL U4418 ( .A(\mean/value_r [6]), .B(n3360), .Y(n3358) );
  OAI21XL U4419 ( .A0(n3364), .A1(n3363), .B0(\mean/sum_r [7]), .Y(n3362) );
  OAI21XL U4420 ( .A0(n3814), .A1(n3401), .B0(\mean/sum_g [0]), .Y(n3385) );
  OAI31XL U4421 ( .A0(n3814), .A1(\mean/sum_g [0]), .A2(n3401), .B0(n3385), 
        .Y(n1855) );
  NOR3BX1 U4422 ( .AN(n3387), .B(n3386), .C(n3401), .Y(n3388) );
  NOR3BX1 U4423 ( .AN(n3390), .B(n3389), .C(n3401), .Y(n3391) );
  NOR3BX1 U4424 ( .AN(n3393), .B(n3392), .C(n3401), .Y(n3394) );
  NOR3BX1 U4425 ( .AN(n3396), .B(n3395), .C(n3401), .Y(n3397) );
  NOR3BX1 U4426 ( .AN(n3399), .B(n3398), .C(n3401), .Y(n3400) );
  NOR3BX1 U4427 ( .AN(n3403), .B(n3402), .C(n3401), .Y(n3404) );
  OAI21XL U4428 ( .A0(n3407), .A1(n3406), .B0(\mean/sum_g [7]), .Y(n3405) );
  OAI21XL U4429 ( .A0(n3814), .A1(n2517), .B0(\mean/sum_b [0]), .Y(n3428) );
  OAI31XL U4430 ( .A0(n3814), .A1(\mean/sum_b [0]), .A2(n2517), .B0(n3428), 
        .Y(n1826) );
  NOR3BX1 U4431 ( .AN(n3430), .B(n3429), .C(n2517), .Y(n3431) );
  NOR3BX1 U4432 ( .AN(n3433), .B(n3432), .C(n2517), .Y(n3434) );
  NOR3BX1 U4433 ( .AN(n3436), .B(n3435), .C(n2517), .Y(n3437) );
  NOR3BX1 U4434 ( .AN(n3439), .B(n3438), .C(n2517), .Y(n3440) );
  NOR3BX1 U4435 ( .AN(n3442), .B(n3441), .C(n2517), .Y(n3443) );
  NOR3BX1 U4436 ( .AN(n3445), .B(n3444), .C(n2517), .Y(n3446) );
  OAI21XL U4437 ( .A0(n3449), .A1(n3448), .B0(\mean/sum_b [7]), .Y(n3447) );
  NAND2XL U4438 ( .A(n3470), .B(n3611), .Y(n3586) );
  INVX1 U4439 ( .A(n3471), .Y(n3488) );
  OAI21XL U4440 ( .A0(n2601), .A1(n3758), .B0(n3488), .Y(n1799) );
  NAND2XL U4441 ( .A(n2328), .B(n3611), .Y(n3589) );
  OAI22XL U4442 ( .A0(\gain/r_mean_r [1]), .A1(n3589), .B0(\gain/r_mean_r [3]), 
        .B1(n3472), .Y(n3476) );
  OAI31XL U4443 ( .A0(n3488), .A1(n3476), .A2(n3475), .B0(n3474), .Y(n1796) );
  OAI31XL U4444 ( .A0(n3478), .A1(n2328), .A2(n3481), .B0(n3477), .Y(n1793) );
  OAI31XL U4445 ( .A0(n3482), .A1(n3631), .A2(n3481), .B0(n3480), .Y(n1792) );
  OAI222XL U4446 ( .A0(n3119), .A1(n3632), .B0(n3484), .B1(n3483), .C0(n3715), 
        .C1(n2601), .Y(n1785) );
  OAI21XL U4447 ( .A0(\gain/counter_R_r [0]), .A1(n3119), .B0(n2303), .Y(n3489) );
  OAI31XL U4448 ( .A0(\gain/counter_R_r [1]), .A1(n3119), .A2(n3815), .B0(
        n3490), .Y(n1781) );
  OAI21XL U4449 ( .A0(n3518), .A1(n3755), .B0(n2568), .Y(n1778) );
  NOR2XL U4450 ( .A(n3598), .B(n3594), .Y(n3493) );
  NOR2XL U4451 ( .A(n3776), .B(n3594), .Y(n3492) );
  AOI222XL U4452 ( .A0(n3494), .A1(n3594), .B0(\gain/g_mean_r [2]), .B1(n3493), 
        .C0(\gain/g_mean_r [6]), .C1(n3492), .Y(n3496) );
  OAI22XL U4453 ( .A0(n3518), .A1(n3862), .B0(n3496), .B1(n3495), .Y(n3497) );
  AOI211XL U4454 ( .A0(\gain/g_mean_r [15]), .A1(n3103), .B0(n3498), .C0(n3497), .Y(n3499) );
  OAI31XL U4455 ( .A0(n3501), .A1(n3500), .A2(n2568), .B0(n3499), .Y(n1777) );
  NAND2XL U4456 ( .A(n3502), .B(n3615), .Y(n3503) );
  NAND2XL U4457 ( .A(n3502), .B(\gain/N478 ), .Y(n3515) );
  INVXL U4458 ( .A(n3515), .Y(n3508) );
  AOI21XL U4459 ( .A0(n3598), .A1(n3503), .B0(n3508), .Y(n3507) );
  OAI31XL U4460 ( .A0(n3507), .A1(n2568), .A2(n3506), .B0(n3505), .Y(n1775) );
  OAI31XL U4461 ( .A0(n3593), .A1(n3510), .A2(n3527), .B0(n3509), .Y(n1773) );
  AOI22XL U4462 ( .A0(\gain/g_mean_r [10]), .A1(n3103), .B0(\gain/g_mean_r [9]), .B1(n3513), .Y(n3511) );
  OAI31XL U4463 ( .A0(n3512), .A1(n3594), .A2(n3527), .B0(n3511), .Y(n1772) );
  OAI31XL U4464 ( .A0(n3612), .A1(n3527), .A2(n3515), .B0(n3514), .Y(n1771) );
  OAI222XL U4465 ( .A0(n2562), .A1(n3726), .B0(n3520), .B1(n3516), .C0(n3616), 
        .C1(n3518), .Y(n1768) );
  OAI222XL U4466 ( .A0(n2562), .A1(n3615), .B0(n3520), .B1(n3517), .C0(n3728), 
        .C1(n3518), .Y(n1765) );
  OAI222XL U4467 ( .A0(n2562), .A1(n3728), .B0(n3520), .B1(n3519), .C0(n3633), 
        .C1(n3518), .Y(n1764) );
  NAND2XL U4468 ( .A(n2568), .B(n3521), .Y(n3522) );
  OAI21XL U4469 ( .A0(n3594), .A1(n2568), .B0(n3524), .Y(n1760) );
  NOR2XL U4470 ( .A(n3525), .B(n3820), .Y(n3526) );
  OAI21XL U4471 ( .A0(n3526), .A1(\gain/counter_G_r [2]), .B0(n2568), .Y(n3528) );
  OAI21XL U4472 ( .A0(n3529), .A1(n3528), .B0(n3527), .Y(n1759) );
  OR2X2 U4473 ( .A(\gain/G_r [0]), .B(n3612), .Y(\intadd_2/CI ) );
  AOI22XL U4474 ( .A0(n3535), .A1(\gain/K_mean_r [15]), .B0(\gain/G_r [15]), 
        .B1(n3023), .Y(n3531) );
  OAI31XL U4475 ( .A0(\intadd_6/n1 ), .A1(n2562), .A2(n3532), .B0(n3531), .Y(
        n1757) );
  CLKINVX1 U4476 ( .A(n3025), .Y(n3575) );
  OAI222XL U4477 ( .A0(n3646), .A1(n3534), .B0(n3575), .B1(\intadd_6/SUM[3] ), 
        .C0(n3816), .C1(n3538), .Y(n1756) );
  OAI222XL U4478 ( .A0(n3647), .A1(n3534), .B0(n3575), .B1(\intadd_6/SUM[2] ), 
        .C0(n3818), .C1(n3538), .Y(n1755) );
  OAI222XL U4479 ( .A0(n3648), .A1(n3534), .B0(n3575), .B1(\intadd_6/SUM[1] ), 
        .C0(n3817), .C1(n3538), .Y(n1754) );
  OAI222XL U4480 ( .A0(n3649), .A1(n3534), .B0(n3575), .B1(\intadd_6/SUM[0] ), 
        .C0(n3874), .C1(n3538), .Y(n1753) );
  OAI21XL U4481 ( .A0(n3575), .A1(n3537), .B0(n3536), .Y(n1752) );
  OAI211XL U4482 ( .A0(n3612), .A1(n3539), .B0(\gain/G_r [0]), .C0(n3538), .Y(
        n3540) );
  OAI21XL U4483 ( .A0(\intadd_2/CI ), .A1(n3575), .B0(n3540), .Y(n1742) );
  AOI22XL U4484 ( .A0(n3541), .A1(\gain/K_mean_r [15]), .B0(\gain/R_r [15]), 
        .B1(n2617), .Y(n3542) );
  OAI22XL U4485 ( .A0(\gain/r_mean_r [14]), .A1(\gain/R_r [14]), .B0(n3645), 
        .B1(n3769), .Y(n3545) );
  OAI21XL U4486 ( .A0(n3576), .A1(n3548), .B0(n3547), .Y(n1740) );
  OAI21XL U4487 ( .A0(\gain/R_r [12]), .A1(n3641), .B0(n3549), .Y(n3550) );
  OAI21XL U4488 ( .A0(n3576), .A1(n3553), .B0(n3552), .Y(n1738) );
  OAI21XL U4489 ( .A0(\gain/r_mean_r [0]), .A1(n3738), .B0(n3554), .Y(n3555)
         );
  NAND2XL U4490 ( .A(n2327), .B(n3556), .Y(n3557) );
  NOR2XL U4491 ( .A(\gain/state_B_r [0]), .B(n3559), .Y(n3561) );
  OAI21XL U4492 ( .A0(n3561), .A1(n3753), .B0(n2327), .Y(n1722) );
  OAI31XL U4493 ( .A0(n3566), .A1(n3565), .A2(n3573), .B0(n3564), .Y(n1717) );
  INVXL U4494 ( .A(n3567), .Y(n3570) );
  OAI31XL U4495 ( .A0(n3727), .A1(n3574), .A2(n3573), .B0(n3572), .Y(n1715) );
  OAI21XL U4496 ( .A0(n3103), .A1(n3830), .B0(n3575), .Y(n1704) );
  OAI21XL U4497 ( .A0(n2597), .A1(n3865), .B0(n3576), .Y(n1692) );
  OAI22XL U4498 ( .A0(n2597), .A1(n3683), .B0(n3119), .B1(n3865), .Y(n1691) );
  OAI22XL U4499 ( .A0(n2597), .A1(n3863), .B0(n3119), .B1(n3683), .Y(n1690) );
  OAI22XL U4500 ( .A0(n2597), .A1(n3629), .B0(n3119), .B1(n3863), .Y(n1689) );
  OAI21XL U4501 ( .A0(n3580), .A1(n3579), .B0(n3578), .Y(n1672) );
  OAI21XL U4502 ( .A0(\gain/B_r [0]), .A1(n3580), .B0(n2571), .Y(n3583) );
  OAI21XL U4503 ( .A0(\gain/b_mean_r [0]), .A1(n3735), .B0(n3581), .Y(n3582)
         );
  NOR2XL U4504 ( .A(n3589), .B(n3588), .Y(n3591) );
  NAND2XL U4505 ( .A(n3593), .B(n3592), .Y(n3597) );
  NAND2XL U4506 ( .A(n3776), .B(n3594), .Y(n3596) );
  NAND2XL U4507 ( .A(n3600), .B(n3599), .Y(n3601) );
  OAI2BB1X1 U4508 ( .A0N(n3604), .A1N(color_out_gamma[0]), .B0(n3603), .Y(
        n3608) );
  AOI211XL U4509 ( .A0(color_out_den[0]), .A1(n2637), .B0(n3608), .C0(n3607), 
        .Y(n1638) );
  OAI22XL U4510 ( .A0(\denoise/valid_in_reg ), .A1(n3621), .B0(n3849), .B1(
        n3609), .Y(n1636) );
  OAI22XL U4511 ( .A0(\denoise/valid_in_reg ), .A1(n3643), .B0(n3849), .B1(
        n3610), .Y(n1635) );
endmodule

module ISP (i_clk_i,               
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

