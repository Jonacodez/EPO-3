library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity counter is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        enable : in  std_logic;
	notes_OUT : in std_logic_vector( 4 downto 0);
	count_out  : out std_logic
	
);
end counter;

