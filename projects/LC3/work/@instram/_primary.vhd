library verilog;
use verilog.vl_types.all;
entity Instram is
    port(
        clk             : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0)
    );
end Instram;
