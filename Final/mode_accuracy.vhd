library IEEE;
use IEEE.std_logic_1164.ALL;

entity mode_accuracy is
   port(clk          : in  std_logic;
        res          : in  std_logic;
		notesA_OUT			: in	 std_logic_vector(4 downto 0);
        succes					 : out std_logic);
end mode_accuracy;

