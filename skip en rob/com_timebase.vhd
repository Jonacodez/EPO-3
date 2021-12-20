library IEEE;
use IEEE.std_logic_1164.ALL;

entity com_timebase is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        clk2  : out std_logic);
end com_timebase;

