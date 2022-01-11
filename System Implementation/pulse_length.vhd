library IEEE;
use IEEE.std_logic_1164.ALL;

entity pulse_length is
port (
	clk                  	: in  std_logic;
	reset                 	: in  std_logic;
	input_p						: in std_logic;
	pulse_len		: out std_logic_vector(2 downto 0));
end pulse_length;

