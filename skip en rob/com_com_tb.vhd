library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity com_com_tb is
end com_com_tb;

architecture com_behv of com_com_tb is

component com_com is
port	(ard_in	: in std_logic_vector(4 downto 0);
	confirm : in std_logic;
	mat_in  : in std_logic_vector(2 downto 0);
	succes	: in std_logic;
	clk	: in std_logic;
	reset	: in std_logic;
	end_bit : in std_logic;
	arr_out : out std_logic_vector(4 downto 0);
	song_sel : out std_logic_vector(2 downto 0);
	handshake : out std_logic;
	shift	: out std_logic);
end component;

component shift_reg is
port(	input:		in std_logic_vector(4 downto 0);
	clk:		in std_logic;
	shift:		in std_logic;
	reset:		in std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0);
	end_bit:	out std_logic
);
end component;

	signal ard_in	: std_logic_vector(4 downto 0);
	signal confirm	: std_logic;
	signal mat_in  	: std_logic_vector(2 downto 0);
	signal succes	: std_logic;
	signal clk	: std_logic;
	signal reset	: std_logic;
	signal end_bit  : std_logic;
	signal arr_out  : std_logic_vector(4 downto 0);
	signal song_sel : std_logic_vector(2 downto 0);
	signal handshake : std_logic;
	signal shift	: std_logic;

	signal output0, output1, output2, output3, output4, output5, output6, output7: std_logic_vector(4 downto 0);

begin
 	com: com_com port map(ard_in, confirm, mat_in, succes, clk, reset, end_bit, arr_out, song_sel, handshake, shift);
	reg: shift_reg port map(arr_out, clk, shift, reset, output0, output1, output2, output3, output4, output5, output6, output7, end_bit);

	clk <= '0' after 0 ns,
          '1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <= '1' after 0 ns, '0' after 50 ns;

	mat_in <= "010" after 0 ns,
		"110" after 3280 ns;

	ard_in <= "00001" after 253 ns,
		"00010" after 656 ns,
		"00011" after 1054 ns,
		"00100" after 1453 ns,
		"00101" after 1858 ns,
		"00110" after 2254 ns,
		"00111" after 2656 ns,
		"00000" after 3054 ns,
		"00001" after 3589 ns;

	confirm <= '0' after 0 ns,
		'1' after 253 ns,
		'0' after 656 ns,
		'1' after 1054 ns,
		'0' after 1453 ns,
		'1' after 1858 ns,
		'0' after 2254 ns,
		'1' after 2656 ns,
		'0' after 3054 ns,
		'1' after 3589 ns;
		

	succes <= '0' after 0 ns,
		'1' after 3200 ns,
		'0' after 3205 ns,
		'1' after 3300 ns,
		'0' after 3305 ns,
		'1' after 3400 ns,
		'0' after 3405 ns,
		'1' after 3500 ns,
		'0' after 3505 ns,
		'1' after 3600 ns,
		'0' after 3605 ns,
		'1' after 3700 ns,
		'0' after 3705 ns,
		'1' after 3800 ns,
		'0' after 3805 ns;
end com_behv;