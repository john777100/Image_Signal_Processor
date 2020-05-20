module WB(
	clk,
	rst_n,
	valid_i, //mode 2(WB ->GAMMA ->OUTPUT) start
	color_i,
	value_i,
	K_R,
	K_G,
	K_B,
	value_o,
	valid_o,
	color_o
	);
	
	//I/O
	input clk, rst_n, valid_i;
	input [1:0] color_i;
	input [7:0] value_i;
	input [7:0] K_R, K_G, K_B;

	output valid_o;
	output [1:0] color_o;
	output reg [7:0] value_o;

	//internal signal
	reg valid_r, color_r;
	reg [7:0] value_r;
	reg [7:0] K_R_r, K_G_r, K_B_r;

	//parameter
	localparam RED = 2'd0;
	localparam GREEN = 2'd1;
	localparam BLUE = 2'd2;

	//assignment
	assign color_o = color_r;
	assign valid_o = valid_r;

	//sequential 
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			//Input FF
			valid_r <= 1'd0;
			color_r <= 2'd0;
			value_r <= 8'd0;
			K_R_r <= 8'd0;
			K_G_r <= 8'd0;
			K_B_r <= 8'd0;
		end
		else begin
			//Input DFF
			valid_r <= valid_i;
			color_r <= color_i;
			value_r <= value_i;
			K_R_r <= K_R;
			K_G_r <= K_G;
			K_B_r <= K_B;
		end
	end

	//combinational
	always@(*) begin
		case(valid_r)
			1'd1:
			begin
				case(color_r)
					RED: 	value_o = K_R_r * value_r;
					GREEN:	value_o = K_G_r * value_r;
					BLUE:	value_o = K_B_r * value_r;
					default: value_o = value_r;
				endcase
			end
			1'd0:
			begin
				value_o = 8'd0;
			end
			default:
			begin
				value_o = 8'd0;
			end
		endcase
	end
endmodule