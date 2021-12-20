library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity succes_com_tb is
end succes_com_tb;

architecture tb of succes_com_tb is
component succes_com
    port(clk    :    in std_logic;
        reset   :    in std_logic;
	input	:    in std_logic;
        succes  :    out std_logic
);
end component;

    signal clk, reset, input, succes    :    std_logic;

begin
    m: succes_com port map (clk, reset, input, succes);
    reset <=    '1' after 0 ns,
            	'0' after 50 ns,
            	'1' after 600 ns,
            	'0' after 650 ns;
    
    clk <= 	'0' after 0 ns,
           	'1' after 20 ns when clk /= '1' else '0' after 20 ns;

    input <=	'0' after 0 ns,
		'1' after 330 ns,
		'0' after 600 ns,
		'1' after 970 ns,
		'0' after 1180 ns,
		'1' after 1400 ns;
 
end architecture;
