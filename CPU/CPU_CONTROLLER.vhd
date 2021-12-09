library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processor is
port( 
	clk			: in std_logic;
	res			: in std_logic;
	notes_OUT		: in std_logic;	
	notesA_OUT		: in std_logic;
	succesbit_pwm		: out std_logic;
	succesbit_gpu		: out std_logic;
	succesbit_bitshifter	: out std_logic
);
end processor;

architecture behavioural of processor is 
type statetype is ( reset, true, false);
signal state, next_state : statetype;

begin 
process(clk) 
begin 
	if (clk'event and clk = '1') then
		if (res = '1')  then
			state <= reset;
		else
			state <= next_state;
		end if;
	end if;
end process; 

process(state)
begin
	case state is
		when reset => 
			if( notes_OUT = notesA_OUT) then
				next_state <= true;
			else 
				next_state <= false;
			end if;

		when true =>
			succesbit_pwm <= '1';
			succesbit_gpu <= '1';
			succesbit_bitshifter <= '1'; 
		when false =>
			succesbit_gpu <= '0';
			next_state <= reset;
end case;
end process;
end architecture behavioural; 


		


		
			

