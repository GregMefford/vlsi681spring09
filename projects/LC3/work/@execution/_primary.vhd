library verilog;
use verilog.vl_types.all;
entity Execution is
    port(
        ALU_CONTROL     : in     vl_logic_vector(2 downto 0);
        ALU_MuxA        : in     vl_logic;
        ALU_MuxB        : in     vl_logic_vector(2 downto 0);
        PC              : in     vl_logic_vector(15 downto 0);
        IR              : in     vl_logic_vector(15 downto 0);
        RS1_DATA        : in     vl_logic_vector(15 downto 0);
        RS2_DATA        : in     vl_logic_vector(15 downto 0);
        NPZ             : out    vl_logic_vector(2 downto 0);
        \OF\            : out    vl_logic;
        Y               : out    vl_logic_vector(15 downto 0)
    );
end Execution;
