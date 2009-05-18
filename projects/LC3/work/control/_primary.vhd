library verilog;
use verilog.vl_types.all;
entity control is
    port(
        CLK             : in     vl_logic;
        STAGE           : in     vl_logic_vector(1 downto 0);
        INSTRUCTION     : in     vl_logic_vector(15 downto 0);
        NEXT_STAGE_LE   : out    vl_logic;
        NEXT_STAGE      : out    vl_logic_vector(1 downto 0);
        MAR_LE          : out    vl_logic;
        MAR_CONTROL     : out    vl_logic;
        MEM_WE          : out    vl_logic;
        MEM_CLK         : out    vl_logic;
        IS_IMMEDIATE    : out    vl_logic;
        ALU_CONTROL     : out    vl_logic_vector(3 downto 0);
        RD_LE           : out    vl_logic;
        REG_CONTROL     : out    vl_logic;
        EA_CONTROL      : out    vl_logic_vector(2 downto 0);
        IR_LE           : out    vl_logic;
        PC_CONTROL      : out    vl_logic_vector(1 downto 0);
        PC_LE           : out    vl_logic
    );
end control;
