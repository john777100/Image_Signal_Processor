`timescale 1ns/10ps
`define CYCLE 10
module TB();
	reg clk, rst_n;

	//for inout of mean
	reg valid_value_i, valid_gain_i;
	reg [1:0] color_i;
	reg [7:0] value_i;
	reg [15:0] K_R, K_G, K_B;

	wire valid_o;
	wire [1:0] color_o;
	wire [7:0] value_o; 

	//dump fsdb
	initial begin
		$fsdbDumpfile("WB.fsdb");
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
	end

	//assign value
	initial begin
		valid_value_i = 1'b1;
		valid_gain_i = 1'b1;
		K_R = 16'b0000111111110000;
		K_B = 16'b1111000000001111;
		K_G = 16'b1100110011001100;
		#(`CYCLE) color_i = 2'b00; value_i = 8'b00001111;//R
 		#(`CYCLE) color_i = 2'b01; value_i = 8'b11110000;//G
 		#(`CYCLE) color_i = 2'b10; value_i = 8'b11001100;//B

	end

	//component
	WB wb(.clk(clk),.rst_n(rst_n),.valid_value_i(valid_value_i),.valid_gain_i(valid_gain_i),.color_i(color_i),
		.value_i(value_i),.K_R(K_R),.K_G(K_G),.K_B(K_B),.valid_o(valid_o),.color_o(color_o),.value_o(value_o));

endmodule