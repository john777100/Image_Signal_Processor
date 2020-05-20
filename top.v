module top(
	input						clk,
	input						rst,
	input 	[`COLOR_DEPTH-1:0]	pixel_in,
	input						valid_in,
	input	[2:0]				color_in,
	input						last_rows_in,
	input						last_pic_in,
	input	[3:0]				mode,
	output 	[`COLOR_DEPTH-1:0]	pixel_out,
	output						valid_out,
	output  [2:0]				color_out,
	output						last_rows_out,
	output						last_pic_out,



	denoise


);
