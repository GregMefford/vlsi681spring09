library verilog;
use verilog.vl_types.all;
entity control is
    port(
        CLK             : in     vl_logic;
        STAGE           : in     vl_logic_vector(1 downto 0);
        IR              : in     vl_logic_vector(15 downto 0);
        ALU_CONTROL     : out    vl_logic_vector(2 downto 0);
        ALU_MuxA        : out    vl_logic;
        ALU_MuxB        : out    vl_logic_vector(2 downto 0);
        MAR_LE          : out    vl_logic;
        MAR_CONTROL     : out    vl_logic;
        MEM_WE          : out    vl_logic;
        RD_LE           : out    vl_logic;
        REG_CONTROL     : out    vl_logic;
        PC_CONTROL      : out    vl_logic;
        PC_LE           : out    vl_logic;
        IR_LE           : out    vl_logic
    );
end control;
