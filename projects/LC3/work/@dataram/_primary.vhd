library verilog;
use verilog.vl_types.all;
entity Dataram is
    generic(
        DATA_WIDTH      : integer := 16;
        ADDR_WIDTH      : integer := 16
    );
    port(
        data_in         : in     vl_logic_vector;
        read_addr       : in     vl_logic_vector;
        write_addr      : in     vl_logic_vector;
        we              : in     vl_logic;
        clk             : in     vl_logic;
        data_out        : out    vl_logic_vector
    );
end Dataram;
