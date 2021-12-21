library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.constants_package.all;

entity image_gen_2 is
	port(	pixel_clk, reset								:	in std_logic;
		Hcount, Vcount									:	in std_logic_vector (9 downto 0);
		display_enable									:	in std_logic;
		output0, output1, output2, output3, output4, output5, output6, output7		:	in std_logic_vector(4 downto 0);
		r, g, b										:	out std_logic_vector (1 downto 0)
		);
end image_gen_2;

architecture generator of image_gen_2 is

	signal  Hcount_int, Vcount_int	 	: integer;
	signal r_int, g_int, b_int		: std_logic_vector (18 downto 0);
begin
Hcount_int <= to_integer(unsigned(Hcount));
Vcount_int <= to_integer(unsigned(Vcount));

	background: --raster
	process(display_enable,Vcount_int,Hcount_int) 
	begin
		r_int(1 downto 0) <= "00";
		g_int(1 downto 0) <= "00";
		b_int(1 downto 0) <= "00";
		if(display_enable = '1') then
			if(Vcount_int >= v2 and Vcount_int <= v3) then
				if	((Hcount_int >= h2 and Hcount_int <= h2 + 2) or (Hcount_int >= h2 + 79 and Hcount_int <= h2 + 80) or (Hcount_int >= h2 + 159 and Hcount_int <= h2 + 160) or (Hcount_int >= h2 + 239 and Hcount_int <= h2 + 240) or (Hcount_int >= h2 + 319 and Hcount_int <= h2 + 320) or (Hcount_int >= h2 + 399 and Hcount_int <= h2 + 400) or (Hcount_int >= h2 + 479 and Hcount_int <= h2 + 480) or (Hcount_int >= h2 + 559 and Hcount_int <= h2 + 560) or (Hcount_int >= h2 + 639 and Hcount_int <= h2 + 640)) then 
					r_int(1 downto 0) <= "11";
					g_int(1 downto 0) <= "11";
					b_int(1 downto 0) <= "11";
				end if;
				if(Vcount_int <= v2 + 427 and Vcount_int >= v2 + 424) then
					r_int(1 downto 0) <= "00";
					g_int(1 downto 0) <= "11";
					b_int(1 downto 0) <= "00";
				end if;
			end if;
		end if;
	end process;

	p1:
	process(output0, pixel_clk, reset) 
	begin
		r_int(3 downto 2) <= "00";
		g_int(3 downto 2) <= "00";
		b_int(3 downto 2) <= "00";
	if (display_enable = '1') then
		if (output0 (1 downto 0) = "01") then --short
			if (Vcount_int > note1_top1 and Vcount_int < note1_bottom) then
				if    (output0 (4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				end if;
			end if;
		elsif (output0 (1 downto 0) = "10") then --mid
			if (Vcount_int > note1_top2 and Vcount_int < note1_bottom) then
				if    (output0 (4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
		
				elsif (output0 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				end if;
			end if;
		elsif (output0 (1 downto 0) = "11") then --long
			if (Vcount_int > note1_top3 and Vcount_int < note1_bottom) then
				if    (output0 (4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
		
				elsif (output0 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				elsif (output0 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(3 downto 2) <= "11";
						g_int(3 downto 2) <= "01";
						b_int(3 downto 2) <= "01";
					else
						r_int(3 downto 2) <= "00";
						g_int(3 downto 2) <= "00";
						b_int(3 downto 2) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;
		
	p2:
	process(output1, pixel_clk, reset) 
	begin
		r_int(5 downto 4) <= "00";
		g_int(5 downto 4) <= "00";
		b_int(5 downto 4) <= "00";
	if (display_enable = '1') then
		if (output1 (1 downto 0) = "01") then --short
			if (Vcount_int > note2_top1 and Vcount_int < note2_bottom) then
				if    (output1(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				end if;
			end if;
		elsif (output1 (1 downto 0) = "10") then --mid
			if (Vcount_int > note2_top2 and Vcount_int < note2_bottom) then
				if    (output1(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				end if;
			end if;
		elsif (output1 (1 downto 0) = "11") then --long
			if (Vcount_int > note2_top3 and Vcount_int < note2_bottom) then
				if    (output1(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				elsif (output1 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(5 downto 4) <= "11";
						g_int(5 downto 4) <= "01";
						b_int(5 downto 4) <= "01";
					else
						r_int(5 downto 4) <= "00";
						g_int(5 downto 4) <= "00";
						b_int(5 downto 4) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;
	p3:
	process(output2, pixel_clk, reset)
	begin
		r_int(7 downto 6) <= "00";
		g_int(7 downto 6) <= "00";
		b_int(7 downto 6) <= "00";
	if (display_enable = '1') then
		if (output2 (1 downto 0) = "01") then --short
			if (Vcount_int > note3_top1 and Vcount_int < note3_bottom) then
				if    (output2(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				end if;
			end if;
		elsif (output2 (1 downto 0) = "10") then --mid
			if (Vcount_int > note3_top2 and Vcount_int < note3_bottom) then
				if    (output2(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				end if;
			end if;
		elsif (output2 (1 downto 0) = "11") then
			if (Vcount_int > note3_top3 and Vcount_int < note3_bottom) then
				if    (output2(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				elsif (output2 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(7 downto 6) <= "11";
						g_int(7 downto 6) <= "01";
						b_int(7 downto 6) <= "01";
					else
						r_int(7 downto 6) <= "00";
						g_int(7 downto 6) <= "00";
						b_int(7 downto 6) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process; 


	p4:
	process(output3, pixel_clk, reset)
	begin
		r_int(9 downto 8) <= "00";
		g_int(9 downto 8) <= "00";
		b_int(9 downto 8) <= "00";
	if (display_enable = '1') then
		if (output3 (1 downto 0) = "01") then --short
			if (Vcount_int > note4_top1 and Vcount_int < note4_bottom) then
				if    (output3(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				end if;
			end if;
		elsif (output3 (1 downto 0) = "10") then --mid
			if (Vcount_int > note4_top2 and Vcount_int < note4_bottom) then
				if    (output3(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				end if;
			end if;
		elsif (output3 (1 downto 0) = "11") then --long
			if (Vcount_int > note4_top3 and Vcount_int < note4_bottom) then
				if    (output3(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				elsif (output3 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(9 downto 8) <= "11";
						g_int(9 downto 8) <= "01";
						b_int(9 downto 8) <= "01";
					else
						r_int(9 downto 8) <= "00";
						g_int(9 downto 8) <= "00";
						b_int(9 downto 8) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;

	p5:
	process(output4, pixel_clk, reset) 
	begin
		r_int(11 downto 10) <= "00";
		g_int(11 downto 10) <= "00";
		b_int(11 downto 10) <= "00";
	if (display_enable = '1') then
		if (output4 (1 downto 0) = "01") then
			if (Vcount_int > note5_top1 and Vcount_int < note5_bottom) then
				if    (output4(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				end if;
			end if;
		elsif (output4 (1 downto 0) = "10") then --mid
			if (Vcount_int > note5_top2 and Vcount_int < note5_bottom) then
				if    (output4(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				end if;
			end if;
		elsif (output4 (1 downto 0) = "11") then --long
			if (Vcount_int > note5_top3 and Vcount_int < note5_bottom) then
				if    (output4(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				elsif (output4 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(11 downto 10) <= "11";
						g_int(11 downto 10) <= "01";
						b_int(11 downto 10) <= "01";
					else
						r_int(11 downto 10) <= "00";
						g_int(11 downto 10) <= "00";
						b_int(11 downto 10) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;

	p6:
	process(output5, pixel_clk, reset) 
	begin
		r_int(13 downto 12) <= "00";
		g_int(13 downto 12) <= "00";
		b_int(13 downto 12) <= "00";
	if (display_enable = '1') then
		if (output5 (1 downto 0) = "01") then --short 
			if (Vcount_int > note6_top1 and Vcount_int < note6_bottom) then
				if    (output5(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				end if;
			end if;
		elsif (output5 (1 downto 0) = "10") then --mid
			if (Vcount_int > note6_top2 and Vcount_int < note6_bottom) then
				if    (output5(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				end if;
			end if;
		elsif (output5 (1 downto 0) = "11") then --long
			if (Vcount_int > note6_top3 and Vcount_int < note6_bottom) then
				if    (output5(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				elsif (output5 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(13 downto 12) <= "11";
						g_int(13 downto 12) <= "01";
						b_int(13 downto 12) <= "01";
					else
						r_int(13 downto 12) <= "00";
						g_int(13 downto 12) <= "00";
						b_int(13 downto 12) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;

	p7:
	process(output6, pixel_clk, reset) 
	begin
		r_int(15 downto 14) <= "00";
		g_int(15 downto 14) <= "00";
		b_int(15 downto 14) <= "00";
	if (display_enable = '1') then
		if (output6 (1 downto 0) = "01") then --short
			if (Vcount_int > note7_top1 and Vcount_int < note7_bottom) then
				if    (output6(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				end if;
			end if;
		elsif (output6 (1 downto 0) = "10") then --mid
			if (Vcount_int > note7_top2 and Vcount_int < note7_bottom) then
				if    (output6(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				end if;
			end if;
		elsif (output6 (1 downto 0) = "11") then --long
			if (Vcount_int > note7_top3 and Vcount_int < note7_bottom) then
				if    (output6(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				elsif (output6 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(15 downto 14) <= "11";
						g_int(15 downto 14) <= "01";
						b_int(15 downto 14) <= "01";
					else
						r_int(15 downto 14) <= "00";
						g_int(15 downto 14) <= "00";
						b_int(15 downto 14) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;

	p8:
	process(output7, pixel_clk, reset) 
	begin
		r_int(17 downto 16) <= "00";
		g_int(17 downto 16) <= "00";
		b_int(17 downto 16) <= "00";
	if (display_enable = '1') then
		if (output7 (1 downto 0) = "01") then --short
			if (Vcount_int > note8_top1 and Vcount_int < note8_bottom) then
				if    (output7(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				end if;
			end if;
		elsif (output7 (1 downto 0) = "10") then --mid
			if (Vcount_int > note8_top2 and Vcount_int < note8_bottom) then
				if    (output7(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(17 downto 16) <= "01";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "11";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				end if;
			end if;
		elsif (output7 (1 downto 0) = "11") then --long
			if (Vcount_int > note8_top3 and Vcount_int < note8_bottom) then
				if    (output7(4 downto 2) = "000") then  --C1
					if (Hcount_int >= note1_left and Hcount_int < note1_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "001") then  --D
					if (Hcount_int >= note2_left and Hcount_int < note2_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "010") then  --E
					if (Hcount_int > note3_left and Hcount_int < note3_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "011") then  --F
					if (Hcount_int > note4_left and Hcount_int < note4_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "100") then  --G
					if (Hcount_int > note5_left and Hcount_int < note5_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "101") then  --A
					if (Hcount_int > note6_left and Hcount_int < note6_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "110") then   --B
					if (Hcount_int > note7_left and Hcount_int < note7_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				elsif (output7 (4 downto 2) = "111") then  --C2
					if (Hcount_int > note8_left and Hcount_int < note8_right) then
						r_int(17 downto 16) <= "11";
						g_int(17 downto 16) <= "01";
						b_int(17 downto 16) <= "01";
					else
						r_int(17 downto 16) <= "00";
						g_int(17 downto 16) <= "00";
						b_int(17 downto 16) <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
	end process;
r(1) <= r_int(1) or r_int(3) or r_int(5) or r_int(7) or r_int(9) or r_int(11) or r_int(13) or r_int(15) or r_int(17);
g(1) <= g_int(1) or g_int(3) or g_int(5) or g_int(7) or g_int(9) or g_int(11) or g_int(13) or g_int(15) or g_int(17);
b(1) <= b_int(1) or b_int(3) or b_int(5) or b_int(7) or b_int(9) or b_int(11) or b_int(13) or b_int(15) or b_int(17);

r(0) <= r_int(0) or r_int(2) or r_int(4) or r_int(6) or r_int(8) or r_int(10) or r_int(12) or r_int(14) or r_int(16);
g(0) <= g_int(0) or g_int(2) or g_int(4) or g_int(6) or g_int(8) or g_int(10) or g_int(12) or g_int(14) or g_int(16);
b(0) <= b_int(0) or b_int(2) or b_int(4) or b_int(6) or b_int(8) or b_int(10) or b_int(12) or b_int(14) or b_int(16);

end generator;


