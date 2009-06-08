library verilog;
use verilog.vl_types.all;
entity stratix_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_enable0      : in     vl_logic;
        rx_enable1      : in     vl_logic;
        rx_out          : out    vl_logic_vector
    );
end stratix_lvds_rx;
