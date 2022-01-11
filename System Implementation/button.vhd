library IEEE;
use IEEE.std_logic_1164.ALL;

entity button is
port(   
	clk	:	in std_logic;
	reset 	: in std_logic;
	pulse_len	: in std_logic_vector(2 downto 0);
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	song_select	:	out	std_logic_vector(2 downto 0);
	notes_OUT : out std_logic_vector(4 downto 0)
     );
end button;

