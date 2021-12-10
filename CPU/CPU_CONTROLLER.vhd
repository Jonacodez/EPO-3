library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processor is
port( 
	clk			: in std_logic;
	res			: in std_logic;
	notes_OUT		: in std_logic_vector(4 downto 0);	
	notesA_OUT		: in std_logic_vector(4 downto 0);
	succesbit_pwm		: out std_logic;
	succesbit_gpu		: out std_logic;
	succesbit_bitshifter	: out std_logic
);
end processor;

architecture behavioural of processor is 
type statetype is ( compare, true, false, reset, stop);
signal state, next_state : statetype;

begin 
process(clk) 
begin
	if (res = '1')  then
		state <= reset;
	elsif rising_edge(clk) then
		state <= next_state;
	end if;
end process; 

process(state)
begin
	
	case state is
		when reset =>
			if res='1' then
				succesbit_pwm <= '0';
				succesbit_gpu <= '0';
				succesbit_bitshifter <= '0'; 
				next_state <= stop;
			end if;
		when compare => 
			succesbit_pwm <= '0';
			succesbit_gpu <= '0';
			succesbit_bitshifter <= '0'; 
			if( notes_OUT = notesA_OUT) then
				next_state <= true;
			elsif notes_OUT /= notesA_OUT then
				next_state <= false;
			else
				next_state <= state;
			end if;

		when true =>
			succesbit_pwm <= '1';
			succesbit_gpu <= '1';
			succesbit_bitshifter <= '1'; 
			next_state <= compare;
		when false =>
			succesbit_gpu <= '0';
			succesbit_pwm <= '1';
			succesbit_bitshifter <= '0';
			next_state <= compare;
		when stop =>
			succesbit_pwm <= '0';
			succesbit_gpu <= '0';
			succesbit_bitshifter <= '0'; 
			if res ='0' then
				next_state <= compare;
			else
				next_state <= stop;
			end if;
		
end case;
end process;
end architecture behavioural; 



		
			

