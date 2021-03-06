# Initialization
force CLK 0;
force RD_LE 0;
force R0_LE 0;
force RS1 'h0;
force RS2 'h0;
force RD 'h0;
force DATA_IN 'h0000;
force R0_IN 'h0000;
run;

# Store 0xDEAD in R0
force R0_LE 1;
force R0_IN 'hDEAD;
# Store 0xBEEF in R3
force RD 'd3;
force RD_LE 1;
force DATA_IN 'hBEEF;
# Stobe the clock
force CLK 1;
run;
force CLK 0;
run;

# Don't store anything in R0
force R0_IN 'h0000;
force R0_LE 0;
# Store 0xFEED in R6
force RD 'd6;
force RD_LE 1;
force DATA_IN 'hFEED;
# Read out R0 and R3
force RS1 'd0; # Should be 0xDEAD
force RS2 'd3; # Should be 0xBEEF
# Stobe the clock
force CLK 1;
run;
force CLK 0;
run;
echo "Assert 0x[examine -hex RS1_DATA] == 0xDEAD";
echo "Assert 0x[examine -hex RS2_DATA] == 0xBEEF";

# Store 0x0F0B0 in R1
force RD 'd1;
force RD_LE 1;
force DATA_IN 'hF0B0;
# Read out R1 and R6
force RS1 'd1; # Should be 0xF0B0
force RS2 'd6; # Should be 0xFEED
# Stobe the clock
force CLK 1;
run;
force CLK 0;
run;
echo "Assert 0x[examine -hex RS1_DATA] == 0xF0B0";
echo "Assert 0x[examine -hex RS2_DATA] == 0xFEED";

# Don't store anything
force RD 'd0;
force RD_LE 0;
force DATA_IN 'h0000;
# Read out R3 and R0
force RS1 'd3; # Should be 0xBEEF
force RS2 'd0; # Should be 0xDEAD
# Stobe the clock
force CLK 1;
run;
force CLK 0;
run;
echo "Assert 0x[examine -hex RS1_DATA] == 0xBEEF";
echo "Assert 0x[examine -hex RS2_DATA] == 0xDEAD";


