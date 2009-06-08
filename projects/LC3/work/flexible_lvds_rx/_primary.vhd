library verilog;
use verilog.vl_types.all;
entity flexible_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        use_extra_ddio_register: string  := "YES";
        use_extra_pll_clk: string  := "NO";
        buffer_implementation: string  := "RAM";
        registered_data_align_input: string  := "OFF";
        use_external_pll: string  := "OFF";
        registered_output: string  := "ON";
        add_latency     : string  := "YES"
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_slowclk      : in     vl_logic;
        rx_syncclk      : in     vl_logic;
        pll_areset      : in     vl_logic;
        rx_data_align   : in     vl_logic_vector;
        rx_cda_reset    : in     vl_logic_vector;
        rx_locked       : in     vl_logic;
        rx_out          : out    vl_logic_vector
    );
end flexible_lvds_rx;
