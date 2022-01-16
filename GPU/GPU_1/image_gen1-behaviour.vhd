library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.constants_package.all;

architecture behaviour of image_gen1 is

	signal  Hcount_int, Vcount_int	 	: integer;
	signal r_int, g_int, b_int		: std_logic_vector (50 downto 0):= (others => '0');
	type integer_array is array(0 to 23) of integer;
	signal shift				: integer_array;
	signal init				: std_logic_Vector (23 downto 0):= (others => '0');
	signal shift_speed			: integer;

begin
Hcount_int <= to_integer(unsigned(Hcount));
Vcount_int <= to_integer(unsigned(Vcount));
shift_speed <= 10;

	

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



	notecontrol:
	process(input,reset, shift, note_confirm, pixel_clk)
	begin
	if(reset = '1' and rising_edge(pixel_clk)) then --reset
		init <= (others => '0');
	elsif(input(4 downto 2) = "000" and input(1 downto 0) /= "00" and note_confirm = '1' and rising_edge(pixel_clk)) then --note0
		if(input(1 downto 0) = "01") then
			init(0) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(1) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(2) <= '1';
		end if;
	elsif(input(4 downto 2) = "001" and note_confirm = '1' and rising_edge(pixel_clk)) then --note1
		if(input(1 downto 0) = "01") then
			init(3) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(4) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(5) <= '1';
		end if;
	elsif(input(4 downto 2) = "010" and note_confirm = '1' and rising_edge(pixel_clk)) then --note2
		if(input(1 downto 0) = "01") then
			init(6) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(7) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(8) <= '1';
		end if;
	elsif(input(4 downto 2) = "011" and note_confirm = '1' and rising_edge(pixel_clk)) then --note3
		if(input(1 downto 0) = "01") then
			init(9) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(10) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(11) <= '1';
		end if;
	elsif(input(4 downto 2) = "100" and note_confirm = '1' and rising_edge(pixel_clk)) then --note4
		if(input(1 downto 0) = "01") then
			init(12) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(13) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(14) <= '1';
		end if;
	elsif(input(4 downto 2) = "101" and note_confirm = '1' and rising_edge(pixel_clk)) then --note5
		if(input(1 downto 0) = "01") then
			init(15) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(16) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(17) <= '1';
		end if;
	elsif(input(4 downto 2) = "110" and note_confirm = '1' and rising_edge(pixel_clk)) then --note6
		if(input(1 downto 0) = "01") then
			init(18) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(19) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(20) <= '1';
		end if;
	elsif(input(4 downto 2) = "111" and note_confirm = '1' and rising_edge(pixel_clk)) then --note7
		if(input(1 downto 0) = "01") then
			init(21) <= '1';
		elsif(input(1 downto 0) = "10") then
			init(22) <= '1';
		elsif(input(1 downto 0) = "11") then
			init(23) <= '1';
		end if;
	end if;
	if(shift(0) = 480) then --init 1 block
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
	if(shift(12) = 480) then
		init(12) <= '0';
	end if;
	if(shift(13) = 480) then
		init(13) <= '0';
	end if;
	if(shift(14) = 480) then
		init(14) <= '0';
	end if;
	if(shift(15) = 480) then
		init(15) <= '0';
	end if;
	if(shift(16) = 480) then
		init(16) <= '0';
	end if;
	if(shift(17) = 480) then
		init(17) <= '0';
	end if;
	if(shift(18) = 480) then
		init(18) <= '0';
	end if;
	if(shift(19) = 480) then
		init(19) <= '0';
	end if;
	if(shift(20) = 480) then
		init(20) <= '0';
	end if;
	if(shift(21) = 480) then
		init(21) <= '0';
	end if;
	if(shift(22) = 480) then
		init(22) <= '0';
	end if;
	if(shift(23) = 480) then
		init(23) <= '0';
	end if;
	end process;

	note0: 
	process(pixel_clk, reset, r_int, g_int, b_int, shift, Vcount_int, Hcount_int,init,display_enable)
	begin

   r_int(48 downto 2) <= r_int(48 downto 2);
   g_int(48 downto 2) <= g_int(48 downto 2);
   b_int(48 downto 2) <= b_int(48 downto 2);
	shift <= shift;
	if(reset = '1') then --reset
		shift <= (others => 0);
	elsif(rising_edge(pixel_clk) and reset = '0') then
		for i in 0 to 23 loop
			if(Vcount_int = 0 and Hcount_int = 0  and init(i) = '1' and shift(i) /= 480) then
				shift(i) <= shift(i) + shift_speed;
			elsif(init(i) = '0') then
				shift(i) <= 0;
			end if;
		end loop;
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
	else
		r_int(7 downto 2) <= (others => '0');
		g_int(7 downto 2) <= (others => '0');
		b_int(7 downto 2) <= (others => '0');
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
	else
		r_int(13 downto 8) <= (others => '0');
		g_int(13 downto 8) <= (others => '0');
		b_int(13 downto 8) <= (others => '0');
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
	else
		r_int(19 downto 14) <= (others => '0');
		g_int(19 downto 14) <= (others => '0');
		b_int(19 downto 14) <= (others => '0');
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
	else
		r_int(25 downto 20) <= (others => '0');
		g_int(25 downto 20) <= (others => '0');
		b_int(25 downto 20) <= (others => '0');
	end if;
	if(display_enable = '1' and Hcount_int >= note5_left and Hcount_int <= note5_right) then -- note1	
		if(Vcount_int >= block1_top + shift(12) and Vcount_int <= block1_bottom + shift(12) and init(12) = '1') then
			r_int(27 downto 26) <= "11";
			g_int(27 downto 26) <= "11";
			b_int(27 downto 26) <= "11";
		else
			r_int(27 downto 26) <= "00";
			g_int(27 downto 26) <= "00";
			b_int(27 downto 26) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(13) and Vcount_int <= block2_bottom + shift(13) and init(13) = '1') then
			r_int(29 downto 28) <= "11";
			g_int(29 downto 28) <= "00";
			b_int(29 downto 28) <= "00";
		else
			r_int(29 downto 28) <= "00";
			g_int(29 downto 28) <= "00";
			b_int(29 downto 28) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(14) and Vcount_int <= block3_bottom + shift(14) and init(14) = '1') then
			r_int(31 downto 30) <= "11";
			g_int(31 downto 30) <= "00";
			b_int(31 downto 30) <= "00";
		else
			r_int(31 downto 30) <= "00";
			g_int(31 downto 30) <= "00";
			b_int(31 downto 30) <= "00";
		end if;
	else
		r_int(31 downto 26) <= (others => '0');
		g_int(31 downto 26) <= (others => '0');
		b_int(31 downto 26) <= (others => '0');
	end if;
	if(display_enable = '1' and Hcount_int >= note6_left and Hcount_int <= note6_right) then	
		if(Vcount_int >= block1_top + shift(15) and Vcount_int <= block1_bottom + shift(15) and init(15) = '1') then
			r_int(33 downto 32) <= "11";
			g_int(33 downto 32) <= "11";
			b_int(33 downto 32) <= "11";
		else
			r_int(33 downto 32) <= "00";
			g_int(33 downto 32) <= "00";
			b_int(33 downto 32) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(16) and Vcount_int <= block2_bottom + shift(16) and init(16) = '1') then
			r_int(35 downto 34) <= "11";
			g_int(35 downto 34) <= "00";
			b_int(35 downto 34) <= "00";
		else
			r_int(35 downto 34) <= "00";
			g_int(35 downto 34) <= "00";
			b_int(35 downto 34) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(17) and Vcount_int <= block3_bottom + shift(17) and init(17) = '1') then
			r_int(37 downto 36) <= "11";
			g_int(37 downto 36) <= "00";
			b_int(37 downto 36) <= "00";
		else
			r_int(37 downto 36) <= "00";
			g_int(37 downto 36) <= "00";
			b_int(37 downto 36) <= "00";
		end if;
	else
		r_int(37 downto 32) <= (others => '0');
		g_int(37 downto 32) <= (others => '0');
		b_int(37 downto 32) <= (others => '0');
	end if;
	if(display_enable = '1' and Hcount_int >= note7_left and Hcount_int <= note7_right) then	
		if(Vcount_int >= block1_top + shift(18) and Vcount_int <= block1_bottom + shift(18) and init(18) = '1') then
			r_int(39 downto 38) <= "11";
			g_int(39 downto 38) <= "11";
			b_int(39 downto 38) <= "11";
		else
			r_int(39 downto 38) <= "00";
			g_int(39 downto 38) <= "00";
			b_int(39 downto 38) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(19) and Vcount_int <= block2_bottom + shift(19) and init(19) = '1') then
			r_int(41 downto 40) <= "11";
			g_int(41 downto 40) <= "00";
			b_int(41 downto 40) <= "00";
		else
			r_int(41 downto 40) <= "00";
			g_int(41 downto 40) <= "00";
			b_int(41 downto 40) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(20) and Vcount_int <= block3_bottom + shift(20) and init(20) = '1') then
			r_int(43 downto 42) <= "11";
			g_int(43 downto 42) <= "00";
			b_int(43 downto 42) <= "00";
		else
			r_int(43 downto 42) <= "00";
			g_int(43 downto 42) <= "00";
			b_int(43 downto 42) <= "00";
		end if;
	else
		r_int(43 downto 38) <= (others => '0');
		g_int(43 downto 38) <= (others => '0');
		b_int(43 downto 38) <= (others => '0');
	end if;
	if(display_enable = '1' and Hcount_int >= note8_left and Hcount_int <= note8_right) then	
		if(Vcount_int >= block1_top + shift(21) and Vcount_int <= block1_bottom + shift(21) and init(21) = '1') then
			r_int(45 downto 44) <= "11";
			g_int(45 downto 44) <= "11";
			b_int(45 downto 44) <= "11";
		else
			r_int(45 downto 44) <= "00";
			g_int(45 downto 44) <= "00";
			b_int(45 downto 44) <= "00";
		end if;
		if(Vcount_int >= block2_top + shift(22) and Vcount_int <= block2_bottom + shift(22) and init(22) = '1') then
			r_int(47 downto 46) <= "11";
			g_int(47 downto 46) <= "00";
			b_int(47 downto 46) <= "00";
		else
			r_int(47 downto 46) <= "00";
			g_int(47 downto 46) <= "00";
			b_int(47 downto 46) <= "00";
		end if;
		if(Vcount_int >= block3_top + shift(23) and Vcount_int <= block3_bottom + shift(23) and init(23) = '1') then
			r_int(49 downto 48) <= "11";
			g_int(49 downto 48) <= "00";
			b_int(49 downto 48) <= "00";
		else
			r_int(49 downto 48) <= "00";
			g_int(49 downto 48) <= "00";
			b_int(49 downto 48) <= "00";
		end if;
	else
		r_int(49 downto 44) <= (others => '0');
		g_int(49 downto 44) <= (others => '0');
		b_int(49 downto 44) <= (others => '0');
	end if;
	end process;
	r1(1) <= r_int(1) or r_int(3) or r_int(5) or r_int(7) or r_int(9) or r_int(11) or r_int(13) or r_int(15) or r_int(17) or r_int(19) or r_int(21) or r_int(23) or r_int(25) or r_int(27) or r_int(29) or r_int(31) or r_int(33) or r_int(35) or r_int(37) or r_int(39) or r_int(41) or r_int(43) or r_int(45) or r_int(47) or r_int(49);
	g1(1) <= g_int(1) or g_int(3) or g_int(5) or g_int(7) or g_int(9) or g_int(11) or g_int(13) or g_int(15) or g_int(17) or g_int(19) or g_int(21) or g_int(23) or g_int(25) or g_int(27) or g_int(29) or g_int(31) or g_int(33) or g_int(35) or g_int(37) or g_int(39) or g_int(41) or g_int(43) or g_int(45) or g_int(47) or g_int(49);
	b1(1) <= b_int(1) or b_int(3) or b_int(5) or b_int(7) or b_int(9) or b_int(11) or b_int(13) or b_int(15) or b_int(17) or b_int(19) or b_int(21) or b_int(23) or b_int(25) or b_int(27) or b_int(29) or b_int(31) or b_int(33) or b_int(35) or b_int(37) or b_int(39) or b_int(41) or b_int(43) or b_int(45) or b_int(47) or b_int(49);

	r1(0) <= r_int(0) or r_int(2) or r_int(4) or r_int(6) or r_int(8) or r_int(10) or r_int(12) or r_int(14) or r_int(16) or r_int(18) or r_int(20) or r_int(22) or r_int(24) or r_int(26) or r_int(28) or r_int(30) or r_int(32) or r_int(34) or r_int(36) or r_int(38) or r_int(40) or r_int(42) or r_int(44) or r_int(46) or r_int(48);
	g1(0) <= g_int(0) or g_int(2) or g_int(4) or g_int(6) or g_int(8) or g_int(10) or g_int(12) or g_int(14) or g_int(16) or g_int(18) or g_int(20) or g_int(22) or g_int(24) or g_int(26) or g_int(28) or g_int(30) or g_int(32) or g_int(34) or g_int(36) or g_int(38) or g_int(40) or g_int(42) or g_int(44) or g_int(46) or g_int(48);
	b1(0) <= b_int(0) or b_int(2) or b_int(4) or b_int(6) or b_int(8) or b_int(10) or b_int(12) or b_int(14) or b_int(16) or b_int(18) or b_int(20) or b_int(22) or b_int(24) or b_int(26) or b_int(28) or b_int(30) or b_int(32) or b_int(34) or b_int(36) or b_int(38) or b_int(40) or b_int(42) or b_int(44) or b_int(46) or b_int(48);
end behaviour;

