module Gain(
	clk,
	rst_n,
	valid_i,
	r_mean_i,
	g_mean_i,
	b_mean_i,
	K_R_o,
	K_G_o,
	K_B_o,
	valid_gain_o //change to valid_gain
	);
	//division precision
	parameter PRECISION = 5'd16;

	//I/O
	input clk, rst_n, valid_i;
	input [7:0] r_mean_i, g_mean_i, b_mean_i;
	output reg valid_gain_o;
	output reg [PRECISION - 1:0] K_R_o, K_G_o, K_B_o; 		//quotient 16bit

	//internal signals
	wire [7:0] K_mean_w;
	assign K_mean_w = (r_mean_i + g_mean_i + b_mean_i)/3;

	reg valid_r;
	reg finish_R_w, finish_R_r, finish_G_w, finish_G_r, finish_B_w, finish_B_r; 
	reg [15:0] r_mean_r, g_mean_r, b_mean_r, r_mean_w, g_mean_w, b_mean_w; //divisor
	reg [15:0] K_mean_r;
	reg [15:0] R_r, G_r, B_r, R_w, G_w, B_w; 	//dividend  

	reg [PRECISION - 1:0]  K_R_w, K_G_w, K_B_w; //quotient

	reg [1:0] state_R_r, state_R_w, state_G_r, state_G_w, state_B_r, state_B_w;
	reg [4:0] counter_R_r, counter_R_w, counter_G_r, counter_G_w, counter_B_r, counter_B_w; //might be modified if PRESISION changes

	//check MSB of 
	reg [2:0] MSB_R_r, MSB_R_w, MSB_G_r, MSB_G_w, MSB_B_r, MSB_B_w;

	//output buffer
	wire valid_gain_tmp;
	reg [PRECISION - 1: 0] K_R_tmp, K_G_tmp, K_B_tmp;

	localparam IDLE = 2'd0;
	localparam FIND = 2'd1;
	localparam CALC = 2'd2;
	localparam DONE = 2'd3;

	//assignment
	assign valid_gain_tmp = finish_R_w & finish_G_w & finish_B_w;

	//combinational FSM for R
	always@(*) begin
		state_R_w 	= state_R_r;
		counter_R_w = counter_R_r;
		finish_R_w 	= finish_R_r;

		case(state_R_r) 
			IDLE:
			begin
				if(valid_r) state_R_w = FIND;
				else 	 	state_R_w = IDLE;
			end
			FIND:
			begin
				if(r_mean_r[MSB_R_r] == 1'b1) begin
				 	 state_R_w 		= CALC;
				 	 counter_R_w 	= MSB_R_r;
				end
				else state_R_w = FIND;
			end
			CALC:
			begin
				if(counter_R_r == PRECISION - 1'd1) 	begin
					state_R_w 		= DONE;
					counter_R_w 	= 0;
				end
				else begin
					state_R_w 	= CALC;
					counter_R_w = counter_R_r + 4'd1; 
				end						
			end
			DONE:
			begin
				finish_R_w 	= 1'd1;
				state_R_w 	= IDLE;
			end
			default:
			begin
				state_R_w 	= state_R_r;
				counter_R_w 	= counter_R_r;
				finish_R_w 	= finish_R_r;
			end
		endcase
	end
	//combinational R/r_mean 
	integer r;
	always@(*) begin
		R_w 		= R_r;	      //dividend	 
		r_mean_w 	= r_mean_r;   //divisor
		K_R_w		= K_R_tmp;      //quotient  
		MSB_R_w 	= MSB_R_r;    //MSB 

		case(state_R_r) 
			IDLE:
			begin
				if(valid_r) begin
					R_w 		= K_mean_r; //dividend
					r_mean_w 	= r_mean_r; //divisor
				end
				else begin
					R_w 		= K_mean_r;
					r_mean_w 	= r_mean_i; //divisor
				end
			end
			FIND:
			begin
				if(r_mean_r[MSB_R_r] == 1'b1) begin
					R_w 					= R_r;			//16bits dividend
					r_mean_w 				= 16'd0;
					for(r=0; r <= MSB_R_r; r = r+1) begin
						r_mean_w[15-r] = r_mean_r[MSB_R_r - r];
					end

				end
				else MSB_R_w	= MSB_R_r - 1'd1;
			end
			CALC:
			begin
				if(R_r < r_mean_r) begin
					R_w 	= R_r;
					K_R_w 	= {K_R_tmp[PRECISION-2:0], 1'd0};
				end
				else begin
					R_w 	= R_r - r_mean_r;
					K_R_w 	= {K_R_tmp[PRECISION-2:0], 1'd1};
				end
		
				r_mean_w = {1'b0, r_mean_r[15:1]};
			end
			default:
			begin
				R_w 		= R_r;	
				r_mean_w 	= r_mean_r;
				K_R_w		= K_R_tmp;
			end
		endcase
	end
	//combinational FSM of G
		always@(*) begin
		state_G_w 	= state_G_r;
		counter_G_w 	= counter_G_r;
		finish_G_w 	= finish_G_r;

		case(state_G_r) 
			IDLE:
			begin
				if(valid_r) state_G_w = FIND;
				else 	 	state_G_w = IDLE;
			end
			FIND:
			begin
				if(g_mean_r[MSB_G_r] == 1'b1) begin
				 	 state_G_w 		= CALC;
				 	 counter_G_w 	= MSB_G_r;
				end
				else state_G_w = FIND;
			end
			CALC:
			begin
				if(counter_G_r == PRECISION - 1'd1) 	begin
					state_G_w 		= DONE;
					counter_G_w 	= 0;
				end
				else begin
					state_G_w 	= CALC;
					counter_G_w = counter_G_r + 4'd1; 
				end						
			end
			DONE:
			begin
				finish_G_w 	= 1'd1;
				state_G_w 	= IDLE;
			end
			default:
			begin
				state_G_w 	= state_G_r;
				counter_G_w 	= counter_G_r;
				finish_G_w 	= finish_G_r;
			end
		endcase
	end
	//combinational G/g_mean 
	integer g;
	always@(*) begin
		G_w 		= G_r;	      //dividend	 
		g_mean_w 	= g_mean_r;   //divisor
		K_G_w		= K_G_tmp;      //quotient  
		MSB_G_w 	= MSB_G_r;    //MSB 

		case(state_G_r) 
			IDLE:
			begin
				if(valid_r) begin
					G_w 		= K_mean_r; //dividend
					g_mean_w 	= g_mean_r; //divisor
				end
				else begin
					G_w 		= K_mean_r;
					g_mean_w 	= g_mean_i; //divisor
				end
			end
			FIND:
			begin
				if(g_mean_r[MSB_G_r] == 1'b1) begin
					G_w 					= G_r;			//16bits dividend
					g_mean_w 				= 16'd0;
					for(r=0; r <= MSB_G_r; r = r+1) begin
						g_mean_w[15-r] = g_mean_r[MSB_G_r - r];
					end

				end
				else MSB_G_w	= MSB_G_r - 1'd1;
			end
			CALC:
			begin
				if(G_r < g_mean_r) begin
					G_w 	= G_r;
					K_G_w 	= {K_G_tmp[PRECISION-2:0], 1'd0};
				end
				else begin
					G_w 	= G_r - g_mean_r;
					K_G_w 	= {K_G_tmp[PRECISION-2:0], 1'd1};
				end
		
				g_mean_w = {1'b0, g_mean_r[15:1]};
			end
			default:
			begin
				G_w 		= G_r;	
				g_mean_w 	= g_mean_r;
				K_G_w		= K_G_tmp;
			end
		endcase
	end 
	//combinational FSM of B 
		always@(*) begin
		state_B_w 	= state_B_r;
		counter_B_w = counter_B_r;
		finish_B_w 	= finish_B_r;

		case(state_B_r) 
			IDLE:
			begin
				if(valid_r) state_B_w = FIND;
				else 	 	state_B_w = IDLE;
			end
			FIND:
			begin
				if(b_mean_r[MSB_B_r] == 1'b1) begin
				 	 state_B_w 		= CALC;
				 	 counter_B_w 	= MSB_B_r;
				end
				else state_B_w = FIND;
			end
			CALC:
			begin
				if(counter_B_r == PRECISION - 1'd1) 	begin
					state_B_w 		= DONE;
					counter_B_w 	= 0;
				end
				else begin
					state_B_w 	= CALC;
					counter_B_w = counter_B_r + 4'd1; 
				end						
			end
			DONE:
			begin
				finish_B_w 	= 1'd1;
				state_B_w 	= IDLE;
			end
			default:
			begin
				state_B_w 	= state_B_r;
				counter_B_w 	= counter_B_r;
				finish_B_w 	= finish_B_r;
			end
		endcase
	end
	//combinational B/b_mean 
	integer b;
	always@(*) begin
		B_w 		= B_r;	      //dividend	 
		b_mean_w 	= b_mean_r;   //divisor
		K_B_w		= K_B_tmp;      //quotient  
		MSB_B_w 	= MSB_B_r;    //MSB 

		case(state_B_r) 
			IDLE:
			begin
				if(valid_r) begin
					B_w 		= K_mean_r; //dividend
					b_mean_w 	= b_mean_r; //divisor
				end
				else begin
					B_w 		= b_mean_r;
					b_mean_w 	= b_mean_i; //divisor
				end
			end
			FIND:
			begin
				if(b_mean_r[MSB_B_r] == 1'b1) begin
					B_w 					= B_r;			//16bits dividend
					b_mean_w 				= 16'd0;
					for(r=0; r <= MSB_B_r; r = r+1) begin
						b_mean_w[15-r] = b_mean_r[MSB_B_r - r];
					end

				end
				else MSB_B_w	= MSB_B_r - 1'd1;
			end
			CALC:
			begin
				if(B_r < b_mean_r) begin
					B_w 	= B_r;
					K_B_w 	= {K_B_tmp[PRECISION-2:0], 1'd0};
				end
				else begin
					B_w 	= B_r - b_mean_r;
					K_B_w 	= {K_B_tmp[PRECISION-2:0], 1'd1};
				end
		
				b_mean_w = {1'b0, b_mean_r[15:1]};
			end
			default:
			begin
				B_w 		= B_r;	
				b_mean_w 	= b_mean_r;
				K_B_w		= K_B_tmp;
			end
		endcase
	end
	
	//sequential 
	always@(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			//input DFF
			r_mean_r 	<= 0;
			g_mean_r 	<= 0;
			b_mean_r 	<= 0;
			K_mean_r 	<= 0;
			valid_r  	<= 0;
			//output
			K_R_o 		<= 0;
			K_G_o	 	<= 0;
			K_B_o		<= 0;
			valid_gain_o <= 0;
			K_R_tmp 	<= 0;
			K_G_tmp 	<= 0;
			K_B_tmp 	<= 0;
			//internal R
			state_R_r 	<= 0;
			r_mean_r	<= 0;
			R_r			<= 0;
			counter_R_r <= 0;
			MSB_R_r 	<= 3'd7;
			finish_R_r 	<= 0;
			//internal G
			state_G_r 	<= 0;
			g_mean_r	<= 0;
			G_r			<= 0;
			counter_G_r <= 0;
			MSB_G_r 	<= 3'd7;
			finish_G_r 	<= 0;
			//internal B
			state_B_r 	<= 0;
			b_mean_r	<= 0;
			B_r			<= 0;
			counter_B_r <= 0;
			MSB_B_r		<= 3'd7;
			finish_G_r 	<= 0;
		end
		else begin
			//input DFF
			r_mean_r 	<= r_mean_w;
			g_mean_r 	<= g_mean_w;
			b_mean_r 	<= b_mean_w;
			K_mean_r 	<= {K_mean_w, 8'd0};
			valid_r  	<= valid_i;
			//output
			K_R_tmp 	<= K_R_w;
			K_G_tmp	 	<= K_G_w;
			K_B_tmp		<= K_B_w;
			K_R_o 		<= K_R_tmp;
			K_G_o 		<= K_G_tmp;
			K_B_o 		<= K_B_tmp;
			valid_gain_o <= valid_gain_tmp;
			//internal R
			state_R_r 	<= state_R_w;
			r_mean_r	<= r_mean_w;
			R_r			<= R_w;
			counter_R_r <= counter_R_w;
			MSB_R_r		<= MSB_R_w;
			finish_R_r 	<= finish_R_w;
			//internal G
			state_G_r 	<= state_G_w;
			g_mean_r	<= g_mean_w;
			G_r			<= G_w;
			counter_G_r <= counter_G_w;
			MSB_G_r 	<= MSB_G_w;
			finish_G_r  <= finish_G_w;
			//internal B
			state_B_r 	<= state_B_w;
			b_mean_r	<= b_mean_w;
			B_r			<= B_w;
			counter_B_r <= counter_B_w;
			MSB_B_r		<= MSB_B_w;
			finish_B_r 	<= finish_B_w;
		end
	end	
endmodule