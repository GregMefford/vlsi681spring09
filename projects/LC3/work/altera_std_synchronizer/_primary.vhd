library verilog;
use verilog.vl_types.all;
entity altera_std_synchronizer is
    generic(
        depth           : integer := 3
    );
    port(
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        din             : in     vl_logic;
        dout            : out    vl_logic
    );
end altera_std_synchronizer;
