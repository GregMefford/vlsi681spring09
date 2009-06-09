onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix unsigned /LC3/CLK
add wave -noupdate -format Logic -radix unsigned /LC3/RESET
add wave -noupdate -format Literal -radix binary /LC3/IR
add wave -noupdate -format Literal -radix unsigned /LC3/PC
add wave -noupdate -format Literal -radix unsigned /LC3/STAGE
add wave -noupdate -format Logic -radix unsigned /LC3/PC_CONTROL
add wave -noupdate -format Logic -radix unsigned /LC3/PC_LE
add wave -noupdate -format Logic -radix unsigned /LC3/IR_LE
add wave -noupdate -format Literal -radix unsigned /LC3/ALU_CONTROL
add wave -noupdate -format Logic -radix unsigned /LC3/ALU_MuxA
add wave -noupdate -format Literal -radix unsigned /LC3/ALU_MuxB
add wave -noupdate -format Literal -radix unsigned /LC3/Y
add wave -noupdate -format Literal -radix unsigned /LC3/NPZ
add wave -noupdate -format Logic -radix unsigned /LC3/OF
add wave -noupdate -format Logic -radix unsigned /LC3/REG_CONTROL
add wave -noupdate -format Literal -radix unsigned /LC3/RS1_DATA
add wave -noupdate -format Literal -radix unsigned /LC3/RS2_DATA
add wave -noupdate -format Literal -radix unsigned /LC3/RD_DATA
add wave -noupdate -format Logic -radix unsigned /LC3/RD_LE
add wave -noupdate -format Logic -radix unsigned /LC3/MAR_CONTROL
add wave -noupdate -format Logic -radix unsigned /LC3/MAR_LE
add wave -noupdate -format Logic -radix unsigned /LC3/MEM_WE
add wave -noupdate -format Literal -radix unsigned /LC3/MAR
add wave -noupdate -format Literal -radix unsigned /LC3/DATA
add wave -noupdate -format Literal -radix unsigned /LC3/ALU_A
add wave -noupdate -format Literal -radix unsigned /LC3/ALU_B
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 103
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {994 ps}
force -freeze sim:/LC3/CLK 1 0, 0 {50 ps} -r 100
force RESET 1
run 100
force RESET 0
run 100000
