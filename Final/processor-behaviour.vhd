library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behavioural of processor is 

type statetype is (reset, compare, true,wate);
signal state, next_state : statetype;
signal next_score, score1 : std_logic_vector(5 downto 0);
signal count, new_count	: std_logic_vector(25 downto 0);
type statetype2 is (reset, compare, true,false,count1,short,medium,long,wait1,wait2,duration,rest);
signal state2, next_state2 : statetype2;
signal a	: std_logic_vector(1 downto 0);
begin 
process(clk, res) 
begin
	if rising_edge(clk) then
		if (res = '1')  then
			score1 <= "000000";
			state <= reset;
			state2 <= reset;
		else
			state <= next_state;
			score1 <= next_score;
			count <= new_count;
			state2 <= next_state2;
		end if;
	end if;
end process; 

process(state, res, state2, count, notes_OUT,notesA_OUT, regA_out, score1, a, mode)
begin
	if mode ='0' then
	case state is
		when reset =>
			next_state2 <= state2;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= "000000";
			new_count <= (others =>'0');
			if res='1' then
				next_state <= state;
			else
				next_state <= wate;
			end if;
		when wate =>
			next_state2 <= state2;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= "000000";
			new_count <= (others =>'0');
			if regA_out = "00000" then
				next_state <= compare;
			else
				next_state <= wate;
			end if;
		when compare => 
			next_state2 <= state2;
			next_score <= score1;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			new_count <= count;
			if(notes_OUT = notesA_OUT) then
				next_state <= true;
			else
				next_state <= state;
			end if;
		when true =>
			next_state2 <= state2;
			new_count <= count;
			next_score <= std_logic_vector(unsigned(score1) + 1);
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			next_state <= compare;	
		end case;
	else
		case state2 is
		when reset =>
			next_state <= state;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= "000000";
			new_count <= (others => '0');
			if res='1' then
				next_state2 <= state2;
			else 
				next_state2 <= count1;
			end if;
		when count1 => 
			next_state <= state;
			next_score <= "000000";
			succesbit_bit <= '0';
			succesbit_pwm <= '0';
			new_count <= std_logic_vector(unsigned(count) + 1);
			if count = "10011000100101101000000000" then
				next_state2 <= duration;
			else
				next_state2 <= count1;
			end if;
		when compare =>
			next_state <= state;
			new_count<= (others => '0');
			next_score <= score1;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			if(notes_OUT = regA_out) then
				next_state2 <= true;
			elsif (notes_OUT /= regA_out) then
				next_state2 <= false;
			else
				next_state2 <= compare;
			end if;
		when true =>
			next_state <= state;
			new_count <= count;
			next_score <= std_logic_vector(unsigned(score1) + 1);
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			next_state2 <= wait1;
		when wait1 =>
			next_state <= state;
			next_score <= score1;
			succesbit_bit <= '0';
			succesbit_pwm <= '0';
			new_count <= (others =>'0');
			next_state2 <= wait2;
		when wait2 =>
			next_state <= state;
			next_score <= score1;
			succesbit_bit <= '0';
			succesbit_pwm <= '0';
			new_count <= (others =>'0');
			next_state2 <= duration;
		when duration =>
			next_state <= state;
			next_score <= score1;
			succesbit_bit <= '0';
			succesbit_pwm <= '0';
			new_count <= (others =>'0');
			if a = "01" then
				next_state2 <= short;
			elsif a = "10" then
				next_state2 <= medium;
			elsif a = "11" then
				next_state2 <= long;
			elsif a = "00" then
				next_state2 <= rest;
			else
				next_state2 <= compare;
			end if;
		when false =>
			next_state <= state;
			new_count <= count;
			next_score <= score1;
			succesbit_pwm <= '1';
			succesbit_bit <= '1'; 
			next_state2 <= wait1;
		when short => 
			next_state <= state;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			next_score <= score1;
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "00010011000100101101000000" then
				next_state2 <= compare;
			else
				next_state2 <= short;
			end if;
		when medium =>
			next_state <= state;
			next_score <= score1;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "00110101011001111110000000" then
				next_state2 <= compare;
			else
				next_state2 <= medium;
			end if;
		when long =>
			next_state <= state;
			next_score <= score1;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "01100011001011101010000000" then
				next_state2 <= compare;
			else
				next_state2 <= long;
			end if;	
		when rest =>
			next_state <= state;
			new_count<= (others => '0');
			next_score <= score1;
			succesbit_pwm <= '0';
			succesbit_bit <= '0'; 
			if regA_out = "00100" then
				next_state2 <= short;
			elsif regA_out = "01000" then
				next_state2 <= medium;
			elsif regA_out = "10000" then
				next_state2 <= long;
			else 
				next_state2 <= compare;
			end if;
		end case;
	end if;

a <= regA_OUT(1 downto 0);
score <= score1;
end process;
end architecture behavioural; 

