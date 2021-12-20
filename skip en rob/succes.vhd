library IEEE;
use IEEE.std_logic_1164.ALL;

entity succes_com is
port(	clk		: in std_logic;
	reset		: in std_logic;
	input		: in std_logic;
	succes		: out std_logic);
end succes_com;

architecture behav of succes_com is
	type states is (res_state, check_state, wait_state);
	signal state, new_state	: states;
	signal new_succes : std_logic;

begin

process(clk, reset)
begin
	if clk'event and clk ='1' then
		if reset = '1' then
			state <= res_state;
			succes <= new_succes;
		else
			state <= new_state;
			succes <= new_succes;
		end if;
	end if;
end process;

process(clk, reset, input)
begin
	
		case state is

			when res_state =>
				new_succes <= '0';
				new_state <= check_state;

			when check_state =>
				if input = '1' then
					new_succes <= '1';
					new_state <= wait_state;
				else
					new_succes <= '0';
					new_state <= check_state;
				end if;

			when wait_state =>
				new_succes <= '0';
				if input = '1' then
					new_state <= wait_state;
				else
					new_state <= check_state;
				end if;

		end case;
	
end process;

end behav;