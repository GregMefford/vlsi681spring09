module Data(
	MAR_LE,
	MAR_CONTROL,
	WE,
	clk,
	EA,
	Y,
	DATA
);


input	MAR_LE;
input	MAR_CONTROL;
input	WE;
input	clk;
input	[15:0] EA;
input	[15:0] Y;
output	[15:0] DATA;

wire	[15:0] EA;
wire	[15:0] DATA;
wire	[15:0] MDR;

Dataram	dataram_inst(
	.we(WE),
	.clk(clk),
	.data_in(Y),
	.read_addr(MAR),
	.write_addr(MAR),
	.data_out(MDR)
);
	defparam	dataram_inst.ADDR_WIDTH = 16;
	defparam	dataram_inst.DATA_WIDTH = 16;

reg16	mar_reg(
	.LE(MAR_LE),
	.DATA_IN(MAR_DATA),
	.DATA_OUT(MAR)
);

mux16	mar_mux(
	.CONTROL(MAR_CONTROL),
	.A(EA),
	.B(DATA),
	.OUT(MAR_DATA)
);

endmodule
