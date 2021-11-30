library ieee;
use ieee.std_logic_1164.all;
library work;
use work.constants_package.all;

entity image_gen is
	port(	pixel_clk, reset	:	in std_logic;
		Hcount, Vcount		:	in integer;
		display_enable		:	in std_logic;
		output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
		r_out, g_out, b_out	: 	out std_logic
		);
end image_gen;

architecture generator of image_gen is

	signal shift_1, shift_2, shift_3, shift_4, shift_5, shift_6, shift_7, shift_8 : integer:=0;
	signal shift_speed	:	integer :=5;
	signal r,g,b : std_logic_vector(7 downto 0);
begin

	--statisch raster maken
--	p0: 
--	process(pixel_clk, display_enable) 
--	begin
--		r <= '0';
--		g <= '0';
--		b <= '0';
--		if(display_enable = '1') then
--			--line 1
-- 			if	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+0 and Vcount <= v2+0+2) or
--			  	(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57 and Vcount <= v2+2+57+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58 and Vcount <= v2+2+57+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58 and Vcount <=  v2+2+57+2+58+2+58+2+58+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2) or
--				(Hcount >= h2+0 and Hcount <= h2+0+640 and Vcount > v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57 and Vcount <= v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57+2)then 
--				r <= '1';
--				g <= '1';
--				b <= '1';
--			elsif (Vcount <=v2+2+57) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 2
--			elsif (Vcount <=v2+2+57+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 3
--			elsif (Vcount <=v2+2+57+2+58+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 4
--			elsif (Vcount <=v2+2+57+2+58+2+58+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 5
--			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 6
--			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 7
--			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 8
--			elsif (Vcount <=v2+2+57+2+58+2+58+2+58+2+58+2+58+2+58+2+57) then
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			--line 9
--			else 
--				r <= '0';
--				g <= '0';
--				b <= '0';
--			end if;
--		end if;
--	end process;
	--output visuals
	p0:
	process(pixel_clk, reset)
	begin
	if(reset = '1') then
		r(0) <= '1';
		g(0) <= '1';
		b(0) <= '1';
	elsif(rising_edge(pixel_clk)) then
		r(0) <= '0';
		g(0) <= '0';
		b(0) <= '0';
		if(display_enable = '1') then
			if(output0 = "00000") then --stop
				r(0) <= '0';
				g(0) <= '0';
				b(0) <= '0';
			end if;
		end if;
	end if;
	end process;

	p1:
	process(pixel_clk, reset)
	begin
	if(rising_edge(pixel_clk)) then
		r(1) <= '0';
		g(1) <= '0';
		b(1) <= '0';
		if(display_enable = '1') then
			if (output1 = "00001") then --note 1
				if (Vcount >= block2_top + shift_1 and Vcount <= block2_bottom + shift_1 and Hcount >= note1_left and Hcount <= note1_right) then
					r(1) <= '0';
					g(1) <= '0';
					b(1) <= '1';
					if(block2_top + shift_1 = 515) then
						shift_1 <= 0;
					end if;
				elsif(Hcount >= note1_left and Hcount <= note1_right) then
					r(1) <= '0';
					g(1) <= '0';
					b(1) <= '0';
				end if;
			elsif (output1 = "00000") then
				r(1) <= '0';
				g(1) <= '0';
				b(1) <= '0';
			end if;
		end if;
		if(Vcount = 30 and Hcount = 2 and output1 = "00001") then
			shift_1 <= shift_1 + shift_speed;
		end if;
	end if;
	end process;


	p2:
	process(pixel_clk, reset)
	begin
	if(rising_edge(pixel_clk)) then
		r(2) <= '0';
		g(2) <= '0';
		b(2) <= '0';
		if(display_enable = '1') then
			if (output2 = "00100") then --note 2
				if (Vcount >= block2_top + shift_2 and Vcount <= block2_bottom + shift_2 and Hcount >= note2_left and Hcount <= note2_right) then
					r(2) <= '1';
					g(2) <= '0';
					b(2) <= '0';
					if(block2_top + shift_2 = 515) then
						shift_2 <= 0;
					end if;
				elsif(Hcount >= note2_left and Hcount <= note2_right) then
					r(2) <= '0';
					g(2) <= '0';
					b(2) <= '0';
				end if;
			elsif (output2 = "00000") then
				r(2) <= '0';
				g(2) <= '0';
				b(2) <= '0';
			end if;
		end if;
		if(Vcount = 30 and Hcount = 2 and output2 = "00100") then
			shift_2 <= shift_2 + shift_speed;
		end if;
	end if;
	end process;

	r_out <= r(0) or r(1) or r(2);
	g_out <= g(0) or g(1) or g(2);
	b_out <= b(0) or b(1) or b(2);
--		p3:
--	process(pixel_clk, reset, data_in)
--	begin
--	if(reset = '1') then
--		r <= '1';
--		g <= '1';
--		b <= '1';
--	elsif(reset = '0') then
--		if(display_enable = '1') then
--			if(data_in = "00000") then --stop
--				r <= '1';
--				g <= '0';
--				b <= '0';
--			elsif (data_in = "00100") then --note 1
--				if (Vcount >= block2_top + shift_2 and Vcount <= block2_bottom + shift_2) then
--					r <= '0';
--					g <= '0';
--					b <= '1';
--				else
--					r <= '0';
--					g <= '0';
--					b <= '0';
--				end if;
--			end if;
--		end if;
--		if(Vcount = 30 and Hcount = 2 and data_in = "00001") then
--			shift_2 <= shift_2 + shift_speed;
--		end if;
--	end if;
--	end process;
--
--	p4:
--	process(pixel_clk, reset, data_in)
--	begin
--	if(reset = '1') then
--		r <= '1';
--		g <= '1';
--		b <= '1';
--	elsif(reset = '0') then
--		if(display_enable = '1') then
--			if(data_in = "00000") then --stop
--				r <= '1';
--				g <= '0';
--				b <= '0';
--			elsif (data_in = "00001") then --note 1
--				if (Vcount >= block2_top + shift_1 and Vcount <= block2_bottom + shift_1) then
--					r <= '0';
--					g <= '0';
--					b <= '1';
--				else
--					r <= '0';
--					g <= '0';
--					b <= '0';
--				end if;
--			end if;
--		end if;
--		if(Vcount = 30 and Hcount = 2 and data_in = "00001") then
--			shift_1 <= shift_1 + shift_speed;
--		end if;
--	end if;
--	end process;

end architecture generator;
