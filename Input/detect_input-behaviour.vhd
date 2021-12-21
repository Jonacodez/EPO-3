library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of detect_input is

begin
	process(KEY0,KEY1,KEY2,KEY3)
	begin
		if (KEY0 or KEY1 or KEY2 or KEY3) = '1' then
      			input_d <= '0';
    		else
     			input_d <= '1';
  		 end if;
   end process;
   
end behaviour;

