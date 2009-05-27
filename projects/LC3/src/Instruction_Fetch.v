module Instruction_Fetch(
	PC_LE,
	IR_LE,
	DATA,
	EA,
	PC_CONTROL,
	IR,
	PC
);

input	PC_LE;
input	IR_LE;
input	[15:0] DATA;
input	[15:0] EA;
input	[1:0] PC_CONTROL;
output	[15:0] IR;
output	[15:0] PC;

wire	[15:0] MUX_A_OUT;
wire	[15:0] PC_INC;
wire	[15:0] PC;
wire	[15:0] IR;
wire	[15:0] NEXT_PC;

mux16	mux_a(
	.CONTROL(PC_CONTROL[0]),
	.A(EA),
	.B(DATA),
	.OUT(MUX_A_OUT)
);

mux16	mux_b(
	.CONTROL(PC_CONTROL[1]),
	.A(MUX_A_OUT),
	.B(PC_INC),
	.OUT(NEXT_PC)
);

Instram	instram_inst(
	.address(PC),
	.instruction(IR)
);

reg16	ir_reg(
	.LE(IR_LE),
	.DATA_IN(IR),
	.DATA_OUT(IR)
);

reg16	pc_reg(
	.LE(PC_LE),
	.DATA_IN(NEXT_PC),
	.DATA_OUT(PC)
);

inc16	pc_inc_inst(
	.value(PC),
	.result(PC_INC)
);

endmodule
