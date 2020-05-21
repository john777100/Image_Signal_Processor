module top(
	input						clk,
	input						rst_n,
	input 	[`COLOR_DEPTH-1:0]	pixel_in,
	input						valid_in,
	input	[`COLOR_BIT_CNT-1:0]color_in,
	input						last_col_in,
	input						last_pic_in,
	input	[`MODE_BIT_CNT-1:0]	mode,
	input						start,
	output 	[`COLOR_DEPTH-1:0]	pixel_out,
	output						valid_out,
	output  [`COLOR_BIT_CNT-1:0]color_out,
	output						last_col_out,
	output						last_pic_out,
	output						finish_operation


);	
	//IO reg
	reg	[`COLOR_DEPTH-1:0]	pixel_in_reg,    n_pixel_in_reg;
	reg						valid_in_reg,    n_valid_in_reg;
	reg	[`COLOR_BIT_CNT-1:0]color_in_reg,    n_color_in_reg;
	reg						last_col_in_reg, n_last_col_in_reg;
	reg						last_pic_in_reg, n_last_pic_in_reg;
	reg	[`MODE_BIT_CNT-1:0]	mode_reg,        n_mode_reg;
	reg						start_reg,       n_start_reg;
	reg	[`COLOR_DEPTH-1:0]	pixel_out_reg,   n_pixel_out_reg;
	reg						valid_out_reg,   n_valid_out_reg;
	reg	[`COLOR_BIT_CNT-1:0]color_out_reg,   n_color_out_reg;
	reg						last_col_out_reg,n_last_col_out_reg;
	reg						last_pic_out_reg,n_last_pic_out_reg;
	reg						finish_reg, n_finish_reg;




	reg		[4:0]				size_top, n_size_top;
	reg		[`GAIN_BIT_CNT-1:0]	k_r_reg, n_k_r_reg;
	reg		[`GAIN_BIT_CNT-1:0]	k_r_reg, n_k_r_reg;
	reg		[`GAIN_BIT_CNT-1:0]	k_r_reg, n_k_r_reg;
	


	wire 	[`COLOR_DEPTH-1:0]	pixel_in;
	wire 						valid_in;
	wire 	[`COLOR_BIT_CNT-1:0]color_in;
	wire 						last_col_in;
	wire 						last_pic_in;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out;
	wire 						valid_out;
	wire 	[`COLOR_BIT_CNT-1:0]color_out;
	wire 						last_col_out;
	wire 						last_pic_out;

	wire 	[`COLOR_DEPTH-1:0]	pixel_in_dem;
	wire 						valid_in_dem;
	wire 	[`COLOR_BIT_CNT-1:0]color_in_dem;
	wire 						last_col_in_dem;
	wire 						last_pic_in_dem;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out_dem;
	wire 						valid_out_dem;
	wire 	[`COLOR_BIT_CNT-1:0]color_out_dem;
	wire 						last_col_out_dem;
	wire 						last_pic_out_dem;

	



	wire 	[`COLOR_DEPTH-1:0]	pixel_in_den;
	wire 						valid_in_den;
	wire 	[`COLOR_BIT_CNT-1:0]color_in_den;
	wire 						last_col_in_den;
	wire 						last_pic_in_den;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out_den;
	wire 						valid_out_den;
	wire 	[`COLOR_BIT_CNT-1:0]color_out_den;
	wire 						last_col_out_den;
	wire 						last_pic_out_den;

	wire 	[`COLOR_DEPTH-1:0]	pixel_in_mean;
	wire 						valid_in_mean;
	wire 	[`COLOR_BIT_CNT-1:0]color_in_mean;
	wire 						last_col_in_mean;
	wire 						last_pic_in_mean;
	wire 	[`COLOR_DEPTH-1:0]	r_mean_out_mean;
	wire 	[`COLOR_DEPTH-1:0]	g_mean_out_mean;
	wire 	[`COLOR_DEPTH-1:0]	b_mean_out_mean;
	wire 						valid_out_mean;
	wire 	[`COLOR_BIT_CNT-1:0]color_out_mean;
	wire 						last_pic_out_mean;

	wire 						valid_in_gain;
	wire 	[`COLOR_DEPTH-1:0]	r_mean_in_gain;
	wire 	[`COLOR_DEPTH-1:0]	g_mean_in_gain;
	wire 	[`COLOR_DEPTH-1:0]	b_mean_in_gain;
	wire 						valid_out_gain;
	wire 	[`GAIN_BIT_CNT-1:0]	k_r_out_gain;
	wire 	[`GAIN_BIT_CNT-1:0]	k_g_out_gain;
	wire 	[`GAIN_BIT_CNT-1:0]	k_b_out_gain;

	wire						valid_value_in_wb;
	wire 	[`COLOR_DEPTH-1:0]	pixel_in_wb;
	wire 	[`COLOR_BIT_CNT-1:0]color_in_wb;
	wire						valid_gain_in_wb;
	wire 	[`GAIN_BIT_CNT-1:0]	k_r_in_wb;
	wire 	[`GAIN_BIT_CNT-1:0]	k_g_in_wb;
	wire 	[`GAIN_BIT_CNT-1:0]	k_b_in_wb;
	wire						valid_value_out_wb;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out_wb;
	wire 	[`COLOR_BIT_CNT-1:0]color_out_wb;
	wire 						last_pic_out_wb;

	wire 	[`COLOR_DEPTH-1:0]	pixel_in_gamma;
	wire 						valid_in_gamma;
	wire 	[`COLOR_BIT_CNT-1:0]color_in_gamma;
	wire 						last_pic_in_gamma;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out_gamma;
	wire 						valid_out_gamma;
	wire 	[`COLOR_BIT_CNT-1:0]color_out_gamma;
	wire 						last_pic_out_gamma;

demosaic demosaic(
	.clk(clk),
	.rst_n(rst_n),
	.valid(valid_in_dem),
	.data_in(pixel_in_dem),
	.end_col(last_col_in_dem),
	.end_pic(last_pic_in_dem),
	.RGB_valid(valid_out_dem),
	.RGB_data(pixel_out_dem),
	.color(color_out_dem),
	.col_last(last_col_out_dem),
	.pic_last(last_pic_out_dem)
);
denoise denoise(
	.clk(clk),
	.rst_n(rst_n),
	.pixel_in(pixel_in_den),
	.valid_in(valid_in_den),
	.color_in(color_in_den),
	.last_col_in(last_col_in_den),
	.last_pic_in(last_pic_in_den),
	.pixel_out(pixel_out_den),
	.valid_out(valid_out_den),
	.color_out(color_out_den),
	.last_col_out(last_col_out_den),
	.last_pic_out(last_pic_out_den)
);


Mean mean(
	.clk(clk), 
	.rst_n(rst_n),
	.valid_i(valid_in_mean),  //from denoise 
	.color_i(color_in_mean),
	.value_i(pixel_in_mean),
	.last_i(last_pic_in_mean), //finish signal
	.size_i(size_top_wire), //(k+m) specify images size 2^k * 2^m 
	.r_mean_o(r_mean_out_mean),
	.g_mean_o(g_mean_out_mean),
	.b_mean_o(b_mean_out_mean),
	.valid_o(valid_out_mean),	// ???
	.color_o(color_out_mean),	// ???
	.last_o(last_pic_out_mean)	// ???
);

Gain gain(
	.clk(clk),
	.rst_n(rst_n),
	.valid_i(valid_in_gain),
	.r_mean_i(r_mean_in_gain),
	.g_mean_i(g_mean_in_gain),
	.b_mean_i(b_mean_in_gain),
	.K_R_o(k_r_out_gain),
	.K_G_o(k_g_out_gain),
	.K_B_o(k_b_out_gain),
	.valid_gain_o(valid_out_gain) //change to valid_gain
	);

WB wb(
	.clk(clk),
	.rst_n(rst_n),
	.valid_value_i(valid_value_in_wb), //mode 2(WB ->GAMMA ->OUTPUT) start
	.color_i(color_in_wb),
	.value_i(pixel_in_wb),
	.valid_gain_i(valid_gain_in_wb),
	.K_R(k_r_in_wb),
	.K_G(k_g_in_wb),
	.K_B(k_b_in_wb),
	.value_o(pixel_out_wb),
	.valid_o(valid_value_out_wb),
	.color_o(color_out_wb)
	);

gamma_122 gamma(
	.clk(clk),
	.rst_n(rst_n),
	.pixel_in(pixel_in_gamma),
	.valid_in(valid_in_gamma),
	.color_in(color_in_gamma),
	.last_pic_in(last_pic_in_gamma),
	.pixel_out(pixel_out_gamma),
	.valid_out(valid_out_gamma),
	.color_out(color_out_gamma),
	.last_pic_out(last_pic_out_gamma)
);



endmodule
