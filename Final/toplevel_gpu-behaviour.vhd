library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplevel_gpu is

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
			mode_sel					: in std_logic;
			Hcount, Vcount		:	in std_logic_vector (9 downto 0);
			display_enable		: 	in std_logic;
			output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
			r2, g2, b2			:	out std_logic_vector (1 downto 0)
	
		);
	end component image_gen_2;

	component image_gen1 is
		port(	pixel_clk, reset	:	in std_logic;
			note_confirm				: in std_logic;
			Hcount, Vcount		:	in std_logic_vector (9 downto 0);
			display_enable		: 	in std_logic;
			mode_sel						: in std_logic;
			input	:	in std_logic_vector (4 downto 0);
			r1, g1, b1			:	out std_logic_vector (1 downto 0)
	
		);
	end component image_gen1;

	signal Hc, Vc			:	std_logic_vector (9 downto 0);
	signal display_enable_int	:	std_logic;
	signal r1, g1, b1, r2, g2, b2 : std_logic_vector(1 downto 0);
	
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

generator2: image_gen_2 port map(
	pixel_clk => clk,
	mode_sel	=> mode_sel,
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
	r2 => r2,
	g2 => g2,
	b2 => b2
	);

generator: image_gen1 port map(
	pixel_clk => clk,
	mode_sel	=> mode_sel,
	reset => reset,
	note_confirm => note_confirm,
	Hcount => Hc,
	Vcount => Vc,
	display_enable => display_enable_int,
	input => output0,
	r1 => r1,
	g1 => g1,
	b1 => b1
	);
	
rout <= r1 when mode_sel = '1' else r2;
gout <= g1 when mode_sel = '1' else g2;
bout <= b1 when mode_sel = '1' else b2;
end behaviour;

