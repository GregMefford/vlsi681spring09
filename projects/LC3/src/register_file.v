module register_file(CLK, RD_LE, R0_LE, RS1, RS2, RD, DATA_IN, R0_IN, DATA_OUT1, DATA_OUT2);
	input              CLK;
	input              RD_LE;
	input              R0_LE;
	input      [ 2: 0] RS1;
	input      [ 2: 0] RS2;
	input      [ 2: 0] RD;
	input      [15: 0] DATA_IN;
	input      [15: 0] R0_IN;
	output reg [15: 0] DATA_OUT1;
	output reg [15: 0] DATA_OUT2;
	
	       reg [15: 0] R7;
	       reg [15: 0] R6;
	       reg [15: 0] R5;
	       reg [15: 0] R4;
	       reg [15: 0] R3;
	       reg [15: 0] R2;
	       reg [15: 0] R1;
	       reg [15: 0] R0;
	
	always @(posedge CLK) begin
		if(R0_LE) begin
			R0 = R0_IN;
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
			0: DATA_OUT1 = R0;
			1: DATA_OUT1 = R1;
			2: DATA_OUT1 = R2;
			3: DATA_OUT1 = R3;
			4: DATA_OUT1 = R4;
			5: DATA_OUT1 = R5;
			6: DATA_OUT1 = R6;
			7: DATA_OUT1 = R7;
			default: DATA_OUT1 = 16'hXXXX;
		endcase
		case(RS2)
			0: DATA_OUT2 = R0;
			1: DATA_OUT2 = R1;
			2: DATA_OUT2 = R2;
			3: DATA_OUT2 = R3;
			4: DATA_OUT2 = R4;
			5: DATA_OUT2 = R5;
			6: DATA_OUT2 = R6;
			7: DATA_OUT2 = R7;
			default: DATA_OUT2 = 16'hXXXX;
		endcase
	end
endmodule
