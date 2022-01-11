library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of chip_tb is
   component chip
   port(
   	clk								: in std_logic;
   	reset								: in std_logic;		
   	KEY0,KEY1,KEY2,KEY3,SW0,SW1	: in std_logic; 
   	input_arduino							: in std_logic_vector (4 downto 0);
   	input_confirm			: in std_logic;
   	output_buzzer			: out std_logic;
   	output_song_select		: out std_logic_vector (2 downto 0);
   	output_handshake		: out std_logic;
   	r, g, b				: out std_logic_vector (1 downto 0);  --output gpu
   	Hsync, Vsync			: out std_logic                       --output gpu
   	);
   end component;
   signal clk								: std_logic;
   signal reset								: std_logic;
   signal KEY0,KEY1,KEY2,KEY3,SW0,SW1	: std_logic;
   signal input_arduino							: std_logic_vector (4 downto 0);
   signal input_confirm			: std_logic;
   signal output_buzzer			: std_logic;
   signal output_song_select		: std_logic_vector (2 downto 0);
   signal output_handshake		: std_logic;
   signal r, g, b				: std_logic_vector (1 downto 0);
   signal Hsync, Vsync			: std_logic;
begin
   test: chip port map (clk, reset, KEY0,KEY1,KEY2,KEY3,SW0,SW1, input_arduino, input_confirm, output_buzzer, output_song_select, output_handshake, r, g, b, 	Hsync, Vsync);
   clk <= '0' after 0 ns,
          '1' after 5 ns when clk /= '1' else '0' after 5 ns;
   reset <= '1' after 0 ns,
            '0' after 60 ns;
   KEY0 <= '1' after 0 ns;
   KEY1 <= '1' after 0 ns,'0' after 1 ms, '1' after 5 ms;
   KEY2 <= '1' after 0 ns;
   KEY3 <= '1' after 0 ns;
   SW0 <= '0' after 0 ns;
   SW1 <= '0' after 0 ns;
	input_arduino <= "00000" after 0 ns,
			 "00001" after 253 ns,
			 "00010" after 656 ns,
			 "00011" after 1054 ns,
			 "00101" after 1453 ns,
			 "00110" after 1858 ns,
			 "00111" after 2254 ns,
			 "01001" after 2656 ns,
			 "00000" after 3054 ns;
			

	input_confirm <= '0' after 0 ns,    --new data
			 '1' after 253 ns,
			 '0' after 656 ns,
			 '1' after 1054 ns,
			 '0' after 1453 ns,
		 	 '1' after 1858 ns,
			 '0' after 2254 ns,
			 '1' after 2656 ns,
		 	 '0' after 3054 ns,
			 '1' after 3589 ns;
end behaviour;

