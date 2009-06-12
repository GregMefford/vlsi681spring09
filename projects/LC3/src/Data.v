module Data(
	MAR_LE,
	MAR_CONTROL,
	WE,
	CLK,
	RD_DATA,
	Y,
	DATA,
	MAR
);

input	MAR_LE;
input	MAR_CONTROL;
input	WE;
input	CLK;
input	[15:0] RD_DATA;
input	[15:0] Y;
output	[15:0] DATA;

output	[15:0] MAR;

wire LCD_ADDR;
wire DRAM_WE;
wire [15:0] DRAM_Data;
reg  [15:0] LCD_Data;
reg  [15:0] LCD_Cycles;
reg  [15:0] CLK_Counter;
wire [15:0] LCD_Counter;

assign LCD_ADDR = (16'h1000 == MAR);
assign DRAM_WE = (~LCD_ADDR && MEM_WE);
assign MAR = (MAR_CONTROL) ? DATA : Y;
assign DATA = (LCD_ADDR) ? DRAM_Data : LCD_Counter;

always @(posedge CLK) begin
	CLK_Counter = CLK_Counter + 1;
	if(DRAM_WE) LCD_Cycles = CLK_Counter;
	if(LCD_ADDR && MEM_WE) LCD_Data = RD_DATA;
end

DRAM	DRAM_inst (
	.address ( MAR[11:0] ),
	.clock ( CLK ),
	.data ( RD_DATA ),
	.wren ( WE ),
	.q ( DRAM_Data )
);

endmodule
