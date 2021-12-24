library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpu_controller is
port( 
	clk			: in  std_logic;
	res			: in  std_logic;
	notes_OUT		: in  std_logic_vector(4 downto 0);	--alleen noten, niet lengte (note1 = "001--")
	notesA_OUT		: in  std_logic_vector(4 downto 0);
	succesbit_pwm		: out std_logic;
	succesbit_gpu		: out std_logic;
	succesbit_bitshifter	: out std_logic
);
end cpu_controller;



architecture behavioural of cpu_controller is 
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
			succesbit_bitshifter <= '0'; 
			if res='1' then
				next_state <= state;
			else next_state <= compare;
			end if;
		when compare => 
			succesbit_pwm <= '0';
			succesbit_gpu <= '0';
			succesbit_bitshifter <= '0'; 
			if(notes_OUT = notesA_OUT) then
				next_state <= true;
			else
				next_state <= state;
			end if;
		when true =>
			succesbit_pwm <= '1';
			succesbit_gpu <= '1';
			succesbit_bitshifter <= '1'; 
			next_state <= compare;
end case;
end process;
end architecture behavioural; 



		
			

