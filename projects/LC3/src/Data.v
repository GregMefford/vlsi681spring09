module Data(
	MAR_LE,
	MAR_CONTROL,
	WE,
	CLK,
	RD_DATA,
	Y,
	DATA,
	MAR
);

input	MAR_LE;
input	MAR_CONTROL;
input	WE;
input	CLK;
input	[15:0] RD_DATA;
input	[15:0] Y;
output	[15:0] DATA;

output	[15:0] MAR;

assign MAR = (MAR_CONTROL) ? DATA : Y;

DRAM	DRAM_inst (
	.address ( MAR[11:0] ),
	.clock ( CLK ),
	.data ( RD_DATA ),
	.wren ( WE ),
	.q ( DATA )
);

endmodule
