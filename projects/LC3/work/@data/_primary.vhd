library verilog;
use verilog.vl_types.all;
entity Data is
    port(
        MAR_LE          : in     vl_logic;
        MAR_CONTROL     : in     vl_logic;
        WE              : in     vl_logic;
        CLK             : in     vl_logic;
        RD_DATA         : in     vl_logic_vector(15 downto 0);
        Y               : in     vl_logic_vector(15 downto 0);
        DATA            : out    vl_logic_vector(15 downto 0);
        MAR             : out    vl_logic_vector(15 downto 0)
    );
end Data;
