library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
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
begin
Hcount_int <= to_integer(unsigned(Hcount));
Vcount_int <= to_integer(unsigned(Vcount));

	p0:
	process(output0, pixel_clk, reset) 
	begin
		r <= "00";
		g <= "00";
		b <= "00";
	if (display_enable = '1') then
		if (Vcount_int > note1_top and Vcount_int < note1_bottom) then
			if    (output0(4 downto 2) = "000") then  --C1
				if (Hcount_int > note1_left and Hcount_int < note1_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "001") then  --D
				if (Hcount_int > note2_left and Hcount_int < note2_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
	
			elsif (output0 (4 downto 2) = "010") then  --E
				if (Hcount_int > note3_left and Hcount_int < note3_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "011") then  --F
				if (Hcount_int > note4_left and Hcount_int < note4_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "100") then  --G
				if (Hcount_int > note5_left and Hcount_int < note5_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "101") then  --A
				if (Hcount_int > note6_left and Hcount_int < note6_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "110") then   --B
				if (Hcount_int > note7_left and Hcount_int < note7_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			elsif (output0 (4 downto 2) = "111") then  --C2
				if (Hcount_int > note8_left and Hcount_int < note8_right) then
					r <= "11";
					g <= "01";
					b <= "01";
				else
					r <= "00";
					g <= "00";
					b <= "00";
				end if;
			end if;
		end if;
	end if;
	end process;
		
--	p1:
--	process(output1, pixel_clk, reset) 
--	end process;
--
--	p2:
--	process(output2, pixel_clk, reset)
--	end process; 
--
--	p3:
--	process(output3, pixel_clk, reset)
--	end process; 
--
--	p4:
--	process(output4, pixel_clk, reset) 
--	end process;
--
--	p5:
--	process(output5, pixel_clk, reset) 
--	end process;
--
--	p6:
--	process(output6, pixel_clk, reset) 
--	end process;
--
--	p7:
--	process(output7, pixel_clk, reset) 
--	end process;
end generator;


