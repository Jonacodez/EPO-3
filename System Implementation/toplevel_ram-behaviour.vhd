library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplevel_ram is
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

component shift_reg_2 is
port(	input0, input1, input2, input3, input4, input5, input6, input7:	in std_logic_vector(4 downto 0);
	clk:			in std_logic;
	succes:			in std_logic;
	succes_count:		in std_logic;
	reset:			in std_logic;
	output: 		out std_logic_vector(4 downto 0)
);
end component;

	signal end_bit  : std_logic;
	signal arr_out  : std_logic_vector(4 downto 0);
	signal shift_s: std_logic;
	signal shift_s_d: std_logic;
	signal s0, s1, s2, s3, s4, s5, s6, s7: std_logic_vector(4 downto 0);

begin
 	com: com_com port map(ard_in, confirm, mat_in, succes, clk, reset, end_bit, arr_out, song_sel, handshake, shift_s);
	reg: shift_reg port map(arr_out, clk, shift_s, reset, s0, s1, s2, s3, s4, s5, s6, s7, end_bit);
	reg2: shift_reg_2 port map(s0, s1, s2, s3, s4, s5, s6, s7, clk, reg_2_succes, shift_s, reset, reg_2_out);

output0 <= s0;
output1 <= s1;
output2 <= s2;
output3 <= s3;
output4 <= s4;
output5 <= s5;
output6 <= s6;
output7 <= s7;
shift <= shift_s;

--process(clk, shift_s)
--begin
--if rising_edge(clk) then
--	shift_s_d <= shift_s;
--end if;
--end process;
--
-- if this is chosen do update shift <= shift_s_d; and in the reg2 port map.

end behaviour;
