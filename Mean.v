module Mean(
	clk, 
	rst_n,
	valid_i,  //from denoise 
	color_i,
	value_i,
	last_i, //finish signal
	r_mean_o,
	g_mean_o,
	b_mean_o,
	valid_o,
	color_o,
	last_o
	);

	//specify image size
	parameter SIZE = 4'd10;
	parameter BITS = 2*SIZE + 8; 

	//specify color
	localparam RED = 2'd0;
	localparam GREEN = 2'd1;
	localparam BLUE = 2'd2;

	//I/O
	input clk, rst_n, valid_i, last_i;
	input [1:0] color_i;
	input [7:0] value_i;

	output valid_o, last_o;
	output [1:0] color_o;
	output [7:0] r_mean_o, g_mean_o, b_mean_o;

	//Input FF
	reg valid_r, last_r;
	reg [1:0] color_r;
	reg [7:0] value_r;

	reg [BITS-1:0] sum_r, sum_g, sum_b;
	reg [BITS-1:0] sum_r_nxt, sum_g_nxt, sum_b_nxt;
	reg [7:0] r_mean_nxt, g_mean_nxt, b_mean_nxt;

	//assignment
	assign valid_o = valid_r;
	assign last_o = last_r;
	assign color_o = color_r;
	assign r_mean_o = sum_r >> 2*SIZE;
	assign g_mean_o = sum_g >> 2*SIZE;
	assign b_mean_o = sum_b >> 2*SIZE;

	//sequential
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			sum_r <= 0;
			sum_g <= 0;
			sum_b <= 0;
			//Input FF
			valid_r <= 0;
			last_r 	<= 0;
			color_r <= 0;
			value_r <= 0;
		end
		else begin
			sum_r <= sum_r_nxt;
			sum_g <= sum_g_nxt;
			sum_b <= sum_b_nxt;
			//Input FF
			valid_r <= valid_i;
			last_r 	<= last_i;
			color_r <= color_i;
			value_r <= value_i;
		end
	end

	//combinational
	always@(*) begin
		sum_r_nxt = sum_r;
		sum_g_nxt = sum_g;
		sum_b_nxt = sum_b;
		case(valid_r)
			1'd1:
			begin
				case(color_r)
					RED: 	sum_r_nxt = sum_r + value_r;
					GREEN: 	sum_g_nxt = sum_g + value_r;
					BLUE:	sum_b_nxt = sum_b + value_r;
					default: 
					begin
						sum_r_nxt = sum_r;
						sum_g_nxt = sum_g;
						sum_b_nxt = sum_b;
					end
				endcase
			end
			1'd0:
			begin
				sum_r_nxt = sum_r;
				sum_g_nxt = sum_g;
				sum_b_nxt = sum_b;
			end
			default:
			begin
				sum_r_nxt = sum_r;
				sum_g_nxt = sum_g;
				sum_b_nxt = sum_b;
			end
		endcase
	end
endmodule