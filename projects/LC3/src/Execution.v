module Execution(
	input	Is_Immediate,
	input	[3:0] ALU_CONTROL,
	input	[15:0] IR,
	input	[15:0] RS1_DATA,
	input	[15:0] RS2_DATA,
	output	[2:0] NPZ,
	output	[15:0] Y
);

wire	[15:0] IMM5_SE;
wire	[15:0] ALU_B;

mux16	ALU_B_Mux (
	.CONTROL(Is_Immediate),
	.A(RS2_DATA),
	.B(IMM5_SE),

	.OUT(ALU_B)
);

SE5	b2v_inst2(
	.IMM5(IR[4:0]),

	.RESULT(IMM5_SE)
);

ALU	b2v_inst4(
	.A(RS1_DATA),
	.B(ALU_B),
	.CONTROL(ALU_CONTROL),

	.CC(NPZ),
	.Z(Y)
);

endmodule
