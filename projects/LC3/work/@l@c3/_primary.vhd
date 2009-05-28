library verilog;
use verilog.vl_types.all;
entity LC3 is
    port(
        CLK             : in     vl_logic;
        IR              : in     vl_logic_vector(15 downto 0);
        REG_CONTROL     : out    vl_logic;
        ALU_CONTROL     : out    vl_logic_vector(3 downto 0);
        PC              : out    vl_logic_vector(15 downto 0);
        RS1_DATA        : out    vl_logic_vector(15 downto 0);
        RS2_DATA        : out    vl_logic_vector(15 downto 0);
        STAGE           : out    vl_logic_vector(1 downto 0);
        Y               : out    vl_logic_vector(15 downto 0)
    );
end LC3;
