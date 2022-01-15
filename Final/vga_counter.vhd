library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga_counter is
port(	reset			:	in std_logic;
		pixel_clk		:	in std_logic;
		Hsync, Vsync		:	out std_logic;
		display_enable		:	out std_logic;
		h_pixel, v_pixel	:	out std_logic_vector (9 downto 0)
	);
end vga_counter;

