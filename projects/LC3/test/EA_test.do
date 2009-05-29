# Initialization
force PC 'hAAAA;
force RS1_DATA 'h5555;
force CONTROL 'b101;
force IR 'h5A5A;
run;

echo "Test EA = PC + 0"
force PC 'hBEEF;
force CONTROL 'b000;
run;
echo "Assert [examine -hex EA] == BEEF";

echo "Test EA = PC + Offset6"
force PC 'hDEAD;
force IR 'hBEEF;
force CONTROL 'b001;
run;
echo "Assert [examine -hex EA] == DE9C";

echo "Test EA = PC + PCOffset9"
force PC 'hACED;
force IR 'hFACE;
force CONTROL 'b010;
run;
echo "Assert [examine -hex EA] == ADBB";

echo "Test EA = PC + PCOffset11"
force PC 'h65FA;
force IR 'hAB61;
force CONTROL 'b011;
run;
echo "Assert [examine -hex EA] == 695B";

echo "Test EA = RS1 + 0"
force CONTROL 'b100;
run;
echo "Assert [examine -hex EA] == 5555";

echo "Test EA = RS1 + offset6"
force CONTROL 'b101;
run;
echo "Assert [examine -hex EA] == 5536";

echo "Test EA = RS1 + PCoffset9"
force CONTROL 'b110;
run;
echo "Assert [examine -hex EA] == 54B6";

echo "Test EA = RS1 + PCoffset11"
force CONTROL 'b111;
run;
echo "Assert [examine -hex EA] == 58B6";
