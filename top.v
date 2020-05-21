module top(
	input						clk,
	input						rst_n,
	input 	[`COLOR_DEPTH-1:0]	pixel_in,
	input						valid_in,
	input	[1:0]				color_in,
	input						last_col_in,
	input						last_pic_in,
	input	[3:0]				mode,
	output 	[`COLOR_DEPTH-1:0]	pixel_out,
	output						valid_out,
	output  [1:0]				color_out,
	output						last_col_out,
	output						last_pic_out,


	wire 	[`COLOR_DEPTH-1:0]	pixel_in,
	wire 						valid_in,
	wire 	[1:0]				color_in,
	wire 						last_col_in,
	wire 						last_pic_in,
	wire 	[`COLOR_DEPTH-1:0]	pixel_out,
	wire 						valid_out,
	wire 	[1:0]				color_out,
	wire 						last_col_out,
	wire 						last_pic_out,

demosaic demosaic(
	.clk(clk),
	.rst_n(rst_n),
	.start(),
	.valid(),
	.data_in(),
	.end_col(),
	.end_pic(),
	.RGB_valid(),
	.RGB_data(),
	.color(),
	.col_last(),
	.pic_last()
);
denoise denoise(
	.clk(clk),
	.rst_n(rst_n),
	.pixel_in(),
	.valid_in(),
	.color_in(),
	.last_col_in(),
	.last_pic_in(),
	.pixel_out(),
	.valid_out(),
	.color_out(),
	.last_col_out(),
	.last_pic_out()
);


Mean mean(
	.clk(clk), 
	.rst_n(rst_n),
	.valid_i(),  //from denoise 
	.color_i(),
	.value_i(),
	.last_i(), //finish signal
	.size_i(), //(k+m) specify images size 2^k * 2^m 
	.r_mean_o(),
	.g_mean_o(),
	.b_mean_o(),
	.valid_o(),
	.color_o(),
	.last_o()
	);
gamma_122 gamma(
	.clk(clk),
	.rst_n(rst_n),
	.pixel_in(),
	.valid_in(),
	.color_in(),
	.last_pic_in(),
	.pixel_out(),
	.valid_out(),
	.color_out(),
	.last_pic_out()
);

);
