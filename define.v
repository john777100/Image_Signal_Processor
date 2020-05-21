
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
`define MODE_BIT_CNT	3
`define STAGE11			3'd0
`define	STAGE22			3'd1
`define STAGE33			3'd2
`define STAGE44			3'd3
`define STAGE55			3'd4
`define STAGE66			3'd5
`define STAGE14			3'd6
`define STAGE56			3'd7


//reg_selection
//`define PIC_SIZE_REG	4'd0
//`define RED_GAIN_0		4'd1
//`define GREEN_GAIN_0	4'd2
//`define BLUE_GAIN_0		4'd3
//`define RED_GAIN_8		4'd4
//`define GREEN_GAIN_8	4'd5
//`define BLUE_GAIN_8		4'd6
//`define RED_MEAN		4'd7
//`define GREEN_MEAN		4'd8
//`define BLUE_MEAN		4'd9
