library IEEE;
use IEEE.std_logic_1164.ALL;

entity chip is
port(
	clk								: in std_logic;
	reset								: in std_logic;		
	input1, input2, input3, input4, input5, input6, input7, input8	: in std_logic; 
	input_arduino							: in std_logic_vector (4 downto 0);
	input_confirm			: in std_logic;
	output_buzzer			: out std_logic;
	output_song_select		: out std_logic_vector (2 downto 0);
	output_handshake		: out std_logic;
	r, g, b				: out std_logic_vector (1 downto 0);  --output gpu
	Hsync, Vsync			: out std_logic                       --output gpu
	);
end chip;

