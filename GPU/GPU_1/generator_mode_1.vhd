library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.constants_package.all;

entity image_gen_2 is
	port(	pixel_clk, reset								:	in std_logic;
		note_confirm									:	in std_logic;
		Hcount, Vcount									:	in std_logic_vector (9 downto 0);
		display_enable									:	in std_logic;
		input										:	in std_logic_vector(4 downto 0);
		r, g, b										:	out std_logic_vector (1 downto 0)
		);
end image_gen_2;

architecture generator of image_gen_2 is

	signal  Hcount_int, Vcount_int	 	: integer;
	signal r_int, g_int, b_int		: std_logic_vector (50 downto 0):= (others => '0');
	type integer_array is array(0 to 23) of integer;
	signal shift				: integer_array;
	signal init				: std_logic_Vector (23 downto 0):= (others => '0');
	signal shift_speed			: integer := 10;

begin
Hcount_int <= to_integer(unsigned(Hcount));
Vcount_int <= to_integer(unsigned(Vcount));

--	background: --raster
--	process(display_enable,Vcount_int,Hcount_int) 
--	begin
--		r_int(1 downto 0) <= "00";
--		g_int(1 downto 0) <= "00";
--		b_int(1 downto 0) <= "00";
--		if(display_enable = '1') then
--			if(Vcount_int >= v2 and Vcount_int <= v3) then
--				if((Hcount_int >= h2 and Hcount_int <= h2 + 2) or (Hcount_int >= h2 + 79 and Hcount_int <= h2 + 80) or (Hcount_int >= h2 + 159 and Hcount_int <= h2 + 160) or (Hcount_int >= h2 + 239 and Hcount_int <= h2 + 240) or (Hcount_int >= h2 + 319 and Hcount_int <= h2 + 320) or (Hcount_int >= h2 + 399 and Hcount_int <= h2 + 400) or (Hcount_int >= h2 + 479 and Hcount_int <= h2 + 480) or (Hcount_int >= h2 + 559 and Hcount_int <= h2 + 560) or (Hcount_int >= h2 + 639 and Hcount_int <= h2 + 640)) then 
--					r_int(1 downto 0) <= "11";
--					g_int(1 downto 0) <= "11";
--					b_int(1 downto 0) <= "11";
--				end if;
--				if(Vcount_int <= v2 + 427 and Vcount_int >= v2 + 424) then
--					r_int(1 downto 0) <= "00";
--					g_int(1 downto 0) <= "11";
--					b_int(1 downto 0) <= "00";
--				end if;
--			end if;
--		end if;
--	end process;


	notecontrol:
	process(input, note_confirm, pixel_clk)
	begin
	if(reset = '1' and rising_edge(pixel_clk)) then
		init <= (others => '0');
	elsif(input(4 downto 2) = "000" and input(1 downto 0) /= "00" and note_confirm = '1' and rising_edge(pixel_clk)) then --note0
		if(input(1 downto 0) = "01") then
			init(0) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(1) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(2) <= '1';
		end if;
	elsif(input(4 downto 2) = "001" and note_confirm = '1' and rising_edge(pixel_clk)) then
		if(input(1 downto 0) = "01") then
			init(3) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(4) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(5) <= '1';
		end if;
	elsif(input(4 downto 2) = "010" and note_confirm = '1' and rising_edge(pixel_clk)) then
		if(input(1 downto 0) = "01") then
			init(6) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(7) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(8) <= '1';
		end if;
	elsif(input(4 downto 2) = "011" and note_confirm = '1' and rising_edge(pixel_clk)) then
		if(input(1 downto 0) = "01") then
			init(9) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(10) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(11) <= '1';
		end if;
	end if;
	if(shift(0) = 480) then
		init(0) <= '0';
	end if;
	if(shift(1) = 480) then
		init(1) <= '0';
	end if;
	if(shift(2) = 480) then
		init(2) <= '0';
	end if;
	if(shift(3) = 480) then
		init(3) <= '0';
	end if;
	if(shift(4) = 480) then
		init(4) <= '0';
	end if;
	if(shift(5) = 480) then
		init(5) <= '0';
	end if;
	if(shift(6) = 480) then
		init(6) <= '0';
	end if;
	if(shift(7) = 480) then
		init(7) <= '0';
	end if;
	if(shift(8) = 480) then
		init(8) <= '0';
	end if;
	if(shift(9) = 480) then
		init(9) <= '0';
	end if;
	if(shift(10) = 480) then
		init(10) <= '0';
	end if;
	if(shift(11) = 480) then
		init(11) <= '0';
	end if;
	end process;

	note0: 
	process(pixel_clk, reset, Hcount_int, Vcount_int, note_confirm, input)
	begin
	if(reset = '1' and rising_edge(pixel_clk)) then
		shift <= (others => 0);
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(0) = '1' and shift(0) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(0) <= shift(0) + shift_speed;
	elsif(shift(0) > 480) then
		shift(0) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(1) = '1' and shift(1) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(1) <= shift(1) + shift_speed;
	elsif(shift(1) > 480) then
		shift(1) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(2) = '1' and shift(2) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(2) <= shift(2) + shift_speed;
	elsif(shift(2) > 480) then
		shift(2) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(3) = '1' and shift(3) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(3) <= shift(3) + shift_speed;
	elsif(shift(3) > 480) then
		shift(3) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(4) = '1' and shift(4) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(4) <= shift(4) + shift_speed;
	elsif(shift(4) > 480) then
		shift(4) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(5) = '1' and shift(5) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(5) <= shift(5) + shift_speed;
	elsif(shift(5) > 480) then
		shift(5) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(6) = '1' and shift(6) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(6) <= shift(6) + shift_speed;
	elsif(shift(6) > 480) then
		shift(6) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(7) = '1' and shift(7) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(7) <= shift(7) + shift_speed;
	elsif(shift(7) > 480) then
		shift(7) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(8) = '1' and shift(8) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(8) <= shift(8) + shift_speed;
	elsif(shift(8) > 480) then
		shift(8) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(9) = '1' and shift(9) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(9) <= shift(9) + shift_speed;
	elsif(shift(9) > 480) then
		shift(9) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(10) = '1' and shift(10) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(10) <= shift(10) + shift_speed;
	elsif(shift(10) > 480) then
		shift(10) <= 0;
	end if;
	if(Vcount_int = 0 and Hcount_int = 0  and init(11) = '1' and shift(11) /= 480 and reset = '0' and rising_edge(pixel_clk)) then
		shift(11) <= shift(11) + shift_speed;
	elsif(shift(11) > 480) then
		shift(11) <= 0;
	end if;

	if(display_enable = '1' and Hcount_int >= note1_left and Hcount_int <= note1_right) then -- note1	
		if(Vcount_int >= block1_top + shift(0) and Vcount_int <= block1_bottom + shift(0) and init(0) = '1') then
			r_int(3 downto 2) <= "11";
			g_int(3 downto 2) <= "11";
			b_int(3 downto 2) <= "11";
		else
			r_int(3 downto 2) <= "00";
			g_int(3 downto 2) <= "00";
			b_int(3 downto 2) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(1) and Vcount_int <= block2_bottom + shift(1) and init(1) = '1') then
			r_int(5 downto 4) <= "11";
			g_int(5 downto 4) <= "00";
			b_int(5 downto 4) <= "00";
		else
			r_int(5 downto 4) <= "00";
			g_int(5 downto 4) <= "00";
			b_int(5 downto 4) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(2) and Vcount_int <= block3_bottom + shift(2) and init(2) = '1') then
			r_int(7 downto 6) <= "11";
			g_int(7 downto 6) <= "00";
			b_int(7 downto 6) <= "00";
		else
			r_int(7 downto 6) <= "00";
			g_int(7 downto 6) <= "00";
			b_int(7 downto 6) <= "00";
		end if;
	end if;
	if(display_enable = '1' and Hcount_int >= note2_left and Hcount_int <= note2_right) then	
		if(Vcount_int >= block1_top + shift(3) and Vcount_int <= block1_bottom + shift(3) and init(3) = '1') then
			r_int(9 downto 8) <= "11";
			g_int(9 downto 8) <= "11";
			b_int(9 downto 8) <= "11";
		else
			r_int(9 downto 8) <= "00";
			g_int(9 downto 8) <= "00";
			b_int(9 downto 8) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(4) and Vcount_int <= block2_bottom + shift(4) and init(4) = '1') then
			r_int(11 downto 10) <= "11";
			g_int(11 downto 10) <= "00";
			b_int(11 downto 10) <= "00";
		else
			r_int(11 downto 10) <= "00";
			g_int(11 downto 10) <= "00";
			b_int(11 downto 10) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(5) and Vcount_int <= block3_bottom + shift(5) and init(5) = '1') then
			r_int(13 downto 12) <= "11";
			g_int(13 downto 12) <= "00";
			b_int(13 downto 12) <= "00";
		else
			r_int(13 downto 12) <= "00";
			g_int(13 downto 12) <= "00";
			b_int(13 downto 12) <= "00";
		end if;
	end if;
	if(display_enable = '1' and Hcount_int >= note3_left and Hcount_int <= note3_right) then	
		if(Vcount_int >= block1_top + shift(6) and Vcount_int <= block1_bottom + shift(6) and init(6) = '1') then
			r_int(15 downto 14) <= "11";
			g_int(15 downto 14) <= "11";
			b_int(15 downto 14) <= "11";
		else
			r_int(15 downto 14) <= "00";
			g_int(15 downto 14) <= "00";
			b_int(15 downto 14) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(7) and Vcount_int <= block2_bottom + shift(7) and init(7) = '1') then
			r_int(17 downto 16) <= "11";
			g_int(17 downto 16) <= "00";
			b_int(17 downto 16) <= "00";
		else
			r_int(17 downto 16) <= "00";
			g_int(17 downto 16) <= "00";
			b_int(17 downto 16) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(8) and Vcount_int <= block3_bottom + shift(8) and init(8) = '1') then
			r_int(19 downto 18) <= "11";
			g_int(19 downto 18) <= "00";
			b_int(19 downto 18) <= "00";
		else
			r_int(19 downto 18) <= "00";
			g_int(19 downto 18) <= "00";
			b_int(19 downto 18) <= "00";
		end if;
	end if;
	if(display_enable = '1' and Hcount_int >= note4_left and Hcount_int <= note4_right) then	
		if(Vcount_int >= block1_top + shift(9) and Vcount_int <= block1_bottom + shift(9) and init(9) = '1') then
			r_int(21 downto 20) <= "11";
			g_int(21 downto 20) <= "11";
			b_int(21 downto 20) <= "11";
		else
			r_int(21 downto 20) <= "00";
			g_int(21 downto 20) <= "00";
			b_int(21 downto 20) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(10) and Vcount_int <= block2_bottom + shift(10) and init(10) = '1') then
			r_int(23 downto 22) <= "11";
			g_int(23 downto 22) <= "00";
			b_int(23 downto 22) <= "00";
		else
			r_int(23 downto 22) <= "00";
			g_int(23 downto 22) <= "00";
			b_int(23 downto 22) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(11) and Vcount_int <= block3_bottom + shift(11) and init(11) = '1') then
			r_int(25 downto 24) <= "11";
			g_int(25 downto 24) <= "00";
			b_int(25 downto 24) <= "00";
		else
			r_int(25 downto 24) <= "00";
			g_int(25 downto 24) <= "00";
			b_int(25 downto 24) <= "00";
		end if;
	end if;
	end process;

r(1) <= r_int(1) or r_int(3) or r_int(5) or r_int(7) or r_int(9) or r_int(11) or r_int(13) or r_int(15) or r_int(17) or r_int(19) or r_int(21) or r_int(23) or r_int(25);
g(1) <= g_int(1) or g_int(3) or g_int(5) or g_int(7) or g_int(9) or g_int(11) or g_int(13) or g_int(15) or g_int(17) or g_int(19) or g_int(21) or g_int(23) or g_int(25);
b(1) <= b_int(1) or b_int(3) or b_int(5) or b_int(7) or b_int(9) or b_int(11) or b_int(13) or b_int(15) or b_int(17) or b_int(19) or b_int(21) or b_int(23) or b_int(25);

r(0) <= r_int(0) or r_int(2) or r_int(4) or r_int(6) or r_int(8) or r_int(10) or r_int(12) or r_int(14) or r_int(16) or r_int(18) or r_int(20) or r_int(22);
g(0) <= g_int(0) or g_int(2) or g_int(4) or g_int(6) or g_int(8) or g_int(10) or g_int(12) or g_int(14) or g_int(16) or g_int(18) or g_int(20) or g_int(22);
b(0) <= b_int(0) or b_int(2) or b_int(4) or b_int(6) or b_int(8) or b_int(10) or b_int(12) or b_int(14) or b_int(16) or b_int(18) or b_int(20) or b_int(22);

end generator;

