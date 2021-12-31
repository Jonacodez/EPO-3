library IEEE;
use IEEE.std_logic_1164.ALL;

entity pwm_gen is
port(clk        : in  std_logic;
		input_s			: in std_logic;
        reset      : in  std_logic;
        succes_bit : in  std_logic;
        notes_OUT  : in  std_logic_vector(4 downto 0);
        pwm_out  : out std_logic);
end pwm_gen;

