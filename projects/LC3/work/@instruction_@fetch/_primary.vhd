library verilog;
use verilog.vl_types.all;
entity Instruction_Fetch is
    port(
        PC_LE           : in     vl_logic;
        IR_LE           : in     vl_logic;
        DATA            : in     vl_logic_vector(15 downto 0);
        EA              : in     vl_logic_vector(15 downto 0);
        PC_CONTROL      : in     vl_logic_vector(1 downto 0);
        IR              : out    vl_logic_vector(15 downto 0);
        PC              : out    vl_logic_vector(15 downto 0)
    );
end Instruction_Fetch;
