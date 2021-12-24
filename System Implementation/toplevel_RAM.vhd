library IEEE;
use IEEE.std_logic_1164.ALL;

entity toplevel_RAM is
port(ard_in	: in std_logic_vector(4 downto 0);
	confirm : in std_logic;
	mat_in  : in std_logic_vector(2 downto 0);
	succes	: in std_logic;
	clk	: in std_logic;
	reset	: in std_logic;
	song_sel : out std_logic_vector(2 downto 0);
	handshake : out std_logic;
	output0, output1, output2, output3, output4, output5, output6, output7: out std_logic_vector(4 downto 0));
end toplevel_RAM;

architecture behaviour of toplevel_RAM is
   component com_com
      port(ard_in	: in std_logic_vector(4 downto 0);
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
	output0, output1, output2, output3, output4, output5, output6, output7: 		out std_logic_vector(4 downto 0);
	end_bit:	out std_logic
);
end component;

	signal end_bit  : std_logic;
	signal arr_out  : std_logic_vector(4 downto 0);
	signal shift	: std_logic;

begin
 	com: com_com port map(ard_in, confirm, mat_in, succes, clk, reset, end_bit, arr_out, song_sel, handshake, shift);
	reg: shift_reg port map(arr_out, clk, shift, reset, output0, output1, output2, output3, output4, output5, output6, output7, end_bit);

end behaviour;

