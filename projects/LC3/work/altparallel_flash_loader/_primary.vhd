library verilog;
use verilog.vl_types.all;
entity altparallel_flash_loader is
    generic(
        flash_data_width: integer := 16;
        normal_mode     : integer := 1;
        fifo_size       : integer := 16;
        safe_mode_revert: integer := 0;
        dclk_divisor    : integer := 1;
        safe_mode_retry : integer := 1;
        features_cfg    : integer := 1;
        burst_mode_numonyx: integer := 0;
        burst_mode_intel: integer := 0;
        burst_mode      : integer := 0;
        clk_divisor     : integer := 1;
        addr_width      : integer := 20;
        option_bits_start_address: integer := 0;
        safe_mode_revert_addr: integer := 0;
        enhanced_flash_programming: integer := 0;
        page_mode       : integer := 0;
        lpm_type        : string  := "ALTPARALLEL_FLASH_LOADER";
        features_pgm    : integer := 1;
        n_flash         : integer := 1;
        burst_mode_spansion: integer := 0;
        auto_restart    : string  := "OFF";
        page_clk_divisor: integer := 1;
        conf_data_width : integer := 1;
        TRISTATE_CHECKBOX: integer := 0;
        safe_mode_halt  : integer := 0;
        TOP_PFL_IR_BITS : integer := 5;
        N_FLASH_BITS    : integer := 4
    );
    port(
        fpga_data       : out    vl_logic_vector;
        fpga_dclk       : out    vl_logic;
        flash_nce       : out    vl_logic;
        fpga_nstatus    : in     vl_logic;
        pfl_clk         : in     vl_logic;
        fpga_nconfig    : out    vl_logic;
        flash_noe       : out    vl_logic;
        flash_nwe       : out    vl_logic;
        fpga_conf_done  : in     vl_logic;
        pfl_flash_access_granted: in     vl_logic;
        pfl_nreconfigure: in     vl_logic;
        flash_nreset    : out    vl_logic;
        pfl_nreset      : in     vl_logic;
        flash_data      : inout  vl_logic_vector;
        flash_nadv      : out    vl_logic;
        flash_clk       : out    vl_logic;
        flash_addr      : out    vl_logic_vector;
        pfl_flash_access_request: out    vl_logic;
        fpga_pgm        : in     vl_logic_vector(2 downto 0)
    );
end altparallel_flash_loader;
