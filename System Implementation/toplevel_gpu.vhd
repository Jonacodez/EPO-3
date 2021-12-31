library IEEE;
use IEEE.std_logic_1164.ALL;

entity toplevel_gpu is
port(
	clk, reset		:	in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
	r, g, b			:	out std_logic_vector (1 downto 0);
	Hsync, Vsync		:	out std_logic
	);
end toplevel_gpu;

