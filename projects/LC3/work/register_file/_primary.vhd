library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        CLK             : in     vl_logic;
        RD_LE           : in     vl_logic;
        RS1             : in     vl_logic_vector(2 downto 0);
        RS2             : in     vl_logic_vector(2 downto 0);
        RD              : in     vl_logic_vector(2 downto 0);
        DATA_IN         : in     vl_logic_vector(15 downto 0);
        RS1_DATA        : out    vl_logic_vector(15 downto 0);
        RS2_DATA        : out    vl_logic_vector(15 downto 0);
        RD_DATA         : out    vl_logic_vector(15 downto 0)
    );
end register_file;
