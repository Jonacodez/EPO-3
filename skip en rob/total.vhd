library IEEE;
use IEEE.std_logic_1164.ALL;

entity total is
port(ard_in	: in std_logic_vector(4 downto 0);
confirm : in std_logic;
mat_in  : in std_logic_vector(2 downto 0);
succes	: in std_logic;
clk	: in std_logic;
reset	: in std_logic;
song_sel : out std_logic_vector(2 downto 0);
handshake : out std_logic;
output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0));
end total;

