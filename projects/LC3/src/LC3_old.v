include <ALU>;
include <mux16>;
include <RAM_data>;
include <reg16>;
include <register_file>;
include <control>;

// Program Counter
wire [15: 0] pc;
wire [15: 0] instruction;
wire [15: 0] next_pc;

// Instruction Register Data
wire [ 2: 0] rs1 = instruction[ 2: 0];
wire [ 2: 0] rs2 = instruction[ 2: 0];
wire [ 2: 0] rd  = instruction[ 2: 0];
wire [15: 0] immediate;
// Zero-extended immediate value
immediate[15: 5] = 11'b0;
immediate[ 4: 0] = instruction[ 4: 0];

// ALU
wire [ 3: 0] alu_control;
wire         is_immediate;
wire [15: 0] alu_a;
wire [15: 0] alu_b;
wire [ 2: 0] alu_cc;
wire [15: 0] alu_z;
wire [15: 0] alu_of;

control control_logic (
	.INSTRUCTION(instruction)
	.RS1(rs1),
	.RS2(rs2),
	.RD(rd),
	.ALU_CONTROL(alu_control),
	.IS_IMMEDIATE(is_immediate)
);

reg16 pc (
	.LE(clk),
	.DATA_IN(next_pc),
	.DATA_OUT(pc)
);

RAM_instruction i_RAM (
	.CLK(clk),
	.ADDRESS(pc),
	.INSTRUCTION(instruction)
);

mux16 immediate_mux (
	.A(rs2_data),
	.B(immediate),
	.CONTROL(is_immediate),
	.OUT(alu_b)
);

ALU alu (
	.A(alu_a),
	.B(alu_b),
	.CONTROL(alu_control),
	.CC(alu_cc),
	.Z(alu_z),
	.OF(alu_of)
);