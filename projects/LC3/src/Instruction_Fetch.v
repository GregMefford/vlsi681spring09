module Instruction_Fetch(
  input	            CLK,
  input	            PC_LE,
  input	            IR_LE,
  input	     [15:0] Y,
  input	            PC_CONTROL,
  output	reg [15:0] IR,
  output	reg [15:0] PC
);


wire	[15:0] PC_INC;
wire	[15:0] NEXT_PC;
wire	[15:0] IMEM_DATA;

assign NEXT_PC = (PC_CONTROL) ? Y : PC_INC;
assign PC_INC = PC + 1;

always @(posedge CLK) begin
  if(PC_LE) PC = NEXT_PC;
  if(IR_LE) IR = IMEM_DATA;
end

Instram	instram_inst(
  .clk(CLK),
	.address(PC),
	.instruction(IMEM_DATA)
);

endmodule
