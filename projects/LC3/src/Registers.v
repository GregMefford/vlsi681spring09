module Registers(
	input         CLK,
	input         RESET,
	input         RD_LE,
	input         REG_Control,
	inout  [15:0] DATA,
	input  [15:0] IR,
	input  [15:0] Y,
	
	output [15:0] RS1_DATA,
	output [15:0] RS2_DATA,
	output [15:0] RD_DATA
);

wire	[15:0] DATA_IN;
assign DATA_IN = (REG_Control) ? DATA : Y;

register_file regfile(
	.CLK(CLK),
	.RESET(RESET),
	.DATA_IN(DATA_IN),
	.RD(IR[11:9]),
	.RD_LE(RD_LE),
	.RS1(IR[8:6]),
	.RS2(IR[2:0]),
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA),
	.RD_DATA(RD_DATA)
);

endmodule
