library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        CONTROL         : in     vl_logic_vector(2 downto 0);
        CC              : out    vl_logic_vector(2 downto 0);
        Z               : out    vl_logic_vector(15 downto 0);
        \OF\            : out    vl_logic
    );
end ALU;
