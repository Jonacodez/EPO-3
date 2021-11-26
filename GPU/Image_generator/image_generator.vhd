library ieee;
use ieee.std_logic_1164.all;
library work;
use work.constants_package.all;

entity image_gen is
	port(	pixel_clk, reset	:	in std_logic;
		Hcount, Vcount		:	in integer;
		display_enable		:	in std_logic;
		data_in			:	in std_logic_vector(4 downto 0);
		r_out, g_out, b_out	: 	in std_logic;
		r, g, b			:	out std_logic
		);
end image_gen;

architecture generator of image_gen is


	signal dena		:	std_logic;    --display enable
	signal state_counter	:	integer :=0;
begin

	--statisch raster maken
	p0: 
	process(pixel_clk, display_enable) 
	begin
		r <= '0';
		g <= '0';
		b <= '0';
		if(display_enable = '1') then
			--line 1
 			if	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+0 and Vcount <= v2+0+2) or
			  	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57 and Vcount <= v2+2+57+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58 and Vcount <= v2+2+57+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58 and Vcount <=  v2+2+57+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2) or
				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57+2)then 
				r <= '1';
				g <= '1';
				b <= '1';
			elsif (Vcount <=v2+2+57) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 2
			elsif (Vcount <=v2+2+57+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 3
			elsif (Vcount <=v2+2+57+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 4
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 5
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 6
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 7
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 8
			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57) then
				r <= '0';
				g <= '0';
				b <= '0';
			--line 9
			else 
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		end if;
	end process;

	--output visuals
	p1:
	process(pixel_clk, data_in)
	begin
		if (data_in = "000--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note1_right and Vcount <= note1_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p2:
	process(pixel_clk, data_in)
	begin
		if (data_in = "001--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note2_right and Vcount <= note2_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p3:
	process(pixel_clk, data_in)
	begin
		if (data_in = "010--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note3_right and Vcount <= note3_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p4:
	process(pixel_clk, data_in) 
	begin
		if (data_in = "011--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note4_right and Vcount <= note4_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p5:
	process(pixel_clk, data_in) 
	begin
		if (data_in = "100--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note5_right and Vcount <= note5_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p6:
	process(pixel_clk, data_in) 
	begin
		if (data_in = "101--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note6_right and Vcount <= note6_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p7:
	process(pixel_clk, data_in)
	begin
		if (data_in = "110--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note7_right and Vcount <= note7_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
	p8:
	process(pixel_clk, data_in)
	begin
		if (data_in = "111--") then
			if (Hcount >= block2_top and Hcount <= block2_bottom and Vcount > note8_right and Vcount <= note8_left) then
				r <= '0';
				g <= '0';
				b <= '1';
			else
				r <= '0';
				g <= '0';
				b <= '0';
			end if;
		else
			r <= '0';
			g <= '0';
			b <= '0';
		end if;
	end process;
end architecture generator;
