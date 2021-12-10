library ieee;
use ieee.std_logic_1164.all;

entity gpu is 
	port(
	clk, reset		:	in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
	r, g, b			:	out std_logic;
	Hsync, Vsync		:	out std_logic
	);
end gpu;

architecture structural of gpu is

	component vga_counter is
		port(	reset			:	in std_logic;
			pixel_clk		:	in std_logic;
			Hsync, Vsync		:	out std_logic;
			display_enable		:	out std_logic;
			h_pixel, v_pixel	:	out std_logic_vector (9 downto 0)
		);
	end component vga_counter;
	
	component image_gen is
		port( 	pixel_clk, reset	:	in std_logic;
			display_enable		:	in std_logic;
			r, g, b			:	out std_logic
		);
 	end component image_gen;
	signal x, y			:	std_logic_vector (9 downto 0);
	signal display_enable_int	:	std_logic;
	
begin

counter: vga_counter port map(
	pixel_clk => clk,
	reset => reset,
	Hsync => Hsync,
	Vsync => Vsync,
	display_enable => display_enable_int,
	h_pixel => x,
	v_pixel => y
	);

generator: image_gen port map(
	pixel_clk => clk,
	reset => reset,
	display_enable => display_enable_int,
	r => r,
	g => g,
	b => b
	);
end architecture structural;
	
