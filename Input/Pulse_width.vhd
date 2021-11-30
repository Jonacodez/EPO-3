library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_length is
port (
	clk                  	: in  std_logic;
	reset                 	: in  std_logic;
	input_s			: in std_logic;
	pulse_len		: out std_logic_vector(2 downto 0));
end pulse_length;	

architecture behaviour of pulse_length is

signal count_lo              : unsigned(14 downto 0);
signal pulse                 : std_logic_vector(14 downto 0);

begin

	process(clk)
	begin	
		if(input_s='0') then
			count_lo <= count_lo + 1;
			pulse  <= std_logic_vector(count_lo);
		else
			count_lo <= (others=>'0');
  		end if;
end process;
process (clk)
begin
	if pulse >= "00100111101100" then
		pulse_len <= "001";
	elsif pulse >= "01001111011000" then
		pulse_len <= "010";
	elsif pulse >= "10011110110000" then
		pulse_len <= "100";
	end if;
end process;	
end behaviour;
