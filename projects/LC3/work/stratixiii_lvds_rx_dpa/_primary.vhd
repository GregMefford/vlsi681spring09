library verilog;
use verilog.vl_types.all;
entity stratixiii_lvds_rx_dpa is
    generic(
        enable_soft_cdr_mode: string  := "OFF";
        sim_dpa_is_negative_ppm_drift: string  := "OFF";
        sim_dpa_net_ppm_variation: integer := 0;
        enable_dpa_align_to_rising_edge_only: string  := "OFF";
        enable_dpa_initial_phase_selection: string  := "OFF";
        dpa_initial_phase_value: integer := 0;
        PHASE_NUM       : integer := 8
    );
    port(
        rx_in           : in     vl_logic;
        rx_fastclk      : in     vl_logic;
        rx_enable       : in     vl_logic;
        rx_dpa_reset    : in     vl_logic;
        rx_dpa_hold     : in     vl_logic;
        rx_out          : out    vl_logic;
        rx_dpa_clk      : out    vl_logic;
        rx_dpa_loaden   : out    vl_logic;
        rx_dpa_locked   : out    vl_logic
    );
end stratixiii_lvds_rx_dpa;
