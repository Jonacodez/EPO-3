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
			Hcountout, Vcountout	:	out integer
		);
	end component vga_counter;
	
	component image_gen is
		port(	pixel_clk, reset	:	in std_logic;
			Hcount, Vcount		:	in integer;
			display_enable		:	in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			r_out, g_out, b_out	:	out std_logic
			--r, g, b			:	out std_logic
		);
	end component image_gen;

	signal Hc, Vc			:	integer;
	signal display_enable_int	:	std_logic;
	
begin

counter: vga_counter port map(
	pixel_clk => clk,
	reset => reset,
	Hsync => Hsync,
	Vsync => Vsync,
	display_enable => display_enable_int,
	Hcountout => Hc,
	Vcountout => Vc
	);

generator: image_gen port map(
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
	r_out => r,
	g_out => g,
	b_out => b
	);

end architecture structural;
	
