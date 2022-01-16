library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of mode_accuracy is

type statetype is (reset, start,short,medium,long,wait1,wait2);
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
a <= notesA_OUT(1 downto 0);
case state is
		
		when reset =>
			succes <= '0';
			new_count <= (others => '0');
			if res='1' then
				next_state <= state;
			else 
				next_state <= start;
			end if;
		when start =>
			new_count <= (others => '0');
			succes <= '0';
			if a = "01" then
				next_state <= short;
			elsif a = "10" then
				next_state <= medium;
			elsif a = "11" then
				next_state <= long;
			else
				next_state <= start;
			end if;
		when wait1 =>
			succes <= '0';
			new_count <= (others => '0');
			next_state <= wait2;
		when wait2 =>
			succes <= '0';
			new_count <= (others => '0');
			next_state <= start;
		when short => 
			new_count <= std_logic_vector(unsigned(count) + 1);
			if count = "00010011000100101101000000" then
				next_state <= wait1;
				succes <= '1';
			else
				next_state <= short;
				succes <= '0';
			end if;
		when medium =>
			new_count <= std_logic_vector(unsigned(count) + 1);	
			if count = "00110101011001111110000000" then
				next_state <= wait1;
				succes <= '1';
			else
				next_state <= medium;
				succes <= '0';
			end if;
		when long =>
			new_count <= std_logic_vector(unsigned(count) + 1);
			if count = "01100011001011101010000000" then
				next_state <= wait1;
				succes <= '1';
			else
				next_state <= long;
				succes <= '0';
			end if;	
	
end case;
end process;
end behaviour;

