module WB(
	clk,
	rst_n,
	valid_value_i, //mode 2(WB ->GAMMA ->OUTPUT) start
	color_i,
	value_i,
	valid_gain_i,
	last_i,
	K_R,
	K_G,
	K_B,
	value_o,
	valid_o,
	color_o,
	last_o
	);
	
	//I/O
	input clk, rst_n, valid_value_i, valid_gain_i, last_i;
	input [1:0] color_i;
	input [7:0] value_i;
	input [15:0] K_R, K_G, K_B;

	output reg valid_o;
	output [1:0] color_o;
	output reg last_o;
	output reg [7:0] value_o;

	//internal signal
	reg valid_value_r, valid_gain_r; 
	reg [1:0] color_r;
	reg [7:0] value_r;
	reg [7:0] K_R_r, K_G_r, K_B_r;
	reg [15:0] value_tmp;

	//output buff
	wire valid_tmp;
	reg [1:0] color_tmp;
	wire [7:0] value_tmp_2;
	reg last_tmp;

	//parameter
	localparam RED = 2'd0;
	localparam GREEN = 2'd1;
	localparam BLUE = 2'd2;

	//assignment
	assign color_o = color_tmp;
	assign valid_tmp = valid_value_r & valid_gain_r;
	assign value_tmp_2 = value_tmp[15:4] > 12'b000011111111 ? 8'b11111111: value_tmp[11:4];

	//sequential 
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			//Input FF
			valid_value_r <= 1'd0;
			valid_gain_r <= 1'd0;
			color_r 	<= 2'd0;
			color_tmp 	<= 2'd0;
			value_r 	<= 8'd0;
			// value_tmp <= 8'd0;
			K_R_r 	<= 8'd0;
			K_G_r 	<= 8'd0;
			K_B_r 	<= 8'd0;
			last_o 	<= 0;
			last_tmp<= 0;
			valid_o <= 0;
			value_o	<= 0;
		end
		else begin
			//Input DFF
			valid_value_r 	<= valid_value_i;
			valid_gain_r 	<= valid_gain_i;
			color_r 	<= color_i;
			color_tmp 	<= color_r;
			value_r <= value_i;
			K_R_r 	<= K_R[11:4];
			K_G_r 	<= K_G[11:4];
			K_B_r 	<= K_B[11:4];
			last_tmp <= last_i;
			last_o 	<= last_tmp;
			valid_o <= valid_tmp;
			value_o <= value_tmp_2;
		end
	end

	//combinational
	always@(*) begin
		case(valid_tmp)
			1'd1:
			begin
				case(color_r)
					RED: 	value_tmp = K_R_r * value_r;
					GREEN:	value_tmp = K_G_r * value_r;
					BLUE:	value_tmp = K_B_r * value_r;
					default: value_tmp = value_r;
				endcase
			end
			1'd0:
			begin
				value_tmp = 15'd0;
			end
			default:
			begin
				value_tmp = 15'd0;
			end
		endcase
	end
endmodule
