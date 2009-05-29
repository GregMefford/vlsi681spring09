module LC3(
  input	        CLK,
  input	[15: 0] IR,
  
  output	[15: 0] PC,
  output	[ 1: 0] STAGE,
  
  output	        PC_CONTROL,
  output	        PC_LE,
  output	        IR_LE,
  
  output	[ 2: 0] ALU_CONTROL,
  output	        ALU_MuxA,
  output	[ 2: 0] ALU_MuxB,
  
  output	[15: 0] Y,
  output	[ 2: 0] NPZ,
  output	        OF,
  
  output	        REG_CONTROL,
  output	[15: 0] RS1_DATA,
  output	[15: 0] RS2_DATA,
  output	[15: 0] RD_DATA,
  output	        RD_LE,
  
  output	        MAR_CONTROL,
  output	        MAR_LE,
  output	        MEM_CLK,
  output	        MEM_WE,
  output	[15: 0] DATA,
  
  output	[ 1: 0] NEXT_STAGE,
  output	        NEXT_STAGE_LE
);


Registers registers_inst(
	.CLK(CLK),
	.RD_LE(RD_LE),
	.REG_Control(REG_CONTROL),
	.DATA(DATA),
	.IR(IR),
	.Y(Y),
	
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA),
	.RD_DATA(RD_DATA)
);

Instruction_Fetch instruction_fetch_inst(
	.CLK(CLK),
	.PC_LE(PC_LE),
	.IR_LE(IR_LE),
	.Y(Y),
	.PC_CONTROL(PC_CONTROL),
	.IR(IR),
	.PC(PC)
);

Data data_inst(
	.MAR_LE(MAR_LE),
	.MAR_CONTROL(MAR_CONTROL),
	.WE(WE),
	.CLK(CLK),
	.RD_DATA(RD_DATA),
	.Y(Y),
	.DATA(DATA)
);

Execution execution_inst(
	.ALU_CONTROL(ALU_CONTROL),
	.ALU_MuxA(ALU_MuxA),
	.ALU_MuxB(ALU_MuxB),
	.PC(PC),
	.IR(IR),
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA),
	.NPZ(NPZ),
	.OF(OF),
	.Y(Y)
);

control control_inst(
	.CLK(CLK),
	.STAGE(STAGE),
	.IR(IR),

	.ALU_CONTROL(ALU_CONTROL),
	.ALU_MuxA(ALU_MuxA),
	.ALU_MuxB(ALU_MuxB),

	.MAR_LE(MAR_LE),
	.MAR_CONTROL(MAR_CONTROL),
	.MEM_WE(MEM_WE),
	.MEM_CLK(MEM_CLK),
	.RD_LE(RD_LE),
	.REG_CONTROL(REG_CONTROL),
	.PC_CONTROL(PC_CONTROL),
	.PC_LE(PC_LE),
	.IR_LE(IR_LE),

	.NEXT_STAGE_LE(NEXT_STAGE_LE),
	.NEXT_STAGE(NEXT_STAGE)
);

lpm_counter0 stage_counter(
	.sload(NEXT_STAGE_LE),
	.clock(CLK),
	.data(NEXT_STAGE),
	.q(STAGE)
);

endmodule
