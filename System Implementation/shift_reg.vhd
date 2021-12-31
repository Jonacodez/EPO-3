library IEEE;
use IEEE.std_logic_1164.ALL;

entity shift_reg is
port(	input:		in std_logic_vector(4 downto 0);
	clk:		in std_logic;
	shift:		in std_logic;
	reset:		in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0);
	end_bit:	out std_logic
);
end shift_reg;

