module RAM_data(CLK, WE, ADDRESS, DATA_IN, DATA_OUT);
	input              CLK;
	input              WE;
	input      [15: 0] ADDRESS;
	input      [15: 0] DATA_IN;
	output reg [15: 0] DATA_OUT;
	
endmodule
