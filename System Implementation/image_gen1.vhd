library IEEE;
use IEEE.std_logic_1164.ALL;

entity image_gen1 is
port(	pixel_clk, reset						:	in std_logic;
		note_confirm					:	in std_logic;
		Hcount, Vcount					:	in std_logic_vector (9 downto 0);
		display_enable					:	in std_logic;
		mode_sel											: in std_logic;
		input					:	in std_logic_vector(4 downto 0);
		r1, g1, b1					:	out std_logic_vector (1 downto 0)
		);
end image_gen1;

