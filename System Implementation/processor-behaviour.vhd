library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behavioural of processor is 

type statetype is (reset, compare, true);
signal state, next_state : statetype;
signal next_score : std_logic_vector(1 downto 0);
signal count, new_count	: std_logic_vector(25 downto 0);
type statetype2 is (reset, compare, true,count1,count2);
signal state2, next_state2 : statetype2;
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

process(state, notes_OUT, notesA_OUT, res)
begin
	if mode ='0' then
	case state is
		when reset =>
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			score <= "00";
			if res='1' then
				next_state <= state;
			else next_state <= compare;
			end if;
		when compare => 
			next_score <= score;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			if(notes_OUT = notesA_OUT) then
				next_state <= true;
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
			score <= "00";
			if res='1' then
				next_state2 <= state2;
			else 
				next_state2 <= count1;
			end if;
		when count1 => 
			new_count <= std_logic_vector(unsigned(count) + 1);
			next_state2 <= count2;
		when count2 =>
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
			else
				next_state2 <= state2;
			end if;
		when true =>
			next_score <= std_logic_vector(unsigned(score) + 1);
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			next_state2 <= count1;
		end case;
	end if;
end process;
end architecture behavioural; 

