library verilog;
use verilog.vl_types.all;
entity RAM_data is
    port(
        CLK             : in     vl_logic;
        WE              : in     vl_logic;
        ADDRESS         : in     vl_logic_vector(15 downto 0);
        DATA_IN         : in     vl_logic_vector(15 downto 0);
        DATA_OUT        : out    vl_logic_vector(15 downto 0)
    );
end RAM_data;
