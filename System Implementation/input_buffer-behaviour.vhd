library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
begin
ff_behavior : process(clk) is
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				q0 <= '0';
				q1 <= '0';
				q2 <= '0';
				q3 <= '0';
				q4 <= '0';
			else
				q0 <= d0;
				q1 <= d1;
				q2 <= d2;
				q3 <= d3;
				q4 <= d4;
			end if;
		end if;
	end process;
end behaviour;

