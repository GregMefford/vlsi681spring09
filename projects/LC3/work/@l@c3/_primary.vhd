library verilog;
use verilog.vl_types.all;
entity LC3 is
    port(
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        IR              : out    vl_logic_vector(15 downto 0);
        PC              : out    vl_logic_vector(15 downto 0);
        STAGE           : out    vl_logic_vector(1 downto 0);
        PC_CONTROL      : out    vl_logic;
        PC_LE           : out    vl_logic;
        IR_LE           : out    vl_logic;
        ALU_CONTROL     : out    vl_logic_vector(2 downto 0);
        ALU_MuxA        : out    vl_logic;
        ALU_MuxB        : out    vl_logic_vector(2 downto 0);
        Y               : out    vl_logic_vector(15 downto 0);
        NPZ             : out    vl_logic_vector(2 downto 0);
        \OF\            : out    vl_logic;
        REG_CONTROL     : out    vl_logic;
        RS1_DATA        : out    vl_logic_vector(15 downto 0);
        RS2_DATA        : out    vl_logic_vector(15 downto 0);
        RD_DATA         : out    vl_logic_vector(15 downto 0);
        RD_LE           : out    vl_logic;
        MAR_CONTROL     : out    vl_logic;
        MAR_LE          : out    vl_logic;
        MEM_WE          : out    vl_logic;
        MAR             : out    vl_logic_vector(15 downto 0);
        DATA            : out    vl_logic_vector(15 downto 0);
        ALU_A           : out    vl_logic_vector(15 downto 0);
        ALU_B           : out    vl_logic_vector(15 downto 0)
    );
end LC3;
