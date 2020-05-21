
`define PROCESS_ROW_COUNT 4
`define INPUT_ROW_COUNT 6
`define COLOR_DEPTH 	8
`define WIN_RADIUS 		1
`define GAIN_BIT_CNT	16

//color
`define COLOR_BIT_CNT	2
`define RED 			2'd0
`define GREEN 			2'd1
`define BLUE 			2'd2
`define VOID			2'd3

//stage for human noly
`define DEMOSAIC		1
`define DENOISE			2
`define MEAN			3
`define GAIN			4
`define WB				5
`define GAMMA			6

//mode
`define MODE_BIT_CNT	4
`define STAGE11			4'd0
`define	STAGE22			4'd1
`define STAGE33			4'd2
`define STAGE44			4'd3
`define STAGE55			4'd4
`define STAGE66			4'd5
`define STAGE12			4'd6
`define STAGE34			4'd7
`define STAGE14			4'd8
`define STAGE56S		4'd9
`define STAGE56			4'd10
`define SET_REG			4'd11
`define READ_REG		4'd12


//reg_selection
`define PIC_SIZE_REG	2'd0
`define RED_GAIN		2'd1
`define GREEN_GAIN		2'd2
`define BLUE_GAIN		2'd3
