library ieee;
use ieee.std_logic_1164.all;

entity gpu_tb is
end gpu_tb;

architecture tb of gpu_tb is
	component gpu is 
		port(
		data_in			:	in std_logic_vector(4 downto 0);
		clk, reset		:	in std_logic;
		r, g, b			:	out std_logic;
		Hsync, Vsync		:	out std_logic
		);
	end component gpu;

signal data_in		:	std_logic_vector(4 downto 0);
signal clk, reset	:	std_logic;
signal r, g, b		:	std_logic;
signal Hsync, Vsync	:	std_logic;

begin

	clk <= '0' after 0 ns,
	'1' after 20 ns when clk /= '1' else '0' after 20 ns;
	data_in 	<= 	"000--" after 0 ns, 
				"001--" after 50 ms,
				"010--" after 100 ms, 
				"011--" after 150 ms,
				"100--" after 200 ms, 
				"101--" after 250 ms,
				"110--" after 300 ms, 
				"111--" after 350 ms;
				
	reset <= '1' after 0 ns, '0' after 3 ms;

label1: gpu port map(
	data_in => data_in,
	clk => clk,
	reset => reset,
	r => r,
	g => g,
	b => b,
	Hsync => Hsync,
	Vsync => Vsync
	);

end architecture tb;
