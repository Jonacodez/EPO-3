library IEEE;
use IEEE.std_logic_1164.ALL;

entity top is
port(
	clk   : in  std_logic;
	reset : in  std_logic;
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	notes_OUT : out std_logic_vector(4 downto 0)
);
end top;

