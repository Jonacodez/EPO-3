library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of total_tb is
   component total
   port(ard_in	: in std_logic_vector(4 downto 0);
   confirm : in std_logic;
   mat_in  : in std_logic_vector(2 downto 0);
   succes	: in std_logic;
   clk	: in std_logic;
   reset	: in std_logic;
   song_sel : out std_logic_vector(2 downto 0);
   handshake : out std_logic;
   output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0));
   end component;
   signal ard_in	: std_logic_vector(4 downto 0);
   signal confirm : std_logic;
   signal mat_in  : std_logic_vector(2 downto 0);
   signal succes	: std_logic;
   signal clk	: std_logic;
   signal reset	: std_logic;
   signal song_sel : std_logic_vector(2 downto 0);
   signal handshake : std_logic;
   signal output0, output1, output2, output3, output4, output5, output6, output7: std_logic_vector(4 downto 0);
begin
   test: total port map (ard_in, confirm, mat_in, succes, clk, reset, song_sel, handshake, output0, output1, output2, output3, output4, output5, output6, output7);
   	clk <= '0' after 0 ns,
          '1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <= '1' after 0 ns, '0' after 60 ns;

	mat_in <= "010" after 0 ns,
		"110" after 3280 ns;

	ard_in <= "00000" after 0 ns,
		"00001" after 253 ns,
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
		'1' after 3196 ns,
		'0' after 3205 ns,
		'1' after 3296 ns,
		'0' after 3305 ns,
		'1' after 3395 ns,
		'0' after 3406 ns,
		'1' after 3495 ns,
		'0' after 3505 ns,
		'1' after 3596 ns,
		'0' after 3605 ns,
		'1' after 3695 ns,
		'0' after 3705 ns,
		'1' after 3796 ns,
		'0' after 3805 ns;
end behaviour;

