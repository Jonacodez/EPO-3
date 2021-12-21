library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of top is

component detect_input port(   
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	input_d : out std_logic
     );
end component;

component pulse_length port(
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	clk         	: in  std_logic;
	reset        	: in  std_logic;
	pulse_len	: out std_logic_vector(2 downto 0));
end component;

component button port(
	KEY0 : in std_logic;
	KEY1 : in std_logic;
	KEY2 : in std_logic;
	KEY3 : in std_logic;
	SW0  : in std_logic;
	SW1  : in std_logic;
	notes_OUT : out std_logic_vector(4 downto 0));
end component;

signal input_s	:	std_logic;
signal pulse_len	:	std_logic_vector(2 downto 0);

begin

dec:detect_input port map(KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,input_d => input_s);
pl:pulse_length port map (KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,clk=>clk,reset=>reset,pulse_len=>pulse_len);
but:button port map(KEY0=>KEY0,KEY1=>KEY1,KEY2=>KEY2,KEY3=>KEY3,SW0=>SW0,SW1=>SW1,notes_OUT=>notes_OUT);

end behaviour;

