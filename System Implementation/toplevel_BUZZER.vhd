library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity pwm_gen is
   port(clk        : in  std_logic;
        reset      : in  std_logic;
        succes_bit : in  std_logic;
        notes_OUT  : in  std_logic_vector(4 downto 0);
        count_out  : out std_logic);
end pwm_gen;

architecture behaviour of pwm_gen is
signal count, new_count : std_logic_vector (23 downto 0);
signal count_s, new_count_s : std_logic_vector (26 downto 0); 
signal d      : 	std_logic_vector (8 downto 0);
signal s_1, s_2  :	 std_logic_vector (26 downto 0);
signal count_o : std_logic;
signal rest : std_logic;
signal count_out_s : std_logic;
begin

process (notes_OUT)
begin
	case notes_OUT is
			--stop
		when "00000" => 
			d<= "000000000";
			s_1<= "000000000000000000000000000";
			s_2<= "000000000000000000000000000";
			--C1
		when "00001" => 
			d<="010101111";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s

		when "00010" => 
			d<="010101111";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "00011" => 
			d<="010101111";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s
			
			--D
		when "00100" => 
			d<="011000101";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "00101" => 
			d<="011000101";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "00110" => 
			d<="011000101";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s

			--E
		when "00111" => 
			d<="011011101";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "01000" => 
			d<="011011101";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "01001" => 
			d<="011011101";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s
			--F
		when "01010" => 
			d<= "011101010";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "01011" => 
			d<= "011101010";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "01100" => 
			d<= "011101010";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s
		
			--G
		when "01101" => 
			d<= "100000111"; 
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "01110" => 
			d<= "100000111"; 
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "01111" => 
			d<= "100000111"; 
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s
		
		--A
		when "10000" => 
			d<= "100100111";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "10001" => 
			d<= "100100111";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "10010" => 
			d<= "100100111";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s
		
			--B 
		
		when "10011" => 
			d<= "101001011";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "10100" => 
			d<= "101001011";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "10101" => 
			d<= "101001011";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s

		--C2
		when "10110" => 
			d<= "101011111";
			s_1<="000101111101011110000100000";--0.5s
			s_2<="001011111010111100001000000";--1s
		when "10111" => 
			d<= "101011111";
			s_1<="001011111010111100001000000";--1s
			s_2<="010111110101111000010000000";--2
		when "11000" => 
			d<= "101011111";
			s_1<="001011111010111100001000000";--1s
			s_2<="100011110000110100011000000";--3s


		
		when others => 
			d<="000000000";
			s_1<= "000000000000000000000000000";
			s_2<= "000000000000000000000000000";
			end case;
	end process;

process (clk)
begin
	if (rising_edge (clk)) then
		if (reset = '1') then
			count <= (others => '0');
		else
			count <= new_count;
		end if;
	end if;
end process;
process (count, succes_bit, d)
begin
	if (succes_bit = '1') then
		new_count <= std_logic_vector(unsigned(count) + resize(unsigned(d),24));
	else
		new_count <= count;
	end if;
end process;


process (clk)
begin
	if (rising_edge (clk)) then
		if (reset = '1' or rest = '1') then
			count_s <= (others => '0');
		else
			count_s <= new_count_s;
		end if;
	end if;
end process;

process(count_s, s_1, s_2) 
begin 
	if(count_s < s_1) then
		count_o <= '0';
		rest<='0';
	elsif ( count_s >= s_1 and count_s < s_2) then
		count_o <= '1';
		rest<='0';
	else rest<= '1';
			count_o <=  '0';
		
	end if;
end process;

process (count_s, succes_bit)
begin
	if (succes_bit = '1') then
		new_count_s <= std_logic_vector(unsigned(count_s)  + 1);
--resize(unsigned(s),25));
	else
		new_count_s <= count_s;
	end if;
end process;
count_out_s<= count_o;
count_out <= count(23) and count_out_s;
--(count_s(24) xor count_s(23));
--count_out_s <= count_s(24) xor count_s(23);

end behaviour;
