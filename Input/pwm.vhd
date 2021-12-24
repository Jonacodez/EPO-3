library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
entity pwm is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        detect_input : in  std_logic;
        notes_OUT    : in  std_logic_vector(4 downto 0);
        pwm_out          : out std_logic);
end pwm;

