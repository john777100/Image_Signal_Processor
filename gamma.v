`include "define.v"
`define PROCESS_ROW_COUNT 4
`define INPUT_ROW_COUNT 6
`define COLOR_DEPTH 8
`define WIN_RADIUS 1
module gamma_122(
	input			clk,
	input			rst_n,
	input 	[`COLOR_DEPTH-1:0]	pixel_in,
	input			valid_in,
	input	[`COLOR_BIT_CNT-1:0]	color_in,
	input			last_pic_in,
	output 	[`COLOR_DEPTH-1:0]	pixel_out,
	output			valid_out,
	output  [`COLOR_BIT_CNT-1:0]	color_out,
	output			last_pic_out
);
reg	[`COLOR_DEPTH-1:0]	pixel_in_reg;
reg						valid_in_reg;
reg	[`COLOR_BIT_CNT-1:0]				color_in_reg;
reg						last_pic_in_reg;
reg	[`COLOR_DEPTH-1:0]	pixel_out_reg, n_pixel_out_reg;
reg						valid_out_reg, n_valid_out_reg;
reg	[`COLOR_BIT_CNT-1:0]				color_out_reg, n_color_out_reg;
reg						last_pic_out_reg, n_last_pic_out_reg;

assign pixel_out = pixel_out_reg;
assign valid_out = valid_out_reg;
assign color_out = color_out_reg;
assign last_pic_out = last_pic_out_reg;


always@(*) begin
	n_valid_out_reg = valid_in_reg;
	n_color_out_reg = color_in_reg;
	n_last_pic_out_reg = last_pic_in_reg;
end

always@(*) begin
	case(pixel_in_reg)
		8'd0:    n_pixel_out_reg = 8'd0;
		8'd1:    n_pixel_out_reg = 8'd20;
		8'd2:    n_pixel_out_reg = 8'd28;
		8'd3:    n_pixel_out_reg = 8'd33;
		8'd4:    n_pixel_out_reg = 8'd38;
		8'd5:    n_pixel_out_reg = 8'd42;
		8'd6:    n_pixel_out_reg = 8'd46;
		8'd7:    n_pixel_out_reg = 8'd49;
		8'd8:    n_pixel_out_reg = 8'd52;
		8'd9:    n_pixel_out_reg = 8'd55;
		8'd10:   n_pixel_out_reg = 8'd58;
		8'd11:   n_pixel_out_reg = 8'd61;
		8'd12:   n_pixel_out_reg = 8'd63;
		8'd13:   n_pixel_out_reg = 8'd65;
		8'd14:   n_pixel_out_reg = 8'd68;
		8'd15:   n_pixel_out_reg = 8'd70;
		8'd16:   n_pixel_out_reg = 8'd72;
		8'd17:   n_pixel_out_reg = 8'd74;
		8'd18:   n_pixel_out_reg = 8'd76;
		8'd19:   n_pixel_out_reg = 8'd78;
		8'd20:   n_pixel_out_reg = 8'd80;
		8'd21:   n_pixel_out_reg = 8'd81;
		8'd22:   n_pixel_out_reg = 8'd83;
		8'd23:   n_pixel_out_reg = 8'd85;
		8'd24:   n_pixel_out_reg = 8'd87;
		8'd25:   n_pixel_out_reg = 8'd88;
		8'd26:   n_pixel_out_reg = 8'd90;
		8'd27:   n_pixel_out_reg = 8'd91;
		8'd28:   n_pixel_out_reg = 8'd93;
		8'd29:   n_pixel_out_reg = 8'd94;
		8'd30:   n_pixel_out_reg = 8'd96;
		8'd31:   n_pixel_out_reg = 8'd97;
		8'd32:   n_pixel_out_reg = 8'd99;
		8'd33:   n_pixel_out_reg = 8'd100;
		8'd34:   n_pixel_out_reg = 8'd102;
		8'd35:   n_pixel_out_reg = 8'd103;
		8'd36:   n_pixel_out_reg = 8'd104;
		8'd37:   n_pixel_out_reg = 8'd106;
		8'd38:   n_pixel_out_reg = 8'd107;
		8'd39:   n_pixel_out_reg = 8'd108;
		8'd40:   n_pixel_out_reg = 8'd109;
		8'd41:   n_pixel_out_reg = 8'd111;
		8'd42:   n_pixel_out_reg = 8'd112;
		8'd43:   n_pixel_out_reg = 8'd113;
		8'd44:   n_pixel_out_reg = 8'd114;
		8'd45:   n_pixel_out_reg = 8'd115;
		8'd46:   n_pixel_out_reg = 8'd117;
		8'd47:   n_pixel_out_reg = 8'd118;
		8'd48:   n_pixel_out_reg = 8'd119;
		8'd49:   n_pixel_out_reg = 8'd120;
		8'd50:   n_pixel_out_reg = 8'd121;
		8'd51:   n_pixel_out_reg = 8'd122;
		8'd52:   n_pixel_out_reg = 8'd123;
		8'd53:   n_pixel_out_reg = 8'd124;
		8'd54:   n_pixel_out_reg = 8'd125;
		8'd55:   n_pixel_out_reg = 8'd126;
		8'd56:   n_pixel_out_reg = 8'd128;
		8'd57:   n_pixel_out_reg = 8'd129;
		8'd58:   n_pixel_out_reg = 8'd130;
		8'd59:   n_pixel_out_reg = 8'd131;
		8'd60:   n_pixel_out_reg = 8'd132;
		8'd61:   n_pixel_out_reg = 8'd133;
		8'd62:   n_pixel_out_reg = 8'd134;
		8'd63:   n_pixel_out_reg = 8'd135;
		8'd64:   n_pixel_out_reg = 8'd136;
		8'd65:   n_pixel_out_reg = 8'd136;
		8'd66:   n_pixel_out_reg = 8'd137;
		8'd67:   n_pixel_out_reg = 8'd138;
		8'd68:   n_pixel_out_reg = 8'd139;
		8'd69:   n_pixel_out_reg = 8'd140;
		8'd70:   n_pixel_out_reg = 8'd141;
		8'd71:   n_pixel_out_reg = 8'd142;
		8'd72:   n_pixel_out_reg = 8'd143;
		8'd73:   n_pixel_out_reg = 8'd144;
		8'd74:   n_pixel_out_reg = 8'd145;
		8'd75:   n_pixel_out_reg = 8'd146;
		8'd76:   n_pixel_out_reg = 8'd147;
		8'd77:   n_pixel_out_reg = 8'd147;
		8'd78:   n_pixel_out_reg = 8'd148;
		8'd79:   n_pixel_out_reg = 8'd149;
		8'd80:   n_pixel_out_reg = 8'd150;
		8'd81:   n_pixel_out_reg = 8'd151;
		8'd82:   n_pixel_out_reg = 8'd152;
		8'd83:   n_pixel_out_reg = 8'd153;
		8'd84:   n_pixel_out_reg = 8'd153;
		8'd85:   n_pixel_out_reg = 8'd154;
		8'd86:   n_pixel_out_reg = 8'd155;
		8'd87:   n_pixel_out_reg = 8'd156;
		8'd88:   n_pixel_out_reg = 8'd157;
		8'd89:   n_pixel_out_reg = 8'd158;
		8'd90:   n_pixel_out_reg = 8'd158;
		8'd91:   n_pixel_out_reg = 8'd159;
		8'd92:   n_pixel_out_reg = 8'd160;
		8'd93:   n_pixel_out_reg = 8'd161;
		8'd94:   n_pixel_out_reg = 8'd162;
		8'd95:   n_pixel_out_reg = 8'd162;
		8'd96:   n_pixel_out_reg = 8'd163;
		8'd97:   n_pixel_out_reg = 8'd164;
		8'd98:   n_pixel_out_reg = 8'd165;
		8'd99:   n_pixel_out_reg = 8'd165;
		8'd100:      n_pixel_out_reg = 8'd166;
		8'd101:      n_pixel_out_reg = 8'd167;
		8'd102:      n_pixel_out_reg = 8'd168;
		8'd103:      n_pixel_out_reg = 8'd168;
		8'd104:      n_pixel_out_reg = 8'd169;
		8'd105:      n_pixel_out_reg = 8'd170;
		8'd106:      n_pixel_out_reg = 8'd171;
		8'd107:      n_pixel_out_reg = 8'd171;
		8'd108:      n_pixel_out_reg = 8'd172;
		8'd109:      n_pixel_out_reg = 8'd173;
		8'd110:      n_pixel_out_reg = 8'd174;
		8'd111:      n_pixel_out_reg = 8'd174;
		8'd112:      n_pixel_out_reg = 8'd175;
		8'd113:      n_pixel_out_reg = 8'd176;
		8'd114:      n_pixel_out_reg = 8'd176;
		8'd115:      n_pixel_out_reg = 8'd177;
		8'd116:      n_pixel_out_reg = 8'd178;
		8'd117:      n_pixel_out_reg = 8'd178;
		8'd118:      n_pixel_out_reg = 8'd179;
		8'd119:      n_pixel_out_reg = 8'd180;
		8'd120:      n_pixel_out_reg = 8'd181;
		8'd121:      n_pixel_out_reg = 8'd181;
		8'd122:      n_pixel_out_reg = 8'd182;
		8'd123:      n_pixel_out_reg = 8'd183;
		8'd124:      n_pixel_out_reg = 8'd183;
		8'd125:      n_pixel_out_reg = 8'd184;
		8'd126:      n_pixel_out_reg = 8'd185;
		8'd127:      n_pixel_out_reg = 8'd185;
		8'd128:      n_pixel_out_reg = 8'd186;
		8'd129:      n_pixel_out_reg = 8'd187;
		8'd130:      n_pixel_out_reg = 8'd187;
		8'd131:      n_pixel_out_reg = 8'd188;
		8'd132:      n_pixel_out_reg = 8'd189;
		8'd133:      n_pixel_out_reg = 8'd189;
		8'd134:      n_pixel_out_reg = 8'd190;
		8'd135:      n_pixel_out_reg = 8'd190;
		8'd136:      n_pixel_out_reg = 8'd191;
		8'd137:      n_pixel_out_reg = 8'd192;
		8'd138:      n_pixel_out_reg = 8'd192;
		8'd139:      n_pixel_out_reg = 8'd193;
		8'd140:      n_pixel_out_reg = 8'd194;
		8'd141:      n_pixel_out_reg = 8'd194;
		8'd142:      n_pixel_out_reg = 8'd195;
		8'd143:      n_pixel_out_reg = 8'd196;
		8'd144:      n_pixel_out_reg = 8'd196;
		8'd145:      n_pixel_out_reg = 8'd197;
		8'd146:      n_pixel_out_reg = 8'd197;
		8'd147:      n_pixel_out_reg = 8'd198;
		8'd148:      n_pixel_out_reg = 8'd199;
		8'd149:      n_pixel_out_reg = 8'd199;
		8'd150:      n_pixel_out_reg = 8'd200;
		8'd151:      n_pixel_out_reg = 8'd200;
		8'd152:      n_pixel_out_reg = 8'd201;
		8'd153:      n_pixel_out_reg = 8'd202;
		8'd154:      n_pixel_out_reg = 8'd202;
		8'd155:      n_pixel_out_reg = 8'd203;
		8'd156:      n_pixel_out_reg = 8'd203;
		8'd157:      n_pixel_out_reg = 8'd204;
		8'd158:      n_pixel_out_reg = 8'd205;
		8'd159:      n_pixel_out_reg = 8'd205;
		8'd160:      n_pixel_out_reg = 8'd206;
		8'd161:      n_pixel_out_reg = 8'd206;
		8'd162:      n_pixel_out_reg = 8'd207;
		8'd163:      n_pixel_out_reg = 8'd208;
		8'd164:      n_pixel_out_reg = 8'd208;
		8'd165:      n_pixel_out_reg = 8'd209;
		8'd166:      n_pixel_out_reg = 8'd209;
		8'd167:      n_pixel_out_reg = 8'd210;
		8'd168:      n_pixel_out_reg = 8'd210;
		8'd169:      n_pixel_out_reg = 8'd211;
		8'd170:      n_pixel_out_reg = 8'd212;
		8'd171:      n_pixel_out_reg = 8'd212;
		8'd172:      n_pixel_out_reg = 8'd213;
		8'd173:      n_pixel_out_reg = 8'd213;
		8'd174:      n_pixel_out_reg = 8'd214;
		8'd175:      n_pixel_out_reg = 8'd214;
		8'd176:      n_pixel_out_reg = 8'd215;
		8'd177:      n_pixel_out_reg = 8'd216;
		8'd178:      n_pixel_out_reg = 8'd216;
		8'd179:      n_pixel_out_reg = 8'd217;
		8'd180:      n_pixel_out_reg = 8'd217;
		8'd181:      n_pixel_out_reg = 8'd218;
		8'd182:      n_pixel_out_reg = 8'd218;
		8'd183:      n_pixel_out_reg = 8'd219;
		8'd184:      n_pixel_out_reg = 8'd219;
		8'd185:      n_pixel_out_reg = 8'd220;
		8'd186:      n_pixel_out_reg = 8'd220;
		8'd187:      n_pixel_out_reg = 8'd221;
		8'd188:      n_pixel_out_reg = 8'd222;
		8'd189:      n_pixel_out_reg = 8'd222;
		8'd190:      n_pixel_out_reg = 8'd223;
		8'd191:      n_pixel_out_reg = 8'd223;
		8'd192:      n_pixel_out_reg = 8'd224;
		8'd193:      n_pixel_out_reg = 8'd224;
		8'd194:      n_pixel_out_reg = 8'd225;
		8'd195:      n_pixel_out_reg = 8'd225;
		8'd196:      n_pixel_out_reg = 8'd226;
		8'd197:      n_pixel_out_reg = 8'd226;
		8'd198:      n_pixel_out_reg = 8'd227;
		8'd199:      n_pixel_out_reg = 8'd227;
		8'd200:      n_pixel_out_reg = 8'd228;
		8'd201:      n_pixel_out_reg = 8'd228;
		8'd202:      n_pixel_out_reg = 8'd229;
		8'd203:      n_pixel_out_reg = 8'd229;
		8'd204:      n_pixel_out_reg = 8'd230;
		8'd205:      n_pixel_out_reg = 8'd230;
		8'd206:      n_pixel_out_reg = 8'd231;
		8'd207:      n_pixel_out_reg = 8'd231;
		8'd208:      n_pixel_out_reg = 8'd232;
		8'd209:      n_pixel_out_reg = 8'd232;
		8'd210:      n_pixel_out_reg = 8'd233;
		8'd211:      n_pixel_out_reg = 8'd233;
		8'd212:      n_pixel_out_reg = 8'd234;
		8'd213:      n_pixel_out_reg = 8'd234;
		8'd214:      n_pixel_out_reg = 8'd235;
		8'd215:      n_pixel_out_reg = 8'd235;
		8'd216:      n_pixel_out_reg = 8'd236;
		8'd217:      n_pixel_out_reg = 8'd236;
		8'd218:      n_pixel_out_reg = 8'd237;
		8'd228:      n_pixel_out_reg = 8'd242;
		8'd229:      n_pixel_out_reg = 8'd242;
		8'd230:      n_pixel_out_reg = 8'd243;
		8'd231:      n_pixel_out_reg = 8'd243;
		8'd232:      n_pixel_out_reg = 8'd244;
		8'd233:      n_pixel_out_reg = 8'd244;
		8'd234:      n_pixel_out_reg = 8'd245;
		8'd235:      n_pixel_out_reg = 8'd245;
		8'd236:      n_pixel_out_reg = 8'd246;
		8'd237:      n_pixel_out_reg = 8'd246;
		8'd238:      n_pixel_out_reg = 8'd247;
		8'd239:      n_pixel_out_reg = 8'd247;
		8'd240:      n_pixel_out_reg = 8'd248;
		8'd241:      n_pixel_out_reg = 8'd248;
		8'd242:      n_pixel_out_reg = 8'd249;
		8'd243:      n_pixel_out_reg = 8'd249;
		8'd244:      n_pixel_out_reg = 8'd249;
		8'd245:      n_pixel_out_reg = 8'd250;
		8'd246:      n_pixel_out_reg = 8'd250;
		8'd247:      n_pixel_out_reg = 8'd251;
		8'd248:      n_pixel_out_reg = 8'd251;
		8'd249:      n_pixel_out_reg = 8'd252;
		8'd250:      n_pixel_out_reg = 8'd252;
		8'd251:      n_pixel_out_reg = 8'd253;
		8'd252:      n_pixel_out_reg = 8'd253;
		8'd253:      n_pixel_out_reg = 8'd254;
		8'd254:      n_pixel_out_reg = 8'd254;
		8'd255:      n_pixel_out_reg = 8'd255;
	endcase
end

always@(posedge clk or negedge rst_n)
	if(!rst_n) begin
		pixel_in_reg <= 0;
		valid_in_reg <= 0;
		color_in_reg <= 0;
		last_pic_in_reg <= 0;
		pixel_out_reg <= 0;
		valid_out_reg <= 0;
		color_out_reg <= 0;
		last_pic_out_reg <= 0;

	end
	else begin
		pixel_in_reg <= pixel_in;
		valid_in_reg <= valid_in;
		color_in_reg <= color_in;
		last_pic_in_reg <= last_pic_in;
		pixel_out_reg <= n_pixel_out_reg;
		valid_out_reg <= n_valid_out_reg;
		color_out_reg <= n_color_out_reg;
		last_pic_out_reg <= n_last_pic_out_reg;

	end
	
	
endmodule
