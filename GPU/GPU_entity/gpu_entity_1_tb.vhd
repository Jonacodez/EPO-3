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
		Hactive, Vactive	:	out std_logic
		);
	end component gpu;

signal data_in		:	std_logic_vector(4 downto 0);
signal clk, reset	:	std_logic;
signal r, g, b		:	std_logic;
signal Hactive, Vactive	:	std_logic;

begin

	clk <= '0' after 0 ns,
	'1' after 20 ns when clk /= '1' else '0' after 20 ns;
	data_in <= "00000";

label1: gpu port map(
	data_in => data_in,
	clk => clk,
	reset => reset,
	r => r,
	g => g,
	b => b,
	Hactive => Hactive,
	Vactive => Vactive
	);

end architecture tb;
