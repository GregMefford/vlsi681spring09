library verilog;
use verilog.vl_types.all;
entity effective_address is
    port(
        PC              : in     vl_logic_vector(15 downto 0);
        RS1_DATA        : in     vl_logic_vector(15 downto 0);
        CONTROL         : in     vl_logic_vector(2 downto 0);
        IR              : in     vl_logic_vector(15 downto 0);
        EA              : out    vl_logic_vector(15 downto 0)
    );
end effective_address;
