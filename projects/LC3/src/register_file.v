module register_file(CLK, RESET, RD_LE, RS1, RS2, RD, DATA_IN, RS1_DATA, RS2_DATA, RD_DATA);
	input              CLK;
	input              RESET;
	input              RD_LE;
	input      [ 2: 0] RS1;
	input      [ 2: 0] RS2;
	input      [ 2: 0] RD;
	input      [15: 0] DATA_IN;
	output reg [15: 0] RS1_DATA;
	output reg [15: 0] RS2_DATA;
	output reg [15: 0] RD_DATA;
	
	       reg [15: 0] R7;
	       reg [15: 0] R6;
	       reg [15: 0] R5;
	       reg [15: 0] R4;
	       reg [15: 0] R3;
	       reg [15: 0] R2;
	       reg [15: 0] R1;
	       reg [15: 0] R0;
	
	always @(posedge CLK) begin
	  if(RESET) begin
	    R0 = 0;
	    R1 = 0;
	    R2 = 0;
	    R3 = 0;
	    R4 = 0;
	    R5 = 0;
	    R6 = 0;
	    R7 = 0;
	  end
		if(RD_LE) begin
			case(RD)
				0: R0 = DATA_IN;
				1: R1 = DATA_IN;
				2: R2 = DATA_IN;
				3: R3 = DATA_IN;
				4: R4 = DATA_IN;
				5: R5 = DATA_IN;
				6: R6 = DATA_IN;
				7: R7 = DATA_IN;
			endcase
		end
		case(RS1)
			0: RS1_DATA = R0;
			1: RS1_DATA = R1;
			2: RS1_DATA = R2;
			3: RS1_DATA = R3;
			4: RS1_DATA = R4;
			5: RS1_DATA = R5;
			6: RS1_DATA = R6;
			7: RS1_DATA = R7;
			default: RS1_DATA = 16'hX;
		endcase
		case(RS2)
			0: RS2_DATA = R0;
			1: RS2_DATA = R1;
			2: RS2_DATA = R2;
			3: RS2_DATA = R3;
			4: RS2_DATA = R4;
			5: RS2_DATA = R5;
			6: RS2_DATA = R6;
			7: RS2_DATA = R7;
			default: RS2_DATA = 16'hX;
		endcase
		case(RD)
			0: RD_DATA = R0;
			1: RD_DATA = R1;
			2: RD_DATA = R2;
			3: RD_DATA = R3;
			4: RD_DATA = R4;
			5: RD_DATA = R5;
			6: RD_DATA = R6;
			7: RD_DATA = R7;
			default: RD_DATA = 16'hX;
		endcase
	end
endmodule
