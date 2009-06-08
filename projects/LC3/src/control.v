module control
(
	input              CLK,
	input      [ 1: 0] STAGE,
	input      [15: 0] IR,

	output     [ 2: 0] ALU_CONTROL,
	output             ALU_MuxA,
	output     [ 2: 0] ALU_MuxB,

	output             MAR_LE,
	output             MAR_CONTROL,
	output             MEM_WE,
	output             RD_LE,
	output             REG_CONTROL,
	output             PC_CONTROL,
	output             PC_LE,
	output             IR_LE
);
	
	wire DECODE;    assign DECODE    = (STAGE == 2'b00);
	wire EXECUTE;   assign EXECUTE   = (STAGE == 2'b01);
	wire WRITEBACK; assign WRITEBACK = (STAGE == 2'b10);
	wire FETCH;     assign FETCH     = (STAGE == 2'b11);

	wire ADD; assign ADD = (IR[15:12] == 4'b0001);
	wire LDR; assign ADD = (IR[15:12] == 4'b0110);

	wire IS_IMMEDIATE; assign IS_IMMEDIATE = (IR[5] == 1);

	assign ALU_CONTROL   = alu_control(IR);
	assign ALU_MuxA      = alu_MuxA(IR);
	assign ALU_MuxB      = alu_MuxB(IR, IS_IMMEDIATE);
	assign PC_CONTROL    = pc_control(IR, STAGE);
	assign IR_LE         = FETCH;
	assign REG_CONTROL   = reg_control(IR, STAGE);
	assign MEM_WE        = mem_we(IR, WRITEBACK);
	assign MAR_LE        = mar_le(IR, DECODE, EXECUTE);
	assign MAR_CONTROL   = mar_control(IR, STAGE);
	assign PC_LE         = EXECUTE;
	assign RD_LE         = rd_le(IR, WRITEBACK);

	function [2:0] alu_control;
		input [15:0] IR;
		// Decode the OPCODE
		case(IR[15:12])
			4'b0001: alu_control = 'b000; // ADD: Y = A + B
			4'b0101: alu_control = 'b001; // AND: Y = A & B
			4'b0110: alu_control = 'b000; // LDR: Y = A + B
			4'b0111: alu_control = 'b000; // STR: Y = A + B
			4'b1001: alu_control = 'b010; // NOT: Y = !A
			4'b1101: begin
				if(IR[5]) alu_control = 'b100; //      MUL IMM5
				else alu_control = {1'b1, IR[4:3]}; // MUL, SL, or SR
			end
			default: alu_control = 3'bX;
		endcase
	endfunction // alu_control
	
	function alu_MuxA;
		input [15:0] IR;
		// Decode the OPCODE
		case(IR[15:12])
			default: alu_MuxA = 'b1; // (A = RS1_DATA)
		endcase
	endfunction // alu_MuxA
	
	function [2:0] alu_MuxB;
		input [15:0] IR;
		input        IS_IMMEDIATE;
		// Decode the OPCODE
		case(IR[15:12])
			4'b0001: begin	// ADD
				if(IS_IMMEDIATE) alu_MuxB = 'b100; // (B = IMM5)
				else alu_MuxB = 'b0XX; // (B = RS2_DATA)
			end
			4'b0110: alu_MuxB = 'b101; // LDR (B = Offset6)
			4'b0111: alu_MuxB = 'b101; // STR (B = Offset6)
			default: alu_MuxB = 'b0XX; // (B = RS2_DATA)
		endcase
	endfunction // alu_MuxB
	
	function pc_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		case(IR[15:12])
			4'b0000: pc_control = 'b1; // BR:      PC = Y
			4'b1100: pc_control = 'b1; // JMP/RET: PC = Y
			4'b0100: pc_control = 'b1; // JSR[R]:  PC = Y
			4'b1111: pc_control = 'b1; // TRAP:    PC = Y
			4'b1000: pc_control = 'b1; // RTI:     PC = Y
			default: pc_control = 'b0; // DEFAULT: PC = PC++
		endcase
	endfunction // pc_control

	function reg_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		if(IR[15:12] == 'b0110) reg_control = 1; // RD = DATA
		else reg_control = 0; // RD = Y
	endfunction // reg_control

	function rd_le;
		input [15:0] IR;
		input        WRITEBACK;
		if(IR[15:12] == 'b0111) rd_le = 0; // STR
		else rd_le = WRITEBACK;
	endfunction // rd_le

	function mar_le;
		input [15:0] IR;
		input        DECODE;
		input        EXECUTE;
		case(IR[15:12])
		  'b0110: mar_le = DECODE; // LDR
		  'b0111: mar_le = DECODE; // STR
		  default: mar_le = 0;
	  endcase
	endfunction // mar_le

	function mar_control;
		input [15:0] IR;
		input [ 1:0] STAGE;
		mar_control = 0; // Not using memory (MAR = Y)
	endfunction // mar_control

	function mem_we;
		input [15:0] IR;
		input        WRITEBACK;
		if(IR[15:12] == 'b0111) mem_we = WRITEBACK; // STR
		else mem_we = 0;
	endfunction // mem_we

endmodule