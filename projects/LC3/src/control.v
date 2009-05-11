module control(INST, MAR_LE, MDR_LE, PC_LE, IR_LE, ALU_CONTROL, IS_IMMEDIATE);
	input      [15: 0] INSTRUCTION;
	output reg [ 3: 0] ALU_CONTROL;
	output             IS_IMMEDIATE;
	
	always @(INSTRUCTION) begin
		// Decode the OPCODE
		case(INSTRUCTION[15:12])
			4'b0001: begin
				// Add Instruction
				ALU_CONTROL = 4'b0000;
			end
			4'b0101: begin
				// And Instruction
				ALU_CONTROL = 4'b0001;
			end
			4'b1001: begin
				// NOT Instruction
				ALU_CONTROL = 4'b0100;
			end
			4'b1011: begin
				// MUL, SL, or SR Instruction
				case(INSTRUCTION[4:3])
					2'b00: ALU_CONTROL = 4'b0101; // MUL
					2'b10: ALU_CONTROL = 4'b0110; // Shift Left
					2'b01: ALU_CONTROL = 4'b0111; // Shift Left
					default: ALU_CONTROL = 4b'X;
				endcase
			end
			default: begin
				// Un-handled case
				ALU_CONTROL  = 4'bX;
				IS_IMMEDIATE = 1'b0;
			end
		endcase
	end
endmodule