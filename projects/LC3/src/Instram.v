// Quartus II Verilog Template
// Single Port ROM

module single_port_rom
(
	input [15:0] addr,
	input clk, 
	output reg [15:0] q
);

	// Declare the ROM variable
	reg [15:0] rom[10:0];

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.
	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file.

	initial
	begin
		$readmemb("single_port_rom_init.txt", rom);
	end

	always @ (posedge clk)
	begin
		q <= rom[addr];
	end

endmodule
