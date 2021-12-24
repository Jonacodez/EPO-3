library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity detect_input is
port(   
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	input_s : out std_logic  --knop ingedrukt?
     );
end entity;

architecture behaviour of detect_input is

begin
	process(KEY0,KEY1,KEY2,KEY3)
	begin
		if (KEY0 or KEY1 or KEY2 or KEY3) = '1' then
      input_s <= '0';
    else
      input_s <= '1';
    end if;
   end process;
   
end behaviour;
