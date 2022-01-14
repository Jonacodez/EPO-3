library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behavioural of processor is 

type statetype is (reset, compare, true);
signal state, next_state : statetype;
signal next_score : std_logic_vector(1 downto 0);
signal count, new_count	: std_logic_vector(25 downto 0);
type statetype2 is (reset, compare, true,false,count1,short,medium,long);
signal state2, next_state2 : statetype2;
signal A	: std_logic_vector(1 downto 0);
begin 
process(clk, res) 
begin
	if rising_edge(clk) then
		if (res = '1')  then
			state <= reset;
			state2 <= reset;
		else
			state <= next_state;
			score <= next_score;
			count <= new_count;
			state2 <= next_state2;
		end if;
	end if;
end process; 

process(state, state2, count, notes_OUT,notesA_OUT)
begin
	if mode ='0' then
	case state is
		when reset =>
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= "00";
			if res='1' then
				next_state <= state;
			elsif input_d = '1' then 
				next_state <= compare;
			else
				next_state <= state;
			end if;
		when compare => 
			next_score <= score;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			if input_d = '1' then
				if(notes_OUT = notesA_OUT) then
					next_state <= true;
				else
					next_state <= state;
				end if;
			else
				next_state <= state;
			end if;
		when true =>
			next_score <= std_logic_vector(unsigned(score) + 1);
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			next_state <= compare;
		
		end case;
	else
		case state2 is
			when reset =>
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= "00";
			new_count <= (others => '0');
			if res='1' then
				next_state2 <= reset;
			else 
				next_state2 <= count1;
			end if;
		when count1 => 
			next_score <= score;
			new_count <= std_logic_vector(unsigned(count) + 1);
			if count = "10000101100000111011000000" then
				next_state2 <= compare;
			else
				next_state2 <= count1;
			end if;
		when compare =>
			new_count<= (others => '0');
			next_score <= score;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			if(notes_OUT = notesA_OUT) then
				next_state2 <= true;
				A <= notesA_OUT(1 downto 0);
			elsif (notes_OUT /= notesA_OUT) then
				A <= notesA_OUT(1 downto 0);
				next_state2 <= false;
			else
				next_state2 <= compare;
			end if;
		when true =>
			next_score <= std_logic_vector(unsigned(score) + 1);
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			if A = "01" then
				next_state2 <= short;
			elsif A = "10" then
				next_state2 <= medium;
			elsif A = "11" then
				next_state2 <= long;
			else
				next_state2 <= compare;
			end if;
		when false =>
			next_score <= score;
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			if A = "01" then
				next_state2 <= short;
			elsif A = "10" then
				next_state2 <= medium;
			elsif A = "11" then
				next_state2 <= long;
			else
				next_state2 <= compare;
			end if;
		when short => 
			next_score <= score;
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "00010011000100101101000000" then
				next_state2 <= compare;
			else
				next_state2 <= short;
			end if;
		when medium =>
			next_score <= score;
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "00110101011001111110000000" then
				next_state2 <= compare;
			else
				next_state2 <= medium;
			end if;
		when long =>
			next_score <= score;
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "01100011001011101010000000" then
				next_state2 <= compare;
			else
				next_state2 <= long;
			end if;	
		end case;
	end if;
end process;
end architecture behavioural; 

