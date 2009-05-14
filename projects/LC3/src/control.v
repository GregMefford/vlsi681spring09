module control(INSTRUCTION, MAR_LE, MDR_LE, PC_LE, IR_LE, ALU_CONTROL, IS_IMMEDIATE);
	input      [15: 0] INSTRUCTION;
	
	output             MAR_LE;
	output             MDR_LE;
	output             PC_LE;
	output             IR_LE;
	output reg [ 3: 0] ALU_CONTROL;
	output reg         IS_IMMEDIATE;
	
	always @(INSTRUCTION) begin
		// Decode the OPCODE
		case(INSTRUCTION[15:12])
			4'b0001: begin
				// ADD Instruction
				ALU_CONTROL = 4'b0000;
			end
			4'b0101: begin
				// AND Instruction
				ALU_CONTROL = 4'b0001;
			end
			4'b1001: begin
				// NOT Instruction
				ALU_CONTROL = 4'b0100;
			end
			4'b1101: begin
				// MUL, SL, or SR Instruction
				case(INSTRUCTION[5:3])
					3'b000: begin
					  ALU_CONTROL = 4'b0101; // MUL
					  IS_IMMEDIATE = 1'b0;
					end
					3'b100: begin
					  ALU_CONTROL = 4'b0101; // MUL IMMEDIATE
					  IS_IMMEDIATE = 1'b1;
					end
					3'b010: begin
					  ALU_CONTROL   = 4'b0110; // Shift Left
					  IS_IMMEDIATE = 1'b0;
					end
					3'b001: begin
					  ALU_CONTROL   = 4'b0101; // Shift Right
					  IS_IMMEDIATE = 1'b0;
					end
					default: begin
					  ALU_CONTROL = 4'bX;
					  IS_IMMEDIATE = 1'bX;
					end
				endcase
			end
			default: begin
				// Un-handled case
				ALU_CONTROL  = 4'bX;
				IS_IMMEDIATE = 1'bX;
			end
		endcase
	end
endmodule