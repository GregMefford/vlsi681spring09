module control
(
	input              CLK,
	input      [ 1: 0] STAGE,
	input      [15: 0] INSTRUCTION,

	output reg         NEXT_STAGE_LE,
	output reg [ 1: 0] NEXT_STAGE,
	output             MAR_LE,
	output             MAR_CONTROL,
	output             MEM_WE,
	output reg         MEM_CLK,
	output reg         IS_IMMEDIATE,
	output     [ 3: 0] ALU_CONTROL,
	output reg         RD_LE,
	output             REG_CONTROL,
	output reg [ 2: 0] EA_CONTROL,
	output             IR_LE,
	output     [ 1: 0] PC_CONTROL,
	output             PC_LE
);
	
	assign ALU_CONTROL = alu_control(INSTRUCTION, STAGE);
	assign PC_CONTROL  = pc_control(INSTRUCTION, STAGE);
	assign IR_LE       = ir_le(INSTRUCTION, STAGE);
	assign REG_CONTROL = reg_control(INSTRUCTION, STAGE);
	assign MEM_WE      = mem_we(INSTRUCTION, STAGE);
	assign MAR_LE      = mar_le(INSTRUCTION, STAGE);
	assign MAR_CONTROL = mar_control(INSTRUCTION, STAGE);
	assign PC_LE       = pc_le(INSTRUCTION, STAGE);

	function [3:0] alu_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		case(STAGE)
			0: begin
				// Decode the OPCODE
				case(IR[15:12])
					4'b0001: begin
						// ADD Instruction
						alu_control = 4'b0000;
					end
					4'b0101: begin
						// AND Instruction
						alu_control = 4'b0001;
					end
					4'b1001: begin
						// NOT Instruction
						alu_control = 4'b0010;
					end
					4'b1101: begin
						// MUL, SL, or SR Instruction
						alu_control = {2'b01, IR[4:3]};
					end
				endcase
			end
			1: begin
				alu_control = 4'bX;
			end
			2: begin
				alu_control = 4'bX;
			end
			3: begin
				alu_control = 4'bX;
			end
			default: begin
				alu_control = 4'bX;
			end
		endcase
	endfunction // alu_control
	
	function pc_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		case(IR[15:12])
			4'b0000: pc_control = 2'b10; // BR:     PC = EA
			4'b1100: pc_control = 2'b10; // JMP:    PC = EA
			4'b0100: pc_control = 2'b10; // JSR[R]: PC = EA
			4'b1100: pc_control = 2'b10; // RET:    PC = EA
			4'b1111: pc_control = 2'b10; // TRAP:   PC = EA
			4'b1000: pc_control = 2'b10; // RTI:    PC = EA
			default: pc_control = 2'b00; // PC = PC++
		endcase
	endfunction // pc_control

	function ir_le;
		input [15:0] IR;
		input [ 1:0] STAGE;
		ir_le = (STAGE == 0); // Latch the IR in stage 0
	endfunction // ir_le

	function reg_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		reg_control = 0; // Store ALU result in RD
	endfunction // reg_control

	function mar_le;
		input [15:0] IR;
		input [ 1:0] STAGE;
		mar_le = 0; // Not using memory
	endfunction // mar_le

	function mar_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		mar_control = 0; // Not using memory (MAR = EA)
	endfunction // mar_control

	function mem_we;
		input [15:0] IR;
		input [ 1:0] STAGE;
		mem_we = 0; // Not using memory
	endfunction // mem_we

	function pc_le;
		input [15:0] IR;
		input [ 1:0] STAGE;
		pc_le = (STAGE == 0); // Latch the next PC in stage 0
	endfunction // pc_le

endmodule