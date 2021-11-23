library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity counter is
	port (	clk : in std_logic;
		reset : in std_logic;
		enable : in std_logic;
		count_out : out std_logic_vector(3 downto 0)
);
end counter;
architecture behavioral of counter is
signal count, new_count : unsigned (3 downto 0);
begin
process (clk)
begin
	if (rising_edge (clk)) then
		if (reset = '1') then
			count <= (others => '0');
		else
			count <= new_count;
		end if;
	end if;
end process;
process (count, enable)
begin
	if (enable = '1') then
		new_count <= count + 1;
	else
		new_count <= count;
	end if;
end process;
count_out <= std_logic_vector (count);
end architecture behavioral;
