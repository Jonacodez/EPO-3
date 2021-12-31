library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of pwm_gen is

signal count, new_count : std_logic_vector (26 downto 0);
signal count_s, new_count_s : std_logic_vector (26 downto 0); 
signal d      : 	std_logic_vector (8 downto 0);
signal count_o : std_logic;
signal rest : std_logic;
signal count_out_s : std_logic;

begin

process (notes_OUT)
begin
	case notes_OUT (4 downto 2) is
			
			--C1
		when "000" => 
			d<="010101111";

			
			--D
		when "001" => 
			d<="011000101";

			--E
		when "010" => 
			d<="011011101";
			--F
		when "011" => 
			d<= "011101010";
	
			--G
		when "100" => 
			d<= "100000111"; 
		
		
		--A
		when "101" => 
			d<= "100100111";
		--B 
		when "110" => 
			d<= "101001011";
	

		--C2
		when "111" => 
			d<= "101011111";

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
process (count, input_s, d)
begin
	if (input_s = '1') then
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

process(count_s, input_s) 
begin 
	if(input_s = '0') then
		count_o <= '0';
		rest<='0';
	elsif ( input_s = '1') then
		count_o <= '1';
		rest<='0';
	else rest<= '1';
			count_o <=  '0';
		
	end if;
end process;

process (count_s, input_s)
begin
	if (input_s = '1') then
		new_count_s <= std_logic_vector(unsigned(count_s)  + 1);

	else
		new_count_s <= count_s;
	end if;
end process;
count_out_s<= count_o;
pwm_out <= count(23) and count_out_s;
end behaviour;
