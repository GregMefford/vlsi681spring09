library verilog;
use verilog.vl_types.all;
entity dcfifo_mixed_widths is
    generic(
        lpm_width       : integer := 1;
        lpm_widthu      : integer := 1;
        lpm_numwords    : integer := 2;
        delay_rdusedw   : integer := 1;
        delay_wrusedw   : integer := 1;
        rdsync_delaypipe: integer := 0;
        wrsync_delaypipe: integer := 0;
        intended_device_family: string  := "APEX20KE";
        lpm_showahead   : string  := "OFF";
        underflow_checking: string  := "ON";
        overflow_checking: string  := "ON";
        clocks_are_synchronized: string  := "FALSE";
        use_eab         : string  := "ON";
        add_ram_output_register: string  := "OFF";
        add_width       : integer := 1;
        lpm_hint        : string  := "USE_EAB=ON";
        lpm_type        : string  := "dcfifo_mixed_widths";
        ram_block_type  : string  := "AUTO";
        add_usedw_msb_bit: string  := "OFF";
        write_aclr_synch: string  := "OFF"
    );
    port(
        data            : in     vl_logic_vector;
        rdclk           : in     vl_logic;
        wrclk           : in     vl_logic;
        aclr            : in     vl_logic;
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        rdfull          : out    vl_logic;
        wrfull          : out    vl_logic;
        rdempty         : out    vl_logic;
        wrempty         : out    vl_logic;
        rdusedw         : out    vl_logic_vector;
        wrusedw         : out    vl_logic_vector;
        q               : out    vl_logic_vector
    );
end dcfifo_mixed_widths;
