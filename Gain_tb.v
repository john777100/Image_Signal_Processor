`timescale 1ns/10ps
`define CYCLE 10
module MEAN_TB();
	reg clk, rst_n;

	//for inout of Gain
	reg valid_i;
	reg [7:0] r_mean_i, g_mean_i, b_mean_i, K_mean_i;
	wire finish_o;
	wire [15:0] K_R_o, K_G_o, K_B_o;

	//dump fsdb
	initial begin
		$fsdbDumpfile("gain.fsdb");
		$fsdbDumpMDA;
		$fsdbDumpvars;
	end

	//create a clk reset... finish signal
	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		#5 rst_n = 1'b0;
		#5 rst_n = 1'b1;
	end
	always begin
		#5 clk = ~clk;
		if(finish_o) begin
			$display(K_R_o, K_G_o, K_B_o);
			$finish;
		end
	end

	//input signal
	initial begin
		valid_i = 1'd0;
		r_mean_i = 8'd50;
		g_mean_i = 8'd100;
		b_mean_i = 8'd50;

		#3 valid_i = 1'd1;
	end

	//component
	Gain gain(.clk(clk), .rst_n(rst_n), .valid_i(valid_i), .r_mean_i(r_mean_i), .g_mean_i(g_mean_i), .b_mean_i(b_mean_i), 
		.K_R_o(K_R_o), .K_G_o(K_G_o), .K_B_o(K_B_o), .finish_o(finish_o));

endmodule