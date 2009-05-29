module Data(
	MAR_LE,
	MAR_CONTROL,
	WE,
	CLK,
	RD_DATA,
	Y,
	DATA
);


input	MAR_LE;
input	MAR_CONTROL;
input	WE;
input	CLK;
input	[15:0] RD_DATA;
input	[15:0] Y;
output	[15:0] DATA;

reg	[15:0] MAR;

always @(posedge CLK) begin
  if(MAR_LE) MAR = (MAR_CONTROL) ? DATA : Y;
end

Dataram	dataram_inst(
	.we(WE),
	.clk(clk),
	.data_in(RD_DATA),
	.read_addr(MAR),
	.write_addr(MAR),
	.data_out(DATA)
);
	defparam	dataram_inst.ADDR_WIDTH = 16;
	defparam	dataram_inst.DATA_WIDTH = 16;

endmodule
