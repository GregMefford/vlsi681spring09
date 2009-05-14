library verilog;
use verilog.vl_types.all;
entity control is
    port(
        INSTRUCTION     : in     vl_logic_vector(15 downto 0);
        MAR_LE          : out    vl_logic;
        MDR_LE          : out    vl_logic;
        PC_LE           : out    vl_logic;
        IR_LE           : out    vl_logic;
        ALU_CONTROL     : out    vl_logic_vector(3 downto 0);
        IS_IMMEDIATE    : out    vl_logic
    );
end control;
