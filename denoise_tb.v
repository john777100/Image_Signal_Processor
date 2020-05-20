`timescale 1ns/10ps
`define CYCLE 	10
`define INPAT_FILE 	"denoise_input.pat"
`define GOLDEN_FILE	"denoise_golden.pat"
`define COLOR_DEPTH 8

`define INPUT_LENGTH 72
`define OUTPUT_LENGTH 40
module denoise_tb;

	localparam RED		= 2'd0;
	localparam GREEN	= 2'd1;
	localparam BLUE		= 2'd2;
	localparam VOID		= 2'd3;
	reg clk;
	reg rst;
	reg [`COLOR_DEPTH-1:0]	pixel_in;
	reg			valid_in;
	reg	[2:0]	color_in;
	reg			last_in;
	wire 	[`COLOR_DEPTH-1:0]	pixel_out;
	wire			valid_out;
	wire  [2:0]	color_out;
	wire			last_out;

	integer dumb, cnt, error, finished, input_pat, golden_pat,output_cnt, color, i;

	denoise dn(.clk(clk), .rst(rst), .pixel_in(pixel_in), .valid_in(valid_in), .color_in(color_in), .last_in(last_in),
	.pixel_out(pixel_out), .valid_out(valid_out), .color_out(color_out), .last_out(last_out));
	reg	[`COLOR_DEPTH-1:0] r_input [0:`INPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] g_input [0:`INPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] b_input [0:`INPUT_LENGTH-1];

	reg	[`COLOR_DEPTH-1:0] r_golden [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] g_golden [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] b_golden [0:`OUTPUT_LENGTH-1];

	reg	[`COLOR_DEPTH-1:0] r_output [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] g_output [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] b_output [0:`OUTPUT_LENGTH-1];

    initial begin
        // $dumpfile("cache.vcd");
        // $dumpvars;
        $fsdbDumpfile( "denoise_wave.fsdb" );
        $fsdbDumpvars(0,denoise_tb, "+mda");
    end
    
    // abort if the design cannot halt
    initial begin
        #(`CYCLE * 1000 );
        $display( "\n" );
        $display( "Your design doesn't finish all operations in reasonable interval." );
        $display( "Terminated at: ", $time, " ns" );
        $display( "\n" );
        $finish;
    end
    
    // clock
    initial begin
        clk = 1'b0;
        forever #(`CYCLE * 0.5) clk = ~clk;
    end
    
    
	// Read in/out pattern
    initial begin
        cnt = 0;
        error = 0;
        finished = 0;
        input_pat = $fopen(`INPAT_FILE , "r");
        golden_pat = $fopen(`GOLDEN_FILE , "r");

        while(!$feof(input_pat)) begin
            dumb = $fscanf(input_pat, "%b %b %b", r_input[cnt], g_input[cnt], b_input[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(golden_pat)) begin
            dumb = $fscanf(golden_pat, "%b %b %b", r_golden[cnt], g_golden[cnt], b_golden[cnt]);
            cnt = cnt + 1;
        end
        $fclose(input_pat);
        $fclose(golden_pat);
    end
	
	// sending input pattern 
	initial begin
		rst = 1'b1;
		#(`CYCLE * 3)
		for( i=0; i<`INPUT_LENGTH; i=i+1) begin
			@(negedge clk) begin
				rst = 1'b0;
				pixel_in = r_input[i];
				valid_in = 1'b1;
				color_in = RED;
				last_in = i == `INPUT_LENGTH -1 ? 1'b1 : 1'b0;
				#(`CYCLE/2);
			end
			@(negedge clk) begin
				pixel_in = g_input[i];
				valid_in = 1'b1;
				color_in = GREEN;
				last_in = i == `INPUT_LENGTH -1 ? 1'b1 : 1'b0;
				#(`CYCLE/2);
			end
			@(negedge clk) begin
				pixel_in = b_input[i];
				valid_in = 1'b1;
				color_in = BLUE;
				last_in = i == `INPUT_LENGTH -1 ? 1'b1 : 1'b0;
				#(`CYCLE/2);
			end

		end
		@(negedge clk)
		color_in = VOID;
	end
	// testing output pattern 
	initial begin
		output_cnt = 0;
		while(output_cnt != `OUTPUT_LENGTH) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_out !== (output_cnt === `OUTPUT_LENGTH-1)) begin
						error = error+1;
						$display("\"last\" flag error at pixel %d", output_cnt+1 );

					end
					case(color_out)
						RED: begin
							if(r_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Red of Pixel %d error, expected %b, output %b\n", output_cnt+1, r_golden[output_cnt] , pixel_out );
							end
						end
						GREEN: begin
							if(g_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Green of Pixel %d error, expected %b, output %b\n", output_cnt+1, g_golden[output_cnt] , pixel_out );
							end

						end
						BLUE: begin
							if(b_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Blue of Pixel %d error, expected %b, output %b\n", output_cnt+1, b_golden[output_cnt] , pixel_out );
							end
							output_cnt = output_cnt+1;
						end
						VOID: begin
                    		$display("Pixel %d error, VOID color is given\n", output_cnt+1 );
							error = error+1;				
						end
					endcase
				end

			end
		end
        #(`CYCLE/2)
        $display("--------------------------- Simulation Stops !!---------------------------");
        if(error) begin
            $display("============================================================================");
            $display("\n (T_T) ERROR found!! There are %d errors in total.\n", error);
            $display("============================================================================");
        end
        else begin
            $display("============================================================================");
            $display("\n");
            $display("        ****************************              ");
            $display("        **                        **        /|__/|");
            $display("        **  Congratulations !!    **      / O,O  |");
            $display("        **                        **    /_____   |");
            $display("        **  Simulation Complete!! **   /^ ^ ^ \\  |");
            $display("        **                        **  |^ ^ ^ ^ |w|");
            $display("        *************** ************   \\m___m__|_|");
            $display("\n");
            $display("============================================================================");
        end
    $finish;
		
		
	end

endmodule
