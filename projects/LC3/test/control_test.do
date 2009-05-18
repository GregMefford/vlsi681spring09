delete wave *;

add wave INSTRUCTION;
add wave STAGE;

add wave ALU_CONTROL;
add wave PC_CONTROL;
add wave REG_CONTROL;
add wave MEM_WE;

# Initialization
force INSTRUCTION 'hDEAD;
run;

echo "\nTest R3 = R1 + R5"
force INSTRUCTION 'b0001011001000101;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0000"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0000";
}
if {[examine PC_CONTROL] != "00"} {
    echo "Assert Failed: PC_CONTROL [examine PC_CONTROL] == 00";
}
if {[examine REG_CONTROL] != "St0"} {
    echo "Assert Failed: REG_CONTROL [examine REG_CONTROL] == 0";
}
if {[examine MEM_WE] != "St0"} {
    echo "Assert Failed: MEM_WE [examine MEM_WE] == 0";
}

echo "\nTest R2 = R0 & R4"
force INSTRUCTION 16'b0101010000000100;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0001"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0001";
}

echo "\nTest R7 = !R1"
force INSTRUCTION 16'b1001111001111111;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0010"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0010";
}

echo "\nTest R2 = R0 * R5"
force INSTRUCTION 16'b1101010000000101;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0100"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0100";
}

echo "\nTest R3 = << R5"
force INSTRUCTION 16'b1101011101010000;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0110"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0110";
}

echo "\nTest R4 = >> R6"
force INSTRUCTION 16'b1101100110001000;
force STAGE 0;
run;
if {[examine ALU_CONTROL] != "0101"} {
    echo "Assert Failed: ALU_CONTROL [examine ALU_CONTROL] == 0101";
}