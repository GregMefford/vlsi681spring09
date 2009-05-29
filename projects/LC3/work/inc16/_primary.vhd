library verilog;
use verilog.vl_types.all;
entity inc16 is
    port(
        value           : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(15 downto 0)
    );
end inc16;
