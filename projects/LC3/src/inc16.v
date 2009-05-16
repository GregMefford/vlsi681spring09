module inc16
(
	input [15:0] value,
	output [15:0] result
);

	assign result = value + 1;
endmodule
