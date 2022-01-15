library IEEE;
use IEEE.std_logic_1164.ALL;

entity image_gen_2 is

port(	pixel_clk, reset								:	in std_logic;
		Hcount, Vcount									:	in std_logic_vector (9 downto 0);
		display_enable									:	in std_logic;
		mode_sel											: in std_logic;
		output0, output1, output2, output3, output4, output5, output6, output7		:	in std_logic_vector(4 downto 0);
		r2, g2, b2										:	out std_logic_vector (1 downto 0)
		);
end image_gen_2;

