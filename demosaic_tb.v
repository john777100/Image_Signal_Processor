`timescale 1 ns/10 ps

`define CYCLE 10 // You can modify your clock frequency

module test_tb;
    // demosiac signal
    reg         clk;
    reg         rst_n;
    reg         start;
    reg         valid;
    reg [7:0]   data_in;
    reg         end_col;
    reg         end_pic;
    // denoise signal
    wire        RGB_valid;
    wire [7:0]  RGB_data;
    wire [1:0]  color;
    wire        col_last;
    wire        pic_last;

    integer fp_output;
    integer i, j;

    reg [7:0]   memory [0:95];
   
    demosaic dem(
            // demosaic
            .clk(clk),
            .rst_n(rst_n),
            .start(start),
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

    `ifdef SDF
    initial $sdf_annotate(`SDFFILE, dem);
    `endif
/*
    initial begin
        $fsdbDumpfile("test.fsdb");
        $fsdbDumpvars;
    end
*/    
    initial begin
        $dumpfile("test.fsdb");
        $dumpvars;
    end
    
    always begin #(`CYCLE/2) clk = ~clk; end

    always@(posedge clk) begin
        if (RGB_valid) begin
            $fwrite(fp_output, "%h:", color);
            $fwrite(fp_output, "%h\n", RGB_data);
        end
    end


//  image pixel
//  0   1   2   3  ...  7
//  8   9   10  11 ...  15
//  .                   .
//  .                   .
//  88  89  90  91 ...  95

    initial begin
        $readmemh("test_image.dat", memory);
        fp_output = $fopen("dem_output", "w");
        clk = 1'b0;
        rst_n = 1'b1;
        start = 1'b0;
        valid = 1'b0;
        data_in = 8'b0;
        end_col = 1'b0;
        end_pic = 1'b0;

        #(`CYCLE)       rst_n = 1'b0;
        #(`CYCLE*3)     rst_n = 1'b1;
        #(`CYCLE*5)

        start = 1'b1;
        #(`CYCLE)
        start = 1'b0;

        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                #(`CYCLE*2)
                data_in = memory[i + 8 * j];
                valid = 1'b1;
                if (i == 7 && j == 7) begin
                    end_col = 1'b1;
                    end_pic = 1'b0;
                end
                #(`CYCLE)
                valid = 1'b0;
                end_col = 1'b0;
                end_pic = 1'b0;
            end
        end
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 4; j < 12; j = j + 1) begin
                #(`CYCLE*2)
                data_in = memory[i + 8 * j];
                valid = 1'b1;
                if (i == 7 && j == 11) begin
                    end_col = 1'b1;
                    end_pic = 1'b1;
                end
                #(`CYCLE)
                valid = 1'b0;
                end_col = 1'b0;
                end_pic = 1'b0;
            end
        end
        #(`CYCLE*10)
        $fclose(fp_output);
        #(`CYCLE*0.5)	$finish;
    end

endmodule

