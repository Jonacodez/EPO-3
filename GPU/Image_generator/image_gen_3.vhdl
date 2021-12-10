library ieee;
use ieee.std_logic_1164.all;

entity image_gen is
	port(	pixel_clk, reset	:	in std_logic;
		display_enable		:	in std_logic;
		r, g, b			:	out std_logic
		);
end image_gen;

architecture generator of image_gen is
begin
process(pixel_clk, reset)
begin
if(reset = '1') then
	r <= '0';
	g <= '0';
	b <= '0';
elsif(display_enable = '1') then
	r <= '1';
	g <= '1';
	b <= '0';
else
	r <= '0';
	g <= '0';
	b <= '0';
end if;
end process;
end architecture generator;
