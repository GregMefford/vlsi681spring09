module Instram (clk, address, instruction);

input		clk;
input	[15:0]	address;
output	[15:0]	instruction;

reg	[15:0]	instruction;

//	memAddr is an address register in the memory side.
reg	[15:0]	memAddr;
reg	[15:0]	Instram[0:65535];

	
	
always @(posedge clk) begin
		memAddr = address;
		instruction = Instram[memAddr];
end

endmodule
