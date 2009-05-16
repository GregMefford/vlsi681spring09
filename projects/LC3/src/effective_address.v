include <mux16>;

module effective_address(PC, RS1_DATA, CONTROL, IR, EA);
	input      [15: 0] PC;
	input      [15: 0] RS1_DATA;
	input      [ 2: 0] CONTROL;
	input      [15: 0] IR;
	output     [15: 0] EA;

	wire [15:0] EA1;
	wire [15:0] EA2A;
	wire [15:0] EA2B;
	wire [15:0] EA2;

	wire [15:0] offset6;
  wire [15:0] PCoffset9;
  wire [15:0] PCoffset11;
	
	assign offset6 = {{10{IR[5]}}, IR[5:0]};
  assign PCoffset9 = {{7{IR[8]}}, IR[8:0]};
  assign PCoffset11 = {{5{IR[10]}}, IR[10: 0]};
	assign EA = EA1 + EA2;

	mux16 EA_MUX1 (
		.A(PC),
		.B(RS1_DATA),
		.CONTROL(CONTROL[2]),
		.OUT(EA1)
	);

	mux16 EA_MUX2A (
		.A(16'd0),
		.B(offset6),
		.CONTROL(CONTROL[0]),
		.OUT(EA2A)
	);

	mux16 EA_MUX2B (
		.A(PCoffset9),
		.B(PCoffset11),
		.CONTROL(CONTROL[0]),
		.OUT(EA2B)
	);

	mux16 EA_MUX2 (
		.A(EA2A),
		.B(EA2B),
		.CONTROL(CONTROL[1]),
		.OUT(EA2)
	);

endmodule
