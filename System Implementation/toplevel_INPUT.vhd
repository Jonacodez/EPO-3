library IEEE;
use IEEE.std_logic_1164.ALL;

entity toplevel_INPUT is
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
end toplevel_INPUT;


architecture behaviour of toplevel_INPUT is
--
--component detect_input port(   
--	KEY0 : in std_logic;
--	KEY1 : in std_logic;
--	KEY2 : in std_logic;
--	KEY3 : in std_logic;
--	input_s : out std_logic
--     );
--end component detect_input;

--component pulse_length port(
--	clk         	: in  std_logic;
--	reset        	: in  std_logic;
--	pulse_len	: out std_logic_vector(2 downto 0));
--end component pulse_length;

component button port(
	clk  : in std_logic;
	reset : in std_logic;
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	notes_OUT : out std_logic_vector(4 downto 0));
end component button;

signal input_s	:	std_logic;
signal pulse_len	:	std_logic_vector(2 downto 0);

begin

--dec:detect_input port map(KEY0,KEY1,KEY2,KEY3,input_s);
--pulse:pulse_length port map (clk,reset,pulse_len);
but:button port map(clk, reset, KEY0,KEY1,KEY2,KEY3,SW0,SW1,notes_OUT);

end behaviour;

