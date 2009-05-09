library verilog;
use verilog.vl_types.all;
entity RAM_instruction is
    port(
        CLK             : in     vl_logic;
        ADDRESS         : in     vl_logic_vector(15 downto 0);
        INSTRUCTION     : out    vl_logic_vector(15 downto 0)
    );
end RAM_instruction;
