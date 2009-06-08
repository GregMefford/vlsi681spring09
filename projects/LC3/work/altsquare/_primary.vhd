library verilog;
use verilog.vl_types.all;
entity altsquare is
    generic(
        data_width      : integer := 1;
        result_width    : integer := 1;
        pipeline        : integer := 0;
        representation  : string  := "UNSIGNED";
        result_alignment: string  := "LSB";
        lpm_hint        : string  := "UNUSED";
        lpm_type        : string  := "altsquare"
    );
    port(
        data            : in     vl_logic_vector;
        clock           : in     vl_logic;
        ena             : in     vl_logic;
        aclr            : in     vl_logic;
        result          : out    vl_logic_vector
    );
end altsquare;
