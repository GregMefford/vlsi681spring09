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
	output             IR_LE,

	output             NEXT_STAGE_LE,
	output     [ 1: 0] NEXT_STAGE

);
	
	wire DECODE;    assign DECODE    = (STAGE == 2'b00);
	wire EXECUTE;   assign EXECUTE   = (STAGE == 2'b01);
	wire WRITEBACK; assign WRITEBACK = (STAGE == 2'b10);
	wire FETCH;     assign FETCH     = (STAGE == 2'b11);

	wire ADD; assign ADD = (IR[15:12] == 4'b0001);
	wire LDR; assign ADD = (IR[15:12] == 4'b0110);

	wire IS_IMMEDIATE; assign IS_IMMEDIATE = (IR[5] == 1);

	assign ALU_CONTROL   = alu_control(IR, DECODE);
	assign ALU_MuxA      = alu_MuxA(IR, DECODE);
	assign ALU_MuxB      = alu_MuxB(IR, DECODE, IS_IMMEDIATE);
	assign PC_CONTROL    = pc_control(IR, STAGE);
	assign IR_LE         = FETCH;
	assign REG_CONTROL   = reg_control(IR, STAGE);
	assign MEM_WE        = mem_we(IR, WRITEBACK);
	assign MAR_LE        = mar_le(IR, DECODE, EXECUTE);
	assign MAR_CONTROL   = mar_control(IR, STAGE);
	assign PC_LE         = EXECUTE;
	assign RD_LE         = rd_le(IR, WRITEBACK);
	assign NEXT_STAGE_LE = 0;
	assign NEXT_STAGE    = next_stage(IR, STAGE);
	
	function [2:0] alu_control;
		input [15:0] IR;
		input        DECODE;
		if(DECODE) begin
			// Decode the OPCODE
			case(IR[15:12])
				4'b0001: begin
					// ADD
					alu_control = 'b000; // Y = A + B
				end
				4'b0101: begin
					// AND
					alu_control = 'b001; // Y = A & B
				end
				4'b0110: begin
					// LDR
					alu_control = 'b000; // Y = A + B
				end
				4'b0111: begin
					// STR
					alu_control = 'b000; // Y = A + B
				end
				4'b1001: begin
					// NOT
					alu_control = 'b010; // Y = !A
				end
				4'b1101: begin
					// MUL, SL, or SR
					if(IR[5]) begin
						// Multiply Imm5
						alu_control = 'b100;
					end
					else begin
						alu_control = {1'b1, IR[4:3]};
					end
				end
				default: alu_control = 3'bX;
			endcase
		end
		else begin
			alu_control = 3'bX;
		end
	endfunction // alu_control
	
	function alu_MuxA;
		input [15:0] IR;
		input        DECODE;
		if(DECODE) begin
			// Decode the OPCODE
			case(IR[15:12])
				4'b0001: begin
					// ADD
					alu_MuxA = 'b1;
				end
				default: alu_MuxA = 'b1;
			endcase
		end
		else begin
			alu_MuxA = 'b1;
		end
	endfunction // alu_MuxA
	
	function [2:0] alu_MuxB;
		input [15:0] IR;
		input        DECODE;
		input        IS_IMMEDIATE;
		if(DECODE) begin
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
		end
		else begin
			alu_MuxB = 'b1;
		end
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
		mar_control = 0; // Not using memory (MAR = EA)
	endfunction // mar_control

	function mem_we;
		input [15:0] IR;
		input        WRITEBACK;
		if(IR[15:12] == 'b0111) mem_we = WRITEBACK; // STR
		else mem_we = 0;
	endfunction // mem_we

	function [1:0] next_stage;
		input [15:0] IR;
		input [ 1:0] STAGE;
		if(STAGE == 1) next_stage = 2'b00; // Skip from stage 1 back to stage 0
		else next_stage = 2'bX;
	endfunction // next_stage

	function next_stage_le;
		input [15:0] IR;
		input [ 1:0] STAGE;
		if(STAGE == 1) next_stage_le = 1'b1; // Skip from stage 1 back to stage 0
		else next_stage_le = 0;
	endfunction // next_stage_le

endmodule