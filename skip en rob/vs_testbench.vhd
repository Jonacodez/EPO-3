library IEEE;
use IEEE.std_logic_1164.ALL;


entity vs_testbench is			-- entity declaration
end vs_testbench;

architecture tb of vs_testbench is
   component shift_reg
      port(input   : in  std_logic_vector(4 downto 0);
           clk     : in  std_logic;
           shift   : in  std_logic;
	   reset   : in  std_logic;
	   end_bit : out std_logic;
           output0 : out std_logic_vector(4 downto 0);
           output1 : out std_logic_vector(4 downto 0);
           output2 : out std_logic_vector(4 downto 0);
           output3 : out std_logic_vector(4 downto 0);
           output4 : out std_logic_vector(4 downto 0);
           output5 : out std_logic_vector(4 downto 0);
           output6 : out std_logic_vector(4 downto 0);
           output7 : out std_logic_vector(4 downto 0));
   end component;
   signal input   : std_logic_vector(4 downto 0);
   signal clk     : std_logic;
   signal shift   : std_logic;
   signal reset   : std_logic;
   signal end_bit : std_logic;
   signal output0 : std_logic_vector(4 downto 0);
   signal output1 : std_logic_vector(4 downto 0);
   signal output2 : std_logic_vector(4 downto 0);
   signal output3 : std_logic_vector(4 downto 0);
   signal output4 : std_logic_vector(4 downto 0);
   signal output5 : std_logic_vector(4 downto 0);
   signal output6 : std_logic_vector(4 downto 0);
   signal output7 : std_logic_vector(4 downto 0);
begin
   test: shift_reg port map (input, clk, shift, reset, end_bit, output0, output1, output2, output3, output4, output5, output6, output7);

	clk <= '0' after 0 ns,
          '1' after 5 ns when clk /= '1' else '0' after 5 ns;

	reset <= '1' after 0 ns, '0' after 30 ns;

	input <= "10101" after 20 ns,
	"01010" after 89 ns,
	"00000" after 134 ns;

   	shift <= '0' after 0 ns,
	'1' after 60 ns,
	'0' after 67 ns,
	'1' after 120 ns,
	'0' after 127 ns,
	'1' after 160 ns,
	'0' after 167 ns,
	'1' after 200 ns,
	'0' after 207 ns,
	'1' after 240 ns,
	'0' after 247 ns,
	'1' after 280 ns,
	'0' after 287 ns,
	'1' after 320 ns,
	'0' after 327 ns,
	'1' after 360 ns,
	'0' after 367 ns,
	'1' after 400 ns,
	'0' after 407 ns,
	'1' after 440 ns,
	'0' after 447 ns,
	'1' after 478 ns,
	'0' after 487 ns,
	'1' after 520 ns,
	'0' after 527 ns;

end tb;