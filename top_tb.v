`timescale 1ns/10ps
include "define.v"
`define CYCLE 	10
`define IMG_FILE 	"image.pat"
`define DEM_FILE	"demosaic.pat"
`define DEN_FILE	"denoise.pat"
`define MEAN_FILE	"mean.pat"
`define GAIN_FILE	"gain.pat"
`define WB_FILE		"wb.pat"
`define GAM_FILE	"gamma.pat"

`define IMG_ROW 	1024
`define IMG_COL 	1024
`define IMG_LEN     IMG_ROW * (IMG_COL+4) * 2    
`define DEM_LEN 	IMG_ROW * (IMG_COL+2) * 3/2
`define DEN_LEN 	IMG_ROW * IMG_COL
`define MEAN_LEN 	1
`define GAIN_LEN 	1
`define WB_LEN 		IMG_ROW * IMG_COL
`define GAM_LEN 	IMG_ROW * IMG_COL
`define TERM_CYCLE  6000000


module top_tb;
	reg						clk;
	reg						rst_n;
	reg [`COLOR_DEPTH-1:0]	pixel_in;
	reg						valid_in;
	reg	[`COLOR_BIT_CNT-1:0]color_in;
	reg						last_col_in;
	reg						last_pic_in;
	reg	[`MODE_BIT_CNT-1:0]	mode_in;
	wire [`COLOR_DEPTH-1:0]		pixel_out;
	wire						valid_out;
	wire [`COLOR_BIT_CNT-1:0]	color_out;
	wire						last_col_out;
	wire						last_pic_out;
	wire						finish_operation;

	integer tb_finish_flag, dumb, cnt, error, img_file, dem_file, den_file, mean_file, gain_file, wb_file, gam_file, i, output_cnt;

	top top(
		.clk(clk),
		.rst_n(rst_n),
		.pixel_in(pixel_in),
		.valid_in(valid_in),
		.color_in(color_in),
		.last_col_in(last_col_in),
		.last_pic_in(last_pic_in),
		.mode_in(mode_in),
		.pixel_out(pixel_out),
		.valid_out(valid_out),
		.color_out(color_out),
		.last_col_out(last_col_out),
		.last_pic_out(last_pic_out),
		.finish_operation(finish_operation)
	);
	reg [`COLOR_DEPTH-1:0] img  [0:`IMG_LEN]
	
	reg	[`COLOR_DEPTH-1:0] dem_r_golden [0:`DEM_LEN-1];
	reg	[`COLOR_DEPTH-1:0] dem_g_golden [0:`DEM_LEN-1];
	reg	[`COLOR_DEPTH-1:0] dem_b_golden [0:`DEM_LEN-1];

	reg	[`COLOR_DEPTH-1:0] den_r_golden [0:`DEN_LEN-1];
	reg	[`COLOR_DEPTH-1:0] den_g_golden [0:`DEN_LEN-1];
	reg	[`COLOR_DEPTH-1:0] den_b_golden [0:`DEN_LEN-1];

	reg	[`COLOR_DEPTH-1:0] mean_r_golden;
	reg	[`COLOR_DEPTH-1:0] mean_g_golden;
	reg	[`COLOR_DEPTH-1:0] mean_b_golden;

	reg	[`GAIN_BIT_CNT-1:0] gain_r_golden;
	reg	[`GAIN_BIT_CNT-1:0] gain_g_golden;
	reg	[`GAIN_BIT_CNT-1:0] gain_b_golden;

	reg	[`COLOR_DEPTH-1:0] wb_r_golden [0:`WB_LEN-1];
	reg	[`COLOR_DEPTH-1:0] wb_g_golden [0:`WB_LEN-1];
	reg	[`COLOR_DEPTH-1:0] wb_b_golden [0:`WB_LEN-1];

	reg	[`COLOR_DEPTH-1:0] gam_r_golden [0:`GAN_LEN-1];
	reg	[`COLOR_DEPTH-1:0] gam_g_golden [0:`GAN_LEN-1];
	reg	[`COLOR_DEPTH-1:0] gam_b_golden [0:`GAN_LEN-1];
    
	
	initial begin
        $fsdbDumpfile( "denoise_wave.fsdb" );
        $fsdbDumpvars(0,denoise_tb, "+mda");
    end
    
    initial begin
        #(`CYCLE * `TERM_CYCLE );
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
        img_file = $fopen(`IMG_FILE , "r");
		dem_file = $fopen(`DEM_FILE , "r");
		den_file = $fopen(`DEN_FILE , "r");
		mean_file = $fopen(`MEAN_FILE , "r");
		gain_file = $fopen(`GAIN_FILE , "r");
		wb_file = $fopen(`WB_FILE , "r");
		gam_file = $fopen(`GAM_FILE , "r");

        while(!$feof(img_file)) begin
            dumb = $fscanf(img_file, "%b", img[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(dem_file)) begin
            dumb = $fscanf(dem_file, "%b %b %b", dem_r_golden[cnt], dem_g_golden[cnt], dem_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(den_file)) begin
            dumb = $fscanf(den_file, "%b %b %b", den_r_golden[cnt], den_g_golden[cnt], den_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(mean_file)) begin
            dumb = $fscanf(mean_file, "%b %b %b", mean_r_golden[cnt], mean_g_golden[cnt], mean_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(gain_file)) begin
            dumb = $fscanf(gain_file, "%b %b %b", gain_r_golden[cnt], gain_g_golden[cnt], gain_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(wb_file)) begin
            dumb = $fscanf(wb_file, "%b %b %b", wb_r_golden[cnt], wb_g_golden[cnt], wb_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        while(!$feof(gam_file)) begin
            dumb = $fscanf(gam_file, "%b %b %b", gam_r_golden[cnt], gam_g_golden[cnt], gam_b_golden[cnt]);
            cnt = cnt + 1;
        end
        cnt = 0;
        $fclose(img_file);
        $fclose(dem_file);
        $fclose(den_file);
        $fclose(mean_file);
        $fclose(gain_file);
        $fclose(wb_file);
        $fclose(gam_file);
    end

`ifdef STAGE14
	initial begin
		rst_n = 1'b0;
		#(`CYCLE *3)
		rst_n = 1'b1;
		@(negedge clk) mode = STAGE14;
		#(`CYCLE *3)
		for( i=0; i<`IMG_LEN; i=i+1 ) begin
			@(negedge clk) begin
				pixel_in = img[i];
				valid_in = 1'b1;
				color_in = VOID;
				last_col_in = i % (IMG_COL+4)*6 == (IMG_COL+4)*6-1;
				last_pic_in = i == `IMG_LEN-1;
				#(`CYCLE)
				valid_in = 1'b0;
				last_col_in = 1'b0;
				last_pic_in = 1'b0;
				#(`CYCLE *3/2)
			end
		end
	end
	initial begin
		tb_finish_flag = 0;
		output_cnt = 0;
		while(output_cnt != `OUTPUT_LENGTH) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_pic_out !== (output_cnt === `OUTPUT_LENGTH-1)) begin
						error = error+1;
						$display("\"last_pic_out\" flag error at pixel %d", output_cnt+1 );
					end
					if(last_col_out !== (output_cnt % ((IMG_COL+4)*6) == ((IMG_COL+4)*6-1) )) begin
						error = error+1;
						$display("\"last_col_out\" flag error at pixel %d", output_cnt+1 );
					end

					case(color_out)
						RED: begin
							if(den_r_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Red of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_r_golden[output_cnt] , pixel_out );
							end
						end
						GREEN: begin
							if(den_g_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Green of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_g_golden[output_cnt] , pixel_out );
							end

						end
						BLUE: begin
							if(den_b_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Blue of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_b_golden[output_cnt] , pixel_out );
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
		tb_finish_flag = 1;	
	end
`endif


initial begin
	while(finish_operation) begin
        #(`CYCLE/2)
        $display("--------------------------- Simulation Stops !!---------------------------");
		if(!tb_finish_flag) begin
			$display("Input not finish sending yet");
			$finish;
		end
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
end



endmodule
