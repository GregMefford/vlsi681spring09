module debounce(pb, clock_100Hz, pb_debounced);

input pb, clock_100Hz;
output reg pb_debounced;

//reg PB_sync_0; always @(posedge clock_100Hz) PB_sync_0 <= ~pb;
//reg PB_sync_1; always @(posedge clock_100Hz) PB_sync_1 <= PB_sync_0;

//reg [15:0] PB_cnt;

//reg PB_state;
//wire PB_idle = (PB_state==PB_sync_1);
//wire PB_cnt_max = &PB_cnt;

// Debounce Button: Filters out mechanical switch bounce for around 40Ms.
// Debounce clock should be approximately 10ms
always @(posedge clock_100Hz)
begin

	pb_debounced <= pb;
	
//	if(PB_idle)
//		PB_cnt <= 0;
//	else
//	begin
//		PB_cnt <= PB_cnt + 1;
//		if(PB_cnt_max)
//		begin
//			PB_state <= ~PB_state;
//			pb_debounced <= PB_state;
//		end
//	end


end
endmodule


//	SHIFT_PB[2:0] <= SHIFT_PB[3:1];
//	SHIFT_PB[3] <= ~pb;
//	if (SHIFT_PB == "0000")
//		pb_debounced <= 1;
//	else
//		pb_debounced <= 0;

//reg [19:0] count = 0;
//reg	temp = 0;

//reg [3:0] SHIFT_PB =0;
//integer cnt;
//parameter msb = 19;
//reg [msb:0] delay_cntr = 0;
//reg [3:0] SHIFT_PB;

//	if(rst)
//	begin
//		temp <= pb;
//		pb_debounced <= pb;
//		count <= 0;
//	end
//	else if (pb != temp)
//	begin	
//		temp <= pb;
//		count <= 0;
//	end
//	else if (count == 480000)
//	begin
//		pb_debounced <= temp;
//	end