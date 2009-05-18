library verilog;
use verilog.vl_types.all;
entity lpm_counter0 is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(1 downto 0);
        sload           : in     vl_logic;
        q               : out    vl_logic_vector(1 downto 0)
    );
end lpm_counter0;
