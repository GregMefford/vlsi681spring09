module Registers(
	input         CLK,
	input         RD_LE,
	input         REG_Control,
	input  [15:0] DATA,
	input  [15:0] IR,
	input  [15:0] Y,
	
	output [15:0] RS1_DATA,
	output [15:0] RS2_DATA
);

wire	[15:0] mux_value;

register_file regfile(
	.CLK(CLK),
	.DATA_IN(mux_value),
	.RD(IR[11:9]),
	.RD_LE(RD_LE),
	.RS1(IR[8:6]),
	.RS2(IR[2:0]),
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA)
);

mux16 data_mux(
	.CONTROL(REG_Control),
	.A(Y),
	.B(DATA),
	.OUT(mux_value)
);

endmodule
