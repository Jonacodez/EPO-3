library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_tb is
end entity;

architecture tb of controller_tb is

component processor port (
	clk			: in std_logic;
	res			: in std_logic;
	notes_OUT		: in std_logic_vector(4 downto 0);	
	notesA_OUT		: in std_logic_vector(4 downto 0);
	succesbit_pwm		: out std_logic;
	succesbit_gpu		: out std_logic;
	succesbit_bitshifter	: out std_logic
	);
end component;

signal clock	: std_logic;
signal reset	: std_logic;
signal input	: std_logic_vector(4 downto 0);
signal inputA	: std_logic_vector (4 downto 0);
signal pwm	: std_logic;
signal gpu	: std_logic;
signal bits	: std_logic;

begin
	
u1: processor port map(clock,reset,input,inputA,pwm,gpu,bits);

	process
	begin
		clock <= '0';
        	wait for 20 ns;
        	clock <= '1';
        	wait for 20 ns;
   	 end process;
	  reset <= '1', '0' after 20 ns, '1' after 420 ns;	

	input <= 
	"00000" after 0 ns,
	"00001" after 21 ns, 
	"01111" after 120 ns,
	"10101" after 250 ns,
	"10001" after 350 ns,
	"01100" after 370 ns,
	"11111" after 420 ns;
	
	inputA <=
	"00000" after 0 ns,
	"00001" after 21 ns, 
	"01101" after 120 ns,
	"10101" after 250 ns,
	"10001" after 350 ns,
	"01100" after 370 ns,
	"11111" after 420 ns;
end tb;
