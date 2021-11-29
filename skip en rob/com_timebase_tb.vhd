library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture tb of testbench is
component com_timebase
    port(clk    :    in std_logic;
        reset   :    in std_logic;
        clk2    :    out std_logic
);
end component;

    signal clk, reset, clk2    :    std_logic;

begin
    m: com_timebase port map (clk, reset, clk2);
    reset <=    '1' after 0 ns,
            	'0' after 50 ns,
            	'1' after 600 ns,
            	'0' after 650 ns;
    
    clk <= '0' after 0 ns,
           '1' after 5 ns when clk /= '1' else '0' after 5 ns;

end architecture;
