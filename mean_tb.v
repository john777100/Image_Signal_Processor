`timescale 1ns/10ps
`define CYCLE 10
module TB();
	reg clk, rst_n;

	//for inout of mean
	reg valid_i, last_i;
	reg [1:0] color_i;
	reg [7:0] value_i;
	reg [4:0] size_i;
	wire [7:0] r_mean_o, g_mean_o, b_mean_o;
	wire valid_o, last_o;
	wire [1:0] color_o;

	//for answer check
	reg [7:0] value_store [0:8];
	reg [1:0] color_store [0:9];
	reg valid_store [0:9];
	reg last_store 	[0:9];

	integer i;

	initial begin
		$readmemb("value.txt", value_store);
		$readmemb("color.txt", color_store);
		$readmemb("valid.txt", valid_store);
		$readmemb("last.txt", last_store);

		for(i=0; i<=8; i=i+1) begin
			#(`CYCLE) value_i=value_store[i]; color_i=color_store[i]; valid_i=valid_store[i]; last_i=last_store[i];  
		end
	end

	//dump fsdb
	initial begin
		$fsdbDumpfile("Mean.fsdb");
		$fsdbDumpMDA;
		$fsdbDumpvars;
	end

	//create a clk reset... finish signal
	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		size_i = 5'd1; //size = 1024x1024
		#5 rst_n = 1'b0;
		#5 rst_n = 1'b1;
	end
	always begin
		#5 clk = ~clk;
		if(last_o) begin
			// $display(K_R_o, K_G_o, K_B_o);
			$finish;
		end
	end

	//component
	Mean mean(.clk(clk),.rst_n(rst_n),.valid_i(valid_i),.color_i(color_i),.value_i(value_i),.last_i(last_i),.size_i(size_i),.r_mean_o(r_mean_o),
		.g_mean_o(g_mean_o),.b_mean_o(b_mean_o),.valid_o(valid_o),.color_o(color_o),.last_o(last_o));

endmodule