module ALU(A, B, CONTROL, CC, Z, OF);
	input      [15: 0] A;
	input      [15: 0] B;
	input      [ 4: 0] CONTROL;
	output reg [ 2: 0] CC;
	output reg [15: 0] Z;
	output reg [15: 0] OF;
	
endmodule
