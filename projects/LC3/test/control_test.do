# Initialization
force INSTRUCTION 'hDEAD;
run;

echo "\nTest R3 = R1 + R5"
force INSTRUCTION 16'b0001011001000101;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0000";

echo "\nTest R2 = R0 & R4"
force INSTRUCTION 16'b0101010000000100;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0001";

echo "\nTest R7 = !R1"
force INSTRUCTION 16'b1001111001111111;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0100";

echo "\nTest R2 = R0 * R5"
force INSTRUCTION 16'b1101010000000101;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0101";

echo "\nTest R3 = << R5"
force INSTRUCTION 16'b1101011101010000;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0110";

echo "\nTest R4 = >> R6"
force INSTRUCTION 16'b1101100110001000;
run;
echo "Assert ALU_CONTROL [examine ALU_CONTROL] == 0101";

