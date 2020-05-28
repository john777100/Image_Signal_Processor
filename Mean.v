module Mean(
	clk, 
	rst_n,
	valid_i,  //from denoise 
	color_i,
	value_i,
	last_i, //finish signal
	size_i, //specify images' =n+m (nxm)
	r_mean_o,
	g_mean_o,
	b_mean_o,
	valid_o,
	color_o,
	last_o, 
	finish_o
	);

	//specify color
	localparam RED = 2'd0;
	localparam GREEN = 2'd1;
	localparam BLUE = 2'd2;

	//I/O
	input clk, rst_n, valid_i, last_i;
	input [1:0] color_i;
	input [7:0] value_i;
	input [4:0] size_i;

	output valid_o, last_o;
	output reg finish_o;
	output [1:0] color_o;
	output [7:0] r_mean_o, g_mean_o, b_mean_o;

	//Input FF
	reg valid_r, last_r, last_w;
	reg [1:0] color_r;
	reg [7:0] value_r;

	reg [27:0] sum_r, sum_g, sum_b;
	reg [27:0] sum_r_nxt, sum_g_nxt, sum_b_nxt;

	reg [1:0] last_state_r, last_state_w;

	//specify image size
	// parameter SIZE = 4'd10;
	// parameter BITS = 2*size_i + 8; 

	//assignment
	assign valid_o = valid_r;
	assign last_o = last_r;
	assign color_o = color_r;
	assign r_mean_o = sum_r >> size_i;
	assign g_mean_o = sum_g >> size_i;
	assign b_mean_o = sum_b >> size_i;

	//localparam for last signal
	localparam IDLE = 2'd0;
	localparam ONE 	= 2'd1;
	localparam TWO  = 2'd2;
	localparam THREE = 2'd3;

	//FSM for last signal
	always@(*) begin
		last_w = finish_o;
		last_state_w = last_state_r;

		case(last_state_r)
			IDLE:
			begin
				if(last_i == 1'b1) begin				
					last_state_w = ONE;
				end
				else begin
					last_state_w = IDLE;
				end
				last_w = 1'b0;
			end
			ONE:
			begin
				if(last_i == 1'b1) begin
					last_state_w = TWO;
				end
				else begin
					last_state_w = ONE;
				end
			end
			TWO:
			begin
				if(last_i == 1'b1) begin
					last_state_w 	= THREE;
				end
				else begin
					last_state_w = TWO;
				end
			end
			THREE:
			begin
				last_w = 1'b1;
				last_state_w = IDLE;
			end
			default:
			begin
				last_state_w = last_state_r;
			end
		endcase
	end

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
			finish_o <= 0;
			//
			last_state_r <= 0;
		end
		else begin
			sum_r <= sum_r_nxt;
			sum_g <= sum_g_nxt;
			sum_b <= sum_b_nxt;
			//Input FF
			valid_r <= valid_i;
			finish_o <= last_w;
			last_r 	<= last_i;
			color_r <= color_i;
			value_r <= value_i;
			//
			last_state_r <= last_state_w;
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