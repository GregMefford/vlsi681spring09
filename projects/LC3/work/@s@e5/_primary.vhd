library verilog;
use verilog.vl_types.all;
entity SE5 is
    port(
        IMM5            : in     vl_logic_vector(4 downto 0);
        RESULT          : out    vl_logic_vector(15 downto 0)
    );
end SE5;
