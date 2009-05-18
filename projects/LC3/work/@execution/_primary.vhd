library verilog;
use verilog.vl_types.all;
entity Execution is
    port(
        Is_Immediate    : in     vl_logic;
        ALU_CONTROL     : in     vl_logic_vector(3 downto 0);
        IR              : in     vl_logic_vector(15 downto 0);
        RS1_DATA        : in     vl_logic_vector(15 downto 0);
        RS2_DATA        : in     vl_logic_vector(15 downto 0);
        NPZ             : out    vl_logic_vector(2 downto 0);
        Y               : out    vl_logic_vector(15 downto 0)
    );
end Execution;
