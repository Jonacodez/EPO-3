library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of pulse_length is

component pulse_length port (
	clk                  	: in  std_logic;
	reset                 	: in  std_logic;
	input_s			: in std_logic;
	pulse_len		: out std_logic_vector(2 downto 0));
end component;

signal count, new_count             : std_logic_vector(14 downto 0);
signal pulse                 : std_logic_vector(14 downto 0);

begin

	process(clk)
	begin	
		if rising_edge(clk) then
			if reset = '1' then
				count <= (others => '0');
				pulse <= (others => '0');
				pulse_len <= "000";
			elsif input_s= '0' then
				pulse_len <= "000";
				count <= new_count;
				pulse <= (others => '0');
			elsif input_s = '1' then
				count <= pulse;
				if rising_edge (clk) then
					count <= (others => '0');
				end if;
			end if;
		end if;
end process;
 process (count)
    begin
        new_count <= std_logic_vector(unsigned(count) +1);
    end process;
process (clk)
begin
	if rising_edge(clk) then
		if pulse >= "00100111101100" then
			pulse_len <= "001";
		elsif pulse >= "01001111011000" then
			pulse_len <= "010";
		elsif pulse >= "10011110110000" then
			pulse_len <= "100";
		else
			pulse_len <= "000";
		end if;
	end if;
end process;	
end behaviour;
