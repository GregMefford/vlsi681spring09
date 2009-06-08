library verilog;
use verilog.vl_types.all;
entity altserial_flash_loader is
    generic(
        enhanced_mode   : integer := 0;
        intended_device_family: string  := "Cyclone";
        enable_shared_access: string  := "OFF";
        lpm_type        : string  := "ALTSERIAL_FLASH_LOADER"
    );
    port(
        noe             : in     vl_logic;
        asmi_access_granted: in     vl_logic;
        sdoin           : in     vl_logic;
        asmi_access_request: out    vl_logic;
        data0out        : out    vl_logic;
        scein           : in     vl_logic;
        dclkin          : in     vl_logic
    );
end altserial_flash_loader;
