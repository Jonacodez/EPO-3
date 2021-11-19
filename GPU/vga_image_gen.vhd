library ieee;
use ieee.std_logic_1164.all;

entity image_gen is
	port(	pixel_clk		:	in std_logic;
		reset			:	in std_logic;
		Hactive			:	in std_logic;
		Vactive			:	in std_logic;
		r, g, b			:	out std_logic
		);
end image_gen;

architecture generator of image_gen is

	signal dena	:	std_logic;

begin
dena <= Hactive and Vactive;
p3: process(pixel_clk)
begin
	if(dena = '1') then
		r <= '1';
		g <= '0';
		b <= '0';
	end if;
end process;

end architecture generator;
