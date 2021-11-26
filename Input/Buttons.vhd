library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buttons is
port(   
	button_c : in std_logic;
	button_d : in std_logic;
	button_e : in std_logic;
	button_f : in std_logic;
	button_g : in std_logic;
	button_a : in std_logic;
        button_b : in std_logic; 
	button_k : in std_logic;
	notes_OUT : out std_logic_vector(2 downto 0)
     );
end buttons;

architecture behaviour of buttons is


begin
	process(button_c,button_d,button_e,button_f,button_g,button_a,button_b,button_k)
	begin
		if button_c = '1' then
			notes_OUT <= "000";
		elsif button_d = '1' then
			notes_OUT <= "001";
		elsif button_e = '1' then
			notes_OUT <= "010";
		elsif button_f = '1' then
			notes_OUT <= "100";
		elsif button_g = '1' then
			notes_OUT <= "110";
		elsif button_a = '1' then
			notes_OUT <= "101";
		elsif button_b = '1' then
			notes_OUT <= "011";
		elsif button_k = '1' then
			notes_OUT <= "111";
		end if;
	end process;
end architecture;

				