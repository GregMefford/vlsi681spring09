module SE5
(
	// Input Ports
	input [4:0] IMM5,

	// Output Ports
	output [15:0] RESULT

);

	assign RESULT = {{10{IMM5[4]}}, IMM5[4:0]};

endmodule