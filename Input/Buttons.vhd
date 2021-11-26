library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buttons is
port(   
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	notes_OUT : out std_logic_vector(2 downto 0)
     );
end buttons;

architecture behaviour of buttons is


begin
	process(SW0)
	begin
		if SW0 = '0' then
			if KEY0 = '1' then
				notes_OUT <= "000";
			elsif KEY1 = '1' then
				notes_OUT <= "001";
			elsif KEY2 = '1' then
				notes_OUT <= "010";
			elsif KEY3 = '1' then
				notes_OUT <= "100";
			end if;
		elsif SW0 = '1' then
			if KEY0 = '1' then
				notes_OUT <= "110";
			elsif KEY1 = '1' then
				notes_OUT <= "101";
			elsif KEY2 = '1' then
				notes_OUT <= "011";
			elsif KEY3 = '1' then
				notes_OUT <= "111";
			end if;
		end if;
	end process;
end architecture;

				