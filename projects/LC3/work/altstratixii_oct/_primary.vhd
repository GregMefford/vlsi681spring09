library verilog;
use verilog.vl_types.all;
entity altstratixii_oct is
    generic(
        lpm_type        : string  := "altstratixii_oct"
    );
    port(
        terminationenable: in     vl_logic;
        terminationclock: in     vl_logic;
        rdn             : in     vl_logic;
        rup             : in     vl_logic
    );
end altstratixii_oct;
