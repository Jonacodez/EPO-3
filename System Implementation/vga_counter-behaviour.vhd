library IEEE;
use IEEE.std_logic_1164.ALL;
use work.constants_package.all;
library work;
use ieee.numeric_std.all;

architecture behaviour of vga_counter is

signal Hcount, Vcount		: std_logic_vector(9 downto 0);
	signal Vsync_int, Hsync_int	:std_logic;
begin
	
	process(pixel_clk, reset)
	begin
	if(reset = '1') then
		Hcount <= "0000000000";
		Vcount <= "0000000000";
	elsif(pixel_clk'event and pixel_clk = '1') then
	
		Hcount <= std_logic_vector(unsigned(Hcount) + 1);
		if(unsigned(Hcount) = h4) then
			Hcount <= "0000000000";
			if(unsigned(Vcount) < 525) then
				Vcount <= std_logic_vector(unsigned(Vcount) + 1);
			else Vcount <= "0000000000";
			end if;

		end if;
	end if;
	end process;
	
	process(Hcount, Vcount) 
	begin
	if(h1 > unsigned(Hcount) and unsigned(Hcount) < h4) then
		Hsync_int <= '0';
	else Hsync_int <= '1';
	end if;
	if(v1 > unsigned(Vcount) and unsigned(Vcount) < v4) then
		Vsync_int <= '0';
	else Vsync_int <= '1';
	end if;
	h_pixel <= Hcount;
	v_pixel <= Vcount;
	end process;
	Vsync <= Vsync_int;
	Hsync <= Hsync_int;
	display_enable <= Hsync_int and Vsync_int;

end behaviour;

