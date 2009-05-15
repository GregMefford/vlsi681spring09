module ALU(A, B, CONTROL, CC, Z, OF);

	input [15:0] A;		// port A
	input [15:0] B;	  	// port B
	input [3:0] CONTROL;	// control for ALU
//	output reg [2:0] CC;	// pos, neg, zero flags
//	output reg [15:0] Z;	// result
//	output reg [15:0] OF;	// overflow
	output [2:0] CC;	// pos, neg, zero flags
	output [15:0] Z;	// result
	output [15:0] OF;	// overflow
	wire [31:0] result;	// ALU result


	assign result = alu_out(A, B, CONTROL);
	assign Z = result[15:0];
	assign OF  = result[31:16] ;
	assign CC = flags(result);

 	function [31:0] alu_out;
   		input  [15:0] A,B;
   	//	input        cin;
   		input  [3:0] CONTROL;
   		case (CONTROL)
       			4'b0000: alu_out=A+B;			// Add A,B
       			4'b0001: alu_out=A&B;			// And A,B
       			4'b0010: alu_out=A;			// Pass A
       			4'b0011: alu_out=B;			// Pass B
       			4'b0100: alu_out=!A;			// Not A
       			4'b0101: alu_out=A*B;			// Mul A,B
       			4'b0110: alu_out={A[14:0],1'b0};	// Shift Left
       			4'b0111: alu_out={A[15],A[15:1]};	// Shift Right (sign extend)
         		default: begin
                     		alu_out=32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
             //          		$display("Illegal CTL detected!!");
                   	end    
     		endcase  /* {...,...,...} is for the concatenation.
                 		{ADD_WITH_CARRY,SUB_WITH_BORROW}==2'b11 is used
                 		to force the CARRY==1 for the increment operation */  
   	endfunction // end of function "result"

  	function [2:0] flags;		// output [pos,neg,zero] flags
  		input [31:0] x;
  		
    		begin
    		
//    		if(x==32b'00000000000000000000000000000000)
//    		begin
//				flags = 3b'001;
//			end
//			
//			if(x[31] == 0)
//			begin
//				flags = 3b'100;
//			end
//			else
//			begin
//				flags = 3b'010;
//			end

    		//initialize flags to zero
    		flags[0] = 0;
    		flags[1] = 0;
    		flags[2] = 0;
    		
      		flags[0] = ^(x[0]|x[1]|x[2]|x[3]|x[4]|x[5]|x[6]|x[7]|x[8]|x[9]|x[10]|x[11]|x[12]|x[13]|x[14]|x[15]|x[16]|x[17]|x[18]|x[19]|x[20]|x[21]|x[22]|x[23]|x[24]|x[25]|x[26]|x[27]|x[28]|x[29]|x[30]|x[31]); // zero flag check for x

			if(x[31] == 1)
			begin
				flags[1] = 1;
				flags[2] = 0;
			end
			else
			begin
				flags[1] = 0;
				flags[2] = 1;
    		end
    		end
  	endfunction // end of function "flags"

endmodule


