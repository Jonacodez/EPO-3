library ieee;
use ieee.std_logic_1164.all;

entity vga_counter_tb is
end vga_counter_tb;


architecture tb of vga_counter_tb is
	
	component vga_counter is
		port	(	reset			:	in std_logic;
				pixel_clk		:	in std_logic;
				Hsync, Vsync		:	buffer std_logic;
				Hactiveout, Vactiveout	:	out std_logic
			);
	end component vga_counter;

	signal reset, pixel_clk				:std_logic;
	signal Hsync, Vsync, Hactiveout, Vactiveout 	:std_logic;
begin

	
	pixel_clk<='0' after 0 ns,
	'1' after 20 ns when pixel_clk /= '1' else '0' after 20 ns;
	reset <= '0' after 0 ns, '1' after 20 ns, '0' after 50 ns, '1' after 70 ns, '1' after 2000000 ns, '0' after 2000010 ns;
	--'1' after 50 ms, '0' after 20 ns;

lbl1: vga_counter port map(
	reset => reset,
	pixel_clk => pixel_clk,
	Hsync => Hsync,
	Vsync => Vsync,
	Hactiveout => Hactiveout,
	Vactiveout => Vactiveout
	);

end architecture tb;
