library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioural of processor is 

type statetype is (reset, compare, true);
signal state, next_state : statetype;

begin 
process(clk, res) 
begin
	if rising_edge(clk) then
		if (res = '1')  then
			state <= reset;
		else
			state <= next_state;
		end if;
	end if;
end process; 

process(state, notes_OUT, notesA_OUT, res)
begin
	
	case state is
		when reset =>
			succesbit_pwm <= '0';
			succesbit_gpu <= '0';
			succesbit_bit <= '0'; 
			if res='1' then
				next_state <= state;
			else next_state <= compare;
			end if;
		when compare => 
			succesbit_pwm <= '0';
			succesbit_gpu <= '0';
			succesbit_bit <= '0'; 
			if(notes_OUT = notesA_OUT) then
				next_state <= true;
			else
				next_state <= state;
			end if;
		when true =>
			succesbit_pwm <= '1';
			succesbit_gpu <= '1';
			succesbit_bit <= '1'; 
			next_state <= compare;
end case;
end process;
end architecture behavioural; 

