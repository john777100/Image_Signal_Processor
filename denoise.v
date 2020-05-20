`define PROCESS_ROW_COUNT 4
`define INPUT_ROW_COUNT 6
`define COLOR_DEPTH 8
`define WIN_RADIUS 1
module denoise(
	input			clk,
	input			rst,
	input 	[`COLOR_DEPTH-1:0]	pixel_in,
	input			valid_in,
	input	[2:0]	color_in,
	input			last_in,
	output 	[`COLOR_DEPTH-1:0]	pixel_out,
	output			valid_out,
	output  [2:0]	color_out,
	output			last_out
);


localparam LOAD_PIXEL 		= 3'd0;
localparam WAIT_PIXEL		= 3'd1;

localparam INIT_12 	= 2'd0;
localparam INIT_2	= 2'd1;
localparam OUT 		= 2'd3;

localparam RED		= 2'd0;
localparam GREEN	= 2'd1;
localparam BLUE		= 2'd2;
localparam VOID		= 2'd3;

// IO FF
reg	[`COLOR_DEPTH-1:0]	pixel_in_reg;
reg						valid_in_reg;
reg	[2:0]				color_in_reg;
reg						last_in_reg;
reg	[`COLOR_DEPTH-1:0]	pixel_out_reg, n_pixel_out_reg;
reg						valid_out_reg, n_valid_out_reg;
reg	[2:0]				color_out_reg, n_color_out_reg;
reg						last_out_reg, n_last_out_reg;
assign pixel_out = pixel_out_reg;
assign valid_out = valid_out_reg;
assign color_out = color_out_reg;
assign last_out = last_out_reg;


integer i;

// register modified at stage 2
reg [`COLOR_DEPTH-1:0]	first_col_r 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_first_col_r 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	first_col_g 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_first_col_g 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	first_col_b 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_first_col_b 	[0:`INPUT_ROW_COUNT-1];

reg [`COLOR_DEPTH-1:0]	second_col_r 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_second_col_r 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	second_col_g 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_second_col_g 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	second_col_b 	[0:`INPUT_ROW_COUNT-1];
reg [`COLOR_DEPTH-1:0]	n_second_col_b 	[0:`INPUT_ROW_COUNT-1];



// register modified at stage 3

reg [`COLOR_DEPTH+1:0] 	sum6_r, n_sum6_r;
reg [`COLOR_DEPTH+1:0] 	sum3_r, n_sum3_r;

reg [`COLOR_DEPTH+1:0] 	sum6_g, n_sum6_g;
reg [`COLOR_DEPTH+1:0] 	sum3_g, n_sum3_g;

reg [`COLOR_DEPTH+1:0] 	sum6_b, n_sum6_b;
reg [`COLOR_DEPTH+1:0] 	sum3_b, n_sum3_b;

// pipeline stage 0

reg [2:0]				state_0, n_state_0;
reg [2:0]				counter_0, n_counter_0;

//pipeline stage1

reg [2:0]				state_1, n_state_1;
reg 					last_1, n_last_1;
reg [2:0]				color_1, n_color_1;
reg						init_12_last_flag, n_init_12_last_flag;
reg [2:0]				counter_1, n_counter_1;
reg [1:0]				valid_count_0, n_valid_count_0;
reg [`COLOR_DEPTH-1:0]	pos9, n_pos9;
reg [`COLOR_DEPTH-1:0]	pos8, n_pos8;
reg [`COLOR_DEPTH-1:0]	pos7, n_pos7;
reg [`COLOR_DEPTH+1:0]	sum3, n_sum3;
reg [`COLOR_DEPTH+1:0]	sum6, n_sum6;

//pipeline stage2
reg [2:0]				state_2, n_state_2;
reg 					last_2, n_last_2;
reg [2:0]				color_2, n_color_2;
reg [`COLOR_DEPTH+3:0]  sum9, n_sum9;
reg [`COLOR_DEPTH+3:0]  new_sum6, n_new_sum6;

//stage0 pipeline combinational
always@(*) begin
	n_state_0 = state_0;
	n_counter_0 = counter_0;
	n_valid_count_0 = valid_count_0;
	n_init_12_last_flag = init_12_last_flag;
	n_init_12_last_flag = state_0 == INIT_12 ? (valid_count_0 == 2'd2 && counter_0 == 3'd5 ? 1'b1 : init_12_last_flag) : 1'b0;
	case(state_0)
		INIT_12: begin
			n_state_0 = (valid_count_0 == 2'd2 && valid_in_reg && counter_0 == 3'd5 && init_12_last_flag) ? INIT_2 : state_0;		
			n_counter_0 = valid_count_0 == 2'd2 && valid_in_reg ? (counter_0 == 3'd5 ? 4'd0 : counter_0 + 1) : counter_0;
		end
		INIT_2: begin
			n_state_0 = valid_count_0 == 2'd2 && valid_in_reg && counter_0 == 3'd1 ? OUT : state_0;
			n_counter_0 = valid_count_0 == 2'd2 && valid_in_reg  ?  counter_0 + 1 : counter_0;
		end
		OUT: begin
			n_state_0 = valid_count_0 == 2'd2 && valid_in_reg && counter_0 == 3'd5 ? (last_1 ? INIT_12 : INIT_2) : state_0;
			n_counter_0 = valid_count_0 == 2'd2 && valid_in_reg ? (counter_0 == 3'd5 ? 4'd0 : counter_0 + 1) : counter_0;
		end
	endcase
	if(valid_in_reg) begin
		n_valid_count_0 = valid_count_0 == 2'd2 ? 2'd0 : valid_count_0+1;
	end
	else begin
		n_valid_count_0 = valid_count_0;
	end


end

//stage1 pipeline combinational
always@(*) begin
	n_state_1 = state_0;
	n_last_1 = last_1;
	n_color_1 = color_1;
	n_counter_1 = counter_0;
	n_pos9 = pos9;
	n_pos8 = pos8;
	n_pos7 = pos7;
	n_sum3 = sum3;
	n_sum6 = sum6;
	if(valid_in_reg) begin
		case(valid_count_0)
			2'd0: n_color_1 = RED;
			2'd1: n_color_1 = GREEN;
			2'd2: n_color_1 = BLUE;
		endcase	
	end
	else begin
		n_color_1 = VOID;
	end
	case(valid_count_0)
		2'd0: begin
			n_pos9 = pixel_in_reg;
			n_pos8 = second_col_r[counter_0];
			n_pos7 = first_col_r[counter_0];
			n_sum6 = sum6_r;
			n_sum3 = sum3_r;
		end
		2'd1: begin
			n_pos9 = pixel_in_reg;
			n_pos8 = second_col_g[counter_0];
			n_pos7 = first_col_g[counter_0];
			n_sum6 = sum6_g;
			n_sum3 = sum3_g;
		end
		2'd2: begin
			n_pos9 = pixel_in_reg;
			n_pos8 = second_col_b[counter_0];
			n_pos7 = first_col_b[counter_0];
			n_sum6 = sum6_b;
			n_sum3 = sum3_b;
		end
	endcase

	if(last_in_reg)
		n_last_1 = 1'b1;
	else begin
		n_last_1 = last_1;
		if(valid_count_0 == 2'd1)
			n_last_1 = 1'b0;
	end
end
	
//stage2 pipeline combinational
always@(*) begin
	n_state_2 = state_1;
	n_last_2 = last_1;
	n_color_2 = color_1;
	n_new_sum6 = {2'b00,pos7} + {2'b00,pos8} + {2'b00,pos9};
	n_sum9 = {2'b00, n_new_sum6} + {4'b0000, sum3} + {4'b0000, sum6};
	//n_sum9 =  + {2'b00,pos7} + {2'b00,pos8} + {2'b00,pos9} + {4'b0000, sum3} + {4'b0000, sum6};
	for(i =0; i < `INPUT_ROW_COUNT; i = i+1) begin
		n_first_col_r[i] = first_col_r[i];
		n_first_col_g[i] = first_col_g[i];
		n_first_col_b[i] = first_col_b[i];
		n_second_col_r[i] = second_col_r[i];
		n_second_col_g[i] = second_col_g[i];
		n_second_col_b[i] = second_col_b[i];
	end
	case(color_1)
		RED: begin
			n_first_col_r[counter_1] = second_col_r[counter_1];
			n_second_col_r[counter_1] = pos9;
		end
		GREEN: begin
			n_first_col_g[counter_1] = second_col_g[counter_1];
			n_second_col_g[counter_1] = pos9;
		end
		BLUE: begin
			n_first_col_b[counter_1] = second_col_b[counter_1];
			n_second_col_b[counter_1] = pos9;

		end
//		VOID: begin
//
//		end
	endcase
	
end
//stage3 pipeline combinational
always@(*) begin
			
	n_sum6_r = sum6_r;
	n_sum3_r = sum3_r;
	n_sum6_g = sum6_g;
	n_sum3_g = sum3_g;
	n_sum6_b = sum6_b;
	n_sum3_b = sum3_b;
	n_pixel_out_reg = sum9/9;
	n_valid_out_reg = 1'b0;
	n_color_out_reg = VOID;
	n_last_out_reg = last_2;
	if(state_2 == OUT) begin
		case(color_2)
			RED: begin
				n_color_out_reg = RED;
				n_valid_out_reg = 1'b1;
			end
			GREEN: begin
				n_color_out_reg = GREEN;
				n_valid_out_reg = 1'b1;
			end
			BLUE: begin
				n_color_out_reg = BLUE;
				n_valid_out_reg = 1'b1;
			end
//			VOID: begin
//
//			end
		endcase
	end
	if(state_2 == OUT || state_2 == INIT_2) begin
		case(color_2)
			RED: begin
				n_sum6_r = new_sum6;
				n_sum3_r = sum6_r;
			end
			GREEN: begin
				n_sum6_g = new_sum6;
				n_sum3_g = sum6_g;

			end
			BLUE: begin
				n_sum6_b = new_sum6;
				n_sum3_b = sum6_b;
			end
//			VOID: begin
//
//			end
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		pixel_in_reg  <= 0; 
		valid_in_reg  <= 0; 
		color_in_reg  <= 0; 
		last_in_reg   <= 0; 
		pixel_out_reg <= 0; 
		valid_out_reg <= 0; 
		color_out_reg <= 0; 
		last_out_reg  <= 0; 
		for(i=0 ; i<`INPUT_ROW_COUNT; i=i+1) begin
			first_col_r[i]	<= 0; 
			first_col_g[i] 	<= 0; 
			first_col_b[i] 	<= 0;  
			second_col_r[i] <= 0; 
			second_col_g[i] <= 0; 
			second_col_b[i] <= 0;  
		end
		sum6_r <= 0;
		sum3_r <= 0;
		
		sum6_g <= 0;
		sum3_g <= 0;
		
		sum6_b <= 0;
		sum3_b <= 0;
		
		state_0					<= INIT_12;
		counter_0   		 	<= 0;
		
		state_1   				<= INIT_12;
		last_1   				<= 0;
		color_1   				<= RED;
		init_12_last_flag   	<= 0;
		counter_1   		 	<= 0;
		valid_count_0   		<= 0;
		pos9   					<= 0;
		pos8   					<= 0;
		pos7   					<= 0;
		sum3    				<= 0;
		sum6    				<= 0;

		state_2 	<= INIT_12; 
		last_2 		<= 0; 
		color_2 	<= VOID; 
		sum9 		<= 0; 
		new_sum6	<= 0; 
	end
	else begin
		pixel_in_reg  <= pixel_in;
		valid_in_reg  <= valid_in;
		color_in_reg  <= color_in;
		last_in_reg   <= last_in;
		pixel_out_reg <= n_pixel_out_reg;
		valid_out_reg <= n_valid_out_reg;
		color_out_reg <= n_color_out_reg;
		last_out_reg  <= n_last_out_reg;

		for(i=0 ; i<`INPUT_ROW_COUNT; i=i+1) begin
			first_col_r[i]	<= n_first_col_r[i]; 
			first_col_g[i] 	<= n_first_col_g[i]; 
			first_col_b[i] 	<= n_first_col_b[i];  
			second_col_r[i]	<= n_second_col_r[i]; 
			second_col_g[i]	<= n_second_col_g[i]; 
			second_col_b[i]	<= n_second_col_b[i];  
		end
		sum6_r <= n_sum6_r;
		sum3_r <= n_sum3_r;
		
		sum6_g <= n_sum6_g;
		sum3_g <= n_sum3_g;
		
		sum6_b <= n_sum6_b;
		sum3_b <= n_sum3_b;

		state_0					<= n_state_0;
		counter_0   		 	<= n_counter_0;

		state_1   				<= n_state_1;
		last_1   				<= n_last_1;
		color_1   				<= n_color_1;
		init_12_last_flag   	<= n_init_12_last_flag;
		counter_1   		 	<= n_counter_1;
		valid_count_0   		<= n_valid_count_0;
		pos9   					<= n_pos9;
		pos8   					<= n_pos8;
		pos7   					<= n_pos7;
		sum3    				<= n_sum3;
		sum6    				<= n_sum6;

		state_2 	<= n_state_2;
		last_2 		<= n_last_2;
		color_2 	<= n_color_2;
		sum9 		<= n_sum9;
		new_sum6	<= n_new_sum6;
	end

end


endmodule
