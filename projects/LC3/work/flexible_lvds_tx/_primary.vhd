library verilog;
use verilog.vl_types.all;
entity flexible_lvds_tx is
    generic(
        number_of_channels: integer := 1;
        deserialization_factor: integer := 4;
        registered_input: string  := "ON";
        use_new_coreclk_ckt: string  := "FALSE";
        outclock_multiply_by: integer := 1;
        outclock_duty_cycle: integer := 50;
        outclock_divide_by: integer := 1;
        use_self_generated_outclock: string  := "FALSE"
    );
    port(
        tx_in           : in     vl_logic_vector;
        tx_fastclk      : in     vl_logic;
        tx_slowclk      : in     vl_logic;
        tx_regclk       : in     vl_logic;
        tx_locked       : in     vl_logic;
        pll_areset      : in     vl_logic;
        pll_outclock    : in     vl_logic;
        tx_out          : out    vl_logic_vector;
        tx_outclock     : out    vl_logic
    );
end flexible_lvds_tx;
