library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_width_tb is
end pulse_width_tb;

architecture tb of pulse_width_tb is

component pulse_length port (
	clk                  	: in  std_logic;
	reset                 	: in  std_logic;
	input_s			: in std_logic;
	pulse_len		: out std_logic_vector(2 downto 0));
end component;

signal clock	:std_logic;
signal rst	:std_logic;
signal input	:std_logic;
signal p_len	:std_logic_vector(2 downto 0);

begin

u1: pulse_length port map(clock,rst,input,p_len);

	process 
	begin
        	clock <= '0';
        	wait for 20 ns;
        	clock <= '1';
        	wait for 20 ns;
   	end process;

	rst <= '1', '0' after 20 ns;

	input <= 
	'1' after 0 ns,
	'0' after 100 ms,
	'1' after 1300 ms;
end tb;
