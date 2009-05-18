library verilog;
use verilog.vl_types.all;
entity Registers is
    port(
        RD_LE           : in     vl_logic;
        REG_Control     : in     vl_logic;
        DATA            : in     vl_logic_vector(15 downto 0);
        IR              : in     vl_logic_vector(15 downto 0);
        Y               : in     vl_logic_vector(15 downto 0);
        RS1_DATA        : out    vl_logic_vector(15 downto 0);
        RS2_DATA        : out    vl_logic_vector(15 downto 0)
    );
end Registers;
