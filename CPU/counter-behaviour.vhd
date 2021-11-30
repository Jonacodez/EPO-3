library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter is
signal count, new_count : std_logic_vector (23 downto 0);
signal count_s, new_count_s : std_logic_vector (24 downto 0); 
signal d      : 	std_logic_vector (8 downto 0);
signal s      :	 std_logic_vector (1 downto 0);

begin

process (notes_OUT)
begin
	case notes_OUT is
			--stop
		when "00000" => 
			d<= "000000000";
			s<= "00";

			--C1
		when "00001" => 
			d<="010101111";
			s<= "01";
		when "00010" => 
			d<="010101111";
			s<= "10";
		when "00011" => 
			d<="010101111";
			s<= "11";

			--D
		when "00100" => 
			d<="011000101";
			s<= "01";
		when "00101" => 
			d<="011000101";
			s<= "10";
		when "00110" => 
			d<="011000101";
			s<= "11";

			--E
		when "00111" => 
			d<="011011101";
			s<= "01";
		when "01000" => 
			d<="011011101";
			s<= "10";
		when "01001" => 
			d<="011011101";
			s<= "11";

			--F
		when "01010" => 
			d<= "011101010";
			s<= "01";
		when "01011" => 
			d<= "011101010";
			s<= "10";
		when "01100" => 
			d<= "011101010";
			s<= "11";
		
			--G
		when "01101" => 
			d<= "100000111"; 
			s<= "01";
		when "01110" => 
			d<= "100000111"; 
			s<= "10";
		when "01111" => 
			d<= "100000111"; 
			s<= "11";
		
		--A
		when "10000" => 
			d<= "100100111";
			s<= "01";
		when "10001" => 
			d<= "100100111";
			s<= "10";
		when "10010" => 
			d<= "100100111";
			s<= "11";
		
			--B 
		
		when "10011" => 
			d<= "101001011";
			s<= "01";
		when "10100" => 
			d<= "101001011";
			s<= "10";
		when "10101" => 
			d<= "101001011";
			s<= "11";

		--C2
		when "10110" => 
			d<= "101011111";
			s<= "01";
		when "10111" => 
			d<= "101011111";
			s<= "10";
		when "11000" => 
			d<= "101011111";
			s<= "11";


		
		 
		
		
	
		when others => 
			d<="000000000";
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
process (count, enable)
begin
	if (enable = '1') then
		new_count <= std_logic_vector(unsigned(count) + resize(unsigned(d),24));
	else
		new_count <= count;
	end if;
end process;

process (clk)
begin
	if (rising_edge (clk)) then
		if (reset = '1') then
			count_s <= (others => '0');
		else
			count_s <= new_count_s;
		end if;
	end if;
end process;

process (count_s, enable)
begin
	if (enable = '1') then
		new_count_s <= std_logic_vector(unsigned(count) + resize(unsigned(s),25));
	else
		new_count_s <= count_s;
	end if;
end process;

count_out <= count(23);
count_out_s 	 <= (count_s(24) xor s(1)) and (count_s(23) xor s(0)); 
end behaviour;

