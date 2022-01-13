library ieee;
use ieee.std_logic_1164.all;

entity gpu_tb is
end gpu_tb;

architecture tb of gpu_tb is
	component gpu is 
		port(
		output0, output1, output2, output3, output4, output5, output6, output7	:	in std_logic_vector (4 downto 0);
		note_confirm								:	in std_logic;
		clk, reset								:	in std_logic;
		r, g, b									:	out std_logic_vector(1 DOWNTO 0);
		Hsync, Vsync								:	out std_logic
		);
	end component gpu;

signal output0, output1, output2, output3, output4, output5, output6, output7	:	std_logic_vector (4 downto 0);
signal clk, reset								:	std_logic;
signal r, g, b									:	std_logic_vector(1 downto 0);
signal Hsync, Vsync								:	std_logic;
signal sec									:	integer;
signal note_confirm								:	std_logic;

begin

	clk 		<= 	'0' after 0 ns,
				'1' after 20 ns when clk /= '1' else '0' after 20 ns;


	output7		<=	"00000" after 0 ns, "00001" after 10 ms, "00111" after 20 ms;
	note_confirm	<= 	'0' after 0 ns,
--				'1' after 9999960 ns,
--				'0' after 10000000 ns,
--				'1' after 19999960 ns,
--				'0' after 20000000 ns;		
				'1' after 10000000 ns,
				'0' after 10000040 ns,
				'1' after 20000000 ns,
				'0' after 20000040 ns;


	reset 		<= 	'1' after 0 ns, '0' after 3 ms;

label1: gpu port map(
	output0 => output0,
	output1 => output1,
	output2 => output2,
	output3 => output3,
	output4 => output4,
	output5 => output5,
	output6 => output6,
	output7 => output7,
	note_confirm => note_confirm,
	clk => clk,
	reset => reset,
	r => r,
	g => g,
	b => b,
	Hsync => Hsync,
	Vsync => Vsync
	);

end architecture tb;