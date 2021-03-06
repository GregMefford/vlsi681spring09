module Instruction_Fetch(
  input	            CLK,
  input	            RESET,
  input	            PC_LE,
  input	            IR_LE,
  input	     [15:0] Y,
  input	            PC_CONTROL,
  output reg [15:0] IR,
  output reg [15:0] PC
);

wire	[15:0] PC_INC;
wire	[15:0] NEXT_PC;
wire	[15:0] IMEM_DATA;

assign NEXT_PC = (PC_CONTROL) ? Y : PC_INC;
assign PC_INC = PC + 1;

always @(posedge CLK) begin
  if(PC_LE) PC = NEXT_PC;
  if(IR_LE) IR = IMEM_DATA;
  if(RESET) PC = 'h0000;
end

IRAM	IRAM_inst (
	.address ( PC[9:0] ),
	.clock ( CLK ),
	.q ( IMEM_DATA )
);

endmodule
