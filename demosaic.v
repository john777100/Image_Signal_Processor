module demosaic(
        clk,
        rst_n,
        start,
        valid,
        data_in,
        end_col,
        end_pic,

        RGB_valid,
        RGB_data,
        color,
        col_last,
        pic_last
        );

// for software
input           clk;
input           rst_n;
input           start;
input           valid;
input   [7:0]   data_in;
input           end_col;
input           end_pic;
// for denoise
output          RGB_valid;
output  [7:0]   RGB_data;
output  [1:0]   color;
output          col_last;
output          pic_last;

// position FSM
parameter   IDLE        = 4'b0000;
parameter   INIT_COL1   = 4'b0001;
parameter   INIT_COL2   = 4'b0010;
parameter   NEW_COL_RG  = 4'b0011;
parameter   NEW_COL_GR  = 4'b0100;
parameter   NEW_COL_GB  = 4'b0101;
parameter   NEW_COL_BG  = 4'b0110;
parameter   PATTERN_RGR = 4'b0111;
parameter   PATTERN_GRG = 4'b1000;
parameter   PATTERN_GBG = 4'b1001;
parameter   PATTERN_BGB = 4'b1010;
// logic FSM
parameter   STAGE1      = 3'b000;
parameter   RGR_STAGE2  = 3'b001; // output R
parameter   GRG_STAGE2  = 3'b010; // output R
parameter   GBG_STAGE2  = 3'b011; // output R
parameter   BGB_STAGE2  = 3'b100; // output R
parameter   OUTPUT_G    = 3'b101;
parameter   OUTPUT_B    = 3'b110; // including stage 1

integer i;

// input reg
reg         start_r;
reg         valid_r;
reg [7:0]   data_in_r;
reg         end_col_r;
reg         end_pic_r;

reg [3:0]   state_r, state_w;
reg [2:0]   logic_state_r, logic_state_w;
reg [2:0]   counter_r, counter_w;
reg         RGB_valid_r, RGB_valid_w;
reg [7:0]   RGB_data_r, RGB_data_w;
reg [7:0]   G_data_r, G_data_w;
reg [7:0]   B_data_r, B_data_w;
reg [1:0]   color_r, color_w;
reg [9:0]   col1_r[0:7], col1_w[0:7];
reg [9:0]   col2_r[0:7], col2_w[0:7];
reg [9:0]   col3_r[0:7], col3_w[0:7];
reg         col_last_r, col_last_w;
reg         col_last_buf_r, col_last_buf_w;
reg         pic_last_r, pic_last_w;
reg         pic_last_buf_r, pic_last_buf_w;
reg [9:0]   up_sum_r, up_sum_w;
reg [9:0]   down_sum_r, down_sum_w;
reg [9:0]   hor_sum_r, hor_sum_w;
reg [9:0]   ver_sum_r, ver_sum_w;
reg [9:0]   cen_r, cen_w;
wire [9:0]  pixel1, pixel2, pixel3, pixel4, pixel5, pixel6, pixel7, pixel8, pixel9;

// output reg
assign RGB_valid = RGB_valid_r;
assign RGB_data = RGB_data_r;
assign color = color_r;
assign col_last = col_last_r;
assign pic_last = pic_last_r;

//  pixel position
//  1   2   3
//  4   5   6
//  7   8   9
assign pixel1 = col1_r[counter_r - 2];
assign pixel2 = col2_r[counter_r - 2];
assign pixel3 = col3_r[counter_r - 2];
assign pixel4 = col1_r[counter_r - 1];
assign pixel5 = col2_r[counter_r - 1];
assign pixel6 = col3_r[counter_r - 1];
assign pixel7 = col1_r[counter_r];
assign pixel8 = col2_r[counter_r];
assign pixel9 = data_in_r;

always@(*) begin
    logic_state_w = logic_state_r;
    up_sum_w = up_sum_r;
    down_sum_w = down_sum_r;
    hor_sum_w = hor_sum_r;
    ver_sum_w = ver_sum_r;
    cen_w = cen_r;
    RGB_valid_w = RGB_valid_r;
    RGB_data_w = RGB_data_r;
    G_data_w = G_data_r;
    B_data_w = B_data_r;
    color_w = color_r;
    col_last_w = col_last_r;
    pic_last_w = pic_last_r;
    col_last_buf_w = col_last_buf_r;
    pic_last_buf_w = pic_last_buf_r;
    case(logic_state_r)
        STAGE1: begin
            if (valid_r) begin
                if (state_r == PATTERN_RGR) begin
                    logic_state_w = RGR_STAGE2;
                end
                else if (state_r == PATTERN_GRG) begin
                    logic_state_w = GRG_STAGE2;
                end
                else if (state_r == PATTERN_GBG) begin
                    logic_state_w = GBG_STAGE2;
                end
                else if (state_r == PATTERN_BGB) begin
                    logic_state_w = BGB_STAGE2;
                end
                else begin
                    logic_state_w = STAGE1;
                end
                up_sum_w = pixel1 + pixel3;
                down_sum_w = pixel7 + pixel9;
                hor_sum_w = pixel4 + pixel6;
                ver_sum_w = pixel2 + pixel8;
                cen_w = pixel5;
                if (end_col_r) begin
                    col_last_buf_w = 1'b1;
                end
                else begin
                    col_last_buf_w = 1'b0;
                end
                if (end_pic_r) begin
                    pic_last_buf_w = 1'b1;
                end
                else begin
                    pic_last_buf_w = 1'b0;
                end
            end
            else begin
                logic_state_w = STAGE1;
                up_sum_w = up_sum_r;
                down_sum_w = down_sum_r;
                hor_sum_w = hor_sum_r;
                ver_sum_w = ver_sum_r;
                cen_w = cen_r;
                col_last_buf_w = col_last_buf_r;
                pic_last_buf_w = pic_last_buf_r;
            end
            RGB_valid_w = 1'b0;
            color_w = color_r;
            col_last_w = 1'b0;
            pic_last_w = 1'b0;
        end
        RGR_STAGE2: begin
            logic_state_w = OUTPUT_G;
            RGB_valid_w = 1'b1;
            RGB_data_w = (up_sum_r + down_sum_r) >> 2; // output R
            G_data_w = (hor_sum_r + ver_sum_r) >> 2;
            B_data_w = cen_r;
            color_w = 2'b00; // R
            col_last_w = col_last_buf_r;
            pic_last_w = pic_last_buf_r;
        end
        GRG_STAGE2: begin
            logic_state_w = OUTPUT_G;
            RGB_valid_w = 1'b1;
            RGB_data_w = hor_sum_r >> 1; // output R
            G_data_w = cen_r;
            B_data_w = ver_sum_r >> 1;
            color_w = 2'b00; // R
            col_last_w = col_last_buf_r;
            pic_last_w = pic_last_buf_r;
        end
        GBG_STAGE2: begin
            logic_state_w = OUTPUT_G;
            RGB_valid_w = 1'b1;
            RGB_data_w = ver_sum_r >> 1; // output R
            G_data_w = cen_r;
            B_data_w = hor_sum_r >> 1;
            color_w = 2'b00; // R
            col_last_w = col_last_buf_r;
            pic_last_w = pic_last_buf_r;
        end
        BGB_STAGE2: begin
            logic_state_w = OUTPUT_G;
            RGB_valid_w = 1'b1;
            RGB_data_w = cen_r; // output R
            G_data_w = (hor_sum_r + ver_sum_r) >> 2;
            B_data_w = (up_sum_r + down_sum_r) >> 2;
            color_w = 2'b00; // R
            col_last_w = col_last_buf_r;
            pic_last_w = pic_last_buf_r;
        end
        OUTPUT_G: begin
            logic_state_w = OUTPUT_B;
            RGB_valid_w = 1'b1;
            RGB_data_w = G_data_r; // output G
            G_data_w = G_data_r;
            B_data_w = B_data_r;
            color_w = 2'b01; // G
            col_last_w = col_last_r;
            pic_last_w = pic_last_r;
        end
        OUTPUT_B: begin
            if (valid_r) begin
                if (state_r == PATTERN_RGR) begin
                    logic_state_w = RGR_STAGE2;
                end
                else if (state_r == PATTERN_GRG) begin
                    logic_state_w = GRG_STAGE2;
                end
                else if (state_r == PATTERN_GBG) begin
                    logic_state_w = GBG_STAGE2;
                end
                else if (state_r == PATTERN_BGB) begin
                    logic_state_w = BGB_STAGE2;
                end
                else begin
                    logic_state_w = STAGE1;
                end
                up_sum_w = pixel1 + pixel3;
                down_sum_w = pixel7 + pixel9;
                hor_sum_w = pixel4 + pixel6;
                ver_sum_w = pixel2 + pixel8;
                cen_w = pixel5;
                if (end_col_r) begin
                    col_last_buf_w = 1'b1;
                end
                else begin
                    col_last_buf_w = 1'b0;
                end
                if (end_pic_r) begin
                    pic_last_buf_w = 1'b1;
                end
                else begin
                    pic_last_buf_w = 1'b0;
                end
            end
            else begin
                logic_state_w = STAGE1;
                up_sum_w = up_sum_r;
                down_sum_w = down_sum_r;
                hor_sum_w = hor_sum_r;
                ver_sum_w = ver_sum_r;
                cen_w = cen_r;
                col_last_buf_w = col_last_buf_r;
                pic_last_buf_w = pic_last_buf_r;
            end
            RGB_valid_w = 1'b1;
            RGB_data_w = B_data_r; // output B
            G_data_w = G_data_r;
            B_data_w = B_data_r;
            color_w = 2'b10; // B
            col_last_w = col_last_r;
            pic_last_w = pic_last_r;
        end
    endcase
end

always@(*) begin
    state_w = state_r;
    counter_w = counter_r;
    for (i = 0; i < 8; i = i + 1) begin
        col1_w[i] = col1_r[i];
        col2_w[i] = col2_r[i];
        col3_w[i] = col3_r[i];
    end
    case(state_r)
        IDLE: begin
            if (start_r) state_w = INIT_COL1;
            else state_w = IDLE;
            counter_w = 3'b0;
        end
        INIT_COL1: begin
            for (i = 0; i < 8; i = i + 1) col1_w[i] = col1_r[i];
            if (valid_r) begin
                if (counter_r == 3'd7) begin
                    state_w = INIT_COL2;
                    counter_w = 3'b0;
                end
                else begin
                    state_w = INIT_COL1;
                    counter_w = counter_r + 1;
                end
                col1_w[counter_r] = data_in_r;
            end
            else begin
                state_w = INIT_COL1;
                counter_w = counter_r;
            end
        end
        INIT_COL2: begin
            for (i = 0; i < 8; i = i + 1) col2_w[i] = col2_r[i];
            if (valid_r) begin
                if (counter_r == 3'd7) begin
                    state_w = NEW_COL_RG;
                    counter_w = 3'b0;
                end
                else begin
                    state_w = INIT_COL2;
                    counter_w = counter_r + 1;
                end
                col2_w[counter_r] = data_in_r;
            end
            else begin
                state_w = INIT_COL2;
                counter_w = counter_r;
            end
        end
        NEW_COL_RG: begin
            for (i = 0; i < 8; i = i + 1) col3_w[i] = col3_r[i];
            if (valid_r) begin
                if (counter_r == 3'd1) begin
                    state_w = PATTERN_RGR;
                    counter_w = counter_r + 1;
                end
                else begin
                    state_w = NEW_COL_RG;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = NEW_COL_RG;
                counter_w = counter_r;
            end
        end
        NEW_COL_GR: begin
            for (i = 0; i < 8; i = i + 1) col3_w[i] = col3_r[i];
            if (valid_r) begin
                if (counter_r == 3'd1) begin
                    state_w = PATTERN_GRG;
                    counter_w = counter_r + 1;
                end
                else begin
                    state_w = NEW_COL_GR;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = NEW_COL_GR;
                counter_w = counter_r;
            end
        end
        NEW_COL_GB: begin
            for (i = 0; i < 8; i = i + 1) col3_w[i] = col3_r[i];
            if (valid_r) begin
                if (counter_r == 3'd1) begin
                    state_w = PATTERN_GBG;
                    counter_w = counter_r + 1;
                end
                else begin
                    state_w = NEW_COL_GB;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = NEW_COL_GB;
                counter_w = counter_r;
            end
        end
        NEW_COL_BG: begin
            for (i = 0; i < 8; i = i + 1) col3_w[i] = col3_r[i];
            if (valid_r) begin
                if (counter_r == 3'd1) begin
                    state_w = PATTERN_BGB;
                    counter_w = counter_r + 1;
                end
                else begin
                    state_w = NEW_COL_BG;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = NEW_COL_BG;
                counter_w = counter_r;
            end
        end
        PATTERN_RGR: begin
            if (valid_r) begin
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
                if (end_col_r) begin
                    state_w = INIT_COL1;
                    counter_w = 3'b0;
                end
                else if (counter_r == 3'd7) begin
                    state_w = NEW_COL_BG;
                    counter_w = 3'b0;
                    for (i = 0; i < 8; i = i + 1) col1_w[i] = col2_r[i];
                    for (i = 0; i < 8; i = i + 1) col2_w[i] = col3_r[i];
                    col2_w[7] = data_in_r;
                end
                else begin
                    state_w = PATTERN_GRG;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = PATTERN_RGR;
                counter_w = counter_r;
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
            end
        end
        PATTERN_GRG: begin
            if (valid_r) begin
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
                if (end_col_r) begin
                    state_w = INIT_COL1;
                    counter_w = 3'b0;
                end
                else if (counter_r == 3'd7) begin
                    state_w = NEW_COL_GB;
                    counter_w = 3'b0;
                    for (i = 0; i < 8; i = i + 1) col1_w[i] = col2_r[i];
                    for (i = 0; i < 8; i = i + 1) col2_w[i] = col3_r[i];
                    col2_w[7] = data_in_r;
                end
                else begin
                    state_w = PATTERN_RGR;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = PATTERN_GRG;
                counter_w = counter_r;
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
            end
        end
        PATTERN_GBG: begin
            if (valid_r) begin
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
                if (end_col_r) begin
                    state_w = INIT_COL1;
                    counter_w = 3'b0;
                end
                else if (counter_r == 3'd7) begin
                    state_w = NEW_COL_GR;
                    counter_w = 3'b0;
                    for (i = 0; i < 8; i = i + 1) col1_w[i] = col2_r[i];
                    for (i = 0; i < 8; i = i + 1) col2_w[i] = col3_r[i];
                    col2_w[7] = data_in_r;
                end
                else begin
                    state_w = PATTERN_BGB;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = PATTERN_GBG;
                counter_w = counter_r;
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
            end
        end
        PATTERN_BGB: begin
            if (valid_r) begin
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
                if (end_col_r) begin
                    state_w = INIT_COL1;
                    counter_w = 3'b0;
                end
                else if (counter_r == 3'd7) begin
                    state_w = NEW_COL_RG;
                    counter_w = 3'b0;
                    for (i = 0; i < 8; i = i + 1) col1_w[i] = col2_r[i];
                    for (i = 0; i < 8; i = i + 1) col2_w[i] = col3_r[i];
                    col2_w[7] = data_in_r;
                end
                else begin
                    state_w = PATTERN_GBG;
                    counter_w = counter_r + 1;
                end
                col3_w[counter_r] = data_in_r;
            end
            else begin
                state_w = PATTERN_BGB;
                counter_w = counter_r;
                for (i = 0; i < 8; i = i + 1) begin
                    col1_w[i] = col1_r[i];
                    col2_w[i] = col2_r[i];
                    col3_w[i] = col3_r[i];
                end
            end
        end
    endcase
end

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        start_r <= 1'b0;
        valid_r <= 1'b0;
        data_in_r <= 8'b0;
        end_col_r <= 1'b0;
        end_pic_r <= 1'b0;
        state_r <= 4'b0;
        logic_state_r <= 3'b0;
        counter_r <= 3'b0;
        for (i = 0; i < 8; i = i + 1) begin
            col1_r[i] <= 10'b0;
            col2_r[i] <= 10'b0;
            col3_r[i] <= 10'b0;
        end
        up_sum_r <= 10'b0;
        down_sum_r <= 10'b0;
        hor_sum_r <= 10'b0;
        ver_sum_r <= 10'b0;
        cen_r <= 10'b0;
        RGB_valid_r <= 1'b0;
        RGB_data_r <= 8'b0;
        G_data_r <= 8'b0;
        B_data_r <= 8'b0;
        color_r <= 2'b00;
        col_last_r <= 1'b0;
        col_last_buf_r <= 1'b0;
        pic_last_r <= 1'b0;
        pic_last_buf_r <= 1'b0;
    end
    else begin
        start_r <= start;
        valid_r <= valid;
        data_in_r <= data_in;
        end_col_r <= end_col;
        end_pic_r <= end_pic;
        state_r <= state_w;
        logic_state_r <= logic_state_w;
        counter_r <= counter_w;
        for (i = 0; i < 8; i = i + 1) begin
            col1_r[i] <= col1_w[i];
            col2_r[i] <= col2_w[i];
            col3_r[i] <= col3_w[i];
        end
        up_sum_r <= up_sum_w;
        down_sum_r <= down_sum_w;
        hor_sum_r <= hor_sum_w;
        ver_sum_r <= ver_sum_w;
        cen_r <= cen_w;
        RGB_valid_r <= RGB_valid_w;
        RGB_data_r <= RGB_data_w;
        G_data_r <= G_data_w;
        B_data_r <= B_data_w;
        color_r <= color_w;
        col_last_r <= col_last_w;
        col_last_buf_r <= col_last_buf_w;
        pic_last_r <= pic_last_w;
        pic_last_buf_r <= pic_last_buf_w;
    end
end

endmodule
