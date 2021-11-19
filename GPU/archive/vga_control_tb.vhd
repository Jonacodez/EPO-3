library ieee;
use ieee.std_logic_1164.all;

entity vga_monitor_tb is
end vga_monitor_tb;

architecture tb of vga_monitor_tb is
	
	component vga_monitor is
		port(	clk			: 	in std_logic;
			reset			: 	in std_logic;
			Vsync, Hsync		: 	buffer std_logic;
			r, g, b			: 	out std_logic;
			nblanck, nsync		:	out std_logic;
			--test
			pixel_clk_out		: 	out std_logic;
			Vcounto, Hcounto	: 	out integer;
			Vactiveo, Hactiveo	:	out std_logic;
			denao			:	out std_logic
			);
	end component vga_monitor;


	signal clk, reset			: std_logic;
	signal Hsync, Vsync			: std_logic;
	signal r, g, b				: std_logic;
	signal nblanck, nsync			: std_logic;
	--testing
	signal pixel_clk_out			: std_logic;
	signal Vcounto, Hcounto			: integer;
	signal Vactiveo, Hactiveo		: std_logic;
	signal denao				: std_logic;

begin

	clk<='0' after 0 ns,
	'1' after 20 ns when clk /= '1' else '0' after 20 ns;
		

lbl0:	vga_monitor	port map(

	clk => clk,
	reset => reset,
	Hsync => Hsync, 
	Vsync => Vsync, 
	r => r, 
	g => g, 
	b => b, 
	nblanck => nblanck, 
	nsync => nsync,
	--testing
	pixel_clk_out => pixel_clk_out,
	Vcounto => Vcounto,
	Hcounto => Hcounto,
	Vactiveo => Vactiveo,
	Hactiveo => Hactiveo,
	denao => denao
	);

end architecture tb;
