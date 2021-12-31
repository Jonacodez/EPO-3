library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of detect_input is

begin
	process(KEY0,KEY1,KEY2,KEY3)
	begin
		if (KEY0 and KEY1 and KEY2 and KEY3) = '0' then
      			input_s <= '1';
    		else
     			input_s <= '0';
  		 end if;
   end process;
   
end behaviour;

