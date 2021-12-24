library ieee;
use ieee.std_logic_1164.all;

entity toplevel_GPU is 
	port(
	clk, reset		:	in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
	r, g, b			:	out std_logic_vector (1 downto 0);
	Hsync, Vsync		:	out std_logic
	);
end toplevel_GPU;

architecture structural of toplevel_GPU is

	component vga_counter is
		port(	reset			:	in std_logic;
			pixel_clk		:	in std_logic;
			Hsync, Vsync		:	out std_logic;
			display_enable		:	out std_logic;
			h_pixel, v_pixel	:	out std_logic_vector (9 downto 0)
		);
	end component vga_counter;
	
	component image_gen_2 is
		port(	pixel_clk, reset	:	in std_logic;
			Hcount, Vcount		:	in std_logic_vector (9 downto 0);
			display_enable		: 	in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			r, g, b			:	out std_logic_vector (1 downto 0)
	
		);
	end component image_gen_2;

	signal Hc, Vc			:	std_logic_vector (9 downto 0);
	signal display_enable_int	:	std_logic;
	
begin

counter: vga_counter port map(
	pixel_clk => clk,
	reset => reset,
	Hsync => Hsync,
	Vsync => Vsync,
	display_enable => display_enable_int,
	h_pixel => Hc,
	v_pixel => Vc
	);

generator: image_gen_2 port map(
	pixel_clk => clk,
	reset => reset,
	Hcount => Hc,
	Vcount => Vc,
	display_enable => display_enable_int,
	output0 => output0,
	output1 => output1,
	output2 => output2,
	output3 => output3,
	output4 => output4,
	output5 => output5,
	output6 => output6,
	output7 => output7,
	r => r,
	g => g,
	b => b
	);

end architecture structural;
	
