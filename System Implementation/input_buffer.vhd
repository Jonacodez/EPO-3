library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_buffer is
port (d0, d1, d2, d3, d4, clk, reset: in std_logic; q0, q1, q2, q3, q4 : out std_logic);
end input_buffer;

