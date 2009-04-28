module reg16(LE, DATA_IN, DATA_OUT);
	input          LE;
	input  [15:0]  DATA_IN;
	output [15:0]  DATA_OUT;
	reg    [15:0]  DATA_OUT;
	
	always @(posedge LE)
		DATA_OUT = DATA_IN;
	
endmodule