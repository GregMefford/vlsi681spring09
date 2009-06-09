module clk_div(clk_48Mhz,rst,clk_100Hz);
input clk_48Mhz;
input rst;
output reg clk_100Hz;

integer count;

// Divide by 48
always @(posedge clk_48Mhz or negedge rst)
	begin
			if (!rst)
				begin
					clk_100Hz <= 1'b0;
					count <= 0;
				end
			else if (count == 480000)
				begin
					count <= 0;
					clk_100Hz <= ~ clk_100Hz;
				end
			else
				begin
					count <= count + 1;
				end
	end
endmodule