`timescale 1ns/10ps
`include "define.v"
`include "top.v"
`define CYCLE 	10
`define IMG_DEM_FILE "demosaic_input.pat"
`define DEM_FILE	"demosaic_golden.pat"
`define DEN_FILE	"denoise_golden.pat"
`define MEAN_FILE	"mean_golden.pat"
`define GAIN_FILE	"gain_golden.pat"
`define IMG_WB_FILE "denoise_golden.pat"
`define WB_FILE		"wb_golden.pat"
`define GAM_FILE	"gamma_golden.pat"

`define IMG_ROW 	1024
`define IMG_COL 	1024
`define IMG_DEM_LEN `IMG_ROW * (`IMG_COL+4) * 2    
`define DEM_LEN 	`IMG_ROW * (`IMG_COL+2) * 3/2
`define DEN_LEN 	`IMG_ROW * `IMG_COL
`define MEAN_LEN 	1
`define GAIN_LEN 	1
`define IMG_WB_LEN 	`IMG_ROW * `IMG_COL    
`define WB_LEN 		`IMG_ROW * `IMG_COL
`define GAM_LEN 	`IMG_ROW * `IMG_COL

`define TERM_CYCLE  12000000


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

	integer  dumb, cnt, error, img_dem_file, dem_file, den_file, mean_file, gain_file, wb_file, gam_file, i, output_cnt, img_wb_file;
	integer  tb_finish_flag;
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
	reg [`COLOR_DEPTH-1:0] img_dem  [0:`IMG_DEM_LEN];
	reg [`COLOR_DEPTH-1:0] img_r_wb  [0:`IMG_WB_LEN];
	reg [`COLOR_DEPTH-1:0] img_g_wb  [0:`IMG_WB_LEN];
	reg [`COLOR_DEPTH-1:0] img_b_wb  [0:`IMG_WB_LEN];
	
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

	reg	[`COLOR_DEPTH-1:0] gam_r_golden [0:`GAM_LEN-1];
	reg	[`COLOR_DEPTH-1:0] gam_g_golden [0:`GAM_LEN-1];
	reg	[`COLOR_DEPTH-1:0] gam_b_golden [0:`GAM_LEN-1];
    
	
	initial begin
        $fsdbDumpfile( "top.fsdb" );
        $fsdbDumpvars(0,top, "+mda");
        $fsdbDumpvars(1,top_tb);
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
        img_dem_file = $fopen(`IMG_DEM_FILE , "r");
		dem_file = $fopen(`DEM_FILE , "r");
		den_file = $fopen(`DEN_FILE , "r");
		mean_file = $fopen(`MEAN_FILE , "r");
		gain_file = $fopen(`GAIN_FILE , "r");
        img_wb_file = $fopen(`IMG_WB_FILE , "r");
		wb_file = $fopen(`WB_FILE , "r");
		gam_file = $fopen(`GAM_FILE , "r");

        while(!$feof(img_dem_file)) begin
            dumb = $fscanf(img_dem_file, "%b", img_dem[cnt]);
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
        while(!$feof(img_wb_file)) begin
            dumb = $fscanf(img_wb_file, "%b %b %b", img_r_wb[cnt], img_g_wb[cnt], img_b_wb[cnt]);
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
        $fclose(img_dem_file);
        $fclose(dem_file);
        $fclose(den_file);
        $fclose(mean_file);
        $fclose(gain_file);
        $fclose(wb_file);
        $fclose(gam_file);
    end

`ifdef S14
	initial begin
		tb_finish_flag = 0;
		rst_n = 1'b0;
		pixel_in = 8'd0;
		valid_in = 1'b0;
		color_in = `VOID;
		last_col_in = 0;
		last_pic_in = 0;
		#(`CYCLE *3)
		rst_n = 1'b1;
		@(negedge clk) mode_in = `STAGE14;
		#(`CYCLE *3)
		for( i=0; i<`IMG_DEM_LEN; i=i+1 ) begin
			@(negedge clk) begin
				pixel_in = img_dem[i];
				valid_in = 1'b1;
				color_in = `VOID;
				last_col_in = (i % ((`IMG_COL+4)*8)) == ((`IMG_COL+4)*8-1);
				last_pic_in = i == `IMG_DEM_LEN-1;
				#(`CYCLE)
				valid_in = 1'b0;
				last_col_in = 1'b0;
				last_pic_in = 1'b0;
				#(`CYCLE *3/2);
			end
		end
		tb_finish_flag = 1;	
	end
	initial begin
		output_cnt = 0;
		while(output_cnt != `DEN_LEN) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_pic_out !== (output_cnt === `DEN_LEN-1)) begin
						error = error+1;
						$display("\"last_pic_out\" flag error at pixel %d", output_cnt+1 );
					end
					if(last_col_out !== (output_cnt % ((`IMG_COL)*4) == ((`IMG_COL)*4-1) )) begin
						error = error+1;
						$display("\"last_col_out\" flag error at pixel %d", output_cnt+1 );
					end

					case(color_out)
						`RED: begin
							if(den_r_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Red of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_r_golden[output_cnt] , pixel_out );
							end
						end
						`GREEN: begin
							if(den_g_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Green of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_g_golden[output_cnt] , pixel_out );
							end

						end
						`BLUE: begin
							if(den_b_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Blue of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_b_golden[output_cnt] , pixel_out );
							end
							output_cnt = output_cnt+1;
						end
						`VOID: begin
                    		$display("Pixel %d error, `VOID color is given\n", output_cnt+1 );
							error = error+1;				
						end
					endcase
				end

			end
		end
	end
`endif



`ifdef S1456
	initial begin
		//STAGE14
		tb_finish_flag = 0;
		rst_n = 1'b0;
		pixel_in = 8'd0;
		valid_in = 1'b0;
		color_in = `VOID;
		last_col_in = 0;
		last_pic_in = 0;
		#(`CYCLE *3)
		rst_n = 1'b1;
		@(negedge clk) mode_in = `STAGE14;
		#(`CYCLE *3)
		for( i=0; i<`IMG_DEM_LEN; i=i+1 ) begin
			@(negedge clk) begin
				pixel_in = img_dem[i];
				valid_in = 1'b1;
				color_in = `VOID;
				last_col_in = (i % ((`IMG_COL+4)*8)) == ((`IMG_COL+4)*8-1);
				last_pic_in = i == `IMG_DEM_LEN-1;
				#(`CYCLE)
				valid_in = 1'b0;
				last_col_in = 1'b0;
				last_pic_in = 1'b0;
				#(`CYCLE *3/2);
			end
		end
		wait(finish_operation);
		//STAGE56
		@(negedge clk) begin
		pixel_in = 8'd0;
		valid_in = 1'b0;
		color_in = `VOID;
		last_col_in = 0; // substitution for valid_gain_wb
		last_pic_in = 0;
		mode_in = `STAGE56;
		end
		#(`CYCLE *30)
		for( i=0; i<`IMG_WB_LEN; i=i+1 ) begin
			@(negedge clk) begin
				pixel_in = img_r_wb[i];
				valid_in = 1'b1;
				color_in = `RED;
				last_col_in = 0;
				last_pic_in = `IMG_WB_LEN-1 == i;
				#(`CYCLE/2);
			end
			@(negedge clk) begin
				pixel_in = img_g_wb[i];
				valid_in = 1'b1;
				color_in = `GREEN;
				last_col_in = 0;
				last_pic_in = `IMG_WB_LEN-1 == i;
				#(`CYCLE/2);
			end
			@(negedge clk) begin
				pixel_in = img_b_wb[i];
				valid_in = 1'b1;
				color_in = `BLUE;
				last_col_in = 0;
				last_pic_in = `IMG_WB_LEN-1 == i;
				#(`CYCLE/2);
			end
		end
		tb_finish_flag = 1;	
	end
	initial begin
		output_cnt = 0;
		while(output_cnt != `DEN_LEN) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_pic_out !== (output_cnt === `DEN_LEN-1)) begin
						error = error+1;
						$display("\"last_pic_out\" flag error at pixel %d", output_cnt+1 );
					end
					if(last_col_out !== (output_cnt % ((`IMG_COL)*4) == ((`IMG_COL)*4-1) )) begin
						error = error+1;
						$display("\"last_col_out\" flag error at pixel %d", output_cnt+1 );
					end

					case(color_out)
						`RED: begin
							if(den_r_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Red of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_r_golden[output_cnt] , pixel_out );
							end
						end
						`GREEN: begin
							if(den_g_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Green of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_g_golden[output_cnt] , pixel_out );
							end

						end
						`BLUE: begin
							if(den_b_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Blue of Pixel %d error, expected %b, output %b\n", output_cnt+1, den_b_golden[output_cnt] , pixel_out );
							end
							output_cnt = output_cnt+1;
						end
						`VOID: begin
                    		$display("Pixel %d error, `VOID color is given\n", output_cnt+1 );
							error = error+1;				
						end
					endcase
				end

			end
		end
		output_cnt = 0;
		while(output_cnt != `GAM_LEN) begin
			@(negedge clk) begin
				if(valid_out) begin
					if(last_pic_out !== (output_cnt === `GAM_LEN-1)) begin
						error = error+1;
						$display("\"last_pic_out\" flag error at pixel %d", output_cnt+1 );
					end

					case(color_out)
						`RED: begin
							if(gam_r_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Red of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_r_golden[output_cnt] , pixel_out );
							end
						end
						`GREEN: begin
							if(gam_g_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Green of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_g_golden[output_cnt] , pixel_out );
							end

						end
						`BLUE: begin
							if(gam_b_golden[output_cnt] !== pixel_out) begin
								error = error +1;
                    			$display("Blue of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_b_golden[output_cnt] , pixel_out );
							end
							output_cnt = output_cnt+1;
						end
						`VOID: begin
                    		$display("Pixel %d error, Void color is given\n", output_cnt+1 );
							error = error+1;				
						end
					endcase
				end

			end
		end
	end


`endif





// S56 test only tested when WB received valid_gain = 1 and all-time valid
// gain value
//`ifdef S56
//	initial begin
//		tb_finish_flag = 0;	
//		rst_n = 1'b0;
//		pixel_in = 8'd0;
//		valid_in = 1'b0;
//		color_in = `VOID;
//		last_col_in = 1; // substitution for valid_gain_wb
//		last_pic_in = 0;
//		#(`CYCLE *3)
//		rst_n = 1'b1;
//		@(negedge clk) mode_in = `STAGE56;
//		#(`CYCLE *3)
//		for( i=0; i<`IMG_WB_LEN; i=i+1 ) begin
//			@(negedge clk) begin
//				pixel_in = img_r_wb[i];
//				valid_in = 1'b1;
//				color_in = `RED;
//				last_col_in = 0;
//				last_pic_in = `IMG_WB_LEN-1 == i;
//				#(`CYCLE/2);
//			end
//			@(negedge clk) begin
//				pixel_in = img_g_wb[i];
//				valid_in = 1'b1;
//				color_in = `GREEN;
//				last_col_in = 0;
//				last_pic_in = `IMG_WB_LEN-1 == i;
//				#(`CYCLE/2);
//			end
//			@(negedge clk) begin
//				pixel_in = img_b_wb[i];
//				valid_in = 1'b1;
//				color_in = `BLUE;
//				last_col_in = 0;
//				last_pic_in = `IMG_WB_LEN-1 == i;
//				#(`CYCLE/2);
//			end
//		end
//		tb_finish_flag = 1;	
//	end
//	initial begin
//		output_cnt = 0;
//		while(output_cnt != `GAM_LEN) begin
//			@(negedge clk) begin
//				if(valid_out) begin
//					if(last_pic_out !== (output_cnt === `GAM_LEN-1)) begin
//						error = error+1;
//						$display("\"last_pic_out\" flag error at pixel %d", output_cnt+1 );
//					end
//
//					case(color_out)
//						`RED: begin
//							if(gam_r_golden[output_cnt] !== pixel_out) begin
//								error = error +1;
//                    			$display("Red of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_r_golden[output_cnt] , pixel_out );
//							end
//						end
//						`GREEN: begin
//							if(gam_g_golden[output_cnt] !== pixel_out) begin
//								error = error +1;
//                    			$display("Green of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_g_golden[output_cnt] , pixel_out );
//							end
//
//						end
//						`BLUE: begin
//							if(gam_b_golden[output_cnt] !== pixel_out) begin
//								error = error +1;
//                    			$display("Blue of Pixel %d error, expected %d, output %d\n", output_cnt+1, gam_b_golden[output_cnt] , pixel_out );
//							end
//							output_cnt = output_cnt+1;
//						end
//						`VOID: begin
//                    		$display("Pixel %d error, Void color is given\n", output_cnt+1 );
//							error = error+1;				
//						end
//					endcase
//				end
//
//			end
//		end
//	end
//`endif

initial begin
	wait(tb_finish_flag && finish_operation);
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
