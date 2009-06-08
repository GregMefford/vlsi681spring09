library verilog;
use verilog.vl_types.all;
entity altddio_in is
    generic(
        width           : integer := 1;
        power_up_high   : string  := "OFF";
        invert_input_clocks: string  := "OFF";
        intended_device_family: string  := "Stratix";
        lpm_type        : string  := "altddio_in";
        lpm_hint        : string  := "UNUSED"
    );
    port(
        datain          : in     vl_logic_vector;
        inclock         : in     vl_logic;
        inclocken       : in     vl_logic;
        aset            : in     vl_logic;
        aclr            : in     vl_logic;
        sset            : in     vl_logic;
        sclr            : in     vl_logic;
        dataout_h       : out    vl_logic_vector;
        dataout_l       : out    vl_logic_vector
    );
end altddio_in;
