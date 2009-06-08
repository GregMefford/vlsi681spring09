library verilog;
use verilog.vl_types.all;
entity alt_cal is
    generic(
        number_of_channels: integer := 1;
        channel_address_width: integer := 1;
        sim_model_mode  : string  := "TRUE";
        lpm_type        : string  := "alt_cal";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        busy            : out    vl_logic;
        cal_error       : out    vl_logic_vector;
        clock           : in     vl_logic;
        dprio_addr      : out    vl_logic_vector(15 downto 0);
        dprio_busy      : in     vl_logic;
        dprio_datain    : in     vl_logic_vector(15 downto 0);
        dprio_dataout   : out    vl_logic_vector(15 downto 0);
        dprio_rden      : out    vl_logic;
        dprio_wren      : out    vl_logic;
        quad_addr       : out    vl_logic_vector(6 downto 0);
        remap_addr      : in     vl_logic_vector(9 downto 0);
        reset           : in     vl_logic;
        retain_addr     : out    vl_logic_vector(0 downto 0);
        start           : in     vl_logic;
        testbuses       : in     vl_logic_vector
    );
end alt_cal;
