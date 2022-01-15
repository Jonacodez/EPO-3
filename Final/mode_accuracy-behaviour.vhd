library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of mode_accuracy is

type statetype is (reset, start,short,medium,long);
signal state, next_state : statetype;
signal count,new_count	: std_logic_vector(25 downto 0);
signal a : std_logic_vector(1 downto 0);

begin
process(clk,res)
begin
	if rising_edge(clk) then
		if (res = '1')  then
			state <= reset;
		else
			state <= next_state;
			count <= new_count;
		end if;
	end if;
end process;

process(state, count, res, notesA_OUT, a)
begin
case state is

		when reset =>
			succes <= '0';
			new_count <= (others => '0');
			a <= "00";
			if res='1' then
				next_state <= state;
			else 
				next_state <= start;
			end if;
		when start =>
			new_count <= (others => '0');
			succes <= '0';
			a <= notesA_OUT(1 downto 0);
			if a = "01" then
				next_state <= short;
			elsif a = "10" then
				next_state <= medium;
			elsif a = "11" then
				next_state <= long;
			else
				next_state <= start;
			end if;
		when short => 
			new_count <= std_logic_vector(unsigned(count) + 1);
			succes <= '0';
			a <= "00";
			if count = "00010011000100101101000000" then
				next_state <= start;
				succes <= '1';
			else
				next_state <= short;
			end if;
		when medium =>
			new_count <= std_logic_vector(unsigned(count) + 1);	
			succes <= '0';
			a <= "00";
			if count = "00110101011001111110000000" then
				next_state <= start;
				succes <= '1';
			else
				next_state <= medium;
			end if;
		when long =>
			new_count <= std_logic_vector(unsigned(count) + 1);	
			succes <= '0';
			a <= "00";
			if count = "01100011001011101010000000" then
				next_state <= start;
				succes <= '1';
			else
				next_state <= long;
			end if;	
	
end case;
end process;
end behaviour;

