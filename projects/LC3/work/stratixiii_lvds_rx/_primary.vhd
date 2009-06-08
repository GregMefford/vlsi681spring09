library verilog;
use verilog.vl_types.all;
entity stratixiii_lvds_rx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        enable_dpa_mode : string  := "OFF";
        lose_lock_on_one_change: string  := "OFF";
        reset_fifo_at_first_lock: string  := "ON";
        x_on_bitslip    : string  := "ON";
        rx_align_data_reg: string  := "RISING_EDGE";
        enable_soft_cdr_mode: string  := "OFF";
        sim_dpa_output_clock_phase_shift: integer := 0;
        sim_dpa_is_negative_ppm_drift: string  := "OFF";
        sim_dpa_net_ppm_variation: integer := 0;
        enable_dpa_align_to_rising_edge_only: string  := "OFF";
        enable_dpa_initial_phase_selection: string  := "OFF";
        dpa_initial_phase_value: integer := 0;
        registered_output: string  := "ON";
        use_external_pll: string  := "OFF";
        use_dpa_calibration: integer := 0
    );
    port(
        rx_in           : in     vl_logic_vector;
        rx_reset        : in     vl_logic_vector;
        rx_fastclk      : in     vl_logic;
        rx_slowclk      : in     vl_logic;
        rx_enable       : in     vl_logic;
        rx_dpll_reset   : in     vl_logic_vector;
        rx_dpll_hold    : in     vl_logic_vector;
        rx_dpll_enable  : in     vl_logic_vector;
        rx_fifo_reset   : in     vl_logic_vector;
        rx_channel_data_align: in     vl_logic_vector;
        rx_cda_reset    : in     vl_logic_vector;
        rx_out          : out    vl_logic_vector;
        rx_dpa_locked   : out    vl_logic_vector;
        rx_cda_max      : out    vl_logic_vector;
        rx_divfwdclk    : out    vl_logic_vector
    );
end stratixiii_lvds_rx;
