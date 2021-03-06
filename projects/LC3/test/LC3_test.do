delete wave *;

add wave IR;
add wave control_inst/DECODE;
add wave control_inst/EXECUTE;
add wave control_inst/WRITEBACK;
add wave control_inst/FETCH;

add wave PC_CONTROL;
add wave PC_LE;
add wave IR_LE;

add wave ALU_CONTROL;
add wave ALU_MuxA;
add wave ALU_MuxB;

add wave REG_CONTROL;
add wave RD_LE;

add wave MAR_CONTROL;
add wave MAR_LE;
add wave MEM_WE;

add wave NEXT_STAGE;
add wave NEXT_STAGE_LE;

echo "---STARTING---"
#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R3 = R1 + R5 (ADD)"
force IR 'b0001011001000101;
force STAGE 'b00; # Decode
run 100;
if {[examine PC_LE] != "St0"} { # Don't store new PC value
    echo "!Decode: PC_LE [examine PC_LE] != 0";
}
if {[examine ALU_CONTROL] != "000"} { # ADD IR
    echo "!Decode: ALU_CONTROL [examine ALU_CONTROL] != 000";
}
if {[examine ALU_MuxA] != "St1"} { # (A = RS1_DATA)
    echo "!Decode: ALU_MuxA [examine ALU_MuxA] != 1";
}
if {[examine ALU_MuxB] != "0xx"} { # (B = RS2_DATA)
    echo "!Decode: ALU_MuxB [examine ALU_MuxB] != 0xx";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Decode: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Store a new IR
    echo "!Decode: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Decode: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Decode: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Decode: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b01; # Execute
run 100;
if {[examine PC_CONTROL] != "St0"} { # PC = PC++
    echo "!Execute: PC_CONTROL [examine PC_CONTROL] != 0";
}
if {[examine PC_LE] != "St1"} { # Store a new PC value
    echo "!Execute: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Execute: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!Execute: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Execute: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Execute: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Execute: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b10; # WriteBack
run 100;
if {[examine REG_CONTROL] != "St0"} { # RD = Y
    echo "!WriteBack: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!WriteBack: RD_LE [examine RD_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!WriteBack: PC_LE [examine PC_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!WriteBack: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!WriteBack: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!WriteBack: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!WriteBack: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b11; # Fetch
run 100;
if {[examine IR_LE] != "St1"} { # Latch the next IR
    echo "!Fetch: IR_LE [examine IR_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Fetch: PC_LE [examine PC_LE] != 1";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Fetch: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Fetch: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Fetch: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R2 = R0 * R5 (MUL)"
force IR 16'b1101010000000101;
force STAGE 'b00; # Decode
run 100;
if {[examine PC_LE] != "St0"} { # Don't store new PC value
    echo "!Decode: PC_LE [examine PC_LE] != 0";
}
if {[examine ALU_CONTROL] != "100"} { # Y = A * B
    echo "!Decode: ALU_CONTROL [examine ALU_CONTROL] != 000";
}
if {[examine ALU_MuxA] != "St1"} { # (A = RS1_DATA)
    echo "!Decode: ALU_MuxA [examine ALU_MuxA] != 1";
}
if {[examine ALU_MuxB] != "0xx"} { # (B = RS2_DATA)
    echo "!Decode: ALU_MuxB [examine ALU_MuxB] != 0xx";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Decode: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Store a new IR
    echo "!Decode: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Decode: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Decode: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Decode: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b01; # Execute
run 100;
if {[examine PC_CONTROL] != "St0"} { # PC = PC++
    echo "!Execute: PC_CONTROL [examine PC_CONTROL] != 0";
}
if {[examine PC_LE] != "St1"} { # Store a new PC value
    echo "!Execute: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Execute: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!Execute: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Execute: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Execute: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Execute: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b10; # WriteBack
run 100;
if {[examine REG_CONTROL] != "St0"} { # RD = Y
    echo "!WriteBack: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!WriteBack: RD_LE [examine RD_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!WriteBack: PC_LE [examine PC_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!WriteBack: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!WriteBack: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!WriteBack: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!WriteBack: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b11; # Fetch
run 100;
if {[examine IR_LE] != "St1"} { # Latch the next IR
    echo "!Fetch: IR_LE [examine IR_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Fetch: PC_LE [examine PC_LE] != 1";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Fetch: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Fetch: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Fetch: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R2 = MEM(R1 + b101010) (LDR)"
force IR 16'b0110010001101010;
force STAGE 'b00; # Decode
run 100;
if {[examine PC_LE] != "St0"} { # Don't store new PC value
    echo "!Decode: PC_LE [examine PC_LE] != 0";
}
if {[examine ALU_CONTROL] != "000"} { # (Y = A+B)
    echo "!Decode: ALU_CONTROL [examine ALU_CONTROL] != 000";
}
if {[examine ALU_MuxA] != "St1"} { # (A = RS1_DATA)
    echo "!Decode: ALU_MuxA [examine ALU_MuxA] != 1";
}
if {[examine ALU_MuxB] != "101"} { # (B = Offset6)
    echo "!Decode: ALU_MuxB [examine ALU_MuxB] != 101";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Decode: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Store a new IR
    echo "!Decode: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_CONTROL] != "St0"} { # MAR = Y
    echo "!Decode: MAR_CONTROL [examine MAR_CONTROL] != 0";
}
if {[examine MAR_LE] != "St1"} { # Latch MAR
    echo "!Decode: MAR_LE [examine MAR_LE] != 1";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Decode: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Decode: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b01; # Execute
run 100;
if {[examine PC_CONTROL] != "St0"} { # PC = PC++
    echo "!Execute: PC_CONTROL [examine PC_CONTROL] != 0";
}
if {[examine PC_LE] != "St1"} { # Store a new PC value
    echo "!Execute: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Execute: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!Execute: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Execute: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Execute: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Execute: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b10; # WriteBack
run 100;
if {[examine REG_CONTROL] != "St1"} { # RD = DATA
    echo "!WriteBack: REG_CONTROL [examine REG_CONTROL] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!WriteBack: RD_LE [examine RD_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!WriteBack: PC_LE [examine PC_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!WriteBack: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!WriteBack: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!WriteBack: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!WriteBack: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b11; # Fetch
run 100;
if {[examine IR_LE] != "St1"} { # Latch the next IR
    echo "!Fetch: IR_LE [examine IR_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Fetch: PC_LE [examine PC_LE] != 1";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Fetch: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Fetch: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Fetch: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}



#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest MEM(R3 + b010101) = R5 (STR)"
force IR 16'b0111101011010101;
force STAGE 'b00; # Decode
run 100;
if {[examine PC_LE] != "St0"} { # Don't store new PC value
    echo "!Decode: PC_LE [examine PC_LE] != 0";
}
if {[examine ALU_CONTROL] != "000"} { # (Y = A+B)
    echo "!Decode: ALU_CONTROL [examine ALU_CONTROL] != 000";
}
if {[examine ALU_MuxA] != "St1"} { # (A = RS1_DATA)
    echo "!Decode: ALU_MuxA [examine ALU_MuxA] != 1";
}
if {[examine ALU_MuxB] != "101"} { # (B = Offset6)
    echo "!Decode: ALU_MuxB [examine ALU_MuxB] != 101";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Decode: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Store a new IR
    echo "!Decode: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_CONTROL] != "St0"} { # MAR = Y
    echo "!Decode: MAR_CONTROL [examine MAR_CONTROL] != 0";
}
if {[examine MAR_LE] != "St1"} { # Latch MAR
    echo "!Decode: MAR_LE [examine MAR_LE] != 1";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Decode: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Decode: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b01; # Execute
run 100;
if {[examine PC_CONTROL] != "St0"} { # PC = PC++
    echo "!Execute: PC_CONTROL [examine PC_CONTROL] != 0";
}
if {[examine PC_LE] != "St1"} { # Store a new PC value
    echo "!Execute: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Execute: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!Execute: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Execute: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Execute: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Execute: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b10; # WriteBack
run 100;
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!WriteBack: RD_LE [examine RD_LE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!WriteBack: PC_LE [examine PC_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store a new IR
    echo "!WriteBack: IR_LE [examine IR_LE] != 0";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!WriteBack: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St1"} { # Store to memory
    echo "!WriteBack: MEM_WE [examine MEM_WE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!WriteBack: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 'b11; # Fetch
run 100;
if {[examine IR_LE] != "St1"} { # Latch the next IR
    echo "!Fetch: IR_LE [examine IR_LE] != 1";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Fetch: PC_LE [examine PC_LE] != 1";
}
if {[examine MAR_LE] != "St0"} { # Don't latch MAR
    echo "!Fetch: MAR_LE [examine MAR_LE] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Fetch: MEM_WE [examine MEM_WE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to an arbitrary stage
    echo "!Fetch: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}



#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R2 = R0 & R4"
force IR 16'b0101010000000100;
force STAGE 0;
run 100;



#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R7 = !R1"
force IR 16'b1001111001111111;
force STAGE 0;
run 100;


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R3 = << R5"
force IR 16'b1101011101010000;
force STAGE 0;
run 100;

#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R4 = >> R6"
force IR 16'b1101100110001000;
force STAGE 0;
run 100;

