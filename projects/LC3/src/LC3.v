module LC3(
	CLK,
	IR,
	REG_CONTROL,
	ALU_CONTROL,
	PC,
	RS1_DATA,
	RS2_DATA,
	STAGE,
	Y
);

input	        CLK;
input	[15: 0] IR;

output	        REG_CONTROL;
output	[ 3: 0] ALU_CONTROL;
output	[15: 0] PC;
output	[15: 0] RS1_DATA;
output	[15: 0] RS2_DATA;
output	[ 1: 0] STAGE;
output	[15: 0] Y;

wire	[ 3: 0] ALU_CONTROL;
wire	[15: 0] DATA;
wire	[15: 0] EA;
wire	[ 2: 0] EA_CONTROL;
wire	        IR_LE;
wire	        IS_IMMEDIATE;
wire	        MAR_CONTROL;
wire	        MAR_LE;
wire	        MEM_CLK;
wire	        MEM_WE;
wire	[ 1: 0] NEXT_STAGE;
wire	        NEXT_STAGE_LE;
wire	[15: 0] PC;
wire	[ 1: 0] PC_CONTROL;
wire	        PC_LE;
wire	        RD_LE;
wire	        REG_CONTROL;
wire	[15: 0] RS1_DATA;
wire	[15: 0] RS2_DATA;
wire	[ 1: 0] STAGE;
wire	[15: 0] Y;

Registers registers_inst(
	.CLK(CLK),
	.DATA(DATA),
	.IR(IR),
	.RD_LE(RD_LE),
	.REG_Control(REG_CONTROL),
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA),
	.Y(Y)
);

Instruction_Fetch instruction_fetch_inst(
	.IR_LE(IR_LE),
	.PC_LE(PC_LE),
	.DATA(DATA),
	.EA(EA),
	.PC_CONTROL(PC_CONTROL),
	.PC(PC)
);

Data data_inst(
	.MAR_LE(MAR_LE),
	.MAR_CONTROL(MAR_CONTROL),
	.WE(MEM_WE),
	.clk(MEM_CLK),
	.EA(EA),
	.Y(Y),
	.DATA(DATA)
);

Execution execution_inst(
	.Is_Immediate(IS_IMMEDIATE),
	.ALU_CONTROL(ALU_CONTROL),
	.IR(IR),
	.RS1_DATA(RS1_DATA),
	.RS2_DATA(RS2_DATA),
	
	.Y(Y)
);

control control_inst(
	.CLK(CLK),
	.INSTRUCTION(IR),
	.STAGE(STAGE),
	.NEXT_STAGE_LE(NEXT_STAGE_LE),
	.MAR_LE(MAR_LE),
	.MAR_CONTROL(MAR_CONTROL),
	.MEM_WE(MEM_WE),
	.MEM_CLK(MEM_CLK),
	.IS_IMMEDIATE(IS_IMMEDIATE),
	.RD_LE(RD_LE),
	.REG_CONTROL(REG_CONTROL),
	.IR_LE(IR_LE),
	.PC_LE(PC_LE),
	.ALU_CONTROL(ALU_CONTROL),
	.EA_CONTROL(EA_CONTROL),
	.NEXT_STAGE(NEXT_STAGE),
	.PC_CONTROL(PC_CONTROL)
);

effective_address effective_address_inst(
	.CONTROL(EA_CONTROL),
	.IR(IR),
	.PC(PC),
	.RS1_DATA(RS1_DATA),
	.EA(EA)
);

lpm_counter0 stage_counter(
	.sload(NEXT_STAGE_LE),
	.clock(CLK),
	.data(NEXT_STAGE),
	.q(STAGE)
);

endmodule
