library verilog;
use verilog.vl_types.all;
entity Instruction_Fetch is
    port(
        CLK             : in     vl_logic;
        PC_LE           : in     vl_logic;
        IR_LE           : in     vl_logic;
        Y               : in     vl_logic_vector(15 downto 0);
        PC_CONTROL      : in     vl_logic;
        IR              : out    vl_logic_vector(15 downto 0);
        PC              : out    vl_logic_vector(15 downto 0)
    );
end Instruction_Fetch;
