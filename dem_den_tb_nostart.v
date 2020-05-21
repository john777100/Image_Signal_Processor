`timescale 1ns/10ps
`define CYCLE 	10
`define INPAT_FILE 	"demosaic_input.pat"
`define GOLDEN_FILE	"denoise_golden.pat"
`define COLOR_DEPTH 8
`define DENOISE_COL_COUNT 4
`define INPUT_LENGTH 128     // bayer: 8x12
`define OUTPUT_LENGTH 32    // output: 4x8
module dem_den_tb;

	localparam RED		= 2'd0;
	localparam GREEN	= 2'd1;
	localparam BLUE		= 2'd2;
	localparam VOID		= 2'd3;
	reg                         clk;
	reg                         rst_n;
    reg                         valid;
    reg     [`COLOR_DEPTH-1:0]  data_in;
    reg                         end_col;
    reg                         end_pic;
	wire			            RGB_valid;
	wire	[`COLOR_DEPTH-1:0]  RGB_data;
	wire	[1:0]	            color;
    wire                        col_last;
    wire                        pic_last;
	wire    [`COLOR_DEPTH-1:0]	pixel_out;
	wire			            valid_out;
	wire    [1:0]	            color_out;
	wire			            last_col_out;
	wire			            last_pic_out;

	integer dumb, cnt, error, finished, input_pat, golden_pat, output_cnt, i, j, k;

    demosaic dem(
            // demosaic
            .clk(clk),
            .rst_n(rst_n),
            .valid(valid),
            .data_in(data_in),
            .end_col(end_col),
            .end_pic(end_pic),
            // denoise
            .RGB_valid(RGB_valid),
            .RGB_data(RGB_data),
            .color(color),
            .col_last(col_last),
            .pic_last(pic_last)
            );

	denoise dn(
            // denoise
            .clk(clk), 
            .rst_n(rst_n), 
            .pixel_in(RGB_data), 
            .valid_in(RGB_valid), 
            .color_in(color), 
            .last_col_in(col_last),
            .last_pic_in(pic_last),
            // white balance
	        .pixel_out(pixel_out), 
            .valid_out(valid_out), 
            .color_out(color_out), 
            .last_col_out(last_col_out),
            .last_pic_out(last_pic_out)
            );

	reg	[`COLOR_DEPTH-1:0] bayer_input  [0:`INPUT_LENGTH-1];

	reg	[`COLOR_DEPTH-1:0] r_golden     [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] g_golden     [0:`OUTPUT_LENGTH-1];
	reg	[`COLOR_DEPTH-1:0] b_golden     [0:`OUTPUT_LENGTH-1];

    initial begin
        // $dumpfile("cache.vcd");
        // $dumpvars;
        $fsdbDumpfile( "dem_den.fsdb" );
        $fsdbDumpvars(0,dem_den_tb, "+mda");
    end

    // abort if the design cannot halt
    initial begin
        #(`CYCLE * 100000 );
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
            dumb = $fscanf(input_pat, "%b", bayer_input[cnt]);
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
        clk = 1'b0;
        rst_n = 1'b1;
        valid = 1'b0;
        data_in = 8'b0;
        end_col = 1'b0;
        end_pic = 1'b0;

        #(`CYCLE)       rst_n = 1'b0;
        #(`CYCLE*3)     rst_n = 1'b1;
        #(`CYCLE*5)

        for (i = 0; i < 128; i = i + 1) begin
            #(`CYCLE*2)
            data_in = bayer_input[i];
            valid = 1'b1;
            end_col = (i % 64 == 63);
            end_pic = i == 127;
            #(`CYCLE)
            valid = 1'b0;
            end_col = 1'b0;
            end_pic = 1'b0;
        end
    end

	// testing output pattern 
	initial begin
		output_cnt = 0;
		while(output_cnt != `OUTPUT_LENGTH) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_col_out !== (output_cnt%(`DENOISE_COL_COUNT*4) === `DENOISE_COL_COUNT*4 -1)) begin
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
