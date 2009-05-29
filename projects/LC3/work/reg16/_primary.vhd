library verilog;
use verilog.vl_types.all;
entity reg16 is
    port(
        LE              : in     vl_logic;
        DATA_IN         : in     vl_logic_vector(15 downto 0);
        DATA_OUT        : out    vl_logic_vector(15 downto 0)
    );
end reg16;
