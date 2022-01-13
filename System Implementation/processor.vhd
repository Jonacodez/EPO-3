library IEEE;
use IEEE.std_logic_1164.ALL;

entity processor is
   port(clk           : in  std_logic;
        res           : in  std_logic;
		mode			  :	in	std_logic;
        notes_OUT     : in  std_logic_vector(4 downto 0);
        notesA_OUT    : in  std_logic_vector(4 downto 0);
        succesbit_pwm : out std_logic;
        succesbit_bit : out std_logic;
		score			  : out	std_logic_vector(1 downto 0));
end processor;

