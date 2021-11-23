library ieee;
use ieee.std_logic_1164.all;

entity gpu is 
	port(
	data_in			:	in std_logic_vector(4 downto 0);
	clk, reset		:	in std_logic;
	r, g, b			:	out std_logic;
	Hsync, Vsync		:	out std_logic
	);
end gpu;

architecture structural of gpu is

	component vga_counter is
		port(	reset			:	in std_logic;
			pixel_clk		:	in std_logic;
			Hsync, Vsync		:	out std_logic;
			Hactiveout, Vactiveout	:	out std_logic;
			Hcountout, Vcountout	:	out integer
		);
	end component vga_counter;
	
	component image_gen is
		port(	pixel_clk, reset	:	in std_logic;
			Hcount, Vcount		:	in integer;
			Hactive, Vactive	:	in std_logic;
			data_in			:	in std_logic_vector(4 downto 0);
			r, g, b			:	out std_logic
		);
	end component image_gen;

	signal Hc, Vc		:	integer;
	signal Ha, Va		:	std_logic;
	
begin

counter: vga_counter port map(
	pixel_clk => clk,
	reset => reset,
	Hsync => Hsync,
	Vsync => Vsync,
	Hactiveout => Ha,
	Vactiveout => Va,
	Hcountout => Hc,
	Vcountout => Vc
	);

generator: image_gen port map(
	pixel_clk => clk,
	reset => reset,
	Hcount => Hc,
	Vcount => Vc,
	Hactive => Ha,
	Vactive => Va,
	data_in => data_in,
	r => r,
	g => g,
	b => b
	);

end architecture structural;
	
