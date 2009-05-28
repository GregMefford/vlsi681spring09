delete wave *;

add wave IR;
add wave STAGE;

add wave NEXT_STAGE;
add wave NEXT_STAGE_LE;

add wave IR_LE;
add wave PC_CONTROL;

add wave ALU_CONTROL;
add wave RD_LE;
add wave REG_CONTROL;

add wave MEM_WE;

#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R3 = R1 + R5"
force IR 'b0001011001000101;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0000"} { # ADD IR
    echo "!Stage 0: ALU_CONTROL [examine ALU_CONTROL] != 0000";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R2 = R0 & R4"
force IR 16'b0101010000000100;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0001"} { # AND IR
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0001";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R7 = !R1"
force IR 16'b1001111001111111;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0010"} { # NOT IR
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0010";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R2 = R0 * R5"
force IR 16'b1101010000000101;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0100"} { # MUL IR
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0100";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R3 = << R5"
force IR 16'b1101011101010000;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0110"} { # SL IR
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0110";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}


#======================================
# Put a blank in for testing visibility
force IR 4'hX;
run 100;
echo "\nTest R4 = >> R6"
force IR 16'b1101100110001000;
force STAGE 0;
run 100;
if {[examine ALU_CONTROL] != "0101"} { # SR IR
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0101";
}
if {[examine PC_CONTROL] != "00"} { # PC = PC++
    echo "!Stage 0: PC_CONTROL [examine PC_CONTROL] != 00";
}
if {[examine REG_CONTROL] != "St0"} { # Store ALU Result
    echo "!Stage 0: REG_CONTROL [examine REG_CONTROL] != 0";
}
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 0: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St1"} { # Store new PC value
    echo "!Stage 0: PC_LE [examine PC_LE] != 1";
}
if {[examine RD_LE] != "St1"} { # Store to dest register
    echo "!Stage 0: RD_LE [examine RD_LE] != 1";
}
if {[examine IR_LE] != "St0"} { # Don't store next IR
    echo "!Stage 0: IR_LE [examine IR_LE] != 0";
}
if {[examine NEXT_STAGE_LE] != "St0"} { # Go to the next stage
    echo "!Stage 0: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 0";
}

force STAGE 1;
run 100;
if {[examine MEM_WE] != "St0"} { # Don't store to memory
    echo "!Stage 1: MEM_WE [examine MEM_WE] != 0";
}
if {[examine PC_LE] != "St0"} { # Don't store a new PC value
    echo "!Stage 1: PC_LE [examine PC_LE] != 0";
}
if {[examine RD_LE] != "St0"} { # Don't store to dest register
    echo "!Stage 1: RD_LE [examine RD_LE] != 0";
}
if {[examine IR_LE] != "St1"} { # Store a new IR
    echo "!Stage 1: IR_LE [examine IR_LE] != 1";
}
if {[examine NEXT_STAGE_LE] != "St1"} { # Go to an arbitrary stage
    echo "!Stage 1: NEXT_STAGE_LE [examine NEXT_STAGE_LE] != 1";
}
if {[examine NEXT_STAGE] != "00"} { # Go to stage 0
    echo "!Stage 1: NEXT_STAGE [examine NEXT_STAGE] != 00";
}