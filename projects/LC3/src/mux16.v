module mux16(A, B, CONTROL, OUT);
	input      [15: 0] A;
	input      [15: 0] B;
	input              CONTROL;
	output reg [15: 0] OUT;

	always @(A or B or CONTROL) begin
		case(CONTROL)
			0: OUT = A;
			1: OUT = B;
			default: OUT = 16'bX;
		endcase
	end
endmodule
