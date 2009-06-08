library verilog;
use verilog.vl_types.all;
entity altddio_out is
    generic(
        width           : integer := 1;
        power_up_high   : string  := "OFF";
        oe_reg          : string  := "UNUSED";
        extend_oe_disable: string  := "UNUSED";
        intended_device_family: string  := "Stratix";
        invert_output   : string  := "OFF";
        lpm_type        : string  := "altddio_out";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        datain_h        : in     vl_logic_vector;
        datain_l        : in     vl_logic_vector;
        outclock        : in     vl_logic;
        outclocken      : in     vl_logic;
        aset            : in     vl_logic;
        aclr            : in     vl_logic;
        sset            : in     vl_logic;
        sclr            : in     vl_logic;
        oe              : in     vl_logic;
        dataout         : out    vl_logic_vector;
        oe_out          : out    vl_logic_vector
    );
end altddio_out;
