# Initialization
add wave A
add wave B
add wave CONTROL
add wave CC
add wave Z
add wave OF
add wave result

force A 'h0000;
force B 'h0000;
force CONTROL 'h0;
run;

echo "\nTest ADD (0+0)"
force CONTROL 'h0;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest ADD(1+0)"
force A 'h0001;
force B 'h0000;
force CONTROL 'h0;
run;
echo "Assert Z [examine -hex Z] == 'h0001";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest ADD(1+1)"
force A 'h0001;
force B 'h0001;
force CONTROL 'h0;
run;
echo "Assert Z [examine -hex Z] == 'h0002";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest ADD(8+8)"
force A 'h0008;
force B 'h0008;
force CONTROL 'h0;
run;
echo "Assert Z [examine -hex Z] == 'h0010";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest ADD(23+23)"
force A 'h0080;
force B 'h0080;
force CONTROL 'h0;
run;
echo "Assert Z [examine -hex Z] == 'h0100";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest AND(0&0)"
force A 'h0000;
force B 'h0000;
force CONTROL 'h1;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest AND(1&0)"
force A 'h0001;
force B 'h0000;
force CONTROL 'h1;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest AND(1&1)"
force A 'h0001;
force B 'h0001;
force CONTROL 'h1;
run;
echo "Assert Z [examine -hex Z] == 'h0001";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest AND(F&E)"
force A 'h000F;
force B 'h000E;
force CONTROL 'h1;
run;
echo "Assert Z [examine -hex Z] == 'h000E";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest PASS A"
force A 'h0000;
force B 'h000E;
force CONTROL 'h2;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest PASS A"
force A 'h1111;
force B 'h000E;
force CONTROL 'h2;
run;
echo "Assert Z [examine -hex Z] == 'h1111";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest PASS B"
force A 'h000E;
force B 'h0000;
force CONTROL 'h3;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest PASS B"
force A 'h000E;
force B 'h1111;
force CONTROL 'h3;
run;
echo "Assert Z [examine -hex Z] == 'h1111";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest NOT A"
force A 'h0000;
force B 'h000E;
force CONTROL 'h4;
run;
echo "Assert Z [examine -hex Z] == 'hFFFF";
echo "Assert OF [examine -hex OF] == 'hFFFF";
echo "Assert CC [examine CC] == 010";

echo "\nTest NOT A"
force A 'h1011;
force B 'h000E;
force CONTROL 'h4;
run;
echo "Assert Z [examine -hex Z] == 'hEFEE";
echo "Assert OF [examine -hex OF] == 'hFFFF";
echo "Assert CC [examine CC] == 010";

echo "\nTest NOT A"
force A 'hBBBB;
force B 'h000E;
force CONTROL 'h4;
run;
echo "Assert Z [examine -hex Z] == 'h4444";
echo "Assert OF [examine -hex OF] == 'hFFFF";
echo "Assert CC [examine CC] == 010";

echo "\nTest MUL A*B (0*0)"
force A 'h0000;
force B 'h0000;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest MUL A*B (1*0)"
force A 'h0001;
force B 'h0000;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h0000";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 001";

echo "\nTest MUL A*B (1*1)"
force A 'h0001;
force B 'h0001;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h0001";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest MUL A*B (4*3)"
force A 'h0004;
force B 'h0003;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h000C";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest MUL A*B (14*13)"
force A 'h000D;
force B 'h000E;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h00B6";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest MUL A*B (DEAD*BEEF) (57005*48879)"
force A 'hDEAD;
force B 'hBEEF;
force CONTROL 'h5;
run;
echo "Assert Z [examine -hex Z] == 'h4983";
echo "Assert OF [examine -hex OF] == 'hA614";
echo "Assert CC [examine CC] == 010";

echo "\nTest Shift L"
force A 'h000D;
force B 'h000E;
force CONTROL 'h6;
run;
echo "Assert Z [examine -hex Z] == 'h001A";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest Shift L"
force A 'h0010;
force B 'h000E;
force CONTROL 'h6;
run;
echo "Assert Z [examine -hex Z] == 'h0020";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest Shift L"
force A 'hBEEF;
force B 'h000E;
force CONTROL 'h6;
run;
echo "Assert Z [examine -hex Z] == 'h7DDE";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest Shift R"
force A 'h0010;
force B 'h000E;
force CONTROL 'h7;
run;
echo "Assert Z [examine -hex Z] == 'h0008";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";

echo "\nTest Shift R"
force A 'hBEEF;
force B 'h000E;
force CONTROL 'h7;
run;
echo "Assert Z [examine -hex Z] == 'hDF77";
echo "Assert OF [examine -hex OF] == 'h0000";
echo "Assert CC [examine CC] == 100";