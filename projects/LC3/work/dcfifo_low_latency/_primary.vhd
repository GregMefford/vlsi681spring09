library verilog;
use verilog.vl_types.all;
entity dcfifo_low_latency is
    generic(
        lpm_width       : integer := 1;
        lpm_widthu      : integer := 1;
        lpm_numwords    : integer := 2;
        delay_rdusedw   : integer := 2;
        delay_wrusedw   : integer := 2;
        rdsync_delaypipe: integer := 0;
        wrsync_delaypipe: integer := 0;
        intended_device_family: string  := "Stratix";
        lpm_showahead   : string  := "OFF";
        underflow_checking: string  := "ON";
        overflow_checking: string  := "ON";
        add_usedw_msb_bit: string  := "OFF";
        write_aclr_synch: string  := "OFF";
        use_eab         : string  := "ON";
        clocks_are_synchronized: string  := "FALSE";
        add_ram_output_register: string  := "OFF";
        lpm_hint        : string  := "USE_EAB=ON"
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
end dcfifo_low_latency;
