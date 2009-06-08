library verilog;
use verilog.vl_types.all;
entity single_port_rom is
    port(
        addr            : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end single_port_rom;
